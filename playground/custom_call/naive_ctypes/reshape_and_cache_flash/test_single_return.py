#!/usr/bin/env python3
"""Test with single tensor return to avoid XLA Dynamo issue."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library

# Create library
xla_cache_lib = Library("xla_single", "FRAGMENT")

def setup_custom_call():
    """Compile and register the custom call."""
    if not os.path.exists("reshape_and_cache_flash_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_reshape_and_cache.sh") != 0:
            raise RuntimeError("Compilation failed")
    
    lib = ctypes.CDLL("./reshape_and_cache_flash_xla.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_reshape_and_cache_flash",
        capsule,
        "CUDA"
    )
    print("✓ Custom call registered")


def single_cache_update_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
) -> torch.Tensor:
    """Implementation that returns a single dummy tensor."""
    # Extract dimensions
    num_tokens = key.shape[0]
    num_kv_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        0,  # kv_cache_dtype = auto
        0,  # has_k_scale
        0   # has_v_scale
    )
    
    # Prepare buffers
    buffers = [key, value, key_cache, value_cache, slot_mapping]
    buffers.extend([key_cache, value_cache])  # outputs
    
    # Call XLA custom op
    _ = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect
        descriptor,
        1,  # api_version
        {}
    )
    
    # Return a single dummy tensor (caches are modified in-place)
    # We return a scalar to avoid issues
    return torch.tensor(1.0, device=key.device)


# Define op with single return
xla_cache_lib.define(
    "single_cache_op(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping) -> Tensor"
)

# Implementation
xla_cache_lib.impl("single_cache_op", single_cache_update_impl, "XLA")

# Fake implementation
def single_cache_fake(key, value, key_cache, value_cache, slot_mapping):
    return torch.tensor(1.0)

xla_cache_lib._register_fake("single_cache_op", single_cache_fake)


def test_torch_compile():
    """Test with single return value."""
    print("\n" + "="*60)
    print("Testing torch.compile with single return")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        # Mark as buffer donors
        if hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
            torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
            torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
        
        # Call op - returns dummy scalar
        dummy = torch.ops.xla_single.single_cache_op(
            key, value, key_cache, value_cache, slot_mapping
        )
        
        # Return something based on the modified caches
        return key_cache.abs().mean() + value_cache.abs().mean() + dummy
    
    # Test
    key = torch.randn(1, 1, 1, device=device).contiguous()
    value = torch.randn(1, 1, 1, device=device).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before:")
    print(f"  key: {key.item():.4f}")
    print(f"  value: {value.item():.4f}")
    print(f"  key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.4f}")
    
    try:
        result = compiled_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        xm.wait_device_ops()
        
        print(f"\nAfter:")
        print(f"  key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.4f}")
        print(f"  value_cache[0,0,0,0]: {value_cache[0,0,0,0].item():.4f}")
        print(f"  Result: {result.item():.4f}")
        
        if key_cache[0,0,0,0].item() != 0:
            print("\n✓ Caches were modified successfully")
        else:
            print("\n✗ Caches were not modified")
            
    except Exception as e:
        print(f"\n✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    setup_custom_call()
    test_torch_compile()
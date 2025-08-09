#!/usr/bin/env python3
"""Workaround for torch.compile issue - avoid using custom op return values."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library

# Create library for our custom ops
xla_cache_lib = Library("xla_cache_void", "FRAGMENT")

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


def reshape_cache_void_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """Implementation that modifies in-place and returns nothing."""
    # Extract dimensions
    num_tokens = key.shape[0]
    num_kv_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]
    
    # Map dtype
    dtype_map = {"auto": 0, "float32": 0, "float16": 1, "bfloat16": 2}
    kv_cache_dtype_int = dtype_map.get(kv_cache_dtype, 0)
    
    # Check scales
    has_k_scale = k_scale is not None
    has_v_scale = v_scale is not None
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        kv_cache_dtype_int,
        1 if has_k_scale else 0,
        1 if has_v_scale else 0
    )
    
    # Prepare buffers
    buffers = [key, value, key_cache, value_cache, slot_mapping]
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    # Still need to add output buffers for XLA custom call
    buffers.extend([key_cache, value_cache])
    
    # Call XLA custom op - ignore the return values
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
    # Don't return anything - the caches are modified in-place


# Define the operation that returns nothing
xla_cache_lib.define(
    "reshape_cache_void_op(Tensor key, Tensor value, Tensor(a!) key_cache, "
    "Tensor(b!) value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> ()"
)

# Implementation for XLA
xla_cache_lib.impl("reshape_cache_void_op", reshape_cache_void_impl, "XLA")

# Fake implementation
def reshape_cache_void_fake(key, value, key_cache, value_cache, slot_mapping,
                           kv_cache_dtype, k_scale, v_scale):
    return None

xla_cache_lib._register_fake("reshape_cache_void_op", reshape_cache_void_fake)


def test_direct():
    """Test direct call without torch.compile."""
    print("\n" + "="*60)
    print("Testing direct call (void op)")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.tensor([[[0.5]]], device=device, dtype=torch.float32).contiguous()
    value = torch.tensor([[[0.7]]], device=device, dtype=torch.float32).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before: key_cache[0,0,0,0]={key_cache[0,0,0,0].item():.4f}")
    
    # Call void op - modifies in-place
    torch.ops.xla_cache_void.reshape_cache_void_op(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"After: key_cache[0,0,0,0]={key_cache[0,0,0,0].item():.4f}")
    
    if key_cache[0,0,0,0].item() > 0:
        print("✓ Direct call succeeded")
    else:
        print("✗ Direct call failed")


def test_torch_compile():
    """Test torch.compile with void approach."""
    print("\n" + "="*60)
    print("Testing torch.compile (void op)")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        # Mark as buffer donors if supported
        if hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
            torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
            torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
        
        # Call void op - modifies caches in-place, returns nothing
        torch.ops.xla_cache_void.reshape_cache_void_op(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
        
        # Return a scalar computed from the modified caches
        return key_cache.abs().mean() + value_cache.abs().mean()
    
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
        
        if result.item() > 0:
            print("\n✓ Caches were modified successfully")
        else:
            print("\n✗ Caches were not modified")
            
    except Exception as e:
        print(f"\n✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    setup_custom_call()
    test_direct()
    test_torch_compile()
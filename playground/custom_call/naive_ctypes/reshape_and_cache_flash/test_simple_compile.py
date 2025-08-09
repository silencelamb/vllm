#!/usr/bin/env python3
"""Simplified test to debug torch.compile issue."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library

# Create library for our custom ops
xla_cache_lib = Library("xla_cache_simple", "FRAGMENT")

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


def simple_reshape_and_cache_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Simplified implementation for testing."""
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
        0,  # has_k_scale = False
        0   # has_v_scale = False
    )
    
    # Prepare buffers
    buffers = [key, value, key_cache, value_cache, slot_mapping]  # inputs
    buffers.extend([key_cache, value_cache])  # outputs (same for in-place)
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect
        descriptor,
        1,  # api_version
        {}
    )
    
    # Return the modified caches (workaround for XLA GPU)
    return key_cache, value_cache


# Define the operation
xla_cache_lib.define(
    "simple_cache_op(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping) -> (Tensor, Tensor)"
)

# Implementation for XLA
xla_cache_lib.impl("simple_cache_op", simple_reshape_and_cache_impl, "XLA")

# Fake implementation for meta tensors
def simple_cache_op_fake(key, value, key_cache, value_cache, slot_mapping):
    return key_cache.clone(), value_cache.clone()

xla_cache_lib._register_fake("simple_cache_op", simple_cache_op_fake)


def test_direct():
    """Test direct call without torch.compile."""
    print("\n" + "="*60)
    print("Testing direct call")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.tensor([[[0.5]]], device=device, dtype=torch.float32).contiguous()
    value = torch.tensor([[[0.7]]], device=device, dtype=torch.float32).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before: key_cache={key_cache.flatten()[:2]}")
    
    # Direct call
    new_key, new_value = torch.ops.xla_cache_simple.simple_cache_op(
        key, value, key_cache, value_cache, slot_mapping
    )
    
    # In-place copy
    key_cache.copy_(new_key)
    value_cache.copy_(new_value)
    
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"After: key_cache={key_cache.flatten()[:2]}")
    
    if (key_cache != 0).any():
        print("✓ Direct call succeeded")
    else:
        print("✗ Direct call failed")


def test_compile():
    """Test with torch.compile."""
    print("\n" + "="*60)
    print("Testing torch.compile")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_fn(key, value, key_cache, value_cache, slot_mapping):
        # Call custom op
        new_key, new_value = torch.ops.xla_cache_simple.simple_cache_op(
            key, value, key_cache, value_cache, slot_mapping
        )
        # In-place copy
        key_cache.copy_(new_key)
        value_cache.copy_(new_value)
        # Return something to avoid empty graph
        return key_cache.sum() + value_cache.sum()
    
    key = torch.tensor([[[0.5]]], device=device, dtype=torch.float32).contiguous()
    value = torch.tensor([[[0.7]]], device=device, dtype=torch.float32).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before: key_cache={key_cache.flatten()[:2]}")
    
    try:
        result = compiled_fn(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        xm.wait_device_ops()
        
        print(f"After: key_cache={key_cache.flatten()[:2]}")
        print(f"Result: {result.item():.4f}")
        
        if result.item() > 0:
            print("✓ torch.compile succeeded")
        else:
            print("✗ torch.compile failed - no values written")
    except Exception as e:
        print(f"✗ torch.compile failed with error: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    setup_custom_call()
    test_direct()
    test_compile()
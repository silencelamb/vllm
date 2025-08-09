#!/usr/bin/env python3
"""Test with combined KV cache like TPU."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library

# Create library for our custom ops
xla_cache_lib = Library("xla_kv_combined", "FRAGMENT")

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


def kv_cache_update_impl(
    kv: torch.Tensor,  # Combined key-value tensor
    slot_mapping: torch.Tensor,
    kv_cache: torch.Tensor,  # Combined cache
) -> torch.Tensor:
    """Implementation with combined KV like TPU."""
    # Extract dimensions
    num_tokens = kv.shape[0]
    num_combined_kv_heads = kv.shape[1]  # num_kv_heads * 2
    head_size = kv.shape[2]
    
    # Split kv into key and value
    num_kv_heads = num_combined_kv_heads // 2
    key = kv[:, :num_kv_heads, :].contiguous()
    value = kv[:, num_kv_heads:, :].contiguous()
    
    # Split kv_cache
    num_blocks = kv_cache.shape[0]
    block_size = kv_cache.shape[1]
    key_cache = kv_cache[:, :, :num_kv_heads, :].contiguous()
    value_cache = kv_cache[:, :, num_kv_heads:, :].contiguous()
    
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
    
    # Call XLA custom op with separate caches
    buffers = [key, value, key_cache, value_cache, slot_mapping]
    buffers.extend([key_cache, value_cache])  # outputs
    
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
    
    # Return the combined cache (which has been modified in-place)
    return kv_cache


# Define the operation like TPU
xla_cache_lib.define(
    "kv_cache_update_op(Tensor kv, Tensor slot_mapping, Tensor kv_cache) -> Tensor"
)

# Implementation for XLA
xla_cache_lib.impl("kv_cache_update_op", kv_cache_update_impl, "XLA")

# Fake implementation
def kv_cache_update_fake(kv, slot_mapping, kv_cache):
    return kv_cache.clone()

xla_cache_lib._register_fake("kv_cache_update_op", kv_cache_update_fake)


def test_direct():
    """Test direct call without torch.compile."""
    print("\n" + "="*60)
    print("Testing direct call (combined KV)")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create test data
    num_tokens = 1
    num_kv_heads = 1
    head_size = 1
    num_blocks = 1
    block_size = 2
    
    key = torch.tensor([[[0.5]]], device=device, dtype=torch.float32)
    value = torch.tensor([[[0.7]]], device=device, dtype=torch.float32)
    
    # Combine key and value like TPU
    kv = torch.cat([key, value], dim=1)  # [1, 2, 1]
    
    # Create combined cache
    kv_cache = torch.zeros(num_blocks, block_size, num_kv_heads * 2, head_size, 
                          device=device, dtype=torch.float32).contiguous()
    
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before: kv_cache[0,0,:,0]={kv_cache[0,0,:,0]}")
    
    # Call op
    torch.ops.xla.dynamo_set_buffer_donor_(kv_cache, True)
    new_kv_cache = torch.ops.xla_kv_combined.kv_cache_update_op(
        kv, slot_mapping, kv_cache
    )
    kv_cache.copy_(new_kv_cache)
    
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"After: kv_cache[0,0,:,0]={kv_cache[0,0,:,0]}")
    
    if (kv_cache != 0).any():
        print("✓ Direct call succeeded")
    else:
        print("✗ Direct call failed")


def test_torch_compile():
    """Test with torch.compile (TPU style)."""
    print("\n" + "="*60)
    print("Testing torch.compile (combined KV)")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, kv_cache, slot_mapping):
        # Combine key and value
        kv = torch.cat([key, value], dim=1)
        
        # Mark as buffer donor
        torch.ops.xla.dynamo_set_buffer_donor_(kv_cache, True)
        
        # Flatten first two dims (like TPU)
        kv_cache_flat = kv_cache.flatten(0, 1)
        
        # Call op
        new_kv_cache = torch.ops.xla_kv_combined.kv_cache_update_op(
            kv, slot_mapping, kv_cache_flat
        )
        
        # Copy back
        kv_cache_flat.copy_(new_kv_cache)
        
        # Return a scalar
        return kv_cache.abs().mean()
    
    # Test
    num_kv_heads = 1
    head_size = 1
    
    key = torch.randn(1, num_kv_heads, head_size, device=device).contiguous()
    value = torch.randn(1, num_kv_heads, head_size, device=device).contiguous()
    kv_cache = torch.zeros(1, 2, num_kv_heads * 2, head_size, device=device).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before:")
    print(f"  key: {key[0,0,0].item():.4f}")
    print(f"  value: {value[0,0,0].item():.4f}")
    print(f"  kv_cache[0,0,0,0]: {kv_cache[0,0,0,0].item():.4f}")
    print(f"  kv_cache[0,0,1,0]: {kv_cache[0,0,1,0].item():.4f}")
    
    try:
        result = compiled_update(key, value, kv_cache, slot_mapping)
        xm.mark_step()
        xm.wait_device_ops()
        
        print(f"\nAfter:")
        print(f"  kv_cache[0,0,0,0] (key): {kv_cache[0,0,0,0].item():.4f}")
        print(f"  kv_cache[0,0,1,0] (value): {kv_cache[0,0,1,0].item():.4f}")
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
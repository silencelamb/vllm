#!/usr/bin/env python3
"""Test torch.compile with in-place operations - fixing alias annotation issues."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library
from functools import wraps


# Create a custom library for our ops
reshape_cache_lib = Library("reshape_cache", "FRAGMENT")


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


def xla_reshape_and_cache_flash_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """Implementation that calls XLA custom call with in-place updates."""
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
    buffers = [key_cache, value_cache, key, value, slot_mapping]
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        False,
        descriptor,
        2,
        {}
    )
    
    # Copy outputs back to original tensors (in-place update)
    key_cache.copy_(outputs[0])
    value_cache.copy_(outputs[1])


# Register with manual schema to avoid automatic inference
reshape_cache_lib.define(
    "reshape_and_cache_flash(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> ()"
)


# Implementation for XLA
@reshape_cache_lib.impl("reshape_and_cache_flash", "XLA")
def reshape_and_cache_flash_xla(
    key, value, key_cache, value_cache, slot_mapping, 
    kv_cache_dtype, k_scale, v_scale
):
    xla_reshape_and_cache_flash_impl(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )


# Abstract implementation for torch.compile
@reshape_cache_lib.impl_abstract("reshape_and_cache_flash")
def reshape_and_cache_flash_abstract(
    key, value, key_cache, value_cache, slot_mapping,
    kv_cache_dtype, k_scale, v_scale
):
    # Return nothing (void function)
    return None


# Register a custom decomposition to handle in-place updates
@torch._dynamo.register_decomposition(torch.ops.reshape_cache.reshape_and_cache_flash)
def reshape_and_cache_flash_decomp(
    key, value, key_cache, value_cache, slot_mapping,
    kv_cache_dtype, k_scale, v_scale
):
    """Decomposition that avoids alias annotation issues."""
    # Call the implementation
    xla_reshape_and_cache_flash_impl(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )
    # Return nothing
    return None


def test_basic_functionality():
    """Test basic functionality."""
    print("\n" + "="*60)
    print("Testing basic reshape_and_cache_flash functionality")
    print("="*60)
    
    device = xm.xla_device()
    
    # Test parameters
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    # Call our custom op
    torch.ops.reshape_cache.reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    print("✓ Basic test completed")
    
    # Check if caches were modified
    if (key_cache != 0).any().item() and (value_cache != 0).any().item():
        print("✓ Caches were updated")
    else:
        print("⚠ Caches were not updated")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile integration")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_cache_update(key, value, key_cache, value_cache, slot_mapping):
        # Use our custom op
        torch.ops.reshape_cache.reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
        return key_cache.abs().mean() + value_cache.abs().mean()
    
    # Test inputs
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    # Run compiled function
    result = compiled_cache_update(key, value, key_cache, value_cache, slot_mapping)
    xm.mark_step()
    
    print(f"✓ torch.compile test completed")
    print(f"  Result: {result.item():.4f}")
    
    if result.item() > 0:
        print("✓ Caches were modified")


def test_with_scaling():
    """Test with scaling factors."""
    print("\n" + "="*60)
    print("Testing with scaling factors")
    print("="*60)
    
    device = xm.xla_device()
    
    # Simple values for testing
    key = torch.ones(2, 1, 4, device=device)
    value = torch.ones(2, 1, 4, device=device) * 2.0
    key_cache = torch.zeros(1, 8, 1, 4, device=device)
    value_cache = torch.zeros(1, 8, 1, 4, device=device)
    slot_mapping = torch.tensor([0, 1], dtype=torch.int64, device=device)
    
    k_scale = torch.tensor([0.5], device=device)
    v_scale = torch.tensor([2.0], device=device)
    
    # Apply with scaling
    torch.ops.reshape_cache.reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", k_scale, v_scale
    )
    
    xm.mark_step()
    
    print("✓ Scaling test completed")
    print(f"  key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.2f} (expected: 0.5)")
    print(f"  value_cache[0,0,0,0]: {value_cache[0,0,0,0].item():.2f} (expected: 4.0)")


def main():
    print("="*60)
    print("Testing in-place reshape_and_cache_flash with torch.compile")
    print("="*60)
    
    # Setup
    setup_custom_call()
    
    # Run tests
    test_basic_functionality()
    test_torch_compile()
    test_with_scaling()
    
    print("\n" + "="*60)
    print("✅ All tests completed!")
    print("="*60)


if __name__ == "__main__":
    main()
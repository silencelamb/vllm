#!/usr/bin/env python3
"""Test if function_name conflicts are causing the registration issue."""

import os
import ctypes
import torch
import torch_xla
import torch_xla.core.xla_model as xm

def test_same_name_registration():
    """Test if registering different functions with the same name causes issues."""
    print("\n" + "="*60)
    print("Test: Same Name Registration")
    print("="*60)
    
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Get function pointers
    reshape_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    flash_addr = ctypes.cast(lib.flash_attn_varlen_xla_custom_call, ctypes.c_void_p).value
    
    print(f"reshape_and_cache function address: 0x{reshape_addr:x}")
    print(f"flash_attn_varlen function address: 0x{flash_addr:x}")
    
    # Test 1: Register both with same name (should fail or overwrite)
    print("\nTest 1: Register both functions with SAME name 'test_custom_call'")
    
    try:
        # Register reshape_and_cache as "test_custom_call"
        capsule1 = PyCapsule_New(reshape_addr, None, None)
        result1 = torch_xla._XLAC._xla_register_custom_call_target(
            "test_custom_call", capsule1, "CUDA"
        )
        print(f"  ✓ Registered reshape_and_cache as 'test_custom_call': {result1}")
        
        # Register flash_attn with the SAME name
        capsule2 = PyCapsule_New(flash_addr, None, None)
        result2 = torch_xla._XLAC._xla_register_custom_call_target(
            "test_custom_call", capsule2, "CUDA"  # Same name!
        )
        print(f"  ✓ Registered flash_attn as 'test_custom_call': {result2}")
        
        print("\n  Both registrations succeeded with same name!")
        print("  This means the second registration likely overwrote the first.")
        
    except Exception as e:
        print(f"  ✗ Registration failed: {e}")
    
    # Test 2: Try calling the function to see which one executes
    print("\nTest 2: Call 'test_custom_call' to see which function executes")
    
    device = xm.xla_device()
    
    # Try with reshape_and_cache parameters
    try:
        print("\n  Trying with reshape_and_cache parameters...")
        key = torch.randn(4, 2, 64, device=device)
        value = torch.randn(4, 2, 64, device=device)
        key_cache = torch.zeros(16, 16, 2, 64, device=device)
        value_cache = torch.zeros(16, 16, 2, 64, device=device)
        slot_mapping = torch.arange(4, dtype=torch.int32, device=device)
        
        descriptor = b"auto|4|2|64|16|16|0|0"
        buffers = [key, value, key_cache, value_cache, slot_mapping, key_cache, value_cache]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers, "test_custom_call",
            [list(key_cache.shape), list(value_cache.shape)],
            [key_cache.dtype, value_cache.dtype],
            True, descriptor, 2, {}
        )
        print("  ✓ Call with reshape_and_cache params succeeded")
    except Exception as e:
        print(f"  ✗ Call with reshape_and_cache params failed: {str(e)[:100]}")
    
    # Try with flash_attn parameters
    try:
        print("\n  Trying with flash_attn parameters...")
        q = torch.randn(8, 4, 64, device=device)
        k = torch.randn(8, 2, 64, device=device)
        v = torch.randn(8, 2, 64, device=device)
        cu_seqlens_q = torch.tensor([0, 4, 8], dtype=torch.int32, device=device)
        cu_seqlens_k = torch.tensor([0, 4, 8], dtype=torch.int32, device=device)
        
        descriptor = b"2|4|4|4|2|64|8|8|0.125|1|-1|-1|0.0|0|0|0|0"
        buffers = [q, k, v, cu_seqlens_q, cu_seqlens_k]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers, "test_custom_call",
            [list(q.shape), [4, 8]],
            [q.dtype, torch.float32],
            False, descriptor, 2, {}
        )
        print("  ✓ Call with flash_attn params succeeded")
    except Exception as e:
        print(f"  ✗ Call with flash_attn params failed: {str(e)[:100]}")


def test_unique_names():
    """Test if using completely unique names solves the problem."""
    print("\n" + "="*60)
    print("Test: Unique Names with Prefixes")
    print("="*60)
    
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    reshape_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    flash_addr = ctypes.cast(lib.flash_attn_varlen_xla_custom_call, ctypes.c_void_p).value
    
    # Use very unique names with prefixes
    unique_reshape_name = "vllm_xla_gpu_reshape_and_cache_v1"
    unique_flash_name = "vllm_xla_gpu_flash_attn_varlen_v1"
    
    print(f"Registering with unique names:")
    print(f"  reshape: {unique_reshape_name}")
    print(f"  flash:   {unique_flash_name}")
    
    # Register both
    try:
        capsule1 = PyCapsule_New(reshape_addr, None, None)
        torch_xla._XLAC._xla_register_custom_call_target(
            unique_reshape_name, capsule1, "CUDA"
        )
        print(f"  ✓ Registered {unique_reshape_name}")
        
        capsule2 = PyCapsule_New(flash_addr, None, None)
        torch_xla._XLAC._xla_register_custom_call_target(
            unique_flash_name, capsule2, "CUDA"
        )
        print(f"  ✓ Registered {unique_flash_name}")
        
    except Exception as e:
        print(f"  ✗ Registration failed: {e}")
        return
    
    # Test both
    device = xm.xla_device()
    
    print("\nTesting both functions with unique names:")
    
    # Test reshape
    try:
        key = torch.randn(4, 2, 64, device=device)
        value = torch.randn(4, 2, 64, device=device)
        key_cache = torch.zeros(16, 16, 2, 64, device=device)
        value_cache = torch.zeros(16, 16, 2, 64, device=device)
        slot_mapping = torch.arange(4, dtype=torch.int32, device=device)
        
        descriptor = b"auto|4|2|64|16|16|0|0"
        buffers = [key, value, key_cache, value_cache, slot_mapping, key_cache, value_cache]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers, unique_reshape_name,
            [list(key_cache.shape), list(value_cache.shape)],
            [key_cache.dtype, value_cache.dtype],
            True, descriptor, 2, {}
        )
        print(f"  ✓ {unique_reshape_name} works!")
    except Exception as e:
        print(f"  ✗ {unique_reshape_name} failed: {str(e)[:100]}")
    
    # Test flash
    try:
        q = torch.randn(8, 4, 64, device=device)
        k = torch.randn(8, 2, 64, device=device)
        v = torch.randn(8, 2, 64, device=device)
        cu_seqlens_q = torch.tensor([0, 4, 8], dtype=torch.int32, device=device)
        cu_seqlens_k = torch.tensor([0, 4, 8], dtype=torch.int32, device=device)
        
        descriptor = b"2|4|4|4|2|64|8|8|0.125|1|-1|-1|0.0|0|0|0|0"
        buffers = [q, k, v, cu_seqlens_q, cu_seqlens_k]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers, unique_flash_name,
            [list(q.shape), [4, 8]],
            [q.dtype, torch.float32],
            False, descriptor, 2, {}
        )
        print(f"  ✓ {unique_flash_name} works!")
    except Exception as e:
        print(f"  ✗ {unique_flash_name} failed: {str(e)[:100]}")


def main():
    print("XLA Custom Call Name Conflict Test")
    print("="*60)
    
    # Check if library exists
    if not os.path.exists("vllm_xla_ops.so"):
        print("✗ vllm_xla_ops.so not found. Please compile it first.")
        return
    
    # Run tests
    test_same_name_registration()
    test_unique_names()
    
    print("\n" + "="*60)
    print("Conclusions:")
    print("="*60)
    print("""
Based on the tests above:

1. If both functions can be registered with the SAME name:
   - XLA uses function_name as a key in a registry (like a map/dict)
   - The second registration overwrites the first
   - Only the last registered function is accessible

2. If unique names allow both functions to work:
   - The problem is name collision
   - Solution: Use unique, non-conflicting names

3. If unique names still don't work:
   - There's a deeper issue in XLA's registration mechanism
   - Possibly a singleton pattern or global state issue
""")


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    main()
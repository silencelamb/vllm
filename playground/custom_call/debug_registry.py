#!/usr/bin/env python3
"""Debug script to check XLA CustomCallTargetRegistry state."""

import os
import ctypes
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import time

def check_registry_after_registration():
    """Register custom calls and check if they persist in the registry."""
    print("\n" + "="*60)
    print("Registry State Test")
    print("="*60)
    
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    reshape_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    flash_addr = ctypes.cast(lib.flash_attn_varlen_xla_custom_call, ctypes.c_void_p).value
    
    print(f"Function addresses:")
    print(f"  reshape_and_cache: 0x{reshape_addr:x}")
    print(f"  flash_attn_varlen: 0x{flash_addr:x}")
    
    # Step 1: Register first function
    print("\n[Step 1] Registering vllm_reshape_and_cache_flash...")
    capsule1 = PyCapsule_New(reshape_addr, None, None)
    result1 = torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_reshape_and_cache_flash", capsule1, "CUDA"
    )
    print(f"  Registration returned: {result1}")
    
    # Try to use it immediately
    device = xm.xla_device()
    try:
        key = torch.randn(4, 2, 64, device=device)
        value = torch.randn(4, 2, 64, device=device)
        key_cache = torch.zeros(16, 16, 2, 64, device=device)
        value_cache = torch.zeros(16, 16, 2, 64, device=device)
        slot_mapping = torch.arange(4, dtype=torch.int32, device=device)
        
        descriptor = b"auto|4|2|64|16|16|0|0"
        buffers = [key, value, key_cache, value_cache, slot_mapping, key_cache, value_cache]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers, "vllm_reshape_and_cache_flash",
            [list(key_cache.shape), list(value_cache.shape)],
            [key_cache.dtype, value_cache.dtype],
            True, descriptor, 2, {}
        )
        print("  ✓ vllm_reshape_and_cache_flash is callable")
    except Exception as e:
        print(f"  ✗ vllm_reshape_and_cache_flash failed: {str(e)[:80]}")
    
    # Step 2: Register second function
    print("\n[Step 2] Registering flash_attn_varlen...")
    capsule2 = PyCapsule_New(flash_addr, None, None)
    result2 = torch_xla._XLAC._xla_register_custom_call_target(
        "flash_attn_varlen", capsule2, "CUDA"
    )
    print(f"  Registration returned: {result2}")
    
    # Try to use it
    try:
        q = torch.randn(8, 4, 64, device=device)
        k = torch.randn(8, 2, 64, device=device)
        v = torch.randn(8, 2, 64, device=device)
        cu_seqlens_q = torch.tensor([0, 4, 8], dtype=torch.int32, device=device)
        cu_seqlens_k = torch.tensor([0, 4, 8], dtype=torch.int32, device=device)
        
        descriptor = b"2|4|4|4|2|64|8|8|0.125|1|-1|-1|0.0|0|0|0|0"
        buffers = [q, k, v, cu_seqlens_q, cu_seqlens_k]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers, "flash_attn_varlen",
            [list(q.shape), [4, 8]],
            [q.dtype, torch.float32],
            False, descriptor, 2, {}
        )
        print("  ✓ flash_attn_varlen is callable")
    except Exception as e:
        print(f"  ✗ flash_attn_varlen failed: {str(e)[:80]}")
    
    # Step 3: Check if first function still works
    print("\n[Step 3] Checking if vllm_reshape_and_cache_flash still works...")
    try:
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers, "vllm_reshape_and_cache_flash",
            [list(key_cache.shape), list(value_cache.shape)],
            [key_cache.dtype, value_cache.dtype],
            True, descriptor, 2, {}
        )
        print("  ✓ vllm_reshape_and_cache_flash STILL WORKS")
    except Exception as e:
        print(f"  ✗ vllm_reshape_and_cache_flash NO LONGER WORKS: {str(e)[:80]}")


def test_registration_persistence():
    """Test if registrations persist across different contexts."""
    print("\n" + "="*60)
    print("Registration Persistence Test")
    print("="*60)
    
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Register with timestamp in name to ensure uniqueness
    timestamp = int(time.time() * 1000) % 1000000
    test_name = f"test_custom_call_{timestamp}"
    
    print(f"Registering with unique name: {test_name}")
    
    reshape_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    capsule = PyCapsule_New(reshape_addr, None, None)
    
    # Register once
    result = torch_xla._XLAC._xla_register_custom_call_target(
        test_name, capsule, "CUDA"
    )
    print(f"  First registration: {result}")
    
    # Try to register again with same name
    capsule2 = PyCapsule_New(reshape_addr, None, None)
    result2 = torch_xla._XLAC._xla_register_custom_call_target(
        test_name, capsule2, "CUDA"
    )
    print(f"  Second registration (same name): {result2}")
    
    # Register with different platform (should fail)
    try:
        capsule3 = PyCapsule_New(reshape_addr, None, None)
        result3 = torch_xla._XLAC._xla_register_custom_call_target(
            test_name + "_gpu", capsule3, "GPU"
        )
        print(f"  Registration with 'GPU' platform: {result3}")
    except Exception as e:
        print(f"  Registration with 'GPU' platform failed (expected): {e}")


def test_registry_limits():
    """Test if there's a limit to how many custom calls can be registered."""
    print("\n" + "="*60)
    print("Registry Limits Test")
    print("="*60)
    
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    reshape_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    
    # Try to register many custom calls
    print("Registering multiple custom calls...")
    successful = []
    
    for i in range(10):
        name = f"test_call_{i}"
        try:
            capsule = PyCapsule_New(reshape_addr, None, None)
            torch_xla._XLAC._xla_register_custom_call_target(
                name, capsule, "CUDA"
            )
            successful.append(name)
            print(f"  ✓ Registered {name}")
        except Exception as e:
            print(f"  ✗ Failed at {name}: {e}")
            break
    
    print(f"\nSuccessfully registered {len(successful)} custom calls")
    
    # Test if they're all callable
    device = xm.xla_device()
    print("\nTesting if all registered calls are accessible...")
    
    for name in successful[:3]:  # Test first 3 to save time
        try:
            key = torch.randn(4, 2, 64, device=device)
            value = torch.randn(4, 2, 64, device=device)
            key_cache = torch.zeros(16, 16, 2, 64, device=device)
            value_cache = torch.zeros(16, 16, 2, 64, device=device)
            slot_mapping = torch.arange(4, dtype=torch.int32, device=device)
            
            descriptor = b"auto|4|2|64|16|16|0|0"
            buffers = [key, value, key_cache, value_cache, slot_mapping, key_cache, value_cache]
            
            outputs = torch_xla._XLAC._xla_custom_call(
                buffers, name,
                [list(key_cache.shape), list(value_cache.shape)],
                [key_cache.dtype, value_cache.dtype],
                True, descriptor, 2, {}
            )
            print(f"  ✓ {name} is callable")
        except Exception as e:
            print(f"  ✗ {name} is not callable: {str(e)[:50]}")


def main():
    print("XLA CustomCallTargetRegistry Debug")
    print("="*60)
    print("Based on XLA test code, we know:")
    print("  - XLA has a global CustomCallTargetRegistry")
    print("  - Registry uses (function_name, platform) as key")
    print("  - Registry::Global()->Lookup() can retrieve registered functions")
    
    # Check if library exists
    if not os.path.exists("vllm_xla_ops.so"):
        print("✗ vllm_xla_ops.so not found. Please compile it first.")
        return
    
    # Run comprehensive tests
    check_registry_after_registration()
    test_registration_persistence()
    test_registry_limits()
    
    print("\n" + "="*60)
    print("Analysis Complete")
    print("="*60)
    print("""
Based on the tests:
1. If the first function stops working after registering the second:
   → The registry is being corrupted or has a size limit
   
2. If duplicate registrations succeed:
   → The registry allows overwriting (last-write-wins)
   
3. If many registrations work:
   → The issue is specific to these two functions, not a general limit

The root cause is likely in the PJRT C API implementation
or in how it interacts with the global CustomCallTargetRegistry.
""")


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    main()
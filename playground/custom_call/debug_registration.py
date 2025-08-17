#!/usr/bin/env python3
"""Debug script to understand XLA custom call registration issue."""

import os
import ctypes
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import torch._dynamo
from torch.library import Library
from torch_xla.experimental.custom_kernel import XLA_LIB

def test_direct_registration():
    """Test registering custom calls directly without torch.compile."""
    print("\n" + "="*60)
    print("Test 1: Direct Registration Test")
    print("="*60)
    
    # Load the unified library
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    # Setup PyCapsule creation
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Register both custom calls
    try:
        # Register reshape_and_cache first
        reshape_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
        reshape_capsule = PyCapsule_New(reshape_addr, None, None)
        result1 = torch_xla._XLAC._xla_register_custom_call_target(
            "vllm_reshape_and_cache_flash", reshape_capsule, "CUDA"
        )
        print(f"✓ Registered reshape_and_cache: {result1}")
        
        # Register flash_attn second
        flash_addr = ctypes.cast(lib.flash_attn_varlen_xla_custom_call, ctypes.c_void_p).value
        flash_capsule = PyCapsule_New(flash_addr, None, None)
        result2 = torch_xla._XLAC._xla_register_custom_call_target(
            "flash_attn_varlen", flash_capsule, "CUDA"
        )
        print(f"✓ Registered flash_attn_varlen: {result2}")
        
    except Exception as e:
        print(f"✗ Registration failed: {e}")
        return False
    
    # Test if they can be called
    device = xm.xla_device()
    print(f"\nXLA device: {device}")
    
    # Try to call them through XLA
    try:
        # Test reshape_and_cache
        print("\nTesting reshape_and_cache call...")
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
        print("✓ reshape_and_cache call succeeded")
    except Exception as e:
        print(f"✗ reshape_and_cache call failed: {e}")
    
    # Test flash_attn
    try:
        print("\nTesting flash_attn_varlen call...")
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
        print("✓ flash_attn_varlen call succeeded")
    except Exception as e:
        print(f"✗ flash_attn_varlen call failed: {e}")
    
    return True


def test_registration_order():
    """Test if registration order matters."""
    print("\n" + "="*60)
    print("Test 2: Registration Order Test")
    print("="*60)
    
    # Try different registration orders
    orders = [
        ("reshape_first", ["vllm_reshape_and_cache_flash", "flash_attn_varlen"]),
        ("flash_first", ["flash_attn_varlen", "vllm_reshape_and_cache_flash"])
    ]
    
    for test_name, order in orders:
        print(f"\n{test_name}: Registering in order {order}")
        
        # Fresh load of library
        lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
        PyCapsule_New.restype = ctypes.py_object
        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
        
        success = []
        for custom_call_name in order:
            try:
                if "reshape" in custom_call_name:
                    func = lib.reshape_and_cache_flash_xla_custom_call
                else:
                    func = lib.flash_attn_varlen_xla_custom_call
                
                addr = ctypes.cast(func, ctypes.c_void_p).value
                capsule = PyCapsule_New(addr, None, None)
                torch_xla._XLAC._xla_register_custom_call_target(
                    custom_call_name, capsule, "CUDA"
                )
                success.append(custom_call_name)
                print(f"  ✓ Registered {custom_call_name}")
            except Exception as e:
                print(f"  ✗ Failed to register {custom_call_name}: {e}")
        
        print(f"  Successfully registered: {success}")


def test_separate_registration():
    """Test registering with separate PyCapsule objects."""
    print("\n" + "="*60)
    print("Test 3: Separate PyCapsule Test")
    print("="*60)
    
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    # Create separate PyCapsule_New instances
    import ctypes
    
    # For reshape_and_cache
    PyCapsule_New1 = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New1.restype = ctypes.py_object
    PyCapsule_New1.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # For flash_attn
    PyCapsule_New2 = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New2.restype = ctypes.py_object
    PyCapsule_New2.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    try:
        # Register with separate capsule creators
        reshape_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
        reshape_capsule = PyCapsule_New1(reshape_addr, b"reshape_capsule", None)
        torch_xla._XLAC._xla_register_custom_call_target(
            "vllm_reshape_and_cache_flash", reshape_capsule, "CUDA"
        )
        print("✓ Registered reshape_and_cache with separate capsule")
        
        flash_addr = ctypes.cast(lib.flash_attn_varlen_xla_custom_call, ctypes.c_void_p).value
        flash_capsule = PyCapsule_New2(flash_addr, b"flash_capsule", None)
        torch_xla._XLAC._xla_register_custom_call_target(
            "flash_attn_varlen", flash_capsule, "CUDA"
        )
        print("✓ Registered flash_attn_varlen with separate capsule")
        
    except Exception as e:
        print(f"✗ Registration failed: {e}")


def main():
    print("XLA Custom Call Registration Debug")
    print("="*60)
    
    # Check if library exists
    if not os.path.exists("vllm_xla_ops.so"):
        print("✗ vllm_xla_ops.so not found. Please compile it first.")
        return
    
    # Run tests
    test_direct_registration()
    test_registration_order()
    test_separate_registration()
    
    print("\n" + "="*60)
    print("Debug tests completed")
    print("="*60)


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    main()
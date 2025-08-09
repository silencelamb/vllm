#!/usr/bin/env python3
"""Simplified test to understand XLA's in-place behavior."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct

# Compile
os.system("nvcc -shared -Xcompiler -fPIC -o inplace_add.so inplace_add_kernel.cu -lcudart")

# Load and register ONLY the inplace kernel
lib = ctypes.CDLL("./inplace_add.so", ctypes.RTLD_GLOBAL)
func = lib.XlaGpuInplaceAdd
addr = ctypes.cast(func, ctypes.c_void_p).value

PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]

capsule = PyCapsule_New(addr, None, None)
torch_xla._XLAC._xla_register_custom_call_target("XlaGpuInplaceAdd", capsule, "CUDA")
print("✓ Custom call registered\n")


def test_direct_xla_call():
    """Test direct XLA custom call without any torch.ops wrapper."""
    print("="*60)
    print("Test 1: Direct XLA custom call")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create tensors
    output = torch.ones(5, device=device)
    input_tensor = torch.ones(5, device=device) * 2
    
    print(f"Before: output = {output}")
    
    # Direct XLA custom call
    size = output.numel()
    backend_config = struct.pack('<i', size)
    
    # Try different buffer arrangements
    print("\nAttempt 1: [input, output] -> [output]")
    result = torch_xla._XLAC._xla_custom_call(
        [input_tensor, output],  # inputs
        "XlaGpuInplaceAdd",
        [list(output.shape)],    # output shape
        [output.dtype],          # output dtype
        True,                    # has_side_effect
        backend_config,
        1,                       # api_version
        {}
    )[0]
    
    xm.mark_step()
    xm.wait_device_ops()
    print(f"After: output = {output}")
    print(f"Result: {result}")
    print(f"Output modified: {(output != 1).any().item()}")
    
    # Try with same tensor as input and output
    print("\n" + "-"*40)
    print("Attempt 2: [output, output] -> [output]")
    output2 = torch.ones(5, device=device) * 3
    
    result2 = torch_xla._XLAC._xla_custom_call(
        [output2, output2],      # same tensor as both input and output!
        "XlaGpuInplaceAdd",
        [list(output2.shape)],
        [output2.dtype],
        True,
        backend_config,
        1,
        {}
    )[0]
    
    xm.mark_step()
    print(f"Result: {result2}")
    print(f"Output2: {output2}")



def test_with_compile_simple():
    """Simplest possible torch.compile test."""
    print("\n" + "="*60)
    print("Test 2: Simplest torch.compile")
    print("="*60)
    print("\nAttempt 1: [input, output] -> [output]")
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def simple_add(input_tensor, output):
        size = output.numel()
        backend_config = struct.pack('<i', size)
        
        # Try different buffer arrangements
        
        result = torch_xla._XLAC._xla_custom_call(
            [input_tensor, output],  # inputs
            "XlaGpuInplaceAdd",
            [list(output.shape)],    # output shape
            [output.dtype],          # output dtype
            True,                    # has_side_effect
            backend_config,
            1,                       # api_version
            {}
        )[0]
        # result.copy_(output)
        return result
    
    a = torch.ones(5, device=device)
    b = torch.ones(5, device=device) * 2
    
    result = simple_add(a, b)
    xm.mark_step()
    
    print(f"Result: {result}")
    print(f"b : {b}")
    print("✓ Basic torch.compile works")

def test_donor_minimal():
    """Minimal test of buffer donor."""
    print("\n" + "="*60)
    print("Test 3: Minimal buffer donor test")
    print("="*60)
    
    print("\nAttempt 1: simple_add_with_donor")
    device = xm.xla_device()
    @torch.compile(backend="openxla")
    def simple_add_with_donor(input_tensor, output):
        torch.ops.xla.dynamo_set_buffer_donor_(output, True)
        size = output.numel()
        backend_config = struct.pack('<i', size)
        
        # Try different buffer arrangements
        
        result = torch_xla._XLAC._xla_custom_call(
            [input_tensor, output],  # inputs
            "XlaGpuInplaceAdd",
            [list(output.shape)],    # output shape
            [output.dtype],          # output dtype
            True,                    # has_side_effect
            backend_config,
            1,                       # api_version
            {}
        )[0]
        
        return result
    
    a = torch.ones(5, device=device)
    b = torch.ones(5, device=device) * 2
    
    try:
        result = simple_add_with_donor(a, b)
        # 这句是否起到作用了呢？ 参照pallas.py写的
        b.copy_(result)
        xm.mark_step()
        print(f"Result: {result}")
        print(f"b : {b}")
        print("✓ Buffer donor alone works")
    except Exception as e:
        print(f"✗ Buffer donor failed: {e}")


if __name__ == "__main__":
    print("XLA In-place Behavior Analysis\n")
    
    test_direct_xla_call()
    test_with_compile_simple()
    test_donor_minimal()
    
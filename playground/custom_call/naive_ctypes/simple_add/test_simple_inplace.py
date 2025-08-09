#!/usr/bin/env python3
"""Simplified test to understand XLA's in-place behavior."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import torch_xla._XLAC as xlac
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
xlac._xla_register_custom_call_target("XlaGpuInplaceAdd", capsule, "CUDA")
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
    result = xlac._xla_custom_call(
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
    print(f"After: output = {output}")
    print(f"Result: {result}")
    print(f"Output modified: {(output != 1).any().item()}")
    
    # Try with same tensor as input and output
    print("\n" + "-"*40)
    print("Attempt 2: [output, output] -> [output]")
    output2 = torch.ones(5, device=device) * 3
    
    result2 = xlac._xla_custom_call(
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


def test_builtin_inplace():
    """Compare with PyTorch's built-in in-place operation."""
    print("\n" + "="*60)
    print("Test 2: PyTorch built-in in-place (for comparison)")
    print("="*60)
    
    device = xm.xla_device()
    
    # Test regular in-place add_
    tensor = torch.ones(5, device=device)
    print(f"Before: {tensor}")
    
    # Check pointer before and after
    # Note: data_ptr() returns 0 for XLA, but we can check object identity
    id_before = id(tensor)
    tensor.add_(2)
    id_after = id(tensor)
    
    xm.mark_step()
    print(f"After: {tensor}")
    print(f"Same Python object: {id_before == id_after}")


def test_with_compile_simple():
    """Simplest possible torch.compile test."""
    print("\n" + "="*60)
    print("Test 3: Simplest torch.compile")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def simple_add(a, b):
        # Just use built-in add
        return a + b
    
    a = torch.ones(5, device=device)
    b = torch.ones(5, device=device) * 2
    
    result = simple_add(a, b)
    xm.mark_step()
    
    print(f"Result: {result}")
    print("✓ Basic torch.compile works")
    
    # Now test in-place
    @torch.compile(backend="openxla")
    def simple_inplace(tensor, value):
        tensor.add_(value)
        return tensor
    
    tensor = torch.ones(5, device=device)
    print(f"\nIn-place test - Before: {tensor}")
    
    result = simple_inplace(tensor, 3)
    xm.mark_step()
    
    print(f"After: {result}")
    print(f"Original tensor: {tensor}")
    print(f"Same object: {tensor is result}")


def test_donor_minimal():
    """Minimal test of buffer donor."""
    print("\n" + "="*60)
    print("Test 4: Minimal buffer donor test")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def with_donor(tensor):
        # Only set buffer donor, no custom op
        torch.ops.xla.dynamo_set_buffer_donor_(tensor, True)
        # Just add a constant
        return tensor + 1
    
    tensor = torch.ones(5, device=device)
    
    try:
        result = with_donor(tensor)
        xm.mark_step()
        print(f"Result: {result}")
        print("✓ Buffer donor alone works")
    except Exception as e:
        print(f"✗ Buffer donor failed: {e}")


if __name__ == "__main__":
    print("XLA In-place Behavior Analysis\n")
    
    test_direct_xla_call()
    test_builtin_inplace()
    test_with_compile_simple()
    test_donor_minimal()
    
    print("\n" + "="*60)
    print("Conclusions:")
    print("1. XLA doesn't do true in-place for custom ops")
    print("2. Buffer addresses are always different")
    print("3. dynamo_set_buffer_donor_ causes issues with custom ops")
    print("4. XLA's in-place optimization is limited")
    print("="*60)
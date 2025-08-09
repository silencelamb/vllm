#!/usr/bin/env python3
"""Test in-place optimization with dynamo_set_buffer_donor_ and torch.compile."""

import os
import sys
import torch
import torch_xla
import torch_xla.core.xla_model as xm
from torch.library import Library
import ctypes
import struct

# Compile the kernel
print("Compiling in-place kernel...")
os.system("nvcc -shared -Xcompiler -fPIC -o inplace_add.so inplace_add_kernel.cu -lcudart")

# Load and register the kernels
lib = ctypes.CDLL("./inplace_add.so", ctypes.RTLD_GLOBAL)

# Register in-place add
inplace_func = lib.XlaGpuInplaceAdd
inplace_addr = ctypes.cast(inplace_func, ctypes.c_void_p).value

PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]

inplace_capsule = PyCapsule_New(inplace_addr, None, None)
torch_xla._XLAC._xla_register_custom_call_target("XlaGpuInplaceAdd", inplace_capsule, "CUDA")

# Register regular add for comparison
lib = ctypes.CDLL("./inplace_add.so", ctypes.RTLD_GLOBAL)
regular_func = lib.XlaGpuRegularAdd
regular_addr = ctypes.cast(regular_func, ctypes.c_void_p).value

PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]

regular_capsule = PyCapsule_New(regular_addr, None, None)
torch_xla._XLAC._xla_register_custom_call_target("XlaGpuRegularAdd", regular_capsule, "CUDA")

print("✓ Custom calls registered\n")

# Create torch library
inplace_lib = Library("xla_inplace", "DEF")

# Define in-place operation
inplace_lib.define("inplace_add(Tensor output, Tensor input) -> Tensor")

def inplace_add_xla(output, input):
    """In-place add: output += input"""
    size = output.numel()
    backend_config = struct.pack('<i', size)
    
    # For in-place operation, pass output as both input and output
    result = torch_xla._XLAC._xla_custom_call(
        [input, output],  # input first, then output
        "XlaGpuInplaceAdd",
        [list(output.shape)],  # output shape
        [output.dtype],        # output dtype
        True,  # has_side_effect
        backend_config,
        1,  # api_version
        {}
    )[0]
    return result

# Register the implementation
inplace_lib.impl("inplace_add", inplace_add_xla, "XLA")

def inplace_add_abstract(output, input):
    return output

inplace_lib._register_fake("inplace_add", inplace_add_abstract)

# Define regular add for comparison
inplace_lib.define("regular_add(Tensor a, Tensor b) -> Tensor")

def regular_add_xla(a, b):
    """Regular add: return a + b"""
    size = a.numel()
    backend_config = struct.pack('<i', size)
    
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],  # inputs
        "XlaGpuRegularAdd",
        [list(a.shape)],  # output shape
        [a.dtype],        # output dtype
        False,  # no side effect
        backend_config,
        1,  # api_version
        {}
    )[0]
    return result

# Register regular add implementation
inplace_lib.impl("regular_add", regular_add_xla, "XLA")

def regular_add_abstract(a, b):
    return torch.empty_like(a)

inplace_lib._register_fake("regular_add", regular_add_abstract)


def test_without_compile():
    """Test in-place operation without torch.compile."""
    print("="*60)
    print("Test 1: Without torch.compile")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create tensors
    output = torch.ones(5, device=device)
    input = torch.ones(5, device=device) * 2
    
    print(f"Before: output = {output}")
    
    # Call in-place op
    result = torch.ops.xla_inplace.inplace_add(output, input)
    xm.mark_step()
    
    print(f"After: output = {output}")
    print(f"Result: {result}")
    print(f"Output and result are same tensor: {output is result}")
    print()


def test_with_compile_no_donor():
    """Test with torch.compile but without buffer donor."""
    print("="*60)
    print("Test 2: With torch.compile (no buffer donor)")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_add_no_donor(output, input):
        result = torch.ops.xla_inplace.inplace_add(output, input)
        return result
    
    output = torch.ones(5, device=device)
    input = torch.ones(5, device=device) * 3
    
    print(f"Before: output = {output}")
    
    result = compiled_add_no_donor(output, input)
    xm.mark_step()
    
    print(f"After: output = {output}")
    print(f"Result: {result}")
    print("Check kernel output above - buffers should be DIFFERENT\n")


def test_with_compile_and_donor():
    """Test with torch.compile AND buffer donor optimization."""
    print("="*60)
    print("Test 3: With torch.compile + buffer donor")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_add_with_donor(output, input):
        # Mark output as buffer donor
        torch.ops.xla.dynamo_set_buffer_donor_(output, True)
        result = torch.ops.xla_inplace.inplace_add(output, input)
        return result
    
    output = torch.ones(5, device=device)
    input = torch.ones(5, device=device) * 4
    
    print(f"Before: output = {output}")
    
    try:
        result = compiled_add_with_donor(output, input)
        xm.mark_step()
        
        print(f"After: output = {output}")
        print(f"Result: {result}")
        print("Check kernel output above - buffers should be the SAME (in-place)\n")
    except Exception as e:
        print(f"Error: {e}")
        print("This might fail due to functionalization issues\n")


def test_comparison():
    """Compare regular add vs in-place add with buffer donor."""
    print("="*60)
    print("Test 4: Comparison - Regular vs In-place")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def regular_compiled(a, b):
        return torch.ops.xla_inplace.regular_add(a, b)
    
    @torch.compile(backend="openxla")
    def inplace_compiled(output, input):
        # Try with buffer donor
        if hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
            torch.ops.xla.dynamo_set_buffer_donor_(output, True)
        return torch.ops.xla_inplace.inplace_add(output, input)
    
    print("Regular add:")
    a = torch.ones(5, device=device)
    b = torch.ones(5, device=device) * 2
    result = regular_compiled(a, b)
    xm.mark_step()
    print(f"Result: {result}\n")
    
    print("In-place add:")
    output = torch.ones(5, device=device)
    input = torch.ones(5, device=device) * 2
    try:
        result = inplace_compiled(output, input)
        xm.mark_step()
        print(f"Result: {result}")
    except Exception as e:
        print(f"Failed: {e}")


def test_simple_pattern():
    """Test the simplest possible pattern."""
    print("="*60)
    print("Test 5: Simplest pattern (single return)")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def simple_inplace(tensor, value):
        # Just add a scalar in-place
        tensor.add_(value)
        return tensor
    
    tensor = torch.ones(5, device=device)
    print(f"Before: {tensor}")
    
    result = simple_inplace(tensor, 5.0)
    xm.mark_step()
    
    print(f"After: {result}")
    print(f"Tensor and result are same: {tensor is result}")


if __name__ == "__main__":
    print("Testing In-place Optimization with XLA\n")
    
    test_without_compile()
    test_with_compile_no_donor()
    test_with_compile_and_donor()
    test_comparison()
    test_simple_pattern()
    
    print("="*60)
    print("Summary:")
    print("- Check the kernel printouts to see buffer addresses")
    print("- If buffers are the same, in-place optimization worked")
    print("- dynamo_set_buffer_donor_ may cause functionalization errors")
    print("="*60)
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
regular_func = lib.XlaGpuRegularAdd
regular_addr = ctypes.cast(regular_func, ctypes.c_void_p).value
regular_capsule = PyCapsule_New(regular_addr, None, None)
torch_xla._XLAC._xla_register_custom_call_target("XlaGpuRegularAdd", regular_capsule, "CUDA")

print("✓ Custom calls registered\n")

# Create torch library
inplace_lib = Library("xla_inplace", "DEF")

# Define in-place operation
inplace_lib.define("inplace_add(Tensor input, Tensor output) -> Tensor")

def inplace_add_xla(input, output):
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
        2,  # api_version
        {}
    )[0]
    return result
    
# Register the implementation
inplace_lib.impl("inplace_add", inplace_add_xla, "XLA")

def inplace_add_abstract(input, output):
    return output

inplace_lib._register_fake("inplace_add", inplace_add_abstract)


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
    result = torch.ops.xla_inplace.inplace_add(input, output)
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"After: output = {output}")
    print(f"After: input = {input}")
    print(f"Result: {result}")
    print(f"Output and result are same tensor: {output is result}")
    print()



if __name__ == "__main__":
    print("Testing In-place Optimization with XLA\n")
    
    test_without_compile()
    
    print("="*60)
    print("Summary:")
    print("- Check the kernel printouts to see buffer addresses")
    print("- If buffers are the same, in-place optimization worked")
    print("- dynamo_set_buffer_donor_ may cause functionalization errors")
    print("="*60)
#!/usr/bin/env python3
"""Simplest possible test for XLA custom call registration."""

import torch
import torch_xla
import torch_xla._XLAC
import ctypes
import os

# Check library
if not os.path.exists("./xla_gpu_custom_ops.so"):
    print("Build library first:")
    print("nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu")
    exit(1)

# Load library
lib = ctypes.CDLL("./xla_gpu_custom_ops.so", ctypes.RTLD_GLOBAL)

# Get function address  
func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value

# Create PyCapsule
PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
capsule = PyCapsule_New(func_addr, None, None)

# Register
print("Registering custom call...")
torch_xla._XLAC._xla_register_custom_call_target(
    "XlaGpuSimpleAdd",  # name
    capsule,            # capsule  
    "CUDA"              # platform
)
print("✅ Success!")

# Test
import torch_xla.core.xla_model as xm
device = xm.xla_device()
a = torch.tensor([1.0, 2.0, 3.0]).to(device)
b = torch.tensor([4.0, 5.0, 6.0]).to(device)

result = torch_xla._XLAC._xla_custom_call(
    [a, b], "XlaGpuSimpleAdd", [[3]], [torch.float32],
    False, "", 4, {}
)[0]

xm.mark_step()
print(f"Result: {result.cpu()}")
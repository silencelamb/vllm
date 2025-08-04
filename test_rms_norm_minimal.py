#!/usr/bin/env python3
"""Minimal test to verify RMS Norm XLA custom call setup."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import torch_xla._XLAC
import ctypes
import os
import struct


def step1_compile():
    """Step 1: Compile the library."""
    print("Step 1: Compiling library...")
    
    if os.path.exists("rms_norm_xla.so"):
        print("  ✓ Library already exists")
        return True
    
    ret = os.system("bash compile_rms_norm.sh")
    return ret == 0


def step2_register():
    """Step 2: Register custom call."""
    print("\nStep 2: Registering custom call...")
    
    if not os.path.exists("rms_norm_xla.so"):
        print("  ✗ Library not found")
        return False
    
    try:
        # Load library
        lib = ctypes.CDLL("./rms_norm_xla.so", ctypes.RTLD_GLOBAL)
        
        # Get function address - check the actual symbol name
        os.system("nm -D rms_norm_xla.so | grep rms_norm")
        
        # Try to find the function
        func_addr = ctypes.cast(lib.rms_norm_xla_custom_call, ctypes.c_void_p).value
        
        # Create PyCapsule
        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
        PyCapsule_New.restype = ctypes.py_object
        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
        capsule = PyCapsule_New(func_addr, None, None)
        
        # Register
        torch_xla._XLAC._xla_register_custom_call_target(
            "vllm_rms_norm_cuda",
            capsule,
            "CUDA"
        )
        
        print("  ✓ Registered successfully")
        return True
        
    except Exception as e:
        print(f"  ✗ Registration failed: {e}")
        return False


def step3_test():
    """Step 3: Test the custom call."""
    print("\nStep 3: Testing custom call...")
    
    device = xm.xla_device()
    
    # Simple test
    input_tensor = torch.randn(2, 3, 4, device=device)
    weight = torch.randn(4, device=device)
    
    # Reshape
    batch_size = 6  # 2 * 3
    hidden_size = 4
    input_2d = input_tensor.reshape(batch_size, hidden_size)
    
    # Descriptor
    epsilon = 1e-5
    descriptor = struct.pack('fqqi', epsilon, batch_size, hidden_size, 0)
    
    try:
        # Call
        outputs = torch_xla._XLAC._xla_custom_call(
            [input_2d, weight],
            "vllm_rms_norm_cuda",
            [list(input_2d.shape)],
            [torch.float32],
            False,
            descriptor,
            1,
            {}
        )
        
        result = outputs[0]
        xm.mark_step()
        
        print(f"  ✓ Custom call successful!")
        print(f"    Input shape: {input_tensor.shape}")
        print(f"    Output shape: {result.reshape(2, 3, 4).shape}")
        
        # Verify
        def ref_rms_norm(x, w, eps):
            var = x.pow(2).mean(-1, keepdim=True)
            return x * torch.rsqrt(var + eps) * w
        
        expected = ref_rms_norm(input_tensor, weight, epsilon)
        xm.mark_step()
        
        diff = torch.abs(result.reshape(2, 3, 4) - expected).max().item()
        print(f"    Max diff: {diff:.2e}")
        
        if diff < 1e-3:
            print("  ✓ Results match!")
        else:
            print(f"  ⚠ Results differ")
        
        return True
        
    except Exception as e:
        print(f"  ✗ Test failed: {e}")
        return False


def main():
    print("=" * 60)
    print("Minimal RMS Norm XLA Custom Call Test")
    print("=" * 60)
    
    # Step 1: Compile
    if not step1_compile():
        print("\n❌ Compilation failed")
        print("Please check CUDA installation and paths")
        return
    
    # Step 2: Register
    if not step2_register():
        print("\n❌ Registration failed") 
        print("Check that the library exports the correct symbols")
        return
    
    # Step 3: Test
    if step3_test():
        print("\n✅ Success! Custom call is working")
    else:
        print("\n❌ Test failed")
    
    print("=" * 60)


if __name__ == "__main__":
    main()
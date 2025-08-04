#!/usr/bin/env python3
"""Register RMS Norm custom call with XLA - following the working pattern."""

import torch_xla._XLAC
import ctypes
import os


def register_rms_norm_custom_call():
    """Register the RMS norm custom call with XLA."""
    
    print("Registering RMS Norm custom call...")
    
    # First, check if the compiled library exists
    lib_paths = [
        "./rms_norm_xla.so",
        "./xla_rms_norm.so", 
        "./vllm._C_xla.cpython-310-x86_64-linux-gnu.so",
        "./vllm/_C_xla.cpython-310-x86_64-linux-gnu.so"
    ]
    
    lib_path = None
    for path in lib_paths:
        if os.path.exists(path):
            lib_path = path
            break
    
    if not lib_path:
        print("❌ No compiled library found. Please compile first:")
        print("   nvcc -shared -fPIC -o rms_norm_xla.so csrc/xla_rms_norm_simple.cu")
        return False
    
    print(f"✓ Found library: {lib_path}")
    
    try:
        # Load the library
        lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
        
        # Try to get the function address
        # The function name depends on how it was compiled
        func_names = [
            "rms_norm_xla_custom_call",
            "rms_norm_cuda_impl", 
            "_Z22rms_norm_xla_custom_call"  # Mangled name
        ]
        
        func_addr = None
        for name in func_names:
            try:
                func_addr = ctypes.cast(getattr(lib, name), ctypes.c_void_p).value
                print(f"✓ Found function: {name} at 0x{func_addr:x}")
                break
            except:
                continue
        
        if not func_addr:
            print("❌ Could not find function in library")
            return False
        
        # Create PyCapsule
        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
        PyCapsule_New.restype = ctypes.py_object
        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
        capsule = PyCapsule_New(func_addr, None, None)
        
        # Register with XLA
        torch_xla._XLAC._xla_register_custom_call_target(
            "vllm_rms_norm_cuda",  # Must match the name used in Python
            capsule,
            "CUDA"
        )
        
        print("✓ Successfully registered custom call: vllm_rms_norm_cuda")
        return True
        
    except Exception as e:
        print(f"❌ Failed to register: {e}")
        return False


if __name__ == "__main__":
    success = register_rms_norm_custom_call()
    
    if success:
        print("\n✅ Custom call ready to use!")
        print("You can now import and use rms_norm_xla")
    else:
        print("\n❌ Registration failed")
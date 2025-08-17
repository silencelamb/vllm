#!/usr/bin/env python3
"""
Unified XLA custom ops registration for vLLM.
This module registers both flash_attn_varlen and reshape_and_cache_flash from a single .so file.
"""

import os
import ctypes
import torch_xla
import torch_xla.core.xla_model as xm


def register_unified_xla_ops(lib_path="vllm_xla_ops.so"):
    """
    Register both XLA custom call operations from the unified library.
    
    Args:
        lib_path: Path to the compiled vllm_xla_ops.so library
    
    Returns:
        bool: True if registration successful, False otherwise
    """
    # Check if library exists
    if not os.path.exists(lib_path):
        print(f"✗ Library not found: {lib_path}")
        print(f"  Current directory: {os.getcwd()}")
        print(f"  Please run compile_unified_xla_ops.sh first")
        return False
    
    try:
        # Load the unified library
        lib = ctypes.CDLL(lib_path, ctypes.RTLD_LOCAL)
        
        # Setup PyCapsule creation
        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
        PyCapsule_New.restype = ctypes.py_object
        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
        
        # Register flash_attn_varlen
        try:
            flash_func_addr = ctypes.cast(
                lib.flash_attn_varlen_xla_custom_call, 
                ctypes.c_void_p
            ).value
            flash_capsule = PyCapsule_New(flash_func_addr, None, None)
            torch_xla._XLAC._xla_register_custom_call_target(
                "flash_attn_varlen",
                flash_capsule,
                "CUDA"
            )
            print("✓ Registered: flash_attn_varlen")
        except AttributeError as e:
            print(f"⚠ flash_attn_varlen_xla_custom_call not found in library: {e}")
        
        # Register vllm_reshape_and_cache_flash
        try:
            reshape_func_addr = ctypes.cast(
                lib.reshape_and_cache_flash_xla_custom_call,
                ctypes.c_void_p
            ).value
            reshape_capsule = PyCapsule_New(reshape_func_addr, None, None)
            torch_xla._XLAC._xla_register_custom_call_target(
                "vllm_reshape_and_cache_flash",
                reshape_capsule,
                "CUDA"
            )
            print("✓ Registered: vllm_reshape_and_cache_flash")
        except AttributeError as e:
            print(f"⚠ reshape_and_cache_flash_xla_custom_call not found in library: {e}")
        
        print("✓ Unified XLA ops registration complete")
        return True
        
    except Exception as e:
        print(f"✗ Failed to register unified XLA ops: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_registration():
    """Test that the registration works correctly."""
    import torch
    
    print("\n" + "="*60)
    print("Testing Unified XLA Ops Registration")
    print("="*60)
    
    # Get XLA device
    device = xm.xla_device()
    print(f"XLA device: {device}")
    
    # Try to register
    success = register_unified_xla_ops()
    
    if success:
        print("\n✓ Registration test passed")
        print("Both custom calls are now available:")
        print("  - torch.ops.xla.flash_attn_varlen_op")
        print("  - torch.ops.xla.reshape_and_cache_flash")
    else:
        print("\n✗ Registration test failed")
    
    return success


if __name__ == "__main__":
    # Change to the script directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    os.chdir(script_dir)
    
    # First, try to compile if .so doesn't exist
    if not os.path.exists("vllm_xla_ops.so"):
        print("Library not found, attempting to compile...")
        compile_result = os.system("bash compile_unified_xla_ops.sh")
        if compile_result != 0:
            print("✗ Compilation failed")
            exit(1)
    
    # Test the registration
    test_registration()
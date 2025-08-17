#!/usr/bin/env python3
"""Check C++ ABI compatibility between PyTorch, XLA, and custom calls."""

import torch
import torch_xla
import subprocess
import os

def check_abi_settings():
    """Check ABI settings across different components."""
    print("="*60)
    print("C++ ABI Compatibility Check")
    print("="*60)
    
    # Check PyTorch ABI
    pytorch_abi = torch._C._GLIBCXX_USE_CXX11_ABI
    print(f"\n1. PyTorch C++ ABI:")
    print(f"   torch._C._GLIBCXX_USE_CXX11_ABI = {pytorch_abi}")
    print(f"   {'✓ Using C++11 ABI' if pytorch_abi else '✗ Using pre-C++11 ABI'}")
    
    # Check PyTorch/XLA version
    print(f"\n2. PyTorch/XLA Version:")
    print(f"   torch_xla.__version__ = {torch_xla.__version__}")
    if "2.7" in torch_xla.__version__ or "2.8" in torch_xla.__version__:
        print(f"   ✓ Version 2.7+ defaults to C++11 ABI")
    else:
        print(f"   ⚠ Older version may use pre-C++11 ABI")
    
    # Check compiled .so file
    print(f"\n3. Custom Call Library:")
    if os.path.exists("vllm_xla_ops.so"):
        # Check symbols in the .so file
        result = subprocess.run(
            ["nm", "-D", "vllm_xla_ops.so"],
            capture_output=True,
            text=True
        )
        
        # Look for C++11 ABI indicators
        has_cxx11_symbols = "__cxx11" in result.stdout
        print(f"   vllm_xla_ops.so contains __cxx11 symbols: {has_cxx11_symbols}")
        
        if has_cxx11_symbols == pytorch_abi:
            print(f"   ✓ ABI matches PyTorch")
        else:
            print(f"   ✗ ABI MISMATCH! This could cause problems")
        
        # Check specific symbols
        print("\n   Sample C++ symbols from library:")
        lines = result.stdout.split('\n')
        cxx_symbols = [l for l in lines if 'std::' in l or '__cxx' in l][:5]
        for sym in cxx_symbols:
            print(f"     {sym[:80]}")
    else:
        print("   ✗ vllm_xla_ops.so not found")
    
    # Check if recompilation is needed
    print(f"\n4. Recommendations:")
    if pytorch_abi:
        print("   Your PyTorch uses C++11 ABI (good for XLA 2.7+)")
        print("   Make sure to compile with: -D_GLIBCXX_USE_CXX11_ABI=1")
    else:
        print("   Your PyTorch uses pre-C++11 ABI")
        print("   This may cause issues with XLA 2.7+")
        print("   Consider upgrading PyTorch or using XLA 2.6")
    
    # Test PJRT behavior with ABI
    print(f"\n5. PJRT Behavior Test:")
    print("   The 'first registration wins' bug might be related to ABI issues")
    print("   if the PJRT C API was compiled with different ABI than your code.")
    
    return pytorch_abi


def test_registration_with_abi_info():
    """Test registration and report ABI-related issues."""
    import ctypes
    import torch_xla.core.xla_model as xm
    
    print("\n" + "="*60)
    print("Testing Registration with ABI Context")
    print("="*60)
    
    if not os.path.exists("vllm_xla_ops.so"):
        print("✗ vllm_xla_ops.so not found")
        return
    
    lib = ctypes.CDLL("./vllm_xla_ops.so", ctypes.RTLD_LOCAL)
    
    # Try to get function addresses
    try:
        reshape_func = lib.reshape_and_cache_flash_xla_custom_call
        flash_func = lib.flash_attn_varlen_xla_custom_call
        print("✓ Successfully loaded function symbols from .so")
    except AttributeError as e:
        print(f"✗ Failed to load symbols: {e}")
        print("  This might be an ABI mismatch issue!")
        return
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Test registration
    reshape_addr = ctypes.cast(reshape_func, ctypes.c_void_p).value
    flash_addr = ctypes.cast(flash_func, ctypes.c_void_p).value
    
    print(f"\nFunction addresses:")
    print(f"  reshape: 0x{reshape_addr:x}")
    print(f"  flash:   0x{flash_addr:x}")
    
    # Try first registration
    capsule1 = PyCapsule_New(reshape_addr, None, None)
    try:
        result = torch_xla._XLAC._xla_register_custom_call_target(
            "test_reshape", capsule1, "CUDA"
        )
        print("✓ First registration succeeded")
    except Exception as e:
        print(f"✗ First registration failed: {e}")
        if "ABI" in str(e) or "undefined symbol" in str(e):
            print("  ⚠ This looks like an ABI issue!")
    
    # Try second registration
    capsule2 = PyCapsule_New(flash_addr, None, None)
    try:
        result = torch_xla._XLAC._xla_register_custom_call_target(
            "test_flash", capsule2, "CUDA"
        )
        print("✓ Second registration succeeded")
    except Exception as e:
        print(f"✗ Second registration failed: {e}")


def main():
    """Main diagnostic function."""
    print("PyTorch/XLA Custom Call ABI Diagnostic")
    print("="*60)
    
    abi = check_abi_settings()
    test_registration_with_abi_info()
    
    print("\n" + "="*60)
    print("Summary")
    print("="*60)
    print("""
The 'first registration wins' bug could be related to:

1. **ABI Mismatch**: If PJRT was compiled with different ABI than your code,
   the registration might fail silently or behave unexpectedly.

2. **XLA 2.7 Changes**: The switch to C++11 ABI by default in XLA 2.7
   might have exposed existing bugs in the PJRT C API.

3. **Solution Options**:
   a) Ensure all components use the same ABI
   b) Try XLA 2.6 with matching ABI
   c) Report bug to XLA team mentioning the ABI context
   
To recompile with correct ABI:
""")
    
    if abi:
        print("   g++ -D_GLIBCXX_USE_CXX11_ABI=1 ...")
        print("   nvcc -D_GLIBCXX_USE_CXX11_ABI=1 ...")
    else:
        print("   g++ -D_GLIBCXX_USE_CXX11_ABI=0 ...")
        print("   nvcc -D_GLIBCXX_USE_CXX11_ABI=0 ...")


if __name__ == "__main__":
    main()
#!/usr/bin/env python
"""Test which registration path is actually being used."""

import os
import ctypes
import sys

# Ensure we're using CUDA
os.environ['PJRT_DEVICE'] = 'CUDA'
print(f"PJRT_DEVICE set to: {os.environ['PJRT_DEVICE']}")

# Try to hook into the registration process
def test_registration():
    """Test custom call registration to see which path is used."""
    
    # Create a simple shared library for testing
    test_code = """
    #include <iostream>
    extern "C" {
        void test_custom_call() {
            std::cout << "Test custom call executed!" << std::endl;
        }
    }
    """
    
    # Write and compile test code
    with open('/tmp/test_custom_call.cc', 'w') as f:
        f.write(test_code)
    
    import subprocess
    try:
        # Compile the test library
        subprocess.run([
            'g++', '-shared', '-fPIC', '-o', '/tmp/test_custom_call.so',
            '/tmp/test_custom_call.cc'
        ], check=True)
        
        # Load the library
        lib = ctypes.CDLL('/tmp/test_custom_call.so')
        
        # Try to register it with XLA
        import torch_xla
        import torch_xla._XLAC as _XLAC
        
        # Create a PyCapsule for the function
        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
        PyCapsule_New.restype = ctypes.py_object
        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
        
        func_addr = ctypes.cast(lib.test_custom_call, ctypes.c_void_p).value
        capsule = PyCapsule_New(func_addr, None, None)
        
        print("\nAttempting to register test_custom_call...")
        try:
            # This should trigger RegisterCustomCall in C++
            _XLAC._xla_register_custom_call_target("test_custom_call", capsule, "CUDA")
            print("✓ First registration succeeded")
        except Exception as e:
            print(f"✗ First registration failed: {e}")
        
        # Try to register a second one
        print("\nAttempting to register test_custom_call_2...")
        try:
            _XLAC._xla_register_custom_call_target("test_custom_call_2", capsule, "CUDA")
            print("✓ Second registration succeeded")
        except Exception as e:
            print(f"✗ Second registration failed: {e}")
            
        # Now test if both work
        print("\n" + "=" * 60)
        print("Testing if both custom calls are accessible...")
        
        # This would require actually invoking them through XLA, which is complex
        # But we can at least see if registration succeeded
        
    except subprocess.CalledProcessError as e:
        print(f"Failed to compile test library: {e}")
    except Exception as e:
        print(f"Test failed: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    test_registration()
    
    print("\n" + "=" * 60)
    print("Conclusion:")
    print("=" * 60)
    print("""
If both registrations succeed but only the first one works in actual use,
the bug is in the PJRT runtime itself, not in the registration mechanism.

If the second registration fails, it's a registration-time issue.

Based on your experience that only the first custom call works,
it seems the registration succeeds but execution fails for all but the first.
""")
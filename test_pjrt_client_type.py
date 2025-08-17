#!/usr/bin/env python
"""Test script to verify PJRT client type and custom call registration behavior."""

import os
import sys

# Set PJRT_DEVICE to CUDA
os.environ['PJRT_DEVICE'] = 'CUDA'
os.environ['VLLM_USE_XLA_GPU'] = '1'
os.environ['VLLM_USE_V1'] = '1'

print("=" * 60)
print("PJRT Client Type Test")
print("=" * 60)
print(f"PJRT_DEVICE: {os.environ.get('PJRT_DEVICE')}")

# Try to import and check XLA configuration
try:
    import torch_xla
    import torch_xla._XLAC as _XLAC
    import torch_xla.core.xla_model as xm
    
    print(f"XLA Device: {xm.xla_device()}")
    print(f"Device Type: {_XLAC._xla_get_device_type()}")
    print(f"Using PJRT: {_XLAC._xla_using_pjrt()}")
    
    # Try to get more info about the client
    device = xm.xla_device()
    print(f"Device string: {device}")
    
except Exception as e:
    print(f"Error checking XLA: {e}")
    
print("\n" + "=" * 60)
print("Testing Custom Call Registration")
print("=" * 60)

# Now test custom call registration
try:
    # Add a debug wrapper around RegisterCustomCall
    import ctypes
    import torch_xla
    
    # Try to register a dummy custom call to see what happens
    print("\nAttempting to register a test custom call...")
    
    # Create a simple test function
    def test_custom_call():
        pass
    
    # Try to use the XLA registration
    try:
        # This would normally be done in C++, but let's try to trace the path
        print("Note: Direct registration from Python may not work, but we can check the path")
        
        # Import and test the actual vllm custom calls
        from vllm.v1.attention.backends.xla_gpu_native import setup_combined_custom_calls
        
        print("\nRegistering vLLM custom calls...")
        setup_combined_custom_calls()
        print("Registration completed")
        
    except Exception as e:
        print(f"Registration error: {e}")
        import traceback
        traceback.print_exc()
        
except Exception as e:
    print(f"Test failed: {e}")
    import traceback
    traceback.print_exc()

print("\n" + "=" * 60)
print("Analysis")
print("=" * 60)
print("""
If PJRT_DEVICE=CUDA is set and GetStreamExecutorGpuClient is used,
then c_api_client should be nullptr in RegisterCustomCall.

This means it should use XLA_REGISTER_CUSTOM_CALL_TARGET_WITH_SYM
instead of the PJRT C API path.

However, if you're still seeing the "first registration wins" bug,
it might mean:
1. StreamExecutorGpuClient is actually a subclass of PjRtCApiClient
2. The bug exists in both registration paths
3. Something else is converting the client type
""")
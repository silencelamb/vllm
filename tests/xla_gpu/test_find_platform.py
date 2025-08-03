"""Find the correct platform name for XLA GPU."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import os


def find_platform_from_error():
    """Create a custom call and extract platform name from error."""
    print("Finding correct platform name...")
    print("=" * 60)
    
    device = xm.xla_device()
    a = torch.tensor([1.0]).to(device)
    
    # Create a custom call that will fail
    result = torch_xla._XLAC._xla_custom_call(
        [a],
        "NonExistentOp",
        [[1]],
        [torch.float32],
        False,
        "",
        4,
        {}
    )[0]
    
    # Try to execute - this will fail and tell us the platform
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result.cpu()
    except Exception as e:
        error_msg = str(e)
        print(f"Error message:\n{error_msg}")
        
        if "for platform" in error_msg:
            # Extract platform name
            parts = error_msg.split("for platform")
            if len(parts) > 1:
                platform = parts[1].strip().split()[0]
                print(f"\n✅ Found platform name: '{platform}'")
                return platform
    
    return None


def test_with_found_platform(platform):
    """Test with the discovered platform name."""
    print(f"\n\nTesting with platform '{platform}'")
    print("=" * 60)
    
    # Load library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return
    
    import ctypes
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
    # Create PyCapsule
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    # Register with found platform
    try:
        torch_xla._XLAC._xla_register_custom_call_target(
            "XlaGpuSimpleAdd",
            capsule,
            platform
        )
        print(f"✅ Registration successful for platform '{platform}'")
    except Exception as e:
        print(f"❌ Registration failed: {e}")
        return
    
    # Test execution
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],
        "XlaGpuSimpleAdd",
        [[3]],
        [torch.float32],
        False,
        "",
        4,
        {}
    )[0]
    
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ EXECUTION SUCCESSFUL!")
        print(f"   Result: {result_cpu}")
        print(f"   Expected: [5.0, 7.0, 9.0]")
        
        if torch.allclose(result_cpu, torch.tensor([5.0, 7.0, 9.0])):
            print("✅ Result is correct!")
            print(f"\n🎉 SUCCESS! Use platform name: '{platform}'")
    except Exception as e:
        print(f"❌ Execution failed: {e}")


def check_env_vars():
    """Check environment variables that might indicate platform."""
    print("\n\nChecking environment variables:")
    print("=" * 60)
    
    env_vars = [
        "PJRT_DEVICE",
        "XLA_DEVICE_TYPE", 
        "GPU_DEVICE_ORDINAL",
        "CUDA_VISIBLE_DEVICES"
    ]
    
    for var in env_vars:
        value = os.environ.get(var, "Not set")
        print(f"{var}: {value}")


if __name__ == "__main__":
    print("XLA Platform Discovery")
    print("=" * 80)
    
    # Check environment
    check_env_vars()
    
    # Find platform from error
    platform = find_platform_from_error()
    
    if platform:
        # Test with found platform
        test_with_found_platform(platform)
    else:
        print("\n❌ Could not determine platform from error message")
        
        # Try common platforms
        print("\nTrying common platform names...")
        for p in ["CUDA", "GPU", "Host"]:
            print(f"\nTrying '{p}'...")
            test_with_found_platform(p)
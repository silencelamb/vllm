"""Test different platform names for XLA custom call registration."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def test_platform(platform_name):
    """Test registration with a specific platform name."""
    print(f"\nTesting platform: '{platform_name}'")
    print("-" * 40)
    
    # Load library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return False
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
    # Create PyCapsule
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    # Register with specified platform
    try:
        torch_xla._XLAC._xla_register_custom_call_target(
            "XlaGpuSimpleAdd",
            capsule,
            platform_name
        )
        print(f"✅ Registration successful for platform '{platform_name}'")
    except Exception as e:
        print(f"❌ Registration failed: {e}")
        return False
    
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
    
    # Check HLO
    hlo = torch_xla._XLAC._get_xla_tensors_hlo([result])
    if "custom_call_target=\"XlaGpuSimpleAdd\"" in hlo:
        print("✅ Custom call target found in HLO")
    
    # Try to execute
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ EXECUTION SUCCESSFUL with platform '{platform_name}'!")
        print(f"   Result: {result_cpu}")
        return True
    except Exception as e:
        error_msg = str(e)
        if "UNIMPLEMENTED" in error_msg and "platform" in error_msg:
            # Extract the platform name from error
            if "for platform" in error_msg:
                actual_platform = error_msg.split("for platform")[-1].strip()
                print(f"❌ Execution failed - expects platform: {actual_platform}")
        else:
            print(f"❌ Execution failed: {error_msg[:100]}...")
        return False


def check_device_type():
    """Check what device type XLA is using."""
    print("\nChecking XLA device information:")
    print("-" * 40)
    
    device = xm.xla_device()
    print(f"Device: {device}")
    print(f"Device type: {device.type}")
    
    # Try to get more info
    try:
        import torch_xla.core.xla_env_vars as xenv
        print(f"XLA device type env: {os.environ.get('XLA_DEVICE_TYPE', 'Not set')}")
    except:
        pass
    
    # Check compilation target
    try:
        # Create a simple tensor to see compilation info
        x = torch.tensor([1.0]).to(device)
        y = x + 1
        hlo = torch_xla._XLAC._get_xla_tensors_hlo([y])
        
        # Look for platform info in HLO
        lines = hlo.split('\n')
        for line in lines:
            if 'platform' in line.lower() or 'target' in line.lower():
                print(f"HLO info: {line.strip()}")
    except:
        pass


def main():
    print("XLA Custom Call Platform Name Test")
    print("=" * 60)
    
    # First check device info
    check_device_type()
    
    # Test different platform names
    platforms_to_test = [
        "CUDA",      # Original attempt
        "GPU",       # Generic GPU
        "gpu",       # Lowercase
        "cuda",      # Lowercase CUDA
        "Host",      # CPU/Host platform
        "host",      # Lowercase host
        "",          # Empty string
    ]
    
    print("\n\nTesting different platform names:")
    print("=" * 60)
    
    success = False
    for platform in platforms_to_test:
        if test_platform(platform):
            success = True
            print(f"\n✅ SUCCESS! Use platform name: '{platform}'")
            break
    
    if not success:
        print("\n❌ None of the platform names worked.")
        print("\nPossible issues:")
        print("1. The custom call signature might not match XLA's expectations")
        print("2. The registration might need to happen differently")
        print("3. Additional setup might be required")


if __name__ == "__main__":
    main()
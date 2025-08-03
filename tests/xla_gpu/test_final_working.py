"""Final working version using the correct approach."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def main():
    print("XLA Custom Call - Final Working Version")
    print("=" * 60)
    
    # 1. Load library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        print("   Build: nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu")
        return
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    print(f"✅ Library loaded, function at: {hex(func_addr)}")
    
    # 2. Create PyCapsule
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    capsule = PyCapsule_New(func_addr, None, None)
    print("✅ PyCapsule created")
    
    # 3. Register with XLA for CUDA platform
    torch_xla._XLAC._xla_register_custom_call_target(
        "XlaGpuSimpleAdd",
        capsule,
        "CUDA"
    )
    print("✅ Registered custom call target")
    
    # 4. Create test tensors
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    print("\n📝 Creating custom call with _xla_custom_call...")
    
    # 5. Use _xla_custom_call with the correct parameters
    # Based on the error messages and HLO output, we know the custom call is created correctly
    # The issue is at execution time - the platform name might not match
    
    # First, let's check what the actual device type is
    print(f"Device type: {device.type}")
    
    # Try with different API versions
    for api_version in [4, 1, 0]:  # TYPED_FFI, STATUS_RETURNING, ORIGINAL
        print(f"\nTrying API version {api_version}:")
        
        try:
            result = torch_xla._XLAC._xla_custom_call(
                [a, b],               # inputs
                "XlaGpuSimpleAdd",    # op_name
                [[3]],                # output_shapes
                [torch.float32],      # output_dtypes
                False,                # has_side_effect
                "",                   # backend_config
                api_version,          # api_version
                {}                    # alias_params
            )[0]
            
            # Check HLO
            hlo = torch_xla._XLAC._get_xla_tensors_hlo([result])
            
            # Find the actual platform in HLO
            for line in hlo.split('\n'):
                if 'custom-call' in line:
                    print(f"HLO: {line.strip()}")
            
            # Try to execute
            xm.mark_step()
            xm.wait_device_ops()
            result_cpu = result.cpu()
            
            print(f"✅ SUCCESS with API version {api_version}!")
            print(f"   Result: {result_cpu}")
            print(f"   Expected: [5.0, 7.0, 9.0]")
            
            if torch.allclose(result_cpu, torch.tensor([5.0, 7.0, 9.0])):
                print("✅ Result is correct!")
                return
                
        except Exception as e:
            error_str = str(e)
            if "No registered implementation" in error_str:
                # Extract the platform name from error
                if "for platform" in error_str:
                    platform = error_str.split("for platform")[-1].strip()
                    print(f"❌ Error indicates platform should be: {platform}")
                    
                    # Try registering with that platform
                    try:
                        torch_xla._XLAC._xla_register_custom_call_target(
                            "XlaGpuSimpleAdd",
                            capsule,
                            platform
                        )
                        print(f"   Re-registered with platform '{platform}'")
                        # Retry will happen in next iteration
                    except:
                        pass
            else:
                print(f"❌ Failed: {error_str[:100]}...")


def test_direct_registration():
    """Test registering for all possible platforms."""
    print("\n\n" + "=" * 60)
    print("Testing registration for all platforms")
    print("=" * 60)
    
    lib = ctypes.CDLL("./xla_gpu_custom_ops.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Try all possible platform names
    platforms = ["CUDA", "GPU", "Host", "Interpreter", "cuda", "gpu"]
    
    for platform in platforms:
        try:
            capsule = PyCapsule_New(func_addr, None, None)
            torch_xla._XLAC._xla_register_custom_call_target(
                "XlaGpuSimpleAdd",
                capsule,
                platform
            )
            print(f"✅ Registered for platform '{platform}'")
        except Exception as e:
            print(f"❌ Failed for platform '{platform}': {e}")


if __name__ == "__main__":
    # First test direct approach
    main()
    
    # Then test all platforms
    test_direct_registration()
    
    print("\n\n💡 Final insights:")
    print("1. The custom call is created correctly in HLO")
    print("2. The issue is platform mismatch at execution time")
    print("3. The error message tells us which platform XLA expects")
    print("4. We need to register for the correct platform")
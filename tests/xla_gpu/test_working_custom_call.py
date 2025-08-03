"""Working XLA custom call implementation using the correct API."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def register_and_test():
    print("XLA Custom Call - Working Implementation")
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
    print(f"✅ PyCapsule created")
    
    # 3. Register with XLA
    # Try different platform names
    platforms = ["CUDA", "GPU", "gpu"]
    registered = False
    
    for platform in platforms:
        try:
            torch_xla._XLAC._xla_register_custom_call_target(
                "XlaGpuSimpleAdd",
                capsule,
                platform
            )
            print(f"✅ Registered with platform '{platform}'")
            registered = True
            break
        except Exception as e:
            print(f"❌ Failed with platform '{platform}': {e}")
    
    if not registered:
        print("❌ Could not register with any platform")
        return
    
    # 4. Create test tensors
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    print("\n📝 Using _xla_custom_call (not _xla_gpu_custom_call):")
    
    # 5. Use _xla_custom_call instead of _xla_gpu_custom_call
    # The difference is that _xla_custom_call allows us to specify the actual target name
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],                    # inputs
        "XlaGpuSimpleAdd",         # op_name - this becomes the actual custom call target!
        [[3]],                     # output_shapes
        [torch.float32],           # output_dtypes
        False,                     # has_side_effect
        "",                        # backend_config
        api_version.API_VERSION_TYPED_FFI,  # api_version
        {}                         # alias_params (for aliasing inputs to outputs)
    )[0]
    
    # 6. Check HLO
    hlo = torch_xla._XLAC._get_xla_tensors_hlo([result])
    print("\nHLO snippet:")
    for line in hlo.split('\n'):
        if 'custom-call' in line:
            print(f"  {line.strip()}")
    
    # 7. Execute
    print("\n🚀 Executing...")
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ EXECUTION SUCCESSFUL!")
        print(f"   Result: {result_cpu}")
        print(f"   Expected: [5.0, 7.0, 9.0]")
        
        if torch.allclose(result_cpu, torch.tensor([5.0, 7.0, 9.0])):
            print("✅ Result is correct!")
    except Exception as e:
        print(f"❌ Execution failed: {e}")
        
        # If it fails, let's try with raw custom call syntax
        print("\n🔧 Trying alternative approach...")
        test_alternative_approach(device)


def test_alternative_approach(device):
    """Test using torch.ops.xla.custom_call if available."""
    print("\nTrying torch.ops.xla.custom_call approach:")
    
    try:
        # Check if this API exists
        if hasattr(torch.ops.xla, 'custom_call'):
            a = torch.tensor([1.0, 2.0, 3.0]).to(device)
            b = torch.tensor([4.0, 5.0, 6.0]).to(device)
            
            result = torch.ops.xla.custom_call(
                [a, b],
                "XlaGpuSimpleAdd",
                torch.float32,
                [3]
            )
            
            xm.mark_step()
            result_cpu = result.cpu()
            print(f"✅ Alternative approach successful!")
            print(f"   Result: {result_cpu}")
        else:
            print("❌ torch.ops.xla.custom_call not available")
    except Exception as e:
        print(f"❌ Alternative approach failed: {e}")


# Import correct API version constant
try:
    from torch_xla._XLAC import ApiVersion
    api_version = ApiVersion
except:
    # Fallback to hardcoded values
    class api_version:
        API_VERSION_ORIGINAL = 0
        API_VERSION_STATUS_RETURNING = 1
        API_VERSION_STATUS_RETURNING_UNIFIED = 2
        API_VERSION_TYPED_FFI = 4


if __name__ == "__main__":
    register_and_test()
    
    print("\n" + "=" * 60)
    print("\n💡 Key insights:")
    print("1. Use _xla_custom_call, not _xla_gpu_custom_call")
    print("2. The op_name parameter becomes the custom_call_target")
    print("3. Registration must match the execution platform")
    print("4. API version matters for compatibility")
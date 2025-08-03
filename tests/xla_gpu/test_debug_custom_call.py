"""Debug custom call to see why target is missing in IR."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def debug_custom_call():
    print("Debug Custom Call Target in IR")
    print("=" * 60)
    
    # Load and register
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
    # Create PyCapsule
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    # Register
    torch_xla._XLAC._xla_register_custom_call_target(
        "XlaGpuSimpleAdd",
        capsule,
        "CUDA"
    )
    print("✅ Registered custom call")
    
    # Create tensors
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    # Try different ways to specify the custom call
    print("\n1. Testing with call_target in custom_data:")
    api_version = 1  # TYPED_FFI,  1,2,3都可以
    # 0: ORIGINAL
    # 1: TYPED_FFI
    # 2: API_VERSION_STATUS_RETURNING
    # 3: API_VERSION_TYPED_FFI
    # 4: STATUS_RETURNING
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
        # api_version = 1或者2 才行
        ir1 = torch_xla._XLAC._get_xla_tensors_hlo([result])
        print("IR:", ir1)
        
        # Try to execute
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print("✅ Execution successful!")
        print(f"✅ SUCCESS with API version {api_version}!")
        print(f"   Result: {result_cpu}")
        print(f"   Expected: [5.0, 7.0, 9.0]")
        
        if torch.allclose(result_cpu, torch.tensor([5.0, 7.0, 9.0])):
            print("✅ Result is correct!")

    except Exception as e:
        print(f"❌ Failed: {e}")
    


def test_direct_registration():
    """Test registering for all possible platforms."""
    print("\n\n" + "=" * 60)
    print("Testing registration for all platforms")
    print("=" * 60)
    
    lib = ctypes.CDLL("./xla_gpu_custom_ops.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
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
    debug_custom_call()
    
    # test_direct_registration()
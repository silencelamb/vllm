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
    import ctypes.pythonapi
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
    try:
        # The 6th parameter (custom_call_data) might need to include the target
        result1 = torch_xla._XLAC._xla_custom_call(
            [a, b],
            "XlaGpuSimpleAdd",  # op_name
            [[3]],              # output_shapes
            [torch.float32],    # output_dtypes
            False,              # has_side_effect
            "XlaGpuSimpleAdd",  # custom_call_data - try putting target here
            4,                  # api_version
            {}                  # alias_params
        )[0]
        
        ir1 = torch_xla._XLAC._get_xla_tensors_text([result1])
        print("IR:", ir1[:500])
        
        # Try to execute
        xm.mark_step()
        print("✅ Execution successful!")
    except Exception as e:
        print(f"❌ Failed: {e}")
    
    print("\n2. Testing with different API version:")
    # XLA custom call API versions:
    # 0: Original
    # 1: With status
    # 2: With typed FFI
    # 3: With stream
    # 4: Latest (with typed FFI + stream)
    for api_version in [0, 1, 2, 3, 4]:
        print(f"\nTrying API version {api_version}:")
        try:
            result = torch_xla._XLAC._xla_custom_call(
                [a, b],
                "XlaGpuSimpleAdd",
                [[3]],
                [torch.float32],
                False,
                "",  # empty custom_call_data
                api_version,
                {}
            )[0]
            
            ir = torch_xla._XLAC._get_xla_tensors_text([result])
            if "XlaGpuSimpleAdd" in ir:
                print(f"✅ Target name appears in IR with API version {api_version}!")
                print(f"IR: {ir[:300]}")
            else:
                print(f"❌ Target name missing in IR")
        except Exception as e:
            print(f"   Error: {str(e)[:100]}")
    
    print("\n3. Check HLO text format:")
    # Create a simple custom call
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
    
    # Get different representations
    ir_text = torch_xla._XLAC._get_xla_tensors_text([result])
    print("\nText IR:")
    print(ir_text)
    
    # Try to get HLO
    try:
        hlo_text = torch_xla._XLAC._get_xla_tensors_hlo([result])
        print("\nHLO format:")
        print(hlo_text[:500])
    except Exception as e:
        print(f"Failed to get HLO: {e}")


if __name__ == "__main__":
    debug_custom_call()
"""Correct way to use torch_xla._XLAC._xla_register_custom_call_target."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def register_custom_call_correctly():
    """Register custom call using the correct API."""
    
    print("Correct XLA Custom Call Registration")
    print("=" * 60)
    
    # Step 1: Load the library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return False
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    print(f"✅ Loaded library: {lib_path}")
    
    # Step 2: Get function pointer
    func_ptr = lib.XlaGpuSimpleAdd
    func_addr = ctypes.cast(func_ptr, ctypes.c_void_p).value
    print(f"✅ Found function at: {hex(func_addr)}")
    
    # Step 3: Create Python capsule
    # The API expects a PyCapsule, not a raw integer
    import ctypes.pythonapi
    
    # PyCapsule_New(pointer, name, destructor)
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Create capsule with the function pointer
    capsule = PyCapsule_New(
        func_addr,  # pointer
        b"XlaGpuSimpleAdd",  # name (can be NULL)
        None  # destructor (NULL)
    )
    
    print("✅ Created PyCapsule for function pointer")
    
    # Step 4: Register with XLA
    try:
        torch_xla._XLAC._xla_register_custom_call_target(
            "XlaGpuSimpleAdd",  # fn_name
            capsule,            # function_ptr (as PyCapsule)
            "CUDA"              # platform
        )
        print("✅ Successfully registered custom call!")
        return True
    except Exception as e:
        print(f"❌ Registration failed: {e}")
        return False


def test_registered_custom_call():
    """Test if the registered custom call works."""
    
    print("\n\nTesting Registered Custom Call")
    print("=" * 60)
    
    # Define op
    lib = torch.library.Library("test_correct", "DEF")
    lib.define("simple_add(Tensor a, Tensor b) -> Tensor")
    
    @torch.library.impl(lib, "simple_add", "XLA")
    def simple_add_xla(a, b):
        result = torch_xla._XLAC._xla_custom_call(
            [a, b],
            "XlaGpuSimpleAdd",
            [list(a.shape)],
            [a.dtype],
            False,
            "",
            4,
            {}
        )[0]
        return result
    
    @torch.library.impl_abstract("test_correct::simple_add")
    def simple_add_meta(a, b):
        return torch.empty_like(a)
    
    # Test
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    print(f"Input a: {a}")
    print(f"Input b: {b}")
    
    # Call custom op
    result = torch.ops.test_correct.simple_add(a, b)
    
    # Check IR
    ir = torch_xla._XLAC._get_xla_tensors_text([result])
    print(f"\nIR contains custom_call: {'custom_call' in ir.lower()}")
    
    # Execute
    print("\nExecuting...")
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ EXECUTION SUCCESSFUL!")
        print(f"Result: {result_cpu}")
        print(f"Expected: [5.0, 7.0, 9.0]")
        
        if torch.allclose(result_cpu, torch.tensor([5.0, 7.0, 9.0])):
            print("✅ Result is correct!")
            return True
    except Exception as e:
        print(f"❌ Execution failed: {str(e)[:200]}...")
        return False
    
    return False


if __name__ == "__main__":
    print("PyTorch XLA Custom Call - Correct Registration Method")
    print("=" * 80)
    
    # First, register the custom call
    if register_custom_call_correctly():
        # Then test it
        if test_registered_custom_call():
            print("\n🎉 SUCCESS! Custom call is working correctly!")
        else:
            print("\n❌ Custom call registered but execution failed")
    else:
        print("\n❌ Failed to register custom call")
    
    print("\n" + "=" * 80)
    print("\n📝 Key Learning:")
    print("torch_xla._XLAC._xla_register_custom_call_target expects:")
    print("1. fn_name: string")
    print("2. function_ptr: PyCapsule (not raw integer!)")  
    print("3. platform: string")
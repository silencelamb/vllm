"""Simple test to verify PyCapsule registration works."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def test_capsule_registration():
    print("Testing PyCapsule Registration")
    print("=" * 60)
    
    # 1. Load library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        print("   Build it first: nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu")
        return False
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    print(f"✅ Loaded library")
    
    # 2. Get function address
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    print(f"✅ Function address: {hex(func_addr)}")
    
    # 3. Create PyCapsule
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    capsule = PyCapsule_New(func_addr, None, None)
    print(f"✅ Created PyCapsule: {capsule}")
    print(f"   Type: {type(capsule)}")
    
    # 4. Register with XLA
    try:
        torch_xla._XLAC._xla_register_custom_call_target(
            "XlaGpuSimpleAdd",  # name
            capsule,            # capsule
            "CUDA"              # platform
        )
        print("✅ Registration successful!")
        return True
    except Exception as e:
        print(f"❌ Registration failed: {e}")
        return False


def test_execution():
    print("\n\nTesting Execution")
    print("=" * 60)
    
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    # Direct custom call
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
    
    print("✅ Custom call created")
    
    # Execute
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ Execution successful!")
        print(f"   Result: {result_cpu}")
        print(f"   Expected: [5.0, 7.0, 9.0]")
        
        if torch.allclose(result_cpu, torch.tensor([5.0, 7.0, 9.0])):
            print("✅ Result is correct!")
            return True
    except Exception as e:
        print(f"❌ Execution failed: {e}")
        return False


if __name__ == "__main__":
    print("XLA Custom Call with PyCapsule Test")
    print("=" * 80)
    
    # Test registration
    if test_capsule_registration():
        # Test execution
        test_execution()
    
    print("\n" + "=" * 80)
    print("\nKey points:")
    print("1. Must use PyCapsule, not raw address")
    print("2. Signature: (name: str, capsule: capsule, platform: str)")
    print("3. Platform should be 'CUDA' for GPU")
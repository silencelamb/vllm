"""Fixed version of XLA custom call registration test."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def main():
    print("XLA Custom Call Registration - Fixed Version")
    print("=" * 60)
    
    # Step 1: Check library exists
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        print("   Build it first:")
        print("   nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu")
        return
    
    # Step 2: Load library
    print("\n1. Loading library...")
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    print("✅ Library loaded")
    
    # Step 3: Get function pointer
    print("\n2. Getting function pointer...")
    func_ptr = lib.XlaGpuSimpleAdd
    func_addr = ctypes.cast(func_ptr, ctypes.c_void_p).value
    print(f"✅ Function at: {hex(func_addr)}")
    
    # Step 4: Create PyCapsule
    print("\n3. Creating PyCapsule...")
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    capsule = PyCapsule_New(func_addr, None, None)
    print(f"✅ PyCapsule created: {type(capsule)}")
    
    # Step 5: Register with XLA
    print("\n4. Registering with XLA...")
    try:
        torch_xla._XLAC._xla_register_custom_call_target(
            "XlaGpuSimpleAdd",  # name
            capsule,            # capsule
            "CUDA"              # platform
        )
        print("✅ Registration successful!")
    except Exception as e:
        print(f"❌ Registration failed: {e}")
        return
    
    # Step 6: Test the custom call
    print("\n5. Testing custom call...")
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    # Create custom call
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
    
    # Check IR
    ir = torch_xla._XLAC._get_xla_tensors_text([result])
    print("\nHLO IR (first 1000 chars):")
    print(ir[:1000])
    print(f"✅ Custom call in IR: {'custom_call' in ir.lower()}")
    
    # Execute
    print("\n6. Executing...")
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
    
    print("\n" + "=" * 60)
    print("Done!")


if __name__ == "__main__":
    main()
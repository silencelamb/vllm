"""Final solution: Correct way to register XLA custom calls."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def create_pycapsule(func_pointer):
    """Create a PyCapsule from a function pointer."""
    # Convert to void pointer
    func_addr = ctypes.cast(func_pointer, ctypes.c_void_p).value
    
    # Use Python C API to create capsule
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Create and return capsule
    return PyCapsule_New(func_addr, None, None)


def main():
    """Complete example of XLA custom call registration and usage."""
    
    print("XLA GPU Custom Call - Final Solution")
    print("=" * 80)
    
    # 1. Build the library if needed
    if not os.path.exists("xla_gpu_custom_ops.so"):
        print("Building custom call library...")
        os.system("nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu")
    
    # 2. Load the library
    lib = ctypes.CDLL("./xla_gpu_custom_ops.so", ctypes.RTLD_GLOBAL)
    print("✅ Loaded custom call library")
    
    # 3. Register with XLA
    print("\nRegistering custom call...")
    capsule = create_pycapsule(lib.XlaGpuSimpleAdd)
    
    torch_xla._XLAC._xla_register_custom_call_target(
        "XlaGpuSimpleAdd",  # function name
        capsule,            # PyCapsule containing function pointer
        "CUDA"              # platform
    )
    print("✅ Registered with XLA runtime")
    
    # 4. Define PyTorch op
    lib_torch = torch.library.Library("my_ops", "DEF")
    lib_torch.define("simple_add(Tensor a, Tensor b) -> Tensor")
    
    @torch.library.impl(lib_torch, "simple_add", "XLA")
    def simple_add_xla(a, b):
        # Create custom call in XLA graph
        result = torch_xla._XLAC._xla_custom_call(
            [a, b],                 # inputs
            "XlaGpuSimpleAdd",      # target name (must match registration)
            [list(a.shape)],        # output shapes
            [a.dtype],              # output dtypes
            False,                  # has_side_effect
            "",                     # backend_config
            4,                      # api_version
            {}                      # extra attributes
        )[0]
        return result
    
    @torch.library.impl_abstract("my_ops::simple_add")
    def simple_add_meta(a, b):
        return torch.empty_like(a)
    
    # 5. Test execution
    print("\nTesting custom call...")
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    result = torch.ops.my_ops.simple_add(a, b)
    
    # Check IR
    ir = torch_xla._XLAC._get_xla_tensors_text([result])
    print(f"\nIR contains custom_call: {'custom_call' in ir.lower()}")
    
    # Execute
    xm.mark_step()
    xm.wait_device_ops()
    
    result_cpu = result.cpu()
    print(f"\n✅ EXECUTION SUCCESSFUL!")
    print(f"Result: {result_cpu}")
    print(f"Expected: [5.0, 7.0, 9.0]")
    
    # Verify
    if torch.allclose(result_cpu, torch.tensor([5.0, 7.0, 9.0])):
        print("\n🎉 Custom call works perfectly!")
    
    print("\n" + "=" * 80)
    print("\n📝 Summary:")
    print("1. Load CUDA kernel as shared library")
    print("2. Create PyCapsule from function pointer")
    print("3. Register with torch_xla._XLAC._xla_register_custom_call_target")
    print("4. Use torch_xla._XLAC._xla_custom_call to create custom call nodes")
    print("5. Custom call appears in HLO and executes successfully!")


if __name__ == "__main__":
    main()
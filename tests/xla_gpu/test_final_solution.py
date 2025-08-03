#!/usr/bin/env python3
"""Final working solution for XLA GPU custom call."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def main():
    print("XLA GPU Custom Call - Final Solution")
    print("=" * 60)
    
    # Step 1: Check library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        print("   Build it with:")
        print("   nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu")
        return
    
    # Step 2: Load and register
    print("1. Loading library...")
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    print(f"   ✅ Function address: {hex(func_addr)}")
    
    print("\n2. Creating PyCapsule...")
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    print("   ✅ PyCapsule created")
    
    print("\n3. Registering with XLA...")
    torch_xla._XLAC._xla_register_custom_call_target(
        "XlaGpuSimpleAdd",
        capsule,
        "CUDA"
    )
    print("   ✅ Registered for CUDA platform")
    
    # Step 3: Create test
    print("\n4. Creating test tensors...")
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    print(f"   Input a: {a}")
    print(f"   Input b: {b}")
    
    # Step 4: Call custom op
    print("\n5. Creating custom call...")
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],               # inputs
        "XlaGpuSimpleAdd",    # op_name -> custom_call_target
        [[3]],                # output_shapes
        [torch.float32],      # output_dtypes
        False,                # has_side_effect
        "",                   # backend_config
        1,                    # api_version (1, 2, or 3)
        {}                    # alias_params
    )[0]
    print("   ✅ Custom call created")
    
    # Step 5: Check HLO
    print("\n6. Checking HLO...")
    hlo = torch_xla._XLAC._get_xla_tensors_hlo([result])
    custom_call_found = False
    for line in hlo.split('\n'):
        if 'custom-call' in line:
            print(f"   HLO: {line.strip()}")
            if 'custom_call_target="XlaGpuSimpleAdd"' in line:
                custom_call_found = True
    
    if custom_call_found:
        print("   ✅ Custom call target found in HLO")
    else:
        print("   ❌ Custom call target NOT found in HLO")
    
    # Step 6: Execute
    print("\n7. Executing...")
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"   ✅ EXECUTION SUCCESSFUL!")
        print(f"   Result: {result_cpu}")
        print(f"   Expected: tensor([5., 7., 9.])")
        
        if torch.allclose(result_cpu, torch.tensor([5., 7., 9.])):
            print("\n🎉 SUCCESS! Custom call works correctly!")
        else:
            print("\n❌ Result mismatch!")
    except Exception as e:
        print(f"   ❌ Execution failed: {e}")
    
    # Summary
    print("\n" + "=" * 60)
    print("Summary:")
    print("- Use _xla_custom_call (not _xla_gpu_custom_call)")
    print("- API version must be 1, 2, or 3 (not 0 or 4)")
    print("- Register with PyCapsule for platform 'CUDA'")
    print("- The op_name parameter becomes custom_call_target in HLO")


def test_with_torch_library():
    """Test integration with torch.library for cleaner API."""
    print("\n\nBonus: Integration with torch.library")
    print("=" * 60)
    
    # Define custom op
    lib = torch.library.Library("myops", "DEF")
    lib.define("simple_add(Tensor a, Tensor b) -> Tensor")
    
    @torch.library.impl(lib, "simple_add", "XLA")
    def simple_add_xla(a, b):
        return torch_xla._XLAC._xla_custom_call(
            [a, b],
            "XlaGpuSimpleAdd",
            [list(a.shape)],
            [a.dtype],
            False,
            "",
            1,  # API version
            {}
        )[0]
    
    # Register fake implementation
    @torch.library.impl_abstract("myops::simple_add")
    def simple_add_meta(a, b):
        return torch.empty_like(a)
    
    # Test
    device = xm.xla_device()
    a = torch.tensor([10., 20., 30.]).to(device)
    b = torch.tensor([1., 2., 3.]).to(device)
    
    result = torch.ops.myops.simple_add(a, b)
    xm.mark_step()
    print(f"torch.ops result: {result.cpu()}")


if __name__ == "__main__":
    main()
    
    # Optional: test torch.library integration
    try:
        test_with_torch_library()
    except Exception as e:
        print(f"\nTorch library test failed: {e}")
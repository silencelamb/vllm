"""Test using triton_kernel_call as the target name since that's what GPU custom call uses."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def main():
    print("XLA Custom Call - Using triton_kernel_call")
    print("=" * 60)
    
    # 1. Load library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    
    # 2. Register with triton_kernel_call name (since that's what BuildGpuCustomCall uses)
    print("\n1. Registering with name 'triton_kernel_call'...")
    
    # Get address of our function
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
    # Create PyCapsule
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    # Register as "triton_kernel_call" since that's what the code expects
    try:
        torch_xla._XLAC._xla_register_custom_call_target(
            "triton_kernel_call",  # This is what BuildGpuCustomCall uses!
            capsule,
            "CUDA"
        )
        print("✅ Registered as 'triton_kernel_call'")
    except Exception as e:
        print(f"❌ Registration failed: {e}")
        return
    
    # 3. Use _xla_gpu_custom_call
    print("\n2. Creating GPU custom call...")
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    # The payload parameter in _xla_gpu_custom_call might need to encode
    # which actual function to call, since everything goes through triton_kernel_call
    result = torch_xla._XLAC._xla_gpu_custom_call(
        [a, b],
        "simple_add",  # This becomes part of the payload
        [[3]],
        [torch.float32]
    )[0]
    
    # 4. Check HLO
    hlo = torch_xla._XLAC._get_xla_tensors_hlo([result])
    print("\n3. HLO output:")
    for line in hlo.split('\n'):
        if 'custom-call' in line or 'triton' in line:
            print(f"  {line.strip()}")
    
    # 5. Execute
    print("\n4. Executing...")
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ EXECUTION SUCCESSFUL!")
        print(f"   Result: {result_cpu}")
    except Exception as e:
        print(f"❌ Execution failed: {e}")
        
        # The issue might be that triton_kernel_call expects a specific
        # payload format that includes the actual kernel to call
        print("\n📝 Note: The triton_kernel_call might expect a specific")
        print("   payload format that we're not providing correctly.")


def test_alternative():
    """Try to understand the payload format."""
    print("\n\n" + "=" * 60)
    print("Alternative: Understanding the payload")
    print("=" * 60)
    
    # The BuildGpuCustomCall passes the payload directly to CustomCallWithLayout
    # For Triton, this payload likely contains the compiled kernel
    # and metadata about how to invoke it
    
    print("\nThe issue is that BuildGpuCustomCall is designed for Triton kernels,")
    print("which have a specific payload format containing the compiled PTX/CUBIN.")
    print("\nFor custom CUDA kernels, we need a different approach:")
    print("1. Modify BuildGpuCustomCall to accept custom target names")
    print("2. Use a different API that allows specifying the target")
    print("3. Register our kernel with a Triton-compatible wrapper")


if __name__ == "__main__":
    main()
    test_alternative()
    
    print("\n\n💡 Solution:")
    print("The current _xla_gpu_custom_call is hardcoded for Triton.")
    print("We need to use _xla_custom_call with proper parameters instead.")
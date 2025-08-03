"""Test torch_xla._XLAC._xla_register_custom_call_target API."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def explore_register_api():
    """Explore the _xla_register_custom_call_target API."""
    
    print("Exploring torch_xla._XLAC._xla_register_custom_call_target")
    print("=" * 60)
    
    # Check if the function exists
    if hasattr(torch_xla._XLAC, '_xla_register_custom_call_target'):
        print("✅ Found _xla_register_custom_call_target!")
        
        # Get function info
        func = torch_xla._XLAC._xla_register_custom_call_target
        print(f"Function: {func}")
        print(f"Type: {type(func)}")
        
        # Try to get docstring
        if hasattr(func, '__doc__') and func.__doc__:
            print(f"\nDocstring:\n{func.__doc__}")
        
        # Try to understand the signature
        try:
            import inspect
            sig = inspect.signature(func)
            print(f"\nSignature: {sig}")
        except:
            print("\nCouldn't get signature with inspect")
            
        return True
    else:
        print("❌ _xla_register_custom_call_target not found")
        
        # List all _xla functions
        print("\nAvailable _xla functions:")
        xlac_funcs = [attr for attr in dir(torch_xla._XLAC) 
                      if attr.startswith('_xla')]
        for func in sorted(xlac_funcs):
            print(f"  - {func}")
        
        return False


def test_register_custom_call():
    """Test registering a custom call target."""
    
    print("\n\nTesting Custom Call Registration")
    print("=" * 60)
    
    # First, load our compiled library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        print("   Build it first with: bash build_and_test.sh")
        return
    
    # Load the library
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    print(f"✅ Loaded library: {lib_path}")
    
    # Get the function pointer
    try:
        # Get function address
        xla_gpu_simple_add = lib.XlaGpuSimpleAdd
        func_addr = ctypes.cast(xla_gpu_simple_add, ctypes.c_void_p).value
        print(f"✅ Found XlaGpuSimpleAdd at address: {hex(func_addr)}")
    except Exception as e:
        print(f"❌ Couldn't find function: {e}")
        return
    
    # Try to register with XLA
    if hasattr(torch_xla._XLAC, '_xla_register_custom_call_target'):
        print("\nAttempting to register custom call...")
        
        try:
            # Try different parameter combinations
            # Option 1: (name, platform, address)
            try:
                torch_xla._XLAC._xla_register_custom_call_target(
                    "XlaGpuSimpleAdd",  # name
                    "CUDA",             # platform
                    func_addr           # function address
                )
                print("✅ Registration successful (name, platform, address)!")
            except Exception as e1:
                print(f"❌ Failed with (name, platform, address): {e1}")
                
                # Option 2: (name, address, platform)
                try:
                    torch_xla._XLAC._xla_register_custom_call_target(
                        "XlaGpuSimpleAdd",  # name
                        func_addr,          # function address
                        "CUDA"              # platform
                    )
                    print("✅ Registration successful (name, address, platform)!")
                except Exception as e2:
                    print(f"❌ Failed with (name, address, platform): {e2}")
                    
                    # Option 3: Just (name, address)
                    try:
                        torch_xla._XLAC._xla_register_custom_call_target(
                            "XlaGpuSimpleAdd",
                            func_addr
                        )
                        print("✅ Registration successful (name, address)!")
                    except Exception as e3:
                        print(f"❌ Failed with (name, address): {e3}")
                        
        except Exception as e:
            print(f"❌ Registration failed: {e}")
    else:
        print("❌ Registration API not available")


def test_custom_call_after_registration():
    """Test if custom call works after registration."""
    
    print("\n\nTesting Custom Call After Registration")
    print("=" * 60)
    
    # Define the op
    lib = torch.library.Library("test_reg", "DEF")
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
    
    @torch.library.impl_abstract("test_reg::simple_add")
    def simple_add_meta(a, b):
        return torch.empty_like(a)
    
    # Test
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    print("Creating custom call...")
    result = torch.ops.test_reg.simple_add(a, b)
    
    # Check IR
    ir = torch_xla._XLAC._get_xla_tensors_text([result])
    print(f"IR contains custom_call: {'custom_call' in ir.lower()}")
    
    # Try execution
    print("\nAttempting execution...")
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ EXECUTION SUCCESSFUL!")
        print(f"Result: {result_cpu}")
        print(f"Expected: {torch.tensor([5.0, 7.0, 9.0])}")
        
        # Verify correctness
        expected = torch.tensor([5.0, 7.0, 9.0])
        if torch.allclose(result_cpu, expected):
            print("✅ Result is correct!")
        else:
            print("❌ Result is incorrect!")
            
    except Exception as e:
        print(f"❌ Execution failed: {str(e)[:200]}...")


if __name__ == "__main__":
    print("PyTorch XLA Custom Call Registration Test")
    print("=" * 80)
    
    # First explore the API
    has_api = explore_register_api()
    
    if has_api:
        # Try to register our custom call
        test_register_custom_call()
        
        # Test if it works
        test_custom_call_after_registration()
    else:
        print("\n❌ Registration API not found in this version of torch_xla")
        print("   You may need a newer version or different build")
    
    print("\n" + "=" * 80)
    print("\n🎯 Key Insight:")
    print("If torch_xla._XLAC._xla_register_custom_call_target exists,")
    print("we can dynamically register custom calls at runtime!")
    print("This would solve the 'No registered implementation' error.")
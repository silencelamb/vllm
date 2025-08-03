"""Test loading XLA custom call and verifying it works."""

import os
import ctypes
import torch
import torch_xla
import torch_xla.core.xla_model as xm


def test_direct_load():
    """Test loading the compiled library directly."""
    
    print("Testing Direct Library Load")
    print("=" * 60)
    
    # Check if library exists
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        print("   Build it first: bash build_and_test.sh")
        return False
    
    # Load the library
    try:
        lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
        print(f"✅ Loaded library: {lib_path}")
        
        # Try to find the symbol
        try:
            func = lib.XlaGpuSimpleAdd
            print(f"✅ Found symbol: XlaGpuSimpleAdd at {hex(ctypes.addressof(func))}")
        except AttributeError:
            print("❌ Symbol XlaGpuSimpleAdd not found in library")
            
            # List available symbols (Linux only)
            try:
                import subprocess
                result = subprocess.run(['nm', '-D', lib_path], capture_output=True, text=True)
                print("\nAvailable symbols:")
                for line in result.stdout.split('\n'):
                    if 'XlaGpu' in line:
                        print(f"  {line}")
            except:
                pass
                
        return True
    except Exception as e:
        print(f"❌ Failed to load library: {e}")
        return False


def test_xla_custom_call():
    """Test XLA custom call with loaded library."""
    
    print("\n\nTesting XLA Custom Call")
    print("=" * 60)
    
    # Define the op
    lib = torch.library.Library("test_load", "DEF")
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
    
    @torch.library.impl_abstract("test_load::simple_add")
    def simple_add_meta(a, b):
        return torch.empty_like(a)
    
    # Test
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    print(f"Device: {device}")
    print(f"Inputs: a={a}, b={b}")
    
    # Create custom call
    result = torch.ops.test_load.simple_add(a, b)
    
    # Check IR
    ir = torch_xla._XLAC._get_xla_tensors_text([result])
    print(f"\nIR contains custom_call: {'custom_call' in ir.lower()}")
    
    # Try to execute
    print("\nAttempting execution...")
    try:
        xm.mark_step()
        xm.wait_device_ops()
        result_cpu = result.cpu()
        print(f"✅ Execution successful!")
        print(f"Result: {result_cpu}")
        print(f"Expected: {torch.tensor([5.0, 7.0, 9.0])}")
    except Exception as e:
        print(f"❌ Execution failed: {str(e)[:200]}...")
        
        # Check environment
        print("\nEnvironment check:")
        print(f"LD_PRELOAD: {os.environ.get('LD_PRELOAD', 'Not set')}")
        print(f"LD_LIBRARY_PATH: {os.environ.get('LD_LIBRARY_PATH', 'Not set')}")
        
        print("\nTry running with:")
        print(f"  LD_PRELOAD={os.path.abspath(lib_path)} python {__file__}")


if __name__ == "__main__":
    # First build the library if needed
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print("Building library first...")
        os.system("bash build_and_test.sh")
    
    # Test loading
    if test_direct_load():
        test_xla_custom_call()
    
    print("\n" + "=" * 60)
    print("\n📝 Notes:")
    print("1. Library must be loaded with RTLD_GLOBAL for XLA to find symbols")
    print("2. Symbol must match exactly: 'XlaGpuSimpleAdd'")
    print("3. Use LD_PRELOAD to force early loading if needed")
    print("4. XLA may have its own symbol resolution mechanism")
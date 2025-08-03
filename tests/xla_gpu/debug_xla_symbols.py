"""Debug XLA symbol loading and custom call registration."""

import os
import sys
import ctypes
import torch
import torch_xla
import torch_xla.core.xla_model as xm


def check_xla_custom_call_registry():
    """Try to access XLA's custom call registry."""
    
    print("Checking XLA Custom Call Registry")
    print("=" * 60)
    
    # Try to find XLA libraries
    try:
        # Look for pytorch_xla library
        import torch_xla._XLAC
        print(f"✅ Found torch_xla._XLAC module")
        
        # Check for custom call related functions
        xlac_attrs = dir(torch_xla._XLAC)
        custom_call_attrs = [attr for attr in xlac_attrs if 'custom' in attr.lower()]
        print(f"\nCustom call related attributes:")
        for attr in custom_call_attrs:
            print(f"  - {attr}")
            
    except Exception as e:
        print(f"❌ Error accessing XLA: {e}")
    
    # Try to find XLA shared libraries
    print("\n\nLooking for XLA shared libraries...")
    try:
        import subprocess
        result = subprocess.run(['ldd', sys.executable], capture_output=True, text=True)
        xla_libs = [line for line in result.stdout.split('\n') if 'xla' in line.lower()]
        for lib in xla_libs:
            print(f"  {lib}")
    except:
        pass


def test_symbol_visibility():
    """Test if our custom call symbol is visible."""
    
    print("\n\nTesting Symbol Visibility")
    print("=" * 60)
    
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return
    
    # Method 1: ctypes with RTLD_GLOBAL
    print("\n1. Loading with ctypes.RTLD_GLOBAL:")
    try:
        lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
        print(f"   ✅ Library loaded")
        
        # Check if symbol exists
        try:
            func = lib.XlaGpuSimpleAdd
            print(f"   ✅ Symbol found: XlaGpuSimpleAdd")
        except:
            print(f"   ❌ Symbol not found")
    except Exception as e:
        print(f"   ❌ Failed: {e}")
    
    # Method 2: torch.ops.load_library
    print("\n2. Loading with torch.ops.load_library:")
    try:
        torch.ops.load_library(lib_path)
        print(f"   ✅ Library loaded")
    except Exception as e:
        print(f"   ❌ Failed: {e}")
    
    # Method 3: Check global symbols
    print("\n3. Checking global symbols:")
    try:
        # This checks if symbol is globally visible
        import subprocess
        result = subprocess.run(
            ['nm', '-D', '/proc/self/exe'], 
            capture_output=True, 
            text=True
        )
        if 'XlaGpuSimpleAdd' in result.stdout:
            print("   ✅ Symbol is globally visible")
        else:
            print("   ❌ Symbol not in global namespace")
    except:
        pass


def test_minimal_custom_call():
    """Test the simplest possible custom call."""
    
    print("\n\nTesting Minimal Custom Call")
    print("=" * 60)
    
    device = xm.xla_device()
    
    # Create simple tensors
    a = torch.tensor([1.0]).to(device)
    b = torch.tensor([2.0]).to(device)
    
    # Direct custom call
    print("Creating custom call...")
    try:
        result = torch_xla._XLAC._xla_custom_call(
            [a, b],
            "XlaGpuSimpleAdd",
            [[1]],  # shape
            [torch.float32],  # dtype
            False,  # has_side_effect
            "",  # backend_config
            4,  # api_version
            {}  # extra_attrs
        )[0]
        
        print("✅ Custom call created")
        
        # Get IR
        ir = torch_xla._XLAC._get_xla_tensors_text([result])
        print(f"\nIR: {ir[:200]}...")
        
        # Try execution
        print("\nExecuting...")
        xm.mark_step()
        print("✅ Execution completed (check for errors)")
        
    except Exception as e:
        print(f"❌ Error: {e}")


def suggest_solutions():
    """Suggest possible solutions."""
    
    print("\n\nPossible Solutions")
    print("=" * 60)
    
    print("""
1. **LD_PRELOAD Method** (Current approach):
   LD_PRELOAD=./xla_gpu_custom_ops.so python script.py
   
2. **Link with pytorch_xla**:
   The symbol needs to be available when XLA runtime looks for it.
   This might require rebuilding pytorch_xla with the custom call.
   
3. **Use XLA Plugin System** (if available):
   Some XLA versions support dynamic plugin loading.
   
4. **Alternative Approach**:
   Instead of custom call, use regular PyTorch ops that XLA can compile.
   
5. **Debug XLA Loading**:
   Set environment variables:
   - XLA_FLAGS=--xla_dump_to=/tmp/xla_dump
   - TF_CPP_VMODULE=custom_call_registry=3
   
6. **Check XLA Version**:
   Different XLA versions may have different registration mechanisms.
""")


if __name__ == "__main__":
    # Set debug flags
    os.environ['TF_CPP_MIN_LOG_LEVEL'] = '0'  # Show all TF logs
    os.environ['TF_CPP_VMODULE'] = 'custom_call=3'  # Verbose custom call logs
    
    print("XLA Custom Call Debug Tool")
    print("=" * 80)
    
    check_xla_custom_call_registry()
    test_symbol_visibility()
    test_minimal_custom_call()
    suggest_solutions()
    
    print("\n" + "=" * 80)
    print("\nConclusion:")
    print("The issue is that XLA's runtime custom call registry is separate from")
    print("the process's symbol table. Loading a .so file makes symbols available") 
    print("to dlsym(), but XLA needs explicit registration through its API.")
    print("\nFor production use, consider using regular PyTorch ops instead of")
    print("custom calls, unless you can modify pytorch_xla's build.")
#!/usr/bin/env python3
"""Test XLA custom call with torch.compile(backend='openxla')."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def setup_custom_call():
    """Setup the custom call registration."""
    print("Setting up custom call...")
    
    # Load library
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return False
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
    # Create PyCapsule
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
    print("✅ Custom call registered")
    return True


def test_direct_xla():
    """Test using direct XLA API."""
    print("\n1. Testing Direct XLA API")
    print("=" * 60)
    
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],
        "XlaGpuSimpleAdd",
        [[3]],
        [torch.float32],
        False,
        "",
        1,
        {}
    )[0]
    
    xm.mark_step()
    result_cpu = result.cpu()
    print(f"✅ Direct XLA Result: {result_cpu}")
    

def test_torch_compile_with_custom_op():
    """Test using torch.compile with custom op."""
    print("\n2. Testing torch.compile with Custom Op")
    print("=" * 60)
    
    # Define a custom op using torch.library
    lib = torch.library.Library("custom_xla", "DEF")
    lib.define("gpu_add(Tensor a, Tensor b) -> Tensor")
    
    # Implementation for XLA
    @torch.library.impl(lib, "gpu_add", "XLA")
    def gpu_add_xla(a, b):
        return torch_xla._XLAC._xla_custom_call(
            [a, b],
            "XlaGpuSimpleAdd",
            [list(a.shape)],
            [a.dtype],
            False,
            "",
            1,
            {}
        )[0]
    
    # Abstract implementation
    @torch.library.impl_abstract("custom_xla::gpu_add")
    def gpu_add_meta(a, b):
        return torch.empty_like(a)
    
    # CPU fallback (for comparison)
    @torch.library.impl(lib, "gpu_add", "CPU")
    def gpu_add_cpu(a, b):
        return a + b
    
    # Create a function that uses the custom op
    def my_function(x, y):
        return torch.ops.custom_xla.gpu_add(x, y)
    
    # Test 1: Without compilation (direct call)
    print("\n2a. Testing custom op without compilation:")
    try:
        device = xm.xla_device()
        a = torch.tensor([1.0, 2.0, 3.0]).to(device)
        b = torch.tensor([4.0, 5.0, 6.0]).to(device)
        
        result = my_function(a, b)
        xm.mark_step()
        print(f"✅ Direct custom op result: {result.cpu()}")
    except Exception as e:
        print(f"❌ Direct custom op failed: {e}")
    
    # Test 2: With torch.compile(backend='openxla')
    print("\n2b. Testing with torch.compile(backend='openxla'):")
    try:
        # Compile the function
        compiled_fn = torch.compile(my_function, backend='openxla')
        
        # Use CPU tensors (torch.compile will handle device placement)
        a_cpu = torch.tensor([1.0, 2.0, 3.0])
        b_cpu = torch.tensor([4.0, 5.0, 6.0])
        
        result = compiled_fn(a, b)
        print(f"✅ Compiled result: {result}")
        
        # Check if custom call was used
        # Note: torch.compile might optimize away the custom call
        # or use a different execution path
        
    except Exception as e:
        print(f"❌ torch.compile failed: {e}")
        import traceback
        traceback.print_exc()


def test_torch_compile_direct():
    """Test torch.compile with direct tensor operations."""
    print("\n3. Testing torch.compile with Direct Operations")
    print("=" * 60)
    
    def add_function(a, b):
        # This won't use our custom call directly
        # torch.compile will lower this to XLA ops
        return a + b
    
    compiled_add = torch.compile(add_function, backend='openxla')
    
    a = torch.tensor([1.0, 2.0, 3.0])
    b = torch.tensor([4.0, 5.0, 6.0])
    
    result = compiled_add(a, b)
    print(f"✅ torch.compile direct add: {result}")


def test_fallback_behavior():
    """Test how torch.compile handles unsupported ops."""
    print("\n4. Testing Fallback Behavior")
    print("=" * 60)
    
    # Create a function that mixes standard ops with custom ops
    def mixed_function(x, y):
        # Standard operation
        z = x * 2
        # Custom operation (if registered)
        if hasattr(torch.ops, 'custom_xla') and hasattr(torch.ops.custom_xla, 'gpu_add'):
            result = torch.ops.custom_xla.gpu_add(z, y)
        else:
            result = z + y
        # Another standard operation
        return result / 2
    
    try:
        compiled_fn = torch.compile(mixed_function, backend='openxla')
        
        a = torch.tensor([1.0, 2.0, 3.0])
        b = torch.tensor([4.0, 5.0, 6.0])
        
        result = compiled_fn(a, b)
        print(f"✅ Mixed function result: {result}")
        
        # Expected: ((a * 2) + b) / 2 = (a + b/2)
        expected = torch.tensor([3.0, 4.5, 6.0])
        if torch.allclose(result, expected):
            print("✅ Result matches expected value")
        
    except Exception as e:
        print(f"❌ Mixed function failed: {e}")


def main():
    print("XLA Custom Call with torch.compile")
    print("=" * 80)
    
    # Setup custom call
    if not setup_custom_call():
        return
    
    # Run tests
    test_direct_xla()
    test_torch_compile_with_custom_op()
    test_torch_compile_direct()
    test_fallback_behavior()
    
    print("\n" + "=" * 80)
    print("\n📝 Key Points:")
    print("1. torch.compile(backend='openxla') creates a different execution path")
    print("2. Custom ops need to be registered with torch.library for torch.compile")
    print("3. Direct XLA tensor operations bypass torch.compile's graph capture")
    print("4. torch.compile may optimize away custom calls if equivalent ops exist")
    print("\n💡 Recommendations:")
    print("- For torch.compile: Use torch.library to register custom ops")
    print("- For direct XLA: Use XLA tensors and xm.mark_step()")
    print("- Custom calls work best with direct XLA API usage")


if __name__ == "__main__":
    main()
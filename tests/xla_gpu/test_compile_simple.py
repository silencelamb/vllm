#!/usr/bin/env python3
"""Simple test to check torch.compile behavior with custom ops."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


def setup():
    """Setup custom call registration."""
    lib_path = "./xla_gpu_custom_ops.so"
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return False
    
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    torch_xla._XLAC._xla_register_custom_call_target(
        "XlaGpuSimpleAdd",
        capsule,
        "CUDA"
    )
    return True


def test_compile_compatibility():
    """Test if torch.compile can work with XLA custom ops."""
    print("Testing torch.compile Compatibility")
    print("=" * 60)
    
    # Register a custom op
    if hasattr(torch.ops, 'test_ops'):
        delattr(torch.ops, 'test_ops')
    
    lib = torch.library.Library("test_ops", "DEF")
    lib.define("my_add(Tensor a, Tensor b) -> Tensor")
    
    # Implement for different backends
    @torch.library.impl(lib, "my_add", "CompositeExplicitAutograd")
    def my_add_default(a, b):
        # Default implementation
        return a + b
    
    # Test function
    def test_fn(x, y):
        z = x * 2  # Standard op
        return torch.ops.test_ops.my_add(z, y)  # Custom op
    
    # Test 1: Without compilation
    print("\n1. Without compilation:")
    a = torch.tensor([1.0, 2.0, 3.0])
    b = torch.tensor([4.0, 5.0, 6.0])
    result = test_fn(a, b)
    print(f"   Result: {result}")
    print(f"   Expected: {torch.tensor([6.0, 9.0, 12.0])}")
    
    # Test 2: With torch.compile
    print("\n2. With torch.compile(backend='openxla'):")
    try:
        import torch._dynamo
        torch._dynamo.reset()  # Clear any cached graphs
        
        compiled_fn = torch.compile(test_fn, backend='openxla')
        result = compiled_fn(a, b)
        print(f"   Result: {result}")
        print("   ✅ torch.compile succeeded")
        
        # Check if it actually used XLA
        print("\n3. Checking XLA usage:")
        # This is tricky - torch.compile might not expose XLA details directly
        
    except Exception as e:
        print(f"   ❌ torch.compile failed: {e}")
        
        # Try alternative backend
        print("\n   Trying with backend='inductor':")
        try:
            compiled_fn = torch.compile(test_fn, backend='inductor')
            result = compiled_fn(a, b)
            print(f"   Result: {result}")
        except Exception as e2:
            print(f"   ❌ Inductor also failed: {e2}")


def test_xla_integration():
    """Test XLA-specific integration."""
    print("\n\nTesting XLA-Specific Integration")
    print("=" * 60)
    
    # For XLA backend in torch.compile, we need XLA-aware ops
    @torch.library.custom_op("test_ops::xla_add", mutates_args=())
    def xla_add(a: torch.Tensor, b: torch.Tensor) -> torch.Tensor:
        # This will be replaced by implementations
        return a + b
    
    @xla_add.register_fake
    def _(a, b):
        return torch.empty_like(a)
    
    # Try to register XLA implementation
    try:
        @xla_add.register_kernel("cuda")
        def _(a, b):
            # In real scenario, this would call XLA custom call
            # For now, just do regular add
            return a + b
        
        print("✅ Registered CUDA kernel for custom op")
    except Exception as e:
        print(f"❌ Failed to register CUDA kernel: {e}")
    
    # Test the op
    def test_xla_fn(x, y):
        return torch.ops.test_ops.xla_add(x, y)
    
    a = torch.tensor([1.0, 2.0, 3.0])
    b = torch.tensor([4.0, 5.0, 6.0])
    
    # Direct call
    print("\nDirect call:")
    result = test_xla_fn(a, b)
    print(f"Result: {result}")
    
    # With compile
    print("\nWith torch.compile:")
    try:
        compiled_xla_fn = torch.compile(test_xla_fn, backend='openxla')
        result = compiled_xla_fn(a, b)
        print(f"Result: {result}")
    except Exception as e:
        print(f"Failed: {e}")


def main():
    if not setup():
        return
    
    print("torch.compile vs Direct XLA Analysis")
    print("=" * 80)
    
    # Check if openxla backend is available
    print("\nChecking available backends:")
    try:
        from torch._dynamo import list_backends
        backends = list_backends()
        print(f"Available backends: {backends}")
        
        if 'openxla' in backends:
            print("✅ openxla backend is available")
        else:
            print("❌ openxla backend NOT available")
            print("   You may need to install torch-xla with openxla support")
    except:
        print("❌ Could not list backends")
    
    # Run tests
    test_compile_compatibility()
    test_xla_integration()
    
    print("\n" + "=" * 80)
    print("\n📝 Summary:")
    print("1. torch.compile with 'openxla' backend requires special setup")
    print("2. Custom ops need to be registered via torch.library")
    print("3. Direct XLA API usage is more straightforward for custom kernels")
    print("4. For vLLM, recommend using direct XLA API approach")


if __name__ == "__main__":
    main()
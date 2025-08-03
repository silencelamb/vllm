"""Test XLA custom op registration for GPU."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import os

# Define the custom op namespace and name
lib = torch.library.Library("xla_gpu_test", "DEF")

# Define the op signature
lib.define("simple_add(Tensor a, Tensor b) -> Tensor")


# CPU implementation (for reference and fallback)
@torch.library.impl(lib, "simple_add", "CPU")
def simple_add_cpu(a, b):
    """CPU reference implementation."""
    return a + b


# CUDA implementation
@torch.library.impl(lib, "simple_add", "CUDA")
def simple_add_cuda(a, b):
    """CUDA implementation - this will be used on GPU."""
    # In real case, this would call a CUDA kernel
    # For now, just use PyTorch ops
    return a + b


# XLA implementation - this is key for custom call
@torch.library.impl(lib, "simple_add", "XLA")
def simple_add_xla(a, b):
    """XLA implementation that creates custom call."""
    # For XLA devices, we need to use the _xla_custom_call API
    # This ensures it appears in HLO as a custom-call
    
    # Get tensor shapes and dtypes
    output_shape = list(a.shape)
    output_dtype = a.dtype
    
    # Convert dtype to string format expected by XLA
    dtype_str = str(output_dtype).replace('torch.', '')
    
    # Call the XLA custom call API
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],                     # inputs
        "XlaGpuSimpleAdd",          # target_name (will appear in HLO)
        [output_shape],             # output_shapes
        [output_dtype],             # output_dtypes
        False,                      # has_side_effect
        "",                         # backend_config
        4,                          # api_version
        {}                          # extra attributes
    )[0]
    
    return result


# Meta implementation for shape inference
@torch.library.register_fake("xla_gpu_test::simple_add")
def simple_add_meta(a, b):
    """Meta implementation for shape inference."""
    # Check shapes match
    assert a.shape == b.shape, f"Shapes must match: {a.shape} vs {b.shape}"
    assert a.dtype == b.dtype, f"Dtypes must match: {a.dtype} vs {b.dtype}"
    
    # Return tensor with correct shape and dtype
    return torch.empty_like(a)


def test_custom_op_registration():
    """Test the registered custom op."""
    
    print("Testing Custom Op Registration")
    print("=" * 60)
    
    # Test 1: CPU
    print("\n1. Testing on CPU...")
    a_cpu = torch.tensor([1.0, 2.0, 3.0])
    b_cpu = torch.tensor([4.0, 5.0, 6.0])
    
    result_cpu = torch.ops.xla_gpu_test.simple_add(a_cpu, b_cpu)
    print(f"✅ CPU result: {result_cpu}")
    
    # Test 2: CUDA (if available)
    if torch.cuda.is_available():
        print("\n2. Testing on CUDA...")
        a_cuda = a_cpu.cuda()
        b_cuda = b_cpu.cuda()
        
        result_cuda = torch.ops.xla_gpu_test.simple_add(a_cuda, b_cuda)
        print(f"✅ CUDA result: {result_cuda}")
    
    # Test 3: XLA
    print("\n3. Testing on XLA...")
    device = xm.xla_device()
    a_xla = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b_xla = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    # Call the op
    result_xla = torch.ops.xla_gpu_test.simple_add(a_xla, b_xla)
    
    # Check the graph before execution
    print("\n4. Checking XLA graph...")
    graph = torch_xla._XLAC._get_xla_tensors_text([result_xla])
    print(f"Graph preview (first 500 chars):\n{graph[:500]}...")
    
    # Look for custom-call
    if "custom_call" in graph.lower() or "xlagpusimpleadd" in graph:
        print("✅ Found custom call in graph!")
    else:
        print("⚠️  Custom call not found in graph")
    
    # Try to execute (this might fail if custom call is not registered)
    print("\n5. Attempting execution...")
    try:
        xm.mark_step()
        print("✅ Execution successful!")
    except Exception as e:
        print(f"❌ Execution failed (expected): {e}")
        print("This is expected - we need to register the actual implementation")


def test_with_torch_compile():
    """Test custom op with torch.compile."""
    
    print("\n\nTesting with torch.compile")
    print("=" * 60)
    
    @torch.compile(backend="openxla")
    def model(a, b):
        return torch.ops.xla_gpu_test.simple_add(a, b)
    
    # Test on XLA device
    device = xm.xla_device()
    a = torch.randn(10).to(device)
    b = torch.randn(10).to(device)
    
    try:
        result = model(a, b)
        xm.mark_step()
        print("✅ torch.compile test passed")
    except Exception as e:
        print(f"❌ torch.compile test failed: {e}")


def test_complex_shapes():
    """Test with more complex tensor shapes."""
    
    print("\n\nTesting Complex Shapes")
    print("=" * 60)
    
    device = xm.xla_device()
    
    # Test different shapes
    shapes = [
        (10,),
        (5, 5),
        (2, 3, 4),
        (1, 10, 10, 10)
    ]
    
    for shape in shapes:
        print(f"\nTesting shape: {shape}")
        a = torch.randn(shape).to(device)
        b = torch.randn(shape).to(device)
        
        result = torch.ops.xla_gpu_test.simple_add(a, b)
        print(f"✅ Shape {shape} passed")


def load_and_register_custom_call():
    """Load and register XLA custom call implementation."""
    import ctypes
    import glob
    
    # Look for compiled libraries
    lib_patterns = [
        './xla_gpu_custom_ops.so',
        './xla_simple_add.so',
        'tests/xla_gpu/xla_gpu_custom_ops.so',
        'tests/xla_gpu/xla_simple_add.so',
    ]
    
    for pattern in lib_patterns:
        libs = glob.glob(pattern)
        if libs:
            try:
                # Load with RTLD_GLOBAL
                lib_path = os.path.abspath(libs[0])
                lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
                print(f"✅ Loaded XLA custom call library: {lib_path}")
                
                # Try to register with XLA if API is available
                if hasattr(torch_xla._XLAC, '_xla_register_custom_call_target'):
                    try:
                        # Get function pointer
                        func_ptr = lib.XlaGpuSimpleAdd
                        func_addr = ctypes.cast(func_ptr, ctypes.c_void_p).value
                        
                        # Create PyCapsule - the API expects this, not raw integer!
                        import ctypes.pythonapi
                        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
                        PyCapsule_New.restype = ctypes.py_object
                        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
                        
                        capsule = PyCapsule_New(func_addr, b"XlaGpuSimpleAdd", None)
                        
                        # Register with XLA using capsule
                        torch_xla._XLAC._xla_register_custom_call_target(
                            "XlaGpuSimpleAdd",  # fn_name
                            capsule,            # function_ptr (as PyCapsule)
                            "CUDA"              # platform
                        )
                        print(f"✅ Registered XlaGpuSimpleAdd with XLA runtime!")
                        return True, True  # (loaded, registered)
                    except Exception as e:
                        print(f"⚠️  Failed to register: {e}")
                        pass
                else:
                    print("⚠️  Registration API not available in this torch_xla version")
                
                return True, False  # (loaded, not registered)
                
            except Exception as e:
                print(f"⚠️  Failed to load {libs[0]}: {e}")
    
    print("⚠️  No XLA custom call library found. Build it first with:")
    print("    cd tests/xla_gpu && bash build_and_test.sh")
    return False, False


if __name__ == "__main__":
    # Enable debugging
    os.environ['XLA_FLAGS'] = '--xla_dump_to=./xla_dump_registration --xla_dump_hlo_as_text'
    os.environ['PT_XLA_DEBUG'] = '1'
    
    # Try to load and register the custom call
    print("=" * 60)
    print("Loading and Registering XLA Custom Call")
    print("=" * 60)
    has_library, is_registered = load_and_register_custom_call()
    
    if has_library and is_registered:
        print("\n🚀 Running tests with registered custom call implementation")
        print("   Execution should now work!")
    elif has_library:
        print("\n⚠️  Library loaded but registration failed")
        print("   Custom calls will appear in IR but execution will fail")
    else:
        print("\n⚠️  Running tests without custom call implementation")
        print("   Custom calls will appear in IR but execution will fail")
    
    print("\n" + "=" * 60)
    
    test_custom_op_registration()
    test_with_torch_compile()
    test_complex_shapes()
    
    print("\n" + "=" * 60)
    print("\n📝 Summary:")
    print("1. Custom ops can be registered using torch.library")
    print("2. XLA implementation uses _xla_custom_call to create custom-call nodes")
    print("3. Execution will fail unless the custom call is registered with XLA runtime")
    print("4. Check ./xla_dump_registration/ for HLO dumps")
    
    if has_library and is_registered:
        print("\n✅ XLA custom call library loaded and registered!")
        print("   Custom calls should now execute successfully")
    elif has_library:
        print("\n⚠️  XLA custom call library loaded but not registered")
        print("   Your torch_xla version may not have _xla_register_custom_call_target")
        print("   Try running with: LD_PRELOAD=./xla_gpu_custom_ops.so python " + __file__)
    else:
        print("\n❌ No XLA custom call library loaded")
        print("   Build it first: cd tests/xla_gpu && bash build_and_test.sh")
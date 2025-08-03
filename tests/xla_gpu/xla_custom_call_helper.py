"""Helper functions for XLA custom call registration."""

import ctypes
import torch_xla._XLAC


def create_capsule_from_function(func_pointer):
    """
    Create a PyCapsule from a ctypes function pointer.
    
    Args:
        func_pointer: A ctypes function pointer (e.g., lib.FunctionName)
    
    Returns:
        PyCapsule object suitable for _xla_register_custom_call_target
    """
    # Get raw address
    func_addr = ctypes.cast(func_pointer, ctypes.c_void_p).value
    
    # Use Python C API to create capsule
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    # Create capsule (name can be None)
    capsule = PyCapsule_New(func_addr, None, None)
    
    return capsule


def register_xla_custom_call(name, library_path, function_name, platform="CUDA"):
    """
    Register a custom call from a shared library with XLA.
    
    Args:
        name: Name to register the custom call as (used in _xla_custom_call)
        library_path: Path to the .so file containing the function
        function_name: Name of the function in the library
        platform: Target platform ("CUDA" for GPU, "Host" for CPU)
    
    Returns:
        True if successful, False otherwise
    """
    try:
        # Load library
        lib = ctypes.CDLL(library_path, ctypes.RTLD_GLOBAL)
        
        # Get function
        func = getattr(lib, function_name)
        
        # Create capsule
        capsule = create_capsule_from_function(func)
        
        # Register with XLA
        torch_xla._XLAC._xla_register_custom_call_target(name, capsule, platform)
        
        print(f"✅ Registered {name} for platform {platform}")
        return True
        
    except Exception as e:
        print(f"❌ Failed to register {name}: {e}")
        return False


# Convenience function for the most common case
def register_cuda_custom_call(name, library_path, function_name=None):
    """
    Register a CUDA custom call.
    
    Args:
        name: Name to register (also used as function name if not specified)
        library_path: Path to .so file
        function_name: Function name in library (defaults to name)
    """
    if function_name is None:
        function_name = name
    
    return register_xla_custom_call(name, library_path, function_name, "CUDA")


# Example usage
if __name__ == "__main__":
    print("XLA Custom Call Helper")
    print("=" * 60)
    
    # Example 1: Simple registration
    print("\nExample 1: Simple registration")
    success = register_cuda_custom_call(
        "XlaGpuSimpleAdd",
        "./xla_gpu_custom_ops.so"
    )
    
    if success:
        print("You can now use this in XLA:")
        print("""
result = torch_xla._XLAC._xla_custom_call(
    [a, b],
    "XlaGpuSimpleAdd",
    [output_shape],
    [output_dtype],
    False, "", 4, {}
)[0]
""")
    
    # Example 2: Manual registration
    print("\nExample 2: Manual registration")
    try:
        lib = ctypes.CDLL("./xla_gpu_custom_ops.so", ctypes.RTLD_GLOBAL)
        capsule = create_capsule_from_function(lib.XlaGpuSimpleAdd)
        torch_xla._XLAC._xla_register_custom_call_target(
            "MyCustomOp", capsule, "CUDA"
        )
        print("✅ Manual registration successful")
    except Exception as e:
        print(f"❌ Manual registration failed: {e}")
#!/usr/bin/env python3
"""Simple test for RMS Norm XLA custom call - following the working example."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os
import struct


def compile_and_load_library():
    """Compile and load the RMS norm custom call library."""
    print("Compiling RMS norm custom call library...")
    
    # Simple compilation command
    compile_cmd = """
    nvcc -O3 -shared -fPIC \
        -gencode arch=compute_80,code=sm_80 \
        -o rms_norm_xla.so \
        csrc/xla_rms_norm_simple.cu \
        -I/usr/local/cuda/include \
        -lcudart
    """
    
    ret = os.system(compile_cmd)
    if ret != 0:
        print("❌ Compilation failed")
        return None
    
    print("✅ Compilation successful")
    return "./rms_norm_xla.so"


def setup_custom_call(lib_path):
    """Setup the custom call registration."""
    print("Setting up custom call...")
    
    if not os.path.exists(lib_path):
        print(f"❌ Library not found: {lib_path}")
        return False
    
    # Load library
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    
    # Get function address
    func_addr = ctypes.cast(lib.rms_norm_xla_custom_call, ctypes.c_void_p).value
    
    # Create PyCapsule
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    # Register with XLA
    torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_rms_norm_cuda",
        capsule,
        "CUDA"
    )
    print("✅ Custom call registered")
    return True


def rms_norm_xla_simple(input, weight, epsilon=1e-5):
    """Simple RMS norm using XLA custom call."""
    
    # Reshape to 2D
    original_shape = input.shape
    hidden_size = input.shape[-1]
    batch_size = input.numel() // hidden_size
    input_2d = input.reshape(batch_size, hidden_size)
    
    # Create descriptor
    descriptor = struct.pack('fqqi', epsilon, batch_size, hidden_size, 0)
    
    # Call XLA custom call
    outputs = torch_xla._XLAC._xla_custom_call(
        [input_2d, weight],
        "vllm_rms_norm_cuda",
        [list(input_2d.shape)],
        [input.dtype],
        False,
        descriptor,
        1,
        {}
    )
    
    result = outputs[0]
    return result.reshape(original_shape)


def test_direct_xla():
    """Test using direct XLA API."""
    print("\n1. Testing Direct XLA API")
    print("=" * 60)
    
    device = xm.xla_device()
    
    # Test data
    batch_size, seq_len, hidden_size = 2, 128, 512
    epsilon = 1e-5
    
    input_xla = torch.randn(batch_size, seq_len, hidden_size, device=device)
    weight_xla = torch.randn(hidden_size, device=device)
    
    try:
        result = rms_norm_xla_simple(input_xla, weight_xla, epsilon)
        xm.mark_step()
        
        print(f"✅ Direct XLA custom call successful")
        print(f"   Input shape: {input_xla.shape}")
        print(f"   Output shape: {result.shape}")
        
        # Compare with reference
        def reference_rms_norm(input, weight, eps):
            variance = input.pow(2).mean(-1, keepdim=True)
            normalized = input * torch.rsqrt(variance + eps)
            return normalized * weight
        
        expected = reference_rms_norm(input_xla, weight_xla, epsilon)
        xm.mark_step()
        
        diff = torch.abs(result - expected).max().item()
        print(f"   Max difference from reference: {diff:.2e}")
        
        if diff < 1e-3:
            print("   ✅ Results match reference implementation")
        
    except Exception as e:
        print(f"❌ Direct XLA call failed: {e}")


def test_with_torch_compile():
    """Test using torch.compile with custom op."""
    print("\n2. Testing with torch.compile")
    print("=" * 60)
    
    # Register as torch.library custom op
    lib = torch.library.Library("vllm_xla", "DEF")
    lib.define("rms_norm(Tensor input, Tensor weight, float epsilon) -> Tensor")
    
    @torch.library.impl(lib, "rms_norm", "XLA")
    def rms_norm_xla_impl(input, weight, epsilon):
        return rms_norm_xla_simple(input, weight, epsilon)
    
    @torch.library.register_fake("vllm_xla::rms_norm")
    def rms_norm_meta(input, weight, epsilon):
        return torch.empty_like(input)
    
    # Function to compile
    def my_model(x, w, eps=1e-5):
        # Mix of standard ops and custom op
        x = x * 2  # Standard op
        x = torch.ops.vllm_xla.rms_norm(x, w, eps)  # Custom op
        return x + 1  # Standard op
    
    try:
        device = xm.xla_device()
        input_xla = torch.randn(2, 128, 512, device=device)
        weight_xla = torch.randn(512, device=device)
        
        # Compile
        compiled_fn = torch.compile(my_model, backend='openxla')
        
        # Run
        result = compiled_fn(input_xla, weight_xla)
        xm.mark_step()
        
        print(f"✅ torch.compile with custom op successful")
        print(f"   Output shape: {result.shape}")
        
    except Exception as e:
        print(f"❌ torch.compile failed: {e}")


def main():
    print("Simple RMS Norm XLA Custom Call Test")
    print("=" * 80)
    
    # Try to compile library
    lib_path = compile_and_load_library()
    if not lib_path:
        # Use pre-compiled if available
        lib_path = "./rms_norm_xla.so"
    
    # Setup custom call
    if not setup_custom_call(lib_path):
        print("\n⚠️ Failed to setup custom call")
        print("Make sure the library is compiled:")
        print("  nvcc -shared -fPIC -o rms_norm_xla.so csrc/xla_rms_norm_simple.cu")
        return
    
    # Run tests
    test_direct_xla()
    test_with_torch_compile()
    
    print("\n" + "=" * 80)
    print("✅ Tests completed")


if __name__ == "__main__":
    main()
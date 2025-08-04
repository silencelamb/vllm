#!/usr/bin/env python3
"""Working RMS Norm XLA custom call test - following the successful pattern."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os
import struct
import numpy as np


def compile_library():
    """Compile the RMS norm library if needed."""
    lib_path = "./rms_norm_cuda.so"
    
    if os.path.exists(lib_path):
        print(f"✓ Using existing library: {lib_path}")
        return lib_path
    
    print("Compiling RMS norm library...")
    
    # Create a simple CUDA file
    cuda_code = """
#include <cuda_runtime.h>
#include <cstdint>

extern "C" {

__global__ void rms_norm_kernel(
    float* out,
    const float* input, 
    const float* weight,
    float epsilon,
    int batch_size,
    int hidden_size) {
    
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= batch_size * hidden_size) return;
    
    int batch_idx = idx / hidden_size;
    int hidden_idx = idx % hidden_size;
    
    // Compute RMS for this batch element
    float sum_sq = 0.0f;
    for (int i = 0; i < hidden_size; i++) {
        float val = input[batch_idx * hidden_size + i];
        sum_sq += val * val;
    }
    float rms = rsqrtf(sum_sq / hidden_size + epsilon);
    
    // Apply normalization and weight
    out[idx] = input[idx] * rms * weight[hidden_idx];
}

void rms_norm_cuda_impl(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
    
    // Parse descriptor (epsilon, batch_size, hidden_size, dtype)
    float epsilon;
    int64_t batch_size, hidden_size;
    int32_t dtype;
    
    memcpy(&epsilon, opaque, sizeof(float));
    memcpy(&batch_size, opaque + sizeof(float), sizeof(int64_t));
    memcpy(&hidden_size, opaque + sizeof(float) + sizeof(int64_t), sizeof(int64_t));
    
    // Get buffers
    float* out = static_cast<float*>(buffers[0]);
    const float* input = static_cast<const float*>(buffers[1]);
    const float* weight = static_cast<const float*>(buffers[2]);
    
    // Launch kernel
    int total_elements = batch_size * hidden_size;
    int block_size = 256;
    int grid_size = (total_elements + block_size - 1) / block_size;
    
    rms_norm_kernel<<<grid_size, block_size, 0, stream>>>(
        out, input, weight, epsilon, batch_size, hidden_size
    );
}

} // extern "C"
"""
    
    # Write CUDA file
    with open("rms_norm_cuda.cu", "w") as f:
        f.write(cuda_code)
    
    # Compile
    compile_cmd = f"""
    nvcc -O3 -shared -fPIC \
        -gencode arch=compute_70,code=sm_70 \
        -gencode arch=compute_80,code=sm_80 \
        -o {lib_path} \
        rms_norm_cuda.cu \
        -lcudart
    """
    
    ret = os.system(compile_cmd)
    if ret != 0:
        print("❌ Compilation failed")
        return None
    
    print(f"✓ Compiled successfully: {lib_path}")
    return lib_path


def register_custom_call():
    """Register the custom call with XLA."""
    print("\nRegistering custom call...")
    
    # Compile/load library
    lib_path = compile_library()
    if not lib_path or not os.path.exists(lib_path):
        print("❌ Library not found")
        return False
    
    # Load library
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    
    # Get function address
    func_addr = ctypes.cast(lib.rms_norm_cuda_impl, ctypes.c_void_p).value
    print(f"Function address: 0x{func_addr:x}")
    
    # Create PyCapsule
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    # Register with XLA
    torch_xla._XLAC._xla_register_custom_call_target(
        "RmsNormCuda",  # Name used in custom call
        capsule,
        "CUDA"
    )
    
    print("✓ Custom call registered: RmsNormCuda")
    return True


def rms_norm_custom_call(input, weight, epsilon=1e-5):
    """Call the RMS norm custom call."""
    
    # Prepare input
    original_shape = input.shape
    hidden_size = input.shape[-1]
    batch_size = input.numel() // hidden_size
    input_2d = input.reshape(batch_size, hidden_size)
    
    # Create descriptor
    descriptor = struct.pack('fqqi', epsilon, batch_size, hidden_size, 0)
    
    # Custom call
    outputs = torch_xla._XLAC._xla_custom_call(
        [input_2d, weight],      # inputs
        "RmsNormCuda",           # target_name (must match registration)
        [list(input_2d.shape)],  # output_shapes
        [torch.float32],         # output_dtypes
        False,                   # has_side_effect
        descriptor,              # opaque
        1,                       # backend_config
        {}                       # operand_layouts
    )
    
    result = outputs[0]
    return result.reshape(original_shape)


def test_basic():
    """Test basic custom call."""
    print("\n" + "=" * 60)
    print("Test 1: Basic Custom Call")
    print("=" * 60)
    
    device = xm.xla_device()
    
    # Small test
    input_xla = torch.randn(2, 4, 8, device=device)
    weight_xla = torch.randn(8, device=device)
    epsilon = 1e-5
    
    print(f"Input shape: {input_xla.shape}")
    print(f"Weight shape: {weight_xla.shape}")
    
    try:
        result = rms_norm_custom_call(input_xla, weight_xla, epsilon)
        xm.mark_step()
        
        print(f"✓ Custom call successful")
        print(f"  Output shape: {result.shape}")
        
        # Verify with reference
        def reference_rms_norm(x, w, eps):
            variance = x.pow(2).mean(-1, keepdim=True)
            return x * torch.rsqrt(variance + eps) * w
        
        expected = reference_rms_norm(input_xla, weight_xla, epsilon)
        xm.mark_step()
        
        diff = torch.abs(result - expected).max().item()
        print(f"  Max diff from reference: {diff:.2e}")
        
        if diff < 1e-3:
            print("  ✓ Results match!")
        
    except Exception as e:
        print(f"✗ Failed: {e}")


def test_with_torch_library():
    """Test using torch.library for torch.compile."""
    print("\n" + "=" * 60)
    print("Test 2: With torch.library")
    print("=" * 60)
    
    # Define custom op
    lib = torch.library.Library("custom", "DEF")
    lib.define("rms_norm(Tensor input, Tensor weight, float epsilon) -> Tensor")
    
    # XLA implementation
    @torch.library.impl(lib, "rms_norm", "XLA")
    def rms_norm_xla(input, weight, epsilon):
        return rms_norm_custom_call(input, weight, epsilon)
    
    # Fake/meta implementation for shape inference
    @torch.library.register_fake("custom::rms_norm")
    def rms_norm_meta(input, weight, epsilon):
        return torch.empty_like(input)
    
    # CPU fallback
    @torch.library.impl(lib, "rms_norm", "CPU")
    def rms_norm_cpu(input, weight, epsilon):
        variance = input.pow(2).mean(-1, keepdim=True)
        return input * torch.rsqrt(variance + epsilon) * weight
    
    # Test
    device = xm.xla_device()
    input_xla = torch.randn(2, 128, 512, device=device)
    weight_xla = torch.randn(512, device=device)
    
    try:
        # Direct call
        result = torch.ops.custom.rms_norm(input_xla, weight_xla, 1e-5)
        xm.mark_step()
        print(f"✓ torch.ops.custom.rms_norm successful")
        print(f"  Output shape: {result.shape}")
        
    except Exception as e:
        print(f"✗ Failed: {e}")


def test_with_compile():
    """Test with torch.compile."""
    print("\n" + "=" * 60)
    print("Test 3: With torch.compile")
    print("=" * 60)
    
    # Define custom op (reuse from test 2 if already defined)
    try:
        # Check if already defined
        torch.ops.custom.rms_norm
    except:
        lib = torch.library.Library("custom", "DEF")
        lib.define("rms_norm(Tensor input, Tensor weight, float epsilon) -> Tensor")
        
        @torch.library.impl(lib, "rms_norm", "XLA")
        def rms_norm_xla(input, weight, epsilon):
            return rms_norm_custom_call(input, weight, epsilon)
        
        @torch.library.register_fake("custom::rms_norm")
        def rms_norm_meta(input, weight, epsilon):
            return torch.empty_like(input)
    
    # Function to compile
    def model_with_rms_norm(x, w):
        x = x * 2  # Regular op
        x = torch.ops.custom.rms_norm(x, w, 1e-5)  # Custom op
        return x + 1  # Regular op
    
    try:
        # Compile
        compiled_model = torch.compile(model_with_rms_norm, backend='openxla')
        
        # Test
        device = xm.xla_device()
        input_xla = torch.randn(2, 64, 256, device=device)
        weight_xla = torch.randn(256, device=device)
        
        result = compiled_model(input_xla, weight_xla)
        xm.mark_step()
        
        print(f"✓ torch.compile successful")
        print(f"  Output shape: {result.shape}")
        
    except Exception as e:
        print(f"✗ Failed: {e}")
        import traceback
        traceback.print_exc()


def main():
    print("RMS Norm XLA Custom Call Test")
    print("=" * 60)
    
    # Register custom call
    if not register_custom_call():
        print("Failed to register custom call")
        return
    
    # Run tests
    test_basic()
    test_with_torch_library()
    test_with_compile()
    
    print("\n" + "=" * 60)
    print("✓ All tests completed")
    print("\nKey points:")
    print("1. Custom call must be registered with exact name match")
    print("2. Use torch.library for torch.compile compatibility")
    print("3. Descriptor format must match CUDA implementation")


if __name__ == "__main__":
    main()
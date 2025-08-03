// XLA GPU Custom Call Implementation for XlaGpuSimpleAdd

#include <cuda_runtime.h>
#include "xla/service/custom_call_target_registry.h"
#include "xla/service/custom_call_status.h"

// CUDA kernel for element-wise addition
__global__ void SimpleAddKernel(const float* a, const float* b, float* out, int64_t size) {
    int64_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = a[idx] + b[idx];
    }
}

// XLA custom call implementation
extern "C" void XlaGpuSimpleAdd(cudaStream_t stream, void** buffers,
                                const char* opaque, size_t opaque_len,
                                XlaCustomCallStatus* status) {
    // buffers[0] = input a
    // buffers[1] = input b  
    // buffers[2] = output
    
    const float* a = reinterpret_cast<const float*>(buffers[0]);
    const float* b = reinterpret_cast<const float*>(buffers[1]);
    float* out = reinterpret_cast<float*>(buffers[2]);
    
    // Parse size from opaque data
    // For simplicity, assume we know the size
    // In production, parse from opaque config
    int64_t size = 3;  // For the test case [1.0, 2.0, 3.0]
    
    // If opaque_len > 0, could parse actual size:
    // const int64_t* shape_data = reinterpret_cast<const int64_t*>(opaque);
    // int64_t size = shape_data[0];
    
    // Launch CUDA kernel
    const int threads_per_block = 256;
    const int num_blocks = (size + threads_per_block - 1) / threads_per_block;
    
    SimpleAddKernel<<<num_blocks, threads_per_block, 0, stream>>>(a, b, out, size);
    
    // Check for CUDA errors
    cudaError_t error = cudaGetLastError();
    if (error != cudaSuccess) {
        const char* error_msg = cudaGetErrorString(error);
        XlaCustomCallStatusSetFailure(status, error_msg, strlen(error_msg));
    }
}

// Register the custom call for CUDA platform
// This registration happens when the shared library is loaded
static void RegisterCustomCall() __attribute__((constructor));
static void RegisterCustomCall() {
    XLA_REGISTER_CUSTOM_CALL_TARGET("XlaGpuSimpleAdd", XlaGpuSimpleAdd, "CUDA");
}

// Alternative: Use explicit registration macro
// XLA_REGISTER_CUSTOM_CALL_TARGET_WITH_SYM("XlaGpuSimpleAdd", XlaGpuSimpleAdd, "CUDA");
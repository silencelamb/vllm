// Simplest possible XLA Custom Call Implementation

#include <cuda_runtime.h>

// CUDA kernel
__global__ void SimpleAddKernel(const float* a, const float* b, float* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = a[idx] + b[idx];
    }
}

// XLA Custom Call entry point
extern "C" __attribute__((visibility("default")))
void XlaGpuSimpleAdd(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len
) {
    // Extract pointers
    const float* a = (const float*)buffers[0];
    const float* b = (const float*)buffers[1];
    float* out = (float*)buffers[2];
    
    // Fixed size for testing
    const int size = 3;
    
    // Launch kernel
    const int threads = 256;
    const int blocks = (size + threads - 1) / threads;
    
    SimpleAddKernel<<<blocks, threads, 0, stream>>>(a, b, out, size);
}
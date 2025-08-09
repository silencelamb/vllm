// In-place add kernel for testing buffer donor optimization
#include <cuda_runtime.h>
#include <cstdint>
#include <cstdio>

extern "C" {

// In-place add: output += input
// This modifies output in-place instead of creating new memory
__global__ void inplace_add_kernel(const float* input, float* output,
                                   int size) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < size) {
    output[idx] += input[idx];
  }
}

// XLA Custom Call that does in-place addition
void XlaGpuInplaceAdd(cudaStream_t stream, void** buffers, const char* opaque,
                      size_t opaque_len) {
  // Parse size from opaque data (int32 in little-endian)
  int32_t size;
  memcpy(&size, opaque, sizeof(int32_t));

  // XLA GPU buffer ordering:
  // - Inputs come first: buffers[0] = input
  // - Output comes last: buffers[1] = output (for in-place, same as input)
  const float* input = static_cast<const float*>(buffers[0]);
  float* output = static_cast<float*>(buffers[1]);

  // Print buffer addresses to verify in-place optimization
  printf("InplaceAdd - Input buffer:  %p\n", input);
  printf("InplaceAdd - Output buffer: %p\n", output);
  printf("buffer[2]: %p\n", buffers[2]);
  printf("InplaceAdd - Same buffer (in-place): %s\n",
         (output == buffers[2]) ? "YES" : "NO");

  // Launch kernel
  int threads = 256;
  int blocks = (size + threads - 1) / threads;
  inplace_add_kernel<<<blocks, threads, 0, stream>>>(input, output, size);

  // Check for errors
  cudaError_t err = cudaGetLastError();
  if (err != cudaSuccess) {
    printf("CUDA error in InplaceAdd: %s\n", cudaGetErrorString(err));
  }
}

// Regular add for comparison (not in-place)
__global__ void regular_add_kernel(const float* a, const float* b,
                                   float* output, int size) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < size) {
    output[idx] = a[idx] + b[idx];
  }
}

void XlaGpuRegularAdd(cudaStream_t stream, void** buffers, const char* opaque,
                      size_t opaque_len) {
  int32_t size;
  memcpy(&size, opaque, sizeof(int32_t));

  // buffers[0] = a, buffers[1] = b, buffers[2] = output
  const float* a = static_cast<const float*>(buffers[0]);
  const float* b = static_cast<const float*>(buffers[1]);
  float* output = static_cast<float*>(buffers[2]);

  printf("RegularAdd - A buffer:      %p\n", a);
  printf("RegularAdd - B buffer:      %p\n", b);
  printf("RegularAdd - Output buffer: %p\n", output);

  int threads = 256;
  int blocks = (size + threads - 1) / threads;
  regular_add_kernel<<<blocks, threads, 0, stream>>>(a, b, output, size);
}

}  // extern "C"
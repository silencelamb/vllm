// Debug version to understand buffer layout
#include <cuda_runtime.h>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <algorithm>

struct ReshapeAndCacheDescriptor {
  int64_t num_tokens;
  int64_t num_kv_heads;
  int64_t head_size;
  int64_t num_blocks;
  int64_t block_size;
  int32_t kv_cache_dtype;
  uint8_t has_k_scale;
  uint8_t has_v_scale;
};

extern "C" {

__global__ void debug_kernel(float* out, const float* in, int size) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < size && idx < 4) {
    // Just copy first 4 elements to verify we're getting the right data
    out[idx] = in[idx];
  }
}

void reshape_and_cache_flash_xla_custom_call(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
  
  // Parse descriptor
  ReshapeAndCacheDescriptor descriptor;
  memcpy(&descriptor, opaque, sizeof(ReshapeAndCacheDescriptor));
  
  printf("DEBUG: num_tokens=%ld, num_kv_heads=%ld, head_size=%ld\n", 
         descriptor.num_tokens, descriptor.num_kv_heads, descriptor.head_size);
  printf("DEBUG: num_blocks=%ld, block_size=%ld\n",
         descriptor.num_blocks, descriptor.block_size);
  
  // Test different buffer arrangements
  // Let's try to understand what XLA is passing us
  
  // Try 1: Assume inputs first, outputs last
  const float* key = (const float*)buffers[0];
  const float* value = (const float*)buffers[1];
  float* key_cache_out = nullptr;
  float* value_cache_out = nullptr;
  
  // Count total buffers (5 inputs + optional scales + 2 outputs)
  int total_inputs = 5;  // key, value, key_cache, value_cache, slot_mapping
  if (descriptor.has_k_scale) total_inputs++;
  if (descriptor.has_v_scale) total_inputs++;
  
  // Outputs should be at the end
  key_cache_out = (float*)buffers[total_inputs];
  value_cache_out = (float*)buffers[total_inputs + 1];
  
  printf("DEBUG: Total inputs=%d, key_cache_out at index %d\n", total_inputs, total_inputs);
  
  // Simple test: just copy first elements from key to key_cache
  int test_size = descriptor.num_kv_heads * descriptor.head_size;
  dim3 block(256);
  dim3 grid((test_size + 255) / 256);
  
  debug_kernel<<<grid, block, 0, stream>>>(key_cache_out, key, test_size);
  debug_kernel<<<grid, block, 0, stream>>>(value_cache_out, value, test_size);
  
  cudaError_t err = cudaGetLastError();
  if (err != cudaSuccess) {
    printf("CUDA Error: %s\n", cudaGetErrorString(err));
  }
}

} // extern "C"
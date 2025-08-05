// Debug version of reshape_and_cache_flash for XLA Custom Call
// Includes printf debugging to understand what's happening

#include <cuda_runtime.h>
#include <cstdint>
#include <cstring>
#include <algorithm>
#include <cstdio>

// XLA Custom Call descriptor structure  
struct ReshapeAndCacheDescriptor {
  int64_t num_tokens;
  int64_t num_kv_heads;
  int64_t head_size;
  int64_t num_blocks;
  int64_t block_size;
  int32_t kv_cache_dtype;  // 0: auto/float32, 1: float16, 2: bfloat16
  uint8_t has_k_scale;
  uint8_t has_v_scale;
};

extern "C" {

// Debug kernel with printf
__global__ void reshape_and_cache_kernel_debug(
    float* key_cache,
    float* value_cache,
    const float* key,
    const float* value,
    const int64_t* slot_mapping,
    const float* k_scale,
    const float* v_scale,
    int num_tokens,
    int num_kv_heads,
    int head_size,
    int block_size) {
  
  int token_idx = blockIdx.x;
  int head_idx = blockIdx.y;
  int dim_idx = threadIdx.x;
  
  // Debug print from first thread
  if (token_idx == 0 && head_idx == 0 && dim_idx == 0) {
    printf("Kernel launched with: tokens=%d, heads=%d, head_size=%d, block_size=%d\n", 
           num_tokens, num_kv_heads, head_size, block_size);
    printf("k_scale=%p, v_scale=%p\n", k_scale, v_scale);
    if (k_scale) printf("k_scale[0]=%f\n", k_scale[0]);
    if (v_scale) printf("v_scale[0]=%f\n", v_scale[0]);
  }
  
  if (token_idx >= num_tokens || head_idx >= num_kv_heads || dim_idx >= head_size) {
    return;
  }
  
  // Get slot index for this token
  int64_t slot_idx = slot_mapping[token_idx];
  
  // Debug print slot mapping
  if (head_idx == 0 && dim_idx == 0) {
    printf("Token %d -> slot %lld\n", token_idx, (long long)slot_idx);
  }
  
  if (slot_idx < 0) {
    return;  // Invalid slot
  }
  
  // Calculate block and position within block
  int block_idx = slot_idx / block_size;
  int block_offset = slot_idx % block_size;
  
  // Calculate input indices
  int input_idx = token_idx * num_kv_heads * head_size + head_idx * head_size + dim_idx;
  
  // Calculate cache indices - layout: [num_blocks, block_size, num_kv_heads, head_size]
  int cache_idx = block_idx * (block_size * num_kv_heads * head_size) +
                  block_offset * (num_kv_heads * head_size) +
                  head_idx * head_size +
                  dim_idx;
  
  // Get key and value
  float key_val = key[input_idx];
  float value_val = value[input_idx];
  
  // Debug print before scaling
  if (token_idx == 0 && head_idx == 0 && dim_idx == 0) {
    printf("Before scaling: key_val=%f, value_val=%f\n", key_val, value_val);
  }
  
  // Apply scaling if provided
  if (k_scale != nullptr) {
    key_val *= k_scale[0];
  }
  if (v_scale != nullptr) {
    value_val *= v_scale[0];
  }
  
  // Debug print after scaling
  if (token_idx == 0 && head_idx == 0 && dim_idx == 0) {
    printf("After scaling: key_val=%f, value_val=%f\n", key_val, value_val);
    printf("Writing to cache_idx=%d\n", cache_idx);
  }
  
  // Write to cache
  key_cache[cache_idx] = key_val;
  value_cache[cache_idx] = value_val;
}

// XLA Custom Call implementation
void reshape_and_cache_flash_xla_custom_call(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
  
  // Parse descriptor
  ReshapeAndCacheDescriptor descriptor;
  memcpy(&descriptor, opaque, sizeof(ReshapeAndCacheDescriptor));
  
  printf("Custom call invoked with %lld tokens, %lld heads, %lld head_size\n",
         (long long)descriptor.num_tokens, 
         (long long)descriptor.num_kv_heads,
         (long long)descriptor.head_size);
  printf("has_k_scale=%d, has_v_scale=%d\n", descriptor.has_k_scale, descriptor.has_v_scale);
  
  // Extract buffers in the expected order
  // For XLA custom calls, the output buffers come first, then inputs
  void* key_cache_buffer = buffers[0];
  void* value_cache_buffer = buffers[1];
  const void* key_buffer = buffers[2];
  const void* value_buffer = buffers[3];
  const void* slot_mapping_buffer = buffers[4];
  
  // Scale buffers come after fixed inputs
  int next_buffer = 5;
  const void* k_scale_buffer = nullptr;
  const void* v_scale_buffer = nullptr;
  
  if (descriptor.has_k_scale) {
    k_scale_buffer = buffers[next_buffer++];
  }
  if (descriptor.has_v_scale) {
    v_scale_buffer = buffers[next_buffer++];
  }
  
  printf("Buffer pointers: key_cache=%p, value_cache=%p, key=%p, value=%p\n",
         key_cache_buffer, value_cache_buffer, key_buffer, value_buffer);
  printf("slot_mapping=%p, k_scale=%p, v_scale=%p\n",
         slot_mapping_buffer, k_scale_buffer, v_scale_buffer);
  
  // For now, only handle float32
  if (descriptor.kv_cache_dtype == 0) {  // float32/auto
    // Launch kernel with 3D grid
    dim3 grid(descriptor.num_tokens, descriptor.num_kv_heads, 1);
    dim3 block(std::min((int64_t)256, descriptor.head_size), 1, 1);
    
    printf("Launching kernel with grid(%d,%d,1) block(%d,1,1)\n",
           (int)descriptor.num_tokens, (int)descriptor.num_kv_heads,
           (int)std::min((int64_t)256, descriptor.head_size));
    
    reshape_and_cache_kernel_debug<<<grid, block, 0, stream>>>(
        static_cast<float*>(key_cache_buffer),
        static_cast<float*>(value_cache_buffer),
        static_cast<const float*>(key_buffer),
        static_cast<const float*>(value_buffer),
        static_cast<const int64_t*>(slot_mapping_buffer),
        static_cast<const float*>(k_scale_buffer),
        static_cast<const float*>(v_scale_buffer),
        descriptor.num_tokens,
        descriptor.num_kv_heads,
        descriptor.head_size,
        descriptor.block_size
    );
    
    // Sync for debugging
    cudaDeviceSynchronize();
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
      printf("CUDA error: %s\n", cudaGetErrorString(err));
    }
  }
}

} // extern "C"
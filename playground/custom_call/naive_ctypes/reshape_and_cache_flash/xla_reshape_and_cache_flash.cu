// XLA Custom Call wrapper that directly uses vLLM's reshape_and_cache_flash
// kernel

#include <cuda_runtime.h>
#include <cstdint>
#include <cstring>
#include <algorithm>
#include <stdio.h>

// Forward declare the vLLM kernel that we'll link against
namespace vllm {

enum Fp8KVCacheDataType {
  kAuto = 0,
  kFp8E4M3 = 1,
  kFp8E5M2 = 2,
};

// The actual kernel is defined in csrc/cache_kernels.cu
template <typename scalar_t, typename cache_t, Fp8KVCacheDataType kv_dt>
__global__ void reshape_and_cache_flash_kernel(
    const scalar_t* __restrict__ key, const scalar_t* __restrict__ value,
    cache_t* __restrict__ key_cache, cache_t* __restrict__ value_cache,
    const int64_t* __restrict__ slot_mapping, const int64_t block_stride,
    const int64_t page_stride, const int64_t head_stride,
    const int64_t key_stride, const int64_t value_stride, const int num_heads,
    const int head_size, const int block_size, const float* k_scale,
    const float* v_scale);

}  // namespace vllm

// XLA Custom Call descriptor structure
struct ReshapeAndCacheDescriptor {
  int64_t num_tokens;
  int64_t num_kv_heads;
  int64_t head_size;
  int64_t num_blocks;
  int64_t block_size;
  int32_t kv_cache_dtype;  // 0: auto/same as input
  uint8_t has_k_scale;
  uint8_t has_v_scale;
};

extern "C" {

// XLA Custom Call implementation
void reshape_and_cache_flash_xla_custom_call(cudaStream_t stream,
                                             void** buffers, const char* opaque,
                                             size_t opaque_len) {
  // Parse descriptor
  ReshapeAndCacheDescriptor descriptor;
  memcpy(&descriptor, opaque, sizeof(ReshapeAndCacheDescriptor));
  printf("ReshapeAndCacheDescriptor:\n");
  printf("  num_tokens: %ld\n", descriptor.num_tokens);
  printf("  num_kv_heads: %ld\n", descriptor.num_kv_heads);
  printf("  head_size: %ld\n", descriptor.head_size);
  printf("  num_blocks: %ld\n", descriptor.num_blocks);
  printf("  block_size: %ld\n", descriptor.block_size);
  printf("  kv_cache_dtype: %d\n", descriptor.kv_cache_dtype);
  printf("  has_k_scale: %d\n", descriptor.has_k_scale);
  printf("  has_v_scale: %d\n", descriptor.has_v_scale);

  // Extract buffers in the expected order
  // IMPORTANT: On GPU, the LAST num_outputs buffers are outputs!
  // With num_outputs=2, buffer order is:
  // Inputs:
  // - buffers[0] = input key
  // - buffers[1] = input value
  // - buffers[2] = input key_cache (for reading)
  // - buffers[3] = input value_cache (for reading)
  // - buffers[4] = input slot_mapping
  // - buffers[5] = input k_scale (if has_k_scale)
  // - buffers[6] = input v_scale (if has_v_scale)
  // Outputs (last 2):
  // - buffers[7 or N-2] = output key_cache (to write, same tensor as input for
  // in-place)
  // - buffers[8 or N-1] = output value_cache (to write, same tensor as input
  // for in-place)

  const void* key_buffer = buffers[0];           // input key
  const void* value_buffer = buffers[1];         // input value
  const void* slot_mapping_buffer = buffers[4];  // input slot_mapping

  // Calculate total number of buffers
  int num_input_buffers =
      5;  // key, value, key_cache, value_cache, slot_mapping
  // Handle optional scale buffers correctly
  const float* k_scale_buffer = nullptr;
  const float* v_scale_buffer = nullptr;

  int scale_buffer_idx = num_input_buffers;
  if (descriptor.has_k_scale) {
    k_scale_buffer = static_cast<const float*>(buffers[scale_buffer_idx++]);
  }
  if (descriptor.has_v_scale) {
    v_scale_buffer = static_cast<const float*>(buffers[scale_buffer_idx++]);
  }

  // Output buffers are at the end, after all input buffers including scales
  int output_buffer_start = scale_buffer_idx;
  void* key_cache_buffer = buffers[output_buffer_start];      // output key_cache
  void* value_cache_buffer = buffers[output_buffer_start + 1];  // output value_cache

  for (int i = 0; i < num_input_buffers; ++i) {
    printf("buffers[%d]: %p\n", i, buffers[i]);
  }

  printf("key_cache_buffer: %p, value_cache_buffer: %p\n", key_cache_buffer,
         value_cache_buffer);

  printf("buffers[2]: %p, buffers[3]: %p\n", buffers[2], buffers[3]);

  // Calculate strides (matching vLLM's layout for reshape_and_cache_flash)
  int64_t key_stride = descriptor.num_kv_heads * descriptor.head_size;
  int64_t value_stride = descriptor.num_kv_heads * descriptor.head_size;
  int64_t block_stride =
      descriptor.block_size * descriptor.num_kv_heads * descriptor.head_size;
  int64_t page_stride = descriptor.num_kv_heads * descriptor.head_size;
  int64_t head_stride = descriptor.head_size;

  // Launch kernel with 1D grid and 1D block (exactly like vLLM)
  dim3 grid(descriptor.num_tokens);
  dim3 block(
      std::min((int64_t)512, descriptor.num_kv_heads * descriptor.head_size));

  // For now, only handle float32 case
  // Call vLLM's kernel directly - it will be linked from the compiled vLLM
  // library
  vllm::reshape_and_cache_flash_kernel<float, float,
                                       vllm::Fp8KVCacheDataType::kAuto>
      <<<grid, block, 0, stream>>>(
          static_cast<const float*>(key_buffer),
          static_cast<const float*>(value_buffer),
          static_cast<float*>(key_cache_buffer),
          static_cast<float*>(value_cache_buffer),
          static_cast<const int64_t*>(slot_mapping_buffer), block_stride,
          page_stride, head_stride, key_stride, value_stride,
          descriptor.num_kv_heads, descriptor.head_size, descriptor.block_size,
          k_scale_buffer, v_scale_buffer);
  
  // Ensure kernel completes before returning
  cudaError_t err = cudaStreamSynchronize(stream);
  if (err != cudaSuccess) {
    printf("CUDA error in reshape_and_cache_flash: %s\n", cudaGetErrorString(err));
  }
}

}  // extern "C"
// XLA Custom Call wrapper for vLLM's reshape_and_cache_flash kernel
// This file is placed in csrc/xla_ops to directly use vLLM's kernels

#include <cuda_runtime.h>
#include <cuda_fp16.h>
#include <cuda_bf16.h>
#include <cstdint>
#include <cstring>
#include <algorithm>

// Include vLLM's Fp8 types
#ifndef USE_ROCM
  #include "../quantization/fp8/nvidia/quant_utils.cuh"
#else
  #include "../quantization/fp8/amd/quant_utils.cuh"
#endif

// Forward declare the vLLM kernel that's defined in cache_kernels.cu
namespace vllm {

template <typename scalar_t, typename cache_t, Fp8KVCacheDataType kv_dt>
__global__ void reshape_and_cache_flash_kernel(
    const scalar_t* __restrict__ key,
    const scalar_t* __restrict__ value,
    cache_t* __restrict__ key_cache,
    cache_t* __restrict__ value_cache,
    const int64_t* __restrict__ slot_mapping,
    const int64_t block_stride, const int64_t page_stride,
    const int64_t head_stride, const int64_t key_stride,
    const int64_t value_stride, const int num_heads, const int head_size,
    const int block_size, const float* k_scale, const float* v_scale);

}  // namespace vllm

// XLA Custom Call descriptor structure  
struct ReshapeAndCacheDescriptor {
  int64_t num_tokens;
  int64_t num_kv_heads;
  int64_t head_size;
  int64_t num_blocks;
  int64_t block_size;
  int32_t kv_cache_dtype;  // 0: auto/same as input, 1: float16, 2: bfloat16, 3: float32
  int32_t input_dtype;     // 0: float32, 1: float16, 2: bfloat16
  uint8_t has_k_scale;
  uint8_t has_v_scale;
};

extern "C" {

// XLA Custom Call implementation
void vllm_reshape_and_cache_flash_xla(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
  
  // Parse descriptor
  ReshapeAndCacheDescriptor descriptor;
  memcpy(&descriptor, opaque, sizeof(ReshapeAndCacheDescriptor));
  
  // Extract buffers in the expected order
  void* key_cache_buffer = buffers[0];
  void* value_cache_buffer = buffers[1];
  const void* key_buffer = buffers[2];
  const void* value_buffer = buffers[3];
  const void* slot_mapping_buffer = buffers[4];
  
  // Handle optional scale buffers correctly
  int buffer_idx = 5;
  const float* k_scale_buffer = nullptr;
  const float* v_scale_buffer = nullptr;
  
  if (descriptor.has_k_scale) {
    k_scale_buffer = static_cast<const float*>(buffers[buffer_idx++]);
  }
  if (descriptor.has_v_scale) {
    v_scale_buffer = static_cast<const float*>(buffers[buffer_idx]);
  }
  
  // Calculate strides (matching vLLM's layout for reshape_and_cache_flash)
  int64_t key_stride = descriptor.num_kv_heads * descriptor.head_size;
  int64_t value_stride = descriptor.num_kv_heads * descriptor.head_size;
  int64_t block_stride = descriptor.block_size * descriptor.num_kv_heads * descriptor.head_size;
  int64_t page_stride = descriptor.num_kv_heads * descriptor.head_size;
  int64_t head_stride = descriptor.head_size;
  
  // Launch kernel with 1D grid and 1D block (exactly like vLLM)
  dim3 grid(descriptor.num_tokens);
  dim3 block(std::min((int64_t)512, descriptor.num_kv_heads * descriptor.head_size));
  
  // Dispatch based on input and cache data types
  // Call vLLM's kernel directly
  if (descriptor.input_dtype == 0) {  // float32 input
    if (descriptor.kv_cache_dtype == 0 || descriptor.kv_cache_dtype == 3) {
      // float32 -> float32
      vllm::reshape_and_cache_flash_kernel<float, float, vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
          static_cast<const float*>(key_buffer),
          static_cast<const float*>(value_buffer),
          static_cast<float*>(key_cache_buffer),
          static_cast<float*>(value_cache_buffer),
          static_cast<const int64_t*>(slot_mapping_buffer),
          block_stride, page_stride, head_stride,
          key_stride, value_stride,
          descriptor.num_kv_heads, descriptor.head_size, descriptor.block_size,
          k_scale_buffer, v_scale_buffer);
    } else if (descriptor.kv_cache_dtype == 1) {
      // float32 -> float16
      vllm::reshape_and_cache_flash_kernel<float, __half, vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
          static_cast<const float*>(key_buffer),
          static_cast<const float*>(value_buffer),
          static_cast<__half*>(key_cache_buffer),
          static_cast<__half*>(value_cache_buffer),
          static_cast<const int64_t*>(slot_mapping_buffer),
          block_stride, page_stride, head_stride,
          key_stride, value_stride,
          descriptor.num_kv_heads, descriptor.head_size, descriptor.block_size,
          k_scale_buffer, v_scale_buffer);
    } else if (descriptor.kv_cache_dtype == 2) {
      // float32 -> bfloat16
      vllm::reshape_and_cache_flash_kernel<float, __nv_bfloat16, vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
          static_cast<const float*>(key_buffer),
          static_cast<const float*>(value_buffer),
          static_cast<__nv_bfloat16*>(key_cache_buffer),
          static_cast<__nv_bfloat16*>(value_cache_buffer),
          static_cast<const int64_t*>(slot_mapping_buffer),
          block_stride, page_stride, head_stride,
          key_stride, value_stride,
          descriptor.num_kv_heads, descriptor.head_size, descriptor.block_size,
          k_scale_buffer, v_scale_buffer);
    }
  } else if (descriptor.input_dtype == 1) {  // float16 input
    if (descriptor.kv_cache_dtype == 0 || descriptor.kv_cache_dtype == 1) {
      // float16 -> float16
      vllm::reshape_and_cache_flash_kernel<__half, __half, vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
          static_cast<const __half*>(key_buffer),
          static_cast<const __half*>(value_buffer),
          static_cast<__half*>(key_cache_buffer),
          static_cast<__half*>(value_cache_buffer),
          static_cast<const int64_t*>(slot_mapping_buffer),
          block_stride, page_stride, head_stride,
          key_stride, value_stride,
          descriptor.num_kv_heads, descriptor.head_size, descriptor.block_size,
          nullptr, nullptr);  // No scaling for fp16
    }
  } else if (descriptor.input_dtype == 2) {  // bfloat16 input
    if (descriptor.kv_cache_dtype == 0 || descriptor.kv_cache_dtype == 2) {
      // bfloat16 -> bfloat16
      vllm::reshape_and_cache_flash_kernel<__nv_bfloat16, __nv_bfloat16, vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
          static_cast<const __nv_bfloat16*>(key_buffer),
          static_cast<const __nv_bfloat16*>(value_buffer),
          static_cast<__nv_bfloat16*>(key_cache_buffer),
          static_cast<__nv_bfloat16*>(value_cache_buffer),
          static_cast<const int64_t*>(slot_mapping_buffer),
          block_stride, page_stride, head_stride,
          key_stride, value_stride,
          descriptor.num_kv_heads, descriptor.head_size, descriptor.block_size,
          nullptr, nullptr);  // No scaling for bf16
    }
  }
}

} // extern "C"
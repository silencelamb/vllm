// Standalone vLLM reshape_and_cache_flash kernel for XLA
// This version includes only the kernel, not the full cache_kernels.cu

#include <cuda_runtime.h>
#include <cuda_fp16.h>
#include <cuda_bf16.h>
#include <cstdint>
#include <cstring>
#include <algorithm>
#include <stdio.h>

namespace vllm {

// Simplified Fp8KVCacheDataType enum
enum Fp8KVCacheDataType {
  kAuto = 0,
  kFp8E4M3 = 1,
  kFp8E5M2 = 2,
};

// The reshape_and_cache_flash kernel from vLLM
template <typename scalar_t, typename cache_t, Fp8KVCacheDataType kv_dt>
__global__ void reshape_and_cache_flash_kernel(
    const scalar_t* __restrict__ key,    // [num_tokens, num_heads, head_size]
    const scalar_t* __restrict__ value,  // [num_tokens, num_heads, head_size]
    cache_t* __restrict__ key_cache,     // [num_blocks, block_size, num_heads,
                                         // head_size]
    cache_t* __restrict__ value_cache,   // [num_blocks, block_size, num_heads,
                                         // head_size]
    const int64_t* __restrict__ slot_mapping,  // [num_tokens]
    const int64_t block_stride, const int64_t page_stride,
    const int64_t head_stride, const int64_t key_stride,
    const int64_t value_stride, const int num_heads, const int head_size,
    const int block_size, const float* k_scale, const float* v_scale) {
  const int64_t token_idx = blockIdx.x;
  const int64_t slot_idx = slot_mapping[token_idx];

  // if (blockIdx.x == 0 && threadIdx.x == 0) {
  //   for (int64_t i = 0; i < 4; ++i) {
  //     printf("slot[%ld] = %ld\n", i, slot_mapping[i]);
  //   }
  // }
  // NOTE: slot_idx can be -1 if the token is padded
  if (slot_idx < 0) {
    return;
  }
  const int64_t block_idx = slot_idx / block_size;
  const int64_t block_offset = slot_idx % block_size;
  const int n = num_heads * head_size;
  for (int i = threadIdx.x; i < n; i += blockDim.x) {
    const int64_t src_key_idx = token_idx * key_stride + i;
    const int64_t src_value_idx = token_idx * value_stride + i;
    const int head_idx = i / head_size;
    const int head_offset = i % head_size;
    const int64_t tgt_key_value_idx = block_idx * block_stride +
                                      block_offset * page_stride +
                                      head_idx * head_stride + head_offset;
    scalar_t tgt_key = key[src_key_idx];
    scalar_t tgt_value = value[src_value_idx];
    // printf("blockIdx.x: %d, threadIdx.x: %d\n", blockIdx.x, threadIdx.x);
    // printf(
    //     "block_idx: %ld, block_offset: %ld, head_idx: %d, "
    //     "head_offset: %d, tgt_key_value_idx: %ld, tgt_key: %f, tgt_value:
    //     %f\n", block_idx, block_offset, head_idx, head_offset,
    //     tgt_key_value_idx, static_cast<float>(tgt_key),
    //     static_cast<float>(tgt_value));

    // For kAuto mode, no fp8 conversion
    if (kv_dt == Fp8KVCacheDataType::kAuto) {
      // Apply scaling if provided
      if (k_scale != nullptr || v_scale != nullptr) {
        // Convert to float for scaling, then back to target type
        float key_float = static_cast<float>(tgt_key);
        float value_float = static_cast<float>(tgt_value);

        if (k_scale != nullptr) {
          key_float = key_float * k_scale[0];
        }
        if (v_scale != nullptr) {
          value_float = value_float * v_scale[0];
        }

        key_cache[tgt_key_value_idx] = cache_t(key_float);
        value_cache[tgt_key_value_idx] = cache_t(value_float);
      } else {
        // No scaling, direct copy
        // printf("No scaling applied, copying directly.\n");
        key_cache[tgt_key_value_idx] = cache_t(tgt_key);
        value_cache[tgt_key_value_idx] = cache_t(tgt_value);
      }
    }
  }

  __syncthreads();
}

}  // namespace vllm

// XLA Custom Call descriptor structure
struct ReshapeAndCacheDescriptor {
  int64_t num_tokens;
  int64_t num_kv_heads;
  int64_t head_size;
  int64_t num_blocks;
  int64_t block_size;
  int32_t kv_cache_dtype;  // 0: auto/same as input, 1: float16, 2: bfloat16, 3:
                           // float32
  int32_t input_dtype;     // 0: float32, 1: float16, 2: bfloat16
  uint8_t has_k_scale;
  uint8_t has_v_scale;
};

extern "C" {

// XLA Custom Call implementation
void vllm_reshape_and_cache_flash_xla(cudaStream_t stream, void** buffers,
                                      const char* opaque, size_t opaque_len) {
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
  int64_t block_stride =
      descriptor.block_size * descriptor.num_kv_heads * descriptor.head_size;
  int64_t page_stride = descriptor.num_kv_heads * descriptor.head_size;
  int64_t head_stride = descriptor.head_size;

  // Launch kernel with 1D grid and 1D block (exactly like vLLM)
  dim3 grid(descriptor.num_tokens);
  dim3 block(
      std::min((int64_t)512, descriptor.num_kv_heads * descriptor.head_size));

  // Dispatch based on input and cache data types
  if (descriptor.input_dtype == 0) {  // float32 input
    if (descriptor.kv_cache_dtype == 0 || descriptor.kv_cache_dtype == 3) {
      // float32 -> float32
      vllm::reshape_and_cache_flash_kernel<float, float,
                                           vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
              static_cast<const float*>(key_buffer),
              static_cast<const float*>(value_buffer),
              static_cast<float*>(key_cache_buffer),
              static_cast<float*>(value_cache_buffer),
              static_cast<const int64_t*>(slot_mapping_buffer), block_stride,
              page_stride, head_stride, key_stride, value_stride,
              descriptor.num_kv_heads, descriptor.head_size,
              descriptor.block_size, k_scale_buffer, v_scale_buffer);
    } else if (descriptor.kv_cache_dtype == 1) {
      // float32 -> float16
      vllm::reshape_and_cache_flash_kernel<float, __half,
                                           vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
              static_cast<const float*>(key_buffer),
              static_cast<const float*>(value_buffer),
              static_cast<__half*>(key_cache_buffer),
              static_cast<__half*>(value_cache_buffer),
              static_cast<const int64_t*>(slot_mapping_buffer), block_stride,
              page_stride, head_stride, key_stride, value_stride,
              descriptor.num_kv_heads, descriptor.head_size,
              descriptor.block_size, k_scale_buffer, v_scale_buffer);
    } else if (descriptor.kv_cache_dtype == 2) {
      // float32 -> bfloat16
      vllm::reshape_and_cache_flash_kernel<float, __nv_bfloat16,
                                           vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
              static_cast<const float*>(key_buffer),
              static_cast<const float*>(value_buffer),
              static_cast<__nv_bfloat16*>(key_cache_buffer),
              static_cast<__nv_bfloat16*>(value_cache_buffer),
              static_cast<const int64_t*>(slot_mapping_buffer), block_stride,
              page_stride, head_stride, key_stride, value_stride,
              descriptor.num_kv_heads, descriptor.head_size,
              descriptor.block_size, k_scale_buffer, v_scale_buffer);
    }
  } else if (descriptor.input_dtype == 1) {  // float16 input
    if (descriptor.kv_cache_dtype == 0 || descriptor.kv_cache_dtype == 1) {
      // float16 -> float16
      vllm::reshape_and_cache_flash_kernel<__half, __half,
                                           vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
              static_cast<const __half*>(key_buffer),
              static_cast<const __half*>(value_buffer),
              static_cast<__half*>(key_cache_buffer),
              static_cast<__half*>(value_cache_buffer),
              static_cast<const int64_t*>(slot_mapping_buffer), block_stride,
              page_stride, head_stride, key_stride, value_stride,
              descriptor.num_kv_heads, descriptor.head_size,
              descriptor.block_size, nullptr, nullptr);  // No scaling for fp16
    }
  } else if (descriptor.input_dtype == 2) {  // bfloat16 input
    if (descriptor.kv_cache_dtype == 0 || descriptor.kv_cache_dtype == 2) {
      // bfloat16 -> bfloat16
      vllm::reshape_and_cache_flash_kernel<__nv_bfloat16, __nv_bfloat16,
                                           vllm::Fp8KVCacheDataType::kAuto>
          <<<grid, block, 0, stream>>>(
              static_cast<const __nv_bfloat16*>(key_buffer),
              static_cast<const __nv_bfloat16*>(value_buffer),
              static_cast<__nv_bfloat16*>(key_cache_buffer),
              static_cast<__nv_bfloat16*>(value_cache_buffer),
              static_cast<const int64_t*>(slot_mapping_buffer), block_stride,
              page_stride, head_stride, key_stride, value_stride,
              descriptor.num_kv_heads, descriptor.head_size,
              descriptor.block_size, nullptr, nullptr);  // No scaling for bf16
    }
  }
}

}  // extern "C"
"""Script to build the CUDA kernel for XLA GPU paged attention."""

import torch
from torch.utils.cpp_extension import load

# C++ wrapper code
cpp_source = """
#include <torch/extension.h>
#include <cuda_runtime.h>

// Declare the CUDA kernel launchers
extern "C" {
void launch_paged_attention_f32(
    float* output,
    const float* query,
    const float* kv_cache,
    const int* context_lens,
    const int* block_tables,
    const float scale,
    const int num_tokens,
    const int num_heads,
    const int head_size,
    const int num_blocks,
    const int block_size,
    const int num_kv_heads,
    cudaStream_t stream
);

void launch_paged_attention_f16(
    __half* output,
    const __half* query,
    const __half* kv_cache,
    const int* context_lens,
    const int* block_tables,
    const float scale,
    const int num_tokens,
    const int num_heads,
    const int head_size,
    const int num_blocks,
    const int block_size,
    const int num_kv_heads,
    cudaStream_t stream
);
}

torch::Tensor paged_attention_cuda(
    torch::Tensor query,
    torch::Tensor kv_cache,
    torch::Tensor context_lens,
    torch::Tensor block_tables,
    float scale
) {
    // Check inputs
    TORCH_CHECK(query.is_cuda(), "query must be a CUDA tensor");
    TORCH_CHECK(kv_cache.is_cuda(), "kv_cache must be a CUDA tensor");
    TORCH_CHECK(query.dim() == 3, "query must be 3D");
    TORCH_CHECK(kv_cache.dim() == 4, "kv_cache must be 4D");
    
    // Get dimensions
    const int num_tokens = query.size(0);
    const int num_heads = query.size(1);
    const int head_size = query.size(2);
    const int num_blocks = kv_cache.size(0);
    const int block_size = kv_cache.size(1);
    const int num_kv_heads = kv_cache.size(2) / 2;  // K and V are concatenated
    
    // Allocate output
    auto output = torch::empty_like(query);
    
    // Get current stream
    cudaStream_t stream = at::cuda::getCurrentCUDAStream();
    
    // Launch kernel based on dtype
    AT_DISPATCH_FLOATING_TYPES_AND_HALF(query.scalar_type(), "paged_attention_cuda", [&] {
        if (query.scalar_type() == torch::kFloat32) {
            launch_paged_attention_f32(
                output.data_ptr<float>(),
                query.data_ptr<float>(),
                kv_cache.data_ptr<float>(),
                context_lens.data_ptr<int>(),
                block_tables.data_ptr<int>(),
                scale,
                num_tokens, num_heads, head_size,
                num_blocks, block_size, num_kv_heads,
                stream
            );
        } else if (query.scalar_type() == torch::kFloat16) {
            launch_paged_attention_f16(
                reinterpret_cast<__half*>(output.data_ptr<at::Half>()),
                reinterpret_cast<const __half*>(query.data_ptr<at::Half>()),
                reinterpret_cast<const __half*>(kv_cache.data_ptr<at::Half>()),
                context_lens.data_ptr<int>(),
                block_tables.data_ptr<int>(),
                scale,
                num_tokens, num_heads, head_size,
                num_blocks, block_size, num_kv_heads,
                stream
            );
        }
    });
    
    return output;
}

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("paged_attention_cuda", &paged_attention_cuda, "Paged attention CUDA kernel");
}
"""

if __name__ == "__main__":
    import os
    
    # Get the directory of this script
    current_dir = os.path.dirname(os.path.abspath(__file__))
    cuda_file = os.path.join(current_dir, "xla_gpu_cuda_kernel_example.cu")
    
    print("Building CUDA kernel for XLA GPU paged attention...")
    
    # Build the extension
    paged_attention_cuda = load(
        name='xla_gpu_paged_attention_cuda',
        sources=[cuda_file],
        extra_cfiles=[cpp_source],
        verbose=True,
        extra_cuda_cflags=['-O3'],
    )
    
    print("\n✅ CUDA kernel built successfully!")
    print("\nUsage example:")
    print("```python")
    print("import xla_gpu_paged_attention_cuda")
    print("output = xla_gpu_paged_attention_cuda.paged_attention_cuda(")
    print("    query, kv_cache, context_lens, block_tables, scale")
    print(")")
    print("```")
#!/bin/bash
# Simplified compile script that creates a minimal working version

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../../.."

echo "Building reshape_and_cache_flash XLA extension (simplified)..."

# Clean up old files
rm -f *.o *.so
rm -rf build

# Create a simplified setup.py that doesn't link to vLLM directly
cat > setup_simple.py << 'EOF'
from setuptools import setup
from torch.utils.cpp_extension import CUDAExtension, BuildExtension
import os

# Get the directory paths
script_dir = os.path.dirname(os.path.abspath(__file__))
vllm_root = os.path.join(script_dir, '../../..')

setup(
    name='reshape_and_cache_xla_ext',
    ext_modules=[
        CUDAExtension(
            'reshape_and_cache_xla_ext',
            sources=['reshape_and_cache_flash_wrapper_standalone.cc'],
            include_dirs=[
                os.path.join(vllm_root, 'csrc'),
                vllm_root,
            ],
            extra_compile_args={
                'cxx': ['-O3', '-std=c++17'],
                'nvcc': [
                    '-O3',
                    '-std=c++17',
                    '--use_fast_math',
                    '-gencode', 'arch=compute_70,code=sm_70',
                    '-gencode', 'arch=compute_75,code=sm_75',
                    '-gencode', 'arch=compute_80,code=sm_80',
                    '-gencode', 'arch=compute_86,code=sm_86',
                ],
            },
        ),
    ],
    cmdclass={'build_ext': BuildExtension.with_options(no_python_abi_suffix=True)},
)
EOF

# Create a standalone version that includes a simplified kernel
cat > reshape_and_cache_flash_wrapper_standalone.cc << 'EOF'
#include <torch/extension.h>
#include <cuda_runtime.h>
#include <cstring>
#include <c10/cuda/CUDAStream.h>
#include <c10/cuda/CUDAGuard.h>
#include <ATen/cuda/CUDAContext.h>

// Simplified kernel for demonstration
__global__ void simple_reshape_and_cache_kernel(
    const float* key,
    const float* value,
    float* key_cache,
    float* value_cache,
    const int64_t* slot_mapping,
    int num_tokens,
    int num_heads,
    int head_size,
    int block_size) {
    
    int token_idx = blockIdx.x;
    if (token_idx >= num_tokens) return;
    
    int64_t slot_idx = slot_mapping[token_idx];
    if (slot_idx < 0) return;  // padding token
    
    int64_t block_idx = slot_idx / block_size;
    int64_t block_offset = slot_idx % block_size;
    
    // Simple copy for demonstration
    for (int i = threadIdx.x; i < num_heads * head_size; i += blockDim.x) {
        int head_idx = i / head_size;
        int head_offset = i % head_size;
        
        // Simplified indexing
        int src_idx = token_idx * num_heads * head_size + i;
        int dst_idx = block_idx * block_size * num_heads * head_size +
                      block_offset * num_heads * head_size +
                      head_idx * head_size + head_offset;
        
        key_cache[dst_idx] = key[src_idx];
        value_cache[dst_idx] = value[src_idx];
    }
}

// Simplified implementation
void reshape_and_cache_flash(
    torch::Tensor& key,
    torch::Tensor& value,
    torch::Tensor& key_cache,
    torch::Tensor& value_cache,
    torch::Tensor& slot_mapping,
    const std::string& kv_cache_dtype,
    torch::Tensor& k_scale,
    torch::Tensor& v_scale) {
    
    int num_tokens = slot_mapping.size(0);
    int num_heads = key.size(1);
    int head_size = key.size(2);
    int block_size = key_cache.size(1);
    
    dim3 grid(num_tokens);
    dim3 block(std::min(num_heads * head_size, 512));
    
    const at::cuda::OptionalCUDAGuard device_guard(key.device());
    const cudaStream_t stream = at::cuda::getCurrentCUDAStream();
    
    // Call simplified kernel
    simple_reshape_and_cache_kernel<<<grid, block, 0, stream>>>(
        key.data_ptr<float>(),
        value.data_ptr<float>(),
        key_cache.data_ptr<float>(),
        value_cache.data_ptr<float>(),
        slot_mapping.data_ptr<int64_t>(),
        num_tokens, num_heads, head_size, block_size
    );
}

// XLA Custom Call implementation
extern "C" void reshape_and_cache_flash_xla_custom_call(
    void* stream_ptr,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
    
    // Parse opaque descriptor
    std::string opaque_str(opaque, opaque_len);
    
    // Simple parsing
    size_t pos = 0;
    auto next_token = [&opaque_str, &pos]() -> std::string {
        size_t next_pos = opaque_str.find('|', pos);
        if (next_pos == std::string::npos) {
            std::string result = opaque_str.substr(pos);
            pos = opaque_str.length();
            return result;
        }
        std::string result = opaque_str.substr(pos, next_pos - pos);
        pos = next_pos + 1;
        return result;
    };
    
    std::string kv_cache_dtype = next_token();
    int64_t num_tokens = std::stoll(next_token());
    int64_t num_heads = std::stoll(next_token());
    int64_t head_size = std::stoll(next_token());
    int64_t num_blocks = std::stoll(next_token());
    int64_t block_size = std::stoll(next_token());
    bool has_k_scale = std::stoi(next_token()) != 0;
    bool has_v_scale = std::stoi(next_token()) != 0;
    
    // Create tensor wrappers
    auto dtype = at::kFloat;  // Simplified to float32
    
    torch::Tensor key = torch::from_blob(
        buffers[2],
        {num_tokens, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor value = torch::from_blob(
        buffers[3],
        {num_tokens, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor key_cache = torch::from_blob(
        buffers[0],
        {num_blocks, block_size, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor value_cache = torch::from_blob(
        buffers[1],
        {num_blocks, block_size, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor slot_mapping = torch::from_blob(
        buffers[4],
        {num_tokens},
        torch::TensorOptions().dtype(torch::kInt64).device(torch::kCUDA)
    );
    
    // Handle scales
    torch::Tensor k_scale = torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA));
    torch::Tensor v_scale = torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA));
    
    // Set CUDA stream
    cudaStream_t stream = reinterpret_cast<cudaStream_t>(stream_ptr);
    c10::cuda::CUDAStreamGuard stream_guard(c10::cuda::getStreamFromExternal(stream, key.device().index()));
    
    // Call the function
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    );
}

// Wrapper function for PyTorch
std::tuple<torch::Tensor, torch::Tensor> reshape_and_cache_flash_wrapper(
    torch::Tensor key,
    torch::Tensor value,
    torch::Tensor key_cache,
    torch::Tensor value_cache,
    torch::Tensor slot_mapping,
    const std::string& kv_cache_dtype,
    c10::optional<torch::Tensor> k_scale,
    c10::optional<torch::Tensor> v_scale) {
    
    // Clone the caches to return new tensors
    torch::Tensor key_cache_out = key_cache.clone();
    torch::Tensor value_cache_out = value_cache.clone();
    
    // Handle optional scales
    torch::Tensor k_scale_tensor = k_scale.value_or(
        torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(key.device()))
    );
    torch::Tensor v_scale_tensor = v_scale.value_or(
        torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(key.device()))
    );
    
    // Call the function
    reshape_and_cache_flash(
        key, value, key_cache_out, value_cache_out,
        slot_mapping, kv_cache_dtype, k_scale_tensor, v_scale_tensor
    );
    
    return std::make_tuple(key_cache_out, value_cache_out);
}

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("reshape_and_cache_flash_wrapper", &reshape_and_cache_flash_wrapper,
          "Reshape and cache flash attention KV pairs (standalone)",
          py::arg("key"),
          py::arg("value"),
          py::arg("key_cache"),
          py::arg("value_cache"),
          py::arg("slot_mapping"),
          py::arg("kv_cache_dtype"),
          py::arg("k_scale") = py::none(),
          py::arg("v_scale") = py::none());
}
EOF

# Build the extension
echo "Building Python extension..."
python setup_simple.py build_ext --inplace

# Create the XLA shared library
echo "Creating XLA shared library..."
g++ -shared -fPIC -o reshape_and_cache_xla.so \
    build/temp.*/reshape_and_cache_flash_wrapper_standalone.o \
    -L$(python -c "import torch; print(torch.__path__[0])")/lib \
    -lc10 -ltorch -ltorch_cpu -ltorch_cuda \
    -L${CUDA_HOME:-/usr/local/cuda}/lib64 -lcudart

# Clean up
rm -rf build *.egg-info setup_simple.py reshape_and_cache_flash_wrapper_standalone.cc

echo "✓ Build completed!"
echo "  - Python extension: reshape_and_cache_xla_ext*.so"
echo "  - XLA library: reshape_and_cache_xla.so"
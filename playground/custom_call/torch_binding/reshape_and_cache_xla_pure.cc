// Pure C++ implementation for XLA custom call
// No Python bindings - just the XLA custom call entry point

#include <torch/torch.h>
#include <c10/cuda/CUDAStream.h>
#include <c10/cuda/CUDAGuard.h>
#include <ATen/cuda/CUDAContext.h>
#include <cuda_runtime.h>
#include <stdio.h>
#include <sstream>
#include <string>
#include <vector>

// 工具函数，将 vector 转为字符串
std::string shape_to_string(const std::vector<long int>& shape) {
    std::ostringstream oss;
    oss << "[";
    for (size_t i = 0; i < shape.size(); ++i) {
        oss << shape[i];
        if (i != shape.size() - 1) {
            oss << ", ";
        }
    }
    oss << "]";
    return oss.str();
}

// Forward declaration of the vLLM function
void reshape_and_cache_flash(
    torch::Tensor& key,
    torch::Tensor& value,
    torch::Tensor& key_cache,
    torch::Tensor& value_cache,
    torch::Tensor& slot_mapping,
    const std::string& kv_cache_dtype,
    torch::Tensor& k_scale,
    torch::Tensor& v_scale);

// XLA Custom Call implementation
extern "C" {

void reshape_and_cache_flash_xla_custom_call(
    void* stream_ptr,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
    
    // Parse opaque descriptor
    std::string opaque_str(opaque, opaque_len);
    
    // Simple parsing of the opaque string
    // Format: "kv_cache_dtype|num_tokens|num_heads|head_size|num_blocks|block_size|has_k_scale|has_v_scale"
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
    
    // Parse parameters
    std::string kv_cache_dtype = next_token();
    int64_t num_tokens = std::stoll(next_token());
    int64_t num_heads = std::stoll(next_token());
    int64_t head_size = std::stoll(next_token());
    int64_t num_blocks = std::stoll(next_token());
    int64_t block_size = std::stoll(next_token());
    bool has_k_scale = std::stoi(next_token()) != 0;
    bool has_v_scale = std::stoi(next_token()) != 0;
    
    printf("Parsed parameters:\n");
    printf("  kv_cache_dtype: %s\n", kv_cache_dtype.c_str());
    printf("  num_tokens: %lld\n", num_tokens);
    printf("  num_heads: %lld\n", num_heads);
    printf("  head_size: %lld\n", head_size);
    printf("  num_blocks: %lld\n", num_blocks);
    printf("  block_size: %lld\n", block_size);
    printf("  has_k_scale: %d\n", has_k_scale);
    printf("  has_v_scale: %d\n", has_v_scale);

    // Determine data type
    auto dtype = at::kFloat;
    if (kv_cache_dtype == "half" || kv_cache_dtype == "float16") {
        dtype = at::kHalf;
    } else if (kv_cache_dtype == "bfloat16") {
        dtype = at::kBFloat16;
    } else if (kv_cache_dtype == "float8_e4m3fn") {
        dtype = at::kFloat8_e4m3fn;
    } else if (kv_cache_dtype == "float8_e5m2") {
        dtype = at::kFloat8_e5m2;
    }
    
    // Buffer layout:
    // buffers[0]: key (input)
    // buffers[1]: value (input)
    // buffers[2]: key_cache (output)
    // buffers[3]: value_cache (output)
    // buffers[4]: slot_mapping (input)
    // buffers[5]: k_scale (optional input)
    // buffers[6]: v_scale (optional input)
    
    // Create tensor wrappers for inputs
    torch::Tensor key = torch::from_blob(
        buffers[0],
        {num_tokens, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor value = torch::from_blob(
        buffers[1],
        {num_tokens, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor slot_mapping = torch::from_blob(
        buffers[4],
        {num_tokens},
        torch::TensorOptions().dtype(torch::kInt64).device(torch::kCUDA)
    );
    
    // Handle optional scales
    torch::Tensor k_scale, v_scale;
    int buffer_idx = 5;
    
    if (has_k_scale) {
        k_scale = torch::from_blob(
            buffers[buffer_idx++],
            {1},
            torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA)
        );
    } else {
        k_scale = torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA));
    }
    
    if (has_v_scale) {
        v_scale = torch::from_blob(
            buffers[buffer_idx++],
            {1},
            torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA)
        );
    } else {
        v_scale = torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA));
    }
    int out_buffer_idx = buffer_idx;
    printf("buffer[2]: %p, buffer[%d]: %p\n", buffers[2], out_buffer_idx, buffers[out_buffer_idx]);
    // Create tensor wrappers for caches (output)
    torch::Tensor key_cache = torch::from_blob(
        buffers[out_buffer_idx++],
        {num_blocks, block_size, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    printf("buffer[3]: %p, buffer[%d]: %p\n", buffers[3], out_buffer_idx, buffers[out_buffer_idx]);
    torch::Tensor value_cache = torch::from_blob(
        buffers[out_buffer_idx++],
        {num_blocks, block_size, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );

    printf("  Key cache shape: %s\n", shape_to_string(key_cache.sizes().vec()).c_str());
    printf("  Value cache shape: %s\n", shape_to_string(value_cache.sizes().vec()).c_str());
    printf("  Key shape: %s\n", shape_to_string(key.sizes().vec()).c_str());
    printf("  Value shape: %s\n", shape_to_string(value.sizes().vec()).c_str());
    printf("  Slot mapping shape: %s\n", shape_to_string(slot_mapping.sizes().vec()).c_str());

    // Set CUDA stream
    cudaStream_t stream = reinterpret_cast<cudaStream_t>(stream_ptr);
    c10::cuda::CUDAStreamGuard stream_guard(c10::cuda::getStreamFromExternal(stream, key.device().index()));
    
    // Call the actual vLLM function
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    );
}

} // extern "C"
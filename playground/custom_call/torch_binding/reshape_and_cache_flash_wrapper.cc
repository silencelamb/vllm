// C++ wrapper that calls the actual reshape_and_cache_flash from cache_kernels.cu
#include <torch/extension.h>
#include <cuda_runtime.h>
#include <cstring>

// Forward declaration of the reshape_and_cache_flash function from cache_kernels.cu
extern void reshape_and_cache_flash(
    torch::Tensor& key,
    torch::Tensor& value,
    torch::Tensor& key_cache,
    torch::Tensor& value_cache,
    torch::Tensor& slot_mapping,
    const std::string& kv_cache_dtype,
    torch::Tensor& k_scale,
    torch::Tensor& v_scale);

// XLA Custom Call implementation
extern "C" void reshape_and_cache_flash_xla_custom_call(
    void* stream_ptr,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
    
    // Parse opaque descriptor
    // Format: "dtype_str|num_tokens|num_heads|head_size|num_blocks|block_size|has_k_scale|has_v_scale"
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
    
    // Buffers layout:
    // Inputs/Outputs: [0] key_cache, [1] value_cache
    // Inputs: [2] key, [3] value, [4] slot_mapping, [5] k_scale (optional), [6] v_scale (optional)
    
    // Determine dtype from first tensor
    auto dtype = at::kFloat;  // Default to float32
    
    // Create tensor wrappers for inputs
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
    
    int buffer_idx = 5;
    torch::Tensor k_scale = has_k_scale ? 
        torch::from_blob(buffers[buffer_idx++], {1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA)) :
        torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA));
    
    torch::Tensor v_scale = has_v_scale ?
        torch::from_blob(buffers[buffer_idx], {1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA)) :
        torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA));
    
    // Set CUDA stream
    cudaStream_t stream = reinterpret_cast<cudaStream_t>(stream_ptr);
    at::cuda::setCurrentCUDAStream(stream);
    
    // Call the actual function
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    );
    
    // Since we're updating in-place, copy the results to output buffers
    // XLA expects the outputs in the first buffers
    // This is already the case as we're modifying key_cache and value_cache in-place
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
    
    // Clone the caches to return new tensors (TPU-style)
    torch::Tensor key_cache_out = key_cache.clone();
    torch::Tensor value_cache_out = value_cache.clone();
    
    // Handle optional scales
    torch::Tensor k_scale_tensor = k_scale.value_or(
        torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(key.device()))
    );
    torch::Tensor v_scale_tensor = v_scale.value_or(
        torch::ones({1}, torch::TensorOptions().dtype(torch::kFloat).device(key.device()))
    );
    
    // Call the actual function on the cloned tensors
    reshape_and_cache_flash(
        key, value, key_cache_out, value_cache_out,
        slot_mapping, kv_cache_dtype, k_scale_tensor, v_scale_tensor
    );
    
    return std::make_tuple(key_cache_out, value_cache_out);
}

// Pybind11 module
PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("reshape_and_cache_flash_wrapper", &reshape_and_cache_flash_wrapper,
          "Reshape and cache flash attention KV pairs (wrapper)",
          py::arg("key"),
          py::arg("value"),
          py::arg("key_cache"),
          py::arg("value_cache"),
          py::arg("slot_mapping"),
          py::arg("kv_cache_dtype"),
          py::arg("k_scale") = py::none(),
          py::arg("v_scale") = py::none());
}
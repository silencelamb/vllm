#include <torch/extension.h>
#include <ATen/cuda/CUDAContext.h>
#include <c10/cuda/CUDAGuard.h>
#include <vector>

// 前向声明 XLA custom call
extern "C" void ReshapeAndCacheFlashCustomCall(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len);

// PyTorch 操作的实现
void reshape_and_cache_flash_torch(
    torch::Tensor key,
    torch::Tensor value,
    torch::Tensor key_cache,
    torch::Tensor value_cache,
    torch::Tensor slot_mapping,
    const std::string& kv_cache_dtype,
    torch::Tensor k_scale,
    torch::Tensor v_scale) {
    
    // 检查输入
    TORCH_CHECK(key.is_cuda(), "key must be a CUDA tensor");
    TORCH_CHECK(value.is_cuda(), "value must be a CUDA tensor");
    TORCH_CHECK(key_cache.is_cuda(), "key_cache must be a CUDA tensor");
    TORCH_CHECK(value_cache.is_cuda(), "value_cache must be a CUDA tensor");
    TORCH_CHECK(slot_mapping.is_cuda(), "slot_mapping must be a CUDA tensor");
    
    // 获取维度信息
    int num_tokens = key.size(0);
    int num_heads = key.size(1);
    int head_size = key.size(2);
    int block_size = key_cache.size(1);  // 假设 key_cache 的第二维是 block_size
    
    // 准备 opaque 字符串
    std::string opaque = kv_cache_dtype + "|" + 
                        std::to_string(num_tokens) + "|" +
                        std::to_string(num_heads) + "|" +
                        std::to_string(head_size) + "|" +
                        std::to_string(block_size);
    
    // 准备缓冲区指针
    std::vector<void*> buffers = {
        key.data_ptr(),
        value.data_ptr(),
        key_cache.data_ptr(),
        value_cache.data_ptr(),
        slot_mapping.data_ptr(),
        k_scale.data_ptr(),
        v_scale.data_ptr()
    };
    
    // 获取 CUDA stream
    const at::cuda::OptionalCUDAGuard device_guard(key.device());
    cudaStream_t stream = at::cuda::getCurrentCUDAStream();
    
    // 调用 XLA custom call 实现
    ReshapeAndCacheFlashCustomCall(
        stream,
        buffers.data(),
        opaque.c_str(),
        opaque.length()
    );
}

// Pybind11 绑定
PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("reshape_and_cache_flash", &reshape_and_cache_flash_torch,
          "Reshape and cache flash attention KV pairs",
          py::arg("key"),
          py::arg("value"),
          py::arg("key_cache"),
          py::arg("value_cache"),
          py::arg("slot_mapping"),
          py::arg("kv_cache_dtype"),
          py::arg("k_scale"),
          py::arg("v_scale"));
}

// 注册为 torch.ops
TORCH_LIBRARY(vllm_xla, m) {
    m.def("reshape_and_cache_flash(Tensor key, Tensor value, "
          "Tensor key_cache, Tensor value_cache, "
          "Tensor slot_mapping, str kv_cache_dtype, "
          "Tensor k_scale, Tensor v_scale) -> ()");
}

TORCH_LIBRARY_IMPL(vllm_xla, CUDA, m) {
    m.impl("reshape_and_cache_flash", &reshape_and_cache_flash_torch);
}
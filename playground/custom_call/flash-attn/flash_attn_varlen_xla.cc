// XLA Custom Call wrapper for flash_attn_varlen_func
// This wraps the flash-attention mha_varlen_fwd function for use with XLA

#include <torch/torch.h>
#include <c10/cuda/CUDAStream.h>
#include <c10/cuda/CUDAGuard.h>
#include <ATen/cuda/CUDAContext.h>
#include <cuda_runtime.h>
#include <stdio.h>
#include <sstream>
#include <string>
#include <vector>

// Forward declaration of the flash-attention function from vLLM
// This matches the signature in vllm/vllm_flash_attn/_vllm_fa2_C.so
namespace torch {
namespace ops {
namespace _vllm_fa2_C {

// The actual varlen_fwd function signature from flash-attention
// Returns: (out, softmax_lse)
std::vector<at::Tensor> varlen_fwd(
    at::Tensor& q,              // total_q x num_heads x head_size
    at::Tensor& k,              // total_k x num_heads_k x head_size  
    at::Tensor& v,              // total_k x num_heads_k x head_size
    at::Tensor& out,            // total_q x num_heads x head_size
    at::Tensor& cu_seqlens_q,   // batch_size + 1
    at::Tensor& cu_seqlens_k,   // batch_size + 1  
    at::Tensor& seqused_k,      // batch_size (optional)
    at::Tensor& leftpad_k,      // batch_size (optional) 
    at::Tensor& block_table,    // batch_size x max_blocks (optional)
    at::Tensor& alibi_slopes,   // num_heads (optional)
    int max_seqlen_q,
    int max_seqlen_k,
    float p_dropout,
    float softmax_scale,
    bool zero_tensors,
    bool is_causal,
    int window_size_left,
    int window_size_right,
    float softcap,
    bool return_softmax,
    at::Generator gen
);

} // namespace _vllm_fa2_C
} // namespace ops
} // namespace torch

// Utility function to convert shape to string
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

// XLA Custom Call implementation
extern "C" {

void flash_attn_varlen_xla_custom_call(
    void* stream_ptr,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
    
    // Parse opaque descriptor
    std::string opaque_str(opaque, opaque_len);
    
    // Descriptor format: "batch_size|max_seqlen_q|max_seqlen_k|num_heads|num_heads_k|head_size|total_q|total_k|softmax_scale|is_causal|window_left|window_right|softcap|has_block_table|has_seqused_k"
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
    int64_t batch_size = std::stoll(next_token());
    int64_t max_seqlen_q = std::stoll(next_token());
    int64_t max_seqlen_k = std::stoll(next_token());
    int64_t num_heads = std::stoll(next_token());
    int64_t num_heads_k = std::stoll(next_token());
    int64_t head_size = std::stoll(next_token());
    int64_t total_q = std::stoll(next_token());
    int64_t total_k = std::stoll(next_token());
    float softmax_scale = std::stof(next_token());
    bool is_causal = std::stoi(next_token()) != 0;
    int window_size_left = std::stoi(next_token());
    int window_size_right = std::stoi(next_token());
    float softcap = std::stof(next_token());
    bool has_block_table = std::stoi(next_token()) != 0;
    bool has_seqused_k = std::stoi(next_token()) != 0;
    
    printf("Flash Attention Parameters:\n");
    printf("  batch_size: %lld\n", batch_size);
    printf("  max_seqlen_q: %lld\n", max_seqlen_q);
    printf("  max_seqlen_k: %lld\n", max_seqlen_k);
    printf("  num_heads: %lld\n", num_heads);
    printf("  num_heads_k: %lld\n", num_heads_k);
    printf("  head_size: %lld\n", head_size);
    printf("  total_q: %lld\n", total_q);
    printf("  total_k: %lld\n", total_k);
    printf("  softmax_scale: %f\n", softmax_scale);
    printf("  is_causal: %d\n", is_causal);
    printf("  window_size: [%d, %d]\n", window_size_left, window_size_right);
    printf("  softcap: %f\n", softcap);
    printf("  has_block_table: %d\n", has_block_table);
    printf("  has_seqused_k: %d\n", has_seqused_k);

    // Buffer layout:
    // Inputs:
    // buffers[0]: q (total_q, num_heads, head_size)
    // buffers[1]: k (total_k, num_heads_k, head_size) or (num_blocks, block_size, num_heads_k, head_size) if paged
    // buffers[2]: v (total_k, num_heads_k, head_size) or (num_blocks, block_size, num_heads_k, head_size) if paged
    // buffers[3]: cu_seqlens_q (batch_size + 1)
    // buffers[4]: cu_seqlens_k (batch_size + 1) - dummy if using seqused_k
    // buffers[5]: seqused_k (batch_size) - optional
    // buffers[6]: block_table (batch_size, max_blocks) - optional
    // Outputs (at the end):
    // buffers[n-2]: out (total_q, num_heads, head_size)
    // buffers[n-1]: softmax_lse (num_heads, total_q)
    
    int buffer_idx = 0;
    
    // Determine data type - for now assume float16
    auto dtype = at::kHalf;
    
    // Create tensor wrappers for inputs
    torch::Tensor q = torch::from_blob(
        buffers[buffer_idx++],
        {total_q, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor k = torch::from_blob(
        buffers[buffer_idx++],
        {total_k, num_heads_k, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor v = torch::from_blob(
        buffers[buffer_idx++],
        {total_k, num_heads_k, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor cu_seqlens_q = torch::from_blob(
        buffers[buffer_idx++],
        {batch_size + 1},
        torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA)
    );
    
    torch::Tensor cu_seqlens_k = torch::from_blob(
        buffers[buffer_idx++],
        {batch_size + 1},
        torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA)
    );
    
    // Optional tensors
    torch::Tensor seqused_k;
    if (has_seqused_k) {
        seqused_k = torch::from_blob(
            buffers[buffer_idx++],
            {batch_size},
            torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA)
        );
    } else {
        // Create empty tensor for the API
        seqused_k = torch::empty({0}, torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA));
    }
    
    torch::Tensor block_table;
    int max_blocks = 0;
    if (has_block_table) {
        // Need to know max_blocks - parse from remaining shape info or hardcode
        max_blocks = 256; // Default value, should be passed in descriptor
        block_table = torch::from_blob(
            buffers[buffer_idx++],
            {batch_size, max_blocks},
            torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA)
        );
    } else {
        block_table = torch::empty({0}, torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA));
    }
    
    // Output buffers are at the end
    int out_buffer_idx = buffer_idx;
    torch::Tensor out = torch::from_blob(
        buffers[out_buffer_idx++],
        {total_q, num_heads, head_size},
        torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
    );
    
    torch::Tensor softmax_lse = torch::from_blob(
        buffers[out_buffer_idx++],
        {num_heads, total_q},
        torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA)
    );

    printf("  Q shape: %s\n", shape_to_string(q.sizes().vec()).c_str());
    printf("  K shape: %s\n", shape_to_string(k.sizes().vec()).c_str());
    printf("  V shape: %s\n", shape_to_string(v.sizes().vec()).c_str());
    printf("  Out shape: %s\n", shape_to_string(out.sizes().vec()).c_str());
    printf("  Softmax LSE shape: %s\n", shape_to_string(softmax_lse.sizes().vec()).c_str());

    // Set CUDA stream
    cudaStream_t stream = reinterpret_cast<cudaStream_t>(stream_ptr);
    c10::cuda::CUDAStreamGuard stream_guard(c10::cuda::getStreamFromExternal(stream, q.device().index()));
    
    // Create empty tensors for unused parameters
    torch::Tensor leftpad_k = torch::empty({0}, torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA));
    torch::Tensor alibi_slopes = torch::empty({0}, torch::TensorOptions().dtype(torch::kFloat).device(torch::kCUDA));
    
    // Call the actual flash-attention function
    // Note: We're using the vLLM compiled version
    auto results = torch::ops::_vllm_fa2_C::varlen_fwd(
        q, k, v, out,
        cu_seqlens_q,
        cu_seqlens_k,
        seqused_k,
        leftpad_k,     // empty - not used
        block_table,
        alibi_slopes,  // empty - not used
        max_seqlen_q,
        max_seqlen_k,
        0.0f,          // p_dropout - no dropout for inference
        softmax_scale,
        false,         // zero_tensors
        is_causal,
        window_size_left,
        window_size_right,
        softcap,
        false,         // return_softmax - we don't need the full attention matrix
        at::Generator() // dummy generator since no dropout
    );
    
    // Results are already written to the output buffers (out and softmax_lse)
    // since we passed them as references
}

} // extern "C"
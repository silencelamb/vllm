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
#include <optional>

// Forward declaration of the flash-attention function from vLLM
// This matches the signature in vllm/vllm_flash_attn/_vllm_fa2_C.so
namespace flash {

// The actual mha_varlen_fwd function signature from flash-attention
// Based on the symbol: _ZN5flash14mha_varlen_fwdERN2at6TensorERKS1_S4_RSt8optionalIS1_ES4_S4_S7_RS5_IS3_ES7_S7_iiffbbiifbS5_INS0_9GeneratorEE
std::vector<at::Tensor> mha_varlen_fwd(
    at::Tensor& q,                          // total_q x num_heads x head_size
    const at::Tensor& k,                    // total_k x num_heads_k x head_size  
    const at::Tensor& v,                    // total_k x num_heads_k x head_size
    std::optional<at::Tensor>& out_,        // total_q x num_heads x head_size
    const at::Tensor& cu_seqlens_q,         // batch_size + 1
    const at::Tensor& cu_seqlens_k,         // batch_size + 1  
    std::optional<at::Tensor>& seqused_k,   // batch_size (optional)
    std::optional<const at::Tensor>& leftpad_k_, // batch_size (optional) 
    std::optional<at::Tensor>& block_table_, // batch_size x max_blocks (optional)
    std::optional<at::Tensor>& alibi_slopes_, // num_heads (optional)
    int max_seqlen_q,
    const int max_seqlen_k,
    const float p_dropout,
    const float softmax_scale,
    const bool zero_tensors,
    bool is_causal,
    int window_size_left,
    int window_size_right,
    const float softcap,
    const bool return_softmax,
    std::optional<at::Generator> gen_
);

} // namespace flash

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
    
    // Descriptor format: "batch_size|max_seqlen_q|max_seqlen_k|num_heads|num_heads_k|head_size|total_q|total_k|softmax_scale|is_causal|window_left|window_right|softcap|has_block_table|has_seqused_k|block_size|max_blocks_per_seq"
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
    int block_size = has_block_table ? std::stoi(next_token()) : 0;
    int max_blocks_per_seq = has_block_table ? std::stoi(next_token()) : 0;
    
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
    if (has_block_table) {
        printf("  block_size: %d, max_blocks_per_seq: %d\n", block_size, max_blocks_per_seq);
    }

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
    
    torch::Tensor k, v;
    if (has_block_table) {
        // For paged KV cache, K and V have shape (num_blocks, block_size, num_heads_k, head_size)
        int num_blocks = batch_size * max_blocks_per_seq;
        k = torch::from_blob(
            buffers[buffer_idx++],
            {num_blocks, block_size, num_heads_k, head_size},
            torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
        );
        
        v = torch::from_blob(
            buffers[buffer_idx++],
            {num_blocks, block_size, num_heads_k, head_size},
            torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
        );
    } else {
        // Regular K and V tensors
        k = torch::from_blob(
            buffers[buffer_idx++],
            {total_k, num_heads_k, head_size},
            torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
        );
        
        v = torch::from_blob(
            buffers[buffer_idx++],
            {total_k, num_heads_k, head_size},
            torch::TensorOptions().dtype(dtype).device(torch::kCUDA)
        );
    }
    
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
    std::optional<at::Tensor> block_table_opt;
    if (has_block_table) {
        block_table = torch::from_blob(
            buffers[buffer_idx++],
            {batch_size, max_blocks_per_seq},
            torch::TensorOptions().dtype(torch::kInt32).device(torch::kCUDA)
        );
        block_table_opt = block_table;
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
    
    // Create optional parameters
    std::optional<at::Tensor> out_opt = out;
    std::optional<at::Tensor> seqused_k_opt;
    if (has_seqused_k) {
        seqused_k_opt = seqused_k;
    }
    
    std::optional<const at::Tensor> leftpad_k_opt;  // Leave empty
    std::optional<at::Tensor> alibi_slopes_opt;      // Leave empty
    std::optional<at::Generator> gen_opt;            // Leave empty
    
    // Call the actual flash-attention function
    // Note: We're using the vLLM compiled version in flash namespace
    auto results = flash::mha_varlen_fwd(
        q, k, v,
        out_opt,
        cu_seqlens_q,
        cu_seqlens_k,
        seqused_k_opt,
        leftpad_k_opt,     // empty - not used
        block_table_opt,
        alibi_slopes_opt,  // empty - not used
        max_seqlen_q,
        max_seqlen_k,
        0.0f,              // p_dropout - no dropout for inference
        softmax_scale,
        false,             // zero_tensors
        is_causal,
        window_size_left,
        window_size_right,
        softcap,
        false,             // return_softmax - we don't need the full attention matrix
        gen_opt            // empty generator since no dropout
    );
    
    // The results vector contains [output, softmax_lse]
    // The output tensor is already in our 'out' buffer
    // Copy softmax_lse if it was returned
    if (results.size() > 1 && results[1].defined()) {
        softmax_lse.copy_(results[1]);
    } else {
        // If softmax_lse wasn't returned, initialize with zeros
        softmax_lse.zero_();
    }
}

} // extern "C"
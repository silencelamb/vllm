// XLA Custom Call wrapper for vLLM rms_norm CUDA kernel
#include <torch/extension.h>
#include <ATen/cuda/CUDAContext.h>
#include <c10/cuda/CUDAStream.h>
#include <cstdint>
#include <cstring>

// Forward declaration of the existing vLLM rms_norm function
// This is defined in vllm._C module (already compiled)
extern "C" void rms_norm(torch::Tensor& out, torch::Tensor& input, 
                        torch::Tensor& weight, double epsilon);

// XLA Custom Call descriptor structure
struct RmsNormDescriptor {
  float epsilon;
  int64_t batch_size;
  int64_t hidden_size;
  int32_t dtype;  // 0: float32, 1: float16, 2: bfloat16
};

extern "C" {

// XLA Custom Call implementation for rms_norm
void rms_norm_xla_custom_call(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len) {
  
  // Parse descriptor from opaque data
  RmsNormDescriptor descriptor;
  std::memcpy(&descriptor, opaque, sizeof(RmsNormDescriptor));
  
  // Get input/output buffers
  void* output_buffer = buffers[0];
  const void* input_buffer = buffers[1];
  const void* weight_buffer = buffers[2];
  
  // Determine dtype and create tensors
  auto options = torch::TensorOptions()
      .device(torch::kCUDA)
      .requires_grad(false);
  
  // Set dtype based on descriptor
  if (descriptor.dtype == 1) {
    options = options.dtype(torch::kFloat16);
  } else if (descriptor.dtype == 2) {
    options = options.dtype(torch::kBFloat16);
  } else {
    options = options.dtype(torch::kFloat32);
  }
  
  // Create tensor views from buffers
  // Note: batch_size here represents total number of tokens (batch * seq_len)
  torch::Tensor input = torch::from_blob(
      const_cast<void*>(input_buffer),
      {descriptor.batch_size, descriptor.hidden_size},
      options);
  
  torch::Tensor weight = torch::from_blob(
      const_cast<void*>(weight_buffer),
      {descriptor.hidden_size},
      options);
  
  torch::Tensor output = torch::from_blob(
      output_buffer,
      {descriptor.batch_size, descriptor.hidden_size},
      options);
  
  // Set the CUDA stream
  at::cuda::CUDAStreamGuard guard(
      at::cuda::getStreamFromExternal(stream, c10::DeviceIndex(0)));
  
  // Call the existing vLLM rms_norm kernel
  rms_norm(output, input, weight, descriptor.epsilon);
}

// Registration function to be called from Python
void register_rms_norm_xla_custom_call() {
  // This will be called from Python to ensure the symbol is available
  // The actual registration happens through XLA's mechanism
}

} // extern "C"

// Python bindings
PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
  m.def("register_rms_norm_xla_custom_call", 
        &register_rms_norm_xla_custom_call,
        "Register RMS norm XLA custom call");
}
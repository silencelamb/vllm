"""Example showing how to create XLA custom call with CUDA kernel."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from torch.utils.cpp_extension import load_inline
import os


# Define CUDA source code
cuda_source = '''
#include <torch/extension.h>
#include <cuda_runtime.h>

// Simple CUDA kernel
__global__ void simple_add_kernel(
    const float* a,
    const float* b,
    float* out,
    int size) {
    
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = a[idx] + b[idx];
    }
}

// Wrapper function callable from Python
torch::Tensor simple_add_cuda(
    torch::Tensor a,
    torch::Tensor b) {
    
    // Check inputs
    TORCH_CHECK(a.is_cuda(), "a must be a CUDA tensor");
    TORCH_CHECK(b.is_cuda(), "b must be a CUDA tensor");
    TORCH_CHECK(a.sizes() == b.sizes(), "Tensors must have same shape");
    TORCH_CHECK(a.scalar_type() == torch::ScalarType::Float, "Only float tensors supported");
    
    // Create output tensor
    auto out = torch::empty_like(a);
    
    // Get size
    int size = a.numel();
    
    // Launch kernel
    const int threads = 256;
    const int blocks = (size + threads - 1) / threads;
    
    simple_add_kernel<<<blocks, threads>>>(
        a.data_ptr<float>(),
        b.data_ptr<float>(),
        out.data_ptr<float>(),
        size
    );
    
    // Check for errors
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        AT_ERROR("CUDA kernel failed: ", cudaGetErrorString(err));
    }
    
    return out;
}

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("simple_add_cuda", &simple_add_cuda, "Simple add CUDA kernel");
}
'''

# C++ source for CPU version
cpp_source = '''
#include <torch/extension.h>

torch::Tensor simple_add_cpu(
    torch::Tensor a,
    torch::Tensor b) {
    return a + b;
}

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("simple_add_cpu", &simple_add_cpu, "Simple add CPU");
}
'''


def create_custom_op_with_cuda():
    """Create custom op with actual CUDA implementation."""
    
    print("Creating Custom Op with CUDA Kernel")
    print("=" * 60)
    
    # Load the CUDA extension
    print("\n1. Compiling CUDA kernel...")
    try:
        # JIT compile the CUDA code
        cuda_ext = load_inline(
            name='simple_add_cuda_ext',
            cpp_sources=[],
            cuda_sources=[cuda_source],
            functions=['simple_add_cuda'],
            verbose=True,
            extra_cuda_cflags=['-O2']
        )
        print("✅ CUDA kernel compiled successfully")
        has_cuda = True
    except Exception as e:
        print(f"⚠️  CUDA compilation failed: {e}")
        print("   Falling back to CPU implementation")
        has_cuda = False
    
    # Create torch.library op
    lib = torch.library.Library("xla_gpu_cuda", "DEF")
    lib.define("simple_add(Tensor a, Tensor b) -> Tensor")
    
    # CPU implementation
    @torch.library.impl(lib, "simple_add", "CPU")
    def simple_add_cpu_impl(a, b):
        return a + b
    
    if has_cuda:
        # CUDA implementation using our kernel
        @torch.library.impl(lib, "simple_add", "CUDA")
        def simple_add_cuda_impl(a, b):
            return cuda_ext.simple_add_cuda(a, b)
    
    # XLA implementation
    @torch.library.impl(lib, "simple_add", "XLA")
    def simple_add_xla_impl(a, b):
        # For XLA, we have two options:
        
        # Option 1: Use regular ops (works immediately)
        return a + b
        
        # Option 2: Try to use custom call (requires XLA runtime registration)
        # Uncomment to test:
        # output_shape = list(a.shape)
        # output_dtype = a.dtype
        # result = torch_xla._XLAC._xla_custom_call(
        #     [a, b],
        #     "SimpleAddCuda",  # Would need to register this with XLA
        #     [output_shape],
        #     [output_dtype],
        #     False,
        #     "",
        #     4,
        #     {}
        # )[0]
        # return result
    
    # Meta implementation
    @torch.library.impl_abstract("xla_gpu_cuda::simple_add")
    def simple_add_meta(a, b):
        return torch.empty_like(a)
    
    print("\n✅ Custom op registered with torch.library")
    return has_cuda


def test_cuda_kernel():
    """Test the CUDA kernel directly."""
    
    if not torch.cuda.is_available():
        print("\n⚠️  CUDA not available, skipping CUDA tests")
        return
    
    print("\n\nTesting CUDA Kernel")
    print("=" * 60)
    
    # Test on CUDA
    a = torch.tensor([1.0, 2.0, 3.0, 4.0, 5.0]).cuda()
    b = torch.tensor([5.0, 4.0, 3.0, 2.0, 1.0]).cuda()
    
    result = torch.ops.xla_gpu_cuda.simple_add(a, b)
    expected = a + b
    
    print(f"Input A: {a}")
    print(f"Input B: {b}")
    print(f"Result:  {result}")
    print(f"Expected: {expected}")
    
    if torch.allclose(result, expected):
        print("✅ CUDA kernel test passed!")
    else:
        print("❌ CUDA kernel test failed!")


def test_xla_execution():
    """Test execution on XLA device."""
    
    print("\n\nTesting XLA Execution")
    print("=" * 60)
    
    device = xm.xla_device()
    
    # Create inputs
    a = torch.tensor([1.0, 2.0, 3.0, 4.0, 5.0]).to(device)
    b = torch.tensor([5.0, 4.0, 3.0, 2.0, 1.0]).to(device)
    
    print(f"Device: {device}")
    print(f"Input shapes: {a.shape}, {b.shape}")
    
    # Call custom op
    result = torch.ops.xla_gpu_cuda.simple_add(a, b)
    
    # Execute
    xm.mark_step()
    xm.wait_device_ops()
    
    # Get result
    result_cpu = result.cpu()
    expected = torch.tensor([6.0, 6.0, 6.0, 6.0, 6.0])
    
    print(f"Result: {result_cpu}")
    print(f"Expected: {expected}")
    
    if torch.allclose(result_cpu, expected):
        print("✅ XLA execution test passed!")
    else:
        print("❌ XLA execution test failed!")


def demonstrate_real_world_pattern():
    """Show how this would be used in a real project."""
    
    print("\n\nReal-World Usage Pattern")
    print("=" * 60)
    
    print("""
For a production XLA GPU project like vLLM:

1. **Development Phase**:
   - Use pure PyTorch ops in XLA implementation
   - This works immediately without C++ code
   - Example: `return a + b`

2. **Optimization Phase**:
   - Profile to find bottlenecks
   - Write CUDA kernels for critical ops
   - Register with torch.library as shown

3. **Integration Phase**:
   - Package C++ code properly
   - Create setup.py for distribution
   - Handle both CPU and GPU backends

4. **Advanced Phase** (if needed):
   - Register custom calls with XLA runtime
   - Use XLA FFI for direct integration
   - Optimize for specific hardware

Example for vLLM paged attention:
""")
    
    print("""
# In vllm/kernels/xla_gpu_kernels.cu
__global__ void paged_attention_kernel(...) {
    // Efficient CUDA implementation
}

# In vllm/v1/attention/backends/xla_gpu.py
@torch.library.impl(lib, "paged_attention", "XLA")
def paged_attention_xla(...):
    # For now: use PyTorch ops
    # Later: call CUDA kernel via custom call
    return attention_output
""")


if __name__ == "__main__":
    print("XLA GPU Custom Op with CUDA Kernel")
    print("=" * 80)
    
    # Create and register the custom op
    has_cuda = create_custom_op_with_cuda()
    
    # Run tests
    if has_cuda:
        test_cuda_kernel()
    test_xla_execution()
    
    # Show real-world patterns
    demonstrate_real_world_pattern()
    
    print("\n" + "=" * 80)
    print("\n📝 Summary:")
    print("1. CUDA kernels can be JIT compiled with load_inline")
    print("2. Custom ops work on XLA using PyTorch ops")
    print("3. Full custom call integration requires XLA runtime work")
    print("4. For most cases, PyTorch ops + XLA compilation is sufficient")
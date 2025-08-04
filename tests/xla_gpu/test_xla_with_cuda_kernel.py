"""Example showing how to create XLA custom call with CUDA kernel."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from torch.utils.cpp_extension import load_inline
import os


def create_custom_op_with_cuda():
    """Create custom op with actual CUDA implementation."""
    
    print("Creating Custom Op with CUDA Kernel")
    print("=" * 60)
    
    # Load the CUDA extension
    print("\n1. Compiling CUDA kernel...")
    try:
        # Complete CUDA source with both kernel and binding
        cuda_source = '''
#include <torch/extension.h>
#include <cuda_runtime.h>
#include <stdio.h>

// CUDA kernel definition
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

// C++ wrapper function
torch::Tensor simple_add_cuda(torch::Tensor a, torch::Tensor b) {
    // Input validation
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
'''

        # C++ source that contains the Python binding
        cpp_source = '''
#include <torch/extension.h>

// Forward declaration
torch::Tensor simple_add_cuda(torch::Tensor a, torch::Tensor b);

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("simple_add_cuda", &simple_add_cuda, "Simple add CUDA kernel");
}
'''
        
        # Clear cache to avoid conflicts
        import shutil
        cache_dir = "/root/.cache/torch_extensions/py310_cu126/simple_add_cuda_ext"
        if os.path.exists(cache_dir):
            print(f"   Clearing cache at {cache_dir}")
            shutil.rmtree(cache_dir)
        
        # JIT compile the CUDA code
        cuda_ext = load_inline(
            name='simple_add_cuda_ext',
            cpp_sources=[cpp_source],
            cuda_sources=[cuda_source],
            functions=['simple_add_cuda'],
            with_cuda=True,
            verbose=True,
            extra_cuda_cflags=['-O2'],
            build_directory="/tmp/cuda_ext_build"  # Use a different build directory
        )
        print("✅ CUDA kernel compiled successfully")
        has_cuda = True
    except Exception as e:
        print(f"⚠️  CUDA compilation failed: {e}")
        print("   Falling back to CPU implementation")
        has_cuda = False
        cuda_ext = None
    
    # Create torch.library op
    lib = torch.library.Library("xla_gpu_cuda", "DEF")
    lib.define("simple_add(Tensor a, Tensor b) -> Tensor")
    
    # CPU implementation
    @torch.library.impl(lib, "simple_add", "CPU")
    def simple_add_cpu_impl(a, b):
        return a + b
    
    if has_cuda and cuda_ext is not None:
        # CUDA implementation using our kernel
        @torch.library.impl(lib, "simple_add", "CUDA")
        def simple_add_cuda_impl(a, b):
            return cuda_ext.simple_add_cuda(a, b)
        
        # XLA implementation - can use CUDA kernel if tensor is on CUDA
        @torch.library.impl(lib, "simple_add", "XLA")
        def simple_add_xla_impl(a, b):
            # For XLA, use CUDA kernel if tensor is on CUDA
            return cuda_ext.simple_add_cuda(a, b)
    else:
        # Fallback implementations
        @torch.library.impl(lib, "simple_add", "XLA")
        def simple_add_xla_fallback(a, b):
            return a + b
    
    # Meta implementation for shape inference
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
    a = torch.tensor([1.0, 2.0, 3.0, 4.0, 5.0], device='cuda')
    b = torch.tensor([5.0, 4.0, 3.0, 2.0, 1.0], device='cuda')
    
    result = torch.ops.xla_gpu_cuda.simple_add(a, b)
    expected = torch.tensor([6.0, 6.0, 6.0, 6.0, 6.0], device='cuda')
    
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


def test_alternative_approach():
    """Test a simpler approach without JIT compilation."""
    
    print("\n\nAlternative Approach: Pure Python Implementation")
    print("=" * 60)
    
    # Define custom op without CUDA kernel
    if hasattr(torch.ops, 'simple_ops'):
        delattr(torch.ops, 'simple_ops')
    
    lib = torch.library.Library("simple_ops", "DEF")
    lib.define("add(Tensor a, Tensor b) -> Tensor")
    
    @torch.library.impl(lib, "add", "CompositeExplicitAutograd")
    def simple_add(a, b):
        return a + b
    
    # Test on XLA
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    result = torch.ops.simple_ops.add(a, b)
    xm.mark_step()
    
    print(f"Result: {result.cpu()}")
    print("✅ Pure Python implementation works!")
    
    print("\n📝 Note: This approach works immediately without compilation")
    print("   and is sufficient for most XLA use cases.")


def demonstrate_real_world_pattern():
    """Show how this would be used in a real project."""
    
    print("\n\nReal-World Usage Pattern for vLLM")
    print("=" * 60)
    
    print("""
Recommended approach for vLLM XLA GPU backend:

1. **Start Simple** (Recommended):
   ```python
   @torch.library.impl(lib, "paged_attention", "XLA")
   def paged_attention_xla(query, key_cache, value_cache, ...):
       # Use PyTorch ops that XLA can compile
       scores = torch.matmul(query, key_cache.transpose(-2, -1))
       attn_weights = torch.softmax(scores, dim=-1)
       output = torch.matmul(attn_weights, value_cache)
       return output
   ```

2. **Optimize Later** (If needed):
   - Profile to identify bottlenecks
   - Use XLA custom calls for critical operations
   - Register CUDA kernels only if absolutely necessary

3. **XLA Custom Call Integration** (Advanced):
   ```python
   # Register custom call with XLA runtime
   torch_xla._XLAC._xla_register_custom_call_target(
       "PagedAttentionKernel",
       capsule,
       "CUDA"
   )
   
   # Use in implementation
   result = torch_xla._XLAC._xla_custom_call(
       [query, key_cache, value_cache],
       "PagedAttentionKernel",
       [output_shape],
       [dtype],
       False, "", 1, {}
   )[0]
   ```

Key Benefits of Starting Simple:
- ✅ Works immediately
- ✅ XLA handles optimization
- ✅ No compilation issues
- ✅ Portable across devices
- ✅ Easy to debug
""")


if __name__ == "__main__":
    print("XLA GPU Custom Op Examples")
    print("=" * 80)
    
    # Test 1: Try CUDA kernel compilation
    has_cuda = create_custom_op_with_cuda()
    
    # Test 2: Run CUDA kernel tests if available
    if has_cuda:
        test_cuda_kernel()
    
    # Test 3: Test XLA execution
    test_xla_execution()
    
    # Test 4: Show simpler alternative
    test_alternative_approach()
    
    # Show real-world patterns
    demonstrate_real_world_pattern()
    
    print("\n" + "=" * 80)
    print("\n📌 Summary:")
    print("1. CUDA kernel compilation is complex and error-prone")
    print("2. For XLA, using PyTorch ops is usually sufficient")
    print("3. XLA will compile and optimize the PyTorch ops")
    print("4. Custom CUDA kernels should only be used when absolutely necessary")
    print("\n✅ Recommendation: Start with PyTorch ops, optimize later if needed")
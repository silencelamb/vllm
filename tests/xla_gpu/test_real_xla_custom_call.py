"""Test real XLA custom call with kernel implementation."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from torch.utils.cpp_extension import load
import os
import tempfile

# XLA custom call kernel source code
xla_custom_call_source = '''
#include <cuda_runtime.h>
#include <cstring>

// Simplified XLA custom call signature
extern "C" {

// CUDA kernel
__global__ void SimpleAddKernel(const float* a, const float* b, float* out, int64_t size) {
    int64_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = a[idx] + b[idx];
    }
}

// XLA Custom Call implementation
// Note: In real XLA, this would be registered differently
__attribute__((visibility("default")))
void XlaGpuSimpleAdd(cudaStream_t stream, void** buffers,
                     const char* opaque, size_t opaque_len) {
    // Extract pointers from buffers
    const float* a = static_cast<const float*>(buffers[0]);
    const float* b = static_cast<const float*>(buffers[1]);
    float* out = static_cast<float*>(buffers[2]);
    
    // For demo, hardcode size (real impl would parse from opaque)
    int64_t size = 3;
    
    // Launch kernel
    const int threads = 256;
    const int blocks = (size + threads - 1) / threads;
    
    SimpleAddKernel<<<blocks, threads, 0, stream>>>(a, b, out, size);
    
    // Ensure kernel completes
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        // In real impl, would use XlaCustomCallStatus
        printf("CUDA error: %s\\n", cudaGetErrorString(err));
    }
}

} // extern "C"
'''

# Python wrapper to simulate XLA runtime registration
python_wrapper = '''
#include <torch/extension.h>
#include <dlfcn.h>

// Function pointer type for the custom call
typedef void (*CustomCallFn)(cudaStream_t, void**, const char*, size_t);

// Global function pointer
CustomCallFn g_xla_gpu_simple_add = nullptr;

// Registration function (called from Python)
void register_xla_custom_call() {
    // In real XLA, this would use XLA_REGISTER_CUSTOM_CALL_TARGET
    // For demo, we just store the function pointer
    void* handle = dlopen(nullptr, RTLD_NOW);
    g_xla_gpu_simple_add = (CustomCallFn)dlsym(handle, "XlaGpuSimpleAdd");
    
    if (g_xla_gpu_simple_add) {
        printf("✅ XlaGpuSimpleAdd registered successfully\\n");
    } else {
        printf("❌ Failed to find XlaGpuSimpleAdd\\n");
    }
}

// Test function to call the custom op directly
torch::Tensor test_custom_call_direct(torch::Tensor a, torch::Tensor b) {
    TORCH_CHECK(a.is_cuda(), "Input must be CUDA tensor");
    TORCH_CHECK(a.sizes() == b.sizes(), "Inputs must have same shape");
    
    auto output = torch::empty_like(a);
    
    // Prepare buffers
    void* buffers[3] = {
        a.data_ptr(),
        b.data_ptr(),
        output.data_ptr()
    };
    
    // Get CUDA stream
    cudaStream_t stream = at::cuda::getCurrentCUDAStream();
    
    // Call the custom function
    if (g_xla_gpu_simple_add) {
        g_xla_gpu_simple_add(stream, buffers, nullptr, 0);
        cudaStreamSynchronize(stream);
    } else {
        AT_ERROR("XlaGpuSimpleAdd not registered");
    }
    
    return output;
}

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("register_xla_custom_call", &register_xla_custom_call);
    m.def("test_custom_call_direct", &test_custom_call_direct);
}
'''


def compile_and_load_custom_call():
    """Compile and load the XLA custom call implementation."""
    
    print("Compiling XLA Custom Call Implementation")
    print("=" * 60)
    
    # Create temporary directory for build
    with tempfile.TemporaryDirectory() as tmpdir:
        # Write source files
        kernel_path = os.path.join(tmpdir, "kernel.cu")
        wrapper_path = os.path.join(tmpdir, "wrapper.cpp")
        
        with open(kernel_path, 'w') as f:
            f.write(xla_custom_call_source)
        
        with open(wrapper_path, 'w') as f:
            f.write(python_wrapper)
        
        # Compile
        try:
            module = load(
                name='xla_custom_call_impl',
                sources=[wrapper_path, kernel_path],
                extra_cuda_cflags=['-O2', '--expt-relaxed-constexpr'],
                verbose=True
            )
            print("\n✅ Compilation successful!")
            return module
        except Exception as e:
            print(f"\n❌ Compilation failed: {e}")
            return None


def test_with_real_xla_custom_call():
    """Test using the real custom call mechanism."""
    
    print("\n\nTesting Real XLA Custom Call")
    print("=" * 60)
    
    # Define the op using torch.library
    lib = torch.library.Library("xla_gpu_real", "DEF")
    lib.define("simple_add(Tensor a, Tensor b) -> Tensor")
    
    # XLA implementation that creates custom call
    @torch.library.impl(lib, "simple_add", "XLA")
    def simple_add_xla(a, b):
        # This creates a custom-call node in HLO
        output_shape = list(a.shape)
        output_dtype = a.dtype
        
        result = torch_xla._XLAC._xla_custom_call(
            [a, b],                     # inputs
            "XlaGpuSimpleAdd",          # target_name - must match C++ registration
            [output_shape],             # output_shapes
            [output_dtype],             # output_dtypes
            False,                      # has_side_effect
            "",                         # backend_config
            4,                          # api_version
            {}                          # extra attributes
        )[0]
        
        return result
    
    # Meta implementation
    @torch.library.impl_abstract("xla_gpu_real::simple_add")
    def simple_add_meta(a, b):
        return torch.empty_like(a)
    
    # Test on XLA device
    device = xm.xla_device()
    a = torch.tensor([1.0, 2.0, 3.0]).to(device)
    b = torch.tensor([4.0, 5.0, 6.0]).to(device)
    
    print(f"Inputs: a={a}, b={b}")
    
    # Create the custom call
    result = torch.ops.xla_gpu_real.simple_add(a, b)
    
    # Check the IR
    print("\nChecking XLA IR...")
    ir = torch_xla._XLAC._get_xla_tensors_text([result])
    print(f"IR (first 500 chars):\n{ir[:500]}")
    
    if "custom_call" in ir.lower():
        print("\n✅ SUCCESS: Found custom_call in IR!")
        print("   The operation will not be optimized away")
    
    # Try to execute (will fail without proper registration)
    print("\nAttempting execution...")
    try:
        xm.mark_step()
        xm.wait_device_ops()
        print("✅ Execution successful (unexpected!)")
    except Exception as e:
        print(f"❌ Execution failed (expected): {str(e)[:200]}...")
        print("\nThis is expected because XlaGpuSimpleAdd needs to be registered with XLA runtime")


def show_xla_registration_methods():
    """Show different ways to register with XLA."""
    
    print("\n\nXLA Registration Methods")
    print("=" * 60)
    
    print("""
1. **Static Registration (C++)**:
   ```cpp
   XLA_REGISTER_CUSTOM_CALL_TARGET("XlaGpuSimpleAdd", XlaGpuSimpleAdd, "CUDA");
   ```

2. **Dynamic Registration (via plugin)**:
   - Build as shared library (.so)
   - Load with dlopen or Python import
   - Registration happens on load

3. **XLA FFI (New API)**:
   ```cpp
   XLA_FFI_DEFINE_HANDLER(handler, impl, binding);
   XLA_FFI_REGISTER_HANDLER("name", "platform", handler);
   ```

4. **For PyTorch XLA**:
   - Add to pytorch/xla C++ source
   - Or use plugin mechanism (if available)
   - Or patch at runtime (advanced)
""")


def main():
    """Main test function."""
    
    print("Real XLA Custom Call Test")
    print("=" * 80)
    
    # Step 1: Compile the CUDA kernel
    module = compile_and_load_custom_call()
    
    if module:
        # Register the custom call
        module.register_xla_custom_call()
        
        # Test direct call (to verify kernel works)
        if torch.cuda.is_available():
            print("\n\nTesting Direct CUDA Call")
            print("=" * 60)
            a = torch.tensor([1.0, 2.0, 3.0]).cuda()
            b = torch.tensor([4.0, 5.0, 6.0]).cuda()
            result = module.test_custom_call_direct(a, b)
            print(f"Direct call result: {result}")
            print(f"Expected: {a + b}")
    
    # Step 2: Test XLA custom call
    test_with_real_xla_custom_call()
    
    # Step 3: Show registration methods
    show_xla_registration_methods()
    
    print("\n" + "=" * 80)
    print("\n📝 Key Points:")
    print("1. Custom call appears in IR as opaque operation")
    print("2. Compiler cannot optimize or see inside it")
    print("3. Requires C++ kernel + XLA runtime registration")
    print("4. This is exactly how TPU ops like ragged_paged_attention work")


if __name__ == "__main__":
    # Enable XLA debugging
    os.environ['XLA_FLAGS'] = '--xla_dump_to=./xla_dump --xla_dump_hlo_as_text'
    os.environ['PT_XLA_DEBUG'] = '1'
    
    main()
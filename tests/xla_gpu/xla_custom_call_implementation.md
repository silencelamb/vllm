# XLA Custom Call 完整实现指南

## 概述

要让 `XlaGpuSimpleAdd` 能够执行，需要在 XLA 运行时注册具体实现。这涉及以下步骤：

## 1. C++ 实现文件结构

### 选项 A：使用 PyTorch XLA 的扩展机制

创建以下文件：

#### `xla_gpu_custom_ops.cc`
```cpp
#include <torch/extension.h>
#include "torch_xla/csrc/aten_xla_bridge.h"
#include "torch_xla/csrc/ops/custom_call.h"
#include "xla/client/xla_builder.h"
#include "xla/service/custom_call_target_registry.h"

namespace torch_xla {
namespace {

// CUDA kernel for simple add
__global__ void SimpleAddKernel(const float* a, const float* b, float* out, int64_t size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = a[idx] + b[idx];
    }
}

// CPU implementation for XLA custom call
void SimpleAddCPU(void* out, const void** in) {
    const float* a = reinterpret_cast<const float*>(in[0]);
    const float* b = reinterpret_cast<const float*>(in[1]);
    float* result = reinterpret_cast<float*>(out);
    
    // Get size from XLA (simplified - real impl would get from shape)
    int64_t size = 3;  // For demo
    
    for (int64_t i = 0; i < size; ++i) {
        result[i] = a[i] + b[i];
    }
}

// GPU implementation for XLA custom call
void SimpleAddGPU(cudaStream_t stream, void** buffers,
                  const char* opaque, size_t opaque_len) {
    // Parse inputs and outputs
    const float* a = reinterpret_cast<const float*>(buffers[0]);
    const float* b = reinterpret_cast<const float*>(buffers[1]);
    float* out = reinterpret_cast<float*>(buffers[2]);
    
    // Get size (in real impl, parse from opaque/config)
    int64_t size = 3;  // For demo
    
    // Launch CUDA kernel
    int threads = 256;
    int blocks = (size + threads - 1) / threads;
    SimpleAddKernel<<<blocks, threads, 0, stream>>>(a, b, out, size);
}

// Register the custom call
XLA_REGISTER_CUSTOM_CALL_TARGET_WITH_SYM("XlaGpuSimpleAdd", SimpleAddGPU, "CUDA");

}  // namespace
}  // namespace torch_xla

// Python bindings
PYBIND11_MODULE(xla_gpu_custom_ops, m) {
    m.def("register_ops", []() {
        // Registration happens at module load time
        return true;
    });
}
```

#### `setup.py`
```python
from setuptools import setup
from torch.utils.cpp_extension import CUDAExtension, BuildExtension

setup(
    name='xla_gpu_custom_ops',
    ext_modules=[
        CUDAExtension(
            'xla_gpu_custom_ops',
            ['xla_gpu_custom_ops.cc'],
            include_dirs=[
                # Add torch_xla include paths
            ],
            libraries=['torch_xla'],
            extra_compile_args={
                'cxx': ['-std=c++17'],
                'nvcc': ['-std=c++17'],
            }
        )
    ],
    cmdclass={'build_ext': BuildExtension}
)
```

### 选项 B：使用 XLA FFI (推荐用于新代码)

#### `xla_gpu_ffi_ops.cc`
```cpp
#include "xla/ffi/ffi.h"
#include "xla/ffi/ffi_build.h"

namespace xla_gpu {

// Define the FFI handler
template <typename T>
absl::Status SimpleAddImpl(
    const xla::ffi::Buffer<xla::ffi::DataType::F32>& a,
    const xla::ffi::Buffer<xla::ffi::DataType::F32>& b,
    xla::ffi::Result<xla::ffi::Buffer<xla::ffi::DataType::F32>> out) {
    
    // Get pointers
    const T* a_data = reinterpret_cast<const T*>(a.data);
    const T* b_data = reinterpret_cast<const T*>(b.data);
    T* out_data = reinterpret_cast<T*>(out->data);
    
    // Get size
    int64_t size = a.dimensions[0];
    
    // CUDA kernel launch
    // ... (similar to above)
    
    return absl::OkStatus();
}

// Define the FFI binding
XLA_FFI_DEFINE_HANDLER(
    SimpleAddHandler,
    SimpleAddImpl<float>,
    ffi::Ffi::Bind()
        .Arg<ffi::Buffer<ffi::DataType::F32>>()  // a
        .Arg<ffi::Buffer<ffi::DataType::F32>>()  // b
        .Ret<ffi::Buffer<ffi::DataType::F32>>()  // output
);

// Register for CUDA platform
XLA_FFI_REGISTER_HANDLER(
    "XlaGpuSimpleAdd",
    "CUDA",
    SimpleAddHandler
);

}  // namespace xla_gpu
```

## 2. 在 Python 中使用

### 加载自定义 ops
```python
import torch
import torch_xla
import xla_gpu_custom_ops  # This loads and registers the ops

# Now your custom call will work!
```

### 或使用 torch.utils.cpp_extension.load
```python
import torch
from torch.utils.cpp_extension import load

# JIT compile and load
xla_custom_ops = load(
    name='xla_custom_ops',
    sources=['xla_gpu_custom_ops.cc'],
    extra_cuda_cflags=['-std=c++17'],
    verbose=True
)
```

## 3. 简化方案：使用现有 XLA ops

如果不想写 C++ 代码，可以：

### 方案 1：不使用 custom call
```python
@torch.library.impl(lib, "simple_add", "XLA")
def simple_add_xla(a, b):
    # 直接使用 PyTorch ops，XLA 会编译
    return a + b
```

### 方案 2：复用已有的 XLA custom calls
查看 XLA 已经注册的 custom calls，例如：
- `cublas-gemm` - 矩阵乘法
- `cu-dnn-conv` - 卷积
- 等等

## 4. 实际项目中的步骤

对于 vLLM XLA GPU 项目：

### 第一阶段（推荐先做）
1. 使用纯 PyTorch 实现（如 test_practical_xla_solution.py）
2. 让 XLA 编译优化
3. 测试性能

### 第二阶段（如果需要更高性能）
1. 识别性能瓶颈
2. 为关键操作编写 CUDA kernels
3. 使用上述方法注册到 XLA

### 第三阶段（生产级别）
1. 创建独立的 C++ 项目
2. 实现完整的 XLA FFI
3. 作为 PyTorch XLA 的插件分发

## 5. 调试技巧

### 检查已注册的 custom calls
```python
# 在 C++ 中可以查询
# XLA CustomCallTargetRegistry

# 在 Python 中，运行时错误会显示可用的 targets
```

### 使用 XLA 工具
```bash
# 查看 HLO
export XLA_FLAGS="--xla_dump_hlo_as_text --xla_dump_to=/tmp/xla_dump"

# 查看优化后的 HLO
export XLA_FLAGS="--xla_dump_hlo_pass_re=.*"
```

## 总结

1. **简单情况**：不需要写 CUDA kernel，直接用 PyTorch ops
2. **需要性能**：写 CUDA kernel 并通过 XLA FFI 注册
3. **生产环境**：创建完整的 C++ 扩展包

对于 vLLM 项目，建议先用方案 1，确保功能正确后再考虑优化。
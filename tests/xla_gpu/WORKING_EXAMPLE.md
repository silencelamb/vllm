# XLA GPU Custom Call 完整工作示例

## 概述

这个示例展示了如何在 PyTorch XLA 中为 GPU 创建和使用自定义 CUDA kernel。

## 关键要点

1. **使用 `_xla_custom_call` API**（不是 `_xla_gpu_custom_call`）
2. **API version 必须匹配 kernel 签名**（使用 1, 2, 或 3）
3. **注册时使用 PyCapsule**（不是原始地址）
4. **平台名称为 "CUDA"**

## 完整代码

### 1. CUDA Kernel (minimal_xla_custom_call.cu)

```cuda
#include <cuda_runtime.h>

__global__ void SimpleAddKernel(const float* a, const float* b, float* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = a[idx] + b[idx];
    }
}

extern "C" __attribute__((visibility("default")))
void XlaGpuSimpleAdd(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len
) {
    const float* a = (const float*)buffers[0];
    const float* b = (const float*)buffers[1];
    float* out = (float*)buffers[2];
    const int size = 3;
    
    const int threads = 256;
    const int blocks = (size + threads - 1) / threads;
    
    SimpleAddKernel<<<blocks, threads, 0, stream>>>(a, b, out, size);
}
```

### 2. 编译 CUDA Kernel

```bash
nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu
```

### 3. Python 使用代码

```python
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os

# 1. 加载共享库
lib = ctypes.CDLL("./xla_gpu_custom_ops.so", ctypes.RTLD_GLOBAL)
func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value

# 2. 创建 PyCapsule
PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
capsule = PyCapsule_New(func_addr, None, None)

# 3. 注册 custom call
torch_xla._XLAC._xla_register_custom_call_target(
    "XlaGpuSimpleAdd",
    capsule,
    "CUDA"
)

# 4. 创建测试数据
device = xm.xla_device()
a = torch.tensor([1.0, 2.0, 3.0]).to(device)
b = torch.tensor([4.0, 5.0, 6.0]).to(device)

# 5. 调用 custom call
result = torch_xla._XLAC._xla_custom_call(
    [a, b],               # inputs
    "XlaGpuSimpleAdd",    # op_name (becomes custom_call_target)
    [[3]],                # output_shapes
    [torch.float32],      # output_dtypes
    False,                # has_side_effect
    "",                   # backend_config
    1,                    # api_version (1, 2, or 3 work)
    {}                    # alias_params
)[0]

# 6. 执行并获取结果
xm.mark_step()
xm.wait_device_ops()
result_cpu = result.cpu()
print(f"Result: {result_cpu}")  # Output: tensor([5., 7., 9.])
```

## API Version 说明

对于使用 `(stream, buffers, opaque, opaque_len)` 签名的 kernel：
- **使用 API version 1, 2, 或 3**
- **不要使用 0 或 4**

## 生成的 HLO

```
HloModule IrToHlo.5, entry_computation_layout={(f32[3]{0}, f32[3]{0})->(f32[3])}

ENTRY %IrToHlo.5 (p0.1: f32[3], p1.2: f32[3]) -> (f32[3]) {
  %p1.2 = f32[3]{0} parameter(1)
  %p0.1 = f32[3]{0} parameter(0)
  %custom-call.3 = f32[3] custom-call(f32[3]{0} %p1.2, f32[3]{0} %p0.1), custom_call_target="XlaGpuSimpleAdd"
  ROOT %tuple.4 = (f32[3]) tuple(f32[3] %custom-call.3)
}
```

## 常见问题

1. **"No registered implementation" 错误**
   - 确保使用正确的 API version (1, 2, 或 3)
   - 确保平台名称是 "CUDA"
   - 确保 PyCapsule 创建正确

2. **Kernel 签名不匹配**
   - API version 必须与 kernel 签名匹配
   - 使用 stream 和 buffers 的签名需要 API version 1-3

3. **动态链接问题**
   - 使用 `ctypes.RTLD_GLOBAL` 加载库
   - 确保 kernel 函数有 `extern "C"` 和正确的可见性

## 下一步

现在你已经有了工作的 custom call，可以：
1. 扩展 kernel 支持动态大小（从 opaque 参数解析）
2. 实现更复杂的操作（如 attention）
3. 集成到 vLLM 的 XLA GPU backend 中
# XLA Custom Call - 正确使用方法

## 错误的方法 ❌

```python
# 错误：直接传递地址
func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
torch_xla._XLAC._xla_register_custom_call_target(
    "XlaGpuSimpleAdd", "CUDA", func_addr  # ❌ 错误的参数顺序和类型
)
```

## 正确的方法 ✅

```python
# 正确：使用 PyCapsule
import ctypes
import ctypes.pythonapi

# 1. 加载库
lib = ctypes.CDLL('./xla_gpu_custom_ops.so', ctypes.RTLD_GLOBAL)

# 2. 创建 PyCapsule
func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
capsule = PyCapsule_New(func_addr, None, None)

# 3. 注册（注意参数顺序！）
torch_xla._XLAC._xla_register_custom_call_target(
    "XlaGpuSimpleAdd",  # 名称
    capsule,            # PyCapsule（不是地址！）
    "CUDA"              # 平台
)
```

## 使用助手函数

```python
from xla_custom_call_helper import register_cuda_custom_call

# 一行搞定！
register_cuda_custom_call("XlaGpuSimpleAdd", "./xla_gpu_custom_ops.so")
```

## 完整工作流程

### 1. CUDA Kernel (`simple_add.cu`)
```cpp
__global__ void SimpleAddKernel(const float* a, const float* b, float* out, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        out[idx] = a[idx] + b[idx];
    }
}

extern "C" void XlaGpuSimpleAdd(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len
) {
    const float* a = (const float*)buffers[0];
    const float* b = (const float*)buffers[1];
    float* out = (float*)buffers[2];
    
    const int size = 3;  // 或从 opaque 解析
    const int threads = 256;
    const int blocks = (size + threads - 1) / threads;
    
    SimpleAddKernel<<<blocks, threads, 0, stream>>>(a, b, out, size);
}
```

### 2. 编译
```bash
nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so simple_add.cu
```

### 3. Python 中使用
```python
import torch
import torch_xla
import torch_xla.core.xla_model as xm
from xla_custom_call_helper import register_cuda_custom_call

# 注册
register_cuda_custom_call("XlaGpuSimpleAdd", "./xla_gpu_custom_ops.so")

# 定义 PyTorch op
lib = torch.library.Library("my_ops", "DEF")
lib.define("add(Tensor a, Tensor b) -> Tensor")

@torch.library.impl(lib, "add", "XLA")
def add_xla(a, b):
    return torch_xla._XLAC._xla_custom_call(
        [a, b], "XlaGpuSimpleAdd", 
        [list(a.shape)], [a.dtype],
        False, "", 4, {}
    )[0]

# 使用
device = xm.xla_device()
a = torch.tensor([1, 2, 3], dtype=torch.float32).to(device)
b = torch.tensor([4, 5, 6], dtype=torch.float32).to(device)

result = torch.ops.my_ops.add(a, b)
xm.mark_step()

print(result.cpu())  # [5, 7, 9]
```

## 关键点总结

1. **API 签名**：`_xla_register_custom_call_target(name: str, capsule: PyCapsule, platform: str)`
2. **PyCapsule 是必需的**：不能直接传递地址
3. **平台名称**：GPU 用 "CUDA"，CPU 用 "Host"
4. **函数签名**：必须匹配 XLA 的期望（stream, buffers, opaque, opaque_len）

## 调试技巧

1. 检查库是否正确加载：
```python
lib = ctypes.CDLL('./xla_gpu_custom_ops.so', ctypes.RTLD_GLOBAL)
print(lib.XlaGpuSimpleAdd)  # 应该打印函数地址
```

2. 验证 PyCapsule：
```python
print(type(capsule))  # 应该是 <class 'PyCapsule'>
```

3. 检查 HLO：
```python
ir = torch_xla._XLAC._get_xla_tensors_text([result])
print('custom_call' in ir.lower())  # 应该是 True
```

## 常见错误

1. **TypeError**: 参数类型错误 → 检查是否使用了 PyCapsule
2. **UNIMPLEMENTED**: 没有注册的实现 → 检查注册是否成功
3. **Segfault**: 函数签名不匹配 → 检查 C++ 函数签名

这就是完整且正确的 XLA custom call 使用方法！
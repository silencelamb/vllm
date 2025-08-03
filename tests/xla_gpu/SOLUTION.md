# XLA GPU Custom Call 解决方案

## 问题分析

1. `_xla_gpu_custom_call` API 内部使用固定的 `"triton_kernel_call"` 作为 custom call target
2. 我们需要使用 `_xla_custom_call` API 来指定自定义的 target name
3. 注册时的平台名称必须与 XLA 运行时期望的平台名称完全匹配

## 解决方案

### 方案1：修改 XLA 源码

在 `/Users/daixu/code/xla/torch_xla/csrc/xla_lower_util.cpp` 中，`BuildGpuCustomCall` 函数使用了硬编码的 `"triton_kernel_call"`：

```cpp
xla::XlaOp outputs = xla::CustomCallWithLayout(
    inputs[0].builder(),
    /*call_target_name=*/"triton_kernel_call",  // <-- 这里是硬编码的
    inputs, output_shape,
    input_shapes, payload, false, {}, nullptr,
    xla::CustomCallSchedule::SCHEDULE_NONE,
    xla::CustomCallApiVersion::API_VERSION_STATUS_RETURNING);
```

可以修改为接受 target name 作为参数。

### 方案2：使用正确的 API（推荐）

使用 `_xla_custom_call` 而不是 `_xla_gpu_custom_call`：

```python
# 正确的方式
result = torch_xla._XLAC._xla_custom_call(
    [a, b],               # inputs
    "XlaGpuSimpleAdd",    # op_name - 这会成为 custom_call_target
    [[3]],                # output_shapes
    [torch.float32],      # output_dtypes
    False,                # has_side_effect
    "",                   # backend_config
    4,                    # api_version (API_VERSION_TYPED_FFI)
    {}                    # alias_params
)[0]
```

### 方案3：查找正确的平台名称

从错误信息中提取正确的平台名称。可能的值：
- "CUDA" - 用于 NVIDIA GPU
- "GPU" - 通用 GPU 平台
- "Host" - CPU 平台

### 完整工作示例

```python
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os

# 1. 构建 CUDA kernel
# nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu

# 2. 加载并注册
lib = ctypes.CDLL("./xla_gpu_custom_ops.so", ctypes.RTLD_GLOBAL)
func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value

# 创建 PyCapsule
import ctypes.pythonapi
PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
capsule = PyCapsule_New(func_addr, None, None)

# 注册 - 需要正确的平台名称
torch_xla._XLAC._xla_register_custom_call_target(
    "XlaGpuSimpleAdd",
    capsule,
    "CUDA"  # 或 "GPU"，取决于 XLA 配置
)

# 3. 使用
device = xm.xla_device()
a = torch.tensor([1.0, 2.0, 3.0]).to(device)
b = torch.tensor([4.0, 5.0, 6.0]).to(device)

result = torch_xla._XLAC._xla_custom_call(
    [a, b],
    "XlaGpuSimpleAdd",
    [[3]],
    [torch.float32],
    False,
    "",
    4,
    {}
)[0]

# 4. 执行
xm.mark_step()
result_cpu = result.cpu()
print(f"Result: {result_cpu}")  # 应该输出 [5.0, 7.0, 9.0]
```

## 下一步

1. 运行 `test_find_platform.py` 来确定正确的平台名称
2. 使用找到的平台名称进行注册
3. 如果仍然失败，可能需要检查 XLA 的构建配置，确保 GPU 支持已启用

## 关键要点

- 使用 `_xla_custom_call` 而不是 `_xla_gpu_custom_call`
- 注册时使用 PyCapsule 而不是原始地址
- 平台名称必须与 XLA 运行时配置匹配
- API 版本影响 custom call 的行为
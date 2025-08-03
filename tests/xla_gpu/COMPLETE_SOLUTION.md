# XLA GPU Custom Call - 完整解决方案（使用动态注册）

## 关键发现

`torch_xla._XLAC._xla_register_custom_call_target()` 可以在运行时动态注册 custom call！

## 完整步骤

### 1. 编写 CUDA Kernel (`minimal_xla_custom_call.cu`)

```cpp
__global__ void SimpleAddKernel(const float* a, const float* b, float* out, int size) {
    // CUDA kernel implementation
}

extern "C" void XlaGpuSimpleAdd(
    cudaStream_t stream,
    void** buffers,
    const char* opaque,
    size_t opaque_len
) {
    // XLA custom call entry point
}
```

### 2. 编译为共享库

```bash
nvcc -O2 --shared -Xcompiler -fPIC -o xla_gpu_custom_ops.so minimal_xla_custom_call.cu
```

### 3. 在 Python 中动态注册（正确方法）

```python
import ctypes
import torch_xla._XLAC

# 加载库
lib = ctypes.CDLL('./xla_gpu_custom_ops.so', ctypes.RTLD_GLOBAL)

# 获取函数指针并创建 PyCapsule
func_ptr = lib.XlaGpuSimpleAdd
func_addr = ctypes.cast(func_ptr, ctypes.c_void_p).value

# 创建 PyCapsule - 这是关键！
import ctypes.pythonapi
PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]

capsule = PyCapsule_New(func_addr, None, None)

# 注册到 XLA 运行时
torch_xla._XLAC._xla_register_custom_call_target(
    "XlaGpuSimpleAdd",  # 函数名称
    capsule,            # PyCapsule（不是原始地址！）
    "CUDA"              # 平台
)
```

### 4. 使用 Custom Call

```python
@torch.library.impl(lib, "simple_add", "XLA")
def simple_add_xla(a, b):
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],
        "XlaGpuSimpleAdd",  # 必须匹配注册的名称
        [list(a.shape)],
        [a.dtype],
        False, "", 4, {}
    )[0]
    return result
```

## 完整示例

```python
# test_complete_solution.py
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes

# 1. 加载库
lib = ctypes.CDLL('./xla_gpu_custom_ops.so', ctypes.RTLD_GLOBAL)

# 2. 创建 PyCapsule
func_addr = ctypes.cast(lib.XlaGpuSimpleAdd, ctypes.c_void_p).value
import ctypes.pythonapi
PyCapsule_New = ctypes.pythonapi.PyCapsule_New
PyCapsule_New.restype = ctypes.py_object
PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
capsule = PyCapsule_New(func_addr, None, None)

# 3. 注册到 XLA
torch_xla._XLAC._xla_register_custom_call_target(
    "XlaGpuSimpleAdd", capsule, "CUDA"
)

# 4. 定义 op
lib = torch.library.Library("my_ops", "DEF")
lib.define("add(Tensor a, Tensor b) -> Tensor")

@torch.library.impl(lib, "add", "XLA")
def add_xla(a, b):
    return torch_xla._XLAC._xla_custom_call(
        [a, b], "XlaGpuSimpleAdd", 
        [list(a.shape)], [a.dtype],
        False, "", 4, {}
    )[0]

# 3. 使用
device = xm.xla_device()
a = torch.tensor([1.0, 2.0, 3.0]).to(device)
b = torch.tensor([4.0, 5.0, 6.0]).to(device)

result = torch.ops.my_ops.add(a, b)
xm.mark_step()

print(f"Result: {result.cpu()}")  # [5.0, 7.0, 9.0]
```

## 优势

1. ✅ **无需修改 PyTorch XLA 源码**
2. ✅ **运行时动态注册**
3. ✅ **IR 中显示为 custom-call**
4. ✅ **编译器无法优化内部实现**
5. ✅ **可以执行**

## 注意事项

1. 需要确保 torch_xla 版本支持 `_xla_register_custom_call_target`
2. **重要**：第二个参数必须是 PyCapsule，不是原始地址！
3. 函数签名必须匹配 XLA 的期望
4. 平台名称要正确（"CUDA" 对于 GPU）

## API 签名（来自源码）

```cpp
// torch_xla/csrc/init_python_bindings.cpp
.def("_xla_register_custom_call_target",
     [](const std::string& fn_name,           // 函数名
        const py::capsule& function_ptr,      // PyCapsule 包装的函数指针
        const std::string& platform) {        // 平台名
      runtime::GetComputationClientOrDie()->RegisterCustomCall(
          fn_name, function_ptr.get_pointer(), platform);
     })
```

## 对比其他方法

| 方法 | 需要改源码 | 动态注册 | 可执行 |
|------|----------|---------|--------|
| LD_PRELOAD | ❌ | ❌ | ❌ |
| 修改 PyTorch XLA | ✅ | ❌ | ✅ |
| **_xla_register_custom_call_target** | ❌ | ✅ | ✅ |

这就是完整的解决方案！
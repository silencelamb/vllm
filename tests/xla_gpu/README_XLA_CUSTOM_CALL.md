# XLA GPU Custom Call 完整实现指南

## 目标

创建一个真正的 XLA custom call，使其：
1. 在 HLO IR 中显示为 `custom-call` 节点
2. 编译器无法看到或优化其内部实现
3. 可以在 XLA GPU 上执行

## 实现步骤

### 1. 编写 CUDA Kernel

`xla_gpu_simple_add_kernel.cc`:
```cpp
extern "C" void XlaGpuSimpleAdd(cudaStream_t stream, void** buffers,
                                const char* opaque, size_t opaque_len,
                                XlaCustomCallStatus* status) {
    // 实现细节见文件
}
```

### 2. 注册到 XLA 运行时

有两种方式：

#### 方式 A：静态注册（修改 PyTorch XLA 源码）

在 PyTorch XLA 源码中添加：
```cpp
XLA_REGISTER_CUSTOM_CALL_TARGET("XlaGpuSimpleAdd", XlaGpuSimpleAdd, "CUDA");
```

#### 方式 B：动态注册（推荐）

编译为共享库，运行时加载：
```bash
# 编译
make

# 在 Python 中加载
import ctypes
ctypes.CDLL('./xla_gpu_custom_ops.so', ctypes.RTLD_GLOBAL)
```

### 3. 在 PyTorch 中使用

```python
# 定义 op
lib = torch.library.Library("xla_gpu", "DEF")
lib.define("simple_add(Tensor a, Tensor b) -> Tensor")

@torch.library.impl(lib, "simple_add", "XLA")
def simple_add_xla(a, b):
    result = torch_xla._XLAC._xla_custom_call(
        [a, b],
        "XlaGpuSimpleAdd",  # 必须匹配 C++ 中注册的名字
        [output_shape],
        [output_dtype],
        False,
        "",
        4,
        {}
    )[0]
    return result
```

## 当前问题

1. **XLA 运行时注册**：需要 XLA 运行时能找到 `XlaGpuSimpleAdd` 实现
2. **链接问题**：确保共享库被正确加载
3. **符号可见性**：确保符号可被 XLA 运行时发现

## 解决方案

### 临时方案（用于测试）

使用 `LD_PRELOAD` 强制加载：
```bash
LD_PRELOAD=./xla_gpu_custom_ops.so python test_script.py
```

### 长期方案（生产环境）

1. **创建 PyTorch XLA 插件**
2. **使用 XLA FFI 新接口**
3. **贡献到上游**

## 验证步骤

1. 检查 IR 中是否有 custom-call
2. 确认执行时能找到实现
3. 验证结果正确性

## 对比 TPU 实现

TPU 的 `torch.ops.xla.ragged_paged_attention` 能工作是因为：
- Google 已在 XLA TPU 运行时中注册了实现
- 使用了 Pallas（TPU 专用 JIT 编译器）

对于 GPU，我们需要自己完成这个注册过程。

## 实际应用

对于 vLLM XLA GPU 项目：
1. 短期：使用纯 PyTorch 实现（避免 custom call）
2. 中期：为关键操作实现 custom call
3. 长期：创建完整的 XLA GPU 后端

## 编译和测试

```bash
# 编译
make

# 测试
python test_real_xla_custom_call.py

# 查看 HLO
ls xla_dump/*.before_optimizations.txt
```

## 关键文件

- `xla_gpu_simple_add_kernel.cc` - CUDA kernel 实现
- `test_real_xla_custom_call.py` - 测试脚本
- `Makefile` - 编译配置
- `setup_xla_custom_call.py` - Python 打包脚本
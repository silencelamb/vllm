# XLA Custom Call 完整解释

## 问题分析

当我们运行测试时，看到了以下现象：

1. Custom call 成功出现在 XLA IR 中：
```
%2 = (f32[3]{0}) xla::custom_call(%1, %0), xla_shape=(f32[3]{0}), ROOT=0
```

2. 但执行时失败：
```
UNIMPLEMENTED: No registered implementation for custom call to XlaGpuSimpleAdd for platform CUDA
```

## 两层注册的区别

### 1. PyTorch 层注册（我们已完成）
```python
@torch.library.impl(lib, "simple_add", "XLA")
def simple_add_xla(a, b):
    # 使用 _xla_custom_call 创建 custom call 节点
    result = torch_xla._XLAC._xla_custom_call(...)
    return result
```

这告诉 PyTorch：当在 XLA 设备上调用这个 op 时，创建一个 XLA custom call 节点。

### 2. XLA 运行时注册（缺失的部分）

XLA 运行时需要知道如何执行 `XlaGpuSimpleAdd` 这个 custom call。这需要：

#### 方法 1：C++ XLA FFI 实现
```cpp
// 需要在 C++ 中注册
XLA_FFI_DEFINE_HANDLER(
    SimpleAddHandler,
    SimpleAddImpl,
    ffi::Ffi::Bind()
        .Arg<ffi::Buffer<ffi::DataType::F32>>()  // input a
        .Arg<ffi::Buffer<ffi::DataType::F32>>()  // input b
        .Ret<ffi::Buffer<ffi::DataType::F32>>()  // output
);

XLA_FFI_REGISTER_HANDLER(
    "XlaGpuSimpleAdd",  // 必须匹配 target_name
    "CUDA",             // 平台
    SimpleAddHandler
);
```

#### 方法 2：使用已有的 XLA ops

如果不想写 C++ 代码，可以：

1. **使用 XLA 已支持的操作**：不使用 custom call，而是用 XLA 能编译的普通操作
2. **复用现有的 custom call**：使用 XLA 已经注册的 custom call 名称

## 解决方案

### 短期方案（用于原型和测试）

不使用 `_xla_custom_call`，而是使用普通的 PyTorch 操作：

```python
@torch.library.impl(lib, "simple_add", "XLA")
def simple_add_xla(a, b):
    # 使用 XLA 能编译的操作
    return a + b  # XLA 会将这个编译成高效的代码
```

### 长期方案（用于生产）

1. **编写 C++ XLA FFI 实现**
2. **在 XLA 运行时注册 custom call**
3. **构建并链接到 PyTorch XLA**

## 与 TPU 的对比

TPU 的 `torch.ops.xla.ragged_paged_attention` 能工作是因为：

1. Google 已经在 XLA TPU 运行时中注册了 `ragged_paged_attention` 的实现
2. 这个实现是 TPU 特定的，使用了 TPU 的硬件特性

对于 GPU，我们需要：
1. 自己注册 CUDA 平台的实现
2. 或者使用 XLA 已有的 GPU custom calls

## 实际可行的方法

对于 vLLM XLA GPU 支持，建议：

1. **第一阶段**：使用纯 PyTorch 操作实现 attention，让 XLA 编译优化
2. **第二阶段**：识别性能瓶颈，为关键部分实现 custom call
3. **第三阶段**：完整的 C++ FFI 实现，获得最佳性能

## 示例：可工作的 XLA GPU attention

```python
@torch.library.impl(lib, "paged_attention", "XLA")
def paged_attention_xla(query, kv_cache, context_lens, ...):
    # 使用 XLA 可编译的操作实现 attention
    # 不使用 _xla_custom_call
    
    # 例如：简化的 attention 实现
    scores = torch.matmul(query, key.transpose(-2, -1)) * scale
    attn_weights = torch.softmax(scores, dim=-1)
    output = torch.matmul(attn_weights, value)
    
    return output
```

这种方法虽然不会在 HLO 中显示为单个 custom-call，但是：
- 可以立即工作，无需 C++ 代码
- XLA 会优化这些操作
- 性能可能已经足够好

## 总结

"No registered implementation for custom call" 错误表明我们需要在 XLA 运行时层面注册实现。对于 vLLM 项目，建议先使用纯 PyTorch 实现，后续再考虑添加真正的 custom call。
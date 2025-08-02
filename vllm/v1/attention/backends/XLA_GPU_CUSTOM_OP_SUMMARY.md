# XLA GPU 自定义算子实现总结

## 问题分析

你遇到的问题是自定义算子没有出现在 HLO 图中，而是被优化成了简单的 broadcast 操作。这是因为：

1. 原始实现只返回 `torch.zeros_like(query)`
2. XLA 编译器会优化掉可以常量折叠的操作
3. 需要特殊方法来确保自定义算子在 HLO 中可见

## 解决方案

### 1. **实现真实的 CUDA Kernel**（推荐）

是的，实现真实的 CUDA kernel 就能解决问题！原因是：

- XLA 将外部 CUDA kernel 视为黑盒
- 无法优化或内联这些 kernel
- 在 HLO 中会保留为 `custom-call` 节点

**示例实现：**

```python
@impl(xla_gpu_lib, "paged_attention", "CUDA")
def paged_attention_cuda(query, kv_cache, ...):
    # 方式 1: 使用现有 vLLM kernel
    import vllm._C
    output = torch.empty_like(query)
    vllm._C.paged_attention_v1(output, query, key_cache, value_cache, ...)
    return output
    
    # 方式 2: 自定义 CUDA kernel
    # 通过 torch.utils.cpp_extension.load_inline 加载
    # 或预编译的 .so 文件
```

### 2. **使用 XLA Custom Call API**

最可靠的方法，直接告诉 XLA 这是一个自定义调用：

```python
# 使用 torch_xla 内部 API
import torch_xla._XLAC as xlac

output_xla_tensor = xlac._xla_custom_call(
    [query_xla, kv_cache_xla, ...],  # 输入
    "xla_gpu_paged_attention",       # 在 HLO 中的名称
    [list(query.shape)],             # 输出形状
    [str(query.dtype)],              # 输出类型
    False,                           # has_side_effect
    str(config),                     # backend_config
)
```

### 3. **确保计算不被优化**

如果暂时没有 CUDA kernel，至少要：

```python
# 不要这样（会被优化）：
return torch.zeros_like(query)

# 而要这样（包含实际计算）：
output = query * scale
output = output + kv_cache.mean() * 1e-6  # 小的依赖防止优化
return output
```

## HLO 中的表现

成功实现后，在 HLO 图中会看到：

```
%custom-call = f32[4,8,64] custom-call(
    f32[4,8,64] %query,
    f32[2,16,16,64] %kv_cache,
    ...
), custom_call_target="xla_gpu_paged_attention"
```

## 推荐方案

1. **短期**：使用方案 3，确保有实际计算
2. **长期**：实现真实的 CUDA kernel（方案 1）
3. **调试**：使用 XLA Custom Call API 验证

## 关键点

- **XLA 设备问题**：使用 `torch.compile(backend="openxla")` 时，CUDA tensor 可以直接使用，XLA 会处理设备映射
- **同步问题**：`mark_step()` 触发执行，`wait_device_ops()` 等待完成
- **CUDA Kernel**：是的，实现真实的 CUDA kernel 是最终解决方案，XLA 无法优化外部 kernel

## 测试验证

```bash
# 设置环境变量查看 HLO
export XLA_FLAGS='--xla_dump_to=./xla_dump --xla_dump_hlo_as_text'

# 运行测试
python test_custom_call.py

# 查看 HLO 文件
cat xla_dump/*.hlo
```

在 HLO 中搜索 "custom-call" 或你的算子名称 "xla_gpu_paged_attention"。
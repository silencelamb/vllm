# XLA GPU Custom Op for Paged Attention

本文档说明了如何在 PyTorch XLA GPU 平台上添加自定义算子，无需重新编译 PyTorch。

## 概述

我们实现了一个类似于 `torch.ops.xla.ragged_paged_attention` 的自定义算子：`torch.ops.xla_gpu.paged_attention`。

## 文件结构

- `xla_gpu_paged_attention.py`: 自定义算子的定义和注册
- `xla_gpu_paged_attention_cuda_example.py`: 如何集成实际 CUDA kernel 的示例
- `xla_gpu_native.py`: 在注意力机制中使用自定义算子

## 实现细节

### 1. 算子定义

```python
from torch.library import Library, impl

# 创建自定义库
xla_gpu_lib = Library("xla_gpu", "DEF")

# 定义算子签名
xla_gpu_lib.define(
    "paged_attention(Tensor query, Tensor kv_cache, ...) -> Tensor"
)
```

### 2. 多后端实现

```python
# CUDA 实现
@impl(xla_gpu_lib, "paged_attention", "CUDA")
def xla_gpu_paged_attention_cuda(...):
    # 占位符实现，返回正确形状的张量
    return torch.zeros_like(query)

# XLA 实现
@impl(xla_gpu_lib, "paged_attention", "XLA")
def xla_gpu_paged_attention_xla(...):
    # XLA 设备上的实现
    return torch.zeros_like(query)

# CPU 实现（用于测试）
@impl(xla_gpu_lib, "paged_attention", "CPU")
def xla_gpu_paged_attention_cpu(...):
    return torch.zeros_like(query)
```

### 3. Shape 推断

```python
@torch.library.register_fake("xla_gpu::paged_attention")
def xla_gpu_paged_attention_fake(...):
    # 用于 tracing 时的形状推断
    return torch.empty_like(query)
```

## 使用方法

### 基本使用

```python
from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention

# 调用自定义算子
output = xla_gpu_paged_attention(
    query=query,
    kv_cache=kv_cache,
    context_lens=context_lens,
    block_tables=block_tables,
    query_start_loc=query_start_loc,
    num_seqs=num_seqs,
    scale=scale,
    sliding_window=None,
    soft_cap=None,
)

# 或者使用 torch.ops 接口
output = torch.ops.xla_gpu.paged_attention(query, kv_cache, ...)
```

### 与 torch.compile 集成

```python
@torch.compile(backend="openxla")  # 或 fullgraph=True
def attention_fn(query, kv_cache, ...):
    return xla_gpu_paged_attention(query, kv_cache, ...)
```

## 集成实际 CUDA Kernel

当前实现返回占位符结果。要集成实际的 CUDA kernel，有以下几种方式：

### 方式 1：使用现有 vLLM kernel

```python
@impl(xla_gpu_lib, "paged_attention", "CUDA", replace=True)
def xla_gpu_paged_attention_cuda_real(...):
    import vllm._C
    # 调用现有的 CUDA kernel
    return vllm._C.paged_attention_v1(...)
```

### 方式 2：编写自定义 CUDA kernel

```python
from torch.utils.cpp_extension import load_inline

# 编写 CUDA kernel
cuda_source = '''
__global__ void paged_attention_kernel(...) {
    // 实际的注意力计算
}
'''

# 加载并注册
paged_attention_ext = load_inline(...)
```

### 方式 3：使用 Triton

```python
import triton
import triton.language as tl

@triton.jit
def paged_attention_triton_kernel(...):
    # Triton kernel 实现
    pass
```

## 测试

运行测试：

```bash
# 简单测试（无 XLA 依赖）
python tests/xla_gpu/test_simple_custom_op.py

# 完整测试（需要 torch_xla）
python tests/xla_gpu/test_xla_custom_op.py
```

## 优势

1. **无需重新编译**: 使用 PyTorch 的标准扩展机制
2. **XLA 兼容**: 能被 XLA 编译器正确识别和优化
3. **多后端支持**: 支持 CPU、CUDA、XLA 等多种后端
4. **torch.compile 兼容**: 可以与 PyTorch 2.0 的编译功能一起使用

## 注意事项

1. 当前实现是占位符，需要替换为实际的注意力计算
2. XLA 编译时会对算子进行优化，确保实现是 XLA 友好的
3. 避免使用会破坏 XLA 图的操作（如 .item()、动态控制流等）

## 下一步

1. 实现实际的 CUDA kernel
2. 添加更多的测试用例
3. 优化性能
4. 支持更多的注意力变体（如 sliding window attention）
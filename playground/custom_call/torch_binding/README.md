# Reshape and Cache Flash - XLA Custom Call Implementation

这个示例展示了如何将 vLLM 的 `reshape_and_cache_flash` 操作实现为 XLA custom call。

## 文件结构

- `reshape_and_cache_flash_xla.cc` - XLA Custom Call 的 C++ 实现
- `reshape_and_cache_ops.cpp` - PyTorch C++ 扩展，连接 PyTorch 和 XLA
- `xla_ops.py` - Python 接口，自动选择合适的后端
- `setup.py` - 编译配置
- `test_reshape_and_cache.py` - 测试用例
- `build.sh` - 编译脚本

## 实现流程

### 1. PyTorch C++ Extension
通过 `reshape_and_cache_ops.cpp` 创建 PyTorch 可调用的 C++ 函数：
- 使用 pybind11 暴露给 Python
- 注册为 `torch.ops.vllm_xla.reshape_and_cache_flash`

### 2. XLA Custom Call
在 `reshape_and_cache_flash_xla.cc` 中实现：
- 定义 XLA 运行时会调用的 C 函数
- 解析输入/输出缓冲区
- 调用 CUDA kernel

### 3. Python 接口
`xla_ops.py` 提供统一接口：
- 自动检测张量类型（XLA/CUDA/CPU）
- 选择合适的后端实现
- 提供回退机制

## 编译和运行

```bash
# 编译
./build.sh

# 运行测试
python test_reshape_and_cache.py
```

## 与 vLLM 集成

在 `vllm/v1/attention/backends/xla_gpu_native.py` 中使用：

```python
from playground.custom_call.torch_binding.xla_ops import reshape_and_cache_flash

# 在 forward 方法中
reshape_and_cache_flash(
    key, value, key_cache, value_cache,
    slot_mapping, kv_cache_dtype, k_scale, v_scale
)
```

## 注意事项

1. **实际实现**：示例中的 CUDA kernel 是简化版本。实际应该：
   - 复用 `csrc/cache_kernels.cu` 中的优化实现
   - 正确处理内存布局和数据类型

2. **XLA 注册**：完整的 XLA 集成需要：
   - 在 XLA 编译时注册 custom call
   - 使用 XLA 的 custom call API 创建计算图节点
   - 可能需要修改 torch_xla 源码

3. **性能优化**：
   - 使用共享内存优化 CUDA kernel
   - 支持不同的数据类型（fp16, bf16, fp8）
   - 优化内存访问模式

## 扩展到其他算子

使用相同的模式可以实现其他算子，如：
- `flash_attn_varlen_func`
- 其他 KV cache 操作

关键是：
1. 创建 PyTorch C++ 扩展
2. 实现 XLA custom call
3. 提供 Python 接口
4. 集成到 vLLM 的 XLA backend
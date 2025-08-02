# XLA GPU 自定义算子技术细节

## 关于你的问题

### 1. Device 不需要是 XLA device？

是的，这是 PyTorch XLA 的一个重要特性：

- **使用 `torch.compile(backend="openxla")`**: 可以直接使用 CUDA tensors，XLA 会自动处理设备映射
- **直接使用 XLA device**: 需要显式地将 tensors 移到 `xm.xla_device()`
- **自定义算子的多后端支持**: 我们为算子注册了 CUDA、CPU 和 XLA 三个后端，所以它可以在不同设备上工作

```python
# 方式 1: 使用 OpenXLA backend (推荐)
@torch.compile(backend="openxla")
def my_func(x):
    return custom_op(x)  # x 可以是 CUDA tensor

# 方式 2: 显式使用 XLA device
device = xm.xla_device()
x = x.to(device)
output = custom_op(x)
```

### 2. `xm.mark_step()` vs `xm.wait_device_ops()`

这两个函数的区别和用途：

**`xm.mark_step()`**:
- 标记一个执行步骤的边界
- 触发 XLA 的惰性执行（lazy execution）
- 将累积的操作发送到设备执行
- 不会阻塞等待执行完成

**`xm.wait_device_ops()`**:
- 阻塞当前线程，等待所有设备操作完成
- 确保所有异步操作都已完成
- 通常用于：
  - 性能测量前后
  - 需要同步结果的地方
  - 调试时确保操作完成

**最佳实践**:
```python
# 执行计算
output = model(input)

# 标记步骤边界，触发执行
xm.mark_step()

# 如果需要立即使用结果或测量性能
xm.wait_device_ops()  # 确保操作完成

# 获取结果
result = output.cpu()
```

## HLO/StableHLO 图的保存

测试代码已经包含了保存 HLO 图的功能：

1. **HLO 文本输出**: 通过环境变量设置
   ```bash
   export XLA_FLAGS='--xla_dump_to=./xla_dump --xla_dump_hlo_as_text'
   ```

2. **StableHLO 导出**: 使用 `torch_xla.stablehlo` 模块
   ```python
   import torch_xla.stablehlo as stablehlo
   stablehlo_text = stablehlo.get_stablehlo([output])
   ```

3. **查看 HLO 图中的自定义算子**:
   在 HLO 图中，自定义算子会显示为类似：
   ```
   custom-call @xla_gpu::paged_attention
   ```

## 自定义算子在 XLA 中的工作原理

1. **注册阶段**: 算子通过 `torch.library` 注册到 PyTorch
2. **图构建阶段**: XLA 追踪计算图时识别自定义算子
3. **编译阶段**: XLA 编译器处理自定义算子：
   - 如果有 XLA lowering，使用 XLA 实现
   - 否则，作为 custom-call 保留
4. **执行阶段**: 根据设备类型调用相应的实现

## 性能优化建议

1. **批量操作**: 尽量减少 `mark_step()` 调用，让 XLA 有更多优化机会
2. **避免频繁同步**: `wait_device_ops()` 会造成性能开销
3. **使用 XLA 友好的操作**: 避免动态形状、`.item()` 等操作
4. **预编译**: 对于固定形状的输入，XLA 可以缓存编译结果

## 调试技巧

1. **查看 XLA 指标**:
   ```python
   import torch_xla.debug.metrics as met
   print(met.metrics_report())
   ```

2. **打印 HLO 图**:
   ```python
   print(torch_xla._XLAC._get_xla_tensors_text([tensor]))
   ```

3. **检查编译缓存**:
   ```python
   print(torch_xla._XLAC._xla_counter_names())
   ```
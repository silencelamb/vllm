"""深入分析 torch.compile 处理 rms_norm 的机制和效率问题"""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from vllm._custom_ops import rms_norm
import time


def analyze_compile_output():
    """分析 torch.compile 的输出日志"""
    
    print("=" * 80)
    print("torch.compile 机制分析")
    print("=" * 80)
    
    print("""
从日志可以看出几个关键信息：

1. Dynamo Fallback:
   - "Dynamo fallback ops are[auto_functionalized_v2]"
   - 说明 auto_functionalized_v2 操作没有被 XLA 原生支持
   - Dynamo 使用了 fallback 机制

2. 实际执行的操作：
   ```python
   def forward(self, arg0_1):
       empty_like = torch.ops.aten.empty_like.default(arg0_1, pin_memory = False)
       return empty_like
   ```
   - 只看到了 empty_like 操作
   - rms_norm 的实际计算没有出现在 XLA 图中！

3. XLA IR：
   - 只有常量和扩展操作
   - 没有实际的 RMS normalization 计算

这说明了什么？
""")
    
    print("-" * 40)
    print("问题分析：")
    print("-" * 40)
    
    print("""
1. **Fallback 到 CPU/CUDA**:
   - rms_norm 操作实际上没有被 XLA 编译
   - 它通过 fallback 机制在原始设备（CPU/CUDA）上执行
   - 这就是为什么能"成功"运行

2. **效率问题**:
   - 存在 XLA <-> CPU/CUDA 之间的数据传输
   - 破坏了 XLA 的优化机会
   - 性能可能比纯 CUDA 执行还差

3. **auto_functionalized_v2 未被支持**:
   - XLA 后端没有 lowering 规则
   - Dynamo 自动使用 fallback
""")
    
    print("=" * 80)


def test_performance_comparison():
    """比较不同执行方式的性能"""
    
    print("\n=== 性能对比测试 ===\n")
    
    if not torch.cuda.is_available():
        print("CUDA 不可用，跳过性能测试")
        return
    
    # 测试参数
    batch_size = 4
    seq_len = 512
    hidden_size = 4096
    epsilon = 1e-5
    num_iterations = 100
    
    # 准备数据
    device_cuda = 'cuda'
    device_xla = xm.xla_device()
    
    input_cuda = torch.randn(batch_size, seq_len, hidden_size, device=device_cuda)
    weight_cuda = torch.randn(hidden_size, device=device_cuda)
    
    input_xla = input_cuda.to(device_xla)
    weight_xla = weight_cuda.to(device_xla)
    
    print(f"测试配置: batch={batch_size}, seq_len={seq_len}, hidden={hidden_size}")
    print(f"迭代次数: {num_iterations}")
    print()
    
    # 1. 纯 CUDA 执行
    print("1. 纯 CUDA 执行:")
    def cuda_rms_norm():
        out = torch.empty_like(input_cuda)
        rms_norm(out, input_cuda, weight_cuda, epsilon)
        return out
    
    # Warmup
    for _ in range(10):
        cuda_rms_norm()
    torch.cuda.synchronize()
    
    start = time.time()
    for _ in range(num_iterations):
        result = cuda_rms_norm()
    torch.cuda.synchronize()
    cuda_time = time.time() - start
    print(f"   时间: {cuda_time:.3f}s")
    print(f"   每次: {cuda_time/num_iterations*1000:.2f}ms")
    
    # 2. torch.compile with OpenXLA (有 fallback)
    print("\n2. torch.compile + OpenXLA (带 fallback):")
    def xla_rms_norm_wrapper(input_t, weight_t, eps):
        out = torch.empty_like(input_t)
        rms_norm(out, input_t, weight_t, eps)
        return out
    
    compiled_fn = torch.compile(xla_rms_norm_wrapper, backend='openxla')
    
    # Warmup
    for _ in range(10):
        compiled_fn(input_xla, weight_xla, epsilon)
    xm.mark_step()
    xm.wait_device_ops()
    
    start = time.time()
    for _ in range(num_iterations):
        result = compiled_fn(input_xla, weight_xla, epsilon)
    xm.mark_step()
    xm.wait_device_ops()
    xla_compile_time = time.time() - start
    print(f"   时间: {xla_compile_time:.3f}s")
    print(f"   每次: {xla_compile_time/num_iterations*1000:.2f}ms")
    print(f"   相对 CUDA: {xla_compile_time/cuda_time:.2f}x")
    
    # 3. 纯 PyTorch 实现（作为基准）
    print("\n3. 纯 PyTorch 实现 (无自定义算子):")
    def pytorch_rms_norm(input_t, weight_t, eps):
        variance = input_t.pow(2).mean(-1, keepdim=True)
        input_normalized = input_t * torch.rsqrt(variance + eps)
        return input_normalized * weight_t
    
    # Warmup
    for _ in range(10):
        pytorch_rms_norm(input_cuda, weight_cuda, epsilon)
    torch.cuda.synchronize()
    
    start = time.time()
    for _ in range(num_iterations):
        result = pytorch_rms_norm(input_cuda, weight_cuda, epsilon)
    torch.cuda.synchronize()
    pytorch_time = time.time() - start
    print(f"   时间: {pytorch_time:.3f}s")
    print(f"   每次: {pytorch_time/num_iterations*1000:.2f}ms")
    print(f"   相对 CUDA custom op: {pytorch_time/cuda_time:.2f}x")
    
    print("\n" + "=" * 80)


def show_proper_xla_integration():
    """展示正确的 XLA 集成方式"""
    
    print("\n=== 正确的 XLA 集成方案 ===\n")
    
    print("要让 rms_norm 高效运行在 XLA 上，需要：")
    print()
    
    print("方案 1: 注册 XLA Lowering")
    print("-" * 40)
    print("""
```python
# 在 torch_xla 中注册 lowering
@register_lowering(torch.ops._C.rms_norm)
def rms_norm_lowering(ctx, result, input, weight, epsilon):
    # 将 rms_norm 转换为 XLA HLO 操作
    variance = reduce_mean(square(input), axis=-1, keepdims=True)
    normalized = input * rsqrt(variance + epsilon)
    return normalized * weight
```
""")
    
    print("方案 2: 使用 XLA 友好的实现")
    print("-" * 40)
    print("""
```python
def xla_friendly_rms_norm(input, weight, epsilon):
    # 使用基础 PyTorch 操作，这些都有 XLA lowering
    variance = input.pow(2).mean(-1, keepdim=True)
    input_normalized = input * torch.rsqrt(variance + epsilon)
    return input_normalized * weight
    
# 编译这个版本
compiled_rms = torch.compile(xla_friendly_rms_norm, backend='openxla')
```
""")
    
    print("方案 3: Custom Call 到优化的实现")
    print("-" * 40)
    print("""
```python
# 注册 custom call 到 Flash Attention 或其他优化库
torch_xla.core.xla_model.register_custom_call(
    "rms_norm_flash",
    rms_norm_flash_implementation
)
```
""")
    
    print("\n效率对比:")
    print("-" * 40)
    print("""
执行方式                    | 效率  | 说明
---------------------------|------|--------------------------------
Fallback (当前)            | 低   | XLA<->CUDA 数据传输，打断优化
XLA Lowering              | 高   | 完全在 XLA 图中，可以融合优化
XLA-friendly PyTorch      | 中   | 简单实现，但可能错过特定优化
Custom Call               | 最高 | 调用高度优化的实现
""")
    
    print("=" * 80)


def test_xla_friendly_implementation():
    """测试 XLA 友好的实现"""
    
    print("\n=== 测试 XLA 友好的实现 ===\n")
    
    device = xm.xla_device()
    
    # 准备测试数据
    batch_size, seq_len, hidden_size = 2, 128, 512
    epsilon = 1e-5
    
    input_xla = torch.randn(batch_size, seq_len, hidden_size, device=device)
    weight_xla = torch.randn(hidden_size, device=device)
    
    # XLA 友好的实现
    def xla_friendly_rms_norm(input_t, weight_t, eps):
        # 使用基础操作，都有 XLA lowering
        variance = input_t.pow(2).mean(-1, keepdim=True)
        input_normalized = input_t * torch.rsqrt(variance + eps)
        return input_normalized * weight_t
    
    print("1. 直接执行 XLA 友好版本:")
    try:
        result = xla_friendly_rms_norm(input_xla, weight_xla, epsilon)
        xm.mark_step()
        print(f"   ✓ 成功，输出形状: {result.shape}")
    except Exception as e:
        print(f"   ✗ 失败: {e}")
    
    print("\n2. 编译 XLA 友好版本:")
    try:
        compiled_fn = torch.compile(xla_friendly_rms_norm, backend='openxla')
        result = compiled_fn(input_xla, weight_xla, epsilon)
        xm.mark_step()
        print(f"   ✓ 成功，输出形状: {result.shape}")
        
        # 检查是否有 fallback
        import torch_xla.debug.metrics as met
        metrics = met.metrics_report()
        if "fallback" in metrics.lower():
            print("   ⚠ 警告: 检测到 fallback")
        else:
            print("   ✓ 无 fallback，完全在 XLA 中执行")
    except Exception as e:
        print(f"   ✗ 失败: {e}")
    
    print("\n" + "=" * 80)


def summarize_findings():
    """总结发现"""
    
    print("\n=== 总结 ===\n")
    
    print("关键发现：")
    print("-" * 40)
    print("""
1. torch.compile 能"成功"是因为使用了 fallback 机制
   - auto_functionalized_v2 没有 XLA lowering
   - 实际在 CPU/CUDA 上执行，不是 XLA
   
2. 这种方式**不高效**：
   - 数据在 XLA 和原始设备间传输
   - 破坏了图优化机会
   - 性能可能更差
   
3. 正确的解决方案：
   - 为 rms_norm 添加 XLA lowering
   - 使用 XLA 友好的 PyTorch 实现
   - 通过 custom call 调用优化实现
   
4. 对 vLLM XLA GPU 后端的启示：
   - 需要为所有自定义算子添加 XLA 支持
   - 或使用 XLA 友好的替代实现
   - 避免依赖 fallback 机制
""")
    
    print("建议的行动：")
    print("-" * 40)
    print("""
1. 短期：使用 XLA 友好的 PyTorch 实现替代 custom ops
2. 中期：为关键 custom ops 添加 XLA lowering
3. 长期：通过 custom call 集成高性能实现（如 Flash Attention）
""")
    
    print("=" * 80)


if __name__ == "__main__":
    # 分析编译输出
    analyze_compile_output()
    
    # 展示正确的集成方案
    show_proper_xla_integration()
    
    # 测试 XLA 友好的实现
    test_xla_friendly_implementation()
    
    # 性能对比（如果 CUDA 可用）
    if torch.cuda.is_available():
        test_performance_comparison()
    
    # 总结
    summarize_findings()
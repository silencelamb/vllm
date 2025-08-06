#!/usr/bin/env python3
"""测试 reshape_and_cache_flash 的 XLA 实现"""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import numpy as np
from xla_ops import reshape_and_cache_flash


def test_basic_functionality():
    """测试基本功能"""
    print("Testing basic functionality...")
    
    # 参数设置
    num_tokens = 4
    num_heads = 2
    head_size = 8
    num_blocks = 2
    block_size = 4
    
    # 创建测试数据
    key = torch.randn(num_tokens, num_heads, head_size)
    value = torch.randn(num_tokens, num_heads, head_size)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    
    # slot_mapping: 将 token 映射到 cache slot
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64)
    
    # 缩放因子
    k_scale = torch.tensor([1.0])
    v_scale = torch.tensor([1.0])
    
    # 测试 CPU 版本
    print("Testing CPU version...")
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", k_scale, v_scale
    )
    
    # 验证结果
    for i in range(num_tokens):
        slot = slot_mapping[i].item()
        block_idx = slot // block_size
        block_offset = slot % block_size
        
        # 检查 key 是否正确复制
        expected_key = key[i]
        actual_key = key_cache[block_idx, block_offset]
        assert torch.allclose(expected_key, actual_key), f"Key mismatch at token {i}"
        
        # 检查 value 是否正确复制
        expected_value = value[i]
        actual_value = value_cache[block_idx, block_offset]
        assert torch.allclose(expected_value, actual_value), f"Value mismatch at token {i}"
    
    print("✓ CPU version passed!")


def test_cuda_functionality():
    """测试 CUDA 功能"""
    if not torch.cuda.is_available():
        print("CUDA not available, skipping CUDA test")
        return
    
    print("\nTesting CUDA version...")
    
    device = torch.device("cuda")
    
    # 参数设置
    num_tokens = 8
    num_heads = 4
    head_size = 64
    num_blocks = 2
    block_size = 8
    
    # 创建测试数据
    key = torch.randn(num_tokens, num_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_heads, head_size, device=device)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    
    # slot_mapping
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64, device=device)
    
    # 缩放因子
    k_scale = torch.tensor([1.0], device=device)
    v_scale = torch.tensor([1.0], device=device)
    
    # 执行操作
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", k_scale, v_scale
    )
    
    print("✓ CUDA version executed successfully!")


def test_xla_functionality():
    """测试 XLA 功能"""
    try:
        import torch_xla.core.xla_model as xm
        device = xm.xla_device()
    except:
        print("\nXLA not available, skipping XLA test")
        return
    
    print("\nTesting XLA version...")
    
    # 参数设置
    num_tokens = 4
    num_heads = 2
    head_size = 8
    num_blocks = 1
    block_size = 4
    
    # 创建测试数据
    key = torch.randn(num_tokens, num_heads, head_size).to(device)
    value = torch.randn(num_tokens, num_heads, head_size).to(device)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size).to(device)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size).to(device)
    
    # slot_mapping
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64).to(device)
    
    # 缩放因子
    k_scale = torch.tensor([1.0]).to(device)
    v_scale = torch.tensor([1.0]).to(device)
    
    # 执行操作
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", k_scale, v_scale
    )
    
    # 同步以确保操作完成
    xm.mark_step()
    
    print("✓ XLA version executed successfully!")


def test_fp8_scaling():
    """测试 FP8 缩放功能"""
    print("\nTesting FP8 scaling...")
    
    # 参数设置
    num_tokens = 2
    num_heads = 1
    head_size = 4
    num_blocks = 1
    block_size = 2
    
    # 创建测试数据
    key = torch.ones(num_tokens, num_heads, head_size)
    value = torch.ones(num_tokens, num_heads, head_size) * 2
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    
    slot_mapping = torch.tensor([0, 1], dtype=torch.int64)
    
    # 使用缩放因子
    k_scale = torch.tensor([0.5])
    v_scale = torch.tensor([0.25])
    
    # 执行操作
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "fp8", k_scale, v_scale
    )
    
    # 验证缩放是否正确应用
    expected_key_value = 0.5  # 1.0 * 0.5
    expected_value_value = 0.5  # 2.0 * 0.25
    
    assert torch.allclose(key_cache[0, 0], torch.full((num_heads, head_size), expected_key_value))
    assert torch.allclose(value_cache[0, 0], torch.full((num_heads, head_size), expected_value_value))
    
    print("✓ FP8 scaling test passed!")


def test_padding_tokens():
    """测试填充标记的处理"""
    print("\nTesting padding token handling...")
    
    # 参数设置
    num_tokens = 4
    num_heads = 2
    head_size = 4
    num_blocks = 1
    block_size = 4
    
    # 创建测试数据
    key = torch.randn(num_tokens, num_heads, head_size)
    value = torch.randn(num_tokens, num_heads, head_size)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    
    # slot_mapping with -1 for padding tokens
    slot_mapping = torch.tensor([0, 1, -1, 2], dtype=torch.int64)
    
    k_scale = torch.tensor([1.0])
    v_scale = torch.tensor([1.0])
    
    # 执行操作
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", k_scale, v_scale
    )
    
    # 验证只有非填充标记被复制
    assert torch.allclose(key_cache[0, 0], key[0])
    assert torch.allclose(key_cache[0, 1], key[1])
    assert torch.allclose(key_cache[0, 2], key[3])  # token 2 被跳过
    
    print("✓ Padding token handling test passed!")


def benchmark_performance():
    """性能基准测试"""
    if not torch.cuda.is_available():
        print("\nCUDA not available, skipping benchmark")
        return
    
    print("\nRunning performance benchmark...")
    
    import time
    
    device = torch.device("cuda")
    
    # 大规模参数
    num_tokens = 1024
    num_heads = 32
    head_size = 128
    num_blocks = 256
    block_size = 16
    
    # 创建数据
    key = torch.randn(num_tokens, num_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_heads, head_size, device=device)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64, device=device)
    k_scale = torch.tensor([1.0], device=device)
    v_scale = torch.tensor([1.0], device=device)
    
    # 预热
    for _ in range(10):
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", k_scale, v_scale
        )
    
    torch.cuda.synchronize()
    
    # 计时
    num_iterations = 100
    start_time = time.time()
    
    for _ in range(num_iterations):
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", k_scale, v_scale
        )
    
    torch.cuda.synchronize()
    end_time = time.time()
    
    avg_time = (end_time - start_time) / num_iterations * 1000  # ms
    throughput = (num_tokens * num_heads * head_size * 2 * 4) / (avg_time / 1000) / 1e9  # GB/s
    
    print(f"Average time: {avg_time:.2f} ms")
    print(f"Throughput: {throughput:.2f} GB/s")


if __name__ == "__main__":
    print("=" * 60)
    print("Testing reshape_and_cache_flash XLA implementation")
    print("=" * 60)
    
    # 运行所有测试
    # test_basic_functionality()
    # test_cuda_functionality()
    test_xla_functionality()
    test_fp8_scaling()
    test_padding_tokens()
    benchmark_performance()
    
    print("\n" + "=" * 60)
    print("All tests completed!")
    print("=" * 60)
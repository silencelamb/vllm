#!/usr/bin/env python3
"""简单测试 - 不依赖编译的 C++ 扩展"""

import torch
import sys
import os

# 添加路径
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

def simple_reshape_and_cache(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """简单的 Python 实现，用于演示逻辑"""
    
    num_tokens = key.size(0)
    num_heads = key.size(1)
    head_size = key.size(2)
    block_size = key_cache.size(1)
    
    for token_idx in range(num_tokens):
        slot_idx = slot_mapping[token_idx].item()
        if slot_idx < 0:
            continue  # 跳过填充标记
        
        block_idx = slot_idx // block_size
        block_offset = slot_idx % block_size
        
        # 复制数据到 cache
        for head_idx in range(num_heads):
            for dim_idx in range(head_size):
                key_val = key[token_idx, head_idx, dim_idx]
                value_val = value[token_idx, head_idx, dim_idx]
                
                # 应用缩放
                if kv_cache_dtype == "fp8":
                    key_val = key_val * k_scale[0]
                    value_val = value_val * v_scale[0]
                
                # 写入 cache
                key_cache[block_idx, block_offset, head_idx, dim_idx] = key_val
                value_cache[block_idx, block_offset, head_idx, dim_idx] = value_val
    
    print(f"✓ Cached {num_tokens} tokens into blocks")


def test_simple():
    """运行简单测试"""
    print("Running simple reshape_and_cache_flash test...")
    print("-" * 60)
    
    # 小规模参数
    num_tokens = 4
    num_heads = 2
    head_size = 8
    num_blocks = 1
    block_size = 4
    
    print(f"Configuration:")
    print(f"  - Tokens: {num_tokens}")
    print(f"  - Heads: {num_heads}")
    print(f"  - Head size: {head_size}")
    print(f"  - Blocks: {num_blocks}")
    print(f"  - Block size: {block_size}")
    print()
    
    # 创建测试数据
    key = torch.randn(num_tokens, num_heads, head_size)
    value = torch.randn(num_tokens, num_heads, head_size)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size)
    
    # 创建 slot mapping
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64)
    
    # 缩放因子
    k_scale = torch.tensor([1.0])
    v_scale = torch.tensor([1.0])
    
    print("Before caching:")
    print(f"  - key_cache sum: {key_cache.sum().item():.4f}")
    print(f"  - value_cache sum: {value_cache.sum().item():.4f}")
    print()
    
    # 执行操作
    simple_reshape_and_cache(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", k_scale, v_scale
    )
    
    print("\nAfter caching:")
    print(f"  - key_cache sum: {key_cache.sum().item():.4f}")
    print(f"  - value_cache sum: {value_cache.sum().item():.4f}")
    print()
    
    # 验证
    print("Verifying results...")
    all_correct = True
    
    for i in range(num_tokens):
        slot = slot_mapping[i].item()
        block_idx = slot // block_size
        block_offset = slot % block_size
        
        expected_key = key[i]
        actual_key = key_cache[block_idx, block_offset]
        
        if not torch.allclose(expected_key, actual_key, rtol=1e-5):
            print(f"  ✗ Key mismatch at token {i}")
            all_correct = False
        
        expected_value = value[i]
        actual_value = value_cache[block_idx, block_offset]
        
        if not torch.allclose(expected_value, actual_value, rtol=1e-5):
            print(f"  ✗ Value mismatch at token {i}")
            all_correct = False
    
    if all_correct:
        print("  ✓ All tokens cached correctly!")
    
    print("\n" + "-" * 60)
    print("Test completed!")


def test_with_xla_simulation():
    """模拟 XLA 环境的测试"""
    print("\n\nTesting with XLA simulation...")
    print("-" * 60)
    
    # 尝试导入我们的模块
    try:
        from xla_ops import reshape_and_cache_flash
        print("✓ Successfully imported xla_ops module")
        
        # 创建小规模测试数据
        key = torch.ones(2, 2, 4)
        value = torch.ones(2, 2, 4) * 2
        key_cache = torch.zeros(1, 2, 2, 4)
        value_cache = torch.zeros(1, 2, 2, 4)
        slot_mapping = torch.tensor([0, 1], dtype=torch.int64)
        k_scale = torch.tensor([0.5])
        v_scale = torch.tensor([0.5])
        
        # 调用函数
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "fp8", k_scale, v_scale
        )
        
        print("✓ Function executed successfully")
        print(f"  - key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.2f} (expected: 0.50)")
        print(f"  - value_cache[0,0,0,0]: {value_cache[0,0,0,0].item():.2f} (expected: 1.00)")
        
    except ImportError as e:
        print(f"✗ Could not import xla_ops: {e}")
        print("  This is expected if the C++ extension hasn't been compiled")
        print("  Run ./build.sh to compile the extension")


if __name__ == "__main__":
    test_simple()
    test_with_xla_simulation()
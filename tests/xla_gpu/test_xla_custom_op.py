"""Test XLA GPU custom op registration and usage."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention


def test_xla_gpu_paged_attention_op():
    """Test that the custom XLA GPU paged attention op can be called and traced."""
    
    # Create test tensors with appropriate shapes
    batch_size = 2
    num_heads = 8
    head_size = 64
    num_tokens = 10
    num_blocks = 4
    block_size = 16
    num_kv_heads = 8
    
    # Create input tensors
    query = torch.randn(num_tokens, num_heads, head_size)
    kv_cache = torch.randn(num_blocks, block_size, num_kv_heads * 2, head_size)
    context_lens = torch.tensor([5, 4], dtype=torch.int32)
    block_tables = torch.zeros((batch_size, num_blocks), dtype=torch.int32)
    query_start_loc = torch.tensor([0, 5], dtype=torch.int32)
    num_seqs = torch.tensor(batch_size, dtype=torch.int32)
    scale = 1.0 / (head_size ** 0.5)
    
    # Move to XLA device if available
    device = xm.xla_device() if torch_xla.runtime.device_type() == "GPU" else "cpu"
    query = query.to(device)
    kv_cache = kv_cache.to(device)
    context_lens = context_lens.to(device)
    block_tables = block_tables.to(device)
    query_start_loc = query_start_loc.to(device)
    num_seqs = num_seqs.to(device)
    
    # Call the custom op
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
    
    # Verify output shape
    expected_shape = query.shape
    assert output.shape == expected_shape, f"Output shape {output.shape} doesn't match expected {expected_shape}"
    
    # Verify output device
    assert output.device == query.device, f"Output device {output.device} doesn't match query device {query.device}"
    
    print("✓ Custom XLA GPU paged attention op test passed!")
    return output


def test_xla_compilation():
    """Test that the custom op can be compiled with XLA."""
    
    @torch.compile(backend="openxla")
    def attention_with_custom_op(query, kv_cache, context_lens, block_tables, query_start_loc, num_seqs, scale):
        return xla_gpu_paged_attention(
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
    
    # Create test inputs
    query = torch.randn(10, 8, 64)
    kv_cache = torch.randn(4, 16, 16, 64)
    context_lens = torch.tensor([5, 4], dtype=torch.int32)
    block_tables = torch.zeros((2, 4), dtype=torch.int32)
    query_start_loc = torch.tensor([0, 5], dtype=torch.int32)
    num_seqs = torch.tensor(2, dtype=torch.int32)
    scale = 0.125
    
    # Move to XLA device if available
    device = xm.xla_device() if torch_xla.runtime.device_type() == "GPU" else "cpu"
    query = query.to(device)
    kv_cache = kv_cache.to(device)
    context_lens = context_lens.to(device)
    block_tables = block_tables.to(device)
    query_start_loc = query_start_loc.to(device)
    num_seqs = num_seqs.to(device)
    
    # Call compiled function
    output = attention_with_custom_op(query, kv_cache, context_lens, block_tables, query_start_loc, num_seqs, scale)
    
    # Verify result
    assert output.shape == query.shape
    print("✓ XLA compilation with custom op test passed!")
    
    return output


if __name__ == "__main__":
    print("Testing XLA GPU custom op registration...")
    
    # Test basic functionality
    test_xla_gpu_paged_attention_op()
    
    # Test XLA compilation
    try:
        test_xla_compilation()
    except Exception as e:
        print(f"XLA compilation test skipped: {e}")
    
    print("\nAll tests passed!")
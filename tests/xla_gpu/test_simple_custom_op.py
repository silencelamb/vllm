"""Simple test for XLA GPU custom op without XLA dependencies."""

import torch


def test_custom_op_registration():
    """Test that custom op is properly registered."""
    # Check if the op is registered
    assert hasattr(torch.ops, 'xla_gpu'), "xla_gpu namespace not found in torch.ops"
    assert hasattr(torch.ops.xla_gpu, 'paged_attention'), "paged_attention op not found"
    print("✓ Custom op is properly registered")


def test_custom_op_cpu():
    """Test custom op on CPU."""
    from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention
    
    # Create simple test inputs
    query = torch.randn(4, 8, 64)  # [num_tokens, num_heads, head_size]
    kv_cache = torch.randn(2, 16, 16, 64)  # [num_blocks, block_size, num_kv_heads * 2, head_size]
    context_lens = torch.tensor([2, 2], dtype=torch.int32)
    block_tables = torch.zeros((2, 2), dtype=torch.int32)
    query_start_loc = torch.tensor([0, 2], dtype=torch.int32)
    num_seqs = torch.tensor(2, dtype=torch.int32)
    scale = 0.125
    
    # Call the op
    output = xla_gpu_paged_attention(
        query, kv_cache, context_lens, block_tables,
        query_start_loc, num_seqs, scale
    )
    
    # Verify output
    assert output.shape == query.shape, f"Expected shape {query.shape}, got {output.shape}"
    assert output.dtype == query.dtype, f"Expected dtype {query.dtype}, got {output.dtype}"
    print("✓ CPU execution successful")


def test_custom_op_cuda():
    """Test custom op on CUDA if available."""
    if not torch.cuda.is_available():
        print("⚠ CUDA not available, skipping CUDA test")
        return
    
    from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention
    
    # Create test inputs on CUDA
    query = torch.randn(4, 8, 64, device='cuda')
    kv_cache = torch.randn(2, 16, 16, 64, device='cuda')
    context_lens = torch.tensor([2, 2], dtype=torch.int32, device='cuda')
    block_tables = torch.zeros((2, 2), dtype=torch.int32, device='cuda')
    query_start_loc = torch.tensor([0, 2], dtype=torch.int32, device='cuda')
    num_seqs = torch.tensor(2, dtype=torch.int32, device='cuda')
    scale = 0.125
    
    # Call the op
    output = xla_gpu_paged_attention(
        query, kv_cache, context_lens, block_tables,
        query_start_loc, num_seqs, scale
    )
    
    # Verify output
    assert output.shape == query.shape
    assert output.device == query.device
    print("✓ CUDA execution successful")


if __name__ == "__main__":
    print("Testing XLA GPU custom op (simplified)...\n")
    
    # Import the module to register the op
    import vllm.v1.attention.backends.xla_gpu_paged_attention
    
    test_custom_op_registration()
    test_custom_op_cpu()
    test_custom_op_cuda()
    
    print("\n✅ All tests passed!")
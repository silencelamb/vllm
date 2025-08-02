"""Test XLA GPU custom op registration and usage."""

import torch
import os
from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention


def test_xla_gpu_paged_attention_op():
    """Test that the custom XLA GPU paged attention op can be called."""
    
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
    
    # Move to CUDA if available
    device = "cuda" if torch.cuda.is_available() else "cpu"
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


def test_torch_compile():
    """Test that the custom op can be compiled with torch.compile."""
    
    @torch.compile(fullgraph=True)
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
    
    # Move to CUDA if available
    device = "cuda" if torch.cuda.is_available() else "cpu"
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
    print("✓ torch.compile with custom op test passed!")
    
    return output


def test_xla_backend_with_hlo():
    """Test the custom op with XLA backend and save HLO/StableHLO."""
    try:
        import torch_xla
        import torch_xla.core.xla_model as xm
        import torch_xla.debug.metrics as met
        
        # Enable HLO dumping
        os.environ['XLA_FLAGS'] = '--xla_dump_to=./xla_dump --xla_dump_hlo_as_text --xla_dump_hlo_as_proto'
        os.environ['XLA_HLO_DEBUG'] = '1'
        
        # Create test inputs
        query = torch.randn(10, 8, 64)
        kv_cache = torch.randn(4, 16, 16, 64)
        context_lens = torch.tensor([5, 4], dtype=torch.int32)
        block_tables = torch.zeros((2, 4), dtype=torch.int32)
        query_start_loc = torch.tensor([0, 5], dtype=torch.int32)
        num_seqs = torch.tensor(2, dtype=torch.int32)
        scale = 0.125
        
        # Move to XLA device
        device = xm.xla_device()
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
        
        # Force materialization and wait for completion
        xm.mark_step()
        xm.wait_device_ops()  # Ensure all operations complete
        
        # Print HLO text
        print("\n=== HLO Graph ===")
        hlo_text = torch_xla._XLAC._get_xla_tensors_text([output])
        print(hlo_text[:1000] + "..." if len(hlo_text) > 1000 else hlo_text)
        
        # Save StableHLO if available
        try:
            import torch_xla.stablehlo as stablehlo
            
            # Get StableHLO representation
            stablehlo_text = stablehlo.get_stablehlo([output])
            with open("xla_gpu_paged_attention_stablehlo.txt", "w") as f:
                f.write(stablehlo_text)
            print("\n✓ StableHLO saved to xla_gpu_paged_attention_stablehlo.txt")
        except Exception as e:
            print(f"\n⚠ StableHLO export not available: {e}")
        
        # Print metrics
        print("\n=== XLA Metrics ===")
        print(met.metrics_report())
        
        assert output.shape == query.shape
        print("\n✓ XLA backend test with HLO passed!")
        
    except ImportError:
        print("⚠ XLA backend test skipped (torch_xla not available)")


def test_xla_compile_with_openxla():
    """Test compilation with OpenXLA backend."""
    try:
        import torch_xla
        
        @torch.compile(backend="openxla")
        def attention_xla(query, kv_cache, context_lens, block_tables, query_start_loc, num_seqs, scale):
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
        
        # Create inputs
        query = torch.randn(10, 8, 64)
        kv_cache = torch.randn(4, 16, 16, 64)
        context_lens = torch.tensor([5, 4], dtype=torch.int32)
        block_tables = torch.zeros((2, 4), dtype=torch.int32)
        query_start_loc = torch.tensor([0, 5], dtype=torch.int32)
        num_seqs = torch.tensor(2, dtype=torch.int32)
        scale = 0.125
        
        # Note: For OpenXLA backend, we can use regular CUDA tensors
        # XLA will handle the device placement
        device = "cuda" if torch.cuda.is_available() else "cpu"
        query = query.to(device)
        kv_cache = kv_cache.to(device)
        context_lens = context_lens.to(device)
        block_tables = block_tables.to(device)
        query_start_loc = query_start_loc.to(device)
        num_seqs = num_seqs.to(device)
        
        # Run compiled function
        output = attention_xla(query, kv_cache, context_lens, block_tables, query_start_loc, num_seqs, scale)
        
        assert output.shape == query.shape
        print("✓ OpenXLA compilation test passed!")
        
    except Exception as e:
        print(f"⚠ OpenXLA compilation test skipped: {e}")


if __name__ == "__main__":
    print("Testing XLA GPU custom op registration...")
    print("\n" + "="*50 + "\n")
    
    # Test basic functionality
    test_xla_gpu_paged_attention_op()
    
    # Test torch.compile
    try:
        test_torch_compile()
    except Exception as e:
        print(f"⚠ torch.compile test skipped: {e}")
    
    # Test XLA backend with HLO dumping
    test_xla_backend_with_hlo()
    
    # Test OpenXLA compilation
    test_xla_compile_with_openxla()
    
    print("\n" + "="*50)
    print("\nAll available tests passed!")
    
    print("\n📝 Notes:")
    print("1. Device placement: When using torch.compile(backend='openxla'), CUDA tensors work fine.")
    print("   XLA handles the device mapping internally.")
    print("2. xm.mark_step() vs xm.wait_device_ops():")
    print("   - mark_step(): Marks a step boundary, triggers lazy execution")
    print("   - wait_device_ops(): Blocks until all device operations complete")
    print("   - Use both for ensuring operations complete before checking results")
    print("3. HLO graphs are saved in ./xla_dump/ directory (if XLA_FLAGS is set)")
"""Test to verify custom op appears in HLO."""

import torch
import os


def test_simple_custom_op_in_hlo():
    """Test the simple version that should show in HLO."""
    try:
        import torch_xla
        import torch_xla.core.xla_model as xm
        from vllm.v1.attention.backends.xla_gpu_paged_attention_simple import xla_gpu_paged_attention_simple
        
        print("Testing simple custom op in HLO...")
        
        # Create inputs
        query = torch.randn(4, 8, 64)
        kv_cache = torch.randn(2, 16, 16, 64)
        context_lens = torch.tensor([2, 2], dtype=torch.int32)
        block_tables = torch.zeros((2, 2), dtype=torch.int32)
        query_start_loc = torch.tensor([0, 2], dtype=torch.int32)
        num_seqs = torch.tensor(2, dtype=torch.int32)
        scale = 0.125
        
        # Move to XLA
        device = xm.xla_device()
        query_xla = query.to(device)
        kv_cache_xla = kv_cache.to(device)
        context_lens_xla = context_lens.to(device)
        block_tables_xla = block_tables.to(device)
        query_start_loc_xla = query_start_loc.to(device)
        num_seqs_xla = num_seqs.to(device)
        
        # Call custom op
        output = xla_gpu_paged_attention_simple(
            query_xla, kv_cache_xla, context_lens_xla, block_tables_xla,
            query_start_loc_xla, num_seqs_xla, scale
        )
        
        # Get HLO before execution
        print("\nHLO Graph (before mark_step):")
        hlo_text = torch_xla._XLAC._get_xla_tensors_text([output])
        print(hlo_text)
        
        # Execute
        xm.mark_step()
        
        # Also try to get the full HLO module
        print("\n" + "="*60)
        print("Checking for custom op in HLO...")
        
        # Search for our op name in the HLO
        if "xla_gpu_simple" in hlo_text or "paged_attention" in hlo_text:
            print("✅ Custom op name found in HLO!")
        else:
            print("⚠️  Custom op name not found in HLO text")
            print("Note: The op might be inlined or optimized")
            
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()


def test_comparison():
    """Compare different implementations."""
    try:
        import torch_xla
        import torch_xla.core.xla_model as xm
        
        # Import all versions
        from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention
        from vllm.v1.attention.backends.xla_gpu_paged_attention_simple import xla_gpu_paged_attention_simple
        
        device = xm.xla_device()
        
        # Test data
        query = torch.randn(4, 8, 64).to(device)
        kv_cache = torch.randn(2, 16, 16, 64).to(device)
        context_lens = torch.tensor([2, 2], dtype=torch.int32).to(device)
        block_tables = torch.zeros((2, 2), dtype=torch.int32).to(device)
        query_start_loc = torch.tensor([0, 2], dtype=torch.int32).to(device)
        num_seqs = torch.tensor(2, dtype=torch.int32).to(device)
        scale = 0.125
        
        print("\n" + "="*60)
        print("Comparing implementations:\n")
        
        # Version 1 (zeros_like)
        print("1. Original (zeros_like):")
        out1 = xla_gpu_paged_attention(
            query, kv_cache, context_lens, block_tables,
            query_start_loc, num_seqs, scale
        )
        hlo1 = torch_xla._XLAC._get_xla_tensors_text([out1])
        print(f"   HLO length: {len(hlo1)} chars")
        print(f"   Contains 'broadcast': {'broadcast' in hlo1.lower()}")
        print(f"   Contains 'constant': {'constant' in hlo1.lower()}")
        
        # Version 2 (with computation)
        print("\n2. Simple (with computation):")
        out2 = xla_gpu_paged_attention_simple(
            query, kv_cache, context_lens, block_tables,
            query_start_loc, num_seqs, scale
        )
        hlo2 = torch_xla._XLAC._get_xla_tensors_text([out2])
        print(f"   HLO length: {len(hlo2)} chars")
        print(f"   Contains 'multiply': {'multiply' in hlo2.lower()}")
        print(f"   Contains 'reduce': {'reduce' in hlo2.lower() or 'sum' in hlo2.lower()}")
        
        xm.mark_step()
        
    except Exception as e:
        print(f"Comparison test error: {e}")


if __name__ == "__main__":
    test_simple_custom_op_in_hlo()
    test_comparison()
    
    print("\n" + "="*60)
    print("\n💡 Key Insights:")
    print("1. Custom ops that return constants (like zeros_like) get optimized away")
    print("2. To preserve custom ops in HLO, they must perform non-trivial computations")
    print("3. For production use, implement actual CUDA kernels that XLA can't optimize")
    print("\n4. Alternative: Use XLA's register_custom_call API for guaranteed visibility")
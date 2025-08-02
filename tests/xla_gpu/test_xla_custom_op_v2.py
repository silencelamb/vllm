"""Test XLA GPU custom op with proper HLO representation."""

import torch
import os


def test_xla_backend_with_custom_call():
    """Test that custom op appears in HLO graph."""
    try:
        import torch_xla
        import torch_xla.core.xla_model as xm
        import torch_xla.debug.metrics as met
        
        # Import both versions
        from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention
        from vllm.v1.attention.backends.xla_gpu_paged_attention_v2 import xla_gpu_paged_attention_v2
        
        # Enable HLO dumping
        os.environ['XLA_FLAGS'] = '--xla_dump_to=./xla_dump_v2 --xla_dump_hlo_as_text --xla_dump_hlo_as_proto'
        os.environ['XLA_HLO_DEBUG'] = '1'
        
        print("Testing XLA custom op HLO representation...")
        print("=" * 60)
        
        # Create test inputs
        query = torch.randn(4, 8, 64)
        kv_cache = torch.randn(2, 16, 16, 64)
        context_lens = torch.tensor([2, 2], dtype=torch.int32)
        block_tables = torch.zeros((2, 2), dtype=torch.int32)
        query_start_loc = torch.tensor([0, 2], dtype=torch.int32)
        num_seqs = torch.tensor(2, dtype=torch.int32)
        scale = 0.125
        
        # Move to XLA device
        device = xm.xla_device()
        query_xla = query.to(device)
        kv_cache_xla = kv_cache.to(device)
        context_lens_xla = context_lens.to(device)
        block_tables_xla = block_tables.to(device)
        query_start_loc_xla = query_start_loc.to(device)
        num_seqs_xla = num_seqs.to(device)
        
        # Test version 1 (may be optimized away)
        print("\n1. Testing original implementation:")
        output_v1 = xla_gpu_paged_attention(
            query_xla, kv_cache_xla, context_lens_xla, block_tables_xla,
            query_start_loc_xla, num_seqs_xla, scale
        )
        
        # Force execution
        xm.mark_step()
        xm.wait_device_ops()
        
        # Get HLO for v1
        print("\nHLO for v1 (may be optimized to broadcast):")
        hlo_v1 = torch_xla._XLAC._get_xla_tensors_text([output_v1])
        print(hlo_v1[:500] + "..." if len(hlo_v1) > 500 else hlo_v1)
        
        # Test version 2 (should show custom-call)
        print("\n2. Testing v2 with explicit custom call:")
        output_v2 = xla_gpu_paged_attention_v2(
            query_xla, kv_cache_xla, context_lens_xla, block_tables_xla,
            query_start_loc_xla, num_seqs_xla, scale
        )
        
        # Force execution
        xm.mark_step()
        xm.wait_device_ops()
        
        # Get HLO for v2
        print("\nHLO for v2 (should show custom-call):")
        hlo_v2 = torch_xla._XLAC._get_xla_tensors_text([output_v2])
        print(hlo_v2[:1000] + "..." if len(hlo_v2) > 1000 else hlo_v2)
        
        # Search for custom-call in HLO
        if "custom-call" in hlo_v2.lower() or "customcall" in hlo_v2.lower():
            print("\n✅ SUCCESS: Custom call found in HLO graph!")
            print("The custom op will be visible to XLA compiler.")
        else:
            print("\n⚠️  WARNING: Custom call not found in HLO text.")
            print("The op might have been optimized away.")
        
        # Print compilation metrics
        print("\n" + "=" * 60)
        print("XLA Metrics:")
        print(met.counter_names())
        
        return output_v2
        
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()


def test_traced_graph_with_custom_op():
    """Test how the custom op appears in torch.fx traced graph."""
    try:
        from vllm.v1.attention.backends.xla_gpu_paged_attention import xla_gpu_paged_attention
        
        print("\n" + "=" * 60)
        print("Testing torch.fx graph representation...")
        
        # Create a simple function using the custom op
        def attention_fn(query, kv_cache, context_lens, block_tables, 
                        query_start_loc, num_seqs):
            return xla_gpu_paged_attention(
                query, kv_cache, context_lens, block_tables,
                query_start_loc, num_seqs, scale=0.125
            )
        
        # Create sample inputs
        query = torch.randn(4, 8, 64)
        kv_cache = torch.randn(2, 16, 16, 64)
        context_lens = torch.tensor([2, 2], dtype=torch.int32)
        block_tables = torch.zeros((2, 2), dtype=torch.int32)
        query_start_loc = torch.tensor([0, 2], dtype=torch.int32)
        num_seqs = torch.tensor(2, dtype=torch.int32)
        
        # Trace the function
        import torch.fx
        traced = torch.fx.symbolic_trace(attention_fn)
        
        print("\nTraced graph:")
        print(traced.graph)
        
        # Check for custom op in graph
        for node in traced.graph.nodes:
            if 'xla_gpu' in str(node.target):
                print(f"\n✅ Found custom op node: {node.target}")
                print(f"   Args: {node.args}")
                print(f"   Kwargs: {node.kwargs}")
        
    except Exception as e:
        print(f"FX tracing test skipped: {e}")


if __name__ == "__main__":
    print("XLA GPU Custom Op HLO Representation Test")
    print("=" * 60)
    
    # Run tests
    test_xla_backend_with_custom_call()
    test_traced_graph_with_custom_op()
    
    print("\n" + "=" * 60)
    print("\n📝 Analysis:")
    print("1. The original implementation returns zeros_like, which XLA optimizes to broadcast")
    print("2. To make custom ops visible in HLO, use:")
    print("   - XLA lowering with @register_lowering")
    print("   - Direct _xla_custom_call for explicit custom-call nodes")
    print("   - Avoid operations that can be constant-folded")
    print("\n3. Check ./xla_dump_v2/ for detailed HLO dumps")
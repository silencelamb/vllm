#!/usr/bin/env python3
"""Test script to verify XLA custom ops integration with vLLM."""

import os
import sys
import torch
import torch_xla
import torch_xla.core.xla_model as xm

def test_xla_custom_ops_registration():
    """Test that XLA custom ops are properly registered."""
    print("=" * 60)
    print("Testing XLA Custom Ops Registration")
    print("=" * 60)
    
    # Check if we're on XLA device
    if not xm.is_xla_tensor(torch.zeros(1)):
        print("Not running on XLA device, skipping test")
        return False
    
    # Check if custom ops are registered
    has_flash_attn = hasattr(torch.ops.xla, 'flash_attn_varlen_op')
    has_reshape_cache = hasattr(torch.ops.xla, 'reshape_and_cache_flash')
    
    print(f"✓ XLA device detected")
    print(f"{'✓' if has_flash_attn else '✗'} flash_attn_varlen_op registered: {has_flash_attn}")
    print(f"{'✓' if has_reshape_cache else '✗'} reshape_and_cache_flash registered: {has_reshape_cache}")
    
    return has_flash_attn and has_reshape_cache


def test_xla_gpu_attention_backend():
    """Test that XLA GPU attention backend can be imported and used."""
    print("\n" + "=" * 60)
    print("Testing XLA GPU Attention Backend")
    print("=" * 60)
    
    try:
        # Import the XLA GPU attention backend
        from vllm.v1.attention.backends.xla_gpu_native import (
            XlaGpuPagedAttentionBackend,
            XlaGpuPagedMetadata,
            XLA_CUSTOM_OPS_AVAILABLE
        )
        
        print(f"✓ XLA GPU attention backend imported successfully")
        print(f"  XLA_CUSTOM_OPS_AVAILABLE: {XLA_CUSTOM_OPS_AVAILABLE}")
        
        # Check backend properties
        backend = XlaGpuPagedAttentionBackend
        print(f"  Backend name: {backend.get_name()}")
        print(f"  Accept output buffer: {backend.accept_output_buffer}")
        
        # Test KV cache shape calculation
        kv_shape = backend.get_kv_cache_shape(
            num_blocks=10,
            block_size=16, 
            num_kv_heads=8,
            head_size=128
        )
        print(f"  KV cache shape: {kv_shape}")
        
        return True
        
    except Exception as e:
        print(f"✗ Failed to test XLA GPU attention backend: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_simple_attention():
    """Test a simple attention operation with XLA custom ops."""
    print("\n" + "=" * 60)
    print("Testing Simple Attention Operation")
    print("=" * 60)
    
    if not xm.is_xla_tensor(torch.zeros(1)):
        print("Not running on XLA device, skipping test")
        return False
    
    try:
        device = xm.xla_device()
        
        # Create simple test tensors
        batch_size = 2
        seq_len = 4
        num_heads = 2
        head_size = 64
        
        # Query, Key, Value tensors
        q = torch.randn(batch_size * seq_len, num_heads, head_size, 
                       device=device, dtype=torch.float16)
        k = torch.randn(batch_size * seq_len, num_heads, head_size,
                       device=device, dtype=torch.float16)
        v = torch.randn(batch_size * seq_len, num_heads, head_size,
                       device=device, dtype=torch.float16)
        
        # Cumulative sequence lengths
        cu_seqlens = torch.tensor([0, seq_len, 2*seq_len], 
                                 dtype=torch.int32, device=device)
        
        print(f"✓ Created test tensors on XLA device")
        print(f"  Q shape: {q.shape}")
        print(f"  K shape: {k.shape}")
        print(f"  V shape: {v.shape}")
        
        # Try to call the XLA custom op
        if hasattr(torch.ops.xla, 'flash_attn_varlen_op'):
            out, lse = torch.ops.xla.flash_attn_varlen_op(
                q, k, v,
                cu_seqlens, cu_seqlens,  # cu_seqlens_q, cu_seqlens_k
                seq_len, seq_len,  # max_seqlen_q, max_seqlen_k
                1.0 / (head_size ** 0.5),  # softmax_scale
                True,  # is_causal
                -1, -1,  # window_size
                0.0,  # softcap
                None,  # seqused_k
                None   # block_table
            )
            
            xm.mark_step()
            xm.wait_device_ops()
            
            print(f"✓ XLA flash attention executed successfully")
            print(f"  Output shape: {out.shape}")
            print(f"  LSE shape: {lse.shape}")
            return True
        else:
            print("✗ XLA flash_attn_varlen_op not available")
            return False
            
    except Exception as e:
        print(f"✗ Simple attention test failed: {e}")
        import traceback
        traceback.print_exc()
        return False


def main():
    """Run all integration tests."""
    print("vLLM XLA Custom Ops Integration Test")
    print("=" * 60)
    
    results = []
    
    # Test 1: Check custom ops registration
    results.append(("Custom Ops Registration", test_xla_custom_ops_registration()))
    
    # Test 2: Check XLA GPU attention backend
    results.append(("XLA GPU Attention Backend", test_xla_gpu_attention_backend()))
    
    # Test 3: Run simple attention
    results.append(("Simple Attention Operation", test_simple_attention()))
    
    # Print summary
    print("\n" + "=" * 60)
    print("Test Summary")
    print("=" * 60)
    
    all_passed = True
    for test_name, passed in results:
        status = "✓ PASSED" if passed else "✗ FAILED"
        print(f"{test_name}: {status}")
        if not passed:
            all_passed = False
    
    print("=" * 60)
    if all_passed:
        print("✓ All tests passed!")
        return 0
    else:
        print("✗ Some tests failed")
        return 1


if __name__ == "__main__":
    sys.exit(main())
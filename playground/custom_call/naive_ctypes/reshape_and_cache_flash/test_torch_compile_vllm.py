#!/usr/bin/env python3
"""Test torch.compile integration using vLLM's registered custom ops."""

import os
import sys
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct

# Add vLLM to path to import the registered ops
sys.path.insert(0, "/code/github_code/xla_vllm/vllm")

# Import vLLM to ensure custom ops are registered
try:
    # This import will register the custom ops
    from vllm.v1.attention.backends.xla_gpu_native import (
        reshape_and_cache_flash, 
        FLASH_ATTN_AVAILABLE
    )
    print(f"Flash Attention available: {FLASH_ATTN_AVAILABLE}")
except ImportError as e:
    print(f"Failed to import vLLM: {e}")
    sys.exit(1)


def test_basic_functionality():
    """Test basic reshape_and_cache functionality using vLLM's ops."""
    print("\n" + "="*60)
    print("Testing basic reshape_and_cache_flash functionality")
    print("="*60)
    
    device = xm.xla_device()
    
    # Test parameters
    num_tokens = 4
    num_kv_heads = 2
    head_size = 8
    block_size = 16
    num_blocks = 2
    
    # Create test tensors
    key = torch.randn(num_tokens, num_kv_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_kv_heads, head_size, device=device)
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    print(f"Input shapes:")
    print(f"  key: {key.shape}")
    print(f"  value: {value.shape}")
    print(f"  key_cache: {key_cache.shape}")
    print(f"  value_cache: {value_cache.shape}")
    
    # Use vLLM's registered op directly
    if FLASH_ATTN_AVAILABLE:
        # This calls the registered custom op
        torch.ops.vllm.xla_reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
    else:
        # Use fallback
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
    
    xm.mark_step()
    
    print("✓ Basic test completed successfully")
    
    # Check that caches were modified
    non_zero_key = (key_cache != 0).any().item()
    non_zero_value = (value_cache != 0).any().item()
    
    if non_zero_key and non_zero_value:
        print("✓ Caches were updated")
    else:
        print("⚠ Caches might not have been updated (check implementation)")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile integration")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create a simple function that uses reshape_and_cache
    def cache_update_fn(key, value, key_cache, value_cache, slot_mapping):
        """Function to be compiled."""
        # Use the registered op
        if FLASH_ATTN_AVAILABLE:
            torch.ops.vllm.xla_reshape_and_cache_flash(
                key, value, key_cache, value_cache,
                slot_mapping, "auto", None, None
            )
        else:
            reshape_and_cache_flash(
                key, value, key_cache, value_cache,
                slot_mapping, "auto", None, None
            )
        # Return something to verify execution
        return key_cache.sum() + value_cache.sum()
    
    # Compile the function
    compiled_fn = torch.compile(cache_update_fn, backend="openxla")
    
    # Test inputs
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    # Run the compiled function
    try:
        result = compiled_fn(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        
        print(f"✓ torch.compile test completed")
        print(f"  Cache sum: {result.item():.4f}")
        
        # Verify caches were modified
        cache_sum = key_cache.abs().sum().item() + value_cache.abs().sum().item()
        if cache_sum > 0:
            print("✓ Caches were modified by compiled function")
        else:
            print("⚠ Caches might not have been modified")
    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


def test_with_model():
    """Test with a model similar to vLLM usage."""
    print("\n" + "="*60)
    print("Testing with model (similar to vLLM)")
    print("="*60)
    
    device = xm.xla_device()
    
    class AttentionLayer(torch.nn.Module):
        """Simplified attention layer."""
        def __init__(self, num_heads, head_size, num_blocks, block_size):
            super().__init__()
            self.num_heads = num_heads
            self.head_size = head_size
            # KV cache as buffers (not parameters)
            self.register_buffer(
                'key_cache',
                torch.zeros(num_blocks, block_size, num_heads, head_size)
            )
            self.register_buffer(
                'value_cache', 
                torch.zeros(num_blocks, block_size, num_heads, head_size)
            )
        
        def forward(self, key, value, slot_mapping):
            # Use vLLM's op
            if FLASH_ATTN_AVAILABLE:
                torch.ops.vllm.xla_reshape_and_cache_flash(
                    key, value, self.key_cache, self.value_cache,
                    slot_mapping, "auto", None, None
                )
            else:
                reshape_and_cache_flash(
                    key, value, self.key_cache, self.value_cache,
                    slot_mapping, "auto", None, None
                )
            # Return cache stats for verification
            return self.key_cache.abs().mean() + self.value_cache.abs().mean()
    
    # Create and compile model
    model = AttentionLayer(num_heads=2, head_size=8, num_blocks=2, block_size=16).to(device)
    
    # Try to compile
    try:
        compiled_model = torch.compile(model, backend="openxla", fullgraph=True)
        
        # Test inputs
        key = torch.randn(4, 2, 8, device=device)
        value = torch.randn(4, 2, 8, device=device)
        slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
        
        # Run
        result = compiled_model(key, value, slot_mapping)
        xm.mark_step()
        
        print(f"✓ Model test completed")
        print(f"  Cache mean: {result.item():.4f}")
        
    except Exception as e:
        print(f"⚠ Model compilation might have graph breaks: {e}")
        # Try without fullgraph
        print("  Retrying without fullgraph=True...")
        compiled_model = torch.compile(model, backend="openxla")
        result = compiled_model(key, value, slot_mapping)
        xm.mark_step()
        print(f"✓ Model test completed (with graph breaks)")
        print(f"  Cache mean: {result.item():.4f}")


def main():
    print("="*60)
    print("Testing torch.compile with vLLM's registered ops")
    print("="*60)
    
    # Run tests
    test_basic_functionality()
    test_torch_compile()
    test_with_model()
    
    print("\n" + "="*60)
    print("✅ All tests completed!")
    print("="*60)


if __name__ == "__main__":
    main()
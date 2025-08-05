#!/usr/bin/env python3
"""Use vLLM's already registered ops with workaround for torch.compile."""

import os
import sys
import torch
import torch_xla
import torch_xla.core.xla_model as xm

# Add vLLM to path
sys.path.insert(0, "/code/github_code/xla_vllm/vllm")

# Import to ensure ops are registered
from vllm.v1.attention.backends.xla_gpu_native import (
    xla_gpu_kv_cache_update,
    FLASH_ATTN_AVAILABLE
)


def test_basic():
    """Test basic functionality using vLLM's registered ops."""
    print("\n" + "="*60)
    print("Testing basic functionality")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    print(f"Flash Attention available: {FLASH_ATTN_AVAILABLE}")
    
    # Use the function directly (not through torch.ops)
    xla_gpu_kv_cache_update(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    print("✓ Basic test completed")
    
    if (key_cache != 0).any() and (value_cache != 0).any():
        print("✓ Caches were updated")
    else:
        print("⚠ Caches might not have been updated")


def test_torch_compile_with_wrapper():
    """Test torch.compile with a wrapper function."""
    print("\n" + "="*60)
    print("Testing torch.compile with wrapper")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create a wrapper that torch.compile can handle
    def cache_update_wrapper(key, value, key_cache, value_cache, slot_mapping):
        """Wrapper that calls the XLA function directly."""
        # Call the function directly, not through torch.ops
        xla_gpu_kv_cache_update(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
        # Return something to verify execution
        return key_cache.abs().mean() + value_cache.abs().mean()
    
    # Allow the wrapper in graph
    torch._dynamo.allow_in_graph(cache_update_wrapper)
    
    # Compile the wrapper
    compiled_fn = torch.compile(cache_update_wrapper, backend="openxla")
    
    # Test
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    try:
        result = compiled_fn(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        
        print(f"✓ torch.compile test completed")
        print(f"  Result: {result.item():.4f}")
        
        if result.item() > 0:
            print("✓ Caches were modified")
    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


def test_model_with_direct_call():
    """Test with a model using direct function calls."""
    print("\n" + "="*60)
    print("Testing with model (direct calls)")
    print("="*60)
    
    device = xm.xla_device()
    
    class CacheModel(torch.nn.Module):
        def __init__(self, num_blocks, block_size, num_heads, head_size):
            super().__init__()
            self.register_buffer(
                'key_cache',
                torch.zeros(num_blocks, block_size, num_heads, head_size)
            )
            self.register_buffer(
                'value_cache',
                torch.zeros(num_blocks, block_size, num_heads, head_size)
            )
        
        def forward(self, key, value, slot_mapping):
            # Call function directly
            xla_gpu_kv_cache_update(
                key, value, self.key_cache, self.value_cache,
                slot_mapping, "auto", None, None
            )
            return self.key_cache.abs().mean()
    
    # Mark the update function as allowed
    torch._dynamo.allow_in_graph(xla_gpu_kv_cache_update)
    
    model = CacheModel(2, 16, 2, 8).to(device)
    
    # Try to compile
    try:
        compiled_model = torch.compile(model, backend="openxla")
        
        key = torch.randn(4, 2, 8, device=device)
        value = torch.randn(4, 2, 8, device=device)
        slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
        
        result = compiled_model(key, value, slot_mapping)
        xm.mark_step()
        
        print(f"✓ Model test completed")
        print(f"  Result: {result.item():.4f}")
    except Exception as e:
        print(f"✗ Model test failed: {e}")
        import traceback
        traceback.print_exc()


def test_alternative_approach():
    """Test alternative approach with torch.jit.script."""
    print("\n" + "="*60)
    print("Testing alternative with torch.jit.script")
    print("="*60)
    
    device = xm.xla_device()
    
    # Try torch.jit.script as alternative to torch.compile
    @torch.jit.script
    def scripted_update(key: torch.Tensor, value: torch.Tensor, 
                       key_cache: torch.Tensor, value_cache: torch.Tensor,
                       slot_mapping: torch.Tensor) -> torch.Tensor:
        # For scripting, we need a simpler implementation
        # This is just a placeholder that copies data
        num_tokens = key.shape[0]
        for i in range(num_tokens):
            slot = slot_mapping[i].item()
            if slot >= 0:
                block_idx = slot // 16  # assuming block_size=16
                block_offset = slot % 16
                if block_idx < key_cache.shape[0]:
                    key_cache[block_idx, block_offset] = key[i]
                    value_cache[block_idx, block_offset] = value[i]
        return key_cache.abs().mean()
    
    # Test
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    try:
        result = scripted_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        
        print(f"✓ torch.jit.script test completed")
        print(f"  Result: {result.item():.4f}")
    except Exception as e:
        print(f"✗ torch.jit.script test failed: {e}")


def main():
    print("="*60)
    print("Using vLLM's registered ops with workarounds")
    print("="*60)
    print("\nApproaches:")
    print("1. Direct function calls (not through torch.ops)")
    print("2. torch._dynamo.allow_in_graph for functions")
    print("3. Alternative: torch.jit.script")
    
    # Run tests
    test_basic()
    test_torch_compile_with_wrapper()
    test_model_with_direct_call()
    test_alternative_approach()
    
    print("\n" + "="*60)
    print("✅ Tests completed!")
    print("\nRecommendation: Use direct function calls with")
    print("torch._dynamo.allow_in_graph for torch.compile compatibility")
    print("="*60)


if __name__ == "__main__":
    main()
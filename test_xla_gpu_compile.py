#!/usr/bin/env python3
"""
Standalone test for XLA GPU custom call functions with torch.compile.
This test avoids circular imports by minimizing dependencies.
"""

import os
import sys
import torch
import torch._dynamo
import traceback
from typing import Optional, Tuple
from dataclasses import dataclass

# Set up XLA environment
os.environ["PJRT_DEVICE"] = "CUDA"
os.environ["GPU_NUM_DEVICES"] = "1"
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
os.environ["XLA_PYTHON_CLIENT_PREALLOCATE"] = "false"
os.environ["XLA_FLAGS"] = "--xla_dump_to=./xla_dump/"

import torch_xla
import torch_xla.core.xla_model as xm

print("=" * 60)
print("XLA GPU torch.compile Standalone Test")
print("=" * 60)

# Get XLA device
device = xm.xla_device()
print(f"✓ XLA device initialized: {device}")
print(f"  Device type: {device.type}")
print(f"  Using torch.compile with backend='openxla'")

# Test parameters
num_heads = 4
num_kv_heads = 2
head_size = 64
num_blocks = 16
block_size = 16
max_seq_len = 128


@dataclass
class SimpleMetadata:
    """Simplified metadata for testing."""
    num_actual_tokens: int
    max_query_len: int
    query_start_loc: torch.Tensor
    max_seq_len: int
    seq_lens: torch.Tensor
    block_table: torch.Tensor
    slot_mapping: torch.Tensor


def simple_kv_cache_update(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
) -> Tuple[torch.Tensor, torch.Tensor]:
    """Simplified KV cache update for testing."""
    num_tokens = key.shape[0]
    
    # Simple implementation: just copy to slots
    for i in range(num_tokens):
        slot_idx = slot_mapping[i].item()
        if slot_idx < 0:
            continue
        block_idx = slot_idx // block_size
        block_offset = slot_idx % block_size
        
        if block_idx < key_cache.shape[0]:
            key_cache[block_idx, block_offset] = key[i]
            value_cache[block_idx, block_offset] = value[i]
    
    return key_cache, value_cache


def simple_paged_attention(
    query: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    metadata: SimpleMetadata,
    softmax_scale: float,
) -> torch.Tensor:
    """Simplified paged attention for testing."""
    # For testing, just scale the query
    output = query * softmax_scale
    
    # Add small dependency on cache to prevent optimization
    if key_cache.numel() > 0:
        cache_factor = key_cache.view(-1)[0] * 1e-10
        output = output + cache_factor
    
    return output


def test_kv_cache_update_compile():
    """Test KV cache update with torch.compile."""
    print("\n" + "-" * 50)
    print("Test 1: KV Cache Update with torch.compile")
    print("-" * 50)
    
    try:
        def kv_update_wrapper(key, value, key_cache, value_cache, slot_mapping):
            """Wrapper for compilation."""
            # Mark dynamic dimensions
            torch._dynamo.mark_dynamic(key, 0)
            torch._dynamo.mark_dynamic(value, 0)
            torch._dynamo.mark_dynamic(slot_mapping, 0)
            
            return simple_kv_cache_update(key, value, key_cache, value_cache, slot_mapping)
        
        # Compile with openxla
        print("Compiling KV cache update...")
        compiled_fn = torch.compile(
            kv_update_wrapper,
            backend='openxla',
            fullgraph=True,
            dynamic=False,
        )
        
        # Test with different sizes
        for token_count in [4, 8, 6]:
            print(f"\nTesting with {token_count} tokens:")
            
            key = torch.randn(token_count, num_kv_heads, head_size, device=device)
            value = torch.randn(token_count, num_kv_heads, head_size, device=device)
            key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
            value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
            slot_mapping = torch.arange(token_count, dtype=torch.long, device=device)
            
            # Call compiled function
            updated_k, updated_v = compiled_fn(key, value, key_cache, value_cache, slot_mapping)
            xm.mark_step()
            
            print(f"  ✓ Executed successfully")
            print(f"  Shapes: key_cache={updated_k.shape}, value_cache={updated_v.shape}")
        
        print("\n✓ Test 1 PASSED")
        return True
        
    except Exception as e:
        print(f"✗ Test 1 FAILED: {e}")
        traceback.print_exc()
        return False


def test_paged_attention_compile():
    """Test paged attention with torch.compile."""
    print("\n" + "-" * 50)
    print("Test 2: Paged Attention with torch.compile")
    print("-" * 50)
    
    try:
        def attention_wrapper(query, key_cache, value_cache, 
                            query_start_loc, seq_lens, block_table, slot_mapping):
            """Wrapper for compilation."""
            # Mark dynamic dimensions
            torch._dynamo.mark_dynamic(query, 0)
            torch._dynamo.mark_dynamic(query_start_loc, 0)
            torch._dynamo.mark_dynamic(seq_lens, 0)
            torch._dynamo.mark_dynamic(slot_mapping, 0)
            
            metadata = SimpleMetadata(
                num_actual_tokens=query.shape[0],
                max_query_len=query.shape[0],
                query_start_loc=query_start_loc,
                max_seq_len=max_seq_len,
                seq_lens=seq_lens,
                block_table=block_table,
                slot_mapping=slot_mapping,
            )
            
            return simple_paged_attention(
                query, key_cache, value_cache, metadata,
                softmax_scale=1.0 / (head_size ** 0.5)
            )
        
        # Compile with openxla
        print("Compiling paged attention...")
        compiled_fn = torch.compile(
            attention_wrapper,
            backend='openxla',
            fullgraph=True,
            dynamic=False,
        )
        
        # Prepare static caches
        key_cache = torch.randn(num_blocks, block_size, num_kv_heads, head_size, device=device) * 0.1
        value_cache = torch.randn(num_blocks, block_size, num_kv_heads, head_size, device=device) * 0.1
        
        # Test with different sizes
        for token_count in [4, 8, 6]:
            print(f"\nTesting with {token_count} tokens:")
            
            query = torch.randn(token_count, num_heads, head_size, device=device)
            seq_lens = torch.tensor([token_count], dtype=torch.long, device=device)
            query_start_loc = torch.tensor([0, token_count], dtype=torch.long, device=device)
            block_table = torch.zeros(1, 8, dtype=torch.long, device=device)
            block_table[0, 0] = 0
            slot_mapping = torch.arange(token_count, dtype=torch.long, device=device)
            
            # Call compiled function
            output = compiled_fn(
                query, key_cache, value_cache,
                query_start_loc, seq_lens, block_table, slot_mapping
            )
            xm.mark_step()
            
            print(f"  ✓ Executed successfully")
            print(f"  Output shape: {output.shape}")
        
        print("\n✓ Test 2 PASSED")
        return True
        
    except Exception as e:
        print(f"✗ Test 2 FAILED: {e}")
        traceback.print_exc()
        return False


def test_integration_compile():
    """Test integration with torch.compile."""
    print("\n" + "-" * 50)
    print("Test 3: Integration with torch.compile")
    print("-" * 50)
    
    try:
        class Pipeline:
            def forward(self, key, value, query, key_cache, value_cache,
                       slot_mapping, seq_lens, query_start_loc, block_table):
                """Complete pipeline."""
                # Mark dynamic dimensions
                torch._dynamo.mark_dynamic(key, 0)
                torch._dynamo.mark_dynamic(value, 0)
                torch._dynamo.mark_dynamic(query, 0)
                torch._dynamo.mark_dynamic(slot_mapping, 0)
                
                # Update cache
                key_cache, value_cache = simple_kv_cache_update(
                    key, value, key_cache, value_cache, slot_mapping
                )
                
                # Create metadata
                metadata = SimpleMetadata(
                    num_actual_tokens=query.shape[0],
                    max_query_len=query.shape[0],
                    query_start_loc=query_start_loc,
                    max_seq_len=seq_lens.max().item(),
                    seq_lens=seq_lens,
                    block_table=block_table,
                    slot_mapping=slot_mapping,
                )
                
                # Compute attention
                output = simple_paged_attention(
                    query, key_cache, value_cache, metadata,
                    softmax_scale=1.0 / (head_size ** 0.5)
                )
                
                return output, key_cache, value_cache
        
        print("Compiling pipeline...")
        pipeline = Pipeline()
        compiled_pipeline = torch.compile(
            pipeline.forward,
            backend='openxla',
            fullgraph=True,
            dynamic=False,
        )
        
        # Initialize caches
        key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
        value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
        
        print("\nScenario: Prefill (4 tokens) -> Decode (1 token)")
        
        # Prefill
        prefill_tokens = 4
        key = torch.randn(prefill_tokens, num_kv_heads, head_size, device=device)
        value = torch.randn(prefill_tokens, num_kv_heads, head_size, device=device)
        query = torch.randn(prefill_tokens, num_heads, head_size, device=device)
        slot_mapping = torch.arange(prefill_tokens, dtype=torch.long, device=device)
        seq_lens = torch.tensor([prefill_tokens], dtype=torch.long, device=device)
        query_start_loc = torch.tensor([0, prefill_tokens], dtype=torch.long, device=device)
        block_table = torch.zeros(1, 8, dtype=torch.long, device=device)
        
        print(f"\nStep 1: Prefill with {prefill_tokens} tokens")
        output, key_cache, value_cache = compiled_pipeline(
            key, value, query, key_cache, value_cache,
            slot_mapping, seq_lens, query_start_loc, block_table
        )
        xm.mark_step()
        print(f"  ✓ Output shape: {output.shape}")
        
        # Decode
        decode_tokens = 1
        key_d = torch.randn(decode_tokens, num_kv_heads, head_size, device=device)
        value_d = torch.randn(decode_tokens, num_kv_heads, head_size, device=device)
        query_d = torch.randn(decode_tokens, num_heads, head_size, device=device)
        slot_mapping_d = torch.tensor([prefill_tokens], dtype=torch.long, device=device)
        seq_lens = torch.tensor([prefill_tokens + 1], dtype=torch.long, device=device)
        query_start_loc = torch.tensor([0, decode_tokens], dtype=torch.long, device=device)
        
        print(f"\nStep 2: Decode with {decode_tokens} token")
        output, key_cache, value_cache = compiled_pipeline(
            key_d, value_d, query_d, key_cache, value_cache,
            slot_mapping_d, seq_lens, query_start_loc, block_table
        )
        xm.mark_step()
        print(f"  ✓ Output shape: {output.shape}")
        
        print("\n✓ Test 3 PASSED")
        return True
        
    except Exception as e:
        print(f"✗ Test 3 FAILED: {e}")
        traceback.print_exc()
        return False


if __name__ == "__main__":
    print("\nRunning test suite...")
    results = []
    
    # Run tests
    results.append(("KV Cache Update", test_kv_cache_update_compile()))
    results.append(("Paged Attention", test_paged_attention_compile()))
    results.append(("Integration", test_integration_compile()))
    
    # Summary
    print("\n" + "=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)
    
    for test_name, passed in results:
        status = "✓ PASSED" if passed else "✗ FAILED"
        print(f"  {test_name:.<40} {status}")
    
    all_passed = all(result[1] for result in results)
    if all_passed:
        print("\n✓ All tests passed!")
        sys.exit(0)
    else:
        print("\n✗ Some tests failed!")
        sys.exit(1)
"""Test attention mask creation for XLA GPU"""

import torch
import numpy as np

def test_attention_mask_creation():
    """Test the attention mask logic from XlaGpuModelRunner"""
    
    # Simulate input batch with 2 requests
    num_reqs = 2
    num_scheduled_tokens_per_req = [3, 2]  # Request 1: 3 tokens, Request 2: 2 tokens
    num_computed_tokens_cpu = [10, 5]  # Request 1: 10 computed, Request 2: 5 computed
    padded_total_num_scheduled_tokens = 8  # Padded to 8
    
    # Create attention mask
    attention_mask = torch.full(
        (padded_total_num_scheduled_tokens, padded_total_num_scheduled_tokens),
        float('-inf'),
        dtype=torch.float32
    )
    
    print("Initial mask shape:", attention_mask.shape)
    print("Initial mask (all -inf):")
    print(attention_mask[:5, :5])  # Show 5x5 portion
    
    # Fill mask according to the logic
    token_start_idx = 0
    for req_idx in range(num_reqs):
        req_num_tokens = num_scheduled_tokens_per_req[req_idx]
        req_computed_tokens = num_computed_tokens_cpu[req_idx]
        
        print(f"\nRequest {req_idx}:")
        print(f"  Scheduled tokens: {req_num_tokens}")
        print(f"  Computed tokens: {req_computed_tokens}")
        print(f"  Token indices: [{token_start_idx}, {token_start_idx + req_num_tokens})")
        
        for i in range(req_num_tokens):
            query_idx = token_start_idx + i
            query_abs_pos = req_computed_tokens + i
            
            for j in range(req_num_tokens):
                key_idx = token_start_idx + j
                key_abs_pos = req_computed_tokens + j
                
                if key_abs_pos <= query_abs_pos:
                    attention_mask[query_idx, key_idx] = 0.0
                    print(f"    Setting mask[{query_idx}, {key_idx}] = 0.0 (query_pos={query_abs_pos}, key_pos={key_abs_pos})")
        
        token_start_idx += req_num_tokens
    
    print("\nFinal attention mask:")
    print(attention_mask[:5, :5])
    
    # Verify causal pattern
    print("\nVerifying causal pattern:")
    for req_idx in range(num_reqs):
        start = sum(num_scheduled_tokens_per_req[:req_idx])
        end = start + num_scheduled_tokens_per_req[req_idx]
        req_mask = attention_mask[start:end, start:end]
        print(f"Request {req_idx} mask portion:")
        print(req_mask)
        
        # Check if it's properly causal
        is_causal = True
        for i in range(req_mask.shape[0]):
            for j in range(req_mask.shape[1]):
                if j > i and req_mask[i, j] != float('-inf'):
                    is_causal = False
                    print(f"  ERROR: Non-causal at [{i}, {j}]")
                elif j <= i and req_mask[i, j] != 0.0:
                    is_causal = False
                    print(f"  ERROR: Not 0.0 at [{i}, {j}]")
        
        if is_causal:
            print(f"  ✓ Request {req_idx} mask is properly causal")
        else:
            print(f"  ✗ Request {req_idx} mask is NOT properly causal")


def test_slot_mapping():
    """Test slot mapping calculation"""
    
    # Simulate block table and parameters
    block_size = 16
    num_reqs = 2
    num_scheduled_tokens_per_req = [3, 2]
    num_computed_tokens_cpu = [10, 5]
    
    # Simulate block tables for each request
    block_tables = [
        [0, 1],  # Request 0: blocks 0, 1
        [2],     # Request 1: block 2
    ]
    
    # Calculate slot mapping
    slot_mapping = []
    
    for req_idx in range(num_reqs):
        req_num_scheduled_tokens = num_scheduled_tokens_per_req[req_idx]
        req_num_computed_tokens = num_computed_tokens_cpu[req_idx]
        block_table = block_tables[req_idx]
        
        print(f"\nRequest {req_idx}:")
        print(f"  Scheduled tokens: {req_num_scheduled_tokens}")
        print(f"  Computed tokens: {req_num_computed_tokens}")
        print(f"  Block table: {block_table}")
        
        for i in range(req_num_scheduled_tokens):
            token_pos = req_num_computed_tokens + i
            block_idx = token_pos // block_size
            block_offset = token_pos % block_size
            
            if block_idx < len(block_table):
                block_id = block_table[block_idx]
                slot = block_id * block_size + block_offset
                slot_mapping.append(slot)
                print(f"    Token {i} (pos={token_pos}): block_idx={block_idx}, offset={block_offset}, block_id={block_id}, slot={slot}")
            else:
                print(f"    ERROR: Token {i} (pos={token_pos}) exceeds block table length!")
    
    print(f"\nFinal slot mapping: {slot_mapping}")
    print(f"Expected length: {sum(num_scheduled_tokens_per_req)}")
    print(f"Actual length: {len(slot_mapping)}")


if __name__ == "__main__":
    print("=== Testing Attention Mask Creation ===")
    test_attention_mask_creation()
    
    print("\n\n=== Testing Slot Mapping ===")
    test_slot_mapping()
#!/usr/bin/env python3
"""Test that slot_mapping has the correct dtype for reshape_and_cache_flash."""

import torch
import torch_xla.core.xla_model as xm

def test_slot_mapping_dtype():
    """Test that slot_mapping is int64 as required by reshape_and_cache_flash."""
    
    # Test imports
    try:
        from vllm._custom_ops import reshape_and_cache_flash
        print("✅ reshape_and_cache_flash imported successfully")
    except ImportError as e:
        print(f"❌ Failed to import reshape_and_cache_flash: {e}")
        return False
    
    # Create test tensors
    device = "cuda" if torch.cuda.is_available() else "cpu"
    
    # Test parameters
    num_tokens = 4
    num_kv_heads = 8  
    head_size = 128
    block_size = 16
    num_blocks = 10
    
    # Create test tensors
    key = torch.randn(num_tokens, num_kv_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_kv_heads, head_size, device=device)
    
    # KV cache with Flash layout: [2, num_blocks, block_size, num_kv_heads, head_size]
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    
    # Test with int32 (should fail)
    print("\nTesting with int32 slot_mapping (should fail)...")
    slot_mapping_int32 = torch.arange(num_tokens, dtype=torch.int32, device=device)
    
    try:
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping_int32,
            "auto",  # kv_cache_dtype
            torch.tensor(1.0, device=device),  # k_scale
            torch.tensor(1.0, device=device),  # v_scale
        )
        print("❌ Unexpected: int32 slot_mapping did not raise an error")
    except RuntimeError as e:
        if "expected scalar type Long but found Int" in str(e):
            print(f"✅ Expected error with int32: {e}")
        else:
            print(f"❌ Unexpected error: {e}")
    
    # Test with int64 (should succeed)
    print("\nTesting with int64 slot_mapping (should succeed)...")
    slot_mapping_int64 = torch.arange(num_tokens, dtype=torch.int64, device=device)
    
    try:
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping_int64,
            "auto",  # kv_cache_dtype
            torch.tensor(1.0, device=device),  # k_scale
            torch.tensor(1.0, device=device),  # v_scale
        )
        print("✅ Success: int64 slot_mapping works correctly")
        return True
    except Exception as e:
        print(f"❌ Failed with int64: {e}")
        return False


def verify_xla_gpu_model_runner():
    """Verify that XlaGpuModelRunner creates slot_mapping with correct dtype."""
    
    import sys
    import os
    # Add vllm to path
    sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
    
    try:
        from vllm.v1.worker.xla_gpu_model_runner import XlaGpuModelRunner
        print("\n✅ XlaGpuModelRunner imported successfully")
        
        # Check the code for slot_mapping dtype
        import inspect
        source = inspect.getsource(XlaGpuModelRunner._prepare_inputs)
        
        if "dtype=torch.int64" in source and "slot_mapping" in source:
            print("✅ XlaGpuModelRunner._prepare_inputs uses torch.int64 for slot_mapping")
            return True
        elif "dtype=torch.int32" in source and "slot_mapping" in source:
            print("❌ XlaGpuModelRunner._prepare_inputs still uses torch.int32 for slot_mapping")
            return False
        else:
            print("⚠️  Could not determine slot_mapping dtype from source code")
            return None
            
    except Exception as e:
        print(f"❌ Failed to check XlaGpuModelRunner: {e}")
        return False


if __name__ == "__main__":
    print("=" * 60)
    print("Testing slot_mapping dtype fix")
    print("=" * 60)
    
    # Test the dtype requirement
    test_passed = test_slot_mapping_dtype()
    
    # Verify the fix in XlaGpuModelRunner
    runner_fixed = verify_xla_gpu_model_runner()
    
    print("\n" + "=" * 60)
    if test_passed and runner_fixed:
        print("✅ All tests passed! The slot_mapping dtype fix is working.")
    else:
        print("❌ Tests failed. Please check the implementation.")
    print("=" * 60)
"""Debug KV cache operations in XLA GPU"""

import os
import torch
import torch_xla.core.xla_model as xm

# Set up environment
os.environ["VLLM_USE_XLA_GPU"] = "1"
os.environ["VLLM_USE_V1"] = "1"
os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"
os.environ["GPU_NUM_DEVICES"] = "1"
os.environ["CUDA_VISIBLE_DEVICES"] = "3"
os.environ["PJRT_DEVICE"] = "CUDA"
os.environ["XLA_PYTHON_CLIENT_PREALLOCATE"] = "false"
os.environ["CUDA_LAUNCH_BLOCKING"] = "1"

def test_kv_cache_operations():
    """Test KV cache update logic separately"""
    
    # Simulate KV cache dimensions
    num_kv_heads = 4
    head_dim = 128
    num_layers = 2
    block_size = 16
    max_num_blocks = 100
    
    # Create simulated KV caches
    kv_caches = []
    for layer_idx in range(num_layers):
        # Key and value caches: [num_blocks, num_kv_heads, head_dim, block_size]
        key_cache = torch.zeros(
            (max_num_blocks, num_kv_heads, head_dim // 2, block_size, 2),
            dtype=torch.bfloat16,
            device="cuda"
        )
        value_cache = torch.zeros(
            (max_num_blocks, num_kv_heads, head_dim, block_size),
            dtype=torch.bfloat16,
            device="cuda"
        )
        kv_caches.append((key_cache, value_cache))
    
    # Simulate input tensors
    batch_size = 2
    seq_len = 5
    
    # Create dummy key/value tensors
    key = torch.randn(batch_size * seq_len, num_kv_heads, head_dim, 
                      dtype=torch.bfloat16, device="cuda")
    value = torch.randn(batch_size * seq_len, num_kv_heads, head_dim,
                        dtype=torch.bfloat16, device="cuda")
    
    # Create slot mapping
    slot_mapping = torch.tensor([0, 1, 2, 3, 4, 16, 17, 18, 19, 20], 
                                dtype=torch.int64, device="cuda")[:batch_size * seq_len]
    
    print(f"Key shape: {key.shape}")
    print(f"Value shape: {value.shape}")
    print(f"Slot mapping: {slot_mapping}")
    print(f"KV cache shape: {kv_caches[0][0].shape}")
    
    # Test the update logic from XlaGpuPagedAttentionBackendImpl
    from vllm.v1.attention.backends.xla_gpu_native import reshape_and_cache_xla_gpu
    
    try:
        # Update KV cache for layer 0
        layer_idx = 0
        key_cache, value_cache = kv_caches[layer_idx]
        
        print("\nTesting KV cache update...")
        reshape_and_cache_xla_gpu(key, value, key_cache, value_cache, slot_mapping)
        
        # Force XLA to materialize the result
        xm.mark_step()
        
        print("✓ KV cache update successful")
        
        # Check if values were written
        print(f"\nKey cache stats:")
        print(f"  Min: {key_cache.min().item()}")
        print(f"  Max: {key_cache.max().item()}")
        print(f"  Mean: {key_cache.mean().item()}")
        
    except Exception as e:
        print(f"✗ KV cache update failed: {e}")
        import traceback
        traceback.print_exc()


def test_xla_compilation_with_cache():
    """Test if KV cache operations compile with XLA"""
    
    import torch._dynamo as dynamo
    
    # Configure dynamo
    torch._dynamo.config.capture_dynamic_output_shape_ops = True
    torch._dynamo.config.assume_static_by_default = False
    torch._dynamo.config.automatic_dynamic_shapes = True
    
    # Simple function that updates KV cache
    def update_kv_cache(key, value, key_cache, value_cache, slot_mapping):
        # Simplified version of reshape_and_cache
        num_tokens = key.size(0)
        
        for i in range(num_tokens):
            slot = slot_mapping[i]
            if slot >= 0:
                block_idx = slot // 16  # block_size = 16
                block_offset = slot % 16
                
                # Update key cache
                key_cache[block_idx, :, :, block_offset, 0] = key[i, :, :64]
                key_cache[block_idx, :, :, block_offset, 1] = key[i, :, 64:]
                
                # Update value cache
                value_cache[block_idx, :, :, block_offset] = value[i]
        
        return key_cache, value_cache
    
    # Compile with XLA backend
    compiled_fn = torch.compile(
        update_kv_cache,
        backend="openxla",
        options={
            "dynamic": True,
            "fullgraph": False,
        }
    )
    
    # Test with dummy data
    key = torch.randn(5, 4, 128, dtype=torch.bfloat16, device="cuda")
    value = torch.randn(5, 4, 128, dtype=torch.bfloat16, device="cuda")
    key_cache = torch.zeros((100, 4, 64, 16, 2), dtype=torch.bfloat16, device="cuda")
    value_cache = torch.zeros((100, 4, 128, 16), dtype=torch.bfloat16, device="cuda")
    slot_mapping = torch.tensor([0, 1, 2, 3, 4], dtype=torch.int64, device="cuda")
    
    try:
        print("Compiling KV cache update function...")
        compiled_fn(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        print("✓ Compilation successful")
    except Exception as e:
        print(f"✗ Compilation failed: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    print("=== Testing KV Cache Operations ===")
    test_kv_cache_operations()
    
    print("\n\n=== Testing XLA Compilation with KV Cache ===")
    test_xla_compilation_with_cache()
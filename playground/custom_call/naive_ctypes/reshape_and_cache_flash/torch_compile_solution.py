#!/usr/bin/env python3
"""Solution that works with torch.compile by avoiding problematic patterns."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library

# Create library
lib = Library("xla_compile", "FRAGMENT")

def setup_custom_call():
    """Compile and register the custom call."""
    if not os.path.exists("reshape_and_cache_flash_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_reshape_and_cache.sh") != 0:
            raise RuntimeError("Compilation failed")
    
    lib_so = ctypes.CDLL("./reshape_and_cache_flash_xla.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib_so.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_reshape_and_cache_flash",
        capsule,
        "CUDA"
    )
    print("✓ Custom call registered")


# Define the operation
lib.define(
    "cache_update(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping) -> Tensor"
)

# XLA implementation
@torch.library.impl(lib, "cache_update", "XLA")
def cache_update_xla(key, value, key_cache, value_cache, slot_mapping):
    """Implementation that works with torch.compile."""
    # DON'T use dynamo_set_buffer_donor_ here - it causes functionalization errors
    
    # Extract dimensions
    num_tokens = key.shape[0]
    num_kv_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        0,  # kv_cache_dtype = auto
        0,  # has_k_scale
        0   # has_v_scale
    )
    
    # Prepare buffers - inputs and outputs
    buffers = [key, value, key_cache, value_cache, slot_mapping]
    buffers.extend([key_cache, value_cache])  # outputs
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect
        descriptor,
        1,  # api_version
        {}
    )
    
    # Return a scalar to avoid deduper issues
    # The actual modification happens in-place
    return torch.tensor(1.0, device=key.device, dtype=torch.float32)

# Meta/fake implementation
@torch.library.register_fake("xla_compile::cache_update")
def cache_update_fake(key, value, key_cache, value_cache, slot_mapping):
    ctx = torch.library.get_ctx()
    # Mark tensors as mutated
    ctx.mark_dirty(key_cache)
    ctx.mark_dirty(value_cache)
    return torch.tensor(1.0, device=key.device, dtype=torch.float32)

# CPU fallback (for testing)
@torch.library.impl(lib, "cache_update", "CPU")
def cache_update_cpu(key, value, key_cache, value_cache, slot_mapping):
    # Simple CPU implementation for testing
    for i, slot in enumerate(slot_mapping):
        if slot >= 0:
            block_idx = slot // key_cache.shape[1]
            block_offset = slot % key_cache.shape[1]
            if block_idx < key_cache.shape[0]:
                key_cache[block_idx, block_offset] = key[i]
                value_cache[block_idx, block_offset] = value[i]
    return torch.tensor(1.0, dtype=torch.float32)


def test_direct():
    """Test without torch.compile."""
    print("\n" + "="*60)
    print("Testing direct call (sanity check)")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.tensor([[[0.5]]], device=device, dtype=torch.float32).contiguous()
    value = torch.tensor([[[0.7]]], device=device, dtype=torch.float32).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before: key_cache[0,0,0,0]={key_cache[0,0,0,0].item():.4f}")
    
    # Direct call
    _ = torch.ops.xla_compile.cache_update(
        key, value, key_cache, value_cache, slot_mapping
    )
    
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"After: key_cache[0,0,0,0]={key_cache[0,0,0,0].item():.4f}")
    
    if key_cache[0,0,0,0].item() != 0:
        print("✓ Direct call succeeded")
    else:
        print("✗ Direct call failed")


def test_torch_compile():
    """Test with torch.compile."""
    print("\n" + "="*60)
    print("Testing torch.compile")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_fn(key, value, key_cache, value_cache, slot_mapping):
        # DON'T use dynamo_set_buffer_donor_ - it causes errors
        # Just call the op directly
        dummy = torch.ops.xla_compile.cache_update(
            key, value, key_cache, value_cache, slot_mapping
        )
        # Return something based on the caches
        # This forces XLA to keep the tensors alive
        return key_cache.sum() + value_cache.sum() + dummy
    
    key = torch.randn(1, 1, 1, device=device).contiguous()
    value = torch.randn(1, 1, 1, device=device).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before:")
    print(f"  key: {key.item():.4f}")
    print(f"  value: {value.item():.4f}")
    print(f"  key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.4f}")
    
    try:
        result = compiled_fn(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        xm.wait_device_ops()
        
        print(f"\nAfter:")
        print(f"  key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.4f}")
        print(f"  value_cache[0,0,0,0]: {value_cache[0,0,0,0].item():.4f}")
        print(f"  Result: {result.item():.4f}")
        
        if key_cache[0,0,0,0].item() != 0:
            print("\n✓ torch.compile succeeded!")
        else:
            print("\n✗ Caches were not modified")
            
    except Exception as e:
        print(f"\n✗ torch.compile failed: {e}")
        import traceback
        traceback.print_exc()


def test_torch_compile_with_loop():
    """Test torch.compile with a loop (more realistic)."""
    print("\n" + "="*60)
    print("Testing torch.compile with loop")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def process_batch(keys, values, key_cache, value_cache, slot_mappings):
        total = torch.tensor(0.0, device=keys[0].device)
        for key, value, slot_mapping in zip(keys, values, slot_mappings):
            dummy = torch.ops.xla_compile.cache_update(
                key, value, key_cache, value_cache, slot_mapping
            )
            total = total + dummy
        return key_cache.mean() + value_cache.mean() + total
    
    # Create batch
    batch_size = 4
    keys = [torch.randn(1, 1, 1, device=device).contiguous() for _ in range(batch_size)]
    values = [torch.randn(1, 1, 1, device=device).contiguous() for _ in range(batch_size)]
    key_cache = torch.zeros(2, 4, 1, 1, device=device).contiguous()
    value_cache = torch.zeros(2, 4, 1, 1, device=device).contiguous()
    slot_mappings = [torch.tensor([i], dtype=torch.int64, device=device) for i in range(batch_size)]
    
    print(f"Processing {batch_size} updates...")
    
    try:
        result = process_batch(keys, values, key_cache, value_cache, slot_mappings)
        xm.mark_step()
        xm.wait_device_ops()
        
        print(f"Result: {result.item():.4f}")
        
        non_zero = (key_cache != 0).sum().item()
        print(f"Non-zero elements in key_cache: {non_zero}/{key_cache.numel()}")
        
        if non_zero > 0:
            print("✓ Batch processing succeeded!")
        else:
            print("✗ No updates were made")
            
    except Exception as e:
        print(f"✗ Batch processing failed: {e}")


if __name__ == "__main__":
    print("="*60)
    print("Torch.compile Compatible Solution")
    print("="*60)
    print("\nKey insights:")
    print("1. Don't use dynamo_set_buffer_donor_ with custom ops")
    print("2. Return a simple scalar to avoid deduper issues")
    print("3. Use torch.library for proper registration")
    print("4. Mark tensors as dirty in fake implementation")
    
    setup_custom_call()
    test_direct()
    test_torch_compile()
    test_torch_compile_with_loop()
    
    print("\n" + "="*60)
    print("Summary: This approach should work with torch.compile")
    print("="*60)
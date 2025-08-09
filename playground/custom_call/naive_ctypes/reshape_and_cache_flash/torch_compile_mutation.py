#!/usr/bin/env python3
"""Solution using mutation annotations for torch.compile."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library

# Create library with explicit namespace
lib = Library("vllm_xla", "DEF")

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


# Define with mutation annotations - key_cache and value_cache are mutated
lib.define(
    "reshape_and_cache_flash("
    "Tensor key, Tensor value, "
    "Tensor(a!) key_cache, Tensor(b!) value_cache, "  # (a!) and (b!) mean mutated
    "Tensor slot_mapping"
    ") -> ()"  # Returns nothing
)

# XLA implementation
@lib.impl("reshape_and_cache_flash", "XLA")
def reshape_and_cache_flash_xla(key, value, key_cache, value_cache, slot_mapping):
    """XLA implementation with in-place mutation."""
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
    
    # Prepare buffers
    buffers = [key, value, key_cache, value_cache, slot_mapping]
    buffers.extend([key_cache, value_cache])  # outputs (same tensors for in-place)
    
    # Call XLA custom op
    _ = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect
        descriptor,
        1,  # api_version
        {}
    )
    # No return - mutation happens in-place


# Abstract implementation for torch.compile
@lib.impl_abstract("reshape_and_cache_flash")
def reshape_and_cache_flash_abstract(key, value, key_cache, value_cache, slot_mapping):
    # Just return None - the mutation is handled by annotations
    return None


# CompositeExplicitAutograd implementation (for non-XLA devices)
@lib.impl("reshape_and_cache_flash", "CompositeExplicitAutograd")
def reshape_and_cache_flash_composite(key, value, key_cache, value_cache, slot_mapping):
    # Simple Python implementation for CPU fallback
    for i, slot in enumerate(slot_mapping):
        if slot >= 0 and slot < key_cache.shape[0] * key_cache.shape[1]:
            block_idx = slot // key_cache.shape[1]
            block_offset = slot % key_cache.shape[1]
            key_cache[block_idx, block_offset] = key[i]
            value_cache[block_idx, block_offset] = value[i]
    return None


def test_torch_compile():
    """Test with torch.compile using mutation annotations."""
    print("\n" + "="*60)
    print("Testing torch.compile with mutation annotations")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        # Call the mutating op
        torch.ops.vllm_xla.reshape_and_cache_flash(
            key, value, key_cache, value_cache, slot_mapping
        )
        # Return something to make the graph non-empty
        return key_cache.abs().mean() + value_cache.abs().mean()
    
    # Test
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
        result = compiled_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        xm.wait_device_ops()
        
        print(f"\nAfter:")
        print(f"  key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.4f}")
        print(f"  value_cache[0,0,0,0]: {value_cache[0,0,0,0].item():.4f}")
        print(f"  Result: {result.item():.4f}")
        
        if result.item() > 0:
            print("\n✓ torch.compile with mutations succeeded!")
        else:
            print("\n✗ Caches were not modified")
            
    except Exception as e:
        print(f"\n✗ torch.compile failed: {e}")
        import traceback
        traceback.print_exc()


def test_tpu_style():
    """Test TPU-style pattern with torch.compile."""
    print("\n" + "="*60)
    print("Testing TPU-style pattern")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def tpu_style_update(key, value, key_cache, value_cache, slot_mapping):
        # TPU-style: mark as buffer donors (if available)
        # Note: This might not work with our custom op
        # if hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
        #     torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
        #     torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
        
        # Call mutating op
        torch.ops.vllm_xla.reshape_and_cache_flash(
            key, value, key_cache, value_cache, slot_mapping
        )
        
        # Return scalar
        return torch.tensor(1.0, device=key.device)
    
    key = torch.randn(2, 2, 4, device=device).contiguous()
    value = torch.randn(2, 2, 4, device=device).contiguous()
    key_cache = torch.zeros(2, 8, 2, 4, device=device).contiguous()
    value_cache = torch.zeros(2, 8, 2, 4, device=device).contiguous()
    slot_mapping = torch.tensor([0, 1], dtype=torch.int64, device=device)
    
    print(f"Before: key_cache sum = {key_cache.sum().item():.4f}")
    
    try:
        _ = tpu_style_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        xm.wait_device_ops()
        
        print(f"After: key_cache sum = {key_cache.sum().item():.4f}")
        
        if key_cache.sum().item() != 0:
            print("✓ TPU-style pattern succeeded!")
        else:
            print("✗ No updates were made")
            
    except Exception as e:
        print(f"✗ TPU-style pattern failed: {e}")


if __name__ == "__main__":
    print("="*60)
    print("Mutation-based Solution for torch.compile")
    print("="*60)
    print("\nUsing mutation annotations (a!) and (b!) to mark")
    print("tensors that will be modified in-place.")
    
    setup_custom_call()
    test_torch_compile()
    test_tpu_style()
    
    print("\n" + "="*60)
    print("This should be the most compatible approach")
    print("="*60)
#!/usr/bin/env python3
"""Final working solution without torch.compile."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library

# Create library for our custom ops
xla_cache_lib = Library("xla_final", "FRAGMENT")

def setup_custom_call():
    """Compile and register the custom call."""
    if not os.path.exists("reshape_and_cache_flash_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_reshape_and_cache.sh") != 0:
            raise RuntimeError("Compilation failed")
    
    lib = ctypes.CDLL("./reshape_and_cache_flash_xla.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    
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


def reshape_and_cache_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: torch.Tensor = None,
    v_scale: torch.Tensor = None,
) -> None:
    """Direct implementation without return values."""
    # Extract dimensions
    num_tokens = key.shape[0]
    num_kv_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]
    
    # Map dtype
    dtype_map = {"auto": 0, "float32": 0, "float16": 1, "bfloat16": 2}
    kv_cache_dtype_int = dtype_map.get(kv_cache_dtype, 0)
    
    # Check scales
    has_k_scale = k_scale is not None
    has_v_scale = v_scale is not None
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        kv_cache_dtype_int,
        1 if has_k_scale else 0,
        1 if has_v_scale else 0
    )
    
    # Prepare buffers
    buffers = [key, value, key_cache, value_cache, slot_mapping]
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    buffers.extend([key_cache, value_cache])  # outputs (same for in-place)
    
    # Call XLA custom op directly
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
    # Caches are modified in-place


# Define operation with no return
xla_cache_lib.define(
    "reshape_cache_op(Tensor key, Tensor value, Tensor(a!) key_cache, "
    "Tensor(b!) value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> ()"
)

# Implementation for XLA
xla_cache_lib.impl("reshape_cache_op", reshape_and_cache_impl, "XLA")

# Fake implementation for meta tensors
def reshape_cache_fake(key, value, key_cache, value_cache, slot_mapping,
                       kv_cache_dtype, k_scale, v_scale):
    return None

xla_cache_lib._register_fake("reshape_cache_op", reshape_cache_fake)


def reshape_and_cache_flash(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: torch.Tensor = None,
    v_scale: torch.Tensor = None,
) -> None:
    """Public API that works without torch.compile."""
    # Call custom op directly
    torch.ops.xla_final.reshape_cache_op(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )
    # Ensure completion
    if key.device.type == 'xla':
        xm.mark_step()


def test_basic():
    """Test basic functionality."""
    print("\n" + "="*60)
    print("Testing final solution (no torch.compile)")
    print("="*60)
    
    device = xm.xla_device()
    
    # Test data
    key = torch.randn(4, 2, 8, device=device).contiguous()
    value = torch.randn(4, 2, 8, device=device).contiguous()
    key_cache = torch.zeros(2, 16, 2, 8, device=device).contiguous()
    value_cache = torch.zeros(2, 16, 2, 8, device=device).contiguous()
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    print(f"Before: key_cache sum = {key_cache.sum().item():.4f}")
    
    # Call our function
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    print(f"After: key_cache sum = {key_cache.sum().item():.4f}")
    
    if (key_cache != 0).any():
        print("✓ Caches were updated successfully")
    else:
        print("✗ Caches were not updated")


def test_performance():
    """Test performance without torch.compile."""
    print("\n" + "="*60)
    print("Testing performance")
    print("="*60)
    
    device = xm.xla_device()
    
    # Larger test
    num_tokens = 128
    num_kv_heads = 8
    head_size = 64
    num_blocks = 32
    block_size = 16
    
    key = torch.randn(num_tokens, num_kv_heads, head_size, device=device).contiguous()
    value = torch.randn(num_tokens, num_kv_heads, head_size, device=device).contiguous()
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device).contiguous()
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device).contiguous()
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64, device=device)
    
    # Warmup
    for _ in range(3):
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
    
    # Time it
    import time
    start = time.time()
    num_iters = 100
    
    for _ in range(num_iters):
        reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
    
    elapsed = time.time() - start
    print(f"Average time per call: {elapsed/num_iters*1000:.3f} ms")
    print("✓ Performance test completed")


def main():
    print("="*60)
    print("Final Solution for reshape_and_cache_flash")
    print("="*60)
    print("\nApproach:")
    print("1. Direct XLA custom call without torch.compile")
    print("2. In-place modification of caches")
    print("3. No return values to avoid XLA Dynamo issues")
    
    setup_custom_call()
    test_basic()
    test_performance()
    
    print("\n" + "="*60)
    print("Conclusion:")
    print("- XLA custom calls work well without torch.compile")
    print("- For production use, avoid torch.compile with custom ops")
    print("- Use XLA's native optimization instead")
    print("="*60)


if __name__ == "__main__":
    main()
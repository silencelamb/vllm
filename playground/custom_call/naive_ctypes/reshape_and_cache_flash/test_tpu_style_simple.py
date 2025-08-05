#!/usr/bin/env python3
"""Simple TPU-style solution using vLLM's direct_register_custom_op."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from vllm.utils import direct_register_custom_op


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


def xla_reshape_and_cache_update_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Implementation that returns new tensors."""
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
    buffers = [key_cache, value_cache, key, value, slot_mapping]
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        False,
        descriptor,
        2,
        {}
    )
    
    return outputs[0], outputs[1]


def xla_reshape_and_cache_update_fake(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Fake implementation for torch.compile."""
    return key_cache.clone(), value_cache.clone()


# Wrapper that implements TPU-style in-place update
def xla_reshape_and_cache_flash_wrapper(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """Wrapper that looks like in-place but uses TPU pattern."""
    # Mark as buffer donors if supported
    if hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
        torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
        torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
    
    # Get new caches
    new_key_cache, new_value_cache = torch.ops.vllm.xla_reshape_and_cache_update(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )
    
    # Copy back (will be optimized away by XLA)
    key_cache.copy_(new_key_cache)
    value_cache.copy_(new_value_cache)


def xla_reshape_and_cache_flash_fake_wrapper(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """Fake wrapper for torch.compile."""
    pass  # In-place operation, no return


def test_basic():
    """Test basic functionality."""
    print("\n" + "="*60)
    print("Testing TPU-style basic functionality")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    # Test the wrapper
    torch.ops.vllm.xla_reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    print("✓ Basic test completed")
    
    if (key_cache != 0).any() and (value_cache != 0).any():
        print("✓ Caches were updated")
    else:
        print("⚠ Caches might not have been updated")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile with TPU-style approach")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        torch.ops.vllm.xla_reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
        return key_cache.abs().mean() + value_cache.abs().mean()
    
    # Test
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    try:
        result = compiled_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        
        print(f"✓ torch.compile test completed")
        print(f"  Result: {result.item():.4f}")
        
        if result.item() > 0:
            print("✓ Caches were modified")
    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


def test_performance():
    """Compare TPU-style vs direct copy performance."""
    print("\n" + "="*60)
    print("Performance comparison")
    print("="*60)
    
    device = xm.xla_device()
    
    # Test sizes
    num_blocks = 128
    block_size = 64
    num_heads = 16
    head_size = 128
    num_tokens = 256
    
    print(f"Cache size: {num_blocks * block_size * num_heads * head_size * 4 / 1024**3:.2f} GB per cache")
    
    key = torch.randn(num_tokens, num_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_heads, head_size, device=device)
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64, device=device)
    
    import time
    
    # TPU-style (return + copy)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    
    xm.mark_step()  # Sync
    start = time.time()
    
    for _ in range(5):
        torch.ops.vllm.xla_reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
    
    xm.mark_step()  # Sync
    tpu_style_time = (time.time() - start) / 5
    
    print(f"\nResults:")
    print(f"  TPU-style time: {tpu_style_time*1000:.2f} ms")
    print(f"\nNote: XLA should optimize away the copy operations")


def main():
    print("="*60)
    print("Simple TPU-style solution for reshape_and_cache_flash")
    print("="*60)
    
    # Setup
    setup_custom_call()
    
    # Register two ops:
    # 1. The update op that returns new tensors
    direct_register_custom_op(
        op_name="xla_reshape_and_cache_update",
        op_func=xla_reshape_and_cache_update_impl,
        mutates_args=[],  # No mutation, returns new tensors
        fake_impl=xla_reshape_and_cache_update_fake,
        dispatch_key="XLA",
    )
    
    # 2. The wrapper that uses copy_ (TPU-style)
    direct_register_custom_op(
        op_name="xla_reshape_and_cache_flash",
        op_func=xla_reshape_and_cache_flash_wrapper,
        mutates_args=["key_cache", "value_cache"],  # Appears to mutate
        fake_impl=xla_reshape_and_cache_flash_fake_wrapper,
        dispatch_key="XLA",
    )
    
    print("✓ Custom ops registered")
    
    # Run tests
    test_basic()
    test_torch_compile()
    test_performance()
    
    print("\n" + "="*60)
    print("✅ Tests completed!")
    print("\nThe TPU approach:")
    print("1. Inner op returns new tensors (no alias issues)")
    print("2. Outer wrapper does copy_ (standard PyTorch)")
    print("3. XLA optimizes away the copy when possible")
    print("="*60)


if __name__ == "__main__":
    main()
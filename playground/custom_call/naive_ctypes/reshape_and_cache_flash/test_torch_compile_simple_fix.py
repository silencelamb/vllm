#!/usr/bin/env python3
"""Simple fix for torch.compile with in-place operations."""

import os
# Set environment variable before importing torch
os.environ["TORCH_COMPILE_DISABLE_FUNCTIONALIZATION"] = "1"

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


def xla_reshape_and_cache_flash_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """Implementation that calls XLA custom call."""
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
    
    # In-place update using data pointer
    key_cache.data = outputs[0]
    value_cache.data = outputs[1]


def xla_reshape_and_cache_flash_fake(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """Fake implementation for torch.compile."""
    # Mark tensors as modified
    torch._dynamo.mark_dynamic(key_cache)
    torch._dynamo.mark_dynamic(value_cache)


def test_basic():
    """Test basic functionality."""
    print("\n" + "="*60)
    print("Testing basic functionality")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    # Store original cache pointers
    key_cache_ptr = key_cache.data_ptr()
    value_cache_ptr = value_cache.data_ptr()
    
    # Call op
    torch.ops.vllm.xla_reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    # Verify in-place update
    print(f"✓ Basic test completed")
    print(f"  key_cache pointer unchanged: {key_cache.data_ptr() == key_cache_ptr}")
    print(f"  value_cache pointer unchanged: {value_cache.data_ptr() == value_cache_ptr}")
    
    if (key_cache != 0).any() and (value_cache != 0).any():
        print("✓ Caches were updated")


def test_torch_compile_modes():
    """Test different torch.compile modes."""
    print("\n" + "="*60)
    print("Testing torch.compile with different modes")
    print("="*60)
    
    device = xm.xla_device()
    
    def cache_fn(key, value, key_cache, value_cache, slot_mapping):
        torch.ops.vllm.xla_reshape_and_cache_flash(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
        return key_cache.abs().mean() + value_cache.abs().mean()
    
    # Test inputs
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    
    # Try different modes
    modes = [
        ("default", {}),
        ("reduce-overhead", {"mode": "reduce-overhead"}),
        ("max-autotune", {"mode": "max-autotune"}),
        ("no-python", {"fullgraph": True, "dynamic": False}),
    ]
    
    for mode_name, kwargs in modes:
        print(f"\nTesting mode: {mode_name}")
        try:
            # Fresh caches for each test
            key_cache = torch.zeros(2, 16, 2, 8, device=device)
            value_cache = torch.zeros(2, 16, 2, 8, device=device)
            slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
            
            # Compile
            compiled_fn = torch.compile(cache_fn, backend="openxla", **kwargs)
            
            # Run
            result = compiled_fn(key, value, key_cache, value_cache, slot_mapping)
            xm.mark_step()
            
            print(f"  ✓ Success: result = {result.item():.4f}")
            
        except Exception as e:
            print(f"  ✗ Failed: {e}")


def test_with_context_manager():
    """Test using torch._dynamo.config context manager."""
    print("\n" + "="*60)
    print("Testing with dynamo config context")
    print("="*60)
    
    device = xm.xla_device()
    
    # Use context manager to allow in-place ops
    with torch._dynamo.config.patch(
        capture_scalar_outputs=True,
        guard_nn_modules=False,
        allow_rnn=True,
        # These might help with in-place operations
        suppress_errors=False,
        verbose=False,
    ):
        @torch.compile(backend="openxla")
        def cache_update(key, value, key_cache, value_cache, slot_mapping):
            torch.ops.vllm.xla_reshape_and_cache_flash(
                key, value, key_cache, value_cache,
                slot_mapping, "auto", None, None
            )
            return (key_cache != 0).any()
        
        # Test
        key = torch.randn(2, 2, 8, device=device)
        value = torch.randn(2, 2, 8, device=device)
        key_cache = torch.zeros(1, 16, 2, 8, device=device)
        value_cache = torch.zeros(1, 16, 2, 8, device=device)
        slot_mapping = torch.tensor([0, 1], dtype=torch.int64, device=device)
        
        result = cache_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        
        print(f"✓ Context manager test completed")
        print(f"  Cache updated: {result.item()}")


def main():
    print("="*60)
    print("Simple fix for torch.compile with in-place operations")
    print(f"TORCH_COMPILE_DISABLE_FUNCTIONALIZATION = {os.environ.get('TORCH_COMPILE_DISABLE_FUNCTIONALIZATION', 'not set')}")
    print("="*60)
    
    # Setup
    setup_custom_call()
    
    # Register custom op with vLLM
    direct_register_custom_op(
        op_name="xla_reshape_and_cache_flash",
        op_func=xla_reshape_and_cache_flash_impl,
        mutates_args=["key_cache", "value_cache"],
        fake_impl=xla_reshape_and_cache_flash_fake,
        dispatch_key="XLA",
    )
    print("✓ Custom op registered")
    
    # Run tests
    test_basic()
    test_torch_compile_modes()
    test_with_context_manager()
    
    print("\n" + "="*60)
    print("✅ Tests completed!")
    print("="*60)


if __name__ == "__main__":
    main()
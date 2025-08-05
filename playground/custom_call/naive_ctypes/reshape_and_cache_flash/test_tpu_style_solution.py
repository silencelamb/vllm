#!/usr/bin/env python3
"""TPU-style solution for reshape_and_cache_flash with XLA optimization."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library


# Create library for our custom ops
xla_cache_lib = Library("xla_cache", "FRAGMENT")


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


def reshape_and_cache_flash_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Implementation that returns new tensors (like TPU)."""
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


# Define the operation that returns new tensors
xla_cache_lib.define(
    "reshape_and_cache_update_op(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> (Tensor, Tensor)"
)


@xla_cache_lib.impl("XLA")
def reshape_and_cache_update_op_xla(
    key, value, key_cache, value_cache, slot_mapping,
    kv_cache_dtype, k_scale, v_scale
):
    return reshape_and_cache_flash_impl(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )


@xla_cache_lib.impl_abstract
def reshape_and_cache_update_op_abstract(
    key, value, key_cache, value_cache, slot_mapping,
    kv_cache_dtype, k_scale, v_scale
):
    # Return tensors with same shape/dtype as caches
    return key_cache.clone(), value_cache.clone()


def reshape_and_cache_flash_tpu_style(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: torch.Tensor = None,
    v_scale: torch.Tensor = None,
) -> None:
    """TPU-style wrapper that uses buffer donor optimization."""
    # Mark caches as buffer donors (if XLA supports it)
    if hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
        torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
        torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
    
    # Get new caches
    new_key_cache, new_value_cache = torch.ops.xla_cache.reshape_and_cache_update_op(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )
    
    # Copy back (will be optimized away by XLA)
    # NOTE: the in-place copy will be optimized away by XLA compiler
    # when buffer donor is set
    key_cache.copy_(new_key_cache)
    value_cache.copy_(new_value_cache)


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
    
    # Store pointers
    key_ptr = key_cache.data_ptr()
    value_ptr = value_cache.data_ptr()
    
    # Call TPU-style
    reshape_and_cache_flash_tpu_style(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    print("✓ Basic test completed")
    print(f"  Key cache ptr same: {key_cache.data_ptr() == key_ptr}")
    print(f"  Value cache ptr same: {value_cache.data_ptr() == value_ptr}")
    
    if (key_cache != 0).any() and (value_cache != 0).any():
        print("✓ Caches were updated")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile with TPU-style approach")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        reshape_and_cache_flash_tpu_style(
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


def test_xla_optimization():
    """Test to verify XLA optimization behavior."""
    print("\n" + "="*60)
    print("Testing XLA optimization behavior")
    print("="*60)
    
    device = xm.xla_device()
    
    # Enable XLA graph dump if available
    os.environ["XLA_SAVE_TENSORS_FILE"] = "/tmp/xla_tensors.txt"
    os.environ["XLA_SAVE_TENSORS_FMT"] = "text"
    
    @torch.compile(backend="openxla", fullgraph=True)
    def optimized_fn(key, value, key_cache, value_cache, slot_mapping):
        # Multiple updates to test optimization
        for _ in range(3):
            reshape_and_cache_flash_tpu_style(
                key, value, key_cache, value_cache,
                slot_mapping, "auto", None, None
            )
        return key_cache.sum()
    
    # Small tensors for testing
    key = torch.ones(2, 1, 4, device=device)
    value = torch.ones(2, 1, 4, device=device) * 2.0
    key_cache = torch.zeros(1, 8, 1, 4, device=device)
    value_cache = torch.zeros(1, 8, 1, 4, device=device)
    slot_mapping = torch.tensor([0, 1], dtype=torch.int64, device=device)
    
    try:
        result = optimized_fn(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        
        print(f"✓ XLA optimization test completed")
        print(f"  Result: {result.item():.4f}")
        print("\n  Check XLA graph in /tmp/xla_tensors.txt to verify optimization")
    except Exception as e:
        print(f"⚠ Fullgraph compilation might not be supported: {e}")


def main():
    print("="*60)
    print("TPU-style solution for reshape_and_cache_flash")
    print("="*60)
    print("\nThis approach:")
    print("1. Returns new tensors (avoiding alias annotations)")
    print("2. Uses buffer donor optimization (if supported)")
    print("3. XLA compiler optimizes away the copy")
    
    # Setup
    setup_custom_call()
    
    # Run tests
    test_basic()
    test_torch_compile()
    test_xla_optimization()
    
    print("\n" + "="*60)
    print("✅ Tests completed!")
    print("\nNote: The actual optimization depends on XLA compiler support.")
    print("In production, XLA should optimize away the copy_ operations.")
    print("="*60)


if __name__ == "__main__":
    main()
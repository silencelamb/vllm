#!/usr/bin/env python3
"""TPU-style solution for reshape_and_cache_flash with XLA optimization."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library
import numpy as np
from torch_xla.experimental.custom_kernel import XLA_LIB
from torch.library import register_fake

# Try to import vLLM's reshape_and_cache_flash for comparison
try:
    from vllm.attention.utils.fa_utils import reshape_and_cache_flash
    HAS_VLLM = True
except ImportError:
    print("⚠ vLLM reshape_and_cache_flash not available for comparison")
    HAS_VLLM = False


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
    
    # XLA custom call buffer ordering for GPU:
    # IMPORTANT: On GPU, the LAST num_outputs buffers are outputs!
    # For in-place operations, we pass the cache buffers as both input and output
    
    # Order: inputs first, then outputs at the end
    buffers = [key, value, key_cache, value_cache, slot_mapping]  # inputs
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    # Add outputs at the end (same tensors as input caches for in-place)
    buffers.extend([key_cache, value_cache])  # outputs (last 2)
    
    # Call XLA custom op
    # Note: The LAST 2 buffers in the list are outputs
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect - this operation modifies the cache buffers
        descriptor,
        1,  # api_version
        {}
    )
    
    # This is important: XLA custom call returns the outputs in the same order as inputs
    # So we need to extract the last 2 tensors as outputs
    # return key_cache, value_cache
    return outputs


# Define the operation that returns new tensors
# XLA_LIB.define(
#     "reshape_and_cache_update_op(Tensor key, Tensor value, Tensor(a!) key_cache, "
#     "Tensor(b!) value_cache, Tensor slot_mapping, str kv_cache_dtype, "
#     "Tensor? k_scale, Tensor? v_scale) -> (Tensor(a!), Tensor(b!))"
# )

XLA_LIB.define(
    "reshape_and_cache_update_op(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> (Tensor, Tensor)"
)


# Implementation for XLA
XLA_LIB.impl("reshape_and_cache_update_op", reshape_and_cache_flash_impl, "XLA")


# Fake implementation for meta tensors
@register_fake("xla::reshape_and_cache_update_op")
def reshape_and_cache_update_op_fake(
    key, value, key_cache, value_cache, slot_mapping,
    kv_cache_dtype, k_scale, v_scale
):
    out_k = torch.empty_strided(
        key_cache.shape, key_cache.stride(), dtype=key_cache.dtype, device="meta"
    )
    out_v = torch.empty_strided(
        value_cache.shape, value_cache.stride(), dtype=value_cache.dtype, device="meta"
    )
    return out_k, out_v


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
    torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
    torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
    
    # Get new caches
    new_key_cache, new_value_cache = torch.ops.xla.reshape_and_cache_update_op(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )
    # print(key_cache, value_cache)
    # NOTE: Following TPU pattern - the in-place copy will be optimized away by XLA compiler
    # Since our custom op returns the modified caches (workaround for XLA GPU issue),
    # this copy is essentially a no-op but maintains compatibility with TPU pattern
    key_cache.copy_(new_key_cache)
    value_cache.copy_(new_value_cache)
    return key_cache, value_cache


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile with TPU-style approach")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        # Create scale tensors (1.0 means no scaling)
        # k_scale = torch.ones(1, dtype=torch.float32, device=device)
        # v_scale = torch.ones(1, dtype=torch.float32, device=device)
        k_scale = None
        v_scale = None
        
        # Get new caches
        new_key_cache, new_value_cache = torch.ops.xla.reshape_and_cache_update_op(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", k_scale, v_scale
        )
        # print(key_cache, value_cache)
        # NOTE: Following TPU pattern - the in-place copy will be optimized away by XLA compiler
        # Since our custom op returns the modified caches (workaround for XLA GPU issue),
        # this copy is essentially a no-op but maintains compatibility with TPU pattern
        # return new_key_cache, new_value_cache
        # return key_cache, new_value_cache
        return new_key_cache, new_value_cache
    
    # Test
    key = torch.randn(1, 1, 1, device=device).contiguous()
    value = torch.randn(1, 1, 1, device=device).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    try:
        # 关键点： donate和copy_ 都在compile之外
        torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
        torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
        new_key_cache, new_value_cache = compiled_update(key, value, key_cache, value_cache, slot_mapping)
        new_value_cache.copy_(value_cache)
        new_key_cache.copy_(key_cache)
        xm.mark_step()
        xm.wait_device_ops()
        
        import pdb; pdb.set_trace()
        print(f"new_key_cache: {new_key_cache}, new_value_cache: {new_value_cache}")
        print(f"key_cache: {key_cache}, value_cache: {value_cache}")
        print(f"✓ torch.compile test completed")
        
    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


def test_comparison_with_vllm():
    """Compare XLA custom call results with vLLM's native implementation."""
    print("\n" + "="*60)
    print("Comparing XLA custom call with vLLM native implementation")
    print("="*60)
    
    if not HAS_VLLM:
        print("⚠ Skipping comparison test - vLLM not available")
        return
    
    # Use CUDA device for vLLM comparison
    cuda_device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    xla_device = xm.xla_device()
    
    # Create test data
    num_tokens = 4
    num_kv_heads = 2
    head_size = 8
    num_blocks = 2
    block_size = 16
    
    # Initialize tensors on CUDA for vLLM
    key_cuda = torch.randn(num_tokens, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    value_cuda = torch.randn(num_tokens, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    key_cache_cuda = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    value_cache_cuda = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    slot_mapping_cuda = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=cuda_device)
    
    # Clone for XLA (convert to XLA device)
    key_xla = key_cuda.detach().clone().to(xla_device).contiguous()
    value_xla = value_cuda.detach().clone().to(xla_device).contiguous()
    key_cache_xla = key_cache_cuda.detach().clone().to(xla_device).contiguous()
    value_cache_xla = value_cache_cuda.detach().clone().to(xla_device).contiguous()
    slot_mapping_xla = slot_mapping_cuda.detach().clone().to(xla_device)
    
    # Create scale tensors (1.0 means no scaling)
    # k_scale_cuda = torch.ones(1, dtype=torch.float32, device=cuda_device)
    # v_scale_cuda = torch.ones(1, dtype=torch.float32, device=cuda_device)
    k_scale_cuda = None
    v_scale_cuda = None
    
    # Call vLLM's native implementation
    print("\n1. Calling vLLM native implementation...")
    reshape_and_cache_flash(
        key_cuda,
        value_cuda,
        key_cache_cuda,
        value_cache_cuda,
        slot_mapping_cuda,
        "auto",  # kv_cache_dtype
        k_scale_cuda,    # k_scale
        v_scale_cuda,    # v_scale
    )
    
    # Create scale tensors for XLA (1.0 means no scaling)
    # k_scale_xla = torch.ones(1, dtype=torch.float32, device=xla_device)
    # v_scale_xla = torch.ones(1, dtype=torch.float32, device=xla_device)
    k_scale_xla = None
    v_scale_xla = None
    
    # Call XLA custom call
    print("2. Calling XLA custom call implementation...")
    
    # Debug: Check cache before operation
    print(f"   Before XLA call - key_cache_xla sum: {key_cache_xla.sum().item()}")
    
    reshape_and_cache_flash_tpu_style(
        key_xla,
        value_xla,
        key_cache_xla,
        value_cache_xla,
        slot_mapping_xla,
        "auto",
        k_scale_xla,
        v_scale_xla
    )
    xm.mark_step()
    
    # Debug: Check cache after operation
    print(f"   After XLA call - key_cache_xla sum: {key_cache_xla.sum().item()}")
    
    # Compare results
    print("\n3. Comparing results...")
    
    # Move XLA results back to CPU for comparison
    key_cache_xla_cpu = key_cache_xla.cpu()
    value_cache_xla_cpu = value_cache_xla.cpu()
    key_cache_cuda_cpu = key_cache_cuda.cpu()
    value_cache_cuda_cpu = value_cache_cuda.cpu()
    
    # Calculate differences
    key_diff = torch.abs(key_cache_xla_cpu - key_cache_cuda_cpu)
    value_diff = torch.abs(value_cache_xla_cpu - value_cache_cuda_cpu)
    
    key_max_diff = key_diff.max().item()
    value_max_diff = value_diff.max().item()
    key_mean_diff = key_diff.mean().item()
    value_mean_diff = value_diff.mean().item()
    
    print(f"\nResults:")
    print(f"  Key cache:")
    print(f"    Max difference: {key_max_diff:.6e}")
    print(f"    Mean difference: {key_mean_diff:.6e}")
    print(f"  Value cache:")
    print(f"    Max difference: {value_max_diff:.6e}")
    print(f"    Mean difference: {value_mean_diff:.6e}")
    
    # Check if results are close enough (accounting for floating point errors)
    tolerance = 1e-5
    if key_max_diff < tolerance and value_max_diff < tolerance:
        print("\n✅ Results match! XLA custom call produces same output as vLLM")
    else:
        print(f"\n⚠ Results differ beyond tolerance ({tolerance})")
        
        # Show some actual values for debugging
        print("\nSample values at slot 0:")
        print(f"  vLLM key_cache[0,0,0,:4]: {key_cache_cuda_cpu[0,0,0,:4]}")
        print(f"  XLA key_cache[0,0,0,:4]:  {key_cache_xla_cpu[0,0,0,:4]}")
        
    # Additional verification: check that non-zero values were written
    key_nonzero = (key_cache_xla_cpu != 0).sum().item()
    value_nonzero = (value_cache_xla_cpu != 0).sum().item()
    print(f"\nNon-zero elements:")
    print(f"  Key cache: {key_nonzero}/{key_cache_xla_cpu.numel()}")
    print(f"  Value cache: {value_nonzero}/{value_cache_xla_cpu.numel()}")


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
    test_torch_compile()
    test_comparison_with_vllm()  # New comparison test
    
    print("\n" + "="*60)
    print("✅ Tests completed!")
    print("\nNote: The actual optimization depends on XLA compiler support.")
    print("In production, XLA should optimize away the copy_ operations.")
    print("="*60)


if __name__ == "__main__":
    main()
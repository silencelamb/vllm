#!/usr/bin/env python3
"""XLA reshape_and_cache using vLLM's registered ops."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library
from typing import Optional, Tuple

# Create library for our custom ops
xla_cache_lib = Library("xla_cache_vllm", "FRAGMENT")


def reshape_and_cache_flash_xla_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: Optional[torch.Tensor],
    v_scale: Optional[torch.Tensor],
) -> Tuple[torch.Tensor, torch.Tensor]:
    """Implementation that calls vLLM's ops and returns new tensors."""
    
    # Clone caches for output
    key_cache_out = key_cache.clone()
    value_cache_out = value_cache.clone()
    
    # Ensure scales are provided
    if k_scale is None:
        k_scale = torch.ones(1, dtype=torch.float32, device=key.device())
    if v_scale is None:
        v_scale = torch.ones(1, dtype=torch.float32, device=key.device())
    
    # Call vLLM's registered operation
    if hasattr(torch.ops, 'vllm') and hasattr(torch.ops.vllm, 'reshape_and_cache_flash'):
        torch.ops.vllm.reshape_and_cache_flash(
            key, value, key_cache_out, value_cache_out,
            slot_mapping, kv_cache_dtype, k_scale, v_scale
        )
    else:
        # Fallback to _cache_ops if available
        try:
            import vllm._cache_ops as cache_ops
            cache_ops.reshape_and_cache_flash(
                key, value, key_cache_out, value_cache_out,
                slot_mapping, kv_cache_dtype, k_scale, v_scale
            )
        except ImportError:
            raise RuntimeError("vLLM cache ops not available. Please ensure vLLM is properly installed.")
    
    return key_cache_out, value_cache_out


# Define the operation
xla_cache_lib.define(
    "reshape_and_cache_vllm_op(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> (Tensor, Tensor)"
)


# Implementation for CUDA/CPU
@xla_cache_lib.impl("reshape_and_cache_vllm_op", "CUDA")
@xla_cache_lib.impl("reshape_and_cache_vllm_op", "CPU")
def reshape_and_cache_vllm_op_impl(
    key, value, key_cache, value_cache, slot_mapping,
    kv_cache_dtype, k_scale, v_scale
):
    return reshape_and_cache_flash_xla_impl(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )


# Fake implementation for meta tensors
@xla_cache_lib._register_fake("reshape_and_cache_vllm_op")
def reshape_and_cache_vllm_op_fake(
    key, value, key_cache, value_cache, slot_mapping,
    kv_cache_dtype, k_scale, v_scale
):
    # Return tensors with same shape/dtype as caches
    return key_cache.clone(), value_cache.clone()


def reshape_and_cache_flash(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: Optional[torch.Tensor] = None,
    v_scale: Optional[torch.Tensor] = None,
) -> None:
    """Main entry point that uses vLLM's implementation."""
    
    # Mark caches as buffer donors if XLA supports it
    if xm.is_xla_tensor(key) and hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
        torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
        torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
    
    # Get new caches
    new_key_cache, new_value_cache = torch.ops.xla_cache_vllm.reshape_and_cache_vllm_op(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )
    
    # Copy back (will be optimized away by XLA with buffer donor)
    key_cache.copy_(new_key_cache)
    value_cache.copy_(new_value_cache)


if __name__ == "__main__":
    # Test basic functionality
    print("Testing vLLM-based XLA implementation...")
    
    # Check if vLLM ops are available
    if hasattr(torch.ops, 'vllm'):
        print("✓ vLLM ops namespace available")
        if hasattr(torch.ops.vllm, 'reshape_and_cache_flash'):
            print("✓ reshape_and_cache_flash op registered")
        else:
            print("✗ reshape_and_cache_flash op not found")
    else:
        print("✗ vLLM ops not available")
    
    # Try to import cache ops directly
    try:
        import vllm._cache_ops as cache_ops
        print("✓ vLLM _cache_ops module available")
    except ImportError:
        print("✗ vLLM _cache_ops module not found")
    
    # Simple test if CUDA is available
    if torch.cuda.is_available():
        print("\nRunning simple CUDA test...")
        device = torch.device("cuda")
        
        key = torch.randn(4, 2, 8, device=device)
        value = torch.randn(4, 2, 8, device=device)
        key_cache = torch.zeros(1, 16, 2, 8, device=device)
        value_cache = torch.zeros(1, 16, 2, 8, device=device)
        slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
        
        try:
            reshape_and_cache_flash(
                key, value, key_cache, value_cache,
                slot_mapping, "auto", None, None
            )
            print("✓ Function executed successfully")
        except Exception as e:
            print(f"✗ Error: {e}")
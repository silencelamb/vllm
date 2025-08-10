#!/usr/bin/env python3
"""XLA-compatible reshape_and_cache_flash with torch.compile support."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library, impl, register_fake
from torch_xla.experimental.custom_kernel import XLA_LIB
from typing import Optional, Tuple


def setup_custom_call():
    """Compile and register the custom call."""
    if not os.path.exists("reshape_and_cache_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_xla_vllm_style.sh") != 0:
            raise RuntimeError("Compilation failed")

    lib = ctypes.CDLL("./reshape_and_cache_xla.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(
        lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p
    ).value

    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)

    torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_reshape_and_cache_flash", capsule, "CUDA"
    )
    print("✓ Custom call registered")


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
    """XLA implementation that returns new tensors."""

    # Extract dimensions
    num_tokens = key.shape[0]
    num_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]

    # Check if scales are provided
    has_k_scale = k_scale is not None
    has_v_scale = v_scale is not None

    # Create descriptor
    # Format: "dtype_str|num_tokens|num_heads|head_size|num_blocks|block_size|has_k_scale|has_v_scale"
    descriptor_str = f"{kv_cache_dtype}|{num_tokens}|{num_heads}|{head_size}|{num_blocks}|{block_size}|{int(has_k_scale)}|{int(has_v_scale)}"
    descriptor = descriptor_str.encode("utf-8")

    # Prepare buffers
    buffers = [key, value, key_cache, value_cache, slot_mapping]
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    buffers.extend([key_cache, value_cache])  # outputs (last 2)
    # 如果没有这个extend，就把结果写到output的tensor上了

    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect
        descriptor,
        2,  # num_outputs
        {},  # extra_attributes
    )

    return outputs


# Define the operation that returns new tensors
XLA_LIB.define(
    "reshape_and_cache_flash(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> (Tensor, Tensor)"
)


# Implementation for XLA
XLA_LIB.impl("reshape_and_cache_flash", reshape_and_cache_flash_xla_impl, "XLA")


# Implementation for CUDA (using the C++ extension)
@impl(XLA_LIB, "reshape_and_cache_flash", "CUDA")
def reshape_and_cache_flash_cuda(
    key, value, key_cache, value_cache, slot_mapping, kv_cache_dtype, k_scale, v_scale
):
    try:
        import reshape_and_cache_xla_ext

        return reshape_and_cache_xla_ext.reshape_and_cache_flash_wrapper(
            key,
            value,
            key_cache,
            value_cache,
            slot_mapping,
            kv_cache_dtype,
            k_scale,
            v_scale,
        )
    except ImportError:
        # Fallback to calling vLLM's original function if available
        if hasattr(torch.ops, "vllm") and hasattr(
            torch.ops.vllm, "reshape_and_cache_flash"
        ):
            # Clone caches to return new tensors
            key_cache_out = key_cache.clone()
            value_cache_out = value_cache.clone()
            torch.ops.vllm.reshape_and_cache_flash(
                key,
                value,
                key_cache_out,
                value_cache_out,
                slot_mapping,
                kv_cache_dtype,
                k_scale if k_scale is not None else torch.ones(1, device=key.device),
                v_scale if v_scale is not None else torch.ones(1, device=key.device),
            )
            return key_cache_out, value_cache_out
        else:
            raise RuntimeError("No CUDA implementation available")


# Fake implementation for meta tensors (torch.compile)
@register_fake("xla::reshape_and_cache_flash")
def reshape_and_cache_flash_fake(
    key, value, key_cache, value_cache, slot_mapping, kv_cache_dtype, k_scale, v_scale
):
    out_k = torch.empty_strided(
        key_cache.shape, key_cache.stride(), dtype=key_cache.dtype, device="meta"
    )
    out_v = torch.empty_strided(
        value_cache.shape, value_cache.stride(), dtype=value_cache.dtype, device="meta"
    )
    return out_k, out_v


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
    """TPU-style wrapper that uses buffer donor optimization."""

    # Mark caches as buffer donors if XLA supports it
    # if hasattr(torch.ops.xla, 'dynamo_set_buffer_donor_'):
    #     torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
    #     torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)

    # Get new caches
    new_key_cache, new_value_cache = torch.ops.xla.reshape_and_cache_flash(
        key,
        value,
        key_cache,
        value_cache,
        slot_mapping,
        kv_cache_dtype,
        k_scale,
        v_scale,
    )

    # Copy back (will be optimized away by XLA with buffer donor)
    # key_cache.copy_(new_key_cache)
    # value_cache.copy_(new_value_cache)
    return new_key_cache, new_value_cache


# Initialize when module is imported
if xm.is_xla_tensor(torch.zeros(1)):
    try:
        setup_custom_call()
    except Exception as e:
        print(f"Warning: Failed to setup XLA custom call: {e}")

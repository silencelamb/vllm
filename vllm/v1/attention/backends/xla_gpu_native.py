# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

from dataclasses import dataclass
from typing import Any, Optional, Tuple, Union
import os
import sys
import ctypes

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from torch.library import impl, register_fake
from torch_xla.experimental.custom_kernel import XLA_LIB

from vllm.attention.backends.abstract import (
    AttentionBackend,
    AttentionImpl,
    AttentionLayer,
    AttentionType,
)
from vllm.attention.backends.utils import CommonAttentionState
from vllm.config import VllmConfig
from vllm.logger import init_logger

logger = init_logger(__name__)


def setup_combined_custom_calls():
    """Register both custom calls from a single library"""

    # 获取当前文件所在目录
    current_dir = os.path.dirname(os.path.abspath(__file__))
    so_path = os.path.join(current_dir, "vllm_xla_ops.so")
    compile_script = os.path.join(current_dir, "compile_xla_ops.sh")

    if not os.path.exists(so_path):
        print(f"Compiling combined library at {current_dir}...")
        if os.system(f"bash {compile_script}") != 0:
            raise RuntimeError("Compilation failed")

    # 加载单个库
    lib = ctypes.CDLL(so_path, ctypes.RTLD_LOCAL)
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]

    # 注册第一个函数
    func1_addr = ctypes.cast(
        lib.flash_attn_varlen_xla_custom_call, ctypes.c_void_p
    ).value
    capsule1 = PyCapsule_New(func1_addr, None, None)
    torch_xla._XLAC._xla_register_custom_call_target(
        "flash_attn_varlen_xxx", capsule1, "CUDA"
    )
    print("✓ flash_attn_varlen registered")
    
    # 注册第二个函数
    func2_addr = ctypes.cast(
        lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p
    ).value
    capsule2 = PyCapsule_New(func2_addr, None, None)
    torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_reshape_and_cache_flash_xxx", capsule2, "CUDA"
    )
    print("✓ vllm_reshape_and_cache_flash registered")



    # 保持引用
    global _combined_lib, _capsules
    _combined_lib = lib
    _capsules = [capsule1, capsule2]


# Register both custom calls from unified library
USE_CUSTOM_OP = setup_combined_custom_calls()


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
    num_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]

    # Map dtype
    dtype_map = {"auto": 0, "float32": 0, "float16": 1, "bfloat16": 2}
    kv_cache_dtype_int = dtype_map.get(kv_cache_dtype, 0)

    # Check scales
    has_k_scale = k_scale is not None
    has_v_scale = v_scale is not None

    # Format: "dtype_str|num_tokens|num_heads|head_size|num_blocks|block_size|has_k_scale|has_v_scale"
    descriptor_str = f"{kv_cache_dtype}|{num_tokens}|{num_heads}|{head_size}|{num_blocks}|{block_size}|{int(has_k_scale)}|{int(has_v_scale)}"
    descriptor = descriptor_str.encode("utf-8")

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
        "vllm_reshape_and_cache_flash_xxx",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect - this operation modifies the cache buffers
        descriptor,
        1,  # api_version
        {},
    )

    # This is important: XLA custom call returns the outputs in the same order as inputs
    # So we need to extract the last 2 tensors as outputs
    # return key_cache, value_cache
    return outputs


XLA_LIB.define(
    "reshape_and_cache_flash(Tensor key, Tensor value, Tensor key_cache, "
    "Tensor value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> (Tensor, Tensor)"
)


# Implementation for XLA
XLA_LIB.impl("reshape_and_cache_flash", reshape_and_cache_flash_impl, "XLA")



@impl(XLA_LIB, "reshape_and_cache_flash", "CompositeExplicitAutograd")
def reshape_and_cache_flash_composite(
    key, value, key_cache, value_cache, slot_mapping, kv_cache_dtype, k_scale, v_scale
):
    # 为了形状推导
    return key_cache.clone(), value_cache.clone()


def flash_attn_varlen_xla_impl(
    q: torch.Tensor,  # (total_q, num_heads, head_size)
    k: torch.Tensor,  # (total_k, num_heads_k, head_size)
    v: torch.Tensor,  # (total_k, num_heads_k, head_size)
    cu_seqlens_q: torch.Tensor,  # (batch_size + 1,)
    cu_seqlens_k: torch.Tensor,  # (batch_size + 1,)
    max_seqlen_q: int,
    max_seqlen_k: int,
    softmax_scale: float,
    is_causal: bool = False,
    window_left: int = -1,
    window_right: int = -1,
    softcap: float = 0.0,
    seqused_k: torch.Tensor = None,
    block_table: torch.Tensor = None,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Implementation that calls XLA custom op."""

    logger.info(f"======== q shape: {q.shape}")
    # Extract dimensions
    total_q = q.shape[0]
    num_heads = q.shape[1]
    head_size = q.shape[2]
    batch_size = cu_seqlens_q.shape[0] - 1

    # Handle different K shapes for regular vs paged attention
    if len(k.shape) == 4:
        # Paged KV cache: (num_blocks, block_size, num_heads_k, head_size)
        num_heads_k = k.shape[2]
        total_k = max_seqlen_k * batch_size  # Logical total K
    else:
        # Regular: (total_k, num_heads_k, head_size)
        total_k = k.shape[0]
        num_heads_k = k.shape[1]

    # Handle optional parameters
    has_seqused_k = seqused_k is not None and seqused_k.numel() > 0
    has_block_table = block_table is not None and block_table.numel() > 0

    # For paged attention, determine block size and max blocks per seq
    block_size = 0
    max_blocks_per_seq = 0
    if has_block_table:
        # Infer block size from K shape if paged
        # K shape for paged: (num_blocks, block_size, num_heads_k, head_size)
        if len(k.shape) == 4:
            block_size = k.shape[1]
            max_blocks_per_seq = block_table.shape[1]
        else:
            # Default values (block_size must be divisible by 16)
            block_size = 16
            max_blocks_per_seq = (max_seqlen_k + block_size - 1) // block_size

    # Create descriptor with all parameters
    descriptor_str = f"{batch_size}|{max_seqlen_q}|{max_seqlen_k}|{num_heads}|{num_heads_k}|{head_size}|{total_q}|{total_k}|{softmax_scale}|{int(is_causal)}|{window_left}|{window_right}|{softcap}|{int(has_block_table)}|{int(has_seqused_k)}|{block_size}|{max_blocks_per_seq}"
    descriptor = descriptor_str.encode("utf-8")

    # Ensure cu_seqlens_k is not None (required for XLA custom call)
    if cu_seqlens_k is None:
        # For paged attention, create a dummy cu_seqlens_k
        # It's not used but must be a valid tensor
        cu_seqlens_k = torch.tensor(
            [0, max_seqlen_k * batch_size], dtype=torch.int32, device=q.device
        )

    # Prepare buffers
    buffers = [q, k, v, cu_seqlens_q, cu_seqlens_k]

    if has_seqused_k:
        buffers.append(seqused_k)
    if has_block_table:
        buffers.append(block_table)

    # Output shapes
    out_shape = list(q.shape)
    softmax_lse_shape = [num_heads, total_q]

    # Add output buffers at the end
    # 这部分必须去掉，否则结果不正确
    # out = torch.empty(out_shape, dtype=q.dtype, device=q.device)
    # softmax_lse = torch.empty(softmax_lse_shape, dtype=torch.float32, device=q.device)
    # buffers.extend([out, softmax_lse])

    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "flash_attn_varlen_xxx",
        [out_shape, softmax_lse_shape],
        [q.dtype, torch.float32],
        False,  # has_side_effect
        descriptor,
        1,  # api_version
        {},
    )

    return outputs


# Define the operation
XLA_LIB.define(
    "flash_attn_varlen_op(Tensor q, Tensor k, Tensor v, "
    "Tensor cu_seqlens_q, Tensor cu_seqlens_k, "
    "int max_seqlen_q, int max_seqlen_k, float softmax_scale, "
    "bool is_causal, int window_left, int window_right, float softcap, "
    "Tensor? seqused_k, Tensor? block_table) -> (Tensor, Tensor)"
)

XLA_LIB.impl("flash_attn_varlen_op", flash_attn_varlen_xla_impl, "XLA")

@impl(XLA_LIB, "flash_attn_varlen_op", "CompositeExplicitAutograd")
def flash_attn_varlen_op_composite(
    q,
    k,
    v,
    cu_seqlens_q,
    cu_seqlens_k,
    max_seqlen_q,
    max_seqlen_k,
    softmax_scale,
    is_causal,
    window_left,
    window_right,
    softcap,
    seqused_k,
    block_table,
):

    output = torch.empty_like(q)
    # lse (log sum exp) 的形状
    total_q = q.shape[0]
    num_heads = q.shape[1]
    lse_shape = (num_heads, total_q)
    lse = q.new_empty(lse_shape)

    return output, lse


def flash_attn_varlen_func_xla(
    q,
    k,
    v,
    cu_seqlens_q,
    cu_seqlens_k,
    max_seqlen_q,
    max_seqlen_k,
    softmax_scale,
    seqused_k,
    block_table,
):
    return torch.ops.xla.flash_attn_varlen_op(
        q,
        k,  # key_cache
        v,  # value_cache
        cu_seqlens_q,
        cu_seqlens_k,  # only used for non-paged prefill, else None
        max_seqlen_q,
        max_seqlen_k,
        softmax_scale,
        True,  # is_causal
        -1,
        -1,  # window_size
        0.0,  # softcap
        seqused_k,  # seqused_k for paged attention
        block_table,  # block_table for paged attention
    )


class XlaGpuPagedAttentionBackend(AttentionBackend):
    """XLA GPU PagedAttention Backend using pure tensor operations."""

    accept_output_buffer: bool = False

    @staticmethod
    def get_name() -> str:
        return "XLA_GPU_PAGED_V1"

    @staticmethod
    def get_impl_cls() -> type["XlaGpuPagedAttentionBackendImpl"]:
        return XlaGpuPagedAttentionBackendImpl

    @staticmethod
    def get_metadata_cls() -> type["XlaGpuPagedMetadata"]:
        return XlaGpuPagedMetadata

    @staticmethod
    def get_state_cls() -> type["CommonAttentionState"]:
        return CommonAttentionState

    @staticmethod
    def get_kv_cache_shape(
        num_blocks: int,
        block_size: int,
        num_kv_heads: int,
        head_size: int,
    ) -> tuple[int, ...]:
        """KV cache shape: [2, num_blocks, block_size, num_kv_heads, head_size]

        This matches the format expected by vLLM's Triton kernels:
        - First dimension: 0 for keys, 1 for values
        - Compatible with unified_attention kernel
        """
        return (2, num_blocks, block_size, num_kv_heads, head_size)

    @staticmethod
    def swap_blocks(
        src_kv_cache: torch.Tensor,
        dst_kv_cache: torch.Tensor,
        src_to_dst: torch.Tensor,
    ) -> None:
        """Swap KV cache blocks for memory management."""
        # src_to_dst: [num_swaps, 2] where each row is (src_block_idx, dst_block_idx)
        for i in range(src_to_dst.shape[0]):
            src_idx = src_to_dst[i, 0].item()
            dst_idx = src_to_dst[i, 1].item()
            dst_kv_cache[dst_idx].copy_(src_kv_cache[src_idx])

    @staticmethod
    def copy_blocks(
        kv_caches: list[torch.Tensor],
        src_to_dsts: torch.Tensor,
    ) -> None:
        """Copy KV cache blocks."""
        for layer_idx, kv_cache in enumerate(kv_caches):
            if layer_idx >= src_to_dsts.shape[0]:
                break
            layer_copies = src_to_dsts[layer_idx]
            for i in range(layer_copies.shape[0]):
                src_idx = layer_copies[i, 0].item()
                dst_idx = layer_copies[i, 1].item()
                kv_cache[dst_idx].copy_(kv_cache[src_idx])


@dataclass
class XlaGpuPagedMetadata:
    """Metadata for XLA GPU attention matching FlashAttentionMetadata structure.

    This metadata structure is compatible with FlashAttention requirements
    while supporting XLA GPU specific optimizations.
    """

    # Core attention metadata (matching FlashAttentionMetadata)
    num_actual_tokens: int  # Number of tokens excluding padding
    max_query_len: int  # Maximum query length
    query_start_loc: torch.Tensor  # [batch_size + 1] - cumulative query positions
    max_seq_len: int  # Maximum sequence length
    seq_lens: torch.Tensor  # [batch_size] - sequence lengths
    block_table: (
        torch.Tensor
    )  # [batch_size, max_blocks_per_seq] - physical block mapping
    slot_mapping: torch.Tensor  # [total_tokens] - where to write new K/V

    # Cascade attention fields (set to defaults for now)
    use_cascade: bool = False
    common_prefix_len: int = 0
    cu_prefix_query_lens: Optional[torch.Tensor] = None
    prefix_kv_lens: Optional[torch.Tensor] = None
    suffix_kv_lens: Optional[torch.Tensor] = None

    # Optional scheduling metadata (for future AOT scheduling support)
    scheduler_metadata: Optional[torch.Tensor] = None
    prefix_scheduler_metadata: Optional[torch.Tensor] = None
    max_num_splits: int = 0

    # Additional XLA GPU specific fields (kept for backward compatibility)
    seq_lens_tensor: Optional[torch.Tensor] = None  # Alternative name for seq_lens
    block_tables: Optional[torch.Tensor] = None  # Alternative name for block_table


class XlaGpuPagedAttentionBackendImpl(AttentionImpl):
    """XLA GPU PagedAttention implementation using pure tensor operations."""

    def __init__(
        self,
        num_heads: int,
        head_size: int,
        scale: float,
        num_kv_heads: int,
        alibi_slopes: Optional[list[float]],
        sliding_window: Optional[int],
        kv_cache_dtype: str,
        blocksparse_params: Optional[dict[str, Any]] = None,
        logits_soft_cap: Optional[float] = None,
        attn_type: str = AttentionType.DECODER,
        kv_sharing_target_layer_name: Optional[str] = None,
        use_irope: bool = False,
    ) -> None:
        # Validate unsupported features
        if blocksparse_params is not None:
            raise ValueError("XLA GPU backend does not support block-sparse attention.")
        if sliding_window is not None:
            raise ValueError(
                "XLA GPU backend does not support sliding window attention."
            )
        if alibi_slopes is not None:
            raise ValueError("XLA GPU backend does not support ALiBi slopes.")
        if use_irope:
            raise ValueError("XLA GPU backend does not support iRoPE.")
        if kv_cache_dtype != "auto":
            raise ValueError("XLA GPU backend does not support FP8 KV cache yet.")
        if attn_type != AttentionType.DECODER:
            raise ValueError("XLA GPU backend only supports decoder attention.")

        self.num_heads = num_heads
        self.head_size = head_size
        self.scale = float(scale)
        self.num_kv_heads = num_kv_heads
        self.logits_soft_cap = logits_soft_cap
        self.kv_sharing_target_layer_name = kv_sharing_target_layer_name
        logger.info(f"====self.kv_sharing_target_layer_name: {self.kv_sharing_target_layer_name}")

        self.num_queries_per_kv = self.num_heads // self.num_kv_heads
        assert (
            self.num_heads % self.num_kv_heads == 0
        ), "num_heads must be divisible by num_kv_heads"

    def forward(
        self,
        layer: AttentionLayer,
        query: torch.Tensor,
        key: torch.Tensor,
        value: torch.Tensor,
        kv_cache: torch.Tensor,
        attn_metadata: XlaGpuPagedMetadata,
        output: Optional[torch.Tensor] = None,
        output_scale: Optional[torch.Tensor] = None,
    ) -> torch.Tensor:
        """Forward pass with XLA GPU paged attention using Flash Attention if available."""

        # For determine_available_memory case.
        if kv_cache.numel() == 0:
            if output is None:
                output = torch.ones_like(query)
            return output

        # Handle output scale
        if output_scale is not None:
            raise NotImplementedError(
                "Fused output quantization is not yet supported for XLA GPU backend"
            )

        # Handle profiling run case
        if attn_metadata is None:
            # Profiling run.
            output = torch.ones_like(query)
            return output

        # Validate input shapes
        if query.numel() == 0 or key.numel() == 0 or value.numel() == 0:
            # Empty inputs, return output as-is
            return output

        # Extract key and value caches
        if kv_cache.dim() == 5:
            # Flash attention layout: [2, num_blocks, block_size, num_kv_heads, head_size]
            key_cache, value_cache = kv_cache.unbind(0)
        else:
            # Regular layout, might need to split differently
            key_cache = kv_cache
            value_cache = kv_cache

        key = key.view(-1, self.num_kv_heads, self.head_size)
        value = value.view(-1, self.num_kv_heads, self.head_size)

        # Update KV cache with new keys and values
        # This is similar to FlashAttentionImpl
        if self.kv_sharing_target_layer_name is None:
            # Only update cache if not sharing with another layer
            num_actual_tokens = attn_metadata.num_actual_tokens
            new_key_cache, new_value_cache = torch.ops.xla.reshape_and_cache_flash(
                key[:num_actual_tokens],
                value[:num_actual_tokens],
                key_cache,
                value_cache,
                attn_metadata.slot_mapping,
                kv_cache_dtype="auto",
                k_scale=getattr(layer, "_k_scale", None),
                v_scale=getattr(layer, "_v_scale", None),
            )
            # new_key_cache.copy_(key_cache)
            # new_value_cache.copy_(value_cache)
            key_cache.copy_(new_key_cache)
            value_cache.copy_(new_value_cache)
        seq_lens_to_use = (
            attn_metadata.seq_lens_tensor
            if attn_metadata.seq_lens_tensor is not None
            else attn_metadata.seq_lens
        )
        block_table_to_use = (
            attn_metadata.block_tables
            if attn_metadata.block_tables is not None
            else attn_metadata.block_table
        )
        # For paged attention, cu_seqlens_k is not used but still needs to be provided
        # Create a dummy cu_seqlens_k tensor if None
        if attn_metadata.query_start_loc is not None:
            cu_seqlens_k = attn_metadata.query_start_loc.to(
                dtype=torch.int32
            )  # Convert to int32
        else:
            cu_seqlens_k = torch.tensor(
                [0, attn_metadata.max_seq_len], dtype=torch.int32, device=query.device
            )

        # Reshape query to 3D for flash attention
        # query is [num_tokens, num_heads * head_size], need [num_tokens, num_heads, head_size]
        num_tokens = query.shape[0]
        query_3d = query.view(num_tokens, self.num_heads, self.head_size)

        output, lse = torch.ops.xla.flash_attn_varlen_op(
            query_3d,  # q - now in correct 3D shape
            key_cache,  # k
            value_cache,  # v
            attn_metadata.query_start_loc,  # cu_seqlens_q
            cu_seqlens_k,  # cu_seqlens_k (required even if not used)
            attn_metadata.max_query_len,  # max_seqlen_q
            attn_metadata.max_seq_len,  # max_seqlen_k
            self.scale,  # softmax_scale
            True,  # is_causal
            -1,  # window_left
            -1,  # window_right
            0.0,  # softcap
            seq_lens_to_use,  # seqused_k
            block_table_to_use,  # block_table
        )

        # Reshape output back to 2D
        # output is [num_tokens, num_heads, head_size], need [num_tokens, num_heads * head_size]
        output_2d = output.view(num_tokens, self.num_heads * self.head_size)

        return output_2d

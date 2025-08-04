# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

from dataclasses import dataclass
from typing import Any, Optional, Union

import torch
import torch_xla.core.xla_model as xm

from vllm.attention.backends.abstract import (AttentionBackend, AttentionImpl,
                                              AttentionLayer, AttentionType)
from vllm.attention.backends.utils import CommonAttentionState
from vllm.config import VllmConfig
from vllm.logger import init_logger
from vllm.v1.attention.backends.xla_gpu_paged_attention_final import (
    xla_gpu_paged_attention_final,
    xla_gpu_kv_cache_update,
)

logger = init_logger(__name__)



# XLA GPU doesn't require strict head size alignment like TPU
XLA_GPU_HEAD_SIZE_ALIGNMENT = 8  # Minimal alignment for better performance

class XlaGpuPagedAttentionBackend(AttentionBackend):
    """XLA GPU PagedAttention Backend using pure tensor operations."""

    accept_output_buffer: bool = True

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
    """Simplified metadata for XLA GPU attention.
    
    Compared to TPU's PallasMetadata, we remove TPU-specific fields
    and add fields needed for our pure tensor implementation.
    """
    # Basic paging information
    slot_mapping: torch.Tensor        # [total_tokens] - where to write new K/V
    block_tables: torch.Tensor        # [batch_size, max_blocks_per_seq] - physical block mapping
    context_lens: torch.Tensor        # [batch_size] - length of each sequence's context
    
    # XLA GPU specific fields for efficient tensor operations
    token_to_seq_mapping: torch.Tensor  # [total_tokens] - which sequence each token belongs to
    attention_mask: torch.Tensor        # [total_tokens, max_context_len] - pre-computed causal mask
    is_prefill_token: torch.Tensor      # [total_tokens] - 0/1 flag for prefill vs decode
    
    # Shape information for static compilation
    max_context_len: int
    block_size: int


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
            raise ValueError("XLA GPU backend does not support sliding window attention.")
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
        
        self.num_queries_per_kv = self.num_heads // self.num_kv_heads
        assert self.num_heads % self.num_kv_heads == 0, "num_heads must be divisible by num_kv_heads"

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
        """Forward pass with XLA GPU paged attention using Triton kernel if available."""
        
        # For determine_available_memory case.
        if kv_cache.numel() == 0:
            if output is None:
                output = torch.ones_like(query)
            return output
            
        # Since accept_output_buffer is True, output should be provided
        assert output is not None, "Output tensor must be provided."
        
        # Handle output scale
        if output_scale is not None:
            raise NotImplementedError(
                "Fused output quantization is not yet supported for XLA GPU backend"
            )
        
        # Handle profiling run case
        if attn_metadata is None:
            # Profiling run.
            return output
        
        # Validate input shapes
        if query.numel() == 0 or key.numel() == 0 or value.numel() == 0:
            # Empty inputs, return output as-is
            return output
        
        # Update KV cache first
        if self.kv_sharing_target_layer_name is None:
            # Use the new XLA GPU KV cache update
            if kv_cache.dim() == 5:  # Flash layout [2, num_blocks, ...]
                key_cache = kv_cache[0]
                value_cache = kv_cache[1]
            else:
                # Assume separate key and value caches
                key_cache = kv_cache
                value_cache = kv_cache
            
            xla_gpu_kv_cache_update(
                key, value,
                key_cache,
                value_cache,
                attn_metadata.slot_mapping,
                "auto",  # kv_cache_dtype
                layer._k_scale if hasattr(layer, '_k_scale') else None,
                layer._v_scale if hasattr(layer, '_v_scale') else None,
            )
        
        # Use the new XLA GPU paged attention
        return xla_gpu_paged_attention_final(
            query, 
            kv_cache if kv_cache.dim() == 5 else kv_cache,  # Pass the full cache
            kv_cache if kv_cache.dim() == 5 else kv_cache,  # For compatibility
            attn_metadata,
            self.scale,
            layer,
            output,
        )
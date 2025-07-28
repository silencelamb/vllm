# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

from dataclasses import dataclass
from typing import Any, Optional

import torch
import torch_xla.core.xla_model as xm

from vllm.attention.backends.abstract import (AttentionBackend, AttentionImpl,
                                              AttentionLayer, AttentionType)
from vllm.attention.backends.utils import CommonAttentionState
from vllm.config import VllmConfig
from vllm.logger import init_logger

logger = init_logger(__name__)

# XLA GPU doesn't require strict head size alignment like TPU
XLA_GPU_HEAD_SIZE_ALIGNMENT = 8  # Minimal alignment for better performance


class XlaGpuPagedAttentionBackend(AttentionBackend):
    """XLA GPU PagedAttention Backend using pure tensor operations."""

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
        """KV cache shape: [num_blocks, 2, block_size, num_kv_heads, head_size]
        
        Different from TPU which uses [num_blocks, block_size, num_kv_heads * 2, head_size]
        We separate K and V for clearer indexing in pure tensor operations.
        """
        return (num_blocks, 2, block_size, num_kv_heads, head_size)

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
        """Forward pass with XLA GPU paged attention.

        Args:
            query: shape = [total_tokens, num_heads * head_size]
            key: shape = [total_tokens, num_kv_heads * head_size]
            value: shape = [total_tokens, num_kv_heads * head_size]
            kv_cache: shape = [num_blocks, 2, block_size, num_kv_heads, head_size]
            attn_metadata: Metadata for attention.
        Returns:
            shape = [total_tokens, num_heads * head_size]
        """
        if output_scale is not None:
            raise NotImplementedError(
                "Fused output quantization is not yet supported for XLA GPU backend"
            )

        # Handle determine_available_memory case
        if kv_cache.numel() == 0:
            if output is None:
                output = torch.zeros_like(query)
            return output

        # Get scaling factors
        k_scale = getattr(layer, '_k_scale_float', 1.0)
        v_scale = getattr(layer, '_v_scale_float', 1.0)
        
        # Reshape tensors
        total_tokens = query.shape[0]
        query = query.view(total_tokens, self.num_heads, self.head_size)
        key = key.view(total_tokens, self.num_kv_heads, self.head_size)
        value = value.view(total_tokens, self.num_kv_heads, self.head_size)

        # Optional head size padding for better performance
        original_head_size = self.head_size
        if self.head_size % XLA_GPU_HEAD_SIZE_ALIGNMENT != 0:
            padded_head_size = ((self.head_size + XLA_GPU_HEAD_SIZE_ALIGNMENT - 1) 
                               // XLA_GPU_HEAD_SIZE_ALIGNMENT * XLA_GPU_HEAD_SIZE_ALIGNMENT)
            query = torch.nn.functional.pad(
                query, (0, padded_head_size - self.head_size), value=0.0)
            key = torch.nn.functional.pad(
                key, (0, padded_head_size - self.head_size), value=0.0)
            value = torch.nn.functional.pad(
                value, (0, padded_head_size - self.head_size), value=0.0)

        # Update KV cache if not sharing with another layer
        if self.kv_sharing_target_layer_name is None and kv_cache.numel() > 0:
            updated_kv_cache = self._update_kv_cache(
                kv_cache, key, value, attn_metadata.slot_mapping, k_scale, v_scale
            )
        else:
            updated_kv_cache = kv_cache

        # Perform attention computation
        output_tensor = self._compute_attention(
            query, updated_kv_cache, attn_metadata
        )

        # Remove padding if applied
        if self.head_size % XLA_GPU_HEAD_SIZE_ALIGNMENT != 0:
            output_tensor = output_tensor[:, :, :original_head_size]

        # Reshape back to original format
        return output_tensor.reshape(total_tokens, self.num_heads * original_head_size)

    def _update_kv_cache(
        self,
        kv_cache: torch.Tensor,     # [num_blocks, 2, block_size, num_kv_heads, head_size]
        key: torch.Tensor,          # [total_tokens, num_kv_heads, head_size]
        value: torch.Tensor,        # [total_tokens, num_kv_heads, head_size]
        slot_mapping: torch.Tensor, # [3, padded_num_slices]
        k_scale: float = 1.0,
        v_scale: float = 1.0,
    ) -> torch.Tensor:
        """最简单的无条件分支版本。"""
        
        # 提取映射信息
        kv_cache_starts = slot_mapping[0]  # [padded_num_slices]
        new_kv_starts = slot_mapping[1]    # [padded_num_slices]
        slice_lengths = slot_mapping[2]    # [padded_num_slices]
        
        # 基本参数
        total_tokens = key.shape[0]
        block_size = kv_cache.shape[2]
        num_blocks = kv_cache.shape[0]
        
        # 应用缩放
        scaled_key = key * k_scale
        scaled_value = value * v_scale
        
        # 直接从slot_mapping构建线性映射
        # 假设slot_mapping已经是展开的形式，我们直接使用
        
        # 简化处理：假设每个slice长度为1，直接映射
        # 使用前total_tokens个slot mapping entries
        num_updates = min(slice_lengths.shape[0], total_tokens)
        
        # 创建有效的mask，只处理slice_length > 0的entries
        valid_mask = slice_lengths[:num_updates] > 0
        
        # 获取有效的indices
        valid_kv_starts = kv_cache_starts[:num_updates][valid_mask]
        valid_new_starts = new_kv_starts[:num_updates][valid_mask]
        
        # 确保索引在有效范围内
        valid_new_starts = torch.clamp(valid_new_starts, 0, total_tokens - 1)
        valid_kv_starts = torch.clamp(valid_kv_starts, 0, num_blocks * block_size - 1)
        
        # 计算block和offset indices
        block_indices = valid_kv_starts // block_size
        offset_indices = valid_kv_starts % block_size
        
        # Clone并更新
        updated_cache = kv_cache.clone()
        
        # 批量更新KV cache
        if valid_mask.any():
            updated_cache[block_indices, 0, offset_indices] = scaled_key[valid_new_starts]
            updated_cache[block_indices, 1, offset_indices] = scaled_value[valid_new_starts]
        
        return updated_cache

    def _compute_attention(
        self,
        query: torch.Tensor,        # [total_tokens, num_heads, head_size]
        kv_cache: torch.Tensor,     # [num_blocks, 2, block_size, num_kv_heads, head_size]
        attn_metadata: XlaGpuPagedMetadata,
    ) -> torch.Tensor:
        """Compute attention using reconstructed K/V and unified attention."""
        
        # Reconstruct full K/V sequences for each token
        reconstructed_key, reconstructed_value = self._reconstruct_kv_sequences(
            kv_cache, attn_metadata
        )
        
        # Unified attention computation
        return self._unified_attention_compute(
            query, reconstructed_key, reconstructed_value, attn_metadata.attention_mask
        )

    def _reconstruct_kv_sequences(
        self,
        kv_cache: torch.Tensor,     # [num_blocks, 2, block_size, num_kv_heads, head_size]
        attn_metadata: XlaGpuPagedMetadata,
    ) -> tuple[torch.Tensor, torch.Tensor]:
        """Fully vectorized reconstruction - best for compilation."""
        
        total_tokens = attn_metadata.token_to_seq_mapping.shape[0]
        max_context_len = attn_metadata.max_context_len
        block_size = attn_metadata.block_size
        num_kv_heads, head_size = kv_cache.shape[3], kv_cache.shape[4]
        device = kv_cache.device
        
        # Reshape cache for linear indexing
        cache_reshaped = kv_cache.view(-1, 2, num_kv_heads, head_size)
        
        # Create index tensors
        batch_idx = torch.arange(total_tokens, device=device).unsqueeze(1)  # [total_tokens, 1]
        pos_idx = torch.arange(max_context_len, device=device).unsqueeze(0)  # [1, max_context_len]
        
        # Expand to full grid
        batch_grid = batch_idx.expand(-1, max_context_len)  # [total_tokens, max_context_len]
        pos_grid = pos_idx.expand(total_tokens, -1)         # [total_tokens, max_context_len]
        
        # Get sequence info
        seq_ids = attn_metadata.token_to_seq_mapping[batch_grid]  # [total_tokens, max_context_len]
        context_lens = attn_metadata.context_lens[seq_ids]       # [total_tokens, max_context_len]
        
        # Validity mask
        valid_mask = pos_grid < context_lens  # [total_tokens, max_context_len]
        
        # Calculate cache indices
        block_idx = pos_grid // block_size
        offset_idx = pos_grid % block_size
        
        # Get physical blocks
        physical_blocks = torch.gather(
            attn_metadata.block_tables[seq_ids], 
            -1, 
            block_idx.unsqueeze(-1)
        ).squeeze(-1)  # [total_tokens, max_context_len]
        
        # Calculate flat cache indices
        flat_indices = physical_blocks * block_size + offset_idx
        
        # Apply mask and clamp for safety
        max_cache_idx = cache_reshaped.shape[0] - 1
        safe_indices = torch.clamp(flat_indices, 0, max_cache_idx)
        masked_indices = torch.where(valid_mask, safe_indices, 0)
        
        # Gather from cache
        gathered_kv = torch.index_select(cache_reshaped, 0, masked_indices.view(-1))
        gathered_kv = gathered_kv.view(total_tokens, max_context_len, 2, num_kv_heads, head_size)
        
        # Apply validity mask
        valid_mask_expanded = valid_mask.unsqueeze(-1).unsqueeze(-1).unsqueeze(-1)
        masked_kv = gathered_kv * valid_mask_expanded
        
        # Split key and value
        reconstructed_key = masked_kv[:, :, 0]    # [total_tokens, max_context_len, num_kv_heads, head_size]
        reconstructed_value = masked_kv[:, :, 1]  # [total_tokens, max_context_len, num_kv_heads, head_size]
        
        return reconstructed_key, reconstructed_value

    def _unified_attention_compute(
        self,
        query: torch.Tensor,        # [total_tokens, num_heads, head_size]
        key: torch.Tensor,          # [total_tokens, max_context_len, num_kv_heads, head_size]
        value: torch.Tensor,        # [total_tokens, max_context_len, num_kv_heads, head_size]
        attention_mask: torch.Tensor, # [total_tokens, max_context_len]
    ) -> torch.Tensor:
        """Unified attention computation for all tokens."""
        
        total_tokens, num_heads, head_size = query.shape
        max_context_len = key.shape[1]
        
        # Handle GQA/MQA by repeating KV heads
        if self.num_kv_heads != num_heads:
            key = key.repeat_interleave(self.num_queries_per_kv, dim=2)
            value = value.repeat_interleave(self.num_queries_per_kv, dim=2)
        
        # Compute attention scores
        # Reshape for batch matrix multiplication
        query_for_bmm = query.unsqueeze(2)  # [total_tokens, num_heads, 1, head_size]
        key_for_bmm = key.transpose(2, 3).transpose(1, 3)  # [total_tokens, num_heads, head_size, max_context_len]
        
        # Batch matrix multiplication
        scores = torch.matmul(query_for_bmm, key_for_bmm) * self.scale
        # [total_tokens, num_heads, 1, max_context_len]
        
        # Apply attention mask
        mask_expanded = attention_mask.unsqueeze(1).unsqueeze(2)
        scores = scores + mask_expanded
        
        # Apply logits soft cap if specified
        if self.logits_soft_cap is not None:
            scores = torch.tanh(scores / self.logits_soft_cap) * self.logits_soft_cap
        
        # Softmax
        attn_weights = torch.softmax(scores, dim=-1)
        
        # Apply attention to values
        value_for_bmm = value.transpose(1, 2)  # [total_tokens, num_heads, max_context_len, head_size]
        output = torch.matmul(attn_weights, value_for_bmm).squeeze(2)
        # [total_tokens, num_heads, head_size]
        
        return output
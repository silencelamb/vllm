# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

import torch
from torch.library import Library, impl

# Create custom library
xla_gpu_lib = Library("xla_gpu_simple", "DEF")

# Define the op
xla_gpu_lib.define(
    "paged_attention(Tensor query, Tensor kv_cache, "
    "Tensor context_lens, Tensor block_tables, Tensor query_start_loc, "
    "Tensor num_seqs, float scale) -> Tensor"
)


# The key to making it appear in HLO: Don't implement trivial operations
# that can be constant-folded
@impl(xla_gpu_lib, "paged_attention", "XLA")
def paged_attention_xla(query, kv_cache, context_lens, block_tables, 
                       query_start_loc, num_seqs, scale):
    """XLA implementation that won't be optimized away."""
    # Important: Use inputs in a way that prevents constant folding
    # This ensures the custom op appears in HLO
    
    # Extract some dimensions to use
    batch_size = context_lens.shape[0]
    seq_len = query.shape[0] // batch_size
    num_heads = query.shape[1]
    head_size = query.shape[2]
    
    # Create output that depends on inputs (prevents optimization)
    # In real implementation, this would be the attention computation
    output = torch.empty_like(query)
    
    # Simple computation that uses the inputs
    # This prevents XLA from optimizing it to a constant
    output = query * scale + torch.sum(kv_cache, dim=[0, 1], keepdim=True).expand_as(query) * 0.0
    
    return output


@impl(xla_gpu_lib, "paged_attention", "CUDA")
def paged_attention_cuda(query, kv_cache, context_lens, block_tables, 
                        query_start_loc, num_seqs, scale):
    """CUDA implementation."""
    # Placeholder - would call actual CUDA kernel
    output = query * scale
    return output


@impl(xla_gpu_lib, "paged_attention", "CPU")
def paged_attention_cpu(query, kv_cache, context_lens, block_tables, 
                       query_start_loc, num_seqs, scale):
    """CPU implementation."""
    return query * scale


@torch.library.register_fake("xla_gpu_simple::paged_attention")
def paged_attention_fake(query, kv_cache, context_lens, block_tables, 
                        query_start_loc, num_seqs, scale):
    """Fake implementation for shape inference."""
    return torch.empty_like(query)


def xla_gpu_paged_attention_simple(
    query: torch.Tensor,
    kv_cache: torch.Tensor,
    context_lens: torch.Tensor,
    block_tables: torch.Tensor,
    query_start_loc: torch.Tensor,
    num_seqs: torch.Tensor,
    scale: float,
) -> torch.Tensor:
    """Simple version that should appear in HLO."""
    return torch.ops.xla_gpu_simple.paged_attention(
        query, kv_cache, context_lens, block_tables,
        query_start_loc, num_seqs, scale
    )
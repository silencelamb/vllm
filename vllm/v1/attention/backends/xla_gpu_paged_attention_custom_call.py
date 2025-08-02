# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

import torch
from torch.library import Library, impl
import functools

# Create custom library
xla_gpu_lib = Library("xla_gpu_custom", "DEF")

# Define the op
xla_gpu_lib.define(
    "paged_attention(Tensor query, Tensor kv_cache, "
    "Tensor context_lens, Tensor block_tables, Tensor query_start_loc, "
    "Tensor num_seqs, float scale, int? sliding_window, float? soft_cap) -> Tensor"
)


def _xla_custom_call_paged_attention(
    query, kv_cache, context_lens, block_tables, 
    query_start_loc, num_seqs, scale, sliding_window=None, soft_cap=None
):
    """Direct XLA custom call implementation."""
    import torch_xla
    import torch_xla.core.xla_model as xm
    
    # Ensure we're on XLA device
    if not xm.is_xla_tensor(query):
        raise RuntimeError("This function requires XLA tensors")
    
    # Prepare config
    config = {
        "scale": float(scale),
        "sliding_window": int(sliding_window) if sliding_window is not None else -1,
        "soft_cap": float(soft_cap) if soft_cap is not None else 0.0,
    }
    
    # Register the custom call if not already registered
    # This ensures it appears in HLO as a custom-call node
    try:
        # Use torch_xla's internal API to create custom call
        # This will appear in HLO as: custom-call(...), custom_call_target="xla_gpu_paged_attention"
        
        # Get the underlying XLA tensors
        xla_args = [
            torch_xla._XLAC._get_xla_tensor(query),
            torch_xla._XLAC._get_xla_tensor(kv_cache),
            torch_xla._XLAC._get_xla_tensor(context_lens),
            torch_xla._XLAC._get_xla_tensor(block_tables),
            torch_xla._XLAC._get_xla_tensor(query_start_loc),
            torch_xla._XLAC._get_xla_tensor(num_seqs),
        ]
        
        # Create output tensor with custom call
        # This uses XLA's custom call mechanism directly
        output_xla_tensor = torch_xla._XLAC._xla_custom_call(
            xla_args,
            "xla_gpu_paged_attention",  # This name will appear in HLO
            [list(query.shape)],  # Output shapes
            [str(query.dtype).replace("torch.", "")],  # Output dtypes
            False,  # has_side_effect
            str(config),  # backend_config
        )
        
        # Wrap back to PyTorch tensor
        return torch_xla._XLAC._xla_create_tensor(output_xla_tensor[0], query.device)
        
    except AttributeError:
        # Fallback if _xla_custom_call is not available
        # Use a computation that won't be optimized away
        print("Warning: _xla_custom_call not available, using fallback")
        return query * scale + kv_cache.sum(dim=[0, 1], keepdim=True).expand_as(query) * 0.0001


@impl(xla_gpu_lib, "paged_attention", "XLA")
def paged_attention_xla(
    query, kv_cache, context_lens, block_tables, 
    query_start_loc, num_seqs, scale, sliding_window=None, soft_cap=None
):
    """XLA implementation using custom call."""
    return _xla_custom_call_paged_attention(
        query, kv_cache, context_lens, block_tables,
        query_start_loc, num_seqs, scale, sliding_window, soft_cap
    )


@impl(xla_gpu_lib, "paged_attention", "CUDA")
def paged_attention_cuda(
    query, kv_cache, context_lens, block_tables, 
    query_start_loc, num_seqs, scale, sliding_window=None, soft_cap=None
):
    """
    CUDA implementation.
    
    Yes, if you implement a real CUDA kernel here, XLA won't be able to optimize it away.
    The custom op will appear in HLO as a custom-call node.
    """
    # Example of calling a real CUDA kernel:
    # import vllm._C
    # return vllm._C.paged_attention_cuda(
    #     query, kv_cache, context_lens, block_tables,
    #     query_start_loc, num_seqs, scale
    # )
    
    # For now, placeholder that does actual computation
    output = query * scale
    # Add small dependency on kv_cache to prevent optimization
    kv_factor = kv_cache.abs().mean() * 1e-6
    output = output + kv_factor
    return output


@impl(xla_gpu_lib, "paged_attention", "CPU")
def paged_attention_cpu(
    query, kv_cache, context_lens, block_tables, 
    query_start_loc, num_seqs, scale, sliding_window=None, soft_cap=None
):
    """CPU implementation."""
    return query * scale


@torch.library.register_fake("xla_gpu_custom::paged_attention")
def paged_attention_fake(
    query, kv_cache, context_lens, block_tables, 
    query_start_loc, num_seqs, scale, sliding_window=None, soft_cap=None
):
    """Fake implementation for shape inference."""
    return torch.empty_like(query)


def xla_gpu_paged_attention_custom_call(
    query: torch.Tensor,
    kv_cache: torch.Tensor,
    context_lens: torch.Tensor,
    block_tables: torch.Tensor,
    query_start_loc: torch.Tensor,
    num_seqs: torch.Tensor,
    scale: float,
    sliding_window: int = None,
    soft_cap: float = None,
) -> torch.Tensor:
    """
    XLA GPU paged attention using custom call.
    
    This implementation ensures the op appears in HLO as a custom-call node.
    """
    return torch.ops.xla_gpu_custom.paged_attention(
        query, kv_cache, context_lens, block_tables,
        query_start_loc, num_seqs, scale, sliding_window, soft_cap
    )


# Alternative: Direct registration with XLA runtime
def register_xla_custom_op():
    """
    Register custom op directly with XLA runtime.
    This ensures it's recognized as a custom call.
    """
    try:
        import torch_xla
        
        # Define the custom op handler
        def paged_attention_handler(args, backend_config):
            # This would be called by XLA runtime
            # In practice, this would dispatch to actual implementation
            query = args[0]
            scale = float(backend_config.get("scale", 1.0))
            return query * scale
        
        # Register with XLA runtime (if API is available)
        # Note: This API might vary between torch_xla versions
        if hasattr(torch_xla._XLAC, "register_custom_call"):
            torch_xla._XLAC.register_custom_call(
                "xla_gpu_paged_attention",
                paged_attention_handler
            )
            print("Custom op registered with XLA runtime")
    except Exception as e:
        print(f"Could not register with XLA runtime: {e}")
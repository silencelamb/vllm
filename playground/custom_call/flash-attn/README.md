# Flash Attention XLA Custom Call

This directory contains the implementation of flash-attention's `flash_attn_varlen_func` as an XLA custom call that can be used with torch_xla.

## Overview

The implementation wraps vLLM's compiled flash-attention library (`_vllm_fa2_C.varlen_fwd`) to make it available as an XLA custom operation. This allows using flash-attention within XLA-compiled graphs, particularly useful for the XLA GPU backend in vLLM.

## Files

- `flash_attn_varlen_xla.cc` - C++ wrapper that implements the XLA custom call interface
- `compile_flash_attn_xla.sh` - Compilation script that builds the shared library
- `test_flash_attn_xla.py` - Python test script using torch_xla and torch.compile
- `run_test.sh` - Convenience script to run tests with proper environment variables

## Implementation Details

### C++ Wrapper (`flash_attn_varlen_xla.cc`)

The wrapper:
1. Parses XLA custom call parameters from the opaque descriptor
2. Creates PyTorch tensor wrappers for input/output buffers
3. Calls vLLM's `torch::ops::_vllm_fa2_C::varlen_fwd` function
4. Handles optional parameters like `seqused_k` and `block_table`

### Python Interface (`test_flash_attn_xla.py`)

The Python code:
1. Registers the custom call with XLA
2. Defines a torch operation `flash_attn_varlen_op` 
3. Implements the XLA backend for this operation
4. Provides torch.compile compatibility

## Building

```bash
# Make sure vLLM is installed with flash-attention support
pip install vllm

# Compile the custom call library
bash compile_flash_attn_xla.sh
```

## Usage

### Basic Usage

```python
import torch
import torch_xla.core.xla_model as xm

# Setup custom call (only needed once)
setup_custom_call()

# Create inputs
device = xm.xla_device()
q = torch.randn(total_q, num_heads, head_size, device=device, dtype=torch.float16)
k = torch.randn(total_k, num_heads_k, head_size, device=device, dtype=torch.float16)
v = torch.randn(total_k, num_heads_k, head_size, device=device, dtype=torch.float16)
cu_seqlens_q = torch.tensor([0, seqlen_q, 2*seqlen_q], dtype=torch.int32, device=device)
cu_seqlens_k = torch.tensor([0, seqlen_k, 2*seqlen_k], dtype=torch.int32, device=device)

# Call flash attention
out, softmax_lse = torch.ops.xla.flash_attn_varlen_op(
    q, k, v,
    cu_seqlens_q, cu_seqlens_k,
    max_seqlen_q, max_seqlen_k,
    softmax_scale,
    is_causal=True,
    window_left=-1, window_right=-1,
    softcap=0.0,
    seqused_k=None,
    block_table=None
)
```

### With torch.compile

```python
@torch.compile(backend="openxla")
def flash_attention_forward(q, k, v, cu_seqlens_q, cu_seqlens_k):
    softmax_scale = 1.0 / (q.shape[-1] ** 0.5)
    return torch.ops.xla.flash_attn_varlen_op(
        q, k, v,
        cu_seqlens_q, cu_seqlens_k,
        max_seqlen_q, max_seqlen_k,
        softmax_scale,
        is_causal=True,
        window_left=-1, window_right=-1,
        softcap=0.0,
        seqused_k=None,
        block_table=None
    )
```

## Testing

```bash
# Run all tests
bash run_test.sh

# Or run directly with custom settings
CUDA_VISIBLE_DEVICES=0 PJRT_DEVICE=CUDA python test_flash_attn_xla.py
```

## Parameters

The custom call supports the following parameters:

- `q, k, v` - Query, Key, Value tensors
- `cu_seqlens_q, cu_seqlens_k` - Cumulative sequence lengths
- `max_seqlen_q, max_seqlen_k` - Maximum sequence lengths
- `softmax_scale` - Scaling factor for QK^T
- `is_causal` - Whether to use causal masking
- `window_size` - (left, right) for sliding window attention
- `softcap` - Softcapping value (0.0 = disabled)
- `seqused_k` - Optional actual sequence lengths for keys
- `block_table` - Optional for paged KV cache

## Integration with vLLM

This custom call can be used in `vllm/v1/attention/backends/xla_gpu_native.py` to implement the PagedAttention operator for XLA GPU backend:

```python
# In XlaGpuPagedAttention.forward_prefill()
out, softmax_lse = torch.ops.xla.flash_attn_varlen_op(
    query, key_cache, value_cache,
    prefill_meta.query_start_loc,
    dummy_cu_seqlens_k,  # Not used when seqused_k is provided
    prefill_meta.max_query_len,
    max_seq_len,
    softmax_scale,
    is_causal=True,
    window_left=-1, window_right=-1,
    softcap=0.0,
    seqused_k=prefill_meta.seq_lens_tensor,
    block_table=prefill_meta.block_tables
)
```

## Notes

1. The implementation currently assumes float16 data type. Support for other dtypes (bfloat16, float32) can be added.
2. The custom call links against vLLM's compiled flash-attention library, so vLLM must be installed.
3. Performance should be similar to native flash-attention since we're calling the same CUDA kernels.
4. The implementation supports both regular and paged KV cache modes.

## Future Work

1. Add support for more data types (bfloat16, float8)
2. Implement backward pass for training scenarios
3. Add support for alibi slopes and leftpad_k parameters
4. Optimize the descriptor parsing and tensor creation
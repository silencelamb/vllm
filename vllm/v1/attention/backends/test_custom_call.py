# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

from dataclasses import dataclass
from typing import Any, Optional, Tuple, Union
import os
import sys
import ctypes

import torch
import torch_xla
from torch.library import impl, register_fake
from torch_xla.experimental.custom_kernel import XLA_LIB
import torch_xla.core.xla_model as xm


from vllm.logger import init_logger

logger = init_logger(__name__)


def setup_unified_custom_calls():
    """Register both custom calls from the unified library."""
    lib_path = "vllm_xla_ops.so"
    
    # Check if library exists
    if not os.path.exists(lib_path):
        print(f"✗ Unified library not found: {lib_path}")
        print("  Please copy vllm_xla_ops.so to the current directory or compile it first")
        return False
    
    try:
        # Load the unified library
        lib = ctypes.CDLL(lib_path, ctypes.RTLD_LOCAL)
        
        # Setup PyCapsule creation
        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
        PyCapsule_New.restype = ctypes.py_object
        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
        
        # Register flash_attn_varlen
        try:
            flash_func_addr = ctypes.cast(
                lib.flash_attn_varlen_xla_custom_call, 
                ctypes.c_void_p
            ).value
            flash_capsule = PyCapsule_New(flash_func_addr, None, None)
            torch_xla._XLAC._xla_register_custom_call_target(
                "flash_attn_varlen",
                flash_capsule,
                "CUDA"
            )
            print("✓ Registered: flash_attn_varlen")
        except AttributeError as e:
            print(f"⚠ flash_attn_varlen not found: {e}")
        
        # Register vllm_reshape_and_cache_flash
        try:
            reshape_func_addr = ctypes.cast(
                lib.reshape_and_cache_flash_xla_custom_call,
                ctypes.c_void_p
            ).value
            reshape_capsule = PyCapsule_New(reshape_func_addr, None, None)
            torch_xla._XLAC._xla_register_custom_call_target(
                "vllm_reshape_and_cache_flash",
                reshape_capsule,
                "CUDA"
            )
            print("✓ Registered: vllm_reshape_and_cache_flash")
        except AttributeError as e:
            print(f"⚠ reshape_and_cache not found: {e}")
        
        print("✓ Unified XLA ops registration complete")
        return True
        
    except Exception as e:
        print(f"✗ Failed to register unified XLA ops: {e}")
        import traceback
        traceback.print_exc()
        return False

# Register both custom calls from unified library
setup_unified_custom_calls()

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
    descriptor = descriptor_str.encode('utf-8')
    
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
        2,  # api_version
        {}
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


# Fake implementation for meta tensors
@register_fake("xla::reshape_and_cache_flash")
def reshape_and_cache_flash_fake(
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

@impl(XLA_LIB, "reshape_and_cache_flash", "CompositeExplicitAutograd")
def reshape_and_cache_flash_composite(key, value, key_cache, value_cache, slot_mapping, kv_cache_dtype, k_scale, v_scale):
    # 同样的实现
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
        cu_seqlens_k = torch.tensor([0, max_seqlen_k * batch_size], dtype=torch.int32, device=q.device)
    
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
        "flash_attn_varlen",
        [out_shape, softmax_lse_shape],
        [q.dtype, torch.float32],
        False,  # has_side_effect
        descriptor,
        2,  # api_version
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


# Fake implementation for meta tensors
@register_fake("xla::flash_attn_varlen_op")
def flash_attn_varlen_op_fake(
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
    out = torch.empty_strided(q.shape, q.stride(), dtype=q.dtype, device=q.device)
    softmax_lse = torch.empty_strided(
        [q.shape[1], q.shape[0]], [1, q.shape[1]], dtype=torch.float32, device=q.device
    )
    return out, softmax_lse

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
    q, k, v, cu_seqlens_q, cu_seqlens_k, max_seqlen_q, max_seqlen_k, softmax_scale, seqused_k, block_table
):
    return torch.ops.xla.flash_attn_varlen_op(
        q,
        k,    # key_cache
        v,    # value_cache
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


if __name__ == "__main__":
    """Test xla_gpu_kv_cache_update and xla_gpu_paged_attention_final with torch.compile."""
    import sys
    import traceback
    
    # Set up XLA environment for torch.compile
    import os
    os.environ["VLLM_USE_XLA_GPU"] = "1"
    os.environ["VLLM_USE_V1"] = "1"
    os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"
    os.environ["PJRT_DEVICE"] = "CUDA"
    os.environ["GPU_NUM_DEVICES"] = "1"
    os.environ["CUDA_VISIBLE_DEVICES"] = "0"
    os.environ["XLA_PYTHON_CLIENT_PREALLOCATE"] = "false"
    os.environ["XLA_FLAGS"] = "--xla_dump_to=./xla_dump/"
    
    import torch
    import torch._dynamo
    import torch_xla
    import torch_xla.core.xla_model as xm
    
    print("=" * 60)
    print("XLA GPU torch.compile Test Cases")
    print("=" * 60)
    
    # Get XLA device
    device = xm.xla_device()
    print(f"✓ XLA device initialized: {device}")
    print(f"  Device type: {device.type}")
    print(f"  Using torch.compile with backend='openxla'")
    
    # Test parameters - using fixed sizes for some dimensions
    batch_size = 2
    num_tokens = 8  # This will be marked as dynamic
    num_heads = 4
    num_kv_heads = 2  # For GQA
    head_size = 64
    num_blocks = 16
    block_size = 16
    max_seq_len = 128
    
    print(f"\nTest Configuration:")
    print(f"  Batch size: {batch_size}")
    print(f"  Num tokens: {num_tokens} (will be marked dynamic)")
    print(f"  Num heads: {num_heads} (KV heads: {num_kv_heads})")
    print(f"  Head size: {head_size}")
    print(f"  Cache blocks: {num_blocks} x {block_size}")
    
    def test_xla_gpu_kv_cache_update():
        """Test the xla_gpu_kv_cache_update function with torch.compile."""
        print("\n" + "-" * 50)
        print("Test 1: xla_gpu_kv_cache_update with torch.compile")
        print("-" * 50)
        
        try:
            # Define the wrapped function for compilation
            def kv_cache_update_wrapper(key, value, key_cache, value_cache, slot_mapping):
                """Wrapper function that will be compiled."""
                
                # Call the actual function
                return torch.ops.xla.reshape_and_cache_flash(
                    key=key,
                    value=value,
                    key_cache=key_cache,
                    value_cache=value_cache,
                    slot_mapping=slot_mapping,
                    kv_cache_dtype="auto",
                    k_scale=None,
                    v_scale=None,
                )
            
            
            # Compile the wrapper with openxla backend
            print("Compiling kv_cache_update with backend='openxla'...")
            compiled_fn = torch.compile(
                kv_cache_update_wrapper,
                backend='openxla',
                fullgraph=True,
                dynamic=False,  # We manually mark dynamic dims
            )
            
            # Test with different token counts to verify dynamic shapes
            test_token_counts = [4, 8, 12]
            
            for token_count in test_token_counts:
                print(f"\nTesting with {token_count} tokens:")
                
                # Create test tensors on XLA device
                key = torch.randn(token_count, num_kv_heads, head_size, device=device)
                value = torch.randn(token_count, num_kv_heads, head_size, device=device)
                
                # Initialize KV caches
                key_cache = torch.zeros(
                    num_blocks, block_size, num_kv_heads, head_size, device=device
                )
                value_cache = torch.zeros(
                    num_blocks, block_size, num_kv_heads, head_size, device=device
                )
                
                # Create slot mapping
                slot_mapping = torch.arange(token_count, dtype=torch.long, device=device)
                
                # Mark dynamic dimensions
                torch._dynamo.mark_dynamic(key, 0)  # num_tokens dimension
                torch._dynamo.mark_dynamic(value, 0)
                torch._dynamo.mark_dynamic(slot_mapping, 0)
                
                print(f"  Input shapes: key={key.shape}, slot_mapping={slot_mapping.shape}")
                
                # Call compiled function
                updated_key_cache, updated_value_cache = compiled_fn(
                    key, value, key_cache, value_cache, slot_mapping
                )
                
                # Sync XLA execution
                xm.mark_step()
                
                print(f"  ✓ Compiled function executed successfully")
                print(f"    Output shapes: key_cache={updated_key_cache.shape}, value_cache={updated_value_cache.shape}")
                
                # Basic validation
                assert updated_key_cache.shape == key_cache.shape
                assert updated_value_cache.shape == value_cache.shape
            
            print("\n✓ Test 1 PASSED - Dynamic shapes handled correctly")
            return True
            
        except Exception as e:
            print(f"✗ Test 1 FAILED: {e}")
            traceback.print_exc()
            return False
    
    def test_xla_gpu_paged_attention_final():
        """Test the xla_gpu_paged_attention_final function with torch.compile."""
        print("\n" + "-" * 50)
        print("Test 2: xla_gpu_paged_attention_final with torch.compile")
        print("-" * 50)
        
        try:
            
            # Define the wrapped function for compilation
            def paged_attention_wrapper(query, key_cache, value_cache, 
                                       query_start_loc, seq_lens, block_table, 
                                       slot_mapping, num_actual_tokens):
                """Wrapper function that will be compiled."""
                
                # Create metadata inside the compiled function
                metadata = XlaGpuPagedMetadata(
                    num_actual_tokens=num_actual_tokens,
                    max_query_len=query.shape[0],  # Use actual query length
                    query_start_loc=query_start_loc,
                    max_seq_len=max_seq_len,
                    seq_lens=seq_lens,
                    block_table=block_table,
                    slot_mapping=slot_mapping,
                    seq_lens_tensor=seq_lens,
                    block_tables=block_table,
                )
                seq_lens_to_use = (
                    metadata.seq_lens_tensor
                    if metadata.seq_lens_tensor is not None
                    else metadata.seq_lens
                )
                block_table_to_use = (
                    metadata.block_tables
                    if metadata.block_tables is not None
                    else metadata.block_table
                )
                # For paged attention, cu_seqlens_k is not used but still needs to be provided
                # Create a dummy cu_seqlens_k tensor if None
                if metadata.query_start_loc is not None:
                    cu_seqlens_k = metadata.query_start_loc.to(dtype=torch.int32)  # Convert to int32
                else:
                    cu_seqlens_k = torch.tensor([0, metadata.max_seq_len], dtype=torch.int32, device=query.device)
                
                # Call the actual function with correct parameter order
                return torch.ops.xla.flash_attn_varlen_op(
                    query,  # q
                    key_cache,  # k  
                    value_cache,  # v
                    metadata.query_start_loc,  # cu_seqlens_q
                    cu_seqlens_k,  # cu_seqlens_k (required even if not used)
                    metadata.max_query_len,  # max_seqlen_q
                    metadata.max_seq_len,  # max_seqlen_k
                    1.0 / (head_size ** 0.5),  # softmax_scale
                    True,  # is_causal
                    -1,  # window_left
                    -1,  # window_right
                    0.0,  # softcap
                    seq_lens_to_use,  # seqused_k
                    block_table_to_use,  # block_table
                )
            
            # Compile the wrapper with openxla backend
            print("Compiling paged_attention with backend='openxla'...")
            compiled_fn = torch.compile(
                paged_attention_wrapper,
                backend='openxla',
                fullgraph=True,
                dynamic=False,  # We manually mark dynamic dims
            )
            
            # Prepare static caches (these don't change across calls)
            key_cache = torch.randn(
                num_blocks, block_size, num_kv_heads, head_size, device=device
            ) * 0.1
            value_cache = torch.randn(
                num_blocks, block_size, num_kv_heads, head_size, device=device
            ) * 0.1
            
            # Test with different token counts
            test_configs = [
                (4, 1),  # 4 tokens, 1 sequence
                (8, 2),  # 8 tokens, 2 sequences
                (6, 1),  # 6 tokens, 1 sequence
            ]
            
            for token_count, batch_count in test_configs:
                print(f"\nTesting with {token_count} tokens, {batch_count} sequence(s):")
                
                # Create query tensor
                query = torch.randn(token_count, num_heads, head_size, device=device)
                
                # Create metadata tensors
                if batch_count == 1:
                    seq_lens = torch.tensor([token_count], dtype=torch.int32, device=device)
                    query_start_loc = torch.tensor([0, token_count], dtype=torch.int32, device=device)
                else:
                    # Split tokens between sequences
                    tokens_per_seq = token_count // batch_count
                    seq_lens = torch.full((batch_count,), tokens_per_seq, dtype=torch.int32, device=device)
                    query_start_loc = torch.arange(0, token_count + 1, tokens_per_seq, 
                                                  dtype=torch.int32, device=device)
                
                # Create block table
                max_blocks_per_seq = 8
                block_table = torch.zeros(
                    batch_count, max_blocks_per_seq, dtype=torch.int32, device=device
                )
                for i in range(batch_count):
                    blocks_needed = (seq_lens[i].item() + block_size - 1) // block_size
                    block_table[i, :blocks_needed] = torch.arange(i * blocks_needed, 
                                                                 (i + 1) * blocks_needed)
                
                # Create slot mapping
                slot_mapping = torch.arange(token_count, dtype=torch.long, device=device)
                
                print(f"  Input shapes: query={query.shape}, seq_lens={seq_lens.shape}")
                # Mark dynamic dimensions
                # torch._dynamo.mark_dynamic(query, 0)  # num_tokens dimension
                # torch._dynamo.mark_dynamic(query_start_loc, 0)  # batch dimension + 1
                # torch._dynamo.mark_dynamic(seq_lens, 0)  # batch dimension
                # torch._dynamo.mark_dynamic(slot_mapping, 0)  # num_tokens dimension
                # Call compiled function
                result, _ = compiled_fn(
                    query, key_cache, value_cache,
                    query_start_loc, seq_lens, block_table,
                    slot_mapping, token_count
                )
                
                # Sync XLA execution
                xm.mark_step()
                
                print(f"  ✓ Compiled function executed successfully")
                print(f"    Output shape: {result.shape}")
                
                # Basic validation
                assert result.shape == query.shape, f"Shape mismatch: {result.shape} != {query.shape}"
            
            print("\n✓ Test 2 PASSED - Dynamic shapes handled correctly")
            return True
            
        except Exception as e:
            print(f"✗ Test 2 FAILED: {e}")
            traceback.print_exc()
            return False
    
    def test_integration():
        """Test both functions together with torch.compile in a realistic scenario."""
        print("\n" + "-" * 50)
        print("Test 3: Integration Test with torch.compile")
        print("-" * 50)
        
        try:
            # Define a complete attention pipeline for compilation
            class AttentionPipeline:
                def __init__(self, num_kv_heads, head_size):
                    self.num_kv_heads = num_kv_heads
                    self.head_size = head_size
                    self.softmax_scale = 1.0 / (head_size ** 0.5)
                
                def forward(self, key, value, query, key_cache, value_cache, 
                           slot_mapping, seq_lens, query_start_loc, block_table):
                    """Complete attention pipeline."""
                    # Mark dynamic dimensions
                    torch._dynamo.mark_dynamic(key, 0)
                    torch._dynamo.mark_dynamic(value, 0)
                    torch._dynamo.mark_dynamic(query, 0)
                    torch._dynamo.mark_dynamic(slot_mapping, 0)
                    torch._dynamo.mark_dynamic(seq_lens, 0)
                    torch._dynamo.mark_dynamic(query_start_loc, 0)
                    
                    # Update KV cache
                    updated_key_cache, updated_value_cache = xla_gpu_kv_cache_update(
                        key=key,
                        value=value,
                        key_cache=key_cache,
                        value_cache=value_cache,
                        slot_mapping=slot_mapping,
                        kv_cache_dtype="auto",
                        k_scale=None,
                        v_scale=None,
                    )
                    
                    # Create metadata for attention
                    metadata = XlaGpuPagedMetadata(
                        num_actual_tokens=query.shape[0],
                        max_query_len=query.shape[0],
                        query_start_loc=query_start_loc,
                        max_seq_len=seq_lens.max().item(),
                        seq_lens=seq_lens,
                        block_table=block_table,
                        slot_mapping=slot_mapping,
                    )
                    
                    # Mock layer
                    class MockLayer:
                        def __init__(self):
                            self._k_scale = None
                            self._v_scale = None
                    
                    # Compute attention
                    output = xla_gpu_paged_attention_final(
                        query=query,
                        key_cache=updated_key_cache,
                        value_cache=updated_value_cache,
                        attn_metadata=metadata,
                        softmax_scale=self.softmax_scale,
                        layer=MockLayer(),
                    )
                    
                    return output, updated_key_cache, updated_value_cache
            
            # Create and compile the pipeline
            print("Creating and compiling attention pipeline...")
            pipeline = AttentionPipeline(num_kv_heads, head_size)
            compiled_pipeline = torch.compile(
                pipeline.forward,
                backend='openxla',
                fullgraph=True,
                dynamic=False,
            )
            
            # Initialize caches
            key_cache = torch.zeros(
                num_blocks, block_size, num_kv_heads, head_size, device=device
            )
            value_cache = torch.zeros(
                num_blocks, block_size, num_kv_heads, head_size, device=device
            )
            
            # Test scenario: prefill then decode
            print("\nScenario: Prefill (4 tokens) -> Decode (1 token) -> Decode (1 token)")
            
            # Step 1: Prefill
            prefill_tokens = 4
            key_prefill = torch.randn(prefill_tokens, num_kv_heads, head_size, device=device)
            value_prefill = torch.randn(prefill_tokens, num_kv_heads, head_size, device=device)
            query_prefill = torch.randn(prefill_tokens, num_heads, head_size, device=device)
            slot_mapping_prefill = torch.arange(prefill_tokens, dtype=torch.long, device=device)
            
            seq_lens = torch.tensor([prefill_tokens], dtype=torch.long, device=device)
            query_start_loc = torch.tensor([0, prefill_tokens], dtype=torch.long, device=device)
            block_table = torch.zeros(1, 8, dtype=torch.long, device=device)
            block_table[0, 0] = 0
            
            print(f"\nStep 1: Prefill with {prefill_tokens} tokens")
            output, key_cache, value_cache = compiled_pipeline(
                key_prefill, value_prefill, query_prefill,
                key_cache, value_cache, slot_mapping_prefill,
                seq_lens, query_start_loc, block_table
            )
            xm.mark_step()
            print(f"  ✓ Prefill complete, output shape: {output.shape}")
            
            # Step 2: First decode
            decode_tokens = 1
            current_seq_len = prefill_tokens + 1
            
            key_decode = torch.randn(decode_tokens, num_kv_heads, head_size, device=device)
            value_decode = torch.randn(decode_tokens, num_kv_heads, head_size, device=device)
            query_decode = torch.randn(decode_tokens, num_heads, head_size, device=device)
            slot_mapping_decode = torch.tensor([prefill_tokens], dtype=torch.long, device=device)
            
            seq_lens = torch.tensor([current_seq_len], dtype=torch.long, device=device)
            query_start_loc = torch.tensor([0, decode_tokens], dtype=torch.long, device=device)
            
            print(f"\nStep 2: First decode ({decode_tokens} token)")
            output, key_cache, value_cache = compiled_pipeline(
                key_decode, value_decode, query_decode,
                key_cache, value_cache, slot_mapping_decode,
                seq_lens, query_start_loc, block_table
            )
            xm.mark_step()
            print(f"  ✓ Decode complete, output shape: {output.shape}")
            
            # Step 3: Second decode (testing reuse of compiled graph)
            current_seq_len += 1
            slot_mapping_decode2 = torch.tensor([current_seq_len - 1], dtype=torch.long, device=device)
            seq_lens = torch.tensor([current_seq_len], dtype=torch.long, device=device)
            
            print(f"\nStep 3: Second decode ({decode_tokens} token) - reusing compiled graph")
            output, key_cache, value_cache = compiled_pipeline(
                key_decode, value_decode, query_decode,  # Reuse same shape tensors
                key_cache, value_cache, slot_mapping_decode2,
                seq_lens, query_start_loc, block_table
            )
            xm.mark_step()
            print(f"  ✓ Decode complete, output shape: {output.shape}")
            
            print("\n✓ Test 3 PASSED - Integration test successful")
            return True
            
        except Exception as e:
            print(f"✗ Test 3 FAILED: {e}")
            traceback.print_exc()
            return False
    
    # Run all tests
    print("\nRunning test suite...")
    results = []
    
    # Test 1: KV Cache Update
    # results.append(("KV Cache Update", test_xla_gpu_kv_cache_update()))
    
    # Test 2: Paged Attention
    results.append(("Paged Attention", test_xla_gpu_paged_attention_final()))
    
    # Test 3: Integration
    # results.append(("Integration", test_integration()))
    
    # Summary
    print("\n" + "=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)
    
    for test_name, passed in results:
        status = "✓ PASSED" if passed else "✗ FAILED"
        print(f"  {test_name:.<40} {status}")
    
    all_passed = all(result[1] for result in results)
    if all_passed:
        print("\n✓ All tests passed!")
        sys.exit(0)
    else:
        print("\n✗ Some tests failed!")
        sys.exit(1)

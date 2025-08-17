#!/usr/bin/env python3
"""Test script for flash_attn_varlen_func XLA custom call."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import numpy as np
from torch.library import Library, impl
from torch_xla.experimental.custom_kernel import XLA_LIB
from torch.library import register_fake

# Try to import vLLM's flash attention for comparison
try:
    from vllm.vllm_flash_attn import (
        flash_attn_varlen_func as flash_attn_varlen_func_vllm,
    )

    HAS_VLLM = True
except ImportError:
    print("⚠ vLLM flash_attn_varlen_func not available for comparison")
    HAS_VLLM = False


def setup_custom_call():
    """Compile and register the custom call."""
    if not os.path.exists("flash_attn_varlen_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_flash_attn_xla.sh") != 0:
            raise RuntimeError("Compilation failed")

    lib = ctypes.CDLL("./flash_attn_varlen_xla.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(
        lib.flash_attn_varlen_xla_custom_call, ctypes.c_void_p
    ).value

    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)

    torch_xla._XLAC._xla_register_custom_call_target(
        "flash_attn_varlen", capsule, "CUDA"
    )
    print("✓ Custom call registered")


def flash_attn_varlen_impl(
    q: torch.Tensor,  # (total_q, num_heads, head_size)
    k: torch.Tensor,  # (total_k, num_heads_k, head_size)
    v: torch.Tensor,  # (total_k, num_heads_k, head_size)
    cu_seqlens_q: torch.Tensor,  # (batch_size + 1,)
    cu_seqlens_k: torch.Tensor,  # (batch_size + 1,)
    max_seqlen_q: int,
    max_seqlen_k: int,
    softmax_scale: float,
    is_causal: bool = False,
    window_size: tuple[int, int] = (-1, -1),
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
    descriptor_str = f"{batch_size}|{max_seqlen_q}|{max_seqlen_k}|{num_heads}|{num_heads_k}|{head_size}|{total_q}|{total_k}|{softmax_scale}|{int(is_causal)}|{window_size[0]}|{window_size[1]}|{softcap}|{int(has_block_table)}|{int(has_seqused_k)}|{block_size}|{max_blocks_per_seq}"
    descriptor = descriptor_str.encode("utf-8")

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


# Implementation for XLA
def flash_attn_varlen_xla_impl(
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
    return flash_attn_varlen_impl(
        q,
        k,
        v,
        cu_seqlens_q,
        cu_seqlens_k,
        max_seqlen_q,
        max_seqlen_k,
        softmax_scale,
        is_causal,
        (window_left, window_right),
        softcap,
        seqused_k,
        block_table,
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


def test_simple():
    """Test basic flash attention functionality."""
    print("\n" + "=" * 60)
    print("Testing Flash Attention XLA custom call")
    print("=" * 60)

    device = xm.xla_device()

    # Simple test case
    batch_size = 2
    seqlen_q = 4
    seqlen_k = 8
    num_heads = 2
    num_heads_k = num_heads  # Same for simplicity
    head_size = 64

    # Create test data
    total_q = batch_size * seqlen_q
    total_k = batch_size * seqlen_k

    q = torch.randn(total_q, num_heads, head_size, device=device, dtype=torch.float16)
    k = torch.randn(total_k, num_heads_k, head_size, device=device, dtype=torch.float16)
    v = torch.randn(total_k, num_heads_k, head_size, device=device, dtype=torch.float16)

    # Create cumulative sequence lengths
    cu_seqlens_q = torch.tensor(
        [0, seqlen_q, 2 * seqlen_q], dtype=torch.int32, device=device
    )
    cu_seqlens_k = torch.tensor(
        [0, seqlen_k, 2 * seqlen_k], dtype=torch.int32, device=device
    )

    softmax_scale = 1.0 / (head_size**0.5)

    print(f"Input shapes:")
    print(f"  Q: {q.shape}")
    print(f"  K: {k.shape}")
    print(f"  V: {v.shape}")
    print(f"  cu_seqlens_q: {cu_seqlens_q.shape}")
    print(f"  cu_seqlens_k: {cu_seqlens_k.shape}")

    try:
        # Call custom op
        out, softmax_lse = flash_attn_varlen_func_xla(
            q,
            k,
            v,
            cu_seqlens_q,
            cu_seqlens_k,
            seqlen_q,
            seqlen_k,
            softmax_scale,
            None,  # seqused_k
            None,  # block_table
        )

        xm.mark_step()
        xm.wait_device_ops()

        print(f"\nOutput shapes:")
        print(f"  Out: {out.shape}")
        print(f"  Softmax LSE: {softmax_lse.shape}")
        print(f"\n✓ Flash attention test completed successfully")

    except Exception as e:
        print(f"✗ Test failed: {e}")
        import traceback

        traceback.print_exc()


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "=" * 60)
    print("Testing torch.compile with Flash Attention")
    print("=" * 60)

    device = xm.xla_device()

    # Test data
    batch_size = 1
    seqlen = 4
    num_heads = 2
    head_size = 64

    q = torch.randn(seqlen, num_heads, head_size, device=device, dtype=torch.float16)
    k = torch.randn(seqlen, num_heads, head_size, device=device, dtype=torch.float16)
    v = torch.randn(seqlen, num_heads, head_size, device=device, dtype=torch.float16)
    cu_seqlens_q = torch.tensor([0, seqlen], dtype=torch.int32, device=device)
    cu_seqlens_k = torch.tensor([0, seqlen], dtype=torch.int32, device=device)
    softmax_scale = 1.0 / (q.shape[-1] ** 0.5)
    
    torch._dynamo.mark_dynamic(q, 0)
    torch._dynamo.mark_dynamic(k, 0)
    torch._dynamo.mark_dynamic(v, 0)
    torch._dynamo.mark_dynamic(cu_seqlens_q, 1)
    torch._dynamo.mark_dynamic(cu_seqlens_k, 1)
    

    try:
        compiled_flash_attn = torch.compile(
            flash_attn_varlen_func_xla, backend="openxla"
        )
        out, softmax_lse = compiled_flash_attn(
            q,
            k,
            v,
            cu_seqlens_q,
            cu_seqlens_k,
            seqlen,
            seqlen,
            softmax_scale,
            None,  # seqused_k
            None,  # block_table
        )
        xm.mark_step()
        xm.wait_device_ops()

        print(f"✓ torch.compile test completed")
        print(f"  Output shape: {out.shape}")

    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback

        traceback.print_exc()


def test_comparison_with_vllm():
    """Compare XLA custom call results with vLLM's native implementation."""
    print("\n" + "=" * 60)
    print("Comparing XLA custom call with vLLM native implementation")
    print("=" * 60)

    if not HAS_VLLM:
        print("⚠ Skipping comparison test - vLLM not available")
        return

    # Use CUDA device for vLLM comparison
    cuda_device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    xla_device = xm.xla_device()

    # Create test data
    batch_size = 2
    seqlen_q = 8
    seqlen_k = 16
    num_heads = 4
    head_size = 64

    total_q = batch_size * seqlen_q
    total_k = batch_size * seqlen_k

    # Initialize tensors on CUDA for vLLM
    q_cuda = torch.randn(
        total_q, num_heads, head_size, device=cuda_device, dtype=torch.float16
    )
    k_cuda = torch.randn(
        total_k, num_heads, head_size, device=cuda_device, dtype=torch.float16
    )
    v_cuda = torch.randn(
        total_k, num_heads, head_size, device=cuda_device, dtype=torch.float16
    )
    cu_seqlens_q_cuda = torch.tensor(
        [0, seqlen_q, 2 * seqlen_q], dtype=torch.int32, device=cuda_device
    )
    cu_seqlens_k_cuda = torch.tensor(
        [0, seqlen_k, 2 * seqlen_k], dtype=torch.int32, device=cuda_device
    )

    # Clone for XLA
    q_xla = q_cuda.detach().clone().to(xla_device)
    k_xla = k_cuda.detach().clone().to(xla_device)
    v_xla = v_cuda.detach().clone().to(xla_device)
    cu_seqlens_q_xla = cu_seqlens_q_cuda.detach().clone().to(xla_device)
    cu_seqlens_k_xla = cu_seqlens_k_cuda.detach().clone().to(xla_device)

    softmax_scale = 1.0 / (head_size**0.5)

    # Call vLLM's native implementation
    print("\n1. Calling vLLM native implementation...")
    out_vllm = flash_attn_varlen_func_vllm(
        q=q_cuda,
        k=k_cuda,
        v=v_cuda,
        max_seqlen_q=seqlen_q,
        cu_seqlens_q=cu_seqlens_q_cuda,
        max_seqlen_k=seqlen_k,
        cu_seqlens_k=cu_seqlens_k_cuda,
        dropout_p=0.0,
        softmax_scale=softmax_scale,
        causal=True,
        return_softmax_lse=True,
    )

    if isinstance(out_vllm, tuple):
        out_cuda, lse_cuda = out_vllm
    else:
        out_cuda = out_vllm
        lse_cuda = None

    # Call XLA custom call
    print("2. Calling XLA custom call implementation...")

    compiled_flash_attn = torch.compile(flash_attn_varlen_func_xla, backend="openxla")
    out_xla, lse_xla = compiled_flash_attn(
        q_xla,
        k_xla,
        v_xla,
        cu_seqlens_q_xla,
        cu_seqlens_k_xla,
        seqlen_q,
        seqlen_k,
        softmax_scale,
        None,  # seqused_k
        None,  # block_table
    )

    xm.mark_step()
    xm.wait_device_ops()

    # Compare results
    print("\n3. Comparing results...")
    out_xla_cpu = out_xla.cpu()
    out_cuda_cpu = out_cuda.cpu()

    # Calculate differences
    diff = torch.abs(out_xla_cpu - out_cuda_cpu)
    max_diff = diff.max().item()
    mean_diff = diff.mean().item()

    print(f"\nResults:")
    print(f"  Max difference: {max_diff:.6e}")
    print(f"  Mean difference: {mean_diff:.6e}")

    # Check if results are close enough
    tolerance = 1e-2  # Relaxed tolerance for fp16
    if max_diff < tolerance:
        print(f"\n✅ Results match! XLA custom call produces similar output as vLLM")
    else:
        print(f"\n⚠ Results differ beyond tolerance ({tolerance})")

        # Show some actual values
        print("\nSample values (first 5 elements):")
        print(f"  vLLM: {out_cuda_cpu.flatten()[:5]}")
        print(f"  XLA:  {out_xla_cpu.flatten()[:5]}")


def test_with_block_table():
    """Test flash attention with block_table (paged attention)."""
    print("\n" + "=" * 60)
    print("Testing Flash Attention with block_table (Paged Attention)")
    print("=" * 60)

    if not HAS_VLLM:
        print("⚠ Skipping block_table test - vLLM not available")
        return

    # Use CUDA device for vLLM comparison
    cuda_device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    xla_device = xm.xla_device()

    # Paged attention configuration
    batch_size = 2
    seqlen_q = 4
    seqlen_k = 32  # Longer K sequence for paged attention
    num_heads = 4
    num_heads_k = num_heads  # Same for simplicity
    head_size = 64
    block_size = (
        16  # Each block holds 16 tokens (must be divisible by 16 for flash attention)
    )
    num_blocks_per_seq = (
        seqlen_k + block_size - 1
    ) // block_size  # 2 blocks for seqlen_k=32
    total_blocks = batch_size * num_blocks_per_seq  # Total blocks needed

    total_q = batch_size * seqlen_q
    # For paged KV, K and V are stored in blocks
    # Shape: (num_blocks, block_size, num_heads_k, head_size)

    print(f"Paged Attention Configuration:")
    print(f"  Batch size: {batch_size}")
    print(f"  Seq lengths: q={seqlen_q}, k={seqlen_k}")
    print(f"  Block size: {block_size}, Blocks per seq: {num_blocks_per_seq}")
    print(f"  Total blocks: {total_blocks}")
    print(f"  Heads: {num_heads}, Head size: {head_size}")

    # Initialize tensors on CUDA for vLLM
    torch.manual_seed(42)  # For reproducibility

    # Query tensor - normal layout
    q_cuda = torch.randn(
        total_q, num_heads, head_size, device=cuda_device, dtype=torch.float16
    )

    # For paged KV cache, we need to create block-structured K and V
    # Shape: (num_blocks, block_size, num_heads_k, head_size)
    k_cache_cuda = torch.randn(
        total_blocks,
        block_size,
        num_heads_k,
        head_size,
        device=cuda_device,
        dtype=torch.float16,
    )
    v_cache_cuda = torch.randn(
        total_blocks,
        block_size,
        num_heads_k,
        head_size,
        device=cuda_device,
        dtype=torch.float16,
    )

    # Block table maps logical positions to physical blocks
    # Shape: (batch_size, max_num_blocks_per_seq)
    block_table_cuda = torch.zeros(
        batch_size, num_blocks_per_seq, dtype=torch.int32, device=cuda_device
    )
    # Assign blocks sequentially for simplicity
    for i in range(batch_size):
        for j in range(num_blocks_per_seq):
            block_table_cuda[i, j] = i * num_blocks_per_seq + j

    cu_seqlens_q_cuda = torch.tensor(
        [0, seqlen_q, 2 * seqlen_q], dtype=torch.int32, device=cuda_device
    )
    cu_seqlens_k_cuda = torch.tensor(
        [0, seqlen_k, 2 * seqlen_k], dtype=torch.int32, device=cuda_device
    )

    # Create seqused_k to indicate actual sequence lengths
    seqused_k_cuda = torch.tensor(
        [seqlen_k, seqlen_k], dtype=torch.int32, device=cuda_device
    )

    # Clone for XLA
    q_xla = q_cuda.detach().clone().to(xla_device)
    k_cache_xla = k_cache_cuda.detach().clone().to(xla_device)
    v_cache_xla = v_cache_cuda.detach().clone().to(xla_device)
    block_table_xla = block_table_cuda.detach().clone().to(xla_device)
    cu_seqlens_q_xla = cu_seqlens_q_cuda.detach().clone().to(xla_device)
    cu_seqlens_k_xla = cu_seqlens_k_cuda.detach().clone().to(xla_device)
    seqused_k_xla = seqused_k_cuda.detach().clone().to(xla_device)

    softmax_scale = 1.0 / (head_size**0.5)

    # Call vLLM's native implementation with paged KV
    print("\n1. Calling vLLM native implementation with block_table...")
    try:
        out_vllm = flash_attn_varlen_func_vllm(
            q=q_cuda,
            k=k_cache_cuda,  # Paged K cache
            v=v_cache_cuda,  # Paged V cache
            max_seqlen_q=seqlen_q,
            cu_seqlens_q=cu_seqlens_q_cuda,
            max_seqlen_k=seqlen_k,
            cu_seqlens_k=None,  # Not used with seqused_k
            seqused_k=seqused_k_cuda,  # Actual sequence lengths
            dropout_p=0.0,
            softmax_scale=softmax_scale,
            causal=True,
            block_table=block_table_cuda,  # Block table for paged attention
            return_softmax_lse=False,
        )

        if isinstance(out_vllm, tuple):
            out_cuda = out_vllm[0]
        else:
            out_cuda = out_vllm

        print(f"  vLLM output shape: {out_cuda.shape}")
        print(f"  vLLM output dtype: {out_cuda.dtype}")

    except Exception as e:
        print(f"  vLLM call failed: {e}")
        import traceback

        traceback.print_exc()
        return

    # Call XLA custom call with block_table
    print("\n2. Calling XLA custom call implementation with block_table...")

    try:
        compiled_flash_attn = torch.compile(
            flash_attn_varlen_func_xla, backend="openxla"
        )
        out_xla, softmax_lse = compiled_flash_attn(
            q_xla,
            k_cache_xla,
            v_cache_xla,
            cu_seqlens_q_xla,
            cu_seqlens_k_xla,
            seqlen_q,
            seqlen_k,
            softmax_scale,
            seqused_k_xla,  # seqused_k
            block_table_xla,  # block_table
        )
        xm.mark_step()
        xm.wait_device_ops()

        print(f"  XLA output shape: {out_xla.shape}")
        print(f"  XLA output dtype: {out_xla.dtype}")

    except Exception as e:
        print(f"  XLA call failed: {e}")
        import traceback

        traceback.print_exc()
        return

    # Compare results
    print("\n3. Comparing results...")
    out_xla_cpu = out_xla.cpu().float()
    out_cuda_cpu = out_cuda.cpu().float()

    # Calculate differences
    diff = torch.abs(out_xla_cpu - out_cuda_cpu)
    max_diff = diff.max().item()
    mean_diff = diff.mean().item()
    rel_error = (diff / (torch.abs(out_cuda_cpu) + 1e-6)).mean().item()

    print(f"\nResults:")
    print(f"  Max absolute difference: {max_diff:.6e}")
    print(f"  Mean absolute difference: {mean_diff:.6e}")
    print(f"  Mean relative error: {rel_error:.6e}")

    # Show some actual values for debugging
    print(f"\nSample values (first 5 elements):")
    print(f"  vLLM: {out_cuda_cpu.flatten()[:5].tolist()}")
    print(f"  XLA:  {out_xla_cpu.flatten()[:5].tolist()}")

    # Check if results are close enough
    tolerance = 1e-2  # Relaxed tolerance for fp16
    if max_diff < tolerance:
        print(f"\n✅ Block table test passed! XLA produces similar output as vLLM")
    else:
        print(f"\n⚠ Block table test: Results differ beyond tolerance ({tolerance})")

        # Additional debugging
        print(f"\nDetailed comparison (first sequence, first head):")
        vllm_slice = out_cuda_cpu[:seqlen_q, 0, :8]  # First 8 elements
        xla_slice = out_xla_cpu[:seqlen_q, 0, :8]
        print(f"  vLLM: {vllm_slice.flatten().tolist()}")
        print(f"  XLA:  {xla_slice.flatten().tolist()}")


def main():
    print("=" * 60)
    print("Flash Attention XLA Custom Call Test")
    print("=" * 60)
    print("\nThis test:")
    print("1. Registers flash_attn_varlen as XLA custom call")
    print("2. Tests basic functionality")
    print("3. Tests torch.compile compatibility")
    print("4. Compares with vLLM implementation (if available)")
    print("5. Tests paged attention with block_table")

    # Setup
    setup_custom_call()

    # Run tests
    test_simple()
    test_torch_compile()
    test_comparison_with_vllm()
    test_with_block_table()  # New test for paged attention

    print("\n" + "=" * 60)
    print("✅ All tests completed!")
    print("=" * 60)


if __name__ == "__main__":
    main()

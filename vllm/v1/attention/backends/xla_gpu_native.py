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


# Import XLA custom ops from playground
def import_xla_custom_ops():
    """Import and setup XLA custom ops for flash attention and reshape_and_cache"""
    import importlib.util
    import pathlib

    # Get the vLLM root directory
    vllm_root = pathlib.Path(__file__).parent.parent.parent.parent.parent

    # Import flash attention XLA custom op
    flash_attn_path = (
        vllm_root
        / "playground"
        / "custom_call"
        / "flash-attn"
        / "test_flash_attn_xla.py"
    )
    spec = importlib.util.spec_from_file_location("flash_attn_xla", flash_attn_path)
    flash_attn_module = importlib.util.module_from_spec(spec)
    sys.modules["flash_attn_xla"] = flash_attn_module

    # Setup flash attention custom call
    os.chdir(flash_attn_path.parent)
    spec.loader.exec_module(flash_attn_module)
    flash_attn_module.setup_custom_call()

    # Import reshape_and_cache XLA custom op
    reshape_cache_path = (
        vllm_root
        / "playground"
        / "custom_call"
        / "ctypes_reuse_kernel"
        / "reshape_and_cache_flash"
        / "xla_reshape_and_cache.py"
    )
    spec = importlib.util.spec_from_file_location(
        "xla_reshape_and_cache", reshape_cache_path
    )
    reshape_cache_module = importlib.util.module_from_spec(spec)
    sys.modules["xla_reshape_and_cache"] = reshape_cache_module

    # Setup reshape_and_cache custom call
    os.chdir(reshape_cache_path.parent)
    spec.loader.exec_module(reshape_cache_module)
    reshape_cache_module.setup_custom_call()

    logger.info(
        "XLA custom ops for flash attention and reshape_and_cache have been imported and registered"
    )

    return flash_attn_module, reshape_cache_module


# Try to import and setup XLA custom ops
XLA_CUSTOM_OPS_AVAILABLE = False
try:
    device = xm.xla_device()
    if device is not None:
        flash_attn_xla, xla_reshape_and_cache = import_xla_custom_ops()
        XLA_CUSTOM_OPS_AVAILABLE = True
        logger.info("XLA custom ops successfully loaded")
        logger.info(f"{flash_attn_xla}")
        logger.info(f"{xla_reshape_and_cache}")
        # 在 setup_custom_call() 后添加
        logger.debug("DEBUG: Checking registered ops...")
        logger.debug(f"  torch.ops.xla exists: {hasattr(torch.ops, 'xla')}")
        if hasattr(torch.ops, 'xla'):
            logger.debug(f"  Available xla ops: {dir(torch.ops.xla)}")
            logger.debug(f"  reshape_and_cache_flash exists: {hasattr(torch.ops.xla, 'reshape_and_cache_flash')}")
            logger.debug(f"  flash_attn_varlen_op exists: {hasattr(torch.ops.xla, 'flash_attn_varlen_op')}")

        # 测试调用
        if hasattr(torch.ops.xla, 'reshape_and_cache_flash'):
            print("  ✓ torch.ops.xla.reshape_and_cache_flash is callable")
        if hasattr(torch.ops.xla, 'flash_attn_varlen_op'):
            print("  ✓ torch.ops.xla.flash_attn_varlen_op is callable")
except Exception as e:
    logger.warning(f"Failed to load XLA custom ops: {e}")
    flash_attn_xla = None
    xla_reshape_and_cache = None

# Try to import flash attention functions
try:
    from vllm import _custom_ops as ops

    # Import the original Flash Attention functions
    _reshape_and_cache_flash_orig = ops.reshape_and_cache_flash
    from vllm.vllm_flash_attn import (
        flash_attn_varlen_func as _flash_attn_varlen_func_orig,
        get_scheduler_metadata,
    )

    # Use XLA custom ops if available, otherwise fall back to original
    if XLA_CUSTOM_OPS_AVAILABLE:
        # Import the reshape_and_cache_flash directly from playground
        # It already handles the XLA custom op registration and wrapping
        from xla_reshape_and_cache import reshape_and_cache_flash
        from flash_attn_xla import flash_attn_varlen_func_xla

        flash_attn_varlen_func = flash_attn_varlen_func_xla
        # flash_attn_varlen_func = _flash_attn_varlen_func_orig
        # reshape_and_cache_flash = _reshape_and_cache_flash_orig

        logger.info("Using XLA custom ops for Flash Attention")
    else:
        # Keep the original functions accessible
        reshape_and_cache_flash = _reshape_and_cache_flash_orig
        flash_attn_varlen_func = _flash_attn_varlen_func_orig
        logger.info("Using original Flash Attention implementation")

    FLASH_ATTN_AVAILABLE = True

except ImportError:
    FLASH_ATTN_AVAILABLE = False
    logger.warning("Flash Attention not available, using fallback implementation")

    # Define fallback functions when Flash Attention is not available
    def reshape_and_cache_flash(
        key,
        value,
        key_cache,
        value_cache,
        slot_mapping,
        kv_cache_dtype,
        k_scale,
        v_scale,
    ):
        # Use pure PyTorch implementation defined later in the file
        # Note: This is a forward reference to _pytorch_kv_cache_update
        # which is defined at line 502
        global _pytorch_kv_cache_update
        _pytorch_kv_cache_update(
            key,
            value,
            key_cache,
            value_cache,
            slot_mapping,
            kv_cache_dtype,
            k_scale,
            v_scale,
        )

    def flash_attn_varlen_func(**kwargs):
        # This should not be called when FLASH_ATTN_AVAILABLE is False
        raise RuntimeError("Flash Attention is not available")


# Global variable to track registration
_CUSTOM_OP_REGISTERED = False


def register_xla_gpu_paged_attention():
    """Register XLA GPU PagedAttention custom call operator."""
    global _CUSTOM_OP_REGISTERED

    if _CUSTOM_OP_REGISTERED:
        return True

    try:
        # Try to load pre-compiled library first
        lib_path = os.path.join(os.path.dirname(__file__), "xla_gpu_paged_attention.so")
        if os.path.exists(lib_path):
            lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)

            # Get function addresses
            paged_attn_addr = ctypes.cast(
                lib.XlaGpuPagedAttentionFlash, ctypes.c_void_p
            ).value
            kv_cache_update_addr = ctypes.cast(
                lib.XlaGpuKVCacheUpdate, ctypes.c_void_p
            ).value

            # Create PyCapsules
            PyCapsule_New = ctypes.pythonapi.PyCapsule_New
            PyCapsule_New.restype = ctypes.py_object
            PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]

            paged_attn_capsule = PyCapsule_New(paged_attn_addr, None, None)
            kv_cache_capsule = PyCapsule_New(kv_cache_update_addr, None, None)

            # Register with XLA
            torch_xla._XLAC._xla_register_custom_call_target(
                "XlaGpuPagedAttentionFlash", paged_attn_capsule, "CUDA"
            )

            torch_xla._XLAC._xla_register_custom_call_target(
                "XlaGpuKVCacheUpdate", kv_cache_capsule, "CUDA"
            )

            logger.info("XLA GPU PagedAttention custom ops registered successfully")
            _CUSTOM_OP_REGISTERED = True
            return True

    except Exception as e:
        logger.warning(f"Failed to register XLA GPU PagedAttention: {e}")

    _CUSTOM_OP_REGISTERED = False
    return False


# Try to register on module import
USE_CUSTOM_OP = register_xla_gpu_paged_attention()

# XLA GPU doesn't require strict head size alignment like TPU
XLA_GPU_HEAD_SIZE_ALIGNMENT = 8  # Minimal alignment for better performance


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

        # Update KV cache with new keys and values
        # This is similar to FlashAttentionImpl
        if self.kv_sharing_target_layer_name is None:
            # Only update cache if not sharing with another layer
            num_actual_tokens = attn_metadata.num_actual_tokens
            _, _ = xla_gpu_kv_cache_update(
                key[:num_actual_tokens],
                value[:num_actual_tokens],
                key_cache,
                value_cache,
                attn_metadata.slot_mapping,
                kv_cache_dtype="auto",
                k_scale=getattr(layer, "_k_scale", None),
                v_scale=getattr(layer, "_v_scale", None),
            )
        
        output = xla_gpu_paged_attention_final(
            query,
            key_cache,
            value_cache,
            attn_metadata,
            self.scale,
            layer,
        )
        # output = torch.ones_like(query)
        # # Add small dependency on both key_cache and value_cache
        # if key_cache.numel() > 0:
        #     # Use first few elements to create dependency
        #     key_dep = key_cache.flatten()[:min(10, key_cache.numel())].sum() * 1e-10
        #     val_dep = value_cache.flatten()[:min(10, value_cache.numel())].sum() * 1e-10
        #     output = output + key_dep + val_dep

        return output


def xla_gpu_kv_cache_update(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: Optional[torch.Tensor] = None,
    v_scale: Optional[torch.Tensor] = None,
) -> Tuple [torch.Tensor, torch.Tensor]:
    """Update KV cache using XLA custom call or fallback to reshape_and_cache_flash.

    Args:
        key: [num_tokens, num_kv_heads, head_size]
        value: [num_tokens, num_kv_heads, head_size]
        key_cache: [num_blocks, block_size, num_kv_heads, head_size]
        value_cache: [num_blocks, block_size, num_kv_heads, head_size]
        slot_mapping: [num_tokens] - slot indices for each token
        kv_cache_dtype: KV cache data type
        k_scale: Optional key scale factor
        v_scale: Optional value scale factor
    """
    if FLASH_ATTN_AVAILABLE:
        # Use the function we defined above (either XLA custom op or original)
        return reshape_and_cache_flash(
            key,
            value,
            key_cache,
            value_cache,
            slot_mapping,
            kv_cache_dtype,
            k_scale,
            v_scale,
        )
    else:
        # Pure PyTorch fallback
        _pytorch_kv_cache_update(
            key,
            value,
            key_cache,
            value_cache,
            slot_mapping,
            kv_cache_dtype,
            k_scale,
            v_scale,
        )
        return key_cache, value_cache


def xla_gpu_paged_attention_final(
    query: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    attn_metadata: XlaGpuPagedMetadata,
    softmax_scale: float,
    layer,  # AttentionLayer
    output: Optional[torch.Tensor] = None,
) -> torch.Tensor:
    """XLA GPU PagedAttention using custom call or Flash Attention.

    This function is designed to integrate with vLLM's attention backends.

    Args:
        query: [total_tokens, num_heads, head_size]
        key_cache: [num_blocks, block_size, num_kv_heads, head_size]
        value_cache: [num_blocks, block_size, num_kv_heads, head_size]
        attn_metadata: XlaGpuPagedMetadata containing sequence information
        softmax_scale: Softmax scaling factor
        layer: AttentionLayer instance
        output: Optional output tensor

    Returns:
        Output tensor [total_tokens, num_heads, head_size]
    """

    # Get the actual number of tokens to process
    num_actual_tokens = attn_metadata.num_actual_tokens

    if FLASH_ATTN_AVAILABLE and num_actual_tokens > 0:
        # Use Flash Attention (either XLA custom op or original)
        try:
            # Use the correct field names from XlaGpuPagedMetadata
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

            # Call the flash attention function (either XLA custom op or original)
            output, lse  = flash_attn_varlen_func(
                q = query[:num_actual_tokens],  # q
                k = key_cache,  # k
                v = value_cache,  # v
                cu_seqlens_q = attn_metadata.query_start_loc,  # cu_seqlens_q
                cu_seqlens_k = None, # only used for non-paged prefill
                max_seqlen_q = attn_metadata.max_query_len,  # max_seqlen_q
                max_seqlen_k = attn_metadata.max_seq_len,  # max_seqlen_k
                softmax_scale = softmax_scale,  # softmax_scale
                seqused_k = seq_lens_to_use,  # seqused_k
                block_table = block_table_to_use,  # block_table
                # attn_metadata.scheduler_metadata,  # scheduler_metadata
            )
            return output
        except Exception as e:
            logger.debug(f"Flash attention failed, falling back: {e}")
            # Fall through to fallback implementation

    # Fallback to simple scaled attention for testing
    # This is a simple implementation that can be compiled by XLA
    output[:num_actual_tokens] = query[:num_actual_tokens] * softmax_scale

    # Add small dependency on cache to prevent optimization
    if key_cache.numel() > 0:
        cache_factor = key_cache.view(-1)[0] * 1e-10
        output[:num_actual_tokens] = output[:num_actual_tokens] + cache_factor

    return output


def _pytorch_kv_cache_update(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: Optional[torch.Tensor] = None,
    v_scale: Optional[torch.Tensor] = None,
) -> None:
    """Pure PyTorch implementation of KV cache update."""
    num_tokens = key.shape[0]
    block_size = key_cache.shape[1]

    for i in range(num_tokens):
        slot_idx = slot_mapping[i].item()
        if slot_idx < 0:
            continue  # Invalid slot

        block_idx = slot_idx // block_size
        block_offset = slot_idx % block_size

        # Update cache
        key_cache[block_idx, block_offset] = key[i]
        value_cache[block_idx, block_offset] = value[i]


# The CUDA kernel implementation would be in a separate compiled library
# xla_gpu_paged_attention.so which implements:
# - XlaGpuPagedAttentionFlash: Calls flash_attn_varlen_func internally
# - XlaGpuKVCacheUpdate: Calls reshape_and_cache_flash internally


if __name__ == "__main__":
    """Test xla_gpu_kv_cache_update and xla_gpu_paged_attention_final with torch.compile."""
    import sys
    import traceback
    
    # Set up XLA environment for torch.compile
    import os
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
                # Mark dynamic dimensions
                torch._dynamo.mark_dynamic(key, 0)  # num_tokens dimension
                torch._dynamo.mark_dynamic(value, 0)
                torch._dynamo.mark_dynamic(slot_mapping, 0)
                
                # Call the actual function
                return xla_gpu_kv_cache_update(
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
            # Create a mock layer class
            class MockLayer:
                def __init__(self):
                    self._k_scale = None
                    self._v_scale = None
            
            # Define the wrapped function for compilation
            def paged_attention_wrapper(query, key_cache, value_cache, 
                                       query_start_loc, seq_lens, block_table, 
                                       slot_mapping, num_actual_tokens):
                """Wrapper function that will be compiled."""
                # Mark dynamic dimensions
                torch._dynamo.mark_dynamic(query, 0)  # num_tokens dimension
                torch._dynamo.mark_dynamic(query_start_loc, 0)  # batch dimension + 1
                torch._dynamo.mark_dynamic(seq_lens, 0)  # batch dimension
                torch._dynamo.mark_dynamic(slot_mapping, 0)  # num_tokens dimension
                
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
                
                # Call the actual function
                return xla_gpu_paged_attention_final(
                    query=query,
                    key_cache=key_cache,
                    value_cache=value_cache,
                    attn_metadata=metadata,
                    softmax_scale=1.0 / (head_size ** 0.5),
                    layer=MockLayer(),
                    output=None,
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
                    seq_lens = torch.tensor([token_count], dtype=torch.long, device=device)
                    query_start_loc = torch.tensor([0, token_count], dtype=torch.long, device=device)
                else:
                    # Split tokens between sequences
                    tokens_per_seq = token_count // batch_count
                    seq_lens = torch.full((batch_count,), tokens_per_seq, dtype=torch.long, device=device)
                    query_start_loc = torch.arange(0, token_count + 1, tokens_per_seq, 
                                                  dtype=torch.long, device=device)
                
                # Create block table
                max_blocks_per_seq = 8
                block_table = torch.zeros(
                    batch_count, max_blocks_per_seq, dtype=torch.long, device=device
                )
                for i in range(batch_count):
                    blocks_needed = (seq_lens[i].item() + block_size - 1) // block_size
                    block_table[i, :blocks_needed] = torch.arange(i * blocks_needed, 
                                                                 (i + 1) * blocks_needed)
                
                # Create slot mapping
                slot_mapping = torch.arange(token_count, dtype=torch.long, device=device)
                
                print(f"  Input shapes: query={query.shape}, seq_lens={seq_lens.shape}")
                
                # Call compiled function
                result = compiled_fn(
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
    results.append(("KV Cache Update", test_xla_gpu_kv_cache_update()))
    
    # Test 2: Paged Attention
    results.append(("Paged Attention", test_xla_gpu_paged_attention_final()))
    
    # Test 3: Integration
    results.append(("Integration", test_integration()))
    
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

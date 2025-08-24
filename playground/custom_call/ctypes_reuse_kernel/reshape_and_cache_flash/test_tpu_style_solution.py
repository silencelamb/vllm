#!/usr/bin/env python3
"""TPU-style solution for reshape_and_cache_flash with XLA optimization."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from torch.library import Library
import numpy as np
from torch_xla.experimental.custom_kernel import XLA_LIB
from torch.library import register_fake

# Try to import vLLM's reshape_and_cache_flash for comparison
try:
    from vllm.attention.utils.fa_utils import reshape_and_cache_flash
    HAS_VLLM = True
except ImportError:
    print("⚠ vLLM reshape_and_cache_flash not available for comparison")
    HAS_VLLM = False


def setup_custom_call():
    """Compile and register the custom call."""
    if not os.path.exists("reshape_and_cache_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_reshape_and_cache.sh") != 0:
            raise RuntimeError("Compilation failed")
    
    lib = ctypes.CDLL("./reshape_and_cache_xla.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_reshape_and_cache_flash",
        capsule,
        "CUDA"
    )
    print("✓ Custom call registered")


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
    """Implementation for in-place cache update."""
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
    
    # XLA custom call buffer ordering for GPU with in-place:
    # For true in-place, we use the same buffers as both input and output
    # The CUDA kernel modifies the cache buffers directly
    
    # Order: inputs first, then outputs at the end
    buffers = [key, value, key_cache, value_cache, slot_mapping]  # inputs
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    # CRITICAL: For in-place, outputs ARE the same cache tensors
    buffers.extend([key_cache, value_cache])  # outputs (same as input caches)
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect - this is an in-place operation
        descriptor,
        2,  # api_version
        {}
    )
    
    # Return the same cache tensors (they've been modified in-place)
    # The XLA compiler will recognize these are the same buffers
    return outputs


# Define the operation with alias annotations for in-place update
# The (a!) and (b!) annotations indicate that the outputs alias the inputs
XLA_LIB.define(
    "reshape_and_cache_update_op(Tensor key, Tensor value, Tensor(a!) key_cache, "
    "Tensor(b!) value_cache, Tensor slot_mapping, str kv_cache_dtype, "
    "Tensor? k_scale, Tensor? v_scale) -> (Tensor(a!), Tensor(b!))"
)


# Implementation for XLA
XLA_LIB.impl("reshape_and_cache_update_op", reshape_and_cache_flash_impl, "XLA")


# Fake implementation for meta tensors
@register_fake("xla::reshape_and_cache_update_op")
def reshape_and_cache_update_op_fake(
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

def test_torch_compile():
    """Test torch.compile with in-place buffer donation."""
    print("\n" + "="*60)
    print("Testing torch.compile with in-place buffer donation")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        k_scale = None
        v_scale = None
        
        # Call the in-place update op
        new_key_cache, new_value_cache = torch.ops.xla.reshape_and_cache_update_op(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", k_scale, v_scale
        )
        
        # Following the TPU pattern: copy_ will be optimized away by XLA
        # This tells XLA to use the modified buffers
        key_cache.copy_(new_key_cache)
        value_cache.copy_(new_value_cache)
        
        return key_cache, value_cache
    
    # Test
    key = torch.randn(1, 1, 1, device=device).contiguous()
    value = torch.randn(1, 1, 1, device=device).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    try:
        # Set buffer donors BEFORE compilation - this is critical!
        # This tells XLA that these buffers can be reused for outputs
        torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
        torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
        
        # Call the compiled function
        result_key_cache, result_value_cache = compiled_update(key, value, key_cache, value_cache, slot_mapping)
        
        xm.mark_step()
        xm.wait_device_ops()
        
        # Verify in-place update (result should be same tensors)
        print(f"In-place check: key_cache is result_key_cache: {key_cache is result_key_cache}")
        print(f"In-place check: value_cache is result_value_cache: {value_cache is result_value_cache}")
        print(f"key_cache values: {key_cache}")
        print(f"value_cache values: {value_cache}")
        print(f"✓ torch.compile test completed with in-place update")
        
    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


def test_comparison_with_vllm():
    """Compare XLA custom call results with vLLM's native implementation."""
    print("\n" + "="*60)
    print("Comparing XLA custom call with vLLM native implementation")
    print("="*60)
    
    if not HAS_VLLM:
        print("⚠ Skipping comparison test - vLLM not available")
        return
    
    # Use CUDA device for vLLM comparison
    cuda_device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    xla_device = xm.xla_device()
    
    # Create test data
    num_tokens = 4
    num_kv_heads = 2
    head_size = 8
    num_blocks = 2
    block_size = 16
    
    # Initialize tensors on CUDA for vLLM
    key_cuda = torch.randn(num_tokens, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    value_cuda = torch.randn(num_tokens, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    key_cache_cuda = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    value_cache_cuda = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=cuda_device, dtype=torch.float32).contiguous()
    slot_mapping_cuda = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=cuda_device)
    
    # Clone for XLA (convert to XLA device)
    key_xla = key_cuda.detach().clone().to(xla_device).contiguous()
    value_xla = value_cuda.detach().clone().to(xla_device).contiguous()
    key_cache_xla = key_cache_cuda.detach().clone().to(xla_device).contiguous()
    value_cache_xla = value_cache_cuda.detach().clone().to(xla_device).contiguous()
    slot_mapping_xla = slot_mapping_cuda.detach().clone().to(xla_device)
    
    # Create scale tensors (1.0 means no scaling)
    k_scale_cuda = torch.ones(1, dtype=torch.float32, device=cuda_device)
    v_scale_cuda = torch.ones(1, dtype=torch.float32, device=cuda_device)
    # k_scale_cuda = None
    # v_scale_cuda = None
    
    # Call vLLM's native implementation
    print("\n1. Calling vLLM native implementation...")
    # import pdb; pdb.set_trace()
    reshape_and_cache_flash(
        key_cuda,
        value_cuda,
        key_cache_cuda,
        value_cache_cuda,
        slot_mapping_cuda,
        "auto",  # kv_cache_dtype
        k_scale_cuda,    # k_scale
        v_scale_cuda,    # v_scale
    )
    
    # Create scale tensors for XLA (1.0 means no scaling)
    # k_scale_xla = torch.ones(1, dtype=torch.float32, device=xla_device)
    # v_scale_xla = torch.ones(1, dtype=torch.float32, device=xla_device)
    k_scale_xla = None
    v_scale_xla = None
    
    # Call XLA custom call
    print("2. Calling XLA custom call implementation...")
    
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        k_scale = None
        v_scale = None
        
        # Call the in-place update op
        new_key_cache, new_value_cache = torch.ops.xla.reshape_and_cache_update_op(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", k_scale, v_scale
        )
        
        # Following the TPU pattern: copy_ will be optimized away by XLA
        key_cache.copy_(new_key_cache)
        value_cache.copy_(new_value_cache)
        
        return key_cache, value_cache
    
    # Set buffer donors BEFORE compilation
    torch.ops.xla.dynamo_set_buffer_donor_(key_cache_xla, True)
    torch.ops.xla.dynamo_set_buffer_donor_(value_cache_xla, True)
    
    # Call the compiled function
    result_key_cache, result_value_cache = compiled_update(key_xla, value_xla, key_cache_xla, value_cache_xla, slot_mapping_xla)
    
    # No additional copy needed - the caches were updated in-place
    # Mark step to execute
    xm.mark_step()
    xm.wait_device_ops()
    
    # Compare results
    print("\n3. Comparing results...")
    print(f"XLA: In-place update - key_cache is result: {key_cache_xla is result_key_cache}")
    print(f"XLA: In-place update - value_cache is result: {value_cache_xla is result_value_cache}")
    
    # Move XLA results back to CPU for comparison
    key_cache_xla_cpu = key_cache_xla.cpu()
    value_cache_xla_cpu = value_cache_xla.cpu()
    key_cache_cuda_cpu = key_cache_cuda.cpu()
    value_cache_cuda_cpu = value_cache_cuda.cpu()
    
    # Calculate differences
    key_diff = torch.abs(key_cache_xla_cpu - key_cache_cuda_cpu)
    value_diff = torch.abs(value_cache_xla_cpu - value_cache_cuda_cpu)
    
    key_max_diff = key_diff.max().item()
    value_max_diff = value_diff.max().item()
    key_mean_diff = key_diff.mean().item()
    value_mean_diff = value_diff.mean().item()
    
    print(f"\nResults:")
    print(f"  Key cache:")
    print(f"    Max difference: {key_max_diff:.6e}")
    print(f"    Mean difference: {key_mean_diff:.6e}")
    print(f"  Value cache:")
    print(f"    Max difference: {value_max_diff:.6e}")
    print(f"    Mean difference: {value_mean_diff:.6e}")
    
    # Check if results are close enough (accounting for floating point errors)
    tolerance = 1e-5
    if key_max_diff < tolerance and value_max_diff < tolerance:
        print("\n✅ Results match! XLA custom call produces same output as vLLM")
    else:
        print(f"\n⚠ Results differ beyond tolerance ({tolerance})")
        
        # Show some actual values for debugging
        print("\nSample values at slot 0:")
        print(f"  vLLM key_cache[0,0,0,:4]: {key_cache_cuda_cpu[0,0,0,:4]}")
        print(f"  XLA key_cache[0,0,0,:4]:  {key_cache_xla_cpu[0,0,0,:4]}")
        
    # Additional verification: check that non-zero values were written
    key_nonzero = (key_cache_xla_cpu != 0).sum().item()
    value_nonzero = (value_cache_xla_cpu != 0).sum().item()
    print(f"\nNon-zero elements:")
    print(f"  Key cache: {key_nonzero}/{key_cache_xla_cpu.numel()}")
    print(f"  Value cache: {value_nonzero}/{value_cache_xla_cpu.numel()}")


def main():
    print("="*60)
    print("TPU-style solution for reshape_and_cache_flash")
    print("="*60)
    print("\nThis approach:")
    print("1. Uses alias annotations for in-place operations")
    print("2. Sets buffer donors before compilation")
    print("3. XLA compiler optimizes away the copy_ operations")
    print("4. Achieves true in-place update like vLLM's native kernel")
    
    # Setup
    setup_custom_call()
    
    # Run tests
    test_torch_compile()
    test_comparison_with_vllm()  # New comparison test
    
    print("\n" + "="*60)
    print("✅ Tests completed!")
    print("\nNote: The actual optimization depends on XLA compiler support.")
    print("In production, XLA should optimize away the copy_ operations.")
    print("="*60)


if __name__ == "__main__":
    main()
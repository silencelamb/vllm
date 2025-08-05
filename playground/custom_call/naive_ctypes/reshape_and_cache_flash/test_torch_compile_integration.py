#!/usr/bin/env python3
"""Test torch.compile integration with reshape_and_cache_flash custom call."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from vllm.utils import direct_register_custom_op


# First ensure the library is compiled and registered
def setup_custom_call():
    """Compile and register the custom call."""
    # Compile if needed
    if not os.path.exists("reshape_and_cache_flash_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_reshape_and_cache.sh") != 0:
            raise RuntimeError("Compilation failed")
    
    # Load and register
    lib = ctypes.CDLL("./reshape_and_cache_flash_xla.so", ctypes.RTLD_GLOBAL)
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


def xla_reshape_and_cache_flash_impl(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Implementation that calls XLA custom call."""
    device = key.device
    
    # Extract dimensions
    num_tokens = key.shape[0]
    num_kv_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]
    
    # Map dtype string to integer
    dtype_map = {"auto": 0, "float32": 0, "float16": 1, "bfloat16": 2}
    kv_cache_dtype_int = dtype_map.get(kv_cache_dtype, 0)
    
    # Check if scales are provided
    has_k_scale = k_scale is not None
    has_v_scale = v_scale is not None
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        kv_cache_dtype_int,
        1 if has_k_scale else 0,  # Convert bool to int
        1 if has_v_scale else 0   # Convert bool to int
    )
    
    # Prepare buffers
    buffers = [key_cache, value_cache, key, value, slot_mapping]
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        False,  # has_side_effect
        descriptor,
        2,  # num_outputs
        {}  # backend_config
    )
    
    # Return the modified caches (avoiding alias annotations)
    # We return clones to avoid sharing storage with inputs
    return outputs[0].clone(), outputs[1].clone()


def xla_reshape_and_cache_flash_fake(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Fake implementation for torch.compile."""
    # Return clones to match the real implementation signature
    return key_cache.clone(), value_cache.clone()


def test_basic_functionality():
    """Test basic reshape_and_cache functionality."""
    print("\n" + "="*60)
    print("Testing basic reshape_and_cache_flash functionality")
    print("="*60)
    
    device = xm.xla_device()
    
    # Test parameters
    num_tokens = 4
    num_kv_heads = 2
    head_size = 8
    block_size = 16
    num_blocks = 2
    
    # Create test tensors
    key = torch.randn(num_tokens, num_kv_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_kv_heads, head_size, device=device)
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    # Call the custom op - it now returns the modified caches
    key_cache_out, value_cache_out = torch.ops.vllm.xla_reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    # Verify caches were updated
    print("✓ Basic test completed successfully")
    
    # Check that some values were written
    non_zero_key = (key_cache_out != 0).any().item()
    non_zero_value = (value_cache_out != 0).any().item()
    
    if non_zero_key and non_zero_value:
        print("✓ Caches were updated")
    else:
        print("✗ Caches were not updated")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile integration")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create a simple model that uses reshape_and_cache
    class CacheModel(torch.nn.Module):
        def __init__(self, num_blocks, block_size, num_kv_heads, head_size):
            super().__init__()
            self.key_cache = torch.nn.Parameter(
                torch.zeros(num_blocks, block_size, num_kv_heads, head_size),
                requires_grad=False
            )
            self.value_cache = torch.nn.Parameter(
                torch.zeros(num_blocks, block_size, num_kv_heads, head_size),
                requires_grad=False
            )
        
        def forward(self, key, value, slot_mapping):
            # Use our custom op - it returns the modified caches
            key_cache_out, value_cache_out = torch.ops.vllm.xla_reshape_and_cache_flash(
                key, value, self.key_cache, self.value_cache,
                slot_mapping, "auto", None, None
            )
            # Update the parameters with the returned values
            self.key_cache.data = key_cache_out
            self.value_cache.data = value_cache_out
            # Return something that depends on the cache
            return self.key_cache.sum() + self.value_cache.sum()
    
    # Create model
    model = CacheModel(2, 16, 2, 8).to(device)
    
    # Compile the model
    compiled_model = torch.compile(model, backend="openxla")
    
    # Test inputs
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    # Run the compiled model
    output = compiled_model(key, value, slot_mapping)
    xm.mark_step()
    
    print(f"✓ torch.compile test completed")
    print(f"  Output sum: {output.item():.4f}")
    
    # Verify caches were modified
    cache_sum = model.key_cache.abs().sum().item() + model.value_cache.abs().sum().item()
    if cache_sum > 0:
        print("✓ Caches were modified by compiled function")
    else:
        print("✗ Caches were not modified")


def main():
    # Setup
    setup_custom_call()
    
    # Register the custom op with vLLM's system
    # Note: We removed mutates_args since we now return cloned tensors
    direct_register_custom_op(
        op_name="xla_reshape_and_cache_flash",
        op_func=xla_reshape_and_cache_flash_impl,
        mutates_args=[],  # Empty list since we return clones
        fake_impl=xla_reshape_and_cache_flash_fake,
        dispatch_key="XLA",
    )
    
    print("✓ Custom op registered with vLLM")
    
    # Run tests
    test_basic_functionality()
    test_torch_compile()
    
    print("\n" + "="*60)
    print("✅ All tests completed!")
    print("="*60)


if __name__ == "__main__":
    main()
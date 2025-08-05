#!/usr/bin/env python3
"""Debug test for reshape_and_cache_flash XLA custom call."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os
import struct


def setup_debug_custom_call():
    """Compile and register the debug custom call."""
    # Compile if needed
    if not os.path.exists("reshape_and_cache_flash_xla_debug.so"):
        print("Compiling debug library...")
        if os.system("bash compile_debug.sh") != 0:
            raise RuntimeError("Compilation failed")
    
    # Load and register
    lib = ctypes.CDLL("./reshape_and_cache_flash_xla_debug.so", ctypes.RTLD_GLOBAL)
    func_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
    
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    capsule = PyCapsule_New(func_addr, None, None)
    
    torch_xla._XLAC._xla_register_custom_call_target(
        "vllm_reshape_and_cache_flash_debug",
        capsule,
        "CUDA"
    )
    print("✓ Debug custom call registered")


def test_minimal_debug():
    """Minimal test with debug output."""
    print("\n" + "="*60)
    print("Testing minimal debug case")
    print("="*60)
    
    device = xm.xla_device()
    
    # Very simple test case
    num_tokens = 1
    num_kv_heads = 1
    head_size = 4
    block_size = 8
    num_blocks = 1
    
    # Create test tensors with known values
    key = torch.tensor([[[1.0, 2.0, 3.0, 4.0]]], device=device)  # shape: [1, 1, 4]
    value = torch.tensor([[[5.0, 6.0, 7.0, 8.0]]], device=device)  # shape: [1, 1, 4]
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    # Optional: test with scaling
    k_scale = torch.tensor([0.5], device=device)
    v_scale = torch.tensor([2.0], device=device)
    
    print(f"Test setup:")
    print(f"  key: {key.shape}, first values: {key[0, 0, :].tolist()}")
    print(f"  value: {value.shape}, first values: {value[0, 0, :].tolist()}")
    print(f"  slot_mapping: {slot_mapping.tolist()}")
    print(f"  k_scale: {k_scale[0].item()}")
    print(f"  v_scale: {v_scale[0].item()}")
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        0,  # float32
        1,  # has_k_scale
        1   # has_v_scale
    )
    
    # Prepare buffers
    buffers = [key_cache, value_cache, key, value, slot_mapping, k_scale, v_scale]
    
    print("\nCalling XLA custom call...")
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash_debug",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        False,  # has_side_effect
        descriptor,
        2,  # num_outputs
        {}  # backend_config
    )
    
    key_cache_out, value_cache_out = outputs
    xm.mark_step()
    
    print("\nAfter custom call:")
    print(f"  key_cache[0, 0, 0, :]: {key_cache_out[0, 0, 0, :].tolist()}")
    print(f"  value_cache[0, 0, 0, :]: {value_cache_out[0, 0, 0, :].tolist()}")
    
    # Expected values after scaling
    expected_key = [0.5, 1.0, 1.5, 2.0]  # [1,2,3,4] * 0.5
    expected_value = [10.0, 12.0, 14.0, 16.0]  # [5,6,7,8] * 2.0
    
    print(f"\nExpected key_cache[0, 0, 0, :]: {expected_key}")
    print(f"Expected value_cache[0, 0, 0, :]: {expected_value}")


def main():
    print("="*60)
    print("Debug reshape_and_cache_flash XLA Custom Call Test")
    print("="*60)
    
    # Setup
    setup_debug_custom_call()
    
    # Run minimal test
    test_minimal_debug()
    
    print("\n" + "="*60)


if __name__ == "__main__":
    main()
#!/usr/bin/env python3
"""Debug simple test for reshape_and_cache_flash."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct

'''
XLA直接调用测试， PASS
不加donate
'''

def setup_custom_call():
    """Compile and register the custom call."""
    if not os.path.exists("reshape_and_cache_flash_xla.so"):
        print("Compiling library...")
        if os.system("bash compile_reshape_and_cache.sh") != 0:
            raise RuntimeError("Compilation failed")
    
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


def test_direct_call():
    """Test direct XLA custom call without torch.compile."""
    print("\n" + "="*60)
    print("Testing direct XLA custom call")
    print("="*60)
    
    device = xm.xla_device()
    
    # Very simple test case
    key = torch.tensor([[[0.5]]], device=device, dtype=torch.float32).contiguous()
    value = torch.tensor([[[0.7]]], device=device, dtype=torch.float32).contiguous()
    key_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    value_cache = torch.zeros(1, 2, 1, 1, device=device, dtype=torch.float32).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device)
    
    print(f"Before:")
    print(f"  key: {key}")
    print(f"  value: {value}")
    print(f"  key_cache: {key_cache}")
    print(f"  value_cache: {value_cache}")
    
    # Create descriptor
    num_tokens = 1
    num_kv_heads = 1
    head_size = 1
    num_blocks = 1
    block_size = 2
    kv_cache_dtype_int = 0  # auto
    has_k_scale = 0
    has_v_scale = 0
    
    descriptor = struct.pack(
        'qqqqqibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        kv_cache_dtype_int,
        has_k_scale,
        has_v_scale
    )
    
    # Prepare buffers - inputs first, outputs last
    buffers = [key, value, key_cache, value_cache, slot_mapping]  # inputs
    buffers.extend([key_cache, value_cache])  # outputs (same tensors for in-place)
    
    # Call XLA custom op
    outputs = torch_xla._XLAC._xla_custom_call(
        buffers,
        "vllm_reshape_and_cache_flash",
        [list(key_cache.shape), list(value_cache.shape)],
        [key_cache.dtype, value_cache.dtype],
        True,  # has_side_effect
        descriptor,
        1,  # api_version
        {}
    )
    
    # Force synchronization
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"\nAfter:")
    print(f"  Original key_cache: {key_cache}")
    print(f"  Original value_cache: {value_cache}")
    print(f"  Returned outputs[0]: {outputs[0]}")
    print(f"  Returned outputs[1]: {outputs[1]}")
    
    # Check if any values were written
    if (outputs[0] != 0).any() or (outputs[1] != 0).any():
        print("\n✓ Outputs contain non-zero values")
    else:
        print("\n✗ Outputs are still zero")
    
    if (key_cache != 0).any() or (value_cache != 0).any():
        print("✓ Original caches were modified")
    else:
        print("✗ Original caches are still zero")


if __name__ == "__main__":
    setup_custom_call()
    test_direct_call()
#!/usr/bin/env python3
"""Test script for reshape_and_cache_flash XLA custom call."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os
import struct
import numpy as np


def step1_compile():
    """Step 1: Compile the library."""
    print("Step 1: Compiling library...")
    
    if os.path.exists("reshape_and_cache_flash_xla.so"):
        print("  ✓ Library already exists")
        return True
    
    ret = os.system("bash compile_reshape_and_cache.sh")
    return ret == 0


def step2_register():
    """Step 2: Register custom call."""
    print("\nStep 2: Registering custom call...")
    
    if not os.path.exists("reshape_and_cache_flash_xla.so"):
        print("  ✗ Library not found")
        return False
    
    try:
        # Load library
        lib = ctypes.CDLL("./reshape_and_cache_flash_xla.so", ctypes.RTLD_GLOBAL)
        
        # Display symbols
        os.system("nm -D reshape_and_cache_flash_xla.so | grep reshape_and_cache")
        
        # Get function address
        func_addr = ctypes.cast(lib.reshape_and_cache_flash_xla_custom_call, ctypes.c_void_p).value
        
        # Create PyCapsule
        PyCapsule_New = ctypes.pythonapi.PyCapsule_New
        PyCapsule_New.restype = ctypes.py_object
        PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
        capsule = PyCapsule_New(func_addr, None, None)
        
        # Register with XLA
        torch_xla._XLAC._xla_register_custom_call_target(
            "vllm_reshape_and_cache_flash",
            capsule,
            "CUDA"
        )
        
        print("  ✓ Registered successfully")
        return True
        
    except Exception as e:
        print(f"  ✗ Registration failed: {e}")
        return False


def step3_test():
    """Step 3: Test the custom call."""
    print("\nStep 3: Testing custom call...")
    
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
    
    # Initialize caches - layout: [num_blocks, block_size, num_kv_heads, head_size]
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    
    # Create slot mapping - map each token to a cache slot
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)  # Using slots in both blocks
    
    # Optional scale factors (None for this test)
    k_scale = None
    v_scale = None
    
    # Create descriptor
    kv_cache_dtype = 0  # float32
    has_k_scale = k_scale is not None
    has_v_scale = v_scale is not None
    
    descriptor = struct.pack(
        'qqqqqibbo',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        kv_cache_dtype,
        has_k_scale,
        has_v_scale,
        0  # padding for alignment
    )
    
    try:
        print(f"  Input shapes:")
        print(f"    key: {key.shape}")
        print(f"    value: {value.shape}")
        print(f"    key_cache: {key_cache.shape}")
        print(f"    value_cache: {value_cache.shape}")
        print(f"    slot_mapping: {slot_mapping.shape}")
        
        # Prepare buffers list
        buffers = [key_cache, value_cache, key, value, slot_mapping]
        if k_scale is not None:
            buffers.append(k_scale)
        if v_scale is not None:
            buffers.append(v_scale)
        
        # Call custom op - this modifies key_cache and value_cache in-place
        # For in-place operations, XLA expects the output shapes to match the modified tensors
        output_shapes = [list(key_cache.shape), list(value_cache.shape)]
        output_dtypes = [torch.float32, torch.float32]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers,
            "vllm_reshape_and_cache_flash",
            output_shapes,
            output_dtypes,
            False,  # has_side_effect = False (even though it modifies in-place)
            descriptor,
            2,  # num_outputs (key_cache and value_cache)
            {}  # backend_config
        )
        
        # The outputs are the modified caches
        key_cache_out, value_cache_out = outputs
        
        # Force synchronization
        xm.mark_step()
        
        print(f"  ✓ Custom call successful!")
        
        # Verify the caches were updated
        # Check that values were written to the expected slots
        def check_cache_update(cache, input_tensor, slot_mapping, cache_name):
            """Verify cache was updated correctly."""
            errors = []
            for token_idx in range(num_tokens):
                slot = slot_mapping[token_idx].item()
                block_idx = slot // block_size
                block_offset = slot % block_size
                
                # Get cached value
                cached = cache[block_idx, block_offset]
                expected = input_tensor[token_idx]
                
                # Check if they match (within tolerance)
                diff = torch.abs(cached - expected).max().item()
                if diff > 1e-5:
                    errors.append(f"Token {token_idx} (slot {slot}): max diff = {diff:.2e}")
            
            if errors:
                print(f"  ⚠ {cache_name} verification failed:")
                for err in errors[:3]:  # Show first 3 errors
                    print(f"    {err}")
            else:
                print(f"  ✓ {cache_name} updated correctly")
            
            return len(errors) == 0
        
        # Verify both caches
        key_ok = check_cache_update(key_cache_out, key, slot_mapping, "key_cache")
        value_ok = check_cache_update(value_cache_out, value, slot_mapping, "value_cache")
        
        return key_ok and value_ok
        
    except Exception as e:
        print(f"  ✗ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_with_scaling():
    """Test with scaling factors."""
    print("\nTesting with scaling factors...")
    
    device = xm.xla_device()
    
    # Test parameters
    num_tokens = 2
    num_kv_heads = 1
    head_size = 4
    block_size = 8
    num_blocks = 1
    
    # Create test tensors
    key = torch.ones(num_tokens, num_kv_heads, head_size, device=device)
    value = torch.ones(num_tokens, num_kv_heads, head_size, device=device) * 2.0
    
    # Initialize caches
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    
    # Slot mapping
    slot_mapping = torch.tensor([0, 1], dtype=torch.int64, device=device)
    
    # Scale factors
    k_scale = torch.tensor([0.5], device=device)
    v_scale = torch.tensor([2.0], device=device)
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqibbo',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        0,  # float32
        True,  # has_k_scale
        True,  # has_v_scale
        0  # padding
    )
    
    try:
        buffers = [key_cache, value_cache, key, value, slot_mapping, k_scale, v_scale]
        output_shapes = [list(key_cache.shape), list(value_cache.shape)]
        output_dtypes = [torch.float32, torch.float32]
        
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers,
            "vllm_reshape_and_cache_flash",
            output_shapes,
            output_dtypes,
            False,
            descriptor,
            2,
            {}
        )
        
        key_cache_out, value_cache_out = outputs
        xm.mark_step()
        
        # Check scaling was applied
        expected_key_val = 1.0 * 0.5  # key * k_scale
        expected_value_val = 2.0 * 2.0  # value * v_scale
        
        actual_key_val = key_cache_out[0, 0, 0, 0].item()
        actual_value_val = value_cache_out[0, 0, 0, 0].item()
        
        print(f"  Expected key value: {expected_key_val}, Actual: {actual_key_val}")
        print(f"  Expected value value: {expected_value_val}, Actual: {actual_value_val}")
        
        key_ok = abs(actual_key_val - expected_key_val) < 1e-5
        value_ok = abs(actual_value_val - expected_value_val) < 1e-5
        
        if key_ok and value_ok:
            print("  ✓ Scaling test passed!")
        else:
            print("  ✗ Scaling test failed!")
        
        return key_ok and value_ok
        
    except Exception as e:
        print(f"  ✗ Scaling test failed: {e}")
        return False


def main():
    print("=" * 60)
    print("reshape_and_cache_flash XLA Custom Call Test")
    print("=" * 60)
    
    # Step 1: Compile
    if not step1_compile():
        print("\n❌ Compilation failed")
        print("Please check CUDA installation and paths")
        return
    
    # Step 2: Register
    if not step2_register():
        print("\n❌ Registration failed") 
        print("Check that the library exports the correct symbols")
        return
    
    # Step 3: Basic test
    basic_ok = step3_test()
    
    # Step 4: Test with scaling
    scale_ok = test_with_scaling()
    
    if basic_ok and scale_ok:
        print("\n✅ All tests passed! Custom call is working correctly")
    else:
        print("\n❌ Some tests failed")
    
    print("=" * 60)


if __name__ == "__main__":
    main()
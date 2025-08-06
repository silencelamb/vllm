#!/usr/bin/env python3
"""Simple test for reshape_and_cache_flash XLA custom call without torch.compile."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os
import struct
import numpy as np


def setup_custom_call():
    """Compile and register the custom call."""
    # First, ensure PyTorch CUDA libraries are loaded
    import torch
    # Force load torch C++ extension if available
    torch_lib_path = os.path.dirname(torch._C.__file__)
    
    # Print torch lib path for debugging
    print(f"Looking for PyTorch libraries in: {torch_lib_path}")
    
    # List available .so files
    if os.path.exists(torch_lib_path):
        so_files = [f for f in os.listdir(torch_lib_path) if f.endswith('.so')]
        print(f"Found .so files: {so_files[:5]}...")  # Show first 5
    
    # Load PyTorch libraries in order to resolve symbols
    libs_to_load = [
        "libc10.so",
        "libc10_cuda.so", 
        "libtorch.so",
        "libtorch_cuda.so",
        "libtorch_cpu.so",  # May still be needed for some symbols
        "libtorch_python.so",  # Python bindings
    ]
    
    loaded_any = False
    for lib_name in libs_to_load:
        lib_path = os.path.join(torch_lib_path, lib_name)
        if os.path.exists(lib_path):
            try:
                ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
                print(f"✓ Loaded {lib_name}")
                loaded_any = True
            except OSError as e:
                print(f"⚠ Could not load {lib_name}: {e}")
        else:
            print(f"⚠ {lib_name} not found")
    
    if not loaded_any:
        print("Warning: No PyTorch libraries were loaded. Trying alternative approach...")
            
    # Path to the compiled XLA ops library
    xla_ops_dir = os.path.abspath("../../../../csrc/xla_ops")
    xla_ops_path = os.path.join(xla_ops_dir, "vllm_xla_ops.so")
    
    # Compile if needed
    if not os.path.exists(xla_ops_path):
        print("Compiling library...")
        compile_cmd = f"cd {xla_ops_dir} && python build_xla_ops.py"
        if os.system(compile_cmd) != 0:
            raise RuntimeError("Compilation failed")
    
    # Now load our library with RTLD_GLOBAL
    # On Linux, we can use os.RTLD_LAZY if needed
    try:
        # Try with RTLD_GLOBAL first
        lib = ctypes.CDLL(xla_ops_path, ctypes.RTLD_GLOBAL)
    except OSError as e:
        print(f"Failed to load with RTLD_GLOBAL: {e}")
        # Try with default mode
        lib = ctypes.CDLL(xla_ops_path)
    
    func_addr = ctypes.cast(lib.vllm_reshape_and_cache_flash_xla, ctypes.c_void_p).value
    
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


def call_reshape_and_cache_flash(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: torch.Tensor = None,
    v_scale: torch.Tensor = None,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Direct XLA custom call wrapper."""
    
    # Extract dimensions
    num_tokens = key.shape[0]
    num_kv_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]
    
    # Map dtype string to integer
    kv_dtype_map = {"auto": 0, "float16": 1, "bfloat16": 2, "float32": 3}
    kv_cache_dtype_int = kv_dtype_map.get(kv_cache_dtype, 0)
    
    # Determine input dtype
    input_dtype_map = {torch.float32: 0, torch.float16: 1, torch.bfloat16: 2}
    input_dtype_int = input_dtype_map.get(key.dtype, 0)
    
    # Check if scales are provided
    has_k_scale = k_scale is not None
    has_v_scale = v_scale is not None
    
    # Create descriptor
    descriptor = struct.pack(
        'qqqqqiibb',
        num_tokens,
        num_kv_heads,
        head_size,
        num_blocks,
        block_size,
        kv_cache_dtype_int,
        input_dtype_int,
        1 if has_k_scale else 0,
        1 if has_v_scale else 0
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
    
    return outputs


def test_basic():
    """Test basic functionality."""
    print("\n" + "="*60)
    print("Testing basic reshape_and_cache_flash")
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
    
    print(f"Input shapes:")
    print(f"  key: {key.shape}")
    print(f"  value: {value.shape}")
    print(f"  key_cache: {key_cache.shape}")
    print(f"  value_cache: {value_cache.shape}")
    print(f"  slot_mapping: {slot_mapping.shape}")
    
    # Call the custom op
    key_cache_out, value_cache_out = call_reshape_and_cache_flash(
        key, value, key_cache, value_cache, slot_mapping
    )
    # ir1 = torch_xla._XLAC._get_xla_tensors_hlo([key_cache_out, value_cache_out])
    # print("HLO IR: ", ir1)
    
    xm.mark_step()
    
    print("✓ Custom call completed successfully")
    
    # Verify caches were updated
    def check_cache_update(cache, input_tensor, slot_mapping, cache_name):
        """Verify cache was updated correctly."""
        non_zero_count = 0
        for token_idx in range(num_tokens):
            slot = slot_mapping[token_idx].item()
            block_idx = slot // block_size
            block_offset = slot % block_size
            
            # Get cached value
            cached = cache[block_idx, block_offset]
            expected = input_tensor[token_idx]
            
            # Check if they match (within tolerance)
            diff = torch.abs(cached - expected).max().item()
            if diff < 1e-5:
                non_zero_count += 1
        
        if non_zero_count == num_tokens:
            print(f"✓ {cache_name} updated correctly ({non_zero_count}/{num_tokens} tokens)")
            return True
        else:
            print(f"⚠ {cache_name} partially updated ({non_zero_count}/{num_tokens} tokens)")
            return False
    
    # Verify both caches
    key_ok = check_cache_update(key_cache_out, key, slot_mapping, "key_cache")
    value_ok = check_cache_update(value_cache_out, value, slot_mapping, "value_cache")
    
    return key_ok and value_ok


def test_with_scaling():
    """Test with scaling factors."""
    print("\n" + "="*60)
    print("Testing with scaling factors")
    print("="*60)
    
    device = xm.xla_device()
    
    # Smaller test for simplicity
    num_tokens = 2
    num_kv_heads = 1
    head_size = 4
    block_size = 8
    num_blocks = 1
    
    # Create test tensors with known values
    key = torch.ones(num_tokens, num_kv_heads, head_size, device=device)
    value = torch.ones(num_tokens, num_kv_heads, head_size, device=device) * 2.0
    key_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    value_cache = torch.zeros(num_blocks, block_size, num_kv_heads, head_size, device=device)
    slot_mapping = torch.tensor([0, 1], dtype=torch.int64, device=device)
    
    # Scale factors
    k_scale = torch.tensor([0.5], device=device)
    v_scale = torch.tensor([2.0], device=device)
    
    print(f"Input values:")
    print(f"  key values: {key[0, 0, 0].item():.2f}")
    print(f"  value values: {value[0, 0, 0].item():.2f}")
    print(f"  k_scale: {k_scale[0].item():.2f}")
    print(f"  v_scale: {v_scale[0].item():.2f}")
    
    # Call with scaling
    key_cache_out, value_cache_out = call_reshape_and_cache_flash(
        key, value, key_cache, value_cache, slot_mapping,
        k_scale=k_scale, v_scale=v_scale
    )
    # ir1 = torch_xla._XLAC._get_xla_tensors_hlo([key_cache_out, value_cache_out])
    # print("HLO IR: ", ir1)    
    xm.mark_step()
    
    # Check scaling was applied
    expected_key_val = 1.0 * 0.5  # key * k_scale
    expected_value_val = 2.0 * 2.0  # value * v_scale
    
    actual_key_val = key_cache_out[0, 0, 0, 0].item()
    actual_value_val = value_cache_out[0, 0, 0, 0].item()
    
    print(f"\nResults:")
    print(f"  Expected key value: {expected_key_val}, Actual: {actual_key_val:.2f}")
    print(f"  Expected value value: {expected_value_val}, Actual: {actual_value_val:.2f}")
    
    key_ok = abs(actual_key_val - expected_key_val) < 1e-5
    value_ok = abs(actual_value_val - expected_value_val) < 1e-5
    
    if key_ok and value_ok:
        print("✓ Scaling test passed!")
    else:
        print("✗ Scaling test failed!")
    
    return key_ok and value_ok


def main():
    print("="*60)
    print("Simple reshape_and_cache_flash XLA Custom Call Test")
    print("="*60)
    
    # Setup
    setup_custom_call()
    
    # Run tests
    basic_ok = test_basic()
    scale_ok = test_with_scaling()
    
    if basic_ok and scale_ok:
        print("\n✅ All tests passed!")
    else:
        print("\n❌ Some tests failed")
    
    print("="*60)


if __name__ == "__main__":
    main()
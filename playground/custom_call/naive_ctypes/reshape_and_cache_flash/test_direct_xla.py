#!/usr/bin/env python3
"""Direct XLA approach without using torch.ops registration."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct


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


def reshape_and_cache_flash_direct(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str = "auto",
    k_scale: torch.Tensor = None,
    v_scale: torch.Tensor = None,
) -> None:
    """Direct XLA implementation without torch.ops."""
    # Extract dimensions
    num_tokens = key.shape[0]
    num_kv_heads = key.shape[1]
    head_size = key.shape[2]
    num_blocks = key_cache.shape[0]
    block_size = key_cache.shape[1]
    
    # Map dtype
    dtype_map = {"auto": 0, "float32": 0, "float16": 1, "bfloat16": 2}
    kv_cache_dtype_int = dtype_map.get(kv_cache_dtype, 0)
    
    # Check scales
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
        1 if has_k_scale else 0,
        1 if has_v_scale else 0
    )
    
    # Prepare buffers
    buffers = [key_cache, value_cache, key, value, slot_mapping]
    if has_k_scale:
        buffers.append(k_scale)
    if has_v_scale:
        buffers.append(v_scale)
    
    # Call XLA custom op directly
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
    
    # Update caches in-place
    key_cache.data = outputs[0]
    value_cache.data = outputs[1]


# For torch.compile compatibility, we need to allow this function in graph
torch._dynamo.allow_in_graph(reshape_and_cache_flash_direct)


def test_basic():
    """Test basic functionality."""
    print("\n" + "="*60)
    print("Testing direct XLA approach")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    # Store original pointers
    key_ptr = key_cache.data_ptr()
    value_ptr = value_cache.data_ptr()
    
    # Call directly
    reshape_and_cache_flash_direct(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    print("✓ Basic test completed")
    print(f"  Key cache ptr same: {key_cache.data_ptr() == key_ptr}")
    print(f"  Value cache ptr same: {value_cache.data_ptr() == value_ptr}")
    
    if (key_cache != 0).any() and (value_cache != 0).any():
        print("✓ Caches were updated")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        reshape_and_cache_flash_direct(
            key, value, key_cache, value_cache,
            slot_mapping, "auto", None, None
        )
        return key_cache.abs().mean() + value_cache.abs().mean()
    
    # Test
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    try:
        result = compiled_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()
        
        print(f"✓ torch.compile test completed")
        print(f"  Result: {result.item():.4f}")
        
        if result.item() > 0:
            print("✓ Caches were modified")
    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback
        traceback.print_exc()


def test_with_model():
    """Test with a model."""
    print("\n" + "="*60)
    print("Testing with model")
    print("="*60)
    
    device = xm.xla_device()
    
    class CacheModel(torch.nn.Module):
        def __init__(self, num_blocks, block_size, num_heads, head_size):
            super().__init__()
            self.register_buffer(
                'key_cache',
                torch.zeros(num_blocks, block_size, num_heads, head_size)
            )
            self.register_buffer(
                'value_cache',
                torch.zeros(num_blocks, block_size, num_heads, head_size)
            )
        
        def forward(self, key, value, slot_mapping):
            reshape_and_cache_flash_direct(
                key, value, self.key_cache, self.value_cache,
                slot_mapping, "auto", None, None
            )
            return self.key_cache.abs().mean()
    
    model = CacheModel(2, 16, 2, 8).to(device)
    
    # Test with torch.compile
    try:
        compiled_model = torch.compile(model, backend="openxla")
        
        key = torch.randn(4, 2, 8, device=device)
        value = torch.randn(4, 2, 8, device=device)
        slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
        
        result = compiled_model(key, value, slot_mapping)
        xm.mark_step()
        
        print(f"✓ Model test completed")
        print(f"  Result: {result.item():.4f}")
    except Exception as e:
        print(f"✗ Model test failed: {e}")
        import traceback
        traceback.print_exc()


def test_with_scaling():
    """Test with scaling factors."""
    print("\n" + "="*60)
    print("Testing with scaling")
    print("="*60)
    
    device = xm.xla_device()
    
    # Simple test case
    key = torch.ones(2, 1, 4, device=device)
    value = torch.ones(2, 1, 4, device=device) * 2.0
    key_cache = torch.zeros(1, 8, 1, 4, device=device)
    value_cache = torch.zeros(1, 8, 1, 4, device=device)
    slot_mapping = torch.tensor([0, 1], dtype=torch.int64, device=device)
    
    k_scale = torch.tensor([0.5], device=device)
    v_scale = torch.tensor([2.0], device=device)
    
    reshape_and_cache_flash_direct(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", k_scale, v_scale
    )
    
    xm.mark_step()
    
    print("✓ Scaling test completed")
    print(f"  key_cache[0,0,0,0]: {key_cache[0,0,0,0].item():.2f}")
    print(f"  value_cache[0,0,0,0]: {value_cache[0,0,0,0].item():.2f}")


def main():
    print("="*60)
    print("Direct XLA approach (no torch.ops registration)")
    print("="*60)
    print("\nThis approach:")
    print("1. Calls XLA custom call directly")
    print("2. Uses torch._dynamo.allow_in_graph")
    print("3. Avoids torch.ops registration issues")
    
    # Setup
    setup_custom_call()
    
    # Run tests
    test_basic()
    test_torch_compile()
    test_with_model()
    test_with_scaling()
    
    print("\n" + "="*60)
    print("✅ All tests completed!")
    print("="*60)


if __name__ == "__main__":
    main()
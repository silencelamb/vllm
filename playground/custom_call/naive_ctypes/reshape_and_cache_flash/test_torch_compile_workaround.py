#!/usr/bin/env python3
"""Workaround for torch.compile with in-place operations using torch._dynamo.allow_in_graph."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import struct
from vllm.utils import direct_register_custom_op


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


class ReshapeAndCacheFlashOp:
    """Wrapper class for reshape_and_cache_flash operation."""
    
    @staticmethod
    def apply(
        key: torch.Tensor,
        value: torch.Tensor,
        key_cache: torch.Tensor,
        value_cache: torch.Tensor,
        slot_mapping: torch.Tensor,
        kv_cache_dtype: str,
        k_scale: torch.Tensor,
        v_scale: torch.Tensor,
    ) -> None:
        """Apply reshape and cache operation."""
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
        
        # Call XLA custom op
        outputs = torch_xla._XLAC._xla_custom_call(
            buffers,
            "vllm_reshape_and_cache_flash",
            [list(key_cache.shape), list(value_cache.shape)],
            [key_cache.dtype, value_cache.dtype],
            False,
            descriptor,
            2,
            {}
        )
        
        # Update in-place
        key_cache.copy_(outputs[0])
        value_cache.copy_(outputs[1])


# Mark the operation as allowed in graph
torch._dynamo.allow_in_graph(ReshapeAndCacheFlashOp.apply)


def reshape_and_cache_flash_wrapper(
    key: torch.Tensor,
    value: torch.Tensor,
    key_cache: torch.Tensor,
    value_cache: torch.Tensor,
    slot_mapping: torch.Tensor,
    kv_cache_dtype: str,
    k_scale: torch.Tensor,
    v_scale: torch.Tensor,
) -> None:
    """Wrapper function that calls our allowed operation."""
    ReshapeAndCacheFlashOp.apply(
        key, value, key_cache, value_cache,
        slot_mapping, kv_cache_dtype, k_scale, v_scale
    )


def test_basic():
    """Test basic functionality."""
    print("\n" + "="*60)
    print("Testing basic functionality")
    print("="*60)
    
    device = xm.xla_device()
    
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device)
    
    # Call directly
    reshape_and_cache_flash_wrapper(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    
    xm.mark_step()
    
    print("✓ Basic test completed")
    if (key_cache != 0).any() and (value_cache != 0).any():
        print("✓ Caches were updated")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "="*60)
    print("Testing torch.compile integration")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def compiled_update(key, value, key_cache, value_cache, slot_mapping):
        reshape_and_cache_flash_wrapper(
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
    
    result = compiled_update(key, value, key_cache, value_cache, slot_mapping)
    xm.mark_step()
    
    print(f"✓ torch.compile test completed")
    print(f"  Result: {result.item():.4f}")


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
            reshape_and_cache_flash_wrapper(
                key, value, self.key_cache, self.value_cache,
                slot_mapping, "auto", None, None
            )
            return self.key_cache.abs().mean()
    
    model = CacheModel(2, 16, 2, 8).to(device)
    
    # Try to compile
    try:
        compiled_model = torch.compile(model, backend="openxla", fullgraph=True)
        print("✓ Model compiled with fullgraph=True")
    except:
        compiled_model = torch.compile(model, backend="openxla")
        print("✓ Model compiled (with potential graph breaks)")
    
    # Test
    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
    
    result = compiled_model(key, value, slot_mapping)
    xm.mark_step()
    
    print(f"✓ Model test completed")
    print(f"  Result: {result.item():.4f}")


def test_performance_comparison():
    """Compare performance of in-place vs copy operations."""
    print("\n" + "="*60)
    print("Performance comparison: in-place vs copy")
    print("="*60)
    
    device = xm.xla_device()
    
    # Large cache size for meaningful comparison
    num_blocks = 256
    block_size = 128
    num_heads = 32
    head_size = 128
    num_tokens = 512
    
    print(f"Cache size: {num_blocks * block_size * num_heads * head_size * 4 / 1024**3:.2f} GB per cache")
    
    # Test data
    key = torch.randn(num_tokens, num_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_heads, head_size, device=device)
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64, device=device)
    
    # In-place version
    key_cache_inplace = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    value_cache_inplace = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    
    # Non-in-place version (with cloning)
    key_cache_clone = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    value_cache_clone = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    
    # Warm up
    xm.mark_step()
    
    # Measure in-place
    import time
    start = time.time()
    reshape_and_cache_flash_wrapper(
        key, value, key_cache_inplace, value_cache_inplace,
        slot_mapping, "auto", None, None
    )
    xm.mark_step()
    inplace_time = time.time() - start
    
    # Measure with clone (simulating non-in-place)
    start = time.time()
    key_cache_temp = key_cache_clone.clone()
    value_cache_temp = value_cache_clone.clone()
    reshape_and_cache_flash_wrapper(
        key, value, key_cache_temp, value_cache_temp,
        slot_mapping, "auto", None, None
    )
    key_cache_clone.copy_(key_cache_temp)
    value_cache_clone.copy_(value_cache_temp)
    xm.mark_step()
    clone_time = time.time() - start
    
    print(f"\nResults:")
    print(f"  In-place time: {inplace_time*1000:.2f} ms")
    print(f"  Clone time: {clone_time*1000:.2f} ms")
    print(f"  Overhead: {(clone_time/inplace_time - 1)*100:.1f}%")
    print(f"  Extra memory: {2 * num_blocks * block_size * num_heads * head_size * 4 / 1024**3:.2f} GB")


def main():
    print("="*60)
    print("Testing reshape_and_cache_flash with torch._dynamo.allow_in_graph")
    print("="*60)
    
    # Setup
    setup_custom_call()
    
    # Run tests
    test_basic()
    test_torch_compile()
    test_with_model()
    test_performance_comparison()
    
    print("\n" + "="*60)
    print("✅ All tests completed!")
    print("="*60)


if __name__ == "__main__":
    main()
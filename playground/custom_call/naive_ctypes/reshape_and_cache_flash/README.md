# reshape_and_cache_flash XLA Custom Call Implementation

This directory contains a torch XLA custom call implementation for vLLM's `reshape_and_cache_flash` operation.

## Overview

The `reshape_and_cache_flash` operation is used to update KV cache tensors during attention computation. This implementation provides:

1. A CUDA kernel that performs the reshape and cache update operation
2. XLA custom call registration 
3. Integration with torch.compile via vLLM's custom op system
4. Test scripts demonstrating functionality

## Files

- `xla_reshape_and_cache_flash.cu` - CUDA implementation of the custom call
- `compile_reshape_and_cache.sh` - Build script to compile the CUDA code
- `test_reshape_and_cache_flash.py` - Basic test script with step-by-step verification
- `test_torch_compile_integration.py` - Advanced test showing torch.compile integration

## Building

```bash
./compile_reshape_and_cache.sh
```

This will compile the CUDA code and produce `reshape_and_cache_flash_xla.so`.

## Running Tests

### Basic Test
```bash
python test_reshape_and_cache_flash.py
```

This test:
- Compiles the library (if needed)
- Registers the XLA custom call
- Tests basic functionality
- Tests with scaling factors

### torch.compile Integration Test
```bash 
python test_torch_compile_integration.py
```

This test:
- Demonstrates integration with vLLM's custom op system
- Shows compatibility with torch.compile(backend="openxla")
- Tests in-place cache modifications

## Implementation Details

The operation takes:
- `key`: [num_tokens, num_kv_heads, head_size] - New keys to cache
- `value`: [num_tokens, num_kv_heads, head_size] - New values to cache  
- `key_cache`: [num_blocks, block_size, num_kv_heads, head_size] - Key cache (modified in-place)
- `value_cache`: [num_blocks, block_size, num_kv_heads, head_size] - Value cache (modified in-place)
- `slot_mapping`: [num_tokens] - Maps each token to a cache slot
- `kv_cache_dtype`: String indicating cache data type
- `k_scale`: Optional scale factor for keys
- `v_scale`: Optional scale factor for values

The operation updates the cache tensors in-place based on the slot mapping.

## Next Steps

To integrate this into vLLM's XLA GPU backend:

1. Move the CUDA implementation to the appropriate vLLM source directory
2. Update the build system to compile it as part of vLLM
3. Use the registered custom op in `xla_gpu_native.py` instead of the fallback implementation
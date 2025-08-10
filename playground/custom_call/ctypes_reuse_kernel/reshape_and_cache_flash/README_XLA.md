# XLA Custom Call Implementation for reshape_and_cache_flash

This is a complete implementation that registers `reshape_and_cache_flash` as an XLA custom call, enabling full compatibility with `torch.compile(backend="openxla")`.

## Architecture

### 1. C++ Wrapper (`reshape_and_cache_xla_pure.cc`)
- Wraps the existing `reshape_and_cache_flash` function from `csrc/cache_kernels.cu`
- Implements the XLA custom call interface
- Returns new tensors (TPU-style) to avoid aliasing issues

### 2. Python Integration (`xla_reshape_and_cache.py`)
- Registers the custom call with XLA runtime using `torch_xla._XLAC._xla_register_custom_call_target`
- Implements `torch.library` registration for torch.compile compatibility
- Provides implementations for XLA, CUDA, and meta (fake) tensors
- Uses buffer donor optimization when available

### 3. Key Features
- **Reuses existing kernels**: Directly calls vLLM's optimized `reshape_and_cache_flash` implementation
- **XLA native**: Registered as a proper XLA custom call, not just a fallback
- **torch.compile compatible**: Works with `backend="openxla"` through proper torch.library registration
- **Buffer donor optimization**: Marks caches as buffer donors to enable XLA memory optimization

## Build Instructions

```bash
# Run the compile script
./compile_xla_vllm_style.sh

# This will create:
# - reshape_and_cache_xla.so: XLA custom call shared library
```

## Usage

### Basic Usage

```python
from xla_reshape_and_cache import reshape_and_cache_flash

# On XLA device
device = xm.xla_device()
key = torch.randn(4, 2, 8, device=device)
value = torch.randn(4, 2, 8, device=device)
key_cache = torch.zeros(2, 16, 2, 8, device=device)
value_cache = torch.zeros(2, 16, 2, 8, device=device)
slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)

# Call the function (updates caches in-place)
reshape_and_cache_flash(
    key, value, key_cache, value_cache,
    slot_mapping, "auto", None, None
)
```

### With torch.compile

```python
@torch.compile(backend="openxla")
def model_forward(key, value, key_cache, value_cache, slot_mapping):
    reshape_and_cache_flash(
        key, value, key_cache, value_cache,
        slot_mapping, "auto", None, None
    )
    return key_cache.sum()

# The function will be compiled by XLA
result = model_forward(key, value, key_cache, value_cache, slot_mapping)
```

### Integration with vLLM XLA Backend

In `vllm/v1/attention/backends/xla_gpu_native.py`:

```python
from playground.custom_call.torch_binding.xla_reshape_and_cache import reshape_and_cache_flash

class XlaGpuNativeAttentionBackend:
    def forward(self, ...):
        # Use the XLA-compatible version
        reshape_and_cache_flash(
            key, value, self.key_cache, self.value_cache,
            slot_mapping, self.kv_cache_dtype, k_scale, v_scale
        )
```

## Implementation Details

### XLA Custom Call Registration

The implementation follows the TPU-style approach:

1. **Returns new tensors**: Instead of modifying tensors in-place (which causes aliasing issues in XLA), the operation returns new tensors
2. **Buffer donor optimization**: Uses `torch.ops.xla.dynamo_set_buffer_donor_` to mark input caches as buffer donors
3. **Copy elimination**: The final `copy_` operations are optimized away by XLA when buffer donors are used

### Descriptor Format

The opaque descriptor passed to XLA contains:
```
"dtype_str|num_tokens|num_heads|head_size|num_blocks|block_size|has_k_scale|has_v_scale"
```

### Buffer Layout

XLA custom call buffers:
- `[0]` key (input)
- `[1]` value (input)
- `[2]` key_cache (input/output)
- `[3]` value_cache (input/output)
- `[4]` slot_mapping (input)
- `[5]` k_scale (optional input)
- `[6]` v_scale (optional input)

## Testing

Run the comprehensive test suite:

```bash
python test_xla_reshape_and_cache.py
```

The test suite includes:
- Basic functionality test
- torch.compile compatibility test
- FP8 scaling test
- Padding token handling
- XLA graph optimization test
- Buffer donor optimization test
- Performance benchmarks

## Performance

The implementation achieves high performance by:
1. Reusing vLLM's optimized CUDA kernels
2. Eliminating unnecessary copies through buffer donor optimization
3. Enabling XLA graph-level optimizations
4. Supporting torch.compile for additional optimizations

## Notes

- The implementation requires PyTorch XLA to be installed
- CUDA compute capabilities 7.0, 7.5, 8.0, and 8.6 are supported
- The buffer donor optimization requires a recent version of PyTorch XLA
- XLA graph optimizations are most effective when used within larger compiled regions
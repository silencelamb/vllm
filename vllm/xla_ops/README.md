# XLA Custom Call Integration for vLLM

This directory contains XLA custom call implementations for vLLM's optimized CUDA kernels.

## Overview

XLA Custom Call allows us to:
1. Use vLLM's highly optimized CUDA kernels
2. Keep XLA's graph optimization capabilities
3. Avoid fallback overhead

## Architecture

```
Python (rms_norm call)
    ↓
XLA Lowering (register_rms_norm_lowering)
    ↓
XLA Custom Call Node (vllm_rms_norm_cuda)
    ↓
C++ Wrapper (xla_rms_norm_wrapper.cc)
    ↓
vLLM CUDA Kernel (layernorm_kernels.cu)
```

## Files

- `rms_norm_custom_call.py`: Python interface and XLA lowering
- `../csrc/xla_rms_norm_wrapper.cc`: C++ wrapper for XLA custom call
- `../csrc/layernorm_kernels.cu`: Original vLLM CUDA kernel

## Building

```bash
# Build the XLA extension
python setup_xla_extension.py build_ext --inplace
```

## Usage

### Direct Usage

```python
from vllm.xla_ops.rms_norm_custom_call import rms_norm_xla

# On XLA device
output = rms_norm_xla(input, weight, epsilon=1e-5)
```

### With torch.compile

```python
from vllm.xla_ops.rms_norm_custom_call import register_rms_norm_lowering

# Register once at startup
register_rms_norm_lowering()

# Then use normally - XLA will automatically use custom call
from vllm._custom_ops import rms_norm
rms_norm(out, input, weight, epsilon)
```

### In XlaGpuModelRunner

```python
class XlaGpuModelRunner:
    def __init__(self):
        # Register all custom calls at initialization
        register_rms_norm_lowering()
        # register_flash_attention_lowering()
        # etc...
```

## Adding New Custom Calls

1. Create C++ wrapper in `csrc/xla_<op>_wrapper.cc`
2. Create Python interface in `xla_ops/<op>_custom_call.py`
3. Add to `setup_xla_extension.py`
4. Register in `XlaGpuModelRunner.__init__`

## Performance Notes

- Custom calls have minimal overhead (just function call)
- Data stays on GPU (no host-device transfer)
- XLA can still optimize around custom calls
- Preserves all CUDA kernel optimizations

## TODO

- [ ] Add fused_add_rms_norm variant
- [ ] Add Flash Attention custom call
- [ ] Add rotary embedding custom call
- [ ] Add quantization ops
- [ ] Performance benchmarking vs fallback
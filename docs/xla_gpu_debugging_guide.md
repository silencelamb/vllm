# XLA GPU Debugging Guide

## Problem: Incorrect Generation Results

When XLA GPU generates incorrect results compared to eager mode, use these debugging strategies:

## 1. Enable Debug Logging

```python
os.environ["VLLM_XLA_DEBUG"] = "1"
os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"
```

This will print debug information from XlaGpuModelRunner including:
- Number of requests and tokens
- Attention mask shapes
- Slot mapping details
- Block table information

## 2. Enable XLA HLO Dumps

```python
os.environ["XLA_FLAGS"] = "--xla_dump_hlo_as_text --xla_dump_to=/tmp/xla_dump --xla_dump_hlo_pass_re=.*"
os.environ["XLA_HLO_DEBUG"] = "1"
os.environ["XLA_IR_DEBUG"] = "1"
```

This creates HLO (High Level Optimizer) dumps in `/tmp/xla_dump/` that show:
- The computation graph XLA is compiling
- Optimization passes applied
- Final optimized HLO

## 3. Compare Eager vs Compiled Mode

Use `tests/xla_gpu/test_debug_generation.py` to compare outputs:

```python
# Test with enforce_eager=True (no compilation)
llm_eager = LLM(model="...", enforce_eager=True)

# Test with enforce_eager=False (XLA compilation)  
llm_compiled = LLM(model="...", enforce_eager=False, compilation_config={...})
```

## 4. Test Individual Components

### Attention Mask
Use `tests/xla_gpu/test_attention_mask.py` to verify:
- Causal mask creation
- Chunked-prefill support
- Request boundary handling

### KV Cache
Use `tests/xla_gpu/test_kv_cache_debug.py` to test:
- KV cache update operations
- Slot mapping correctness
- Type compatibility

## 5. Force XLA Materialization

Add strategic `xm.mark_step()` calls to force XLA to materialize tensors:

```python
import torch_xla.core.xla_model as xm

# After critical operations
xm.mark_step()  # Forces computation and syncs with device
```

## 6. Common Issues to Check

### Type Mismatches
XLA is stricter about types than PyTorch:
```python
# Bad: PyTorch auto-converts but XLA doesn't
masked_key = key * valid_mask.float()  

# Good: Explicit type matching
masked_key = key * valid_mask.to(key.dtype)
```

### Dynamic Shapes
Ensure dynamic dimensions are properly marked:
```python
torch._dynamo.mark_dynamic(tensor, dim)
```

### Attention Mask Shape
- Must be square [seq_len, seq_len] for consistency
- Use float('-inf') for masked positions, 0.0 for allowed

### Slot Mapping
- Verify block_size alignment
- Check for off-by-one errors in token positioning
- Ensure negative values (-1) for invalid slots

## 7. Debugging Workflow

1. Run minimal test case with single prompt
2. Enable all debug flags
3. Compare eager vs compiled outputs
4. Check HLO dumps for unexpected operations
5. Add xm.mark_step() to isolate problematic regions
6. Verify tensor shapes and types at each step

## 8. XLA-Specific Considerations

- XLA compiles entire graphs, so errors may appear far from root cause
- Dynamic shapes can cause recompilation - use padding when possible
- Indexing operations are expensive in XLA - batch when possible
- Avoid Python loops in compiled regions - use tensor operations

## 9. Tools and Scripts

- `tests/xla_gpu/test_compilation.py` - Main compilation test
- `tests/xla_gpu/test_debug_generation.py` - Minimal generation test
- `tests/xla_gpu/test_attention_mask.py` - Attention mask verification
- `tests/xla_gpu/test_kv_cache_debug.py` - KV cache operations
- `tests/xla_gpu/run_debug_test.py` - Run with debug flags enabled
#!/bin/bash
# Build and test XLA custom call

set -e

echo "=== Building XLA Custom Call ==="

# Option 1: Direct nvcc compilation
echo "Compiling with nvcc..."
nvcc -O2 -shared -Xcompiler -fPIC \
    -o xla_gpu_custom_ops.so \
    minimal_xla_custom_call.cu \
    -lcudart

echo "✅ Built xla_gpu_custom_ops.so"

# Option 2: Using Python extension (if needed)
# python setup_xla_custom_call.py build_ext --inplace

echo ""
echo "=== Testing XLA Custom Call ==="

# Method 1: LD_PRELOAD (forces symbol loading)
echo "Testing with LD_PRELOAD..."
LD_PRELOAD=./xla_gpu_custom_ops.so python -c "
import torch
import torch_xla
import torch_xla.core.xla_model as xm

# Define op
lib = torch.library.Library('test', 'DEF')
lib.define('add(Tensor a, Tensor b) -> Tensor')

@torch.library.impl(lib, 'add', 'XLA')
def add_xla(a, b):
    result = torch_xla._XLAC._xla_custom_call(
        [a, b], 'XlaGpuSimpleAdd', 
        [list(a.shape)], [a.dtype],
        False, '', 4, {}
    )[0]
    return result

# Test
device = xm.xla_device()
a = torch.tensor([1.0, 2.0, 3.0]).to(device)
b = torch.tensor([4.0, 5.0, 6.0]).to(device)

result = torch.ops.test.add(a, b)
ir = torch_xla._XLAC._get_xla_tensors_text([result])

print('IR contains custom_call:', 'custom_call' in ir.lower())
print('IR preview:', ir[:200])

try:
    xm.mark_step()
    print('✅ Execution successful!')
except Exception as e:
    print('❌ Execution failed:', str(e)[:100])
"

echo ""
echo "=== Alternative: Load in Python ==="
cat << 'EOF'
# In Python, you can also try:
import ctypes
ctypes.CDLL('./xla_gpu_custom_ops.so', ctypes.RTLD_GLOBAL)

# Or use torch.ops.load_library
torch.ops.load_library('./xla_gpu_custom_ops.so')
EOF

echo ""
echo "=== Notes ==="
echo "1. If execution fails with 'No registered implementation', the symbol wasn't found by XLA"
echo "2. The custom call WILL appear in IR regardless of registration"
echo "3. For production, integrate with PyTorch XLA build system"
#!/bin/bash

echo "Compiling in-place add kernel..."

# Compile the CUDA kernel to shared library
nvcc -shared -fPIC -o inplace_add.so inplace_add_kernel.cu \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_90,code=sm_90 \
    --expt-relaxed-constexpr \
    -lcudart

if [ $? -eq 0 ]; then
    echo "✓ Compilation successful: inplace_add.so"
    echo ""
    echo "Now run: python test_inplace_optimization.py"
else
    echo "✗ Compilation failed"
    exit 1
fi
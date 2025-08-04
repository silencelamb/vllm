#!/bin/bash
# Compile RMS Norm XLA custom call library

echo "Compiling RMS Norm XLA custom call..."

# Check if CUDA is available
if [ -z "$CUDA_HOME" ]; then
    CUDA_HOME=/usr/local/cuda
fi

if [ ! -d "$CUDA_HOME" ]; then
    echo "Error: CUDA not found at $CUDA_HOME"
    exit 1
fi

# Compile the CUDA file
nvcc -O3 -shared -fPIC \
    -gencode arch=compute_70,code=sm_70 \
    -gencode arch=compute_75,code=sm_75 \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_86,code=sm_86 \
    -gencode arch=compute_89,code=sm_89 \
    -gencode arch=compute_90,code=sm_90 \
    -Xcompiler -fPIC \
    -o rms_norm_xla.so \
    csrc/xla_rms_norm_simple.cu \
    -I$CUDA_HOME/include \
    -L$CUDA_HOME/lib64 \
    -lcudart

if [ $? -eq 0 ]; then
    echo "✓ Compilation successful: rms_norm_xla.so"
    echo "  You can now run the tests"
else
    echo "✗ Compilation failed"
    exit 1
fi
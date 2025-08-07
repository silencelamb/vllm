#!/bin/bash
# Compile reshape_and_cache_flash XLA custom call library

echo "Compiling reshape_and_cache_flash XLA custom call..."

# Check if CUDA is available
if [ -z "$CUDA_HOME" ]; then
    CUDA_HOME=/usr/local/cuda
fi

if [ ! -d "$CUDA_HOME" ]; then
    echo "Error: CUDA not found at $CUDA_HOME"
    exit 1
fi

# CUDA files to compile
XLA_WRAPPER="./xla_reshape_and_cache_flash.cu"
# Use the standalone kernel that doesn't depend on PyTorch
VLLM_KERNEL="../../../../csrc/xla_ops/reshape_and_cache_flash_kernel_only.cu"

if [ ! -f "$XLA_WRAPPER" ]; then
    echo "Error: $XLA_WRAPPER not found"
    exit 1
fi

if [ ! -f "$VLLM_KERNEL" ]; then
    echo "Error: $VLLM_KERNEL not found"
    echo "Looking for vLLM kernel at: $(realpath $VLLM_KERNEL 2>/dev/null || echo $VLLM_KERNEL)"
    exit 1
fi

# Compile both CUDA files together
# The standalone kernel doesn't need PyTorch headers
nvcc -O2 -shared -Xcompiler -fPIC \
    -gencode arch=compute_70,code=sm_70 \
    -gencode arch=compute_75,code=sm_75 \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_86,code=sm_86 \
    -gencode arch=compute_89,code=sm_89 \
    -gencode arch=compute_90,code=sm_90 \
    -Xcompiler -fPIC \
    -o reshape_and_cache_flash_xla.so \
    $XLA_WRAPPER $VLLM_KERNEL \
    -I$CUDA_HOME/include \
    -L$CUDA_HOME/lib64 \
    -lcudart

if [ $? -eq 0 ]; then
    echo "✓ Compilation successful: reshape_and_cache_flash_xla.so"
    echo "  You can now run the tests"
    
    # Display exported symbols
    echo ""
    echo "Exported symbols:"
    nm -D reshape_and_cache_flash_xla.so | grep reshape_and_cache_flash
else
    echo "✗ Compilation failed"
    exit 1
fi
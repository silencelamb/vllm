#!/bin/bash
# Compile debug version of reshape_and_cache_flash XLA custom call library

echo "Compiling debug version of reshape_and_cache_flash XLA custom call..."

# Check if CUDA is available
if [ -z "$CUDA_HOME" ]; then
    CUDA_HOME=/usr/local/cuda
fi

if [ ! -d "$CUDA_HOME" ]; then
    echo "Error: CUDA not found at $CUDA_HOME"
    exit 1
fi

# CUDA file to compile
CUDA_FILE="./xla_reshape_and_cache_flash_debug.cu"

if [ ! -f "$CUDA_FILE" ]; then
    echo "Error: $CUDA_FILE not found"
    exit 1
fi

# Compile the CUDA file with debug flags
nvcc -O0 -g -G -shared -Xcompiler -fPIC \
    -gencode arch=compute_70,code=sm_70 \
    -gencode arch=compute_75,code=sm_75 \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_86,code=sm_86 \
    -gencode arch=compute_89,code=sm_89 \
    -gencode arch=compute_90,code=sm_90 \
    -Xcompiler -fPIC \
    -o reshape_and_cache_flash_xla_debug.so \
    $CUDA_FILE \
    -I$CUDA_HOME/include \
    -L$CUDA_HOME/lib64 \
    -lcudart

if [ $? -eq 0 ]; then
    echo "✓ Compilation successful: reshape_and_cache_flash_xla_debug.so"
    echo "  You can now run the debug tests"
    
    # Display exported symbols
    echo ""
    echo "Exported symbols:"
    nm -D reshape_and_cache_flash_xla_debug.so | grep reshape_and_cache_flash
else
    echo "✗ Compilation failed"
    exit 1
fi
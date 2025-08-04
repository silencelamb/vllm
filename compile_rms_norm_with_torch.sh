#!/bin/bash
# Compile RMS Norm with PyTorch headers (like vLLM does)

echo "Compiling RMS Norm XLA custom call with PyTorch..."

# Check if CUDA is available
if [ -z "$CUDA_HOME" ]; then
    CUDA_HOME=/usr/local/cuda
fi

# Find PyTorch include paths
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")
TORCH_INCLUDE="${TORCH_PATH}/include"
TORCH_INCLUDE_2="${TORCH_PATH}/include/torch/csrc/api/include"

echo "PyTorch path: $TORCH_PATH"
echo "PyTorch includes: $TORCH_INCLUDE"

if [ ! -d "$TORCH_INCLUDE" ]; then
    echo "Error: PyTorch includes not found at $TORCH_INCLUDE"
    exit 1
fi

# Compile with PyTorch headers
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
    -I$TORCH_INCLUDE \
    -I$TORCH_INCLUDE_2 \
    -L$CUDA_HOME/lib64 \
    -lcudart

if [ $? -eq 0 ]; then
    echo "✓ Compilation successful: rms_norm_xla.so"
else
    echo "✗ Compilation failed"
    echo "Falling back to pure CUDA version..."
    
    # Try pure CUDA version as fallback
    nvcc -O3 -shared -fPIC \
        -gencode arch=compute_70,code=sm_70 \
        -gencode arch=compute_80,code=sm_80 \
        -Xcompiler -fPIC \
        -o rms_norm_xla.so \
        csrc/xla_rms_norm_pure.cu \
        -I$CUDA_HOME/include \
        -L$CUDA_HOME/lib64 \
        -lcudart
    
    if [ $? -eq 0 ]; then
        echo "✓ Pure CUDA version compiled successfully"
    else
        echo "✗ Both versions failed to compile"
        exit 1
    fi
fi
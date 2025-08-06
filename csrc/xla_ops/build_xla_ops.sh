#!/bin/bash
# Build XLA custom ops as a shared library

echo "Building vLLM XLA custom ops..."

# Find CUDA
if [ -z "$CUDA_HOME" ]; then
    CUDA_HOME=/usr/local/cuda
fi

# Get vLLM source directory
VLLM_ROOT=$(cd ../../ && pwd)
CSRC_DIR=${VLLM_ROOT}/csrc

# Compile reshape_and_cache_flash XLA wrapper with vLLM's cache_kernels
nvcc -O2 -shared -Xcompiler -fPIC \
    -gencode arch=compute_70,code=sm_70 \
    -gencode arch=compute_75,code=sm_75 \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_86,code=sm_86 \
    -gencode arch=compute_89,code=sm_89 \
    -gencode arch=compute_90,code=sm_90 \
    -std=c++17 \
    -o vllm_xla_ops.so \
    reshape_and_cache_flash_xla.cu \
    ${CSRC_DIR}/cache_kernels.cu \
    -I${CUDA_HOME}/include \
    -I${CSRC_DIR} \
    -L${CUDA_HOME}/lib64 \
    -lcudart \
    -D__CUDA_NO_HALF_OPERATORS__ \
    -D__CUDA_NO_HALF_CONVERSIONS__ \
    -D__CUDA_NO_BFLOAT16_CONVERSIONS__ \
    -D__CUDA_NO_HALF2_OPERATORS__

if [ $? -eq 0 ]; then
    echo "✓ Build successful: vllm_xla_ops.so"
    echo ""
    echo "Exported symbols:"
    nm -D vllm_xla_ops.so | grep vllm_reshape_and_cache_flash_xla
else
    echo "✗ Build failed"
    exit 1
fi
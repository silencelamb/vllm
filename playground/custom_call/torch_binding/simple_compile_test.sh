#!/bin/bash
# Simple compile test to check if the basic compilation works

set -e

echo "Testing basic compilation..."

# Get paths
VLLM_ROOT="../../.."
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}

# Get Python and PyTorch paths
PYTHON_INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")

# First, let's just compile the wrapper without linking to vLLM
echo "Compiling wrapper object file..."
nvcc -O3 -std=c++17 \
    -I"$PYTHON_INCLUDE" \
    -I"$TORCH_PATH/include" \
    -I"$TORCH_PATH/include/torch/csrc/api/include" \
    -I"$CUDA_HOME/include" \
    -I"$VLLM_ROOT/csrc" \
    -D_GLIBCXX_USE_CXX11_ABI=0 \
    -Xcompiler -fPIC \
    -c reshape_and_cache_flash_wrapper.cc \
    -o test_wrapper.o

if [ $? -eq 0 ]; then
    echo "✓ Compilation successful!"
    rm -f test_wrapper.o
else
    echo "✗ Compilation failed!"
    exit 1
fi
#!/bin/bash

# Compile script for flash_attn_varlen XLA custom call
# This links against vLLM's compiled flash-attention library

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../../.."

echo "========================================"
echo "Building Flash Attention XLA custom call"
echo "========================================"

# Get CUDA and PyTorch paths
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}
PYTHON_INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")
VLLM_PATH=$(python -c "import vllm; print(vllm.__path__[0])")

# Get the ABI flag from PyTorch
TORCH_ABI=$(python -c "import torch; print(int(torch._C._GLIBCXX_USE_CXX11_ABI))" 2>/dev/null || echo "0")

echo "✓ CUDA: $CUDA_HOME"
echo "✓ PyTorch: $TORCH_PATH"
echo "✓ vLLM: $VLLM_PATH"
echo "✓ PyTorch ABI: $TORCH_ABI"

# Check if vLLM flash attention library exists
VLLM_FA2_LIB="$VLLM_PATH/vllm_flash_attn/_vllm_fa2_C.abi3.so"
if [ ! -f "$VLLM_FA2_LIB" ]; then
    echo "✗ vLLM flash attention library not found at: $VLLM_FA2_LIB"
    echo "  Please ensure vLLM is properly installed with flash-attention support"
    exit 1
fi
echo "✓ Found vLLM flash attention library: $VLLM_FA2_LIB"

# Clean previous builds
rm -f *.o *.so

# Compilation flags
COMMON_NVCC_FLAGS="-O3 -std=c++17 --use_fast_math"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -D_GLIBCXX_USE_CXX11_ABI=$TORCH_ABI"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -DNDEBUG"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcompiler -fPIC"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -DTORCH_EXTENSION_NAME=flash_attn_varlen_xla"

# Architecture flags (support common GPUs)
ARCH_FLAGS=""
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_70,code=sm_70"  # V100
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_75,code=sm_75"  # T4
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_80,code=sm_80"  # A100
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_86,code=sm_86"  # RTX 3090

# Include directories
INCLUDE_FLAGS=""
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$PYTHON_INCLUDE"
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$TORCH_PATH/include"
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$TORCH_PATH/include/torch/csrc/api/include"
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$TORCH_PATH/include/TH"
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$TORCH_PATH/include/THC"
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$CUDA_HOME/include"
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$VLLM_ROOT/csrc"
INCLUDE_FLAGS="$INCLUDE_FLAGS -I$VLLM_ROOT"

# Step 1: Compile XLA wrapper
echo ""
echo "[1/2] Compiling Flash Attention XLA wrapper..."
nvcc $COMMON_NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
    -c "$SCRIPT_DIR/flash_attn_varlen_xla.cc" \
    -o flash_attn_varlen_xla.o

# Step 2: Link the shared library
echo "[2/2] Linking XLA shared library..."

# Get linker flags
TORCH_LIB="$TORCH_PATH/lib"
LINK_FLAGS="-L$TORCH_LIB -L$CUDA_HOME/lib64 -L$(dirname $VLLM_FA2_LIB)"

# Link the shared library with vLLM's flash attention
g++ -shared -fPIC \
    flash_attn_varlen_xla.o \
    -o flash_attn_varlen_xla.so \
    $LINK_FLAGS \
    -Wl,--no-as-needed \
    -l:_vllm_fa2_C.abi3.so \
    -ltorch -ltorch_cpu -ltorch_cuda \
    -lc10 -lc10_cuda \
    -lcudart -lcuda \
    -Wl,-rpath,$TORCH_LIB:$CUDA_HOME/lib64:$(dirname $VLLM_FA2_LIB)

# Verify the build
echo ""
if [ -f "flash_attn_varlen_xla.so" ]; then
    echo "✓ Build successful!"
    echo "  Generated: $(ls -lh flash_attn_varlen_xla.so | awk '{print $9, "("$5")"}')"
    
    # Check symbols
    echo ""
    echo "Checking library dependencies..."
    ldd flash_attn_varlen_xla.so | grep -E "(torch|cuda|vllm)" | head -n 10
    
    echo ""
    echo "Checking for flash attention symbols..."
    nm -D flash_attn_varlen_xla.so 2>/dev/null | grep "flash_attn_varlen_xla_custom_call" || echo "✗ Custom call symbol not found"
    
    echo ""
    echo "Checking if vLLM flash attention is linked..."
    ldd flash_attn_varlen_xla.so | grep "_vllm_fa2_C" || echo "⚠ vLLM flash attention not found in dependencies"
else
    echo "✗ Build failed!"
    exit 1
fi

# Clean up
rm -f *.o

echo ""
echo "========================================"
echo "Build complete! To test:"
echo "  python test_flash_attn_xla.py"
echo ""
echo "This build links against:"
echo "  - vLLM's flash-attention: $VLLM_FA2_LIB"
echo "  - PyTorch CUDA libraries"
echo "========================================"
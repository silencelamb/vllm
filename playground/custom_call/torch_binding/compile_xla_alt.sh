#!/bin/bash

# Alternative compile script using static linking to avoid symbol issues

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../../.."

echo "========================================"
echo "Building XLA custom call (alternative method)"
echo "========================================"

# Find CUDA
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}
if [ ! -d "$CUDA_HOME" ]; then
    echo "Error: CUDA not found at $CUDA_HOME"
    exit 1
fi

# Get Python and PyTorch paths
PYTHON_INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")
TORCH_INCLUDE="$TORCH_PATH/include"
TORCH_LIB="$TORCH_PATH/lib"

echo "✓ CUDA: $CUDA_HOME"
echo "✓ PyTorch: $TORCH_PATH"

# Clean
rm -f *.o *.a *.so

# Step 1: Compile cache_kernels.cu to object file
echo ""
echo "[1/3] Compiling cache_kernels.cu..."
nvcc -O3 -std=c++17 \
    -D_GLIBCXX_USE_CXX11_ABI=0 \
    -DNDEBUG \
    -Xcompiler -fPIC \
    -I"$PYTHON_INCLUDE" \
    -I"$TORCH_INCLUDE" \
    -I"$TORCH_INCLUDE/torch/csrc/api/include" \
    -I"$CUDA_HOME/include" \
    -I"$VLLM_ROOT/csrc" \
    -I"$VLLM_ROOT" \
    -gencode arch=compute_70,code=sm_70 \
    -gencode arch=compute_75,code=sm_75 \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_86,code=sm_86 \
    -c "$VLLM_ROOT/csrc/cache_kernels.cu" \
    -o cache_kernels.o

# Step 2: Compile XLA wrapper
echo "[2/3] Compiling XLA wrapper..."
nvcc -O3 -std=c++17 \
    -D_GLIBCXX_USE_CXX11_ABI=0 \
    -DNDEBUG \
    -Xcompiler -fPIC \
    -I"$PYTHON_INCLUDE" \
    -I"$TORCH_INCLUDE" \
    -I"$TORCH_INCLUDE/torch/csrc/api/include" \
    -I"$CUDA_HOME/include" \
    -I"$VLLM_ROOT/csrc" \
    -I"$VLLM_ROOT" \
    -c "$SCRIPT_DIR/reshape_and_cache_xla_pure.cc" \
    -o reshape_and_cache_xla_pure.o

# Step 3: Link with explicit symbol resolution
echo "[3/3] Linking XLA shared library..."

# First, extract all needed symbols from PyTorch libraries
echo "Extracting PyTorch symbols..."
nm -D "$TORCH_LIB"/libtorch.so | grep " T " | awk '{print $3}' > torch_symbols.txt
nm -D "$TORCH_LIB"/libc10.so | grep " T " | awk '{print $3}' > c10_symbols.txt

# Link with explicit libraries and symbol visibility
g++ -shared -fPIC \
    cache_kernels.o \
    reshape_and_cache_xla_pure.o \
    -o reshape_and_cache_xla.so \
    -L"$TORCH_LIB" \
    -L"$CUDA_HOME/lib64" \
    -Wl,--as-needed \
    -Wl,--no-undefined \
    -Wl,-rpath,"$TORCH_LIB":"$CUDA_HOME/lib64" \
    -ltorch -ltorch_cpu -ltorch_cuda \
    -lc10 -lc10_cuda \
    -lcudart -lcublas -lcudnn \
    -lpthread -ldl -lrt \
    2>&1 | head -n 50

# Check if successful
if [ -f "reshape_and_cache_xla.so" ]; then
    echo ""
    echo "✓ Build successful!"
    echo "  Generated: $(ls -lh reshape_and_cache_xla.so | awk '{print $9, "("$5")"}')"
    
    # Check for undefined symbols
    echo ""
    echo "Checking for undefined symbols..."
    if ldd -r reshape_and_cache_xla.so 2>&1 | grep -q "undefined symbol"; then
        echo "⚠ Warning: Found undefined symbols:"
        ldd -r reshape_and_cache_xla.so 2>&1 | grep "undefined symbol" | head -n 5
    else
        echo "✓ No undefined symbols found"
    fi
else
    echo "✗ Build failed!"
    exit 1
fi

# Clean up
rm -f *.o torch_symbols.txt c10_symbols.txt

echo ""
echo "To test: python test_xla_reshape_and_cache.py"
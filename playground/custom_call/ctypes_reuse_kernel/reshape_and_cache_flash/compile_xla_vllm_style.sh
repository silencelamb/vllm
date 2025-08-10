#!/bin/bash

# Compile script that mimics vLLM's compilation configuration
# This follows the same approach vLLM uses in its CMakeLists.txt

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../../../.."

echo "========================================"
echo "Building XLA custom call (vLLM-style compilation)"
echo "========================================"

# Get CUDA and PyTorch paths
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}
PYTHON_INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")

# Get PyTorch compilation flags (mimicking get_torch_gpu_compiler_flags from vLLM)
TORCH_CFLAGS=$(python -c "import torch; print(' '.join(torch.utils.cpp_extension.COMMON_NVCC_FLAGS))" 2>/dev/null || echo "")

# Get the ABI flag from PyTorch
TORCH_ABI=$(python -c "import torch; print(int(torch._C._GLIBCXX_USE_CXX11_ABI))" 2>/dev/null || echo "0")

echo "✓ CUDA: $CUDA_HOME"
echo "✓ PyTorch: $TORCH_PATH"
echo "✓ PyTorch ABI: $TORCH_ABI"

# Clean previous builds
rm -f *.o *.so
rm -rf build *.egg-info

# Compilation flags following vLLM's approach
COMMON_NVCC_FLAGS="-O3 -std=c++17 --use_fast_math"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -D_GLIBCXX_USE_CXX11_ABI=$TORCH_ABI"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -DNDEBUG"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcompiler -fPIC"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -DTORCH_EXTENSION_NAME=reshape_and_cache_xla"

# Architecture flags (vLLM supports these by default)
ARCH_FLAGS=""
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_70,code=sm_70"
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_75,code=sm_75"
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_80,code=sm_80"
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_86,code=sm_86"

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

# Step 1: Compile cache_kernels.cu
echo ""
echo "[1/3] Compiling cache_kernels.cu..."
nvcc $COMMON_NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
    -c "$VLLM_ROOT/csrc/cache_kernels.cu" \
    -o cache_kernels.o

# Step 2: Compile XLA wrapper
echo "[2/3] Compiling XLA wrapper..."
nvcc $COMMON_NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
    -c "$SCRIPT_DIR/reshape_and_cache_xla_pure.cc" \
    -o reshape_and_cache_xla_pure.o

# Step 3: Link following vLLM's approach
echo "[3/3] Linking XLA shared library..."

# Get linker flags from PyTorch
TORCH_LIB="$TORCH_PATH/lib"
LINK_FLAGS="-L$TORCH_LIB -L$CUDA_HOME/lib64"

# Link the shared library
# vLLM uses: target_link_libraries(${GPU_MOD_NAME} PRIVATE torch ${GPU_LIBRARIES})
# and for CUDA: CUDA::cudart CUDA::cuda_driver
g++ -shared -fPIC \
    cache_kernels.o \
    reshape_and_cache_xla_pure.o \
    -o reshape_and_cache_xla.so \
    $LINK_FLAGS \
    -Wl,--no-as-needed \
    -ltorch -ltorch_cpu -ltorch_cuda \
    -lc10 -lc10_cuda \
    -lcudart -lcuda \
    -Wl,-rpath,$TORCH_LIB:$CUDA_HOME/lib64

# Verify the build
echo ""
if [ -f "reshape_and_cache_xla.so" ]; then
    echo "✓ Build successful!"
    echo "  Generated: $(ls -lh reshape_and_cache_xla.so | awk '{print $9, "("$5")"}')"
    
    # Check symbols
    echo ""
    echo "Checking library dependencies..."
    ldd reshape_and_cache_xla.so | head -n 10
    
    echo ""
    echo "Checking for undefined symbols..."
    nm -u reshape_and_cache_xla.so 2>/dev/null | grep -E "(Warning|TORCH_CHECK)" | head -n 5 || echo "✓ No problematic undefined symbols"
else
    echo "✗ Build failed!"
    exit 1
fi

# Clean up
rm -f *.o

echo ""
echo "========================================"
echo "Build complete! To test:"
echo "  python test_xla_reshape_and_cache.py"
echo ""
echo "This build follows vLLM's compilation approach:"
echo "  - Uses PyTorch's ABI setting: $TORCH_ABI"
echo "  - Links against PyTorch and CUDA libraries"
echo "  - Uses vLLM's optimization flags"
echo "========================================"
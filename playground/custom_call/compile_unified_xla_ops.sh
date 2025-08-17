#!/bin/bash

# Unified compile script for both XLA custom call operations:
# - flash_attn_varlen
# - vllm_reshape_and_cache_flash
# This creates a single shared library with both custom calls
#
# Usage:
#   bash compile_unified_xla_ops.sh          # Normal build (suppress warnings)
#   SHOW_WARNINGS=1 bash compile_unified_xla_ops.sh  # Show all warnings

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../.."

# Check if we should show warnings
SHOW_WARNINGS=${SHOW_WARNINGS:-0}

echo "============================================================"
echo "Building Unified XLA Custom Calls Library"
if [ "$SHOW_WARNINGS" -eq 0 ]; then
    echo "(Warnings suppressed. Use SHOW_WARNINGS=1 to see all warnings)"
fi
echo "============================================================"

# Get CUDA and PyTorch paths
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}
PYTHON_INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")
VLLM_PATH=$(python -c "import vllm; print(vllm.__path__[0])")

# Get the ABI flag from PyTorch
TORCH_ABI=$(python -c "import torch; print(int(torch._C._GLIBCXX_USE_CXX11_ABI))" 2>/dev/null || echo "0")

echo "Environment:"
echo "  CUDA: $CUDA_HOME"
echo "  PyTorch: $TORCH_PATH"
echo "  vLLM: $VLLM_PATH"
echo "  PyTorch ABI: $TORCH_ABI"

# Check if vLLM flash attention library exists
VLLM_FA2_LIB="$VLLM_PATH/vllm_flash_attn/_vllm_fa2_C.abi3.so"
if [ ! -f "$VLLM_FA2_LIB" ]; then
    echo "✗ vLLM flash attention library not found at: $VLLM_FA2_LIB"
    echo "  Please ensure vLLM is properly installed with flash-attention support"
    exit 1
fi
echo "  vLLM Flash Attention: $VLLM_FA2_LIB"

# Clean previous builds
echo ""
echo "Cleaning previous builds..."
rm -f *.o *.so

# Common compilation flags
COMMON_NVCC_FLAGS="-O3 -std=c++17 --use_fast_math"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -D_GLIBCXX_USE_CXX11_ABI=$TORCH_ABI"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -DNDEBUG"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcompiler -fPIC"
# Suppress deprecated warnings from CUDA headers
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcudafe --diag_suppress=20012"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcompiler -Wno-deprecated-declarations"

COMMON_CXX_FLAGS="-O3 -std=c++17 -fPIC -D_GLIBCXX_USE_CXX11_ABI=$TORCH_ABI"
# Suppress deprecated warnings for C++ compilation
COMMON_CXX_FLAGS="$COMMON_CXX_FLAGS -Wno-deprecated-declarations"

# Architecture flags for common GPUs
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

# Step 1: Compile vLLM cache kernels (CUDA)
echo ""
echo "[1/4] Compiling vLLM cache_kernels.cu..."
if [ "$SHOW_WARNINGS" -eq 1 ]; then
    nvcc $COMMON_NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
        -DTORCH_EXTENSION_NAME=unified_xla_ops \
        -c "$VLLM_ROOT/csrc/cache_kernels.cu" \
        -o cache_kernels.o
else
    # Suppress warnings for cleaner output
    nvcc $COMMON_NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
        -DTORCH_EXTENSION_NAME=unified_xla_ops \
        -c "$VLLM_ROOT/csrc/cache_kernels.cu" \
        -o cache_kernels.o 2>&1 | grep -v "warning:" | grep -v "note:" || true
fi

# Step 2: Compile reshape_and_cache XLA wrapper (C++)
echo "[2/4] Compiling reshape_and_cache XLA wrapper..."
RESHAPE_SRC="$SCRIPT_DIR/ctypes_reuse_kernel/reshape_and_cache_flash/reshape_and_cache_xla_pure.cc"
if [ ! -f "$RESHAPE_SRC" ]; then
    echo "✗ Source file not found: $RESHAPE_SRC"
    exit 1
fi
if [ "$SHOW_WARNINGS" -eq 1 ]; then
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$RESHAPE_SRC" \
        -o reshape_and_cache_xla.o
else
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$RESHAPE_SRC" \
        -o reshape_and_cache_xla.o 2>&1 | grep -v "warning:" | grep -v "note:" || true
fi

# Step 3: Compile flash_attn_varlen XLA wrapper (C++)
echo "[3/4] Compiling flash_attn_varlen XLA wrapper..."
FLASH_SRC="$SCRIPT_DIR/flash-attn/flash_attn_varlen_xla.cc"
if [ ! -f "$FLASH_SRC" ]; then
    echo "✗ Source file not found: $FLASH_SRC"
    exit 1
fi
if [ "$SHOW_WARNINGS" -eq 1 ]; then
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$FLASH_SRC" \
        -o flash_attn_varlen_xla.o
else
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$FLASH_SRC" \
        -o flash_attn_varlen_xla.o 2>&1 | grep -v "warning:" | grep -v "note:" || true
fi

# Step 4: Link everything into a single shared library
echo "[4/4] Linking unified XLA shared library..."

# Get linker flags
TORCH_LIB="$TORCH_PATH/lib"
LINK_FLAGS="-L$TORCH_LIB -L$CUDA_HOME/lib64 -L$(dirname $VLLM_FA2_LIB)"

# Link the shared library with all components
g++ -shared -fPIC \
    cache_kernels.o \
    reshape_and_cache_xla.o \
    flash_attn_varlen_xla.o \
    -o vllm_xla_ops.so \
    $LINK_FLAGS \
    -Wl,--no-as-needed \
    $VLLM_FA2_LIB \
    -ltorch -ltorch_cpu -ltorch_cuda \
    -lc10 -lc10_cuda \
    -lcudart -lcuda \
    -Wl,-rpath,$TORCH_LIB:$CUDA_HOME/lib64:$(dirname $VLLM_FA2_LIB)

# Verify the build
echo ""
if [ -f "vllm_xla_ops.so" ]; then
    echo "✓ Build successful!"
    echo "  Generated: $(ls -lh vllm_xla_ops.so | awk '{print $9, "("$5")"}')"
    
    # Check symbols
    echo ""
    echo "Checking exported symbols..."
    echo "  Custom call symbols:"
    nm -D vllm_xla_ops.so 2>/dev/null | grep "custom_call" | head -n 5
    
    echo ""
    echo "Checking library dependencies..."
    ldd vllm_xla_ops.so | grep -E "(torch|cuda|vllm)" | head -n 10
    
    echo ""
    echo "Checking specific custom calls:"
    nm -D vllm_xla_ops.so 2>/dev/null | grep "flash_attn_varlen_xla_custom_call" && echo "  ✓ flash_attn_varlen found" || echo "  ✗ flash_attn_varlen NOT found"
    nm -D vllm_xla_ops.so 2>/dev/null | grep "reshape_and_cache_flash_xla_custom_call" && echo "  ✓ reshape_and_cache found" || echo "  ✗ reshape_and_cache NOT found"
else
    echo "✗ Build failed!"
    exit 1
fi

# Clean up intermediate files
rm -f *.o

echo ""
echo "============================================================"
echo "Build complete!"
echo ""
echo "Generated library: vllm_xla_ops.so"
echo "This library contains both XLA custom calls:"
echo "  - flash_attn_varlen"
echo "  - vllm_reshape_and_cache_flash"
echo ""
echo "To use this library, update your registration code to load"
echo "vllm_xla_ops.so instead of the individual libraries."
echo "============================================================"
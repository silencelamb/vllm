#!/bin/bash

# Compile script for XLA custom calls
# This compiles both flash_attn and reshape_and_cache into one .so file
# Output: vllm_xla_ops.so in the same directory as this script
#
# Usage:
#   bash compile_xla_ops.sh                    # Normal build (suppress warnings)
#   SHOW_WARNINGS=1 bash compile_xla_ops.sh    # Show all warnings

set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../../../.."
PLAYGROUND_DIR="$VLLM_ROOT/playground/custom_call"

# Check if we should show warnings
SHOW_WARNINGS=${SHOW_WARNINGS:-0}

echo "============================================================"
echo "Building XLA Custom Calls Library for vLLM"
echo "Output location: $SCRIPT_DIR/vllm_xla_ops.so"
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

echo ""
echo "Configuration:"
echo "  CUDA: $CUDA_HOME"
echo "  PyTorch: $TORCH_PATH"
echo "  vLLM: $VLLM_PATH"
echo "  C++ ABI: $TORCH_ABI"
echo ""

# Check if vLLM flash attention library exists
VLLM_FA2_LIB="$VLLM_PATH/vllm_flash_attn/_vllm_fa2_C.abi3.so"
if [ ! -f "$VLLM_FA2_LIB" ]; then
    echo "Error: vLLM flash attention library not found at: $VLLM_FA2_LIB"
    echo "Please ensure vLLM is properly installed with flash-attention support"
    exit 1
fi
echo "✓ Found vLLM flash attention library"

# Check source files exist
CACHE_KERNELS_SRC="$VLLM_ROOT/csrc/cache_kernels.cu"
RESHAPE_SRC="$PLAYGROUND_DIR/ctypes_reuse_kernel/reshape_and_cache_flash/reshape_and_cache_xla_pure.cc"
FLASH_SRC="$PLAYGROUND_DIR/flash-attn/flash_attn_varlen_xla.cc"

for src in "$CACHE_KERNELS_SRC" "$RESHAPE_SRC" "$FLASH_SRC"; do
    if [ ! -f "$src" ]; then
        echo "Error: Source file not found: $src"
        exit 1
    fi
done
echo "✓ All source files found"

# Clean previous builds
echo ""
echo "Cleaning previous builds..."
rm -f "$SCRIPT_DIR"/*.o "$SCRIPT_DIR"/vllm_xla_ops.so

# Compilation flags
COMMON_NVCC_FLAGS="-O3 -std=c++17 --use_fast_math"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -D_GLIBCXX_USE_CXX11_ABI=$TORCH_ABI"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -DNDEBUG"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcompiler -fPIC"
# Suppress CUDA deprecation warnings
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcudafe --diag_suppress=20012"
COMMON_NVCC_FLAGS="$COMMON_NVCC_FLAGS -Xcompiler -Wno-deprecated-declarations"

COMMON_CXX_FLAGS="-O3 -std=c++17 -fPIC"
COMMON_CXX_FLAGS="$COMMON_CXX_FLAGS -D_GLIBCXX_USE_CXX11_ABI=$TORCH_ABI"
COMMON_CXX_FLAGS="$COMMON_CXX_FLAGS -Wno-deprecated-declarations"

# Architecture flags (adjust based on your GPU)
ARCH_FLAGS=""
# Uncomment the architectures you need:
# ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_70,code=sm_70"  # V100
# ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_75,code=sm_75"  # T4
ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_80,code=sm_80"  # A100
# ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_86,code=sm_86"  # RTX 3090
# ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_89,code=sm_89"  # RTX 4090
# ARCH_FLAGS="$ARCH_FLAGS -gencode arch=compute_90,code=sm_90"  # H100

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
echo "[1/4] Compiling cache_kernels.cu..."
if [ "$SHOW_WARNINGS" -eq 1 ]; then
    nvcc $COMMON_NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
        -DTORCH_EXTENSION_NAME=vllm_xla_ops \
        -c "$CACHE_KERNELS_SRC" \
        -o "$SCRIPT_DIR/cache_kernels.o"
else
    nvcc $COMMON_NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
        -DTORCH_EXTENSION_NAME=vllm_xla_ops \
        -c "$CACHE_KERNELS_SRC" \
        -o "$SCRIPT_DIR/cache_kernels.o" 2>&1 | \
        grep -v "warning:" | grep -v "note:" || true
fi

if [ ! -f "$SCRIPT_DIR/cache_kernels.o" ]; then
    echo "Failed to compile cache_kernels.cu"
    exit 1
fi

# Step 2: Compile reshape_and_cache XLA wrapper
echo "[2/4] Compiling reshape_and_cache XLA wrapper..."
if [ "$SHOW_WARNINGS" -eq 1 ]; then
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$RESHAPE_SRC" \
        -o "$SCRIPT_DIR/reshape_and_cache_xla.o"
else
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$RESHAPE_SRC" \
        -o "$SCRIPT_DIR/reshape_and_cache_xla.o" 2>&1 | \
        grep -v "warning:" | grep -v "note:" || true
fi

if [ ! -f "$SCRIPT_DIR/reshape_and_cache_xla.o" ]; then
    echo "Failed to compile reshape_and_cache XLA wrapper"
    exit 1
fi

# Step 3: Compile flash_attn_varlen XLA wrapper
echo "[3/4] Compiling flash_attn_varlen XLA wrapper..."
if [ "$SHOW_WARNINGS" -eq 1 ]; then
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$FLASH_SRC" \
        -o "$SCRIPT_DIR/flash_attn_varlen_xla.o"
else
    g++ $COMMON_CXX_FLAGS $INCLUDE_FLAGS \
        -c "$FLASH_SRC" \
        -o "$SCRIPT_DIR/flash_attn_varlen_xla.o" 2>&1 | \
        grep -v "warning:" | grep -v "note:" || true
fi

if [ ! -f "$SCRIPT_DIR/flash_attn_varlen_xla.o" ]; then
    echo "Failed to compile flash_attn_varlen XLA wrapper"
    exit 1
fi

# Step 4: Link everything together
echo "[4/4] Linking shared library..."

TORCH_LIB="$TORCH_PATH/lib"
LINK_FLAGS="-L$TORCH_LIB -L$CUDA_HOME/lib64 -L$(dirname $VLLM_FA2_LIB)"

g++ -shared -fPIC \
    "$SCRIPT_DIR/cache_kernels.o" \
    "$SCRIPT_DIR/reshape_and_cache_xla.o" \
    "$SCRIPT_DIR/flash_attn_varlen_xla.o" \
    -o "$SCRIPT_DIR/vllm_xla_ops.so" \
    $LINK_FLAGS \
    -Wl,--no-as-needed \
    $VLLM_FA2_LIB \
    -ltorch -ltorch_cpu -ltorch_cuda \
    -lc10 -lc10_cuda \
    -lcudart -lcuda \
    -Wl,-rpath,$TORCH_LIB:$CUDA_HOME/lib64:$(dirname $VLLM_FA2_LIB)

# Clean up intermediate files
rm -f "$SCRIPT_DIR"/*.o

# Verify the build
echo ""
if [ -f "$SCRIPT_DIR/vllm_xla_ops.so" ]; then
    echo "============================================================"
    echo "✓ Build successful!"
    echo "============================================================"
    echo ""
    echo "Library location:"
    echo "  $SCRIPT_DIR/vllm_xla_ops.so"
    echo ""
    echo "Checking exported symbols..."
    
    # Check for the custom call functions
    HAS_RESHAPE=$(nm -D "$SCRIPT_DIR/vllm_xla_ops.so" 2>/dev/null | grep -c "reshape_and_cache_flash_xla_custom_call" || echo "0")
    HAS_FLASH=$(nm -D "$SCRIPT_DIR/vllm_xla_ops.so" 2>/dev/null | grep -c "flash_attn_varlen_xla_custom_call" || echo "0")
    
    if [ "$HAS_RESHAPE" -gt 0 ]; then
        echo "  ✓ reshape_and_cache_flash_xla_custom_call found"
    else
        echo "  ✗ reshape_and_cache_flash_xla_custom_call NOT found"
    fi
    
    if [ "$HAS_FLASH" -gt 0 ]; then
        echo "  ✓ flash_attn_varlen_xla_custom_call found"
    else
        echo "  ✗ flash_attn_varlen_xla_custom_call NOT found"
    fi
    
    echo ""
    echo "Library size: $(ls -lh "$SCRIPT_DIR/vllm_xla_ops.so" | awk '{print $5}')"
    echo ""
    echo "Note: Due to PJRT bug, only the first registered custom call"
    echo "      will work. This is a known XLA limitation."
    echo "============================================================"
else
    echo "✗ Build failed!"
    exit 1
fi
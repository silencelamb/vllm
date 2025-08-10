#!/bin/bash

# Compile script for XLA custom call with reshape_and_cache_flash support

set -e  # Exit on error

# Get script directory and VLLM root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../../.."

echo "========================================"
echo "Building reshape_and_cache_flash XLA custom call"
echo "========================================"

# Find CUDA
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}
if [ ! -d "$CUDA_HOME" ]; then
    echo "Error: CUDA not found at $CUDA_HOME"
    echo "Please set CUDA_HOME environment variable"
    exit 1
fi
echo "✓ CUDA found at: $CUDA_HOME"

# Get Python and PyTorch paths
PYTHON_INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")
TORCH_INCLUDE="$TORCH_PATH/include"
TORCH_LIB="$TORCH_PATH/lib"
echo "✓ PyTorch found at: $TORCH_PATH"

# Common compilation flags
NVCC_FLAGS="-O3 -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=0 -DNDEBUG -Xcompiler -fPIC --use_fast_math"
ARCH_FLAGS="-gencode arch=compute_70,code=sm_70 \
            -gencode arch=compute_75,code=sm_75 \
            -gencode arch=compute_80,code=sm_80 \
            -gencode arch=compute_86,code=sm_86"
INCLUDE_FLAGS="-I$PYTHON_INCLUDE \
               -I$TORCH_INCLUDE \
               -I$TORCH_INCLUDE/torch/csrc/api/include \
               -I$CUDA_HOME/include \
               -I$VLLM_ROOT/csrc \
               -I$VLLM_ROOT"

# Clean previous builds
echo "Cleaning previous builds..."
rm -f *.o *.so
rm -rf build *.egg-info
rm -f cache_kernels_local.cu setup_ext.py

# Step 1: Compile cache_kernels.cu from vLLM
echo ""
echo "[1/4] Compiling cache_kernels.cu..."
nvcc $NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
    -c "$VLLM_ROOT/csrc/cache_kernels.cu" \
    -o cache_kernels_xla.o

# Step 2: Compile the XLA wrapper (pure C++, no Python bindings)
echo "[2/4] Compiling reshape_and_cache_xla_pure.cc..."
nvcc $NVCC_FLAGS $ARCH_FLAGS $INCLUDE_FLAGS \
    -c "$SCRIPT_DIR/reshape_and_cache_xla_pure.cc" \
    -o reshape_and_cache_xla_pure.o

# Step 3: Link into XLA shared library
echo "[3/4] Linking XLA shared library..."
g++ -pthread -shared -fPIC \
    cache_kernels_xla.o \
    reshape_and_cache_xla_pure.o \
    -L"$TORCH_LIB" \
    -L"$CUDA_HOME/lib64" \
    -Wl,--no-as-needed \
    -Wl,--whole-archive \
    -ltorch -ltorch_cpu -ltorch_cuda \
    -Wl,--no-whole-archive \
    -lc10 -lc10_cuda \
    -lcudart \
    -Wl,-rpath,"$TORCH_LIB" \
    -Wl,--allow-shlib-undefined \
    -o reshape_and_cache_xla.so

# Step 4: Build Python extension (optional, for testing)
echo "[4/4] Building Python extension..."

# Copy cache_kernels.cu locally to avoid path issues in setup.py
cp "$VLLM_ROOT/csrc/cache_kernels.cu" cache_kernels_local.cu

# Create setup.py
cat > setup_ext.py << EOF
from setuptools import setup
from torch.utils.cpp_extension import CUDAExtension, BuildExtension
import os

vllm_root = "$VLLM_ROOT"

setup(
    name='reshape_and_cache_xla_ext',
    ext_modules=[
        CUDAExtension(
            'reshape_and_cache_xla_ext',
            sources=[
                'reshape_and_cache_flash_wrapper.cc',
                'cache_kernels_local.cu',  # Use vLLM's cache_kernels.cu
            ],
            include_dirs=[
                os.path.join(vllm_root, 'csrc'),
                vllm_root,
            ],
            extra_compile_args={
                'cxx': ['-O3', '-std=c++17', '-D_GLIBCXX_USE_CXX11_ABI=0'],
                'nvcc': [
                    '-O3',
                    '-std=c++17',
                    '--use_fast_math',
                    '-D_GLIBCXX_USE_CXX11_ABI=0',
                    '-gencode', 'arch=compute_70,code=sm_70',
                    '-gencode', 'arch=compute_75,code=sm_75',
                    '-gencode', 'arch=compute_80,code=sm_80',
                    '-gencode', 'arch=compute_86,code=sm_86',
                ],
            },
            libraries=['c10', 'c10_cuda', 'torch', 'torch_cpu', 'torch_cuda', 'cudart'],
            library_dirs=[
                os.path.join('$TORCH_LIB'),
                os.path.join('$CUDA_HOME', 'lib64'),
            ],
        ),
    ],
    cmdclass={'build_ext': BuildExtension.with_options(no_python_abi_suffix=True)},
)
EOF

# Build Python extension
python setup_ext.py build_ext --inplace 2>&1 | tail -n 20

# Clean up temporary files
echo ""
echo "Cleaning up temporary files..."
rm -f reshape_and_cache_xla_pure.o cache_kernels_xla.o
rm -f cache_kernels_local.cu setup_ext.py
rm -rf build *.egg-info

# Check results
echo ""
echo "========================================"
echo "✓ Build completed successfully!"
echo "========================================"
echo ""
echo "Generated files:"

if [ -f "reshape_and_cache_xla.so" ]; then
    echo "  ✓ XLA shared library: $(ls -lh reshape_and_cache_xla.so | awk '{print $9, "("$5")"}')"
else
    echo "  ✗ XLA shared library not found!"
    exit 1
fi

if ls reshape_and_cache_xla_ext*.so 1> /dev/null 2>&1; then
    for file in reshape_and_cache_xla_ext*.so; do
        echo "  ✓ Python extension: $(ls -lh $file | awk '{print $9, "("$5")"}')"
    done
else
    echo "  ⚠ Python extension not found (optional)"
fi

echo ""
echo "To test the XLA library:"
echo "  python test_xla_reshape_and_cache.py"
echo ""
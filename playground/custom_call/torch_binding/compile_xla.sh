#!/bin/bash

# Compile script for XLA custom call

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VLLM_ROOT="$SCRIPT_DIR/../../.."

echo "Building reshape_and_cache_flash XLA custom call..."

# Find CUDA
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}
if [ ! -d "$CUDA_HOME" ]; then
    echo "Error: CUDA not found. Please set CUDA_HOME"
    exit 1
fi

# Get Python and PyTorch paths
PYTHON_INCLUDE=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH=$(python -c "import torch; print(torch.__path__[0])")
TORCH_INCLUDE="$TORCH_PATH/include"
TORCH_LIB="$TORCH_PATH/lib"

# Compile the shared library
echo "Compiling shared library..."
nvcc -O3 -std=c++17 \
    -I"$PYTHON_INCLUDE" \
    -I"$TORCH_INCLUDE" \
    -I"$TORCH_INCLUDE/torch/csrc/api/include" \
    -I"$CUDA_HOME/include" \
    -I"$VLLM_ROOT/csrc" \
    -I"$VLLM_ROOT" \
    -D_GLIBCXX_USE_CXX11_ABI=0 \
    -DNDEBUG \
    -Xcompiler -fPIC \
    -gencode arch=compute_70,code=sm_70 \
    -gencode arch=compute_75,code=sm_75 \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_86,code=sm_86 \
    -c "$SCRIPT_DIR/reshape_and_cache_flash_wrapper.cc" \
    -o reshape_and_cache_flash_wrapper.o

# Link into shared library
echo "Linking shared library..."
g++ -shared -o "$SCRIPT_DIR/reshape_and_cache_xla.so" \
    reshape_and_cache_flash_wrapper.o \
    "$VLLM_ROOT/build/lib.linux-x86_64-cpython-*/vllm/_cache_ops.cpython-*.so" \
    -L"$TORCH_LIB" \
    -L"$CUDA_HOME/lib64" \
    -lc10 -ltorch -ltorch_cpu -ltorch_cuda \
    -lcudart -lcuda

# Also compile as Python extension
echo "Building Python extension..."

# First compile cache_kernels.cu separately to control output location
echo "Compiling cache_kernels.cu..."
nvcc -O3 -std=c++17 \
    -I"$PYTHON_INCLUDE" \
    -I"$TORCH_INCLUDE" \
    -I"$TORCH_INCLUDE/torch/csrc/api/include" \
    -I"$CUDA_HOME/include" \
    -I"$VLLM_ROOT/csrc" \
    -I"$VLLM_ROOT" \
    -D_GLIBCXX_USE_CXX11_ABI=0 \
    -DNDEBUG \
    -Xcompiler -fPIC \
    -gencode arch=compute_70,code=sm_70 \
    -gencode arch=compute_75,code=sm_75 \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_86,code=sm_86 \
    -c "$VLLM_ROOT/csrc/cache_kernels.cu" \
    -o cache_kernels.o

# Copy cache_kernels.cu locally to avoid path issues in setup.py
cp "$VLLM_ROOT/csrc/cache_kernels.cu" cache_kernels_local.cu

cat > "$SCRIPT_DIR/setup_ext.py" << EOF
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
                'cache_kernels_local.cu',  # Use local copy to avoid path issues
            ],
            include_dirs=[
                os.path.join(vllm_root, 'csrc'),
                vllm_root,
            ],
            extra_compile_args={
                'cxx': ['-O3', '-std=c++17'],
                'nvcc': [
                    '-O3',
                    '-std=c++17',
                    '--use_fast_math',
                    '-gencode', 'arch=compute_70,code=sm_70',
                    '-gencode', 'arch=compute_75,code=sm_75',
                    '-gencode', 'arch=compute_80,code=sm_80',
                    '-gencode', 'arch=compute_86,code=sm_86',
                ],
            },
        ),
    ],
    cmdclass={'build_ext': BuildExtension.with_options(no_python_abi_suffix=True)},
)
EOF

cd "$SCRIPT_DIR"
python setup_ext.py build_ext --inplace

# Also link manually with the pre-compiled object files
echo "Creating XLA shared library with manual linking..."
g++ -pthread -shared \
    cache_kernels.o \
    reshape_and_cache_flash_wrapper.o \
    -L"$TORCH_LIB" \
    -L"$CUDA_HOME/lib64" \
    -lc10 -ltorch -ltorch_cpu -ltorch_python \
    -lcudart -lc10_cuda -ltorch_cuda \
    -o reshape_and_cache_xla_manual.so

# Clean up
rm -f reshape_and_cache_flash_wrapper.o cache_kernels.o
rm -f cache_kernels_local.cu
rm -rf build
rm -f setup_ext.py

echo "✓ Build completed successfully!"
echo "  - XLA shared library: $SCRIPT_DIR/reshape_and_cache_xla.so"
echo "  - XLA manual library: $SCRIPT_DIR/reshape_and_cache_xla_manual.so"
echo "  - Python extension: $SCRIPT_DIR/reshape_and_cache_xla_ext*.so"
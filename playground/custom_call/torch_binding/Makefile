# Makefile for building XLA custom call

VLLM_ROOT := ../../..
CUDA_HOME ?= /usr/local/cuda

# Python paths
PYTHON_INCLUDE := $(shell python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")
TORCH_PATH := $(shell python -c "import torch; print(torch.__path__[0])")
TORCH_INCLUDE := $(TORCH_PATH)/include
TORCH_LIB := $(TORCH_PATH)/lib

# Compiler flags
NVCC := nvcc
CXX := g++
CXXFLAGS := -O3 -std=c++17 -fPIC -D_GLIBCXX_USE_CXX11_ABI=0 -DNDEBUG
NVCCFLAGS := -O3 -std=c++17 --use_fast_math -Xcompiler -fPIC

# CUDA architectures
CUDA_ARCHS := -gencode arch=compute_70,code=sm_70 \
              -gencode arch=compute_75,code=sm_75 \
              -gencode arch=compute_80,code=sm_80 \
              -gencode arch=compute_86,code=sm_86

# Include paths
INCLUDES := -I$(PYTHON_INCLUDE) \
            -I$(TORCH_INCLUDE) \
            -I$(TORCH_INCLUDE)/torch/csrc/api/include \
            -I$(CUDA_HOME)/include \
            -I$(VLLM_ROOT)/csrc \
            -I$(VLLM_ROOT)

# Libraries
LIBS := -L$(TORCH_LIB) -L$(CUDA_HOME)/lib64 \
        -lc10 -ltorch -ltorch_cpu -ltorch_cuda -lcudart -lcuda

# Targets
.PHONY: all clean test

all: reshape_and_cache_xla.so reshape_and_cache_xla_ext.so

# Build object file
reshape_and_cache_flash_wrapper.o: reshape_and_cache_flash_wrapper.cc
	$(NVCC) $(NVCCFLAGS) $(CUDA_ARCHS) $(INCLUDES) -c $< -o $@

# Build XLA shared library
reshape_and_cache_xla.so: reshape_and_cache_flash_wrapper.o
	$(CXX) -shared -o $@ $< $(VLLM_ROOT)/build/lib.*/vllm/_cache_ops*.so $(LIBS)

# Build Python extension
reshape_and_cache_xla_ext.so: setup_ext.py
	python setup_ext.py build_ext --inplace
	rm -rf build

setup_ext.py: Makefile
	@echo "Creating setup_ext.py..."
	@cat > $@ <<EOF
from setuptools import setup
from torch.utils.cpp_extension import CUDAExtension, BuildExtension
import os

vllm_root = "$(VLLM_ROOT)"

setup(
    name='reshape_and_cache_xla_ext',
    ext_modules=[
        CUDAExtension(
            'reshape_and_cache_xla_ext',
            sources=[
                'reshape_and_cache_flash_wrapper.cc',
                os.path.join(vllm_root, 'csrc/cache_kernels.cu'),
            ],
            include_dirs=[
                os.path.join(vllm_root, 'csrc'),
                vllm_root,
            ],
            extra_compile_args={
                'cxx': ['$(CXXFLAGS)'],
                'nvcc': ['$(NVCCFLAGS)'] + '$(CUDA_ARCHS)'.split(),
            },
        ),
    ],
    cmdclass={'build_ext': BuildExtension.with_options(no_python_abi_suffix=True)},
)
EOF

test: all
	python test_xla_reshape_and_cache.py

clean:
	rm -f *.o *.so setup_ext.py
	rm -rf build __pycache__ *.egg-info
# Makefile for building XLA GPU custom call

# Compiler settings
NVCC = nvcc
CXX = g++
PYTHON = python

# CUDA settings
CUDA_HOME ?= /usr/local/cuda
CUDA_INCLUDE = $(CUDA_HOME)/include
CUDA_LIB = $(CUDA_HOME)/lib64

# PyTorch settings
TORCH_INCLUDE := $(shell python -c "import torch; print(torch.utils.cpp_extension.include_paths()[0])")
TORCH_LIB := $(shell python -c "import torch; print(torch.utils.cpp_extension.library_paths()[0])")

# XLA settings (adjust based on your installation)
XLA_INCLUDE ?= /usr/include/xla
TF_INCLUDE ?= $(shell python -c "import tensorflow as tf; print(tf.sysconfig.get_include())" 2>/dev/null || echo "/usr/include/tensorflow")

# Compilation flags
NVCC_FLAGS = -std=c++17 -O2 --expt-relaxed-constexpr -Xcompiler -fPIC
CXX_FLAGS = -std=c++17 -O2 -fPIC -shared

# Include directories
INCLUDES = -I$(CUDA_INCLUDE) -I$(TORCH_INCLUDE) -I$(XLA_INCLUDE) -I$(TF_INCLUDE)

# Library paths
LDFLAGS = -L$(CUDA_LIB) -L$(TORCH_LIB) -lcudart

# Target
TARGET = xla_gpu_custom_ops.so

.PHONY: all clean test

all: $(TARGET)

# Build the shared library
$(TARGET): xla_gpu_simple_add_kernel.cu
	$(NVCC) $(NVCC_FLAGS) $(INCLUDES) -Xcompiler -fPIC -shared -o $@ $< $(LDFLAGS)
	@echo "✅ Built $(TARGET)"

# Alternative: build with setup.py
setup:
	python setup_xla_custom_call.py build_ext --inplace

# Test the custom call
test: $(TARGET)
	python test_real_xla_custom_call.py

# Clean build artifacts
clean:
	rm -f $(TARGET) *.o
	rm -rf build/ dist/ *.egg-info/
	rm -rf xla_dump/

# Show configuration
info:
	@echo "CUDA_HOME: $(CUDA_HOME)"
	@echo "TORCH_INCLUDE: $(TORCH_INCLUDE)"
	@echo "XLA_INCLUDE: $(XLA_INCLUDE)"
	@echo "Target: $(TARGET)"
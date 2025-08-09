#!/bin/bash

echo "Compiling combined KV cache wrapper..."

# Compile the combined KV wrapper
nvcc -c -fPIC xla_combined_kv_wrapper.cu -o combined_kv_wrapper.o \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_90,code=sm_90 \
    --expt-relaxed-constexpr

# Create shared library
nvcc -shared -o combined_kv_xla.so combined_kv_wrapper.o \
    -gencode arch=compute_80,code=sm_80 \
    -gencode arch=compute_90,code=sm_90

echo "✓ Compilation complete: combined_kv_xla.so"
#!/bin/bash
set -e

echo "Compiling debug XLA custom call..."

# Compile the debug version
nvcc -O2 -shared -Xcompiler -fPIC \
  xla_reshape_and_cache_flash_debug.cu \
  -o reshape_and_cache_flash_xla.so \
  -gencode arch=compute_80,code=sm_80 \
  -gencode arch=compute_86,code=sm_86 \
  -gencode arch=compute_89,code=sm_89 \
  -gencode arch=compute_90,code=sm_90

echo "✓ Compilation successful!"
echo "Generated: reshape_and_cache_flash_xla.so"
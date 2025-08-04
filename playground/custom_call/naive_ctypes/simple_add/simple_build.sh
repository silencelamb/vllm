#!/bin/bash
# Simple build script for XLA custom call

echo "Building XLA Custom Call kernel..."

# Build shared library
nvcc -O2 --shared -Xcompiler -fPIC \
    -o xla_simple_add.so \
    simple_xla_kernel.cu

if [ $? -eq 0 ]; then
    echo "✅ Build successful: xla_simple_add.so"
    echo ""
    echo "To use:"
    echo "  LD_PRELOAD=./xla_simple_add.so python your_script.py"
else
    echo "❌ Build failed"
    exit 1
fi
#!/bin/bash

# Build script for XLA GPU PagedAttention custom op

# Set paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_LIB="$SCRIPT_DIR/xla_gpu_paged_attention.so"

# Find CUDA and XLA paths
CUDA_HOME=${CUDA_HOME:-/usr/local/cuda}
XLA_INCLUDE=${XLA_INCLUDE:-$(python -c "import torch_xla; import os; print(os.path.dirname(torch_xla.__file__) + '/include')" 2>/dev/null)}

# If XLA include not found via torch_xla, try alternative paths
if [ -z "$XLA_INCLUDE" ] || [ ! -d "$XLA_INCLUDE" ]; then
    # Try to find XLA headers in common locations
    for path in /usr/local/include/xla /opt/xla/include ~/xla/include; do
        if [ -d "$path" ]; then
            XLA_INCLUDE="$path"
            break
        fi
    done
fi

echo "Building XLA GPU PagedAttention custom op..."
echo "CUDA_HOME: $CUDA_HOME"
echo "XLA_INCLUDE: $XLA_INCLUDE"
echo "Output: $OUTPUT_LIB"

# Compile the custom op
nvcc -O3 \
    -shared \
    -fPIC \
    -std=c++17 \
    -I"$CUDA_HOME/include" \
    -I"$XLA_INCLUDE" \
    -L"$CUDA_HOME/lib64" \
    -lcudart \
    "$SCRIPT_DIR/xla_gpu_paged_attention_kernel.cc" \
    -o "$OUTPUT_LIB"

if [ $? -eq 0 ]; then
    echo "✅ Successfully built $OUTPUT_LIB"
else
    echo "❌ Build failed"
    exit 1
fi
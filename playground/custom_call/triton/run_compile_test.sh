#!/bin/bash

echo "Testing Triton + torch.compile compatibility..."
echo ""

# Set environment variables for XLA
export CUDA_VISIBLE_DEVICES=0
export PJRT_DEVICE=CUDA
export GPU_NUM_DEVICES=1
export XLA_DYNAMO_DEBUG=1

# Optional: Enable more verbose debugging
# export XLA_FLAGS="--xla_dump_to=/tmp/xla_dump --xla_dump_hlo_as_text"

# Run the test
python test_torch_compile_triton.py

echo ""
echo "Test complete!"
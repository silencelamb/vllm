#!/bin/bash

# Run script for flash attention XLA custom call test

# Set environment variables for XLA
export CUDA_VISIBLE_DEVICES=0
export PJRT_DEVICE=CUDA
export GPU_NUM_DEVICES=1
export XLA_DYNAMO_DEBUG=0
export XLA_FLAGS=--xla_dump_to=./xla_dump/

echo "========================================"
echo "Running Flash Attention XLA Custom Call Test"
echo "========================================"
echo ""
echo "Environment:"
echo "  CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
echo "  PJRT_DEVICE=$PJRT_DEVICE"
echo "  GPU_NUM_DEVICES=$GPU_NUM_DEVICES"
echo ""

# Run the test
python test_flash_attn_xla.py
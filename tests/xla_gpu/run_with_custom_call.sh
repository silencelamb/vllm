#!/bin/bash
# Run Python script with XLA custom call library preloaded

# Check if library exists
if [ ! -f "xla_gpu_custom_ops.so" ]; then
    echo "Building custom call library..."
    bash build_and_test.sh
fi

# Get absolute path
LIB_PATH=$(realpath xla_gpu_custom_ops.so)

# Run with LD_PRELOAD
echo "Running with LD_PRELOAD=${LIB_PATH}"
echo "=" 
LD_PRELOAD=${LIB_PATH} python test_xla_custom_op_registration.py
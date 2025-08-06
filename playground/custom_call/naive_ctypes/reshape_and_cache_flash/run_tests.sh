#!/bin/bash
# Run all test scripts for reshape_and_cache_flash

echo "======================================================================"
echo "Running reshape_and_cache_flash XLA custom call tests"
echo "======================================================================"

# Set environment variables
export CUDA_VISIBLE_DEVICES=3
export PJRT_DEVICE=CUDA
export GPU_NUM_DEVICES=1
export XLA_DYNAMO_DEBUG=0

# Compile the library first
echo "Step 1: Compiling library..."
bash compile_reshape_and_cache.sh
if [ $? -ne 0 ]; then
    echo "✗ Compilation failed"
    exit 1
fi

echo ""
echo "======================================================================"
echo "Test 1: Basic functionality test"
echo "======================================================================"
python test_reshape_and_cache_flash.py

echo ""
echo "======================================================================"
echo "Test 2: Direct XLA approach (recommended)"
echo "======================================================================"
python test_direct_xla.py

echo ""
echo "======================================================================"
echo "Test 3: Using vLLM's registered ops"
echo "======================================================================"
python test_use_vllm_ops.py

echo ""
echo "======================================================================"
echo "Test 4: TPU-style solution (if supported)"
echo "======================================================================"
python test_tpu_style_solution.py

echo ""
echo "======================================================================"
echo "Test 5: Simple test without torch.compile"
echo "======================================================================"
python test_simple.py

echo ""
echo "======================================================================"
echo "Summary"
echo "======================================================================"
echo "Recommended approaches:"
echo "1. test_direct_xla.py - Direct XLA calls with torch._dynamo.allow_in_graph"
echo "2. test_use_vllm_ops.py - Use vLLM's functions directly (not torch.ops)"
echo "3. For production: Integrate directly into xla_gpu_native.py"
echo "======================================================================"
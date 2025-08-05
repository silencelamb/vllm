#!/usr/bin/env python3
"""Debug script for Dynamo compilation issues"""

import os
import sys

# Enable detailed Dynamo debugging
os.environ["TORCHDYNAMO_VERBOSE"] = "1"
os.environ["TORCH_LOGS"] = "+dynamo"
os.environ["TORCH_COMPILE_DEBUG"] = "1"

# Set XLA GPU environment
os.environ["VLLM_USE_XLA_GPU"] = "1"
os.environ["VLLM_USE_V1"] = "1"
os.environ["CUDA_VISIBLE_DEVICES"] = "3"
os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"

# XLA GPU settings
os.environ["GPU_NUM_DEVICES"] = "1"
os.environ["PJRT_DEVICE"] = "CUDA"
os.environ["XLA_PYTHON_CLIENT_PREALLOCATE"] = "false"

# Offline mode
os.environ["HF_HUB_OFFLINE"] = "1"
os.environ["TRANSFORMERS_OFFLINE"] = "1"

import torch
print(f"PyTorch version: {torch.__version__}")

# Try to import and test without running full model
try:
    from vllm.v1.attention.backends.xla_gpu_native import (
        XlaGpuPagedAttentionBackend,
        XlaGpuPagedMetadata
    )
    print("✅ Successfully imported XLA GPU backend")
    
    # Try to create a simple test
    import torch
    backend = XlaGpuPagedAttentionBackend()
    print(f"✅ Created backend: {backend.get_name()}")
    
    # Test if custom ops are registered
    if hasattr(torch.ops.vllm, 'xla_reshape_and_cache_flash'):
        print("✅ xla_reshape_and_cache_flash is registered")
    else:
        print("❌ xla_reshape_and_cache_flash is NOT registered")
        
    if hasattr(torch.ops.vllm, 'xla_flash_attn_varlen_func'):
        print("✅ xla_flash_attn_varlen_func is registered")
    else:
        print("❌ xla_flash_attn_varlen_func is NOT registered")
    
except Exception as e:
    print(f"❌ Error during import/test: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)

print("\n" + "="*50)
print("Now testing with minimal vLLM initialization...")
print("="*50 + "\n")

try:
    from vllm import LLM, SamplingParams
    
    # Minimal test
    sampling_params = SamplingParams(
        temperature=0.0,
        max_tokens=5
    )
    
    llm = LLM(
        model="Qwen/Qwen3-0.6B",
        max_num_batched_tokens=32,
        max_model_len=32,
        max_num_seqs=2,
        enforce_eager=False,  # Enable compilation
        tensor_parallel_size=1,
        gpu_memory_utilization=0.1,
        compilation_config={
            "use_torch_compile": True,
            "backend": "openxla",
            "torch_compile_options": {
                "backend": "openxla",
                "dynamic": True,
                "fullgraph": False,
            }
        },
    )
    
    print("✅ LLM initialized successfully")
    
except Exception as e:
    print(f"❌ Error during LLM initialization: {e}")
    import traceback
    traceback.print_exc()
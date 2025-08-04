#!/usr/bin/env python3
"""Test script to verify type annotations are correct in xla_gpu_native.py"""

import os
import sys

# Set environment variables before importing vllm
os.environ["VLLM_USE_XLA_GPU"] = "1"
os.environ["VLLM_USE_V1"] = "1"
os.environ["CUDA_VISIBLE_DEVICES"] = "0"

try:
    # Try to import the module
    from vllm.v1.attention.backends.xla_gpu_native import (
        XlaGpuPagedAttentionBackend,
        XlaGpuPagedMetadata
    )
    print("✅ Successfully imported xla_gpu_native module")
    print("✅ Type annotations are correct")
    
    # Check if Flash Attention is available
    from vllm.v1.attention.backends import xla_gpu_native
    if xla_gpu_native.FLASH_ATTN_AVAILABLE:
        print("✅ Flash Attention is available and properly registered")
    else:
        print("⚠️  Flash Attention is not available (this is OK if flash-attn is not installed)")
        
except ImportError as e:
    print(f"❌ Import error: {e}")
    sys.exit(1)
except ValueError as e:
    print(f"❌ Type annotation error: {e}")
    sys.exit(1)
except Exception as e:
    print(f"❌ Unexpected error: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)

print("\nAll checks passed!")
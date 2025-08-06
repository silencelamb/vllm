#!/usr/bin/env python3
"""Extract the reshape_and_cache_flash kernel from vLLM's source."""

import os
import re

# Read the vLLM cache_kernels.cu file
vllm_path = os.path.abspath("../../../../csrc/cache_kernels.cu")
with open(vllm_path, 'r') as f:
    content = f.read()

# Extract just the reshape_and_cache_flash_kernel template
pattern = r'(template <typename scalar_t, typename cache_t, Fp8KVCacheDataType kv_dt>\s*__global__ void reshape_and_cache_flash_kernel\([^}]+\})'
match = re.search(pattern, content, re.DOTALL)

if match:
    kernel_code = match.group(1)
    
    # Create a standalone kernel file
    output = """// Extracted vLLM reshape_and_cache_flash kernel
#include <cuda_runtime.h>
#include <cuda_fp16.h>
#include <cuda_bf16.h>
#include <cstdint>

namespace vllm {

enum Fp8KVCacheDataType {
  kAuto = 0,
  kFp8E4M3 = 1,
  kFp8E5M2 = 2,
};

""" + kernel_code + """

}  // namespace vllm
"""
    
    with open('vllm_kernel.cuh', 'w') as f:
        f.write(output)
    
    print("✓ Extracted kernel to vllm_kernel.cuh")
else:
    print("✗ Could not extract kernel")
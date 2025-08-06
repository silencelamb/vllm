#!/usr/bin/env python3
"""Build XLA custom ops using the standalone kernel implementation."""

import os
import subprocess
import sys

def main():
    print("Building vLLM XLA custom ops (standalone version)...")
    
    # Check for CUDA
    cuda_home = os.environ.get('CUDA_HOME', '/usr/local/cuda')
    if not os.path.exists(cuda_home):
        print(f"Error: CUDA not found at {cuda_home}")
        print("Please set CUDA_HOME environment variable")
        sys.exit(1)
    
    # Build command for standalone kernel
    nvcc_cmd = [
        "nvcc",
        "-O2",
        "-shared",
        "-Xcompiler", "-fPIC",
        "-std=c++17",
        "-o", "vllm_xla_ops_standalone.so",
        "reshape_and_cache_flash_kernel_only.cu",
        f"-I{cuda_home}/include",
        f"-L{cuda_home}/lib64",
        "-lcudart",
        "-gencode", "arch=compute_70,code=sm_70",
        "-gencode", "arch=compute_75,code=sm_75",
        "-gencode", "arch=compute_80,code=sm_80",
        "-gencode", "arch=compute_86,code=sm_86",
        "-gencode", "arch=compute_89,code=sm_89",
        "-gencode", "arch=compute_90,code=sm_90",
        "-D__CUDA_NO_HALF_OPERATORS__",
        "-D__CUDA_NO_HALF_CONVERSIONS__",
        "-D__CUDA_NO_BFLOAT16_CONVERSIONS__",
        "-D__CUDA_NO_HALF2_OPERATORS__",
    ]
    
    print("Compiling with command:")
    print(" ".join(nvcc_cmd))
    
    result = subprocess.run(nvcc_cmd)
    
    if result.returncode == 0:
        print("✓ Build successful: vllm_xla_ops_standalone.so")
        
        # Check exported symbols
        print("\nExported symbols:")
        result = subprocess.run(["nm", "-D", "vllm_xla_ops_standalone.so"], 
                               capture_output=True, text=True)
        for line in result.stdout.split('\n'):
            if 'vllm_reshape_and_cache_flash_xla' in line:
                print(line)
    else:
        print("✗ Build failed")
        exit(1)

if __name__ == "__main__":
    main()
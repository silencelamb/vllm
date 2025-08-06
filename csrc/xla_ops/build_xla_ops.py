#!/usr/bin/env python3
"""Build XLA custom ops without PyTorch dependencies."""

import os
import subprocess
import sys

def main():
    print("Building vLLM XLA custom ops...")
    
    # Get paths
    vllm_root = os.path.abspath("../..")
    csrc_dir = vllm_root + "/csrc"
    
    # Check for CUDA
    cuda_home = os.environ.get('CUDA_HOME', '/usr/local/cuda')
    if not os.path.exists(cuda_home):
        print(f"Warning: CUDA not found at {cuda_home}")
        cuda_home = "/usr/local/cuda"  # Try default
    
    # Build command - compile without linking PyTorch
    # The symbols will be resolved at runtime when loaded in Python
    nvcc_cmd = [
        "nvcc",
        "-O2",
        "-shared",
        "-Xcompiler", "-fPIC",
        "-std=c++17",
        "-o", "vllm_xla_ops.so",
        "reshape_and_cache_flash_xla.cu",
        f"{csrc_dir}/cache_kernels.cu",
        f"-I{cuda_home}/include",
        f"-I{csrc_dir}",
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
        "-Xlinker", "--allow-shlib-undefined",  # Allow undefined symbols that will be resolved at runtime
    ]
    
    print("Compiling with command:")
    print(" ".join(nvcc_cmd))
    
    result = subprocess.run(nvcc_cmd)
    
    if result.returncode == 0:
        print("✓ Build successful: vllm_xla_ops.so")
        
        # Check exported symbols
        print("\nExported symbols:")
        result = subprocess.run(["nm", "-D", "vllm_xla_ops.so"], 
                               capture_output=True, text=True)
        for line in result.stdout.split('\n'):
            if 'vllm_reshape_and_cache_flash_xla' in line:
                print(line)
                
        # Check for undefined symbols (informational)
        print("\nChecking for undefined symbols (these will be resolved at runtime):")
        result = subprocess.run(["ldd", "-r", "vllm_xla_ops.so"], 
                               capture_output=True, text=True, stderr=subprocess.STDOUT)
        undefined_count = result.stdout.count('undefined symbol')
        if undefined_count > 0:
            print(f"  Found {undefined_count} undefined symbols (normal for runtime linking)")
    else:
        print("✗ Build failed")
        exit(1)

if __name__ == "__main__":
    main()
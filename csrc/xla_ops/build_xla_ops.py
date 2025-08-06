#!/usr/bin/env python3
"""Build XLA custom ops with PyTorch's build system."""

import os
import subprocess
import torch
from torch.utils.cpp_extension import CUDA_HOME

def get_torch_flags():
    """Get PyTorch's CUDA compilation flags."""
    from torch.utils.cpp_extension import _get_cuda_arch_flags
    
    # Get PyTorch's include paths
    torch_include = torch.utils.cpp_extension.include_paths()
    
    # Get CUDA arch flags
    cuda_flags = _get_cuda_arch_flags()
    
    return torch_include, cuda_flags

def main():
    print("Building vLLM XLA custom ops...")
    
    # Get paths
    vllm_root = os.path.abspath("../..")
    csrc_dir = vllm_root + "/csrc"
    
    # Get PyTorch configuration
    torch_includes, cuda_flags = get_torch_flags()
    
    # Build include flags
    include_flags = []
    for inc in torch_includes:
        include_flags.append(f"-I{inc}")
    include_flags.append(f"-I{CUDA_HOME}/include")
    include_flags.append(f"-I{csrc_dir}")
    
    # Get PyTorch library path
    torch_lib = os.path.dirname(torch._C.__file__)
    
    # Build command
    nvcc_cmd = [
        "nvcc",
        "-O2",
        "-shared",
        "-Xcompiler", "-fPIC",
        "-std=c++17",
        "-o", "vllm_xla_ops.so",
        "reshape_and_cache_flash_xla.cu",
        f"{csrc_dir}/cache_kernels.cu",
        f"-L{CUDA_HOME}/lib64",
        f"-L{torch_lib}",
        "-lcudart",
        "-lc10",
        "-ltorch",
        "-ltorch_cpu",
        "-ltorch_cuda",
        f"-Wl,-rpath,{torch_lib}",
        "-D__CUDA_NO_HALF_OPERATORS__",
        "-D__CUDA_NO_HALF_CONVERSIONS__",
        "-D__CUDA_NO_BFLOAT16_CONVERSIONS__",
        "-D__CUDA_NO_HALF2_OPERATORS__",
    ] + cuda_flags + include_flags
    
    print("Compiling with command:")
    print(" ".join(nvcc_cmd))
    
    result = subprocess.run(nvcc_cmd)
    
    if result.returncode == 0:
        print("✓ Build successful: vllm_xla_ops.so")
        
        # Check exported symbols
        print("\nExported symbols:")
        subprocess.run(["nm", "-D", "vllm_xla_ops.so"], 
                      stdin=subprocess.PIPE, 
                      stdout=subprocess.PIPE,
                      text=True)
        result = subprocess.run(["nm", "-D", "vllm_xla_ops.so"], 
                               capture_output=True, text=True)
        for line in result.stdout.split('\n'):
            if 'vllm_reshape_and_cache_flash_xla' in line:
                print(line)
    else:
        print("✗ Build failed")
        exit(1)

if __name__ == "__main__":
    main()
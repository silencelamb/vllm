"""Setup script for building XLA custom call extensions."""

from setuptools import setup
from torch.utils.cpp_extension import CUDAExtension, BuildExtension
import os
import torch

# Get XLA include paths
def get_xla_include_dirs():
    """Get XLA/TorchXLA include directories."""
    try:
        import torch_xla
        xla_path = os.path.dirname(torch_xla.__file__)
        xla_includes = [
            os.path.join(xla_path, 'include'),
        ]
    except ImportError:
        print("Warning: torch_xla not found, using default paths")
        xla_includes = []
    
    # Also add vLLM includes
    vllm_root = os.path.dirname(os.path.abspath(__file__))
    include_dirs = xla_includes + [
        os.path.join(vllm_root, 'csrc'),
        os.path.join(torch.utils.cpp_extension.include_paths()[0]),  # PyTorch includes
        os.path.join(torch.utils.cpp_extension.include_paths()[1]),  # PyTorch C++ API
    ]
    
    # Add CUDA includes if available
    cuda_home = os.environ.get('CUDA_HOME', '/usr/local/cuda')
    if os.path.exists(cuda_home):
        include_dirs.append(os.path.join(cuda_home, 'include'))
    
    return include_dirs

# Define the extension - simplified version that doesn't recompile vLLM kernels
ext_modules = [
    CUDAExtension(
        name='vllm._C_xla',
        sources=[
            'csrc/xla_rms_norm_simple.cu',  # Use simplified version (.cu for CUDA)
            # The actual vLLM kernels are already compiled in vllm._C
        ],
        include_dirs=get_xla_include_dirs(),
        extra_compile_args={
            'cxx': ['-O3', '-std=c++17'],
            'nvcc': [
                '-O3',
                '-gencode', 'arch=compute_70,code=sm_70',
                '-gencode', 'arch=compute_75,code=sm_75',
                '-gencode', 'arch=compute_80,code=sm_80',
                '-gencode', 'arch=compute_86,code=sm_86',
            ],
        },
        libraries=['cudart'],  # Link against CUDA runtime
        library_dirs=[os.path.join(os.environ.get('CUDA_HOME', '/usr/local/cuda'), 'lib64')],
    ),
]

setup(
    name='vllm-xla-extensions',
    ext_modules=ext_modules,
    cmdclass={
        'build_ext': BuildExtension.with_options(no_python_abi_suffix=True)
    },
    zip_safe=False,
)
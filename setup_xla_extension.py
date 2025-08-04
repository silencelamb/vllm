"""Setup script for building XLA custom call extensions."""

from setuptools import setup
from torch.utils.cpp_extension import CUDAExtension, BuildExtension
import os

# Get XLA include paths
def get_xla_include_dirs():
    """Get XLA/TorchXLA include directories."""
    import torch_xla
    
    xla_path = os.path.dirname(torch_xla.__file__)
    include_dirs = [
        os.path.join(xla_path, 'include'),
        # Add other XLA include paths if needed
    ]
    
    # Also add vLLM includes
    vllm_root = os.path.dirname(os.path.abspath(__file__))
    include_dirs.extend([
        os.path.join(vllm_root, 'csrc'),
    ])
    
    return include_dirs

# Define the extension
ext_modules = [
    CUDAExtension(
        name='vllm._C_xla',
        sources=[
            'csrc/xla_rms_norm_wrapper.cc',
            'csrc/layernorm_kernels.cu',  # Include the original kernel
            # Add other necessary source files
        ],
        include_dirs=get_xla_include_dirs(),
        extra_compile_args={
            'cxx': ['-O3', '-std=c++17'],
            'nvcc': [
                '-O3',
                '--expt-extended-lambda',
                '-gencode', 'arch=compute_70,code=sm_70',
                '-gencode', 'arch=compute_75,code=sm_75',
                '-gencode', 'arch=compute_80,code=sm_80',
                '-gencode', 'arch=compute_86,code=sm_86',
                '-gencode', 'arch=compute_89,code=sm_89',
                '-gencode', 'arch=compute_90,code=sm_90',
            ],
        },
        libraries=['cuda'],  # Link against CUDA runtime
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
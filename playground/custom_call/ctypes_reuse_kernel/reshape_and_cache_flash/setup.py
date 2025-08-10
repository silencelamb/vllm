from setuptools import setup, Extension
from torch.utils.cpp_extension import BuildExtension, CUDAExtension
import os

# 获取包含路径
torch_include = []
cuda_include = []

try:
    import torch
    torch_include = [
        os.path.join(torch.__path__[0], 'include'),
        os.path.join(torch.__path__[0], 'include', 'torch', 'csrc', 'api', 'include'),
    ]
except:
    pass

try:
    import torch_xla
    # 添加 XLA 相关的包含路径
    xla_include = []
    # 注意：实际路径可能需要调整
except:
    xla_include = []

# 定义扩展模块
ext_modules = [
    CUDAExtension(
        'reshape_and_cache_ops_xla',
        sources=[
            'reshape_and_cache_ops.cpp',
            'reshape_and_cache_flash_xla.cc',
        ],
        include_dirs=torch_include + cuda_include + xla_include + [
            # 添加 vLLM 源码路径以访问原始的 cache_kernels.h
            '../../../csrc',
        ],
        extra_compile_args={
            'cxx': ['-O3', '-std=c++17'],
            'nvcc': [
                '-O3',
                '-std=c++17',
                '--use_fast_math',
                '-gencode', 'arch=compute_70,code=sm_70',
                '-gencode', 'arch=compute_75,code=sm_75',
                '-gencode', 'arch=compute_80,code=sm_80',
                '-gencode', 'arch=compute_86,code=sm_86',
            ],
        },
    ),
]

setup(
    name='vllm_xla_ops',
    version='0.1.0',
    author='vLLM XLA Team',
    description='XLA custom ops for vLLM',
    ext_modules=ext_modules,
    cmdclass={
        'build_ext': BuildExtension.with_options(no_python_abi_suffix=True),
    },
    py_modules=['xla_ops'],
    zip_safe=False,
)
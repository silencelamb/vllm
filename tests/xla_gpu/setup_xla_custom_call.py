"""Setup script to build XLA custom call implementation."""

from setuptools import setup
from torch.utils.cpp_extension import CUDAExtension, BuildExtension
import torch_xla
import os

# Get XLA include paths
def get_xla_include_dirs():
    """Get XLA/TensorFlow include directories."""
    try:
        import tensorflow as tf
        tf_include = tf.sysconfig.get_include()
        xla_include = os.path.join(tf_include, "external/xla")
        return [tf_include, xla_include]
    except:
        # Fallback paths
        return [
            "/usr/local/include/xla",
            "/usr/include/xla",
        ]

# Build the extension
setup(
    name='xla_gpu_custom_ops',
    ext_modules=[
        CUDAExtension(
            name='xla_gpu_custom_ops',
            sources=['xla_gpu_simple_add_kernel.cc'],
            include_dirs=get_xla_include_dirs(),
            libraries=[],  # Add XLA libraries if needed
            extra_compile_args={
                'cxx': ['-std=c++17', '-fPIC'],
                'nvcc': [
                    '-std=c++17',
                    '-gencode=arch=compute_70,code=sm_70',  # V100
                    '-gencode=arch=compute_80,code=sm_80',  # A100
                    '-gencode=arch=compute_90,code=sm_90',  # H100
                ],
            },
            extra_link_args=['-Wl,-rpath,$ORIGIN'],
        )
    ],
    cmdclass={'build_ext': BuildExtension},
    zip_safe=False,
)
#!/bin/bash

# 编译脚本
echo "Building reshape_and_cache_flash XLA extension..."

# 清理旧的构建文件
rm -rf build/ dist/ *.egg-info

# 设置环境变量
export TORCH_CUDA_ARCH_LIST="7.0;7.5;8.0;8.6"

# 编译扩展
python setup.py build_ext --inplace

# 检查是否成功
if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo "You can now run: python test_reshape_and_cache.py"
else
    echo "Build failed!"
    exit 1
fi
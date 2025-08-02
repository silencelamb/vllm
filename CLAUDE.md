
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

vLLM是一个开源的大模型推理引擎. 我的开发目标是添加XLA GPU banckend的支持，旨在为其他使用 OpenXLA/XLA编译器的大芯片提供方便获取的参考。虽然TPU V1支持已经存在，但这依赖TPU的硬件才能执行。XLA GPU支持旨在提供类似的功能，但针对NVIDIA GPU，方便学习研究和参考。

## 核心代码和说明

1. **V0 (Legacy) and V1 (New) Architectures**: vLLM is undergoing a major architectural upgrade from V0 -> V1.
   - V0: Located in main vllm/ directories
   - V1: Located in vllm/v1/ with separate implementations for different components
   我们是在V1版本中添加XLA GPU支持的

2. **Model Runners**: Hardware-specific implementations for running models
   - `vllm/v1/worker/gpu_model_runner.py`: NVIDIA GPU implementation
   - `vllm/v1/worker/tpu_model_runner.py`: TPU implementation
   - `vllm/v1/worker/xla_gpu_model_runner.py`: 我们添加的XLA GPU implementation (for NVIDIA GPUs with XLA)
   - `vllm/v1/worker/cpu_model_runner.py`: CPU implementation

3. **Attention Mechanisms**:
   - `vllm/attention/`: Various attention backend implementations
   - Supports FlashAttention, FlashInfer, and custom kernels
   - PagedAttention for efficient KV cache management

4. 测试用例
   - `tests/xla_gpu/test_compilation.py`: 测试XLA GPU编译和执行

## 当前进展

添加了XLA GPU支持的初步实现，主要包括：

- @vllm/v1/worker/xla_gpu_worker.py: 实现了XLA GPU的Worker类，XlaGpuWorker 用来接收请求并对XlaGpuModelRunner管理和调度执行
- @vllm/v1/worker/xla_gpu_model_runner.py: 实现了XLA GPU的XlaGpuModelRunner, 用来执行模型，缓存XLA编译等
- @vllm/v1/attention/backends/xla_gpu_native.py: 实现了XLA GPU的注意力机制，支持Pagedattention，XLA编译友好，目前核心报错是关于动态形状的编译问题，如果解决了这个问题，应该就可以正常运行了
- @vllm/platforms/xla_gpu.py: 实现了XLA GPU KV缓存管理  
- @tests/xla_gpu/test_compilation.py: 测试用例，测试XLA GPU编译和执行

## 后续工作

解决动态形状编译问题，确保XLA GPU支持的完整性和性能。后续工作包括：

1. 利用torch的基础算子
   - 使用torch的基础算子来实现XLA GPU的注意力机制，确保与XLA编译器兼容
   - 解决动态形状处理问题，确保模型可以在不同输入形状下正常运行
   - 如果有必要可以编写更具体的测试用例，逐个测试XlaGpuPagedAttentionBackendImpl的几个接口，测试其对XLA编译的支持
2. 利用新增custom os的手段，类似于TPU的torch.ops.xla.ragged_paged_attention
   - 只需要实现这个算子的定义，能够正常抓图就行
   - 算子的实际执行可以只简单return 1个shape正确的tensor即可

## 规范说明

1. **代码注释**: 所有新添加的代码都需要有详细的注释，解释其功能和实现细节。
2. **提交规范**: message里面不要带有claude


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
- @vllm/v1/attention/backends/xla_gpu_native.py: 实现了个XLA GPU的PagedAttention算子
  - 这个算子的功能就是调用flash-attention
           flash_attn_varlen_func(
            q=query,
            k=key_cache, v=value_cache,      # 使用缓存
            cu_seqlens_q=prefill_meta.query_start_loc,
            max_seqlen_q=prefill_meta.max_query_len,
            seqused_k=prefill_meta.seq_lens_tensor,  # 实际使用的K长度
            max_seqlen_k=max_seq_len,
            softmax_scale=softmax_scale,
            causal=True,                     # 前缀缓存总是因果的
            block_table=prefill_meta.block_tables,  # 分页表
            out=prefill_output
        )
        算子的forward会调用reshape_and_cache_flash
        reshape_and_cache_flash(
                key,
                value,
                key_cache,
                value_cache,
                attn_metadata.slot_mapping,
                self.kv_cache_dtype,
                layer._k_scale,
                layer._v_scale,
            )
- @vllm/platforms/xla_gpu.py: 实现新增XLA GPU平台
- @tests/xla_gpu/test_compilation.py: 测试用例，测试XLA GPU编译和执行
- @playground/custom_call/ctypes_reuse_kernel/reshape_and_cache_flash/compile_xla_vllm_style.sh 是编译so的脚本，@playground/custom_call/ctypes_reuse_kernel/reshape_and_cache_flash/test_tpu_style_solution.py 是使用torch xla以及torch.compile调用和测试的脚本，结果与vLLM直接调用reshape_and_cache_flash是一致的
- @playground/custom_call/flash-attn/compile_flash_attn_xla.sh  是编译so的脚本，@playground/custom_call/flash-attn/test_flash_attn_xla.py 是使用torch xla以及torch.compile调用和测试的脚本，实现的torch.ops.xla.flash_attn_varlen_op 结果与flash_attn_varlen_func是一致的

## 后续工作

后续工作包括：

1. @vllm/v1/attention/backends/xla_gpu_native.py 里的flash_attn_varlen_func 换成调用 torch.ops.xla.flash_attn_varlen_op，reshape_and_cache_flash换成torch.ops.xla.reshape_and_cache_update_op的调用

## 规范说明

1. **代码注释**: 所有新添加的代码都需要有详细的注释，解释其功能和实现细节。
2. **提交规范**: message里面不要带有claude

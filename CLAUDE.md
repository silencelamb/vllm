
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
- @vllm/platforms/xla_gpu.py: 实现新增XLA GPU平台
- @tests/xla_gpu/test_compilation.py: 测试用例，测试XLA GPU编译和执行
- @playground/custom_call/ctypes_reuse_kernel/reshape_and_cache_flash/compile_xla_vllm_style.sh 是编译so的脚本，@playground/custom_call/ctypes_reuse_kernel/reshape_and_cache_flash/test_xla_reshape_and_cache.py 是使用torch xla以及torch.compile调用和测试的脚本，@playground/custom_call/ctypes_reuse_kernel/reshape_and_cache_flash/xla_reshape_and_cache.py的reshape_and_cache_flash函数执行的结果与vLLM直接调用reshape_and_cache_flash是一致的
- @playground/custom_call/flash-attn/compile_flash_attn_xla.sh  是编译so的脚本，@playground/custom_call/flash-attn/test_flash_attn_xla.py 是使用torch xla以及torch.compile调用和测试的脚本，实现的torch.ops.xla.flash_attn_varlen_op 结果与flash_attn_varlen_func是一致的
-@vllm/v1/attention/backends/xla_gpu_native.py: 实现了个XLA GPU的PagedAttention算子
  - 这个算子的功能就是调用custom call 的flash-attention
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
        算子的forward会调用custom call 的reshape_and_cache_flash
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

## 后续工作

后续工作包括：
解决执行@tests/xla_gpu/test_compilation.py的报错问题
[rank0]:V0815 14:29:13.599000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['layers']._modules['15']._modules['mlp']._modules['gate_up_proj']._parameters['weight'].stride()[1] == 1
[rank0]:V0815 14:29:13.599000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['layers']._modules['15']._modules['mlp']._modules['gate_up_proj']._parameters['weight'].storage_offset() == 0
[rank0]:V0815 14:29:13.599000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['layers']._modules['15']._modules['mlp']._modules['down_proj']._parameters['weight'].size()[0] == 2048
[rank0]:V0815 14:29:13.599000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['layers']._modules['15']._modules['mlp']._modules['down_proj']._parameters['weight'].size()[1] == 8192
[rank0]:V0815 14:29:13.599000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['layers']._modules['15']._modules['mlp']._modules['down_proj']._parameters['weight'].stride()[0] == 8192
[rank0]:V0815 14:29:13.599000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['layers']._modules['15']._modules['mlp']._modules['down_proj']._parameters['weight'].stride()[1] == 1
[rank0]:V0815 14:29:13.599000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['layers']._modules['15']._modules['mlp']._modules['down_proj']._parameters['weight'].storage_offset() == 0
[rank0]:V0815 14:29:13.600000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['norm']._parameters['weight'].size()[0] == 2048
[rank0]:V0815 14:29:13.600000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['norm']._parameters['weight'].stride()[0] == 1
[rank0]:V0815 14:29:13.600000 1710202 site-packages/torch/fx/experimental/symbolic_shapes.py:5156] [0/0] Skipping guard L['self']._modules['norm']._parameters['weight'].storage_offset() == 0
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0] Error while creating guard:
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0] Name: ''
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     Source: shape_env
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     Create Function: SHAPE_ENV
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     Guard Types: None
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     Code List: None
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     Object Weakref: None
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     Guarded Class Weakref: None
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0] Traceback (most recent call last):
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/_guards.py", line 357, in create
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     return self.create_fn(builder, self)
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/guards.py", line 1959, in SHAPE_ENV
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     python_code_parts, verbose_code_parts = _get_code_parts(
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/guards.py", line 1942, in_get_code_parts
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     return output_graph.shape_env.produce_guards_verbose(
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/fx/experimental/symbolic_shapes.py", line 5409, in produce_guards_verbose
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]     raise ConstraintViolationError(
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0] torch.fx.experimental.symbolic_shapes.ConstraintViolationError: Constraints violated (L['input_ids'].size()[0], L['positions'].size()[0])! For more information, run with TORCH_LOGS="+dynamic".
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]   - Not all values of RelaxedUnspecConstraint(L['input_ids'].size()[0]) are valid because L['input_ids'].size()[0] was inferred to be a constant (16).
[rank0]:E0815 14:29:13.602000 1710202 site-packages/torch/_guards.py:359] [0/0]   - Not all values of RelaxedUnspecConstraint(L['positions'].size()[0]) are valid because L['positions'].size()[0] was inferred to be a constant (16).
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0] Created at:
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/convert_frame.py", line 694, in transform
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]     tracer = InstructionTranslator(
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/symbolic_convert.py", line 3329, in **init**
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]     output=OutputGraph(
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/output_graph.py", line 358, in **init**
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]     self.init_ambient_guards()
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/output_graph.py", line 512, in init_ambient_guards
[rank0]:E0815 14:29:13.604000 1710202 site-packages/torch/_guards.py:361] [0/0]     self.guards.add(ShapeEnvSource().make_guard(GuardBuilder.SHAPE_ENV))
ERROR 08-15 14:29:13 [core.py:586] EngineCore failed to start.
ERROR 08-15 14:29:13 [core.py:586] Traceback (most recent call last):
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/engine/core.py", line 577, in run_engine_core
ERROR 08-15 14:29:13 [core.py:586]     engine_core = EngineCoreProc(*args, **kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/engine/core.py", line 404, in **init**
ERROR 08-15 14:29:13 [core.py:586]     super().**init**(vllm_config, executor_class, log_stats,
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/engine/core.py", line 82, in **init**
ERROR 08-15 14:29:13 [core.py:586]     self._initialize_kv_caches(vllm_config)
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/engine/core.py", line 169, in_initialize_kv_caches
ERROR 08-15 14:29:13 [core.py:586]     self.model_executor.initialize_from_config(kv_cache_configs)
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/executor/abstract.py", line 66, in initialize_from_config
ERROR 08-15 14:29:13 [core.py:586]     self.collective_rpc("compile_or_warm_up_model")
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/executor/uniproc_executor.py", line 57, in collective_rpc
ERROR 08-15 14:29:13 [core.py:586]     answer = run_method(self.driver_worker, method, args, kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/utils/**init**.py", line 2943, in run_method
ERROR 08-15 14:29:13 [core.py:586]     return func(*args,**kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/worker/xla_gpu_worker.py", line 289, in compile_or_warm_up_model
ERROR 08-15 14:29:13 [core.py:586]     self.model_runner.capture_model()
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/worker/xla_gpu_model_runner.py", line 1565, in capture_model
ERROR 08-15 14:29:13 [core.py:586]     self._precompile_backbone()
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/worker/xla_gpu_model_runner.py", line 1434, in _precompile_backbone
ERROR 08-15 14:29:13 [core.py:586]     self._dummy_run(num_tokens, num_reqs, num_blocks)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/utils/_contextlib.py", line 116, in decorate_context
ERROR 08-15 14:29:13 [core.py:586]     return func(*args, **kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/v1/worker/xla_gpu_model_runner.py", line 1339, in _dummy_run
ERROR 08-15 14:29:13 [core.py:586]     out = self.model(input_ids=input_ids,
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/nn/modules/module.py", line 1751, in _wrapped_call_impl
ERROR 08-15 14:29:13 [core.py:586]     return self._call_impl(*args,**kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/nn/modules/module.py", line 1762, in_call_impl
ERROR 08-15 14:29:13 [core.py:586]     return forward_call(*args, **kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/model_executor/models/llama.py", line 584, in forward
ERROR 08-15 14:29:13 [core.py:586]     model_output = self.model(input_ids, positions, intermediate_tensors,
ERROR 08-15 14:29:13 [core.py:586]   File "/code/github_code/xla_vllm/vllm/vllm/compilation/decorators.py", line 239, in **call**
ERROR 08-15 14:29:13 [core.py:586]     output = self.compiled_callable(*args,**kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/eval_frame.py", line 655, in_fn
ERROR 08-15 14:29:13 [core.py:586]     return fn(*args, **kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/convert_frame.py", line 1432, in **call**
ERROR 08-15 14:29:13 [core.py:586]     return self._torchdynamo_orig_callable(
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/convert_frame.py", line 598, in **call**
ERROR 08-15 14:29:13 [core.py:586]     return_compile(
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/convert_frame.py", line 1059, in _compile
ERROR 08-15 14:29:13 [core.py:586]     guarded_code = compile_inner(code, one_graph, hooks, transform)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_utils_internal.py", line 97, in wrapper_function
ERROR 08-15 14:29:13 [core.py:586]     return function(*args,**kwargs)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/convert_frame.py", line 761, in compile_inner
ERROR 08-15 14:29:13 [core.py:586]     return _compile_inner(code, one_graph, hooks, transform)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/convert_frame.py", line 906, in_compile_inner
ERROR 08-15 14:29:13 [core.py:586]     check_fn = CheckFunctionManager(
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/guards.py", line 2481, in **init**
ERROR 08-15 14:29:13 [core.py:586]     guard.create(builder)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_guards.py", line 357, in create
ERROR 08-15 14:29:13 [core.py:586]     return self.create_fn(builder, self)
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/guards.py", line 1959, in SHAPE_ENV
ERROR 08-15 14:29:13 [core.py:586]     python_code_parts, verbose_code_parts =_get_code_parts(
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/_dynamo/guards.py", line 1942, in_get_code_parts
ERROR 08-15 14:29:13 [core.py:586]     return output_graph.shape_env.produce_guards_verbose(
ERROR 08-15 14:29:13 [core.py:586]   File "/usr/local/lib/python3.10/site-packages/torch/fx/experimental/symbolic_shapes.py", line 5409, in produce_guards_verbose
ERROR 08-15 14:29:13 [core.py:586]     raise ConstraintViolationError(
ERROR 08-15 14:29:13 [core.py:586] torch.fx.experimental.symbolic_shapes.ConstraintViolationError: Constraints violated (L['input_ids'].size()[0], L['positions'].size()[0])! For more information, run with TORCH_LOGS="+dynamic".
ERROR 08-15 14:29:13 [core.py:586]   - Not all values of RelaxedUnspecConstraint(L['input_ids'].size()[0]) are valid because L['input_ids'].size()[0] was inferred to be a constant (16).
ERROR 08-15 14:29:13 [core.py:586]   - Not all values of RelaxedUnspecConstraint(L['positions'].size()[0]) are valid because L['positions'].size()[0] was inferred to be a constant (16).
ERROR 08-15 14:29:13 [core.py:586]
Process EngineCore_0:
Traceback (most recent call last):

## 规范说明

1. **代码注释**: 所有新添加的代码都需要有详细的注释，解释其功能和实现细节。
2. **提交规范**: message里面不要带有claude

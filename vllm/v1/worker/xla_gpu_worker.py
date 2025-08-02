# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project
"""An XLA GPU worker class."""
import os
from typing import Optional

import torch
import torch.distributed
import torch.nn as nn
import torch_xla.core.xla_model as xm
import torch_xla.debug.profiler as xp
import torch_xla.runtime as xr

import vllm.envs as envs
from vllm.config import ParallelConfig, VllmConfig
from vllm.distributed import (ensure_model_parallel_initialized,
                              init_distributed_environment)
from vllm.logger import init_logger
from vllm.lora.request import LoRARequest
from vllm.model_executor import set_random_seed
from vllm.platforms import current_platform
from vllm.utils import STR_DTYPE_TO_TORCH_DTYPE, cdiv
from vllm.v1.core.sched.output import SchedulerOutput
from vllm.v1.kv_cache_interface import (AttentionSpec, KVCacheConfig,
                                        KVCacheSpec)
from vllm.v1.outputs import ModelRunnerOutput
from vllm.v1.utils import bind_kv_cache, report_usage_stats
from vllm.v1.worker.xla_gpu_model_runner import XlaGpuModelRunner

logger = init_logger(__name__)

# XLA GPU specific constants
XLA_GPU_HEAD_SIZE_ALIGNMENT = 8  # GPU typically aligns to 8 bytes


class XlaGpuWorker:

    def __init__(
        self,
        vllm_config: VllmConfig,
        local_rank: int,
        rank: int,
        distributed_init_method: str,
        is_driver_worker: bool = False,
    ):
        self.is_driver_worker = is_driver_worker
        self.vllm_config = vllm_config
        self.model_config = vllm_config.model_config
        self.cache_config = vllm_config.cache_config
        self.lora_config = vllm_config.lora_config
        self.load_config = vllm_config.load_config
        self.parallel_config = vllm_config.parallel_config
        self.use_spmd = envs.VLLM_XLA_USE_SPMD
        self.original_parallel_config = None
        
        if self.use_spmd:
            # Under SPMD mode, distributed env is initialized as if there is
            # only one worker/device.
            self.original_parallel_config = self.parallel_config
            self.parallel_config.tensor_parallel_size = 1
            self.parallel_config.pipeline_parallel_size = 1
            self.parallel_config.world_size = 1
            
        self.scheduler_config = vllm_config.scheduler_config
        self.device_config = vllm_config.device_config
        self.speculative_config = vllm_config.speculative_config
        self.prompt_adapter_config = vllm_config.prompt_adapter_config
        self.observability_config = vllm_config.observability_config

        self.parallel_config.rank = rank
        self.local_rank = local_rank
        self.rank = rank
        self.distributed_init_method = distributed_init_method

        if self.cache_config.cache_dtype == "auto":
            self.cache_dtype = self.model_config.dtype
        else:
            self.cache_dtype = STR_DTYPE_TO_TORCH_DTYPE[
                self.cache_config.cache_dtype]

        if self.model_config.trust_remote_code:
            # note: lazy import to avoid importing torch before initializing
            from vllm.utils import init_cached_hf_modules
            init_cached_hf_modules()

        # XLA GPU profiling setup
        self.profiler = None
        self.profile_dir = None
        if envs.VLLM_TORCH_PROFILER_DIR and self.rank < 1:
            # For XLA GPU, we can profile on multiple ranks simultaneously
            # but typically only profile on rank 0 to reduce overhead
            self.profile_dir = envs.VLLM_TORCH_PROFILER_DIR
            logger.info("XLA GPU Profiling enabled. Traces will be saved to: %s",
                        self.profile_dir)

        if self.model_config.seed is None:
            self.model_config.seed = 0

    def initialize_cache(self, num_gpu_blocks: int,
                         num_cpu_blocks: int) -> None:
        self.cache_config.num_gpu_blocks = num_gpu_blocks
        self.cache_config.num_cpu_blocks = num_cpu_blocks

    def init_device(self):
        """Initialize XLA GPU device environment."""
        
        # Set XLA GPU environment variables
        os.environ["PJRT_DEVICE"] = "CUDA"  # XLA GPU uses CUDA backend
        
        # XLA GPU optimization flags
        xla_flags = [
            "--xla_gpu_enable_triton_gemm=true",  # Enable Triton GEMM
            "--xla_gpu_enable_async_collectives=true",  # Async collective communications
            "--xla_gpu_enable_latency_hiding_scheduler=true",  # Latency hiding scheduler
            "--xla_gpu_enable_highest_priority_async_stream=true",  # High priority async streams
        ]
        
        # Add SPMD-specific flags if enabled
        if self.use_spmd:
            xla_flags.extend([
                "--xla_gpu_enable_xla_runtime_executable=true",
                "--xla_gpu_enable_command_buffer=true",
            ])
        
        # Set XLA flags
        existing_flags = os.environ.get("XLA_FLAGS", "")
        new_flags = " ".join(xla_flags)
        if existing_flags:
            os.environ["XLA_FLAGS"] = f"{existing_flags} {new_flags}"
        else:
            os.environ["XLA_FLAGS"] = new_flags
        
        # Disable gradient computation
        torch.set_grad_enabled(False)
        torch.set_default_dtype(self.model_config.dtype)

        # Initialize distributed environment
        self._init_xla_gpu_worker_distributed_environment(
            self.parallel_config, self.rank, self.distributed_init_method,
            self.local_rank)

        # Device initialization should happen after distributed environment setup
        self.device = xm.xla_device()
        self.device_config.device = self.device
        
        logger.info(f"XLA GPU Worker {self.rank} initialized on device: {self.device}")

        # Set random seed
        set_random_seed(self.model_config.seed)
        if self.model_config.seed is not None:
            xm.set_rng_state(self.model_config.seed, self.device)

        # Configure Dynamo for dynamic shapes support
        # This must be done before any compilation happens
        torch._dynamo.config.cache_size_limit = 256  # Larger than TPU
        torch._dynamo.config.capture_dynamic_output_shape_ops = True
        torch._dynamo.config.assume_static_by_default = False
        torch._dynamo.config.automatic_dynamic_shapes = True
        torch._dynamo.config.specialize_int = False  # Don't specialize on integer values
        
        # Set up XLA persistent cache
        world_size = self.parallel_config.world_size
        rank = xr.global_ordinal()
        
        if envs.VLLM_XLA_CACHE_PATH:
            per_rank_path = os.path.join(envs.VLLM_XLA_CACHE_PATH,
                                         f"xla_gpu_tp{world_size}_rank{rank}")
            os.makedirs(per_rank_path, exist_ok=True)
            xr.initialize_cache(per_rank_path, readonly=False)
            logger.info(f"XLA compilation cache initialized at: {per_rank_path}")

        # Initialize ModelRunner
        self.model_runner = XlaGpuModelRunner(
            self.vllm_config, 
            self.device,
            self.original_parallel_config
        )

        if rank == 0:
            # Collect usage statistics
            report_usage_stats(self.vllm_config)

    def determine_available_memory(self) -> int:
        """Determine available memory on XLA GPU."""
        
        kv_caches: dict[str, torch.Tensor] = {}
        kv_cache_spec = self.model_runner.get_kv_cache_spec()
        
        for layer_name, layer_spec in kv_cache_spec.items():
            if isinstance(layer_spec, AttentionSpec):
                dtype = layer_spec.dtype
                # Create empty tensor for memory profiling
                xla_gpu_kv_cache = torch.tensor([], dtype=dtype).to(self.device)
                kv_caches[layer_name] = xla_gpu_kv_cache
            else:
                raise NotImplementedError(
                    f"Unsupported KV cache spec '{type(layer_spec)}'")

        runner_kv_caches: list[torch.Tensor] = []
        bind_kv_cache(
            kv_caches,
            self.vllm_config.compilation_config.static_forward_context,
            runner_kv_caches)

        # Run profiling to determine memory usage
        with self.model_runner.maybe_setup_dummy_loras(self.lora_config):
            self.model_runner.profile_run(self.model_runner.max_num_tokens)

        # Wait for all XLA operations to complete
        xm.wait_device_ops()

        # Clear Dynamo cache to ensure consistent compilation state
        self.model_runner.reset_dynamo_cache()

        # Get GPU memory usage information
        try:
            # For XLA GPU, we can use XLA memory info
            m = xm.get_memory_info(self.device)
            total_memory = m.get("bytes_limit", 8 * 1024**3)  # Default 8GB
            current_memory = m.get("bytes_used", 0)
            logger.info(f"XLA GPU memory info: total={total_memory//1024**2}MB, used={current_memory//1024**2}MB")
                
        except Exception as e:
            logger.warning(f"Failed to get memory info: {e}, using defaults")
            # Use conservative defaults
            total_memory = 8 * 1024**3  # 8GB
            current_memory = 2 * 1024**3  # 2GB
        
        # Calculate memory used by model weights and activations
        # Use more precise heuristics
        model_memory = current_memory * 1.5  # 5% buffer for XLA GPU
        
        # Calculate memory available for KV cache
        usable_memory = int(total_memory * self.cache_config.gpu_memory_utilization)
        kv_cache_memory = max(usable_memory - model_memory, 0)
        
        # Handle head size alignment
        head_size = self.model_config.get_head_size()
        if head_size > 0:
            padded_head_size = cdiv(head_size, XLA_GPU_HEAD_SIZE_ALIGNMENT) * XLA_GPU_HEAD_SIZE_ALIGNMENT
            if padded_head_size != head_size:
                logger.warning_once(f"XLA GPU: head size padded from {head_size} to {padded_head_size}")
            # Adjust available memory to accommodate padding
            kv_cache_memory = (kv_cache_memory * head_size // padded_head_size)
        
        logger.info(f"XLA GPU memory: Total={total_memory//1024**2}MB, "
                   f"Model={model_memory//1024**2}MB, "
                   f"KV Cache={kv_cache_memory//1024**2}MB")
        
        return int(kv_cache_memory)

    def execute_model(
        self,
        scheduler_output: "SchedulerOutput",
    ) -> Optional[ModelRunnerOutput]:
        """Execute model inference."""
        output = self.model_runner.execute_model(scheduler_output)
        return output if self.is_driver_worker else None

    def profile(self, is_start: bool = True):
        """Start or stop XLA GPU profiling."""
        if self.rank < 1:  # Only profile on main rank
            if self.profile_dir is None:
                raise RuntimeError("Profiler is not enabled.")
            if is_start:
                if self.profiler is None:
                    # XLA GPU uses different port to avoid conflicts
                    self.profiler = xp.start_server(9013)  # Different from TPU's 9012
                xp.start_trace(self.profile_dir)
                logger.info("XLA GPU profiling started")
            else:
                xp.stop_trace()
                logger.info("XLA GPU profiling stopped")

    def add_lora(self, lora_request: LoRARequest) -> bool:
        """Add LoRA adapter."""
        return self.model_runner.add_lora(lora_request)

    def load_model(self) -> None:
        """Load model to XLA GPU."""
        self.model_runner.load_model()

    def compile_or_warm_up_model(self) -> None:
        """Compile or warm up the model."""
        if not self.model_config.enforce_eager:
            self.model_runner.capture_model()

        # Reset random seed to ensure consistency
        set_random_seed(self.model_config.seed)

    def get_model(self) -> nn.Module:
        """Get model instance."""
        return self.model_runner.get_model()

    def get_kv_cache_spec(self) -> dict[str, KVCacheSpec]:
        """Get KV cache specification."""
        return self.model_runner.get_kv_cache_spec()

    def initialize_from_config(self, kv_cache_config: KVCacheConfig) -> None:
        """Initialize KV cache with specified configuration."""
        self.model_runner.initialize_kv_cache(kv_cache_config)

    def check_health(self) -> None:
        """Check worker health status."""
        # XLA GPU worker is always healthy while running
        try:
            # Simple device check
            test_tensor = torch.tensor([1.0], device=self.device)
            xm.wait_device_ops()
            logger.debug(f"XLA GPU Worker {self.rank} health check passed")
        except Exception as e:
            logger.error(f"XLA GPU Worker {self.rank} health check failed: {e}")
            raise

    def _init_xla_gpu_worker_distributed_environment(
        self,
        parallel_config: ParallelConfig,
        rank: int,
        distributed_init_method: Optional[str] = None,
        local_rank: int = -1,
    ) -> None:
        """Initialize XLA GPU distributed environment."""
        
        if self.use_spmd:
            logger.info("Initializing XLA GPU with SPMD mode")
            xr.use_spmd()
        else:
            logger.info("Initializing XLA GPU with standard distributed mode")
        
        # Initialize distributed environment
        # XLA GPU uses NCCL as backend for collective communications
        init_distributed_environment(
            world_size=parallel_config.world_size,
            rank=rank,
            local_rank=local_rank,
            distributed_init_method=distributed_init_method,
            backend=current_platform.dist_backend,  # Usually "nccl" for GPU
        )
        
        # Ensure model parallel is initialized
        ensure_model_parallel_initialized(
            parallel_config.tensor_parallel_size,
            parallel_config.pipeline_parallel_size
        )
        
        logger.info(f"XLA GPU distributed environment initialized: "
                   f"world_size={parallel_config.world_size}, "
                   f"rank={rank}, local_rank={local_rank}, "
                   f"tp_size={parallel_config.tensor_parallel_size}, "
                   f"pp_size={parallel_config.pipeline_parallel_size}")

    def __del__(self):
        """Clean up resources."""
        try:
            if hasattr(self, 'profiler') and self.profiler is not None:
                # Ensure profiler is properly closed
                try:
                    xp.stop_trace()
                except:
                    pass
        except:
            pass
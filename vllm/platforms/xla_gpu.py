# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

from typing import TYPE_CHECKING, Optional, Union, cast
from functools import cache

import torch

from vllm.inputs import ProcessorInputs, PromptType
from vllm.logger import init_logger
from vllm.sampling_params import SamplingParams, SamplingType
from vllm.utils import DEFAULT_MAX_NUM_BATCHED_TOKENS

from .interface import DeviceCapability, Platform, PlatformEnum, _Backend

if TYPE_CHECKING:
    from vllm.config import BlockSize, ModelConfig, VllmConfig
    from vllm.pooling_params import PoolingParams
else:
    BlockSize = None
    ModelConfig = None
    VllmConfig = None
    PoolingParams = None

logger = init_logger(__name__)

from .cuda import with_nvml_context, pynvml

class XlaGpuPlatform(Platform):
    _enum = PlatformEnum.XLA_GPU
    device_name: str = "xla_gpu"
    device_type: str = "xla"
    dispatch_key: str = "XLA"
    ray_device_key: str = "XLA_GPU"
    dist_backend: str = "gloo"
    device_control_env_var: str = "CUDA_VISIBLE_DEVICES"
    simple_compile_backend: str = "openxla"

    supported_quantization: list[str] = [""]

    additional_env_vars: list[str] = [
        "PJRT_DEVICE", "GPU_NUM_DEVICES", "XLA_DYNAMO_DEBUG"
    ]

    @classmethod
    def get_attn_backend_cls(cls, selected_backend: _Backend, head_size: int,
                             dtype: torch.dtype, kv_cache_dtype: Optional[str],
                             block_size: int, use_v1: bool,
                             use_mla: bool) -> str:
        FLASH_ATTN_V1 = "vllm.v1.attention.backends.flash_attn.FlashAttentionBackend"  # noqa: E501

        if selected_backend == _Backend.FLASH_ATTN:
            logger.info_once("Using Flash Attention backend on V1 engine.")
            return FLASH_ATTN_V1
        logger.info("Using XlaGpuPagedAttentionBackend.")
        return "vllm.v1.attention.backends.xla_gpu_native.XlaGpuPagedAttentionBackend"

    @classmethod
    def get_device_name(cls, device_id: int = 0) -> str:
        try:
            import torch_xla
            import torch_xla.core.xla_model as xm
            
            device = xm.xla_device(device_id)
            return f"XLA_GPU:{device_id}"
        except Exception:
            return f"XLA_GPU_UNKNOWN"

    @classmethod
    @with_nvml_context
    def get_device_total_memory(cls, device_id: int = 0) -> int:
        physical_device_id = cls.device_id_to_physical_device_id(device_id)
        handle = pynvml.nvmlDeviceGetHandleByIndex(physical_device_id)
        return int(pynvml.nvmlDeviceGetMemoryInfo(handle).total)

    @classmethod
    @cache
    def get_device_capability(cls, device_id: int = 0) -> DeviceCapability:
        major, minor = torch.cuda.get_device_capability(device_id)
        return DeviceCapability(major=major, minor=minor)
    
    @classmethod
    def is_async_output_supported(cls, enforce_eager: Optional[bool]) -> bool:
        return False

    @classmethod
    def get_punica_wrapper(cls) -> str:
        raise NotImplementedError("Punica wrapper is not implemented.")

    @classmethod
    def get_infinity_values(cls, dtype: torch.dtype) -> tuple[float, float]:
        return torch.finfo(dtype).min, torch.finfo(dtype).max

    @classmethod
    def can_update_inplace(cls):
        return False

    @classmethod
    def get_lora_vocab_padding_size(cls) -> int:
        return 1

    @classmethod
    def inference_mode(cls):
        return torch.no_grad()

    @classmethod
    def check_and_update_config(cls, vllm_config: VllmConfig) -> None:
        from vllm.config import CompilationLevel

        cache_config = vllm_config.cache_config
        # For v0, the default block size is 16.
        if cache_config and cache_config.block_size is None:
            cache_config.block_size = cast(BlockSize, 16)
        compilation_config = vllm_config.compilation_config

        # XLA GPU only supports DYNAMO_ONCE compilation level
        if compilation_config.level != CompilationLevel.DYNAMO_ONCE:
            logger.info("[XLA GPU] Forcing DYNAMO_ONCE compilation level")
            compilation_config.level = CompilationLevel.DYNAMO_ONCE

        if compilation_config.backend == "":
            compilation_config.backend = "openxla"

        assert vllm_config.speculative_config is None, \
            "XLA GPU does not support speculative decoding"

        model_config = vllm_config.model_config
        if model_config is not None and model_config.dtype in (torch.float16,
                                                               torch.float32):
            logger.warning(
                "The XLA GPU backend currently does not support %s. "
                "Using bfloat16 instead.", model_config.dtype)
            model_config.dtype = torch.bfloat16

        if cache_config and cache_config.block_size is None:
            cache_config.block_size = 16

        parallel_config = vllm_config.parallel_config
        scheduler_config = vllm_config.scheduler_config
        if parallel_config.worker_cls == "auto":
            if scheduler_config.is_multi_step:
                raise NotImplementedError(
                    "Multi-step scheduling is not supported (and not "
                    "needed) on vLLM V1. Please launch without "
                    "--num-scheduler-steps.")
            parallel_config.worker_cls = "vllm.v1.worker.xla_gpu_worker.XlaGpuWorker"

        assert not vllm_config.speculative_config, (
            "Speculative decoding is not yet supported for XLA GPU backend")

        if scheduler_config.is_multimodal_model and not \
            scheduler_config.disable_chunked_mm_input:
            logger.warning("XLA GPU does not support running Multimodal models"\
            " without setting `--disable_chunked_mm_input`. " \
            "Forcing --disable_chunked_mm_input.")
            scheduler_config.disable_chunked_mm_input = True

        if model_config and model_config.use_mla:
            logger.info(
                "MLA is enabled on a non-GPU platform; forcing chunked "
                "prefill and prefix caching to be disabled.")
            vllm_config.scheduler_config.enable_chunked_prefill = False
            vllm_config.scheduler_config.chunked_prefill_enabled = False
            vllm_config.scheduler_config.max_num_batched_tokens = max(
                vllm_config.scheduler_config.max_model_len,
                DEFAULT_MAX_NUM_BATCHED_TOKENS)

    @classmethod
    def is_pin_memory_available(cls):
        logger.warning("Pin memory is not supported on XLA GPU.")
        return False

    @classmethod
    def get_device_communicator_cls(cls) -> str:
        return "vllm.distributed.device_communicators.xla_gpu_communicator.XlaGpuCommunicator"  # noqa

    @classmethod
    def use_all_gather(cls) -> bool:
        return True

    @classmethod
    def supports_v1(cls, model_config: ModelConfig) -> bool:
        # V1 support on XLA GPU is experimental
        return True

    @classmethod
    def validate_request(
        cls,
        prompt: PromptType,
        params: Union[SamplingParams, PoolingParams],
        processed_inputs: ProcessorInputs,
    ) -> None:
        """Raises if this request is unsupported on this platform"""
        if (isinstance(params, SamplingParams)
                and params.sampling_type == SamplingType.RANDOM_SEED):
            raise ValueError("Torch XLA does not support per-request seed.")

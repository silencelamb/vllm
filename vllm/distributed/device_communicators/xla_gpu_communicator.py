# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

import os
from typing import Optional

import torch
from torch.distributed import ProcessGroup

from vllm.config import get_current_vllm_config
from vllm.logger import init_logger
from vllm.platforms import current_platform

from .base_device_communicator import DeviceCommunicatorBase

# 检查是否使用Ray作为分布式执行后端
USE_RAY = parallel_config = get_current_vllm_config(
).parallel_config.distributed_executor_backend == "ray"

logger = init_logger(__name__)

if current_platform.is_xla_gpu():
    import torch_xla
    import torch_xla.core.xla_model as xm
    import torch_xla.runtime as xr
    from torch_xla._internal import pjrt
    from torch_xla.distributed.xla_multiprocessing import (
        create_optimized_replica_groups)

    if USE_RAY:
        from vllm.executor import ray_utils


class XlaGpuCommunicator(DeviceCommunicatorBase):
    """
    XLA GPU设备通信器，用于多GPU环境下的集合通信操作。
    支持all-reduce和all-gather操作。
    """

    def __init__(self,
                 cpu_group: ProcessGroup,
                 device: Optional[torch.device] = None,
                 device_group: Optional[ProcessGroup] = None,
                 unique_name: str = ""):
        super().__init__(cpu_group, device, device_group, unique_name)

        # 获取全局rank和world size
        global_rank = self.global_rank
        global_world_size = self.global_world_size

        if USE_RAY:
            logger.info("XlaGpuCommunicator initialized with RAY")
            # 计算当前部署中有多少个GPU节点
            # 这是Ray placement group（如果使用Ray部署的话）
            # 默认为Ray集群中的GPU节点数
            num_nodes = ray_utils.get_num_xla_gpu_nodes()
            num_nodes_in_pg = ray_utils.get_num_nodes_in_placement_group()
            if num_nodes_in_pg > 0:
                num_nodes = num_nodes_in_pg

            local_world_size = global_world_size // num_nodes
            local_rank = global_rank % local_world_size
        else:
            logger.info("XlaGpuCommunicator initialized with MP")
            # 对于单节点多GPU的情况
            # 获取本地可用的GPU数量
            if torch.cuda.is_available():
                local_world_size = torch.cuda.device_count()
            else:
                # 如果CUDA不可用，假设XLA会管理设备
                local_world_size = global_world_size
            
            # 计算本地rank
            local_rank = global_rank % local_world_size

        # 设置环境变量，用于XLA识别GPU设备
        # 这些环境变量对于XLA正确初始化GPU设备很重要
        os.environ["XLA_GPU_TASK_ID"] = str(global_rank)
        os.environ["XLA_VISIBLE_DEVICES"] = str(local_rank)
        
        # 如果使用CUDA，也设置CUDA_VISIBLE_DEVICES
        if torch.cuda.is_available():
            os.environ["CUDA_VISIBLE_DEVICES"] = str(local_rank)

        # 初始化PJRT多进程环境
        # PJRT (Pretty Just Right Time) 是XLA的运行时
        try:
            pjrt.initialize_multiprocess(local_rank, local_world_size)
            xr._init_world_size_ordinal()
            # 创建优化的副本组，用于高效的集合通信
            self.groups = create_optimized_replica_groups()
            logger.info(f"XlaGpuCommunicator initialized: "
                       f"local_rank={local_rank}, local_world_size={local_world_size}, "
                       f"global_rank={global_rank}, global_world_size={global_world_size}")
        except Exception as e:
            logger.warning(f"Failed to initialize PJRT multiprocess: {e}")
            # 如果PJRT初始化失败，仍然继续，但不使用优化的组
            self.groups = None
            logger.info("XlaGpuCommunicator will run without optimized replica groups")

    def all_reduce(self, input_: torch.Tensor) -> torch.Tensor:
        """
        执行all-reduce操作，将所有GPU上的张量求和。
        
        Args:
            input_: 输入张量
            
        Returns:
            所有GPU上张量求和的结果
        """
        # 如果有优化的组，使用它们；否则使用默认的all-reduce
        if self.groups is not None:
            return xm.all_reduce(xm.REDUCE_SUM, input_, groups=self.groups)
        else:
            return xm.all_reduce(xm.REDUCE_SUM, input_)

    def all_gather(self, input_: torch.Tensor, dim: int = -1) -> torch.Tensor:
        """
        执行all-gather操作，收集所有GPU上的张量。
        
        Args:
            input_: 输入张量
            dim: 聚合的维度，XLA GPU只支持dim=-1
            
        Returns:
            所有GPU上张量聚合的结果
        """
        assert dim == -1, "XLA GPU only supports dim=-1 for all-gather."
        return xm.all_gather(input_, dim=dim)

    def broadcast(self, tensor: torch.Tensor, src: int = 0) -> torch.Tensor:
        """
        广播操作，从源GPU广播张量到所有其他GPU。
        
        Args:
            tensor: 要广播的张量
            src: 源GPU的rank
            
        Returns:
            广播后的张量
        """
        # XLA的broadcast通过all-reduce实现，但只有源rank的值非零
        if self.global_rank != src:
            tensor.zero_()
        return self.all_reduce(tensor)

    def barrier(self):
        """
        同步屏障，等待所有GPU到达这个点。
        """
        # 使用一个dummy张量执行all-reduce来实现barrier
        dummy = torch.tensor([1.0], device=self.device)
        xm.all_reduce(xm.REDUCE_SUM, dummy)
        
    def destroy(self):
        """
        清理资源。
        """
        # XLA会自动管理资源，这里不需要特别的清理
        pass
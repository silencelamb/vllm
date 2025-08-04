# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

"""
XLA GPU Paged Attention with XLA custom call and Flash Attention support.
This version uses XLA custom call mechanism for integration with XLA compiler.
"""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os
from typing import Optional, Tuple
from vllm.logger import init_logger


#!/usr/bin/env python3
"""Debug tensor dtypes in XLA GPU model runner"""

import os
import torch

# Set up environment
os.environ["VLLM_USE_XLA_GPU"] = "1"
os.environ["VLLM_USE_V1"] = "1"
os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"
os.environ["GPU_NUM_DEVICES"] = "1"
os.environ["CUDA_VISIBLE_DEVICES"] = "3"
os.environ["PJRT_DEVICE"] = "CUDA"

def check_model_dtypes():
    """Check dtypes used in the model"""
    print("=== Checking Model Dtypes ===")
    
    # Import after setting env vars
    from vllm.config import ModelConfig
    from transformers import AutoConfig
    
    # Check model config
    model_name = "Qwen/Qwen3-0.6B"
    hf_config = AutoConfig.from_pretrained(model_name, trust_remote_code=True)
    
    print(f"\nModel: {model_name}")
    print(f"HF Config torch_dtype: {getattr(hf_config, 'torch_dtype', 'Not specified')}")
    
    # Check vLLM model config
    model_config = ModelConfig(
        model=model_name,
        dtype="auto",  # This will determine the dtype
        trust_remote_code=True,
    )
    
    print(f"\nvLLM Model Config:")
    print(f"  dtype: {model_config.dtype}")
    print(f"  dtype_str: {model_config.dtype}")
    
    # The model uses bfloat16
    expected_dtype = torch.bfloat16
    print(f"\nExpected dtype for tensors: {expected_dtype}")
    
    # Test creating tensors with correct dtype
    print("\nTesting tensor creation:")
    
    # Attention mask should use the same dtype
    mask1 = torch.full((16, 16), float('-inf'), dtype=expected_dtype)
    print(f"  Attention mask dtype: {mask1.dtype}")
    
    # Position IDs use int32
    pos_ids = torch.zeros(16, dtype=torch.int32)
    print(f"  Position IDs dtype: {pos_ids.dtype}")
    
    # Input IDs use int32
    input_ids = torch.zeros(16, dtype=torch.int32)
    print(f"  Input IDs dtype: {input_ids.dtype}")

if __name__ == "__main__":
    check_model_dtypes()
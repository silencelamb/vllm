#!/usr/bin/env python3
"""Test dtype fix for attention mask"""

import os
import torch

# Set up environment
os.environ["VLLM_USE_XLA_GPU"] = "1"
os.environ["VLLM_USE_V1"] = "1"
os.environ["VLLM_LOGGING_LEVEL"] = "INFO"
os.environ["GPU_NUM_DEVICES"] = "1"
os.environ["CUDA_VISIBLE_DEVICES"] = "3"
os.environ["PJRT_DEVICE"] = "CUDA"
os.environ["XLA_PYTHON_CLIENT_PREALLOCATE"] = "false"
os.environ["HF_HUB_OFFLINE"] = "1"
os.environ["TRANSFORMERS_OFFLINE"] = "1"

def test_attention_mask_dtype():
    """Test that attention mask uses correct dtype"""
    from vllm import LLM, SamplingParams
    
    print("=== Testing Attention Mask Dtype Fix ===")
    
    prompts = ["Hello, how are you?"]
    
    sampling_params = SamplingParams(
        temperature=0.0,
        max_tokens=5,
        top_p=1.0,
        top_k=1,
    )
    
    try:
        llm = LLM(
            model="Qwen/Qwen3-0.6B",
            max_num_batched_tokens=32,
            max_model_len=32,
            max_num_seqs=4,
            enforce_eager=False,
            tensor_parallel_size=1,
            gpu_memory_utilization=0.1,
            compilation_config={
                "custom_ops": ["none"],
                "use_torch_compile": True,
                "backend": "openxla",
                "torch_compile_options": {
                    "backend": "openxla",
                    "dynamic": True,
                    "fullgraph": False,
                }
            },
        )
        
        print("\nGenerating output...")
        outputs = llm.generate(prompts, sampling_params)
        
        for output in outputs:
            prompt = output.prompt
            generated_text = output.outputs[0].text
            print(f"\nPrompt: {prompt!r}")
            print(f"Generated: {generated_text!r}")
        
        print("\n✓ Test completed successfully - dtype issue fixed!")
        
    except RuntimeError as e:
        if "expected shape bf16" in str(e) and "but got incompatible shape f32" in str(e):
            print(f"\n✗ Dtype mismatch still exists: {e}")
            return False
        else:
            raise
    
    return True

if __name__ == "__main__":
    if test_attention_mask_dtype():
        print("\n🎉 Dtype fix verified!")
    else:
        print("\n❌ Dtype fix failed")
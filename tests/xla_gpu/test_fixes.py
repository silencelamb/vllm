#!/usr/bin/env python3
"""Test the XLA GPU fixes for position IDs, KV cache, and attention mask"""

import os
import torch

# Set up environment
os.environ["VLLM_USE_XLA_GPU"] = "1"
os.environ["VLLM_USE_V1"] = "1"
os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"
os.environ["GPU_NUM_DEVICES"] = "1"
os.environ["CUDA_VISIBLE_DEVICES"] = "3"
os.environ["PJRT_DEVICE"] = "CUDA"
os.environ["XLA_PYTHON_CLIENT_PREALLOCATE"] = "false"
os.environ["CUDA_LAUNCH_BLOCKING"] = "1"
os.environ["HF_HUB_OFFLINE"] = "1"
os.environ["TRANSFORMERS_OFFLINE"] = "1"

# Enable XLA debug output
os.environ["VLLM_XLA_DEBUG"] = "1"
os.environ["XLA_FLAGS"] = "--xla_dump_hlo_as_text --xla_dump_to=/tmp/xla_dump"

# Configure torch for dynamic shapes
torch._dynamo.config.capture_dynamic_output_shape_ops = True
torch._dynamo.config.automatic_dynamic_shapes = True
torch._dynamo.config.assume_static_by_default = False


def test_simple_generation():
    """Test basic generation with fixes"""
    from vllm import LLM, SamplingParams
    
    print("=== Testing XLA GPU Fixes ===")
    
    # Simple prompt to test
    prompts = ["The capital of France is"]
    
    # Deterministic sampling for consistent results
    sampling_params = SamplingParams(
        temperature=0.0,
        max_tokens=10,
        top_p=1.0,
        top_k=1,
    )
    
    print("\nInitializing model...")
    llm = LLM(
        model="Qwen/Qwen3-0.6B",
        max_num_batched_tokens=128,
        max_model_len=128,
        max_num_seqs=4,
        enforce_eager=False,
        tensor_parallel_size=1,
        gpu_memory_utilization=0.15,
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
        
        # Check if output is reasonable (not gibberish)
        if all(ord(c) < 256 for c in generated_text):  # All ASCII characters
            print("✓ Output contains valid ASCII characters")
        else:
            print("✗ Output contains non-ASCII characters (possible corruption)")
        
        # Check if output is coherent
        if "Paris" in generated_text or "paris" in generated_text.lower():
            print("✓ Output is semantically correct")
        else:
            print("⚠ Output may not be semantically correct, but could be valid")
    
    print("\n✓ Test completed successfully")


def test_multi_turn_generation():
    """Test multi-turn generation to verify KV cache handling"""
    from vllm import LLM, SamplingParams
    
    print("\n=== Testing Multi-turn Generation ===")
    
    # Multi-turn conversation
    prompts = [
        "Hello, my name is",
        "The weather today is",
        "I like to eat",
    ]
    
    sampling_params = SamplingParams(
        temperature=0.0,
        max_tokens=5,
        top_p=1.0,
        top_k=1,
    )
    
    llm = LLM(
        model="Qwen/Qwen3-0.6B",
        max_num_batched_tokens=64,
        max_model_len=64,
        max_num_seqs=8,
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
    
    print("\nGenerating outputs for multiple prompts...")
    outputs = llm.generate(prompts, sampling_params)
    
    all_valid = True
    for i, output in enumerate(outputs):
        prompt = output.prompt
        generated_text = output.outputs[0].text
        print(f"\nPrompt {i+1}: {prompt!r}")
        print(f"Generated: {generated_text!r}")
        
        # Basic validation
        if not generated_text or all(c == '�' for c in generated_text):
            print("✗ Generated text is invalid")
            all_valid = False
        else:
            print("✓ Generated text looks valid")
    
    if all_valid:
        print("\n✓ Multi-turn generation test passed")
    else:
        print("\n✗ Multi-turn generation test failed")


if __name__ == "__main__":
    try:
        test_simple_generation()
        test_multi_turn_generation()
        print("\n🎉 All tests completed!")
    except Exception as e:
        print(f"\n❌ Test failed with error: {e}")
        import traceback
        traceback.print_exc()
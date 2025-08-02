"""Debug XLA GPU generation issues with minimal test case"""

import os
import torch
import torch_xla.core.xla_model as xm

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

# Enable XLA debugging
os.environ["XLA_FLAGS"] = "--xla_dump_hlo_as_text --xla_dump_to=/tmp/xla_dump"
os.environ["XLA_HLO_DEBUG"] = "1"

def test_minimal_generation():
    """Test with a single prompt to isolate the issue"""
    from vllm import LLM, SamplingParams
    
    # Use deterministic sampling
    sampling_params = SamplingParams(
        temperature=0.0,  # Deterministic
        max_tokens=5,     # Very short output
        top_p=1.0,
        top_k=1,          # Force greedy decoding
    )
    
    # Single simple prompt
    prompts = ["Hello"]
    
    # Initialize model with minimal config
    llm = LLM(
        model="Qwen/Qwen3-0.6B",
        max_num_batched_tokens=32,
        max_model_len=32,
        max_num_seqs=1,
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
    
    print("Generating output...")
    outputs = llm.generate(prompts, sampling_params)
    
    for output in outputs:
        prompt = output.prompt
        generated_text = output.outputs[0].text
        print(f"Prompt: {prompt!r}")
        print(f"Generated: {generated_text!r}")
        print(f"Token IDs: {output.outputs[0].token_ids}")
    
    # Force XLA to sync and save debug info
    xm.mark_step()
    print("\nXLA debug files saved to /tmp/xla_dump/")


def test_eager_vs_compiled():
    """Compare eager mode vs compiled mode outputs"""
    from vllm import LLM, SamplingParams
    
    sampling_params = SamplingParams(
        temperature=0.0,
        max_tokens=5,
        top_p=1.0,
        top_k=1,
    )
    
    prompt = "The capital of France is"
    
    print("Testing EAGER mode...")
    llm_eager = LLM(
        model="Qwen/Qwen3-0.6B",
        max_num_batched_tokens=32,
        max_model_len=32,
        max_num_seqs=1,
        enforce_eager=True,  # Force eager mode
        tensor_parallel_size=1,
        gpu_memory_utilization=0.1,
    )
    
    outputs_eager = llm_eager.generate([prompt], sampling_params)
    eager_text = outputs_eager[0].outputs[0].text
    eager_tokens = outputs_eager[0].outputs[0].token_ids
    print(f"Eager output: {eager_text!r}")
    print(f"Eager tokens: {eager_tokens}")
    
    # Clean up
    del llm_eager
    torch.cuda.empty_cache()
    
    print("\nTesting COMPILED mode...")
    llm_compiled = LLM(
        model="Qwen/Qwen3-0.6B",
        max_num_batched_tokens=32,
        max_model_len=32,
        max_num_seqs=1,
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
    
    outputs_compiled = llm_compiled.generate([prompt], sampling_params)
    compiled_text = outputs_compiled[0].outputs[0].text
    compiled_tokens = outputs_compiled[0].outputs[0].token_ids
    print(f"Compiled output: {compiled_text!r}")
    print(f"Compiled tokens: {compiled_tokens}")
    
    # Compare
    if eager_text == compiled_text:
        print("\n✓ Outputs match!")
    else:
        print("\n✗ Outputs differ!")
        print(f"  Eager:    {eager_text!r} (tokens: {eager_tokens})")
        print(f"  Compiled: {compiled_text!r} (tokens: {compiled_tokens})")


if __name__ == "__main__":
    print("=== Minimal Generation Test ===")
    test_minimal_generation()
    
    print("\n\n=== Eager vs Compiled Test ===")
    test_eager_vs_compiled()
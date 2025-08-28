#!/usr/bin/env python3
"""
Debug test to compare XLA GPU vs Native GPU outputs
This helps identify where the XLA GPU implementation differs from the standard GPU implementation.
"""

import os
import torch
import numpy as np
from typing import Optional, Dict, Any
import json

def setup_environment_native():
    """Setup environment for native GPU execution"""
    # Disable XLA GPU
    if "VLLM_USE_XLA_GPU" in os.environ:
        del os.environ["VLLM_USE_XLA_GPU"]
    
    # Ensure V1 engine
    os.environ["VLLM_USE_V1"] = "1"
    os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"
    
    # Offline mode
    os.environ["HF_HUB_OFFLINE"] = "1"
    os.environ["TRANSFORMERS_OFFLINE"] = "1"


def setup_environment_xla():
    """Setup environment for XLA GPU execution"""
    os.environ["VLLM_USE_XLA_GPU"] = "1"
    os.environ["VLLM_USE_V1"] = "1"
    os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"
    
    # XLA specific settings
    os.environ["PJRT_DEVICE"] = "CUDA"
    os.environ["TF_CPP_MIN_LOG_LEVEL"] = "0"
    os.environ["XLA_PYTHON_CLIENT_PREALLOCATE"] = "false"
    os.environ["CUDA_LAUNCH_BLOCKING"] = "1"
    os.environ["XLA_PYTHON_CLIENT_ALLOCATOR"] = "platform"
    
    # Offline mode
    os.environ["HF_HUB_OFFLINE"] = "1"
    os.environ["TRANSFORMERS_OFFLINE"] = "1"
    
    # Worker settings
    os.environ["VLLM_WORKER_MULTIPROC_METHOD"] = "spawn"
    os.environ["VLLM_WORKER_USE_RAY"] = "0"
    os.environ["VLLM_ENGINE_USE_RAY"] = "0"


def create_debug_model_config(num_layers: int = 1) -> str:
    """Create a simplified model config with specified number of layers"""
    config_path = "/tmp/debug_llama_config.json"
    
    # Simplified Llama config with fewer layers
    config = {
        "architectures": ["LlamaForCausalLM"],
        "model_type": "llama",
        "hidden_size": 2048,
        "intermediate_size": 8192,
        "num_hidden_layers": num_layers,  # Simplified!
        "num_attention_heads": 16,
        "num_key_value_heads": 8,
        "hidden_act": "silu",
        "max_position_embeddings": 128,
        "initializer_range": 0.02,
        "rms_norm_eps": 1e-5,
        "use_cache": True,
        "vocab_size": 128256,
        "tie_word_embeddings": False,
        "rope_theta": 500000.0,
        "rope_scaling": None,
        "attention_bias": False,
        "attention_dropout": 0.0,
        "mlp_bias": False,
    }
    
    with open(config_path, 'w') as f:
        json.dump(config, f, indent=2)
    
    print(f"Created simplified config with {num_layers} layer(s) at: {config_path}")
    return config_path


def test_native_gpu(prompts, sampling_params, model_path="meta-llama/Llama-3.2-1B"):
    """Test with native GPU (no XLA)"""
    print("\n" + "="*60)
    print("Testing with Native GPU (Eager mode)")
    print("="*60)
    
    setup_environment_native()
    
    from vllm import LLM
    
    llm = LLM(
        model=model_path,
        max_num_batched_tokens=128,
        max_model_len=128,
        max_num_seqs=4,
        enforce_eager=True,  # No compilation
        tensor_parallel_size=1,
        gpu_memory_utilization=0.15,
        trust_remote_code=True,
    )
    
    outputs = llm.generate(prompts, sampling_params)
    
    results = []
    for output in outputs:
        generated_text = output.outputs[0].text
        print(f"Prompt: {output.prompt!r}")
        print(f"Generated: {generated_text!r}")
        results.append(generated_text)
    
    # Cleanup
    del llm
    torch.cuda.empty_cache()
    
    return results


def test_xla_gpu(prompts, sampling_params, model_path="meta-llama/Llama-3.2-1B"):
    """Test with XLA GPU"""
    print("\n" + "="*60)
    print("Testing with XLA GPU")
    print("="*60)
    
    setup_environment_xla()
    
    # Import XLA plugins
    from torch_xla.experimental import plugins
    import torch_xla_cuda_plugin
    plugins.use_dynamic_plugins()
    plugins.register_plugin('CUDA', torch_xla_cuda_plugin.CudaPlugin())
    import torch_xla.runtime as xr
    xr.set_device_type('CUDA')
    
    from vllm import LLM
    
    llm = LLM(
        model=model_path,
        max_num_batched_tokens=128,
        max_model_len=128,
        max_num_seqs=4,
        enforce_eager=False,
        tensor_parallel_size=1,
        gpu_memory_utilization=0.15,
        compilation_config={
            "custom_ops": ["none"],
            "use_inductor": False,
            "use_cudagraph": False,
            "backend": "openxla",
            "dynamic": False,
            "torch_compile_options": {
                "backend": "openxla",
                "dynamic": False,
                "fullgraph": True,
            },
        },
        trust_remote_code=True,
    )
    
    outputs = llm.generate(prompts, sampling_params)
    
    results = []
    for output in outputs:
        generated_text = output.outputs[0].text
        print(f"Prompt: {output.prompt!r}")
        print(f"Generated: {generated_text!r}")
        results.append(generated_text)
    
    # Cleanup
    del llm
    torch.cuda.empty_cache()
    
    return results


def test_with_hooks(prompts, sampling_params, backend="native"):
    """Test with debug hooks to capture intermediate values"""
    print("\n" + "="*60)
    print(f"Testing with Debug Hooks (backend={backend})")
    print("="*60)
    
    # This would require modifying the model to add hooks
    # We'll create a separate implementation if needed
    pass


def compare_outputs(native_results, xla_results):
    """Compare outputs from native and XLA GPU"""
    print("\n" + "="*60)
    print("Comparison Results")
    print("="*60)
    
    for i, (native, xla) in enumerate(zip(native_results, xla_results)):
        print(f"\nPrompt {i+1}:")
        print(f"  Native GPU: {native!r}")
        print(f"  XLA GPU:    {xla!r}")
        
        if native == xla:
            print("  ✓ Outputs match!")
        else:
            print("  ✗ Outputs differ!")
            
            # Character-level comparison
            if len(native) == len(xla):
                for j, (c1, c2) in enumerate(zip(native, xla)):
                    if c1 != c2:
                        print(f"    First difference at position {j}: {c1!r} vs {c2!r}")
                        break
            else:
                print(f"    Length difference: {len(native)} vs {len(xla)}")


def main():
    """Main test function"""
    import argparse
    parser = argparse.ArgumentParser(description="Compare XLA GPU vs Native GPU outputs")
    parser.add_argument("--num-layers", type=int, default=1,
                        help="Number of layers in the model (for debugging)")
    parser.add_argument("--use-simplified-model", action="store_true",
                        help="Use a simplified model config for debugging")
    parser.add_argument("--skip-native", action="store_true",
                        help="Skip native GPU test")
    parser.add_argument("--skip-xla", action="store_true",
                        help="Skip XLA GPU test")
    args = parser.parse_args()
    
    # Test configuration
    prompts = ["Hello, how are you?"]
    
    from vllm import SamplingParams
    sampling_params = SamplingParams(
        temperature=0.0,  # Deterministic
        max_tokens=10,
        top_p=1.0,
    )
    
    model_path = "meta-llama/Llama-3.2-1B"
    if args.use_simplified_model:
        # Create simplified config
        config_path = create_debug_model_config(num_layers=args.num_layers)
        # Note: This would require a custom model loader
        print("Note: Simplified model requires custom implementation")
    
    native_results = None
    xla_results = None
    
    # Run tests
    try:
        if not args.skip_native:
            native_results = test_native_gpu(prompts, sampling_params, model_path)
        
        if not args.skip_xla:
            xla_results = test_xla_gpu(prompts, sampling_params, model_path)
        
        # Compare if both were run
        if native_results is not None and xla_results is not None:
            compare_outputs(native_results, xla_results)
            
    except Exception as e:
        print(f"\n✗ Error during testing: {e}")
        import traceback
        traceback.print_exc()
        return 1
    
    return 0


if __name__ == "__main__":
    exit(main())
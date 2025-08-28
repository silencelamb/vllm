#!/usr/bin/env python3
"""
Advanced debugging tool to capture intermediate attention values
Helps identify where XLA GPU diverges from native GPU implementation
"""

import os
import torch
import torch.nn as nn
from typing import Dict, List, Any, Optional, Tuple
import numpy as np
from dataclasses import dataclass
from contextlib import contextmanager


@dataclass
class AttentionDebugInfo:
    """Store debug information from attention layers"""
    layer_idx: int
    step: str  # 'prefill' or 'decode'
    
    # Input tensors
    hidden_states: Optional[torch.Tensor] = None
    positions: Optional[torch.Tensor] = None
    
    # QKV projections
    query: Optional[torch.Tensor] = None
    key: Optional[torch.Tensor] = None
    value: Optional[torch.Tensor] = None
    
    # KV cache state
    key_cache_before: Optional[torch.Tensor] = None
    value_cache_before: Optional[torch.Tensor] = None
    key_cache_after: Optional[torch.Tensor] = None
    value_cache_after: Optional[torch.Tensor] = None
    slot_mapping: Optional[torch.Tensor] = None
    
    # Attention computation
    attention_scores: Optional[torch.Tensor] = None
    attention_weights: Optional[torch.Tensor] = None
    attention_output: Optional[torch.Tensor] = None
    
    # Final output
    output: Optional[torch.Tensor] = None


class AttentionDebugger:
    """Debug helper to capture attention intermediate values"""
    
    def __init__(self, enabled: bool = True):
        self.enabled = enabled
        self.debug_info: Dict[int, List[AttentionDebugInfo]] = {}
        self.hooks = []
        self.current_layer = 0
        self.current_step = "prefill"
        
    def clear(self):
        """Clear all stored debug information"""
        self.debug_info.clear()
        self.remove_hooks()
        
    def remove_hooks(self):
        """Remove all registered hooks"""
        for hook in self.hooks:
            hook.remove()
        self.hooks.clear()
    
    def register_attention_hooks(self, model: nn.Module):
        """Register hooks on attention layers"""
        if not self.enabled:
            return
            
        def make_attention_hook(layer_idx: int):
            def hook(module, input, output):
                # Store debug info for this layer
                info = AttentionDebugInfo(
                    layer_idx=layer_idx,
                    step=self.current_step,
                )
                
                # Capture inputs
                if isinstance(input, tuple):
                    info.hidden_states = input[0].detach().cpu() if input[0] is not None else None
                    if len(input) > 1:
                        info.positions = input[1].detach().cpu() if input[1] is not None else None
                
                # Capture output
                if isinstance(output, tuple):
                    info.output = output[0].detach().cpu() if output[0] is not None else None
                elif output is not None:
                    info.output = output.detach().cpu()
                
                # Store in debug info
                if layer_idx not in self.debug_info:
                    self.debug_info[layer_idx] = []
                self.debug_info[layer_idx].append(info)
                
                print(f"[DEBUG] Layer {layer_idx} attention output shape: {info.output.shape if info.output is not None else 'None'}")
                
            return hook
        
        # Find attention layers and register hooks
        for name, module in model.named_modules():
            if "self_attn" in name or "attention" in name.lower():
                # Extract layer index from name
                parts = name.split(".")
                for part in parts:
                    if part.isdigit():
                        layer_idx = int(part)
                        hook = module.register_forward_hook(make_attention_hook(layer_idx))
                        self.hooks.append(hook)
                        print(f"[DEBUG] Registered hook on {name} (layer {layer_idx})")
                        break
    
    def capture_kv_cache(self, key_cache: torch.Tensor, value_cache: torch.Tensor, 
                        slot_mapping: torch.Tensor, layer_idx: int, when: str = "before"):
        """Manually capture KV cache state"""
        if not self.enabled:
            return
            
        if layer_idx in self.debug_info and self.debug_info[layer_idx]:
            info = self.debug_info[layer_idx][-1]
            
            # Clone relevant slots only
            if slot_mapping is not None:
                slots = slot_mapping.cpu().numpy()
                k_snapshot = key_cache[slots].detach().cpu() if len(slots) > 0 else None
                v_snapshot = value_cache[slots].detach().cpu() if len(slots) > 0 else None
            else:
                k_snapshot = key_cache.detach().cpu()
                v_snapshot = value_cache.detach().cpu()
            
            if when == "before":
                info.key_cache_before = k_snapshot
                info.value_cache_before = v_snapshot
                info.slot_mapping = slot_mapping.detach().cpu() if slot_mapping is not None else None
            else:
                info.key_cache_after = k_snapshot
                info.value_cache_after = v_snapshot
    
    def capture_qkv(self, query: torch.Tensor, key: torch.Tensor, value: torch.Tensor, layer_idx: int):
        """Manually capture QKV projections"""
        if not self.enabled:
            return
            
        if layer_idx in self.debug_info and self.debug_info[layer_idx]:
            info = self.debug_info[layer_idx][-1]
            info.query = query.detach().cpu()
            info.key = key.detach().cpu()
            info.value = value.detach().cpu()
            print(f"[DEBUG] Layer {layer_idx} QKV shapes: Q={query.shape}, K={key.shape}, V={value.shape}")
    
    def print_summary(self):
        """Print summary of captured debug information"""
        print("\n" + "="*60)
        print("Attention Debug Summary")
        print("="*60)
        
        for layer_idx in sorted(self.debug_info.keys()):
            infos = self.debug_info[layer_idx]
            print(f"\nLayer {layer_idx}: {len(infos)} forward passes")
            
            for i, info in enumerate(infos):
                print(f"  Pass {i+1} ({info.step}):")
                
                if info.hidden_states is not None:
                    print(f"    Input shape: {info.hidden_states.shape}")
                    print(f"    Input mean: {info.hidden_states.mean().item():.6f}")
                    print(f"    Input std: {info.hidden_states.std().item():.6f}")
                
                if info.output is not None:
                    print(f"    Output shape: {info.output.shape}")
                    print(f"    Output mean: {info.output.mean().item():.6f}")
                    print(f"    Output std: {info.output.std().item():.6f}")
                    
                    # Check for all zeros
                    if torch.allclose(info.output, torch.zeros_like(info.output)):
                        print(f"    ⚠️  WARNING: Output is all zeros!")
                
                if info.query is not None:
                    print(f"    Q mean: {info.query.mean().item():.6f}, std: {info.query.std().item():.6f}")
                if info.key is not None:
                    print(f"    K mean: {info.key.mean().item():.6f}, std: {info.key.std().item():.6f}")
                if info.value is not None:
                    print(f"    V mean: {info.value.mean().item():.6f}, std: {info.value.std().item():.6f}")
                
                # Check KV cache
                if info.key_cache_after is not None and info.key_cache_before is not None:
                    diff = (info.key_cache_after - info.key_cache_before).abs().sum().item()
                    print(f"    KV cache change: {diff:.6f}")
                    if diff == 0:
                        print(f"    ⚠️  WARNING: KV cache unchanged!")
    
    def compare_with_reference(self, reference_debugger: 'AttentionDebugger'):
        """Compare debug info with a reference (e.g., native GPU)"""
        print("\n" + "="*60)
        print("Comparison with Reference")
        print("="*60)
        
        for layer_idx in self.debug_info.keys():
            if layer_idx not in reference_debugger.debug_info:
                print(f"\n⚠️  Layer {layer_idx} not in reference!")
                continue
            
            infos = self.debug_info[layer_idx]
            ref_infos = reference_debugger.debug_info[layer_idx]
            
            print(f"\nLayer {layer_idx}:")
            
            for i, (info, ref_info) in enumerate(zip(infos, ref_infos)):
                print(f"  Pass {i+1}:")
                
                # Compare outputs
                if info.output is not None and ref_info.output is not None:
                    if info.output.shape != ref_info.output.shape:
                        print(f"    ✗ Output shape mismatch: {info.output.shape} vs {ref_info.output.shape}")
                    else:
                        diff = (info.output - ref_info.output).abs()
                        max_diff = diff.max().item()
                        mean_diff = diff.mean().item()
                        print(f"    Output diff - Max: {max_diff:.6e}, Mean: {mean_diff:.6e}")
                        
                        if max_diff > 1e-3:
                            print(f"    ⚠️  Large difference detected!")
                            # Find location of max difference
                            idx = diff.argmax()
                            print(f"    Max diff at index {idx}: {info.output.flatten()[idx]:.6f} vs {ref_info.output.flatten()[idx]:.6f}")


# Context manager for debugging
@contextmanager
def debug_attention(model: nn.Module, enabled: bool = True):
    """Context manager to debug attention layers"""
    debugger = AttentionDebugger(enabled=enabled)
    try:
        debugger.register_attention_hooks(model)
        yield debugger
    finally:
        debugger.remove_hooks()


# Monkey-patch helper to inject debugging into existing code
def inject_kv_cache_debugging(model_runner_cls):
    """Inject KV cache debugging into a ModelRunner class"""
    original_forward = model_runner_cls.execute_model
    
    def wrapped_forward(self, *args, **kwargs):
        # Check if debugging is enabled
        if hasattr(self, '_debugger') and self._debugger is not None:
            # Capture state before forward
            self._debugger.current_step = "decode" if hasattr(self, 'is_decode') and self.is_decode else "prefill"
            
        result = original_forward(*args, **kwargs)
        
        if hasattr(self, '_debugger') and self._debugger is not None:
            self._debugger.print_summary()
            
        return result
    
    model_runner_cls.execute_model = wrapped_forward
    
    # Add debugger initialization
    original_init = model_runner_cls.__init__
    
    def wrapped_init(self, *args, **kwargs):
        original_init(self, *args, **kwargs)
        self._debugger = AttentionDebugger(enabled=os.environ.get("VLLM_DEBUG_ATTENTION", "0") == "1")
    
    model_runner_cls.__init__ = wrapped_init


def test_with_debugging():
    """Example of using the debugging tools"""
    os.environ["VLLM_DEBUG_ATTENTION"] = "1"  # Enable debugging
    
    # Import and patch the model runner
    from vllm.v1.worker.xla_gpu_model_runner import XlaGpuModelRunner
    inject_kv_cache_debugging(XlaGpuModelRunner)
    
    # Now run your normal test
    from vllm import LLM, SamplingParams
    
    llm = LLM(
        model="meta-llama/Llama-3.2-1B",
        max_num_batched_tokens=128,
        max_model_len=128,
        enforce_eager=False,
        # ... other config
    )
    
    outputs = llm.generate(["Hello"], SamplingParams(temperature=0, max_tokens=5))
    print(outputs[0].outputs[0].text)


if __name__ == "__main__":
    print("Attention debugging tools loaded.")
    print("Set VLLM_DEBUG_ATTENTION=1 to enable debugging")
    print("\nExample usage:")
    print("  from debug_attention_hook import inject_kv_cache_debugging")
    print("  from vllm.v1.worker.xla_gpu_model_runner import XlaGpuModelRunner")
    print("  inject_kv_cache_debugging(XlaGpuModelRunner)")
    print("\n  # Then run your test with VLLM_DEBUG_ATTENTION=1")
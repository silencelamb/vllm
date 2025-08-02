# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

"""
Example of how to properly register XLA custom calls that will appear in HLO.
"""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import torch_xla.core.xla_builder as xb
import torch_xla._XLAC as xlac


def register_custom_call_cpu():
    """Register a CPU implementation of the custom call."""
    import ctypes
    import numpy as np
    
    # Define the CPU implementation
    def paged_attention_cpu_impl(inputs, outputs):
        # inputs[0] = query, inputs[1] = kv_cache, etc.
        # outputs[0] = output tensor
        query = inputs[0]
        scale = 0.125  # Would be passed as config
        
        # Simple implementation
        output = query * scale
        outputs[0][:] = output
    
    # Register with XLA runtime
    # This is platform-specific and may vary
    print("CPU custom call registration not implemented in this example")


def create_paged_attention_hlo_custom_call(
    query, kv_cache, context_lens, block_tables, 
    query_start_loc, num_seqs, scale
):
    """Create an HLO custom-call node directly."""
    
    # Get the XLA computation context
    import torch_xla.core.xla_model as xm
    import torch_xla.core.xla_builder as xb
    import torch_xla._XLAC as xlac
    
    # Method 1: Use XLA builder to create custom-call
    try:
        # Get XLA tensors
        query_xla = xlac._get_xla_tensor(query)
        kv_cache_xla = xlac._get_xla_tensor(kv_cache)
        
        # Get the builder from current context
        builder = xb._get_xla_builder()
        
        # Create operands list
        operands = [
            query_xla,
            kv_cache_xla,
            xlac._get_xla_tensor(context_lens),
            xlac._get_xla_tensor(block_tables),
        ]
        
        # Define output shape
        output_shape = xb.Shape.array_shape(
            query.dtype,
            query.shape,
            query_xla.get_shape().layout()
        )
        
        # Create custom-call operation
        custom_call = xb.ops.CustomCall(
            builder,
            b"paged_attention_custom",  # This name will appear in HLO
            operands,
            output_shape,
            opaque=str({"scale": scale}).encode()  # Backend config
        )
        
        # Wrap back to PyTorch tensor
        return xlac._xla_create_tensor(custom_call, query.device)
        
    except Exception as e:
        print(f"XLA builder method failed: {e}")
    
    # Method 2: Use torch_xla's internal custom call API
    try:
        # This creates a proper custom-call in HLO
        result = xlac._xla_custom_call(
            [query, kv_cache, context_lens, block_tables, query_start_loc, num_seqs],
            output_dtypes=[str(query.dtype)],
            output_shapes=[list(query.shape)],
            target_name="paged_attention_custom_v2",
            has_side_effect=False,
            api_version=1,
            backend_config=str({"scale": scale})
        )
        return result[0]
    except Exception as e:
        print(f"XLAC custom call method failed: {e}")
    
    # Fallback
    return query * scale


def test_custom_call_in_hlo():
    """Test that custom-call appears in HLO."""
    import os
    os.environ['XLA_FLAGS'] = '--xla_dump_to=./xla_dump_custom_call --xla_dump_hlo_as_text'
    
    # Create XLA tensors
    device = xm.xla_device()
    query = torch.randn(4, 8, 64).to(device)
    kv_cache = torch.randn(2, 16, 16, 64).to(device)
    context_lens = torch.tensor([2, 2], dtype=torch.int32).to(device)
    block_tables = torch.zeros((2, 2), dtype=torch.int32).to(device)
    query_start_loc = torch.tensor([0, 2], dtype=torch.int32).to(device)
    num_seqs = torch.tensor(2, dtype=torch.int32).to(device)
    scale = 0.125
    
    print("Creating custom-call operation...")
    output = create_paged_attention_hlo_custom_call(
        query, kv_cache, context_lens, block_tables,
        query_start_loc, num_seqs, scale
    )
    
    # Force execution
    xm.mark_step()
    xm.wait_device_ops()
    
    # Get HLO text
    try:
        hlo_text = xlac._get_xla_tensors_text([output])
        print("\nHLO Graph:")
        print("=" * 60)
        print(hlo_text)
        print("=" * 60)
        
        # Check for custom-call
        if "custom-call" in hlo_text.lower():
            print("\n✅ SUCCESS: custom-call found in HLO!")
            
            # Find the custom call line
            for line in hlo_text.split('\n'):
                if "custom-call" in line.lower():
                    print(f"Found: {line.strip()}")
        else:
            print("\n❌ custom-call not found in HLO")
            
    except Exception as e:
        print(f"Could not get HLO: {e}")
    
    print("\nCheck ./xla_dump_custom_call/ for full HLO dumps")
    return output


# Additional approach: Using XLA's Python binding for custom call
def register_xla_custom_call_python():
    """Register a Python function as XLA custom call."""
    try:
        import jax
        from jax import core
        from jax.interpreters import xla
        
        # Define primitive
        paged_attention_p = core.Primitive("paged_attention_custom")
        
        # Implementation
        def paged_attention_impl(query, kv_cache, scale):
            return query * scale
        
        # Abstract evaluation
        def paged_attention_abstract(query, kv_cache, scale):
            return core.ShapedArray(query.shape, query.dtype)
        
        # XLA translation
        def paged_attention_xla_translation(ctx, query, kv_cache, scale):
            return [
                xla.ops.CustomCall(
                    ctx.builder,
                    b"paged_attention_jax",
                    operands=[query, kv_cache],
                    shape=query.shape,
                    opaque=str({"scale": scale}).encode()
                )
            ]
        
        # Register
        paged_attention_p.def_impl(paged_attention_impl)
        paged_attention_p.def_abstract_eval(paged_attention_abstract)
        xla.register_translation(paged_attention_p, paged_attention_xla_translation)
        
        print("Registered JAX/XLA custom call")
        
    except ImportError:
        print("JAX not available for custom call registration")


if __name__ == "__main__":
    print("XLA Custom Call Example")
    print("This shows how to create custom-call nodes in HLO")
    print("=" * 60)
    
    # Try registration methods
    register_custom_call_cpu()
    register_xla_custom_call_python()
    
    # Test custom call
    test_custom_call_in_hlo()
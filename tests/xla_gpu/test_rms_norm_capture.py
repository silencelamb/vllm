"""Test XLA's ability to capture and compile rms_norm op."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from vllm._custom_ops import rms_norm
import numpy as np


def manual_rms_norm(input: torch.Tensor, weight: torch.Tensor, epsilon: float) -> torch.Tensor:
    """Manual implementation of RMS norm for comparison."""
    variance = input.pow(2).mean(-1, keepdim=True)
    input_normalized = input * torch.rsqrt(variance + epsilon)
    return input_normalized * weight


def test_xla_rms_norm_capture():
    """Test if XLA can capture and compile the rms_norm op."""
    
    # Setup XLA device
    device = xm.xla_device()
    print(f"Using XLA device: {device}")
    
    # Test parameters
    batch_size = 2
    seq_len = 128
    hidden_size = 4096
    epsilon = 1e-5
    
    # Create test tensors on CPU first
    input_cpu = torch.randn(batch_size, seq_len, hidden_size)
    weight_cpu = torch.randn(hidden_size)
    
    # Move to XLA device
    input_xla = input_cpu.to(device)
    weight_xla = weight_cpu.to(device)
    out_xla = torch.empty_like(input_xla)
    
    print(f"Input shape: {input_xla.shape}")
    print(f"Weight shape: {weight_xla.shape}")
    
    # Test 1: Direct execution on XLA
    print("\n=== Test 1: Direct execution on XLA ===")
    try:
        rms_norm(out_xla, input_xla, weight_xla, epsilon)
        xm.mark_step()  # Force XLA compilation
        print("✓ Direct execution successful")
        
        # Get result back to CPU for verification
        result_direct = out_xla.cpu()
        print(f"Output shape: {result_direct.shape}")
        print(f"Output mean: {result_direct.mean().item():.6f}")
        print(f"Output std: {result_direct.std().item():.6f}")
    except Exception as e:
        print(f"✗ Direct execution failed: {e}")
        result_direct = None
    
    # Test 2: Using torch.compile with OpenXLA backend
    print("\n=== Test 2: torch.compile with OpenXLA backend ===")
    try:
        def rms_norm_wrapper(input_tensor, weight_tensor, eps):
            out = torch.empty_like(input_tensor)
            rms_norm(out, input_tensor, weight_tensor, eps)
            return out
        
        # Compile the function
        compiled_fn = torch.compile(rms_norm_wrapper, backend='openxla')
        
        # Execute compiled function
        result_compiled = compiled_fn(input_xla, weight_xla, epsilon)
        xm.mark_step()
        
        print("✓ torch.compile execution successful")
        result_compiled_cpu = result_compiled.cpu()
        print(f"Output shape: {result_compiled_cpu.shape}")
        print(f"Output mean: {result_compiled_cpu.mean().item():.6f}")
        print(f"Output std: {result_compiled_cpu.std().item():.6f}")
    except Exception as e:
        print(f"✗ torch.compile execution failed: {e}")
        result_compiled_cpu = None
    
    # Test 3: Compare with manual implementation
    print("\n=== Test 3: Comparison with manual implementation ===")
    try:
        # Manual implementation on CPU
        expected_cpu = manual_rms_norm(input_cpu, weight_cpu, epsilon)
        print(f"Expected output shape: {expected_cpu.shape}")
        print(f"Expected mean: {expected_cpu.mean().item():.6f}")
        print(f"Expected std: {expected_cpu.std().item():.6f}")
        
        # Compare results if available
        if result_direct is not None:
            diff_direct = torch.abs(result_direct - expected_cpu)
            print(f"\nDirect execution vs Manual:")
            print(f"  Max difference: {diff_direct.max().item():.2e}")
            print(f"  Mean difference: {diff_direct.mean().item():.2e}")
            
            # Check if results are close
            if torch.allclose(result_direct, expected_cpu, rtol=1e-3, atol=1e-5):
                print("  ✓ Results match within tolerance")
            else:
                print("  ✗ Results differ beyond tolerance")
        
        if result_compiled_cpu is not None:
            diff_compiled = torch.abs(result_compiled_cpu - expected_cpu)
            print(f"\nCompiled execution vs Manual:")
            print(f"  Max difference: {diff_compiled.max().item():.2e}")
            print(f"  Mean difference: {diff_compiled.mean().item():.2e}")
            
            if torch.allclose(result_compiled_cpu, expected_cpu, rtol=1e-3, atol=1e-5):
                print("  ✓ Results match within tolerance")
            else:
                print("  ✗ Results differ beyond tolerance")
                
    except Exception as e:
        print(f"✗ Comparison failed: {e}")
    
    # Test 4: Check XLA graph capture
    print("\n=== Test 4: XLA Graph Information ===")
    try:
        # Get XLA metrics
        import torch_xla.debug.metrics as met
        print("XLA Metrics:")
        # print(met.metrics_report())
    except Exception as e:
        print(f"Could not retrieve XLA metrics: {e}")
    
    print("\n=== Test Summary ===")
    print("This test checks if XLA can capture and compile the rms_norm custom op.")
    print("If the op is not registered for XLA, it may fall back to CPU execution.")
    print("To fully support XLA, the op needs XLA-specific registration.")


if __name__ == "__main__":
    print("Testing XLA capture of rms_norm op...")
    print("=" * 60)
    test_xla_rms_norm_capture()
    print("=" * 60)
    print("Test completed!")
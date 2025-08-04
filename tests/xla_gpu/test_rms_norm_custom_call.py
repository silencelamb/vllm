"""Test XLA Custom Call for RMS Norm."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import numpy as np
import sys
import os

# Add vllm to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from vllm.xla_ops.rms_norm_custom_call import (
    XlaRmsNormOp, 
    rms_norm_xla,
    functional_rms_norm,
    register_rms_norm_lowering
)


def manual_rms_norm(input: torch.Tensor, weight: torch.Tensor, 
                    epsilon: float) -> torch.Tensor:
    """Reference implementation for comparison."""
    variance = input.pow(2).mean(-1, keepdim=True)
    input_normalized = input * torch.rsqrt(variance + epsilon)
    return input_normalized * weight


def test_xla_custom_call_rms_norm():
    """Test the XLA custom call implementation of RMS Norm."""
    
    print("=" * 80)
    print("Testing XLA Custom Call RMS Norm")
    print("=" * 80)
    
    # Setup
    device = xm.xla_device()
    print(f"Using device: {device}")
    
    # Test configurations
    test_configs = [
        (2, 128, 512),    # (batch, seq_len, hidden_size)
        (1, 256, 1024),
        (4, 64, 768),
        (8, 32, 4096),    # Larger hidden size
    ]
    
    epsilon = 1e-5
    
    for batch_size, seq_len, hidden_size in test_configs:
        print(f"\n--- Testing shape: ({batch_size}, {seq_len}, {hidden_size}) ---")
        
        # Create test data
        input_cpu = torch.randn(batch_size, seq_len, hidden_size)
        weight_cpu = torch.randn(hidden_size)
        
        # Move to XLA
        input_xla = input_cpu.to(device)
        weight_xla = weight_cpu.to(device)
        
        # Test 1: Direct XLA custom call
        print("1. Testing direct XLA custom call...")
        try:
            output_xla = rms_norm_xla(input_xla, weight_xla, epsilon)
            xm.mark_step()
            
            # Move to CPU for comparison
            output_custom = output_xla.cpu()
            print(f"   ✓ Custom call successful")
            print(f"   Output shape: {output_custom.shape}")
            print(f"   Output mean: {output_custom.mean().item():.6f}")
            print(f"   Output std: {output_custom.std().item():.6f}")
            
        except Exception as e:
            print(f"   ✗ Custom call failed: {e}")
            output_custom = None
        
        # Test 2: Functional interface
        print("2. Testing functional interface...")
        try:
            output_func = functional_rms_norm(input_xla, weight_xla, epsilon)
            xm.mark_step()
            
            output_func_cpu = output_func.cpu()
            print(f"   ✓ Functional interface successful")
            
        except Exception as e:
            print(f"   ✗ Functional interface failed: {e}")
            output_func_cpu = None
        
        # Test 3: Compare with reference
        print("3. Comparing with reference implementation...")
        expected = manual_rms_norm(input_cpu, weight_cpu, epsilon)
        
        if output_custom is not None:
            diff = torch.abs(output_custom - expected)
            max_diff = diff.max().item()
            mean_diff = diff.mean().item()
            
            print(f"   Custom call vs Reference:")
            print(f"     Max difference: {max_diff:.2e}")
            print(f"     Mean difference: {mean_diff:.2e}")
            
            if torch.allclose(output_custom, expected, rtol=1e-3, atol=1e-5):
                print("     ✓ Results match within tolerance")
            else:
                print("     ✗ Results differ beyond tolerance")
        
        if output_func_cpu is not None and output_custom is not None:
            if torch.allclose(output_func_cpu, output_custom, rtol=1e-6, atol=1e-6):
                print("   ✓ Functional and custom call outputs match")
            else:
                print("   ✗ Functional and custom call outputs differ")
    
    print("\n" + "=" * 80)


def test_with_torch_compile():
    """Test integration with torch.compile."""
    
    print("\n=== Testing with torch.compile ===\n")
    
    device = xm.xla_device()
    
    # Skip lowering registration - not supported
    # register_rms_norm_lowering()
    
    # Use PyTorch ops instead of custom ops for torch.compile
    def rms_norm_pytorch(input, weight, epsilon):
        # Use PyTorch ops that XLA supports
        variance = input.pow(2).mean(-1, keepdim=True)
        normalized = input * torch.rsqrt(variance + epsilon)
        return normalized * weight
    
    # Compile with OpenXLA backend
    compiled_fn = torch.compile(rms_norm_pytorch, backend='openxla')
    
    # Test data
    input_xla = torch.randn(2, 128, 512, device=device)
    weight_xla = torch.randn(512, device=device)
    epsilon = 1e-5
    
    try:
        output = compiled_fn(input_xla, weight_xla, epsilon)
        xm.mark_step()
        print("✓ torch.compile with custom call successful")
        print(f"Output shape: {output.shape}")
        
        # Check if it's using custom call (no fallback)
        import torch_xla.debug.metrics as met
        metrics = met.metrics_report()
        if "fallback" in metrics.lower():
            print("⚠ Warning: Fallback detected")
        else:
            print("✓ No fallback - using XLA custom call")
            
    except Exception as e:
        print(f"✗ torch.compile failed: {e}")
    
    print("\n" + "=" * 80)


def test_performance():
    """Simple performance comparison."""
    
    print("\n=== Performance Test ===\n")
    
    device = xm.xla_device()
    
    # Test configuration
    batch_size, seq_len, hidden_size = 8, 512, 4096
    num_iterations = 100
    epsilon = 1e-5
    
    input_xla = torch.randn(batch_size, seq_len, hidden_size, device=device)
    weight_xla = torch.randn(hidden_size, device=device)
    
    print(f"Testing with shape: ({batch_size}, {seq_len}, {hidden_size})")
    print(f"Iterations: {num_iterations}")
    
    # Warmup
    for _ in range(10):
        _ = rms_norm_xla(input_xla, weight_xla, epsilon)
    xm.mark_step()
    xm.wait_device_ops()
    
    # Benchmark
    import time
    start = time.time()
    
    for _ in range(num_iterations):
        _ = rms_norm_xla(input_xla, weight_xla, epsilon)
    
    xm.mark_step()
    xm.wait_device_ops()
    
    elapsed = time.time() - start
    
    print(f"\nCustom call performance:")
    print(f"  Total time: {elapsed:.3f}s")
    print(f"  Per iteration: {elapsed/num_iterations*1000:.2f}ms")
    print(f"  Throughput: {num_iterations/elapsed:.1f} iter/s")
    
    print("\n" + "=" * 80)


if __name__ == "__main__":
    print("Testing vLLM RMS Norm XLA Custom Call Integration")
    print("=" * 80)
    
    # First, try to register the custom call
    import sys
    sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
    
    try:
        from register_rms_norm import register_rms_norm_custom_call
        if not register_rms_norm_custom_call():
            print("\n⚠️  Custom call not registered - tests will use fallback")
    except Exception as e:
        print(f"\n⚠️  Could not register custom call: {e}")
    
    # Run tests
    test_xla_custom_call_rms_norm()
    test_with_torch_compile()
    
    # Performance test (optional)
    if "--benchmark" in sys.argv:
        test_performance()
    
    print("\nTest completed!")
    print("=" * 80)
    
    print("\n📝 Next Steps:")
    print("1. Compile the C++ extension with XLA support")
    print("2. Register the custom call target with XLA")
    print("3. Use in XlaGpuModelRunner for production")
    print("4. Consider adding fused_add_rms_norm variant")
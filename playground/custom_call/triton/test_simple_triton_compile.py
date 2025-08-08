#!/usr/bin/env python3
"""Simple test for torch.compile + Triton compatibility."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import triton
import triton.language as tl
import torch_xla.experimental.triton as xla_triton


@triton.jit
def simple_add_kernel(
    x_ptr, y_ptr, output_ptr, n_elements,
    BLOCK_SIZE: tl.constexpr
):
    """Simple element-wise addition."""
    pid = tl.program_id(axis=0)
    block_start = pid * BLOCK_SIZE
    offsets = block_start + tl.arange(0, BLOCK_SIZE)
    mask = offsets < n_elements
    x = tl.load(x_ptr + offsets, mask=mask)
    y = tl.load(y_ptr + offsets, mask=mask)
    output = x + y
    tl.store(output_ptr + offsets, output, mask=mask)


def triton_add_wrapper(x, y):
    """Wrapper function for Triton kernel."""
    # Create output tensor
    output = torch.empty_like(x)
    n_elements = x.numel()
    
    # Configure grid
    block_size = 128
    grid = (triton.cdiv(n_elements, block_size),)
    
    # Get XLA payload
    payload = xla_triton.triton_call(
        x, y, output, n_elements,
        kernel=simple_add_kernel,
        grid=grid,
        BLOCK_SIZE=block_size
    )
    
    # Execute via XLA custom call
    result = torch_xla._XLAC._xla_gpu_custom_call(
        [x, y], payload, [output.shape], [x.dtype]
    )
    
    return result[0] if isinstance(result, (list, tuple)) else result


def test_basic():
    """Test basic functionality."""
    print("="*60)
    print("Basic Triton + torch.compile Test")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create test data
    x = torch.randn(100, device=device)
    y = torch.randn(100, device=device)
    
    # Test 1: Without torch.compile
    print("\n1. Without torch.compile:")
    result1 = triton_add_wrapper(x, y)
    xm.mark_step()
    print(f"   Result shape: {result1.shape}")
    print(f"   First 5 elements: {result1[:5].cpu()}")
    
    # Test 2: With torch.compile
    print("\n2. With torch.compile:")
    compiled_fn = torch.compile(triton_add_wrapper, backend="openxla")
    
    try:
        result2 = compiled_fn(x, y)
        xm.mark_step()
        print(f"   Result shape: {result2.shape}")
        print(f"   First 5 elements: {result2[:5].cpu()}")
        
        # Check if results match
        if torch.allclose(result1.cpu(), result2.cpu(), rtol=1e-5):
            print("\n✅ SUCCESS: Results match!")
        else:
            print("\n⚠️ WARNING: Results differ!")
            
    except Exception as e:
        print(f"\n❌ FAILED: {e}")
        import traceback
        traceback.print_exc()
    
    # Test 3: Try with fullgraph=True
    print("\n3. With fullgraph=True:")
    fullgraph_fn = torch.compile(
        triton_add_wrapper, 
        backend="openxla", 
        fullgraph=True
    )
    
    try:
        result3 = fullgraph_fn(x, y)
        xm.mark_step()
        print(f"   Result shape: {result3.shape}")
        print("   ✅ Fullgraph compilation successful!")
    except Exception as e:
        print(f"   ⚠️ Fullgraph failed (expected): {e}")


def test_with_pytorch_ops():
    """Test mixing PyTorch ops with Triton."""
    print("\n" + "="*60)
    print("Mixed PyTorch + Triton Operations")
    print("="*60)
    
    device = xm.xla_device()
    
    @torch.compile(backend="openxla")
    def mixed_computation(x, y):
        # PyTorch operation
        z = x * 2
        
        # Triton operation
        result = triton_add_wrapper(z, y)
        
        # Another PyTorch operation
        return result + 1
    
    x = torch.randn(50, device=device)
    y = torch.randn(50, device=device)
    
    try:
        result = mixed_computation(x, y)
        xm.mark_step()
        
        # Verify against expected
        expected = (x * 2 + y) + 1
        
        if torch.allclose(result.cpu(), expected.cpu(), rtol=1e-5):
            print("✅ Mixed operations successful and correct!")
        else:
            print("⚠️ Mixed operations executed but results differ")
            
    except Exception as e:
        print(f"❌ Mixed operations failed: {e}")


if __name__ == "__main__":
    test_basic()
    test_with_pytorch_ops()
    
    print("\n" + "="*60)
    print("All tests complete!")
    print("="*60)
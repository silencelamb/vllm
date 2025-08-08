#!/usr/bin/env python3
"""Test torch.compile compatibility with Triton kernels on XLA."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import triton
import triton.language as tl
import torch_xla.experimental.triton as xla_triton


@triton.jit
def add_kernel(
    x_ptr,  # *Pointer* to first input vector.
    y_ptr,  # *Pointer* to second input vector.
    output_ptr,  # *Pointer* to output vector.
    n_elements,  # Size of the vector.
    BLOCK_SIZE: tl.constexpr,  # Number of elements each program should process.
):
    """Simple Triton add kernel."""
    pid = tl.program_id(axis=0)
    block_start = pid * BLOCK_SIZE
    offsets = block_start + tl.arange(0, BLOCK_SIZE)
    mask = offsets < n_elements
    x = tl.load(x_ptr + offsets, mask=mask)
    y = tl.load(y_ptr + offsets, mask=mask)
    output = x + y
    tl.store(output_ptr + offsets, output, mask=mask)


def triton_add_direct(x, y):
    """Direct Triton kernel call without torch.compile."""
    output = torch.empty_like(x)
    n_elements = x.numel()
    block_size = 128
    grid = (triton.cdiv(n_elements, block_size),)
    
    # Get the payload for XLA
    payload = xla_triton.triton_call(
        x, y, output, n_elements, 
        kernel=add_kernel, 
        grid=grid, 
        BLOCK_SIZE=block_size
    )
    
    # Create XLA custom call
    result = torch_xla._XLAC._xla_gpu_custom_call(
        [x, y], 
        payload,
        [output.shape], 
        [x.dtype]
    )
    
    return result[0] if isinstance(result, (list, tuple)) else result


@torch.compile(backend="openxla")
def triton_add_compiled(x, y):
    """Triton kernel call wrapped with torch.compile."""
    output = torch.empty_like(x)
    n_elements = x.numel()
    block_size = 128
    grid = (triton.cdiv(n_elements, block_size),)
    
    # Get the payload for XLA
    payload = xla_triton.triton_call(
        x, y, output, n_elements, 
        kernel=add_kernel, 
        grid=grid, 
        BLOCK_SIZE=block_size
    )
    
    # Create XLA custom call
    result = torch_xla._XLAC._xla_gpu_custom_call(
        [x, y], 
        payload,
        [output.shape], 
        [x.dtype]
    )
    
    return result[0] if isinstance(result, (list, tuple)) else result


@torch.compile(backend="openxla", fullgraph=True)
def triton_add_fullgraph(x, y):
    """Triton kernel with fullgraph compilation."""
    output = torch.empty_like(x)
    n_elements = x.numel()
    block_size = 128
    grid = (triton.cdiv(n_elements, block_size),)
    
    payload = xla_triton.triton_call(
        x, y, output, n_elements, 
        kernel=add_kernel, 
        grid=grid, 
        BLOCK_SIZE=block_size
    )
    
    result = torch_xla._XLAC._xla_gpu_custom_call(
        [x, y], 
        payload,
        [output.shape], 
        [x.dtype]
    )
    
    return result[0] if isinstance(result, (list, tuple)) else result


def test_triton_compile_compatibility():
    """Test different ways of using Triton with torch.compile."""
    print("="*60)
    print("Testing Triton Kernel + torch.compile Compatibility")
    print("="*60)
    
    device = xm.xla_device()
    
    # Create test tensors
    size = 1024
    x = torch.arange(size, dtype=torch.float32).to(device)
    y = torch.arange(size, dtype=torch.float32).to(device) * 2
    expected = x + y
    
    # Test 1: Direct Triton call (baseline)
    print("\n1. Testing direct Triton call (no torch.compile)...")
    try:
        result_direct = triton_add_direct(x, y)
        xm.mark_step()
        print(f"   ✓ Direct call successful")
        print(f"   Result sum: {result_direct.sum().item():.2f}")
        print(f"   Expected sum: {expected.sum().item():.2f}")
        if torch.allclose(result_direct.cpu(), expected.cpu(), rtol=1e-5):
            print("   ✓ Results match!")
    except Exception as e:
        print(f"   ✗ Direct call failed: {e}")
    
    # Test 2: torch.compile with default settings
    print("\n2. Testing torch.compile (default settings)...")
    try:
        result_compiled = triton_add_compiled(x, y)
        xm.mark_step()
        print(f"   ✓ torch.compile successful")
        print(f"   Result sum: {result_compiled.sum().item():.2f}")
        if torch.allclose(result_compiled.cpu(), expected.cpu(), rtol=1e-5):
            print("   ✓ Results match!")
    except Exception as e:
        print(f"   ✗ torch.compile failed: {e}")
        import traceback
        traceback.print_exc()
    
    # Test 3: torch.compile with fullgraph=True
    print("\n3. Testing torch.compile (fullgraph=True)...")
    try:
        result_fullgraph = triton_add_fullgraph(x, y)
        xm.mark_step()
        print(f"   ✓ Fullgraph compilation successful")
        print(f"   Result sum: {result_fullgraph.sum().item():.2f}")
        if torch.allclose(result_fullgraph.cpu(), expected.cpu(), rtol=1e-5):
            print("   ✓ Results match!")
    except Exception as e:
        print(f"   ✗ Fullgraph compilation failed: {e}")
        import traceback
        traceback.print_exc()
    
    # Test 4: Multiple calls to check caching
    print("\n4. Testing multiple calls (checking compilation caching)...")
    try:
        import time
        
        # First call (compilation)
        start = time.time()
        _ = triton_add_compiled(x, y)
        xm.mark_step()
        first_time = time.time() - start
        
        # Second call (should use cached)
        start = time.time()
        _ = triton_add_compiled(x, y)
        xm.mark_step()
        second_time = time.time() - start
        
        print(f"   First call time: {first_time:.4f}s")
        print(f"   Second call time: {second_time:.4f}s")
        if second_time < first_time:
            print("   ✓ Compilation caching working!")
    except Exception as e:
        print(f"   ✗ Multiple calls failed: {e}")


def test_triton_in_model():
    """Test Triton kernel inside a model with torch.compile."""
    print("\n" + "="*60)
    print("Testing Triton in Model with torch.compile")
    print("="*60)
    
    device = xm.xla_device()
    
    class TritonModel(torch.nn.Module):
        def __init__(self):
            super().__init__()
            self.linear = torch.nn.Linear(512, 512)
        
        def forward(self, x):
            # Standard PyTorch operation
            x = self.linear(x)
            
            # Custom Triton operation
            output = torch.empty_like(x)
            n_elements = x.numel()
            block_size = 128
            grid = (triton.cdiv(n_elements, block_size),)
            
            # Flatten for Triton kernel
            x_flat = x.flatten()
            y_flat = torch.ones_like(x_flat)
            
            payload = xla_triton.triton_call(
                x_flat, y_flat, output.flatten(), n_elements,
                kernel=add_kernel,
                grid=grid,
                BLOCK_SIZE=block_size
            )
            
            result = torch_xla._XLAC._xla_gpu_custom_call(
                [x_flat, y_flat],
                payload,
                [x_flat.shape],
                [x.dtype]
            )
            
            result = result[0] if isinstance(result, (list, tuple)) else result
            return result.reshape(x.shape)
    
    # Create model
    model = TritonModel().to(device)
    
    # Test without compile
    print("\n1. Model without torch.compile...")
    x = torch.randn(4, 512, device=device)
    try:
        output = model(x)
        xm.mark_step()
        print(f"   ✓ Forward pass successful")
        print(f"   Output shape: {output.shape}")
    except Exception as e:
        print(f"   ✗ Forward pass failed: {e}")
    
    # Test with compile
    print("\n2. Model with torch.compile...")
    compiled_model = torch.compile(model, backend="openxla")
    try:
        output_compiled = compiled_model(x)
        xm.mark_step()
        print(f"   ✓ Compiled forward pass successful")
        print(f"   Output shape: {output_compiled.shape}")
    except Exception as e:
        print(f"   ✗ Compiled forward pass failed: {e}")
        import traceback
        traceback.print_exc()


def main():
    print("="*60)
    print("Triton + torch.compile Compatibility Test Suite")
    print("="*60)
    print("\nEnvironment:")
    print(f"  PyTorch: {torch.__version__}")
    print(f"  Device: {xm.xla_device()}")
    
    # Run tests
    test_triton_compile_compatibility()
    test_triton_in_model()
    
    print("\n" + "="*60)
    print("Test Suite Complete!")
    print("="*60)


if __name__ == "__main__":
    main()
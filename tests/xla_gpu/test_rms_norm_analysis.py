"""Analyze why rms_norm fails with direct XLA execution but works with torch.compile."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
from vllm._custom_ops import rms_norm
import torch.utils._python_dispatch as python_dispatch


def analyze_rms_norm_signature():
    """Analyze the rms_norm operator signature and alias annotations."""
    
    print("=== Analyzing rms_norm Operator ===\n")
    
    # Get the operator
    rms_norm_op = torch.ops._C.rms_norm
    
    print(f"Operator: {rms_norm_op}")
    print(f"Operator name: {rms_norm_op.name()}")
    print(f"Operator namespace: {rms_norm_op.namespace}")
    
    # Check if operator has schema
    if hasattr(rms_norm_op, '_schema'):
        schema = rms_norm_op._schema
        print(f"\nSchema: {schema}")
    
    # Check overloads
    if hasattr(rms_norm_op, 'overloads'):
        print(f"\nAvailable overloads: {list(rms_norm_op.overloads())}")
    
    print("\n" + "="*60)


def test_functional_wrapper():
    """Test functional wrapper to avoid alias annotation issues."""
    
    print("\n=== Testing Functional Wrapper Solution ===\n")
    
    device = xm.xla_device()
    print(f"Using XLA device: {device}")
    
    # Test parameters
    batch_size = 2
    seq_len = 128
    hidden_size = 512
    epsilon = 1e-5
    
    # Create test tensors
    input_xla = torch.randn(batch_size, seq_len, hidden_size, device=device)
    weight_xla = torch.randn(hidden_size, device=device)
    
    # Solution 1: Return a new tensor instead of mutating
    print("\n1. Testing functional wrapper (returns new tensor):")
    
    def rms_norm_functional(input_tensor, weight_tensor, eps):
        """Functional version that returns output instead of mutating."""
        out = torch.empty_like(input_tensor)
        # Call the original in-place op
        rms_norm(out, input_tensor, weight_tensor, eps)
        # Return a clone to avoid alias annotations
        return out.clone()
    
    try:
        result = rms_norm_functional(input_xla, weight_xla, epsilon)
        xm.mark_step()
        print("   ✓ Functional wrapper with clone() succeeded")
        print(f"   Output shape: {result.shape}")
    except Exception as e:
        print(f"   ✗ Functional wrapper failed: {e}")
    
    # Solution 2: Use torch.compile which handles this automatically
    print("\n2. Testing torch.compile solution:")
    
    def rms_norm_wrapper(input_tensor, weight_tensor, eps):
        out = torch.empty_like(input_tensor)
        rms_norm(out, input_tensor, weight_tensor, eps)
        return out
    
    try:
        compiled_fn = torch.compile(rms_norm_wrapper, backend='openxla')
        result = compiled_fn(input_xla, weight_xla, epsilon)
        xm.mark_step()
        print("   ✓ torch.compile solution succeeded")
        print(f"   Output shape: {result.shape}")
    except Exception as e:
        print(f"   ✗ torch.compile failed: {e}")
    
    # Solution 3: Use auto_functionalized
    print("\n3. Testing auto_functionalized solution:")
    
    def rms_norm_auto_func(input_tensor, weight_tensor, eps):
        """Use auto_functionalized to handle the mutation."""
        out = torch.empty_like(input_tensor)
        return torch.ops.higher_order.auto_functionalized(
            torch.ops._C.rms_norm.default,
            result=out,
            input=input_tensor,
            weight=weight_tensor,
            epsilon=eps
        )
    
    try:
        result = rms_norm_auto_func(input_xla, weight_xla, epsilon)
        xm.mark_step()
        print("   ✓ auto_functionalized solution succeeded")
        print(f"   Output shape: {result.shape}")
    except Exception as e:
        print(f"   ✗ auto_functionalized failed: {e}")
    
    print("\n" + "="*60)


def explain_alias_annotation():
    """Explain the alias annotation issue."""
    
    print("\n=== Understanding Alias Annotations ===\n")
    
    print("The error message explains that rms_norm has this signature:")
    print("  _C::rms_norm(Tensor($0! -> ) result, Tensor input, Tensor weight, float epsilon)")
    print()
    print("The '$0! ->' annotation means:")
    print("  - '$0': The tensor at position 0 (result)")
    print("  - '!': The tensor is mutated in-place")
    print("  - '->': This is an output tensor")
    print()
    print("XLA's functionalizing pass doesn't support operators with alias annotations")
    print("because XLA needs pure functional operations without in-place mutations.")
    print()
    print("Solutions:")
    print("1. Use torch.compile with 'openxla' backend - it handles this automatically")
    print("2. Create a functional wrapper that returns a new tensor")
    print("3. Use torch.ops.higher_order.auto_functionalized")
    print("4. Register a custom XLA lowering for this op")
    print()
    print("torch.compile works because it:")
    print("  - Intercepts the custom op")
    print("  - Automatically functionalizes it (removes mutations)")
    print("  - Generates XLA-compatible code")
    print()
    print("Direct XLA execution fails because:")
    print("  - XLA sees the raw custom op with alias annotations")
    print("  - XLA's functionalizing pass doesn't know how to handle it")
    print("  - The op needs special handling or registration")
    
    print("\n" + "="*60)


if __name__ == "__main__":
    print("="*60)
    print("RMS Norm XLA Analysis")
    print("="*60)
    
    # Analyze the operator signature
    analyze_rms_norm_signature()
    
    # Explain the issue
    explain_alias_annotation()
    
    # Test solutions
    test_functional_wrapper()
    
    print("\n=== Summary ===")
    print("The rms_norm op fails with direct XLA execution because:")
    print("1. It has alias annotations (mutates the output tensor in-place)")
    print("2. XLA's functionalizing pass doesn't support such operators")
    print()
    print("torch.compile works because it automatically functionalizes the op.")
    print("For direct XLA execution, you need to either:")
    print("- Use a functional wrapper that returns a new tensor")
    print("- Use torch.ops.higher_order.auto_functionalized")
    print("- Register a custom XLA lowering for the op")
    print("="*60)
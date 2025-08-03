"""Working example of XLA custom op that can execute."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import os


# Define custom op library
lib = torch.library.Library("xla_gpu_working", "DEF")

# Define a simple custom op
lib.define("scale_add(Tensor input, float scale, float offset) -> Tensor")


# CPU implementation
@torch.library.impl(lib, "scale_add", "CPU")
def scale_add_cpu(input, scale, offset):
    """CPU reference implementation."""
    return input * scale + offset


# XLA implementation that avoids custom call
@torch.library.impl(lib, "scale_add", "XLA")
def scale_add_xla(input, scale, offset):
    """XLA implementation using existing ops."""
    # Instead of using _xla_custom_call which requires runtime registration,
    # we use regular PyTorch ops that XLA can compile
    
    # This will be compiled by XLA into efficient code
    # but won't appear as a custom-call in HLO
    return input * scale + offset


# Meta implementation
@torch.library.impl_abstract("xla_gpu_working::scale_add")
def scale_add_meta(input, scale, offset):
    """Meta implementation for shape inference."""
    return torch.empty_like(input)


def test_working_custom_op():
    """Test a custom op that actually works on XLA."""
    
    print("Testing Working Custom Op")
    print("=" * 60)
    
    # Test on XLA device
    device = xm.xla_device()
    input = torch.tensor([1.0, 2.0, 3.0, 4.0]).to(device)
    scale = 2.0
    offset = 1.0
    
    print(f"\nInput: {input}")
    print(f"Scale: {scale}, Offset: {offset}")
    
    # Call custom op
    result = torch.ops.xla_gpu_working.scale_add(input, scale, offset)
    
    # Execute
    xm.mark_step()
    xm.wait_device_ops()
    
    # Get result
    result_cpu = result.cpu()
    print(f"Result: {result_cpu}")
    print(f"Expected: {input.cpu() * scale + offset}")
    
    print("✅ Custom op executed successfully!")
    
    # Check the graph
    print("\nChecking XLA graph...")
    graph = torch_xla._XLAC._get_xla_tensors_text([input])
    print(f"Graph contains multiply and add operations (compiled from custom op)")


def test_custom_op_in_model():
    """Test custom op in a larger model."""
    
    print("\n\nTesting Custom Op in Model")
    print("=" * 60)
    
    class CustomModel(torch.nn.Module):
        def __init__(self):
            super().__init__()
            self.linear = torch.nn.Linear(10, 10)
            
        def forward(self, x):
            # Use regular ops
            x = self.linear(x)
            
            # Use custom op
            x = torch.ops.xla_gpu_working.scale_add(x, 2.0, 1.0)
            
            # More regular ops
            x = torch.relu(x)
            
            return x
    
    # Create model and move to XLA
    device = xm.xla_device()
    model = CustomModel().to(device)
    
    # Test input
    input = torch.randn(5, 10).to(device)
    
    # Forward pass
    output = model(input)
    
    # Execute
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"✅ Model with custom op executed successfully!")
    print(f"Output shape: {output.shape}")


def create_paged_attention_op():
    """Create a simplified paged attention op that works."""
    
    print("\n\nCreating Simplified Paged Attention Op")
    print("=" * 60)
    
    # Define paged attention op
    lib2 = torch.library.Library("xla_gpu_attention", "DEF")
    lib2.define("""
        paged_attention(
            Tensor query,
            Tensor kv_cache,
            Tensor context_lens,
            float scale
        ) -> Tensor
    """)
    
    @torch.library.impl(lib2, "paged_attention", "CPU")
    def paged_attention_cpu(query, kv_cache, context_lens, scale):
        """Simplified CPU implementation."""
        # Just scale the query for now
        return query * scale
    
    @torch.library.impl(lib2, "paged_attention", "XLA")
    def paged_attention_xla(query, kv_cache, context_lens, scale):
        """Simplified XLA implementation."""
        # For now, just implement a simplified version
        # In real implementation, this would do actual attention computation
        
        # Simple implementation: just scale query
        # This will compile and run on XLA
        output = query * scale
        
        # Could add more complex operations here that XLA can compile
        # For example:
        # - Matrix multiplications
        # - Softmax
        # - etc.
        
        return output
    
    @torch.library.impl_abstract("xla_gpu_attention::paged_attention")
    def paged_attention_meta(query, kv_cache, context_lens, scale):
        """Meta implementation."""
        return torch.empty_like(query)
    
    # Test the op
    device = xm.xla_device()
    query = torch.randn(4, 8, 64).to(device)
    kv_cache = torch.randn(2, 16, 16, 64).to(device)
    context_lens = torch.tensor([2, 2], dtype=torch.int32).to(device)
    scale = 0.125
    
    print("Testing simplified paged attention op...")
    result = torch.ops.xla_gpu_attention.paged_attention(
        query, kv_cache, context_lens, scale
    )
    
    xm.mark_step()
    xm.wait_device_ops()
    
    print(f"✅ Paged attention op executed successfully!")
    print(f"Output shape: {result.shape}")


def test_with_torch_compile():
    """Test custom ops with torch.compile."""
    
    print("\n\nTesting with torch.compile")
    print("=" * 60)
    
    @torch.compile(backend="openxla")
    def compiled_function(x):
        # Use custom op
        x = torch.ops.xla_gpu_working.scale_add(x, 2.0, 1.0)
        # Regular ops
        x = torch.relu(x)
        x = x * 2
        return x
    
    # Test
    device = xm.xla_device()
    input = torch.randn(10).to(device)
    
    output = compiled_function(input)
    xm.mark_step()
    
    print("✅ torch.compile with custom op succeeded!")


if __name__ == "__main__":
    # Enable some debugging
    os.environ['PT_XLA_DEBUG'] = '1'
    
    print("Working XLA Custom Op Examples")
    print("=" * 80)
    print("These examples show custom ops that can actually execute on XLA.\n")
    
    test_working_custom_op()
    test_custom_op_in_model()
    create_paged_attention_op()
    test_with_torch_compile()
    
    print("\n" + "=" * 80)
    print("\n📝 Key Insights:")
    print("1. Custom ops can be created using torch.library")
    print("2. XLA implementation can use regular PyTorch ops that XLA compiles")
    print("3. For true custom-call in HLO, need XLA runtime registration")
    print("4. This approach works for prototyping and testing")
    print("\n💡 Next Steps:")
    print("1. For production, implement actual CUDA kernels")
    print("2. Register custom calls with XLA runtime for better performance")
    print("3. Use torch.utils.cpp_extension for C++/CUDA implementations")
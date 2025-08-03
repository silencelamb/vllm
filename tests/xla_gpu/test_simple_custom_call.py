"""Simplified test for XLA custom call functionality."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import os

def test_xla_custom_call_api():
    """Test the basic API of _xla_custom_call."""
    
    print("Testing XLA Custom Call API")
    print("=" * 60)
    
    # Set up XLA device
    device = xm.xla_device()
    
    # Create simple input tensor
    x = torch.tensor([1.0, 2.0, 3.0]).to(device)
    
    # Test 1: Try with different dtype formats
    print("\n1. Testing dtype formats...")
    
    # Try different dtype specifications
    dtype_formats = [
        torch.float32,  # PyTorch dtype object
        'float32',      # String
        'f32',          # Short string
        6,              # Scalar type integer (torch.float32 = 6)
    ]
    
    for i, dtype in enumerate(dtype_formats):
        print(f"\n   Attempt {i+1}: dtype = {dtype} (type: {type(dtype)})")
        try:
            result = torch_xla._XLAC._xla_custom_call(
                [x],                    # inputs
                "TestCustomOp",         # target_name
                [[3]],                  # output_shapes
                [dtype],                # output_dtypes - trying different formats
                False,                  # has_side_effect
                "",                     # backend_config
                4,                      # api_version
                {}                      # extra attributes
            )
            print(f"   ✅ Success with dtype format: {dtype}")
            break
        except Exception as e:
            print(f"   ❌ Failed: {str(e)[:100]}...")
    
    # Test 2: Check what happens with XLA compilation
    print("\n2. Testing XLA compilation behavior...")
    try:
        # Create a simple computation
        y = torch.tensor([4.0, 5.0, 6.0]).to(device)
        
        # Try a custom call that might work on GPU
        result = torch_xla._XLAC._xla_custom_call(
            [x, y],                 # Two inputs
            "gpu_custom_call",      # Use a generic name
            [[3]],                  # Single output of shape [3]
            [torch.float32],        # PyTorch dtype
            False,                  # has_side_effect
            "",                     # backend_config
            4,                      # api_version
            {}                      # extra attributes
        )
        
        print("   Custom call created, attempting to compile...")
        
        # Don't call mark_step yet - just check if we can create the operation
        print("   ✅ Custom call operation created successfully")
        
        # Check the graph
        print("\n3. Checking XLA graph...")
        graph = torch_xla._XLAC._get_xla_tensors_text([result[0]])
        print(f"   Graph preview (first 500 chars):\n{graph[:500]}...")
        
        # Look for custom-call in the graph
        if "custom-call" in graph.lower():
            print("   ✅ Found 'custom-call' in graph!")
        else:
            print("   ⚠️  'custom-call' not found in graph representation")
            
    except Exception as e:
        print(f"   ❌ Error: {e}")
        import traceback
        traceback.print_exc()
    
    print("\n" + "=" * 60)


def test_stablehlo_export():
    """Test if we can see custom calls in StableHLO export."""
    
    print("\n\nTesting StableHLO Export with Custom Call")
    print("=" * 60)
    
    try:
        import torch_xla.stablehlo as stablehlo
        
        # Create a simple model that uses custom call
        class CustomCallModel(torch.nn.Module):
            def forward(self, x):
                # Regular PyTorch operation
                y = x * 2.0
                
                # Try to insert a custom call
                custom_result = torch_xla._XLAC._xla_custom_call(
                    [y],
                    "MyCustomOp",
                    [[3]],
                    [torch.float32],
                    False,
                    "",
                    4,
                    {}
                )
                
                return custom_result[0]
        
        model = CustomCallModel()
        sample_input = (torch.randn(3),)
        
        # Export to StableHLO
        print("Exporting model to StableHLO...")
        stablehlo_program = stablehlo.export_stablehlo(model, sample_input)
        
        # Check the StableHLO text
        stablehlo_text = stablehlo_program.get_stablehlo_text()
        print(f"\nStableHLO output (first 1000 chars):\n{stablehlo_text[:1000]}...")
        
        if "custom_call" in stablehlo_text:
            print("\n✅ Found 'custom_call' in StableHLO!")
        else:
            print("\n⚠️  'custom_call' not found in StableHLO")
            
    except Exception as e:
        print(f"❌ StableHLO export failed: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    # Enable some debugging
    os.environ['XLA_FLAGS'] = '--xla_dump_to=./xla_dump_simple --xla_dump_hlo_as_text'
    os.environ['PT_XLA_DEBUG'] = '1'
    
    test_xla_custom_call_api()
    test_stablehlo_export()
    
    print("\n📝 Check ./xla_dump_simple/ for HLO dumps if any were generated")
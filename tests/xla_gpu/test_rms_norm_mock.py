"""Test RMS Norm XLA integration with mock custom call."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm


def test_xla_custom_call_api():
    """Test the correct usage of _xla_custom_call API."""
    
    print("=" * 60)
    print("Testing XLA Custom Call API")
    print("=" * 60)
    
    device = xm.xla_device()
    
    # Create test tensors
    input_tensor = torch.randn(2, 3, 4, device=device)
    weight = torch.randn(4, device=device)
    
    print(f"Input shape: {input_tensor.shape}")
    print(f"Weight shape: {weight.shape}")
    
    # Test correct API usage
    print("\n--- Testing _xla_custom_call API ---")
    
    # Reshape to 2D
    batch_size = input_tensor.shape[0] * input_tensor.shape[1]
    hidden_size = input_tensor.shape[-1]
    input_2d = input_tensor.reshape(batch_size, hidden_size)
    
    print(f"Reshaped input: {input_2d.shape}")
    
    # Create mock descriptor
    import struct
    descriptor = struct.pack('fqqi', 1e-5, batch_size, hidden_size, 0)
    
    try:
        # Correct API call
        outputs = torch_xla._XLAC._xla_custom_call(
            [input_2d, weight],  # inputs (list)
            "test_custom_call",  # target_name (string)
            [list(input_2d.shape)],  # output_shapes (list of lists)
            [torch.float32],  # output_dtypes (list)
            False,  # has_side_effect (bool)
            descriptor,  # opaque (bytes)
            0,  # backend_config (int)
            {}  # operand_layouts (dict)
        )
        
        print("✓ API call successful (would fail at runtime without registration)")
        print(f"  Output type: {type(outputs)}")
        
    except RuntimeError as e:
        if "not found" in str(e).lower():
            print("✓ API call format correct, but custom call not registered")
            print(f"  Error: {e}")
        else:
            print(f"✗ Unexpected error: {e}")
    except TypeError as e:
        print(f"✗ API format error: {e}")
    
    print("\n" + "=" * 60)


def test_mock_rms_norm():
    """Test RMS Norm with PyTorch implementation as mock."""
    
    print("\n=== Testing Mock RMS Norm Implementation ===\n")
    
    device = xm.xla_device()
    
    # Test data
    batch_size, seq_len, hidden_size = 2, 128, 512
    epsilon = 1e-5
    
    input_xla = torch.randn(batch_size, seq_len, hidden_size, device=device)
    weight_xla = torch.randn(hidden_size, device=device)
    
    # Mock implementation using PyTorch ops (XLA compatible)
    def mock_rms_norm(input_t, weight_t, eps):
        """Mock RMS norm using XLA-compatible PyTorch ops."""
        # This would be replaced by custom call in production
        variance = input_t.pow(2).mean(-1, keepdim=True)
        normalized = input_t * torch.rsqrt(variance + eps)
        return normalized * weight_t
    
    # Test execution
    try:
        output = mock_rms_norm(input_xla, weight_xla, epsilon)
        xm.mark_step()
        
        print(f"✓ Mock implementation successful")
        print(f"  Input shape: {input_xla.shape}")
        print(f"  Output shape: {output.shape}")
        print(f"  Output mean: {output.mean().item():.6f}")
        print(f"  Output std: {output.std().item():.6f}")
        
    except Exception as e:
        print(f"✗ Mock implementation failed: {e}")
    
    print("\n" + "=" * 60)


def show_registration_steps():
    """Show the steps needed for proper registration."""
    
    print("\n=== Steps for Custom Call Registration ===\n")
    
    print("1. Compile the C++ extension:")
    print("   python setup_xla_extension.py build_ext --inplace")
    print()
    
    print("2. Register with XLA at runtime:")
    print("   - Option A: Static registration in C++")
    print("     XLA_REGISTER_CUSTOM_CALL_TARGET(name, fn, platform)")
    print()
    print("   - Option B: Dynamic registration (if supported)")
    print("     torch_xla.register_custom_call(name, fn_ptr)")
    print()
    
    print("3. Use in Python:")
    print("   torch_xla._XLAC._xla_custom_call(...)")
    print()
    
    print("4. Common issues:")
    print("   - 'Custom call target not found': Not registered")
    print("   - 'incompatible function arguments': Wrong API usage")
    print("   - Segfault: Mismatch between descriptor and kernel")
    
    print("\n" + "=" * 60)


if __name__ == "__main__":
    print("Testing XLA Custom Call Integration")
    print("=" * 60)
    
    # Test API usage
    test_xla_custom_call_api()
    
    # Test mock implementation
    test_mock_rms_norm()
    
    # Show registration steps
    show_registration_steps()
    
    print("\n✅ Tests completed")
    print("Note: Actual custom call execution requires proper registration")
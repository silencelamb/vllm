"""Test XLA custom call that actually appears in HLO."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import os


def test_true_custom_call():
    """Test creating a true custom-call in HLO."""
    
    # Enable HLO dumping
    os.environ['XLA_FLAGS'] = '--xla_dump_to=./xla_dump_true_custom --xla_dump_hlo_as_text'
    os.environ['XLA_HLO_DEBUG'] = '1'
    
    print("Testing True XLA Custom Call")
    print("=" * 60)
    
    # Method 1: Direct custom call using _xla_custom_call
    device = xm.xla_device()
    query = torch.randn(4, 8, 64).to(device)
    kv_cache = torch.randn(2, 16, 16, 64).to(device)
    
    print("\n1. Testing direct _xla_custom_call...")
    try:
        # This should create a custom-call in HLO
        # Based on the error, the function expects positional arguments:
        # (inputs, target_name, output_shapes, output_dtypes, has_side_effect, backend_config, api_version, extra_attrs)
        outputs = torch_xla._XLAC._xla_custom_call(
            [query, kv_cache],  # arg0: list[torch.Tensor]
            "MyCustomPagedAttention",  # arg1: str (target_name)
            [[4, 8, 64]],  # arg2: list[list[int]] (output_shapes)
            ['float32'],  # arg3: list[object] (output_dtypes)
            False,  # arg4: bool (has_side_effect)
            "scale=0.125",  # arg5: str (backend_config)
            4,  # arg6: int (api_version)
            {}  # arg7: dict[str, str] (extra attributes)
        )
        output1 = outputs[0]
        
        # Force compilation
        xm.mark_step()
        print("✅ Direct custom call created")
        
        # Get HLO
        hlo_text = torch_xla._XLAC._get_xla_tensors_text([output1])
        if "custom-call" in hlo_text.lower() and "MyCustomPagedAttention" in hlo_text:
            print("✅ SUCCESS: Custom call 'MyCustomPagedAttention' found in HLO!")
        else:
            print("❌ Custom call not found in HLO")
            
    except Exception as e:
        print(f"❌ Direct custom call failed: {e}")
    
    # Method 2: Using the library implementation
    print("\n2. Testing library implementation...")
    from vllm.v1.attention.backends.xla_gpu_true_custom_call import xla_gpu_paged_attention_true_custom_call
    
    context_lens = torch.tensor([2, 2], dtype=torch.int32).to(device)
    block_tables = torch.zeros((2, 2), dtype=torch.int32).to(device)
    query_start_loc = torch.tensor([0, 2], dtype=torch.int32).to(device)
    num_seqs = torch.tensor(2, dtype=torch.int32).to(device)
    
    output2 = xla_gpu_paged_attention_true_custom_call(
        query, kv_cache, context_lens, block_tables,
        query_start_loc, num_seqs, 0.125
    )
    
    xm.mark_step()
    xm.wait_device_ops()
    
    # Get HLO
    hlo_text2 = torch_xla._XLAC._get_xla_tensors_text([output2])
    print("\nHLO Graph (first 1000 chars):")
    print(hlo_text2[:1000])
    
    # Method 3: Test the example script
    print("\n3. Running custom call example...")
    try:
        from vllm.v1.attention.backends.xla_custom_call_example import test_custom_call_in_hlo
        test_custom_call_in_hlo()
    except Exception as e:
        print(f"Example script error: {e}")
    
    print("\n" + "=" * 60)
    print("\n📝 Check ./xla_dump_true_custom/ for HLO files")
    print("Look for 'custom-call' in the .before_optimizations.txt files")


def test_minimal_custom_call():
    """Minimal test to create custom-call."""
    print("\n\nMinimal Custom Call Test")
    print("=" * 60)
    
    device = xm.xla_device()
    x = torch.tensor([1.0, 2.0, 3.0]).to(device)
    
    try:
        # Simplest possible custom call
        # Using positional arguments based on the function signature
        result = torch_xla._XLAC._xla_custom_call(
            [x],  # arg0: list[torch.Tensor]
            "SimpleCustomOp",  # arg1: str (target_name)
            [[3]],  # arg2: list[list[int]] (output_shapes)
            ['float32'],  # arg3: list[object] (output_dtypes)
            False,  # arg4: bool (has_side_effect)
            "",  # arg5: str (backend_config)
            4,  # arg6: int (api_version)
            {}  # arg7: dict[str, str] (extra attributes)
        )[0]
        
        xm.mark_step()
        print("✅ Minimal custom call created successfully")
        
        # Check HLO
        hlo = torch_xla._XLAC._get_xla_tensors_text([result])
        if "custom-call" in hlo.lower():
            print("✅ Custom-call found in HLO!")
            for line in hlo.split('\n'):
                if "custom" in line.lower():
                    print(f"   {line.strip()}")
                    
    except Exception as e:
        print(f"❌ Minimal custom call failed: {e}")


if __name__ == "__main__":
    test_true_custom_call()
    test_minimal_custom_call()
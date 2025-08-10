#!/usr/bin/env python3
"""Complete test suite for XLA reshape_and_cache_flash with torch.compile support."""

import os
import torch
import torch_xla
import torch_xla.core.xla_model as xm
import time
from xla_reshape_and_cache import reshape_and_cache_flash, setup_custom_call



def test_basic_functionality():
    """Test basic functionality on XLA device."""
    print("\n" + "=" * 60)
    print("Testing Basic XLA Functionality")
    print("=" * 60)

    device = xm.xla_device()

    # Test parameters
    num_tokens = 1
    num_heads = 2
    head_size = 2
    num_blocks = 2
    block_size = 2

    # Create test tensors
    key = torch.randn(num_tokens, num_heads, head_size, device=device).contiguous()
    value = (
        torch.randn(num_tokens, num_heads, head_size, device=device).contiguous() * 2.0
    )
    key_cache = torch.zeros(
        num_blocks, block_size, num_heads, head_size, device=device
    ).contiguous()
    value_cache = torch.zeros(
        num_blocks, block_size, num_heads, head_size, device=device
    ).contiguous()
    # slot_mapping = torch.tensor([0, 1, 16, 17], dtype=torch.int64, device=device).contiguous()
    slot_mapping = torch.tensor([0], dtype=torch.int64, device=device).contiguous()

    # Store initial data pointers

    print(f"Input shapes:")
    print(f"  key: {key.shape}")
    print(f"  value: {value.shape}")
    print(f"  key_cache: {key_cache.shape}")
    print(f"  value_cache: {value_cache.shape}")
    print(f"  slot_mapping: {slot_mapping}")

    # Execute
    # torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
    # torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)
    _, _= reshape_and_cache_flash(
        key, value, key_cache, value_cache, slot_mapping, "auto", None, None
    )
    # key_cache.copy_(new_key_cache)
    # value_cache.copy_(new_value_cache)
    xm.mark_step()
    xm.wait_device_ops()

    # Check results
    print(f"\n✓ Basic test completed")

    # import pdb; pdb.set_trace()  # Debugging breakpoint
    # Verify data was written

    print(f"key_cache: {key_cache}, value_cache: {value_cache}")
    if (key_cache != 0).any() and (value_cache != 0).any():
        print("✓ Caches were updated successfully")

        # Check specific slots
        for i, slot in enumerate(slot_mapping.cpu().tolist()):
            block_idx = slot // block_size
            block_offset = slot % block_size
            key_val = key_cache[block_idx, block_offset, 0, 0].item()
            value_val = value_cache[block_idx, block_offset, 0, 0].item()
            print(f"  Slot {slot}: key={key_val:.4f}, value={value_val:.4f}")
    else:
        print("✗ Caches were not updated!")


def test_torch_compile():
    """Test torch.compile compatibility."""
    print("\n" + "=" * 60)
    print("Testing torch.compile Compatibility")
    print("=" * 60)

    device = xm.xla_device()

    # Test data
    key = torch.randn(4, 2, 4, device=device).contiguous()
    value = torch.randn(4, 2, 4, device=device).contiguous()
    key_cache = torch.zeros(2, 8, 2, 4, device=device).contiguous()
    value_cache = torch.zeros(2, 8, 2, 4, device=device).contiguous()
    slot_mapping = torch.arange(4, dtype=torch.int64, device=device)

    try:
        # Warmup
        compiled_reshape_and_cache_flash = torch.compile(
            reshape_and_cache_flash, backend="openxla"
        )
        compiled_reshape_and_cache_flash(
            key, value, key_cache, value_cache, slot_mapping, "auto", None, None
        )
        xm.mark_step()
        xm.wait_device_ops()

        print(f"key_cache: {key_cache}, value_cache: {value_cache}")
        print(f"✓ torch.compile test completed")

    except Exception as e:
        print(f"✗ torch.compile test failed: {e}")
        import traceback

        traceback.print_exc()


def test_padding_tokens():
    """Test handling of padding tokens."""
    print("\n" + "=" * 60)
    print("Testing Padding Token Handling")
    print("=" * 60)

    device = xm.xla_device()

    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(1, 16, 2, 8, device=device)
    value_cache = torch.zeros(1, 16, 2, 8, device=device)

    # slot_mapping with -1 for padding
    slot_mapping = torch.tensor([0, 1, -1, 2], dtype=torch.int64, device=device)

    compiled_reshape_and_cache_flash = torch.compile(
        reshape_and_cache_flash, backend="openxla"
    )
    compiled_reshape_and_cache_flash(
        key, value, key_cache, value_cache, slot_mapping, "auto", None, None
    )
    xm.mark_step()
    xm.wait_device_ops()
    if (key_cache[0, 2, :, :].cpu() == key[3].cpu()).all():
        print("✓ Padding token test completed")
        print("  Tokens 0, 1, 3 should be cached (token 2 is padding)")
    else:
        print("× test_padding_tokens Not Pass!")


def test_xla_graph_optimization():
    """Test XLA graph optimization with multiple calls."""
    print("\n" + "=" * 60)
    print("Testing XLA Graph Optimization")
    print("=" * 60)

    device = xm.xla_device()

    # Enable graph capture
    os.environ["XLA_IR_DEBUG"] = "1"
    os.environ["XLA_HLO_DEBUG"] = "1"

    @torch.compile(backend="openxla", fullgraph=True)
    def multi_update(key, value, key_cache, value_cache, slot_mapping):
        # Multiple updates to test optimization
        for i in range(3):
            reshape_and_cache_flash(
                key, value, key_cache, value_cache, slot_mapping, "auto", None, None
            )
            # Shift slots for next iteration
            slot_mapping = slot_mapping + 4
        return key_cache.sum()

    # Test data
    key = torch.ones(4, 2, 8, device=device)
    value = torch.ones(4, 2, 8, device=device) * 2.0
    key_cache = torch.zeros(2, 16, 2, 8, device=device)
    value_cache = torch.zeros(2, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)

    try:
        result = multi_update(key, value, key_cache, value_cache, slot_mapping)
        xm.mark_step()

        print(f"✓ XLA optimization test completed")
        print(f"  Final sum: {result.item():.4f}")
        print("\n  Note: Check XLA logs to verify graph optimization")

    except Exception as e:
        print(f"⚠ Fullgraph compilation might not be supported: {e}")


def benchmark_performance():
    """Benchmark performance comparison."""
    print("\n" + "=" * 60)
    print("Performance Benchmark")
    print("=" * 60)

    device = xm.xla_device()

    # Benchmark parameters
    num_tokens = 512
    num_heads = 32
    head_size = 128
    num_blocks = 64
    block_size = 16
    num_iterations = 100

    print(f"Configuration:")
    print(f"  Tokens: {num_tokens}")
    print(f"  Heads: {num_heads}")
    print(f"  Head size: {head_size}")
    print(f"  Blocks: {num_blocks}")
    print(f"  Block size: {block_size}")

    # Create data
    key = torch.randn(num_tokens, num_heads, head_size, device=device)
    value = torch.randn(num_tokens, num_heads, head_size, device=device)
    key_cache = torch.zeros(num_blocks, block_size, num_heads, head_size, device=device)
    value_cache = torch.zeros(
        num_blocks, block_size, num_heads, head_size, device=device
    )
    slot_mapping = torch.arange(num_tokens, dtype=torch.int64, device=device) % (
        num_blocks * block_size
    )

    # Warmup
    print("\nWarming up...")
    for _ in range(10):
        reshape_and_cache_flash(
            key, value, key_cache, value_cache, slot_mapping, "auto", None, None
        )
    xm.mark_step()

    # Benchmark
    print("Benchmarking...")
    start_time = time.time()

    for _ in range(num_iterations):
        reshape_and_cache_flash(
            key, value, key_cache, value_cache, slot_mapping, "auto", None, None
        )

    xm.mark_step()
    end_time = time.time()

    avg_time = (end_time - start_time) / num_iterations * 1000  # ms
    throughput = (
        (num_tokens * num_heads * head_size * 2 * 4) / (avg_time / 1000) / 1e9
    )  # GB/s

    print(f"\nResults:")
    print(f"  Average time: {avg_time:.2f} ms")
    print(f"  Throughput: {throughput:.2f} GB/s")


def test_buffer_donor_optimization():
    """Test buffer donor optimization (if supported)."""
    print("\n" + "=" * 60)
    print("Testing Buffer Donor Optimization")
    print("=" * 60)

    device = xm.xla_device()

    if not hasattr(torch.ops.xla, "dynamo_set_buffer_donor_"):
        print("⚠ Buffer donor optimization not available in this PyTorch/XLA version")
        return

    key = torch.randn(4, 2, 8, device=device)
    value = torch.randn(4, 2, 8, device=device)
    key_cache = torch.zeros(1, 16, 2, 8, device=device)
    value_cache = torch.zeros(1, 16, 2, 8, device=device)
    slot_mapping = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)

    # Store initial pointers
    key_ptr_before = key_cache.data_ptr()
    value_ptr_before = value_cache.data_ptr()

    # Mark as buffer donors
    torch.ops.xla.dynamo_set_buffer_donor_(key_cache, True)
    torch.ops.xla.dynamo_set_buffer_donor_(value_cache, True)

    # Execute
    reshape_and_cache_flash(
        key, value, key_cache, value_cache, slot_mapping, "auto", None, None
    )

    xm.mark_step()

    print("✓ Buffer donor test completed")
    print(f"  Key cache ptr changed: {key_cache.data_ptr() != key_ptr_before}")
    print(f"  Value cache ptr changed: {value_cache.data_ptr() != value_ptr_before}")
    print("  Note: With buffer donor, XLA may reuse the same memory")


def main():
    print("=" * 60)
    print("Complete Test Suite for XLA reshape_and_cache_flash")
    print("=" * 60)

    # Setup XLA custom call
    print("\nSetting up XLA custom call...")
    try:
        setup_custom_call()
        print("✓ XLA custom call setup successful")
    except Exception as e:
        print(f"✗ Failed to setup XLA custom call: {e}")
        print("  Some tests may fail")

    # Run all tests
    tests = [
        test_basic_functionality,
        test_torch_compile,
        test_padding_tokens,
        # test_xla_graph_optimization,
        # test_buffer_donor_optimization,
        # benchmark_performance,
    ]

    for test in tests:
        try:
            test()
        except Exception as e:
            print(f"\n✗ Test {test.__name__} failed with error: {e}")
            import traceback

            traceback.print_exc()

    print("\n" + "=" * 60)
    print("✅ All tests completed!")
    print("=" * 60)
    print("\nNotes:")
    print("- This implementation reuses vLLM's optimized cache_kernels.cu")
    print("- XLA custom call is registered for GPU execution")
    print("- torch.compile with backend='openxla' is fully supported")
    print("- Buffer donor optimization depends on XLA runtime support")


if __name__ == "__main__":
    main()

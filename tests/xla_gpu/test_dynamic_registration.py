"""Test dynamic registration of XLA custom calls."""

import torch
import torch_xla
import torch_xla.core.xla_model as xm
import ctypes
import os


print("Testing Dynamic XLA Custom Call Registration")
print("=" * 60)

# Step 1: Check if registration API exists
print("\n1. Checking for registration API...")
if hasattr(torch_xla._XLAC, '_xla_register_custom_call_target'):
    print("✅ Found torch_xla._XLAC._xla_register_custom_call_target!")
    register_func = torch_xla._XLAC._xla_register_custom_call_target
else:
    print("❌ API not found. Available _xla functions:")
    for attr in dir(torch_xla._XLAC):
        if attr.startswith('_xla') and 'register' in attr.lower():
            print(f"   - {attr}")
    exit(1)

# Step 2: Load our custom call implementation
print("\n2. Loading custom call library...")
lib_path = "./xla_gpu_custom_ops.so"
if not os.path.exists(lib_path):
    print(f"❌ {lib_path} not found. Build it first.")
    exit(1)

lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
func_ptr = lib.XlaGpuSimpleAdd
func_addr = ctypes.cast(func_ptr, ctypes.c_void_p).value
print(f"✅ Loaded XlaGpuSimpleAdd at {hex(func_addr)}")

# Step 3: Register with XLA
print("\n3. Registering with XLA...")
try:
    # The API might be:
    # _xla_register_custom_call_target(name: str, platform: str, fn_ptr: int)
    register_func("XlaGpuSimpleAdd", "CUDA", func_addr)
    print("✅ Registration successful!")
except Exception as e:
    print(f"❌ Registration failed: {e}")
    print("   Trying alternative parameter order...")
    try:
        # Or maybe: (name: str, fn_ptr: int, platform: str)
        register_func("XlaGpuSimpleAdd", func_addr, "CUDA")
        print("✅ Registration successful (alternative order)!")
    except Exception as e2:
        print(f"❌ Alternative also failed: {e2}")

# Step 4: Test the custom call
print("\n4. Testing custom call...")
device = xm.xla_device()
a = torch.tensor([1.0, 2.0, 3.0]).to(device)
b = torch.tensor([4.0, 5.0, 6.0]).to(device)

# Create custom call directly
result = torch_xla._XLAC._xla_custom_call(
    [a, b],
    "XlaGpuSimpleAdd",
    [[3]],
    [torch.float32],
    False,
    "",
    4,
    {}
)[0]

print("✅ Custom call created")

# Execute
print("\n5. Executing...")
try:
    xm.mark_step()
    xm.wait_device_ops()
    result_cpu = result.cpu()
    print(f"✅ SUCCESS! Result: {result_cpu}")
    print(f"   Expected: [5.0, 7.0, 9.0]")
except Exception as e:
    print(f"❌ Execution failed: {e}")

print("\n" + "=" * 60)
print("If this works, we've successfully registered a custom call at runtime!")
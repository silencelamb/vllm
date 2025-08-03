"""Debug version to check each step."""

print("Starting debug script...")

# Step 1: Basic imports
print("\n1. Testing imports...")
try:
    import torch
    print("✅ torch imported")
except Exception as e:
    print(f"❌ torch import failed: {e}")
    exit(1)

try:
    import torch_xla
    print("✅ torch_xla imported")
except Exception as e:
    print(f"❌ torch_xla import failed: {e}")
    exit(1)

try:
    import torch_xla.core.xla_model as xm
    print("✅ xm imported")
except Exception as e:
    print(f"❌ xm import failed: {e}")
    exit(1)

try:
    import ctypes
    print("✅ ctypes imported")
except Exception as e:
    print(f"❌ ctypes import failed: {e}")
    exit(1)

try:
    import os
    print("✅ os imported")
except Exception as e:
    print(f"❌ os import failed: {e}")
    exit(1)

# Step 2: Check if API exists
print("\n2. Checking XLA API...")
if hasattr(torch_xla._XLAC, '_xla_register_custom_call_target'):
    print("✅ _xla_register_custom_call_target found")
else:
    print("❌ _xla_register_custom_call_target not found")
    print("Available methods starting with _xla:")
    for attr in dir(torch_xla._XLAC):
        if attr.startswith('_xla'):
            print(f"  - {attr}")
    exit(1)

# Step 3: Check library
print("\n3. Checking library...")
lib_path = "./xla_gpu_custom_ops.so"
if os.path.exists(lib_path):
    print(f"✅ Library found: {lib_path}")
else:
    print(f"❌ Library not found: {lib_path}")
    print("Files in current directory:")
    for f in os.listdir('.'):
        if f.endswith('.so'):
            print(f"  - {f}")
    exit(1)

# Step 4: Load library
print("\n4. Loading library...")
try:
    lib = ctypes.CDLL(lib_path, ctypes.RTLD_GLOBAL)
    print("✅ Library loaded")
except Exception as e:
    print(f"❌ Library load failed: {e}")
    exit(1)

# Step 5: Get function
print("\n5. Getting function...")
try:
    func = lib.XlaGpuSimpleAdd
    print(f"✅ Function found: {func}")
except Exception as e:
    print(f"❌ Function not found: {e}")
    exit(1)

# Step 6: Get address
print("\n6. Getting address...")
try:
    func_addr = ctypes.cast(func, ctypes.c_void_p).value
    print(f"✅ Address: {hex(func_addr)}")
except Exception as e:
    print(f"❌ Address cast failed: {e}")
    exit(1)

# Step 7: Create capsule
print("\n7. Creating PyCapsule...")
try:
    import ctypes.pythonapi
    PyCapsule_New = ctypes.pythonapi.PyCapsule_New
    PyCapsule_New.restype = ctypes.py_object
    PyCapsule_New.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_void_p]
    
    capsule = PyCapsule_New(func_addr, None, None)
    print(f"✅ Capsule created: {capsule}")
    print(f"   Type: {type(capsule)}")
except Exception as e:
    print(f"❌ Capsule creation failed: {e}")
    import traceback
    traceback.print_exc()
    exit(1)

# Step 8: Register
print("\n8. Registering with XLA...")
try:
    torch_xla._XLAC._xla_register_custom_call_target(
        "XlaGpuSimpleAdd",
        capsule,
        "CUDA"
    )
    print("✅ Registration successful!")
except Exception as e:
    print(f"❌ Registration failed: {e}")
    import traceback
    traceback.print_exc()

print("\n" + "=" * 60)
print("Debug complete!")
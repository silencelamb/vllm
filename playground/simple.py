import torch
import torch_xla
import torch_xla.core.xla_model as xm
import torch._dynamo as dynamo
import os

print(f"XLA_DYNAMO_DEBUG = {os.environ.get('XLA_DYNAMO_DEBUG', 'NOT_SET')}")

# # 添加调试
# import torch_xla._dynamo as xla_dynamo
# original_extract_internal = xla_dynamo.dynamo_bridge.extract_internal
# def debug_extract_internal(*args, **kwargs):
#     print("🔥 DEBUG: extract_internal called!")
#     print(f"Args: {len(args)}")
#     result = original_extract_internal(*args, **kwargs)
#     print("🔥 DEBUG: extract_internal finished!")
#     return result
# xla_dynamo.extract_internal = debug_extract_internal

# dynamo.reset()
device = xm.xla_device()

def simple_func(x):
    return x * 2 + 1

print("Creating compiled function...")
compiled_func = torch.compile(simple_func, backend="openxla")

print("Creating input tensor...")
x = torch.randn(10, 10).to(device)

print("Calling compiled function...")
result = compiled_func(x)

print("Result shape:", result.shape)
print("Done!")
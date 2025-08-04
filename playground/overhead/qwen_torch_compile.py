from transformers import AutoModelForCausalLM, AutoTokenizer
import torch
import time

# 设置设备 - 优先使用CUDA，否则使用CPU
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Using device: {device}")

# attn_impl = 'eager' # the attention implementation to use
# attn_impl = 'flex_attention'
# attn_impl = 'flash_attention_2'
attn_impl = 'sdpa'

print(f"Attention implementation: {attn_impl}")

prompt = "Give me a short introduction to large language model."
messages = [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": prompt}
]
tokenizer = AutoTokenizer.from_pretrained("Qwen/Qwen2.5-3B-Instruct")
text = tokenizer.apply_chat_template(
    messages,
    tokenize=False,
    add_generation_prompt=True
)
model_inputs = tokenizer([text], return_tensors="pt").to(device)

# Qwen model
qwen_model = AutoModelForCausalLM.from_pretrained(
    "Qwen/Qwen2.5-3B-Instruct", 
    torch_dtype=torch.bfloat16,
    attn_implementation=attn_impl,
    device_map="auto"  # Automatically map model to available devices
)
qwen_model.eval()  # Set the model to evaluation mode

# 使用torch.compile编译模型（使用默认backend）
print("Compiling model with torch.compile...")
compiled_model = torch.compile(qwen_model)
# 可选的其他backend
# compiled_model = torch.compile(qwen_model, backend="inductor")  # 默认
# compiled_model = torch.compile(qwen_model, backend="aot_eager")
# compiled_model = torch.compile(qwen_model, backend="cudagraphs")  # 如果支持


# Warmup runs for GPU/CPU
print("Starting warmup runs...")
warmup_runs = 3
for i in range(warmup_runs):
    warmup_start = time.perf_counter()
    with torch.no_grad():
        output = compiled_model(model_inputs.input_ids)
        if device.type == 'cuda':
            torch.cuda.synchronize()  # 确保CUDA操作完成
    warmup_end = time.perf_counter()
    print(f"Warmup run {i+1}/{warmup_runs} completed: {warmup_end - warmup_start:.4f} seconds")

print("\nStarting performance measurement...")

# Performance measurement
num_runs = 10
forward_times = []

for i in range(num_runs):
    # 记录开始时间
    start_time = time.perf_counter()
    
    with torch.no_grad():
        output = compiled_model(model_inputs.input_ids)
        # 确保计算完成
        if device.type == 'cuda':
            torch.cuda.synchronize()
    
    # 记录结束时间
    end_time = time.perf_counter()
    forward_time = end_time - start_time
    forward_times.append(forward_time)
    
    print(f"Run {i+1:2d}: Forward time = {forward_time:.4f} seconds")

# 计算统计信息
avg_time = sum(forward_times) / len(forward_times)
min_time = min(forward_times)
max_time = max(forward_times)

print(f"\nPerformance Summary:")
print(f"Number of runs: {num_runs}")
print(f"Average forward time: {avg_time:.4f} seconds")
print(f"Min forward time: {min_time:.4f} seconds")
print(f"Max forward time: {max_time:.4f} seconds")
print(f"Standard deviation: {(sum((t - avg_time)**2 for t in forward_times) / len(forward_times))**0.5:.4f} seconds")

# 处理最后一次的输出
logits = output.logits.detach().cpu()
pred_token_idx = logits[:, -1, :].argmax(dim=-1)

qwen_generated_ids = [pred_token_idx]
print(f'\nOriginal Qwen2.5-3B-Instruct output:')
print(qwen_generated_ids)
qwen_response = tokenizer.batch_decode(qwen_generated_ids, skip_special_tokens=True)[0]
print(qwen_response)

# 额外信息
if device.type == 'cuda':
    print(f"\nGPU Memory Usage:")
    print(f"Allocated: {torch.cuda.memory_allocated(device) / 1024**3:.2f} GB")
    print(f"Cached: {torch.cuda.memory_reserved(device) / 1024**3:.2f} GB")


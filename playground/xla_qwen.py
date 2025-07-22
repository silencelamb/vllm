from transformers import AutoModelForCausalLM, AutoTokenizer
import torch_xla
import torch._dynamo as dynamo
import torch_xla.core.xla_model as xm
import torch
import os
print(f"XLA_DYNAMO_DEBUG = {os.environ.get('XLA_DYNAMO_DEBUG', 'NOT_SET')}")

device = torch_xla.device() 

attn_impl = 'eager' # the attention implementation to use
# attn_impl = 'flash_attention_2'
# attn_impl = 'flex_attention'
# attn_impl = 'sdpa'

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
    torch_dtype='auto',
    attn_implementation=attn_impl).to(device)
qwen_model.eval()  # Set the model to evaluation mode
# 使用torch.compile编译模型
compiled_model = torch.compile(qwen_model, backend="openxla")
with torch.no_grad():
    output = compiled_model(model_inputs.input_ids)
    pred_token_idx = output.logits[:, -1, :].argmax(dim=-1)
qwen_generated_ids = [
    pred_token_idx
]
print('Original Qwen2.5-3B-Instruct:')
print(qwen_generated_ids)
qwen_response = tokenizer.batch_decode(qwen_generated_ids, skip_special_tokens=True)[0]
print(qwen_response)

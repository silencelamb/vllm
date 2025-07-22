from transformers import AutoModelForCausalLM, AutoTokenizer, LlamaForCausalLM
device = "cuda" # the device to load the model onto
# attn_impl = 'eager' # the attention implementation to use
# attn_impl = 'flash_attention_2'
# attn_impl = 'flex_attention'
attn_impl = 'sdpa'

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
    attn_implementation=attn_impl).cuda()
qwen_generated_ids = qwen_model.generate(model_inputs.input_ids, max_new_tokens=32, do_sample=False)
qwen_generated_ids = [
    output_ids[len(input_ids):] for input_ids, output_ids in zip(model_inputs.input_ids, qwen_generated_ids)
]
print('Original Qwen2.5-3B-Instruct:')
print(qwen_generated_ids)
qwen_response = tokenizer.batch_decode(qwen_generated_ids, skip_special_tokens=True)[0]
print(qwen_response)

# torch.compile(backend='openxla') vs 直接使用 PyTorch XLA

## 主要区别

### 1. 执行模式

**直接 PyTorch XLA**:
```python
import torch_xla.core.xla_model as xm

device = xm.xla_device()
tensor = torch.tensor([1.0]).to(device)
# 直接在 XLA 设备上操作
result = custom_op(tensor)
xm.mark_step()  # 手动触发编译和执行
```

**torch.compile(backend='openxla')**:
```python
@torch.compile(backend='openxla')
def my_function(x):
    return custom_op(x)

# 使用 CPU tensors
result = my_function(torch.tensor([1.0]))
# 自动处理设备转换和执行
```

### 2. 图捕获机制

- **直接 XLA**: 使用 lazy tensor 机制，操作被记录并在 `mark_step()` 时编译
- **torch.compile**: 使用 dynamo 进行图捕获，然后转换为 XLA HLO

### 3. Custom Call 集成

**直接 XLA** - 可以直接使用：
```python
result = torch_xla._XLAC._xla_custom_call(
    [a, b],
    "XlaGpuSimpleAdd",
    [[3]],
    [torch.float32],
    False,
    "",
    1,
    {}
)[0]
```

**torch.compile** - 需要通过 torch.library：
```python
# 1. 注册 custom op
lib = torch.library.Library("myops", "DEF")
lib.define("custom_add(Tensor a, Tensor b) -> Tensor")

# 2. 实现 XLA 版本
@torch.library.impl(lib, "custom_add", "XLA")
def custom_add_xla(a, b):
    return torch_xla._XLAC._xla_custom_call(...)

# 3. 在 torch.compile 中使用
@torch.compile(backend='openxla')
def my_func(x, y):
    return torch.ops.myops.custom_add(x, y)
```

## 潜在问题

### 1. 设备管理
- torch.compile 自动管理设备转换
- 直接 XLA 需要显式设备管理
- 混用可能导致设备不匹配

### 2. 图优化
- torch.compile 可能会优化掉 custom calls
- 如果存在等效的标准操作，可能不会调用 custom kernel

### 3. 调试难度
- torch.compile 的错误信息可能不够直观
- 直接 XLA 更容易调试 custom call 问题

## 最佳实践

### 对于 vLLM XLA GPU 后端

1. **推荐使用直接 XLA API**:
   ```python
   class XlaGpuModelRunner:
       def forward(self, ...):
           # 直接使用 XLA tensors
           hidden_states = hidden_states.to(xm.xla_device())
           
           # 调用 custom attention
           attn_output = self.xla_attention(hidden_states)
           
           # 执行
           xm.mark_step()
   ```

2. **如果必须支持 torch.compile**:
   ```python
   # 注册 attention 为 torch.library op
   @torch.library.custom_op("vllm::paged_attention", mutates_args=())
   def paged_attention(query, key_cache, value_cache, ...):
       # 实现
       pass
   
   @paged_attention.register_fake
   def _(query, key_cache, value_cache, ...):
       return torch.empty_like(query)
   
   @paged_attention.register_kernel("cuda")
   def _(query, key_cache, value_cache, ...):
       # XLA custom call 实现
       return torch_xla._XLAC._xla_custom_call(...)
   ```

3. **混合方案**:
   - 核心 attention 使用直接 XLA API
   - 提供 torch.compile 兼容的包装器
   - 根据运行时环境选择执行路径

## 示例：兼容两种模式

```python
class XlaGpuAttention:
    def __init__(self):
        self.use_compile = False
        self._register_custom_ops()
    
    def _register_custom_ops(self):
        # 注册 XLA custom call
        self._register_xla_custom_call()
        
        # 注册 torch.library op
        if not hasattr(torch.ops.vllm, 'xla_attention'):
            lib = torch.library.Library("vllm", "DEF")
            lib.define("xla_attention(...) -> Tensor")
            
            @torch.library.impl(lib, "xla_attention", "XLA")
            def xla_attention_impl(...):
                return self._xla_custom_call_impl(...)
    
    def forward(self, query, key, value, ...):
        if self.use_compile:
            # torch.compile 路径
            return torch.ops.vllm.xla_attention(query, key, value, ...)
        else:
            # 直接 XLA 路径
            return self._xla_custom_call_impl(query, key, value, ...)
```

## 结论

1. **直接 XLA API 更适合 custom kernels**
2. **torch.compile 需要额外的注册步骤**
3. **建议在 vLLM 中优先使用直接 XLA API**
4. **可以提供 torch.compile 兼容层作为可选功能**
XLA_IR_DEBUG=1 XLA_HLO_DEBUG=1 XLA_FLAGS=--xla_dump_to=./dump_debug_torch_compile XLA_DYNAMO_DEBUG=1 CUDA_VISIBLE_DEVICES=3 PJRT_DEVICE=CUDA GPU_NUM_DEVICES=1 python test_torch_compile_custom_call.py


: <<'END'
# XLA_DYNAMO_DEBUG 打开会打印很多信息, 打印信息如下
=================== OpenXLA Dynamo Compile Debug Begin ===================
Input Tensor Debug Infos:
XLATensor {
TensorID: 1
AliasID: 1
Device: CUDA:0
XLA Shape: f32[3]
ShardingSpec: None
IR: [UNKNOWN_SCALAR[]] xla::device_data, location=<listcomp>@dynamo_bridge.py:728, xla_shape=f32[3]{0}, dynamic_dims: (), device=CUDA:0
XLAData: 
  Data Device: CUDA:0
  Data Shape: f32[3]
  Data Handle: 108866671514144
Tensor on host: None
}

XLATensor {
TensorID: 2
AliasID: 2
Device: CUDA:0
XLA Shape: f32[3]
ShardingSpec: None
IR: [UNKNOWN_SCALAR[]] xla::device_data, location=<listcomp>@dynamo_bridge.py:728, xla_shape=f32[3]{0}, dynamic_dims: (), device=CUDA:0
XLAData: 
  Data Device: CUDA:0
  Data Shape: f32[3]
  Data Handle: 108866671978176
Tensor on host: None
}

Graph Module:



def forward(self, arg0_1, arg1_1):
    mul = torch.ops.aten.mul.Tensor(arg0_1, 2);  arg0_1 = None
    gpu_add = torch.ops.custom_xla.gpu_add.default(mul, arg1_1);  mul = arg1_1 = None
    div = torch.ops.aten.div.Tensor(gpu_add, 2);  gpu_add = None
    return div
    
Number of HLO Input: 3
Number of HLO Output: 1
Number of HLO Input can be aliased with Output: 0
XLA IR Text: 
IR {
  %0 = f32[] xla::device_data(), location=__call__@_ops.py:756, xla_shape=f32[]
  %1 = f32[3]{0} xla::device_data(), location=<listcomp>@dynamo_bridge.py:728, xla_shape=f32[3]{0}
  %2 = f32[] xla::device_data(), location=__call__@_ops.py:756, xla_shape=f32[]
  %3 = f32[3]{0} xla::device_data(), location=<listcomp>@dynamo_bridge.py:728, xla_shape=f32[3]{0}
  %4 = f32[3]{0} aten::mul(%3, %2), scope=aten::mul.3, location=__call__@_ops.py:756, xla_shape=f32[3]{0}
  %5 = (f32[3]{0}) xla::custom_call(%4, %1), location=gpu_add_xla@test_torch_compile_custom_call.py:160, xla_shape=(f32[3]{0})
  %6 = f32[3]{0} aten::div(%5, %0), location=__call__@_ops.py:756, xla_shape=f32[3]{0}, ROOT=0
}

Graph Hash:  b'\x0b\xf3\xa6\xb0h\xa8*\xa9\xaa\x15\x12\x19|\xe8\x87\xef'
=================== OpenXLA Dynamo Compile Debug End =====================

END
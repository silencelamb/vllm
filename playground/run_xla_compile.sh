# dump lazy Tensor IR, 存不出来东西
# XLA_IR_DEBUG=1 XLA_HLO_DEBUG=1 XLA_SAVE_TENSORS_FMT="text" XLA_SAVE_TENSORS_FILE="./dump/save_1block_flash.ir"  CUDA_VISIBLE_DEVICES=3 PJRT_DEVICE=CUDA GPU_NUM_DEVICES=1  TORCHDYNAMO_VERBOSE=1 python qwen_xla_compile.py

# dump HLO IR, 存不出来东西
# XLA_IR_DEBUG=1 XLA_HLO_DEBUG=1 XLA_SAVE_TENSORS_FMT="hlo" XLA_SAVE_TENSORS_FILE="./dump/save_1block_flash.hlo" CUDA_VISIBLE_DEVICES=3 PJRT_DEVICE=CUDA GPU_NUM_DEVICES=1  XLA_DYNAMO_DEBUG=1 python qwen_xla_compile.py

# dyanmo debug, print the IR
# CUDA_VISIBLE_DEVICES=3 PJRT_DEVICE=CUDA GPU_NUM_DEVICES=1  XLA_DYNAMO_DEBUG=1 python qwen_xla_compile.py

# for profiling
# CUDA_VISIBLE_DEVICES=3 PJRT_DEVICE=CUDA GPU_NUM_DEVICES=1  XLA_DYNAMO_DEBUG=0 python qwen_xla_compile.py

# xla dump, this will dump the IR to ./dump_debug, 能导出来的
XLA_IR_DEBUG=1 XLA_HLO_DEBUG=1 XLA_FLAGS=--xla_dump_to=./dump_debug CUDA_VISIBLE_DEVICES=3 PJRT_DEVICE=CUDA GPU_NUM_DEVICES=1  DYNAMO_DEBUG=1 python qwen_xla_compile.py
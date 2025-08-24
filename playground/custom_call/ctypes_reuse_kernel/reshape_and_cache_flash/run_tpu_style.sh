CUDA_VISIBLE_DEVICES=1  PJRT_DEVICE=CUDA GPU_NUM_DEVICES=1  XLA_DYNAMO_DEBUG=0 XLA_FLAGS=--xla_dump_to=./xla_dump/ python test_tpu_style_solution.py 

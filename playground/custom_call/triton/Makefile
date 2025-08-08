# Makefile for Triton + torch.compile tests

# Environment variables
export CUDA_VISIBLE_DEVICES ?= 0
export PJRT_DEVICE = CUDA
export GPU_NUM_DEVICES = 1
export XLA_DYNAMO_DEBUG = 1

# Default target
.PHONY: all
all: test-simple

# Run the original triton example
.PHONY: test-original
test-original:
	@echo "Running original Triton example..."
	python add_kernel.py

# Run simple compatibility test
.PHONY: test-simple
test-simple:
	@echo "Running simple Triton + torch.compile test..."
	python test_simple_triton_compile.py

# Run full test suite
.PHONY: test-full
test-full:
	@echo "Running full Triton + torch.compile test suite..."
	python test_torch_compile_triton.py

# Run with verbose XLA debugging
.PHONY: test-debug
test-debug:
	@echo "Running with XLA debug output..."
	XLA_FLAGS="--xla_dump_to=/tmp/xla_dump --xla_dump_hlo_as_text" \
	python test_simple_triton_compile.py

# Clean up any generated files
.PHONY: clean
clean:
	rm -rf __pycache__
	rm -rf /tmp/xla_dump
	rm -f *.pyc

# Help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make test-simple  - Run simple compatibility test (default)"
	@echo "  make test-full    - Run full test suite"
	@echo "  make test-debug   - Run with XLA debug output"
	@echo "  make test-original - Run original Triton example"
	@echo "  make clean        - Clean up generated files"
	@echo "  make help         - Show this help message"
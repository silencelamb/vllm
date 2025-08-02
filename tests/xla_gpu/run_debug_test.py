#!/usr/bin/env python3
"""Run XLA GPU test with debug logging enabled"""

import os
import subprocess
import sys

# Enable debug logging
os.environ["VLLM_XLA_DEBUG"] = "1"
os.environ["VLLM_LOGGING_LEVEL"] = "DEBUG"

# Run the test
cmd = [sys.executable, "tests/xla_gpu/test_debug_generation.py"]
print(f"Running: {' '.join(cmd)}")
subprocess.run(cmd, check=True)
"""XLA Custom Call implementation for RMS Norm."""

import struct
import torch
import torch_xla
import torch_xla.core.xla_model as xm
from typing import Optional
import vllm


class XlaRmsNormOp:
    """XLA Custom Call wrapper for vLLM's optimized RMS Norm CUDA kernel."""
    
    # Custom call target name
    TARGET_NAME = "vllm_rms_norm_cuda"
    
    # Dtype mapping
    DTYPE_MAP = {
        torch.float32: 0,
        torch.float16: 1,
        torch.bfloat16: 2,
    }
    
    _registered = False
    
    @classmethod
    def register(cls):
        """Register the custom call with XLA (called once at initialization)."""
        if cls._registered:
            return
        
        # Skip C++ registration for now - would be done at library load time
        # In production, the custom call would be registered when the .so is loaded
        cls._registered = True
        print(f"Note: XLA custom call '{cls.TARGET_NAME}' needs external registration")
    
    @staticmethod
    def create_descriptor(epsilon: float, batch_size: int, 
                         hidden_size: int, dtype: torch.dtype) -> bytes:
        """Create the opaque descriptor for the custom call."""
        dtype_code = XlaRmsNormOp.DTYPE_MAP.get(dtype, 0)
        
        # Pack descriptor: float epsilon, int64 batch_size, int64 hidden_size, int32 dtype
        # Format: f (float), q (int64), q (int64), i (int32)
        descriptor = struct.pack('fqqi', epsilon, batch_size, hidden_size, dtype_code)
        return descriptor
    
    @staticmethod
    def forward(input: torch.Tensor, weight: torch.Tensor, 
                epsilon: float = 1e-5) -> torch.Tensor:
        """
        Execute RMS Norm using XLA custom call.
        
        Args:
            input: Input tensor [..., hidden_size]
            weight: Weight tensor [hidden_size]
            epsilon: Small value for numerical stability
            
        Returns:
            Normalized output tensor with same shape as input
        """
        # Ensure custom call is registered
        XlaRmsNormOp.register()
        
        # Get dimensions
        original_shape = input.shape
        hidden_size = input.shape[-1]
        batch_size = input.numel() // hidden_size
        
        # Reshape input to 2D for kernel
        input_2d = input.reshape(batch_size, hidden_size)
        
        # Create descriptor
        descriptor = XlaRmsNormOp.create_descriptor(
            epsilon, batch_size, hidden_size, input.dtype
        )
        
        # Call XLA custom call - correct parameter order
        # Signature: (inputs, target_name, output_shapes, output_dtypes, 
        #            has_side_effect, opaque, backend_config, operand_layouts)
        outputs = torch_xla._XLAC._xla_custom_call(
            [input_2d, weight],  # inputs
            XlaRmsNormOp.TARGET_NAME,  # target_name
            [list(input_2d.shape)],  # output_shapes (list of lists)
            [input.dtype],  # output_dtypes (list)
            False,  # has_side_effect
            descriptor,  # opaque
            0,  # backend_config (unused)
            {}  # operand_layouts (unused)
        )
        output_2d = outputs[0]  # Get first output
        
        # Reshape back to original shape
        return output_2d.reshape(original_shape)


def rms_norm_xla(input: torch.Tensor, weight: torch.Tensor, 
                 epsilon: float = 1e-5) -> torch.Tensor:
    """
    Functional interface for XLA RMS Norm.
    
    This function can be used as a drop-in replacement for the standard
    rms_norm when running on XLA devices.
    """
    return XlaRmsNormOp.forward(input, weight, epsilon)


# Register XLA lowering for the original vLLM rms_norm op
def register_rms_norm_lowering():
    """Register XLA lowering to replace vLLM's rms_norm with custom call."""
    
    from torch_xla.core import xla_builder
    
    @xla_builder.register_lowering(torch.ops._C.rms_norm)
    def rms_norm_lowering(ctx, out, input, weight, epsilon):
        """Lower rms_norm to XLA custom call."""
        
        # Since the original op modifies 'out' in-place, we need to handle this
        # In XLA, we create a functional version that returns the output
        
        # Get shape information
        input_shape = ctx.get_shape(input)
        
        # Create descriptor
        batch_size = 1
        for dim in input_shape[:-1]:
            batch_size *= dim
        hidden_size = input_shape[-1]
        
        descriptor = XlaRmsNormOp.create_descriptor(
            epsilon, batch_size, hidden_size, 
            ctx.get_dtype(input)
        )
        
        # Create custom call that returns output
        result = ctx.builder.custom_call(
            XlaRmsNormOp.TARGET_NAME,
            operands=[input, weight],
            shape_with_layout=ctx.shape_with_layout(input),
            opaque=descriptor
        )
        
        # Copy result to out buffer (handling the in-place semantics)
        ctx.copy_to(out, result)
        return out
    
    print("Registered XLA lowering for torch.ops._C.rms_norm")


# Alternative: Create a new functional op that's XLA-friendly
class FunctionalRmsNorm(torch.autograd.Function):
    """Functional RMS Norm that works well with XLA."""
    
    @staticmethod
    def forward(ctx, input, weight, epsilon):
        if input.device.type == 'xla':
            # Use XLA custom call
            return XlaRmsNormOp.forward(input, weight, epsilon)
        else:
            # Fallback to standard implementation
            from vllm._custom_ops import rms_norm
            output = torch.empty_like(input)
            rms_norm(output, input, weight, epsilon)
            return output
    
    @staticmethod
    def backward(ctx, grad_output):
        # Implement backward if needed
        raise NotImplementedError("Backward not implemented for RMS Norm")


def functional_rms_norm(input: torch.Tensor, weight: torch.Tensor, 
                        epsilon: float = 1e-5) -> torch.Tensor:
    """
    Functional RMS Norm that automatically uses XLA custom call on XLA devices.
    """
    return FunctionalRmsNorm.apply(input, weight, epsilon)
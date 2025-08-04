; ModuleID = 'SyncTensorsGraph.9'
source_filename = "SyncTensorsGraph.9"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define ptx_kernel void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(4194304) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %4 = mul i32 %2, 4
  %5 = mul i32 %3, 512
  %6 = add i32 %4, %5
  %7 = getelementptr inbounds float, ptr %0, i32 %6
  store <4 x float> zeroinitializer, ptr %7, align 16
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

attributes #0 = { "nvvm.reqntid"="128,1,1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 128}
!2 = !{i32 0, i32 2048}

; ModuleID = 'SyncTensorsGraph.10'
source_filename = "SyncTensorsGraph.10"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define ptx_kernel void @loop_multiply_fusion(ptr noalias align 16 dereferenceable(12) %0, ptr noalias align 16 dereferenceable(4) %1, ptr noalias align 128 dereferenceable(12) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %5 = getelementptr inbounds float, ptr %0, i32 %4
  %6 = load float, ptr %5, align 4, !invariant.load !2
  %7 = load float, ptr %1, align 4, !invariant.load !2
  %8 = fmul float %6, %7
  %9 = getelementptr inbounds float, ptr %2, i32 %4
  store float %8, ptr %9, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

define ptx_kernel void @loop_divide_fusion(ptr noalias align 128 dereferenceable(12) %0, ptr noalias align 16 dereferenceable(4) %1, ptr noalias align 128 dereferenceable(12) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %5 = getelementptr inbounds float, ptr %0, i32 %4
  %6 = load float, ptr %5, align 4, !invariant.load !2
  %7 = load float, ptr %1, align 4, !invariant.load !2
  %8 = fdiv float %6, %7
  %9 = getelementptr inbounds float, ptr %2, i32 %4
  store float %8, ptr %9, align 4
  ret void
}

attributes #0 = { "nvvm.reqntid"="3,1,1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 3}
!2 = !{}

; ModuleID = 'SyncTensorsGraph.636'
source_filename = "SyncTensorsGraph.636"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_pad_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(2) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(512) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %7 = shl nuw nsw i32 %6, 3
  %8 = lshr i32 %5, 4
  %9 = or disjoint i32 %7, %8
  %10 = and i32 %5, 15
  %11 = icmp eq i32 %9, 0
  %.not = icmp eq i32 %10, 0
  %12 = load bfloat, ptr addrspace(1) %4, align 16
  %13 = select i1 %.not, bfloat 0xR0000, bfloat %12
  %14 = select i1 %11, bfloat %13, bfloat 0xR0000
  %15 = shl nuw nsw i32 %6, 7
  %16 = or disjoint i32 %15, %5
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %17
  store bfloat %14, ptr addrspace(1) %18, align 2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_dynamic_update_slice_fusion_27(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0) local_unnamed_addr #2 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = zext nneg i32 %3 to i64
  %5 = getelementptr bfloat, ptr addrspace(1) %2, i64 %4
  %6 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 32
  store bfloat 0xR0000, ptr addrspace(1) %6, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 32
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_26(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 1
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_1(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 64
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_25(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 3
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 64
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_24(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 2
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 64
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_3(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 96
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_23(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 4
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 96
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_22(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 3
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 96
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_5(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 128
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_21(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 5
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 128
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_20(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 4
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 128
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_7(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 160
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_19(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 6
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 160
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_18(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 5
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 160
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_9(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 192
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_17(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 7
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 192
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_16(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 6
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 192
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_11(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 224
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_15(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 8
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 224
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_14(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 7
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 224
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_13(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 256
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_13(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 9
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 256
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_12(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 8
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 256
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_15(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 288
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_11(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 10
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 288
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_10(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 9
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 288
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_17(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 320
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_9(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 11
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 320
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_8(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 10
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 320
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_19(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 352
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_7(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 12
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 352
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_6(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 11
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 352
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_21(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 384
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_5(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 13
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 384
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_4(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 12
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 384
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_23(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 416
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_3(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = icmp samesign ult i32 %5, 14
  %8 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = select i1 %7, bfloat 0xR0000, bfloat %9
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 416
  store bfloat %10, ptr addrspace(1) %12, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_2(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1, ptr noalias readonly align 16 captures(none) dereferenceable(2) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = zext nneg i32 %7 to i64
  %9 = icmp samesign ugt i32 %7, 13
  %10 = load bfloat, ptr addrspace(1) %4, align 16
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %5, i64 %8
  %12 = load bfloat, ptr addrspace(1) %11, align 2, !invariant.load !5
  %13 = select i1 %9, bfloat %10, bfloat %12
  %14 = getelementptr bfloat, ptr addrspace(1) %6, i64 %8
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 416
  store bfloat %13, ptr addrspace(1) %15, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_25(ptr noalias readonly align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %8 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 448
  %9 = load bfloat, ptr addrspace(1) %8, align 2, !invariant.load !5
  %10 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  store bfloat %9, ptr addrspace(1) %10, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion_1(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = zext nneg i32 %5 to i64
  %.not = icmp eq i32 %5, 15
  %7 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %6
  %8 = load bfloat, ptr addrspace(1) %7, align 2, !invariant.load !5
  %9 = select i1 %.not, bfloat %8, bfloat 0xR0000
  %10 = getelementptr bfloat, ptr addrspace(1) %4, i64 %6
  %11 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 448
  store bfloat %9, ptr addrspace(1) %11, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_dynamic_update_slice_fusion(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0, ptr noalias readonly align 128 captures(none) dereferenceable(16) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32) %2, ptr noalias readonly align 16 captures(none) dereferenceable(2) %3) local_unnamed_addr #3 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !5
  %13 = icmp eq i32 %9, 15
  %14 = load bfloat, ptr addrspace(1) %5, align 16
  %15 = select i1 %13, bfloat %14, bfloat 0xR0000
  %16 = getelementptr inbounds bfloat, ptr addrspace(1) %6, i64 %10
  %17 = load bfloat, ptr addrspace(1) %16, align 2, !invariant.load !5
  %18 = trunc i8 %12 to i1
  %19 = select i1 %18, bfloat %15, bfloat %17
  %20 = getelementptr bfloat, ptr addrspace(1) %8, i64 %10
  %21 = getelementptr inbounds i8, ptr addrspace(1) %20, i64 448
  store bfloat %19, ptr addrspace(1) %21, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_dynamic_update_slice_fusion_28(ptr noalias writeonly align 128 captures(none) dereferenceable(512) %0) local_unnamed_addr #2 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = zext nneg i32 %3 to i64
  %5 = getelementptr bfloat, ptr addrspace(1) %2, i64 %4
  %6 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 480
  store bfloat 0xR0000, ptr addrspace(1) %6, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_broadcast_dynamic_update_slice_fusion(ptr noalias align 128 captures(none) dereferenceable(512) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(512) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = zext nneg i32 %5 to i64
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %8 = zext nneg i32 %7 to i64
  %9 = shl nuw nsw i64 %8, 3
  %10 = lshr i64 %6, 4
  %11 = or disjoint i64 %9, %10
  %12 = icmp eq i64 %11, 15
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = or i64 %6, 240
  %.pre = shl nuw nsw i64 %8, 7
  %.pre1 = or disjoint i64 %.pre, %6
  br label %18

15:                                               ; preds = %2
  %16 = shl nuw nsw i64 %8, 7
  %17 = or disjoint i64 %16, %6
  br label %18

18:                                               ; preds = %15, %13
  %.pre-phi2 = phi i64 [ %17, %15 ], [ %.pre1, %13 ]
  %.pn = phi i64 [ %17, %15 ], [ %14, %13 ]
  %.in = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %.pn
  %19 = load bfloat, ptr addrspace(1) %.in, align 2
  %20 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %.pre-phi2
  store bfloat 0xR0000, ptr addrspace(1) %20, align 2
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %.pre-phi2
  store bfloat %19, ptr addrspace(1) %21, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_select_fusion(ptr noalias writeonly align 128 captures(none) dereferenceable(64) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(64) %1) local_unnamed_addr #2 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = icmp samesign ugt i32 %5, 7
  %7 = zext i1 %6 to i32
  %8 = zext nneg i32 %5 to i64
  %9 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %8
  store i32 %7, ptr addrspace(1) %9, align 4
  %10 = getelementptr inbounds i32, ptr addrspace(1) %3, i64 %8
  store i32 0, ptr addrspace(1) %10, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion(ptr noalias writeonly align 128 captures(none) dereferenceable(16) %0) local_unnamed_addr #2 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = zext nneg i32 %3 to i64
  %5 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %4
  store i8 1, ptr addrspace(1) %5, align 1
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "nvvm.reqntid"="16,1,1" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="16,1,1" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{i32 0, i32 128}
!3 = !{i32 0, i32 2}
!4 = !{i32 0, i32 16}
!5 = !{}

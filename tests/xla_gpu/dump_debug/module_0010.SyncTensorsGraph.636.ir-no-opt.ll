; ModuleID = 'SyncTensorsGraph.636'
source_filename = "SyncTensorsGraph.636"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define ptx_kernel void @loop_pad_fusion(ptr noalias align 16 dereferenceable(2) %0, ptr noalias align 128 dereferenceable(512) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %5 = mul i32 %4, 8
  %6 = udiv i32 %3, 16
  %7 = add i32 %5, %6
  %8 = urem i32 %3, 16
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %10, label %19

10:                                               ; preds = %2
  %11 = icmp sge i32 %8, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %10
  %13 = load bfloat, ptr %0, align 2, !invariant.load !3
  br label %15

14:                                               ; preds = %10
  br label %15

15:                                               ; preds = %12, %14
  %16 = phi bfloat [ 0xR0000, %14 ], [ %13, %12 ]
  br label %17

17:                                               ; preds = %15
  %18 = select i1 %11, bfloat %16, bfloat 0xR0000
  br label %20

19:                                               ; preds = %2
  br label %20

20:                                               ; preds = %17, %19
  %21 = phi bfloat [ 0xR0000, %19 ], [ %18, %17 ]
  br label %22

22:                                               ; preds = %20
  %23 = mul i32 %4, 128
  %24 = add i32 %23, %3
  %25 = getelementptr inbounds bfloat, ptr %1, i32 %24
  store bfloat %21, ptr %25, align 2
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

define ptx_kernel void @loop_dynamic_update_slice_fusion_27(ptr noalias align 128 dereferenceable(512) %0) #2 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %3 = sext i32 %2 to i64
  %4 = add i64 %3, 16
  %5 = getelementptr inbounds bfloat, ptr %0, i64 %4
  store bfloat 0xR0000, ptr %5, align 2
  ret void
}

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 16
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_26(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 2
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 16
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_1(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 32
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_25(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 2
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 32
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_24(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 3
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 32
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_3(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 48
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_23(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 3
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 48
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_22(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 4
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 48
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_5(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 64
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_21(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 4
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 64
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_20(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 5
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 64
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_7(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 80
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_19(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 5
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 80
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_18(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 6
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 80
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_9(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 96
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_17(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 6
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 96
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_16(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 7
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 96
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_11(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 112
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_15(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 7
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 112
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_14(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 8
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 112
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_13(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 128
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_13(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 8
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 128
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_12(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 9
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 128
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_15(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 144
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_11(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 9
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 144
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_10(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 10
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 144
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_17(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 160
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_9(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 10
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 160
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_8(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 11
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 160
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_19(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 176
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_7(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 11
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 176
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_6(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 12
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 176
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_21(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 192
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_5(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 12
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 192
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_4(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 13
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 192
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_23(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 208
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_3(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 13
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 208
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_2(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1, ptr noalias align 16 dereferenceable(2) %2) #2 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %5 = sext i32 %4 to i64
  %6 = icmp sge i64 %5, 14
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = load bfloat, ptr %2, align 2, !invariant.load !3
  br label %10

9:                                                ; preds = %3
  br label %10

10:                                               ; preds = %7, %9
  %11 = phi bfloat [ 0xR0000, %9 ], [ %8, %7 ]
  br label %12

12:                                               ; preds = %10
  %13 = getelementptr inbounds bfloat, ptr %1, i64 %5
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = select i1 %6, bfloat %11, bfloat %14
  %16 = add i64 %5, 208
  %17 = getelementptr inbounds bfloat, ptr %0, i64 %16
  store bfloat %15, ptr %17, align 2
  ret void
}

define ptx_kernel void @wrapped_slice_25(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = add i32 %3, 224
  %5 = getelementptr inbounds bfloat, ptr %0, i32 %4
  %6 = load bfloat, ptr %5, align 2, !invariant.load !3
  %7 = getelementptr inbounds bfloat, ptr %1, i32 %3
  store bfloat %6, ptr %7, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_1(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(32) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = sext i32 %3 to i64
  %5 = icmp sle i64 %4, 14
  %6 = getelementptr inbounds bfloat, ptr %1, i64 %4
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  %8 = select i1 %5, bfloat 0xR0000, bfloat %7
  %9 = add i64 %4, 224
  %10 = getelementptr inbounds bfloat, ptr %0, i64 %9
  store bfloat %8, ptr %10, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(16) %1, ptr noalias align 128 dereferenceable(32) %2, ptr noalias align 16 dereferenceable(2) %3) #2 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8, ptr %1, i64 %6
  %8 = load i8, ptr %7, align 1, !invariant.load !3
  %9 = icmp eq i64 %6, 15
  br i1 %9, label %10, label %12

10:                                               ; preds = %4
  %11 = load bfloat, ptr %3, align 2, !invariant.load !3
  br label %13

12:                                               ; preds = %4
  br label %13

13:                                               ; preds = %10, %12
  %14 = phi bfloat [ 0xR0000, %12 ], [ %11, %10 ]
  br label %15

15:                                               ; preds = %13
  %16 = getelementptr inbounds bfloat, ptr %2, i64 %6
  %17 = load bfloat, ptr %16, align 2, !invariant.load !3
  %18 = trunc i8 %8 to i1
  %19 = select i1 %18, bfloat %14, bfloat %17
  %20 = add i64 %6, 224
  %21 = getelementptr inbounds bfloat, ptr %0, i64 %20
  store bfloat %19, ptr %21, align 2
  ret void
}

define ptx_kernel void @loop_dynamic_update_slice_fusion_28(ptr noalias align 128 dereferenceable(512) %0) #2 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %3 = sext i32 %2 to i64
  %4 = add i64 %3, 240
  %5 = getelementptr inbounds bfloat, ptr %0, i64 %4
  store bfloat 0xR0000, ptr %5, align 2
  ret void
}

define ptx_kernel void @loop_broadcast_dynamic_update_slice_fusion(ptr noalias align 128 dereferenceable(512) %0, ptr noalias align 128 dereferenceable(512) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = sext i32 %3 to i64
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %6 = sext i32 %5 to i64
  %7 = mul i64 %6, 8
  %8 = udiv i64 %4, 16
  %9 = add i64 %7, %8
  %10 = icmp sge i64 %9, 15
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = urem i64 %4, 16
  %13 = add i64 %12, 240
  %14 = getelementptr inbounds bfloat, ptr %0, i64 %13
  %15 = load bfloat, ptr %14, align 2
  br label %21

16:                                               ; preds = %2
  %17 = mul i64 %6, 128
  %18 = add i64 %17, %4
  %19 = getelementptr inbounds bfloat, ptr %0, i64 %18
  %20 = load bfloat, ptr %19, align 2
  br label %21

21:                                               ; preds = %11, %16
  %22 = phi bfloat [ %20, %16 ], [ %15, %11 ]
  br label %23

23:                                               ; preds = %21
  %24 = mul i64 %6, 128
  %25 = add i64 %24, %4
  %26 = getelementptr inbounds bfloat, ptr %1, i64 %25
  store bfloat 0xR0000, ptr %26, align 2
  %27 = getelementptr inbounds bfloat, ptr %0, i64 %25
  store bfloat %22, ptr %27, align 2
  ret void
}

define ptx_kernel void @loop_broadcast_select_fusion(ptr noalias align 128 dereferenceable(64) %0, ptr noalias align 128 dereferenceable(64) %1) #2 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %4 = icmp sge i32 %3, 8
  %5 = zext i1 %4 to i32
  %6 = select i1 %4, i32 %5, i32 0
  %7 = getelementptr inbounds i32, ptr %0, i32 %3
  store i32 %6, ptr %7, align 4
  %8 = getelementptr inbounds i32, ptr %1, i32 %3
  store i32 0, ptr %8, align 4
  ret void
}

define ptx_kernel void @loop_broadcast_fusion(ptr noalias align 128 dereferenceable(16) %0) #2 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %3 = getelementptr inbounds i8, ptr %0, i32 %2
  store i8 1, ptr %3, align 1
  ret void
}

attributes #0 = { "nvvm.reqntid"="128,1,1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "nvvm.reqntid"="16,1,1" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 128}
!2 = !{i32 0, i32 2}
!3 = !{}
!4 = !{i32 0, i32 16}

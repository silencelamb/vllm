; ModuleID = 'SyncTensorsGraph.441'
source_filename = "SyncTensorsGraph.441"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %9 = lshr i32 %8, 3
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %10
  %12 = load i32, ptr addrspace(1) %11, align 4, !invariant.load !6
  %13 = tail call i32 @llvm.umin.i32(i32 %12, i32 151935)
  %14 = shl nuw nsw i32 %8, 7
  %15 = and i32 %14, 896
  %16 = shl nuw nsw i32 %13, 10
  %17 = or disjoint i32 %16, %15
  %18 = or disjoint i32 %17, %7
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds bfloat, ptr addrspace(1) %6, i64 %19
  %21 = load bfloat, ptr addrspace(1) %20, align 2, !invariant.load !6
  %22 = or disjoint i32 %14, %7
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %23
  store bfloat %21, ptr addrspace(1) %24, align 2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

define ptx_kernel void @gemm_fusion_dot_15_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 128 dereferenceable(524288) %arg4) local_unnamed_addr #3 {
  %arg4249 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3247 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1243 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0241 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 64, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 6
  %9 = icmp slt i32 %8, 1024
  %.v = select i1 %9, ptr addrspace(1) %arg0241, ptr addrspace(1) %arg1243
  %10 = icmp slt i32 %8, 2048
  %.v1 = select i1 %10, ptr addrspace(1) %.v, ptr addrspace(1) %arg2245
  %11 = icmp slt i32 %8, 3072
  %.v2 = select i1 %11, ptr addrspace(1) %.v1, ptr addrspace(1) %arg3247
  %12 = add i32 %8, -1024
  %13 = add i32 %8, -2048
  %14 = add i32 %8, -3072
  %15 = select i1 %9, i32 %8, i32 %12
  %16 = select i1 %10, i32 %15, i32 %13
  %17 = select i1 %11, i32 %16, i32 %14
  %18 = sext i32 %17 to i64
  %19 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %20 = and i32 %19, 16
  %.not = icmp eq i32 %20, 0
  %21 = and i32 %19, 32
  %22 = icmp eq i32 %21, 0
  %.lobit3 = lshr i32 %19, 4
  %23 = and i32 %.lobit3, 3
  %24 = icmp samesign ult i32 %19, 64
  %25 = select i1 %24, i32 0, i32 4
  %26 = or disjoint i32 %23, %25
  %27 = or disjoint i32 %26, 8
  %28 = or disjoint i32 %26, 16
  %29 = or disjoint i32 %26, 24
  %30 = or disjoint i32 %26, 32
  %31 = or disjoint i32 %26, 40
  %32 = or disjoint i32 %26, 48
  %33 = or disjoint i32 %26, 56
  %34 = zext nneg i32 %26 to i64
  %35 = zext nneg i32 %27 to i64
  %36 = zext nneg i32 %28 to i64
  %37 = zext nneg i32 %29 to i64
  %38 = zext nneg i32 %30 to i64
  %39 = zext nneg i32 %31 to i64
  %40 = zext nneg i32 %32 to i64
  %41 = zext nneg i32 %33 to i64
  %42 = or disjoint i64 %18, %34
  %43 = or disjoint i64 %18, %35
  %44 = or disjoint i64 %18, %36
  %45 = or disjoint i64 %18, %37
  %46 = or disjoint i64 %18, %38
  %47 = or disjoint i64 %18, %39
  %48 = or disjoint i64 %18, %40
  %49 = or disjoint i64 %18, %41
  %50 = shl nsw i64 %42, 11
  %51 = shl nsw i64 %43, 11
  %52 = shl nsw i64 %44, 11
  %53 = shl nsw i64 %45, 11
  %54 = shl nsw i64 %46, 11
  %55 = shl nsw i64 %47, 11
  %56 = shl nsw i64 %48, 11
  %57 = shl nsw i64 %49, 11
  %58 = and i32 %19, 1
  %59 = icmp eq i32 %58, 0
  %60 = and i32 %19, 2
  %61 = icmp eq i32 %60, 0
  %62 = and i32 %19, 4
  %.not9 = icmp eq i32 %62, 0
  %63 = shl nuw nsw i32 %19, 3
  %64 = and i32 %63, 120
  %65 = zext nneg i32 %64 to i64
  %66 = or disjoint i64 %50, %65
  %67 = or disjoint i64 %51, %65
  %68 = or disjoint i64 %52, %65
  %69 = or disjoint i64 %53, %65
  %70 = or disjoint i64 %54, %65
  %71 = or disjoint i64 %55, %65
  %72 = or disjoint i64 %56, %65
  %73 = or disjoint i64 %57, %65
  %74 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %66
  %75 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %67
  %76 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %68
  %77 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %69
  %78 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %70
  %79 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %71
  %80 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %72
  %81 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %73
  %82 = select i1 %.not, i32 0, i32 136
  %83 = select i1 %22, i32 0, i32 272
  %84 = select i1 %24, i32 0, i32 544
  %85 = or disjoint i32 %82, %84
  %86 = xor i32 %85, %64
  %87 = xor i32 %86, %83
  %88 = zext nneg i32 %87 to i64
  %89 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %88
  %90 = or disjoint i32 %64, 1024
  %91 = xor i32 %85, %90
  %92 = xor i32 %91, %83
  %93 = zext nneg i32 %92 to i64
  %94 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %93
  %95 = or disjoint i32 %64, 2048
  %96 = xor i32 %85, %95
  %97 = xor i32 %96, %83
  %98 = zext nneg i32 %97 to i64
  %99 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %98
  %100 = or disjoint i32 %64, 3072
  %101 = xor i32 %85, %100
  %102 = xor i32 %101, %83
  %103 = zext nneg i32 %102 to i64
  %104 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %103
  %105 = or disjoint i32 %64, 4096
  %106 = xor i32 %85, %105
  %107 = xor i32 %106, %83
  %108 = zext nneg i32 %107 to i64
  %109 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %108
  %110 = or disjoint i32 %64, 5120
  %111 = xor i32 %85, %110
  %112 = xor i32 %111, %83
  %113 = zext nneg i32 %112 to i64
  %114 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %113
  %115 = or disjoint i32 %64, 6144
  %116 = xor i32 %85, %115
  %117 = xor i32 %116, %83
  %118 = zext nneg i32 %117 to i64
  %119 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %118
  %120 = or disjoint i32 %64, 7168
  %121 = xor i32 %85, %120
  %122 = xor i32 %121, %83
  %123 = zext nneg i32 %122 to i64
  %124 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %123
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %89, ptr addrspace(1) %74, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %94, ptr addrspace(1) %75, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %99, ptr addrspace(1) %76, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %104, ptr addrspace(1) %77, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %109, ptr addrspace(1) %78, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %114, ptr addrspace(1) %79, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %119, ptr addrspace(1) %80, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %124, ptr addrspace(1) %81, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %125 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %50
  %126 = getelementptr bfloat, ptr addrspace(1) %125, i64 %65
  %127 = getelementptr i8, ptr addrspace(1) %126, i64 256
  %128 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %51
  %129 = getelementptr bfloat, ptr addrspace(1) %128, i64 %65
  %130 = getelementptr i8, ptr addrspace(1) %129, i64 256
  %131 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %52
  %132 = getelementptr bfloat, ptr addrspace(1) %131, i64 %65
  %133 = getelementptr i8, ptr addrspace(1) %132, i64 256
  %134 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %53
  %135 = getelementptr bfloat, ptr addrspace(1) %134, i64 %65
  %136 = getelementptr i8, ptr addrspace(1) %135, i64 256
  %137 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %54
  %138 = getelementptr bfloat, ptr addrspace(1) %137, i64 %65
  %139 = getelementptr i8, ptr addrspace(1) %138, i64 256
  %140 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %55
  %141 = getelementptr bfloat, ptr addrspace(1) %140, i64 %65
  %142 = getelementptr i8, ptr addrspace(1) %141, i64 256
  %143 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %56
  %144 = getelementptr bfloat, ptr addrspace(1) %143, i64 %65
  %145 = getelementptr i8, ptr addrspace(1) %144, i64 256
  %146 = getelementptr bfloat, ptr addrspace(1) %.v2, i64 %57
  %147 = getelementptr bfloat, ptr addrspace(1) %146, i64 %65
  %148 = getelementptr i8, ptr addrspace(1) %147, i64 256
  tail call void @llvm.nvvm.barrier0()
  %149 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %88
  %150 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %93
  %151 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %98
  %152 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %103
  %153 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %108
  %154 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %113
  %155 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %118
  %156 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %123
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %149, ptr addrspace(1) %127, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %150, ptr addrspace(1) %130, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %151, ptr addrspace(1) %133, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %136, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %153, ptr addrspace(1) %139, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %154, ptr addrspace(1) %142, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %155, ptr addrspace(1) %145, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %156, ptr addrspace(1) %148, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %157 = getelementptr i8, ptr addrspace(1) %126, i64 512
  %158 = getelementptr i8, ptr addrspace(1) %129, i64 512
  %159 = getelementptr i8, ptr addrspace(1) %132, i64 512
  %160 = getelementptr i8, ptr addrspace(1) %135, i64 512
  %161 = getelementptr i8, ptr addrspace(1) %138, i64 512
  %162 = getelementptr i8, ptr addrspace(1) %141, i64 512
  %163 = getelementptr i8, ptr addrspace(1) %144, i64 512
  %164 = getelementptr i8, ptr addrspace(1) %147, i64 512
  tail call void @llvm.nvvm.barrier0()
  %165 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %88
  %166 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %93
  %167 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %98
  %168 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %103
  %169 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %108
  %170 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %113
  %171 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %118
  %172 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %123
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %165, ptr addrspace(1) %157, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %166, ptr addrspace(1) %158, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %167, ptr addrspace(1) %159, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %160, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %169, ptr addrspace(1) %161, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %170, ptr addrspace(1) %162, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %171, ptr addrspace(1) %163, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %172, ptr addrspace(1) %164, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %173 = select i1 %59, i32 0, i32 136
  %174 = select i1 %61, i32 0, i32 272
  %175 = or disjoint i32 %173, %174
  %176 = select i1 %.not9, i32 0, i32 544
  %177 = shl nuw nsw i32 %19, 7
  %178 = and i32 %177, 1024
  %179 = or disjoint i32 %176, %178
  %180 = or disjoint i32 %179, %175
  %181 = lshr exact i32 %20, 1
  %182 = xor i32 %180, %181
  %183 = select i1 %24, i32 0, i32 2048
  %184 = or disjoint i32 %182, %183
  %185 = zext nneg i32 %184 to i64
  %186 = or disjoint i32 %173, 16
  %187 = xor i32 %186, %174
  %188 = or disjoint i32 %178, %187
  %189 = or disjoint i32 %188, %176
  %190 = or disjoint i32 %183, %181
  %191 = xor i32 %190, %189
  %192 = zext nneg i32 %191 to i64
  %193 = or disjoint i32 %175, 32
  %194 = xor i32 %193, %176
  %195 = or disjoint i32 %194, %178
  %196 = xor i32 %190, %195
  %197 = zext nneg i32 %196 to i64
  %198 = or disjoint i32 %173, 48
  %199 = or disjoint i32 %176, %174
  %200 = xor i32 %199, %198
  %201 = or disjoint i32 %200, %178
  %202 = xor i32 %190, %201
  %203 = zext nneg i32 %202 to i64
  %204 = or disjoint i32 %180, 64
  %205 = xor i32 %190, %204
  %206 = zext nneg i32 %205 to i64
  %207 = or disjoint i32 %173, 80
  %208 = xor i32 %207, %174
  %209 = or disjoint i32 %178, %208
  %210 = or disjoint i32 %209, %176
  %211 = xor i32 %190, %210
  %212 = zext nneg i32 %211 to i64
  %213 = or disjoint i32 %175, 96
  %214 = xor i32 %213, %176
  %215 = or disjoint i32 %214, %178
  %216 = xor i32 %190, %215
  %217 = zext nneg i32 %216 to i64
  %218 = or disjoint i32 %173, 112
  %219 = xor i32 %199, %218
  %220 = or disjoint i32 %219, %178
  %221 = xor i32 %190, %220
  %222 = zext nneg i32 %221 to i64
  %223 = or disjoint i32 %180, 4096
  %224 = xor i32 %190, %223
  %225 = zext nneg i32 %224 to i64
  %226 = or disjoint i32 %173, 4112
  %227 = xor i32 %226, %174
  %228 = or disjoint i32 %178, %227
  %229 = or disjoint i32 %228, %176
  %230 = xor i32 %190, %229
  %231 = zext nneg i32 %230 to i64
  %232 = or disjoint i32 %175, 4128
  %233 = xor i32 %232, %176
  %234 = or disjoint i32 %233, %178
  %235 = xor i32 %190, %234
  %236 = zext nneg i32 %235 to i64
  %237 = or disjoint i32 %173, 4144
  %238 = xor i32 %199, %237
  %239 = or disjoint i32 %238, %178
  %240 = xor i32 %190, %239
  %241 = zext nneg i32 %240 to i64
  %242 = or disjoint i32 %180, 4160
  %243 = xor i32 %190, %242
  %244 = zext nneg i32 %243 to i64
  %245 = or disjoint i32 %173, 4176
  %246 = xor i32 %245, %174
  %247 = or disjoint i32 %178, %246
  %248 = or disjoint i32 %247, %176
  %249 = xor i32 %190, %248
  %250 = zext nneg i32 %249 to i64
  %251 = or disjoint i32 %175, 4192
  %252 = xor i32 %251, %176
  %253 = or disjoint i32 %252, %178
  %254 = xor i32 %190, %253
  %255 = zext nneg i32 %254 to i64
  %256 = or disjoint i32 %173, 4208
  %257 = xor i32 %199, %256
  %258 = or disjoint i32 %257, %178
  %259 = xor i32 %190, %258
  %260 = zext nneg i32 %259 to i64
  %261 = trunc i32 %19 to i4
  %262 = zext i4 %261 to i64
  %263 = shl nuw nsw i64 %262, 4
  %264 = add i32 %25, %23
  %265 = add i32 %264, 56
  %266 = zext nneg i32 %265 to i64
  %267 = add i64 %18, %266
  %268 = shl nsw i64 %267, 12
  %269 = add nuw nsw i64 %268, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %.v2, i64 %269
  %270 = add i32 %264, 48
  %271 = zext nneg i32 %270 to i64
  %272 = add i64 %18, %271
  %273 = shl nsw i64 %272, 12
  %274 = add nuw nsw i64 %273, 768
  %scevgep253 = getelementptr i8, ptr addrspace(1) %.v2, i64 %274
  %275 = add i32 %264, 40
  %276 = zext nneg i32 %275 to i64
  %277 = add i64 %18, %276
  %278 = shl nsw i64 %277, 12
  %279 = add nuw nsw i64 %278, 768
  %scevgep257 = getelementptr i8, ptr addrspace(1) %.v2, i64 %279
  %280 = add i32 %264, 32
  %281 = zext nneg i32 %280 to i64
  %282 = add i64 %18, %281
  %283 = shl nsw i64 %282, 12
  %284 = add nuw nsw i64 %283, 768
  %scevgep261 = getelementptr i8, ptr addrspace(1) %.v2, i64 %284
  %285 = add i32 %264, 24
  %286 = zext nneg i32 %285 to i64
  %287 = add i64 %18, %286
  %288 = shl nsw i64 %287, 12
  %289 = add nuw nsw i64 %288, 768
  %scevgep265 = getelementptr i8, ptr addrspace(1) %.v2, i64 %289
  %290 = add i32 %264, 16
  %291 = zext nneg i32 %290 to i64
  %292 = add i64 %18, %291
  %293 = shl nsw i64 %292, 12
  %294 = add nuw nsw i64 %293, 768
  %scevgep269 = getelementptr i8, ptr addrspace(1) %.v2, i64 %294
  %295 = add i32 %264, 8
  %296 = zext nneg i32 %295 to i64
  %297 = add i64 %18, %296
  %298 = shl nsw i64 %297, 12
  %299 = add nuw nsw i64 %298, 768
  %scevgep273 = getelementptr i8, ptr addrspace(1) %.v2, i64 %299
  %300 = zext nneg i32 %264 to i64
  %301 = add i64 %18, %300
  %302 = shl nsw i64 %301, 12
  %303 = add nuw nsw i64 %302, 768
  %scevgep277 = getelementptr i8, ptr addrspace(1) %.v2, i64 %303
  br label %304

304:                                              ; preds = %0, %304
  %lsr.iv281 = phi i32 [ -128, %0 ], [ %309, %304 ]
  %lsr.iv278 = phi ptr addrspace(1) [ %scevgep277, %0 ], [ %scevgep279, %304 ]
  %lsr.iv274 = phi ptr addrspace(1) [ %scevgep273, %0 ], [ %scevgep275, %304 ]
  %lsr.iv270 = phi ptr addrspace(1) [ %scevgep269, %0 ], [ %scevgep271, %304 ]
  %lsr.iv266 = phi ptr addrspace(1) [ %scevgep265, %0 ], [ %scevgep267, %304 ]
  %lsr.iv262 = phi ptr addrspace(1) [ %scevgep261, %0 ], [ %scevgep263, %304 ]
  %lsr.iv258 = phi ptr addrspace(1) [ %scevgep257, %0 ], [ %scevgep259, %304 ]
  %lsr.iv254 = phi ptr addrspace(1) [ %scevgep253, %0 ], [ %scevgep255, %304 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep251, %304 ]
  %305 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %843, %304 ]
  %306 = phi i32 [ 0, %0 ], [ %840, %304 ]
  %307 = phi i32 [ 2, %0 ], [ %825, %304 ]
  %308 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %822, %304 ]
  %309 = add i32 %lsr.iv281, 128
  %310 = icmp samesign ult i32 %309, 1664
  %311 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %185
  %312 = ptrtoint ptr addrspace(3) %311 to i64
  %313 = trunc i64 %312 to i32
  %314 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %313) #9
  %315 = extractvalue { i32, i32, i32, i32 } %314, 0
  %316 = extractvalue { i32, i32, i32, i32 } %314, 1
  %317 = extractvalue { i32, i32, i32, i32 } %314, 2
  %318 = extractvalue { i32, i32, i32, i32 } %314, 3
  %319 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %192
  %320 = ptrtoint ptr addrspace(3) %319 to i64
  %321 = trunc i64 %320 to i32
  %322 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %321) #9
  %323 = extractvalue { i32, i32, i32, i32 } %322, 0
  %324 = extractvalue { i32, i32, i32, i32 } %322, 1
  %325 = extractvalue { i32, i32, i32, i32 } %322, 2
  %326 = extractvalue { i32, i32, i32, i32 } %322, 3
  %327 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %197
  %328 = ptrtoint ptr addrspace(3) %327 to i64
  %329 = trunc i64 %328 to i32
  %330 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %329) #9
  %331 = extractvalue { i32, i32, i32, i32 } %330, 0
  %332 = extractvalue { i32, i32, i32, i32 } %330, 1
  %333 = extractvalue { i32, i32, i32, i32 } %330, 2
  %334 = extractvalue { i32, i32, i32, i32 } %330, 3
  %335 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %203
  %336 = ptrtoint ptr addrspace(3) %335 to i64
  %337 = trunc i64 %336 to i32
  %338 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %337) #9
  %339 = extractvalue { i32, i32, i32, i32 } %338, 0
  %340 = extractvalue { i32, i32, i32, i32 } %338, 1
  %341 = extractvalue { i32, i32, i32, i32 } %338, 2
  %342 = extractvalue { i32, i32, i32, i32 } %338, 3
  %343 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %206
  %344 = ptrtoint ptr addrspace(3) %343 to i64
  %345 = trunc i64 %344 to i32
  %346 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %345) #9
  %347 = extractvalue { i32, i32, i32, i32 } %346, 0
  %348 = extractvalue { i32, i32, i32, i32 } %346, 1
  %349 = extractvalue { i32, i32, i32, i32 } %346, 2
  %350 = extractvalue { i32, i32, i32, i32 } %346, 3
  %351 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %212
  %352 = ptrtoint ptr addrspace(3) %351 to i64
  %353 = trunc i64 %352 to i32
  %354 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %353) #9
  %355 = extractvalue { i32, i32, i32, i32 } %354, 0
  %356 = extractvalue { i32, i32, i32, i32 } %354, 1
  %357 = extractvalue { i32, i32, i32, i32 } %354, 2
  %358 = extractvalue { i32, i32, i32, i32 } %354, 3
  %359 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %217
  %360 = ptrtoint ptr addrspace(3) %359 to i64
  %361 = trunc i64 %360 to i32
  %362 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %361) #9
  %363 = extractvalue { i32, i32, i32, i32 } %362, 0
  %364 = extractvalue { i32, i32, i32, i32 } %362, 1
  %365 = extractvalue { i32, i32, i32, i32 } %362, 2
  %366 = extractvalue { i32, i32, i32, i32 } %362, 3
  %367 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %222
  %368 = ptrtoint ptr addrspace(3) %367 to i64
  %369 = trunc i64 %368 to i32
  %370 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %369) #9
  %371 = extractvalue { i32, i32, i32, i32 } %370, 0
  %372 = extractvalue { i32, i32, i32, i32 } %370, 1
  %373 = extractvalue { i32, i32, i32, i32 } %370, 2
  %374 = extractvalue { i32, i32, i32, i32 } %370, 3
  %375 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %225
  %376 = ptrtoint ptr addrspace(3) %375 to i64
  %377 = trunc i64 %376 to i32
  %378 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %377) #9
  %379 = extractvalue { i32, i32, i32, i32 } %378, 0
  %380 = extractvalue { i32, i32, i32, i32 } %378, 1
  %381 = extractvalue { i32, i32, i32, i32 } %378, 2
  %382 = extractvalue { i32, i32, i32, i32 } %378, 3
  %383 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %231
  %384 = ptrtoint ptr addrspace(3) %383 to i64
  %385 = trunc i64 %384 to i32
  %386 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %385) #9
  %387 = extractvalue { i32, i32, i32, i32 } %386, 0
  %388 = extractvalue { i32, i32, i32, i32 } %386, 1
  %389 = extractvalue { i32, i32, i32, i32 } %386, 2
  %390 = extractvalue { i32, i32, i32, i32 } %386, 3
  %391 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %236
  %392 = ptrtoint ptr addrspace(3) %391 to i64
  %393 = trunc i64 %392 to i32
  %394 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %393) #9
  %395 = extractvalue { i32, i32, i32, i32 } %394, 0
  %396 = extractvalue { i32, i32, i32, i32 } %394, 1
  %397 = extractvalue { i32, i32, i32, i32 } %394, 2
  %398 = extractvalue { i32, i32, i32, i32 } %394, 3
  %399 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %241
  %400 = ptrtoint ptr addrspace(3) %399 to i64
  %401 = trunc i64 %400 to i32
  %402 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %401) #9
  %403 = extractvalue { i32, i32, i32, i32 } %402, 0
  %404 = extractvalue { i32, i32, i32, i32 } %402, 1
  %405 = extractvalue { i32, i32, i32, i32 } %402, 2
  %406 = extractvalue { i32, i32, i32, i32 } %402, 3
  %407 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %244
  %408 = ptrtoint ptr addrspace(3) %407 to i64
  %409 = trunc i64 %408 to i32
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %409) #9
  %411 = extractvalue { i32, i32, i32, i32 } %410, 0
  %412 = extractvalue { i32, i32, i32, i32 } %410, 1
  %413 = extractvalue { i32, i32, i32, i32 } %410, 2
  %414 = extractvalue { i32, i32, i32, i32 } %410, 3
  %415 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %250
  %416 = ptrtoint ptr addrspace(3) %415 to i64
  %417 = trunc i64 %416 to i32
  %418 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %417) #9
  %419 = extractvalue { i32, i32, i32, i32 } %418, 0
  %420 = extractvalue { i32, i32, i32, i32 } %418, 1
  %421 = extractvalue { i32, i32, i32, i32 } %418, 2
  %422 = extractvalue { i32, i32, i32, i32 } %418, 3
  %423 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %255
  %424 = ptrtoint ptr addrspace(3) %423 to i64
  %425 = trunc i64 %424 to i32
  %426 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %425) #9
  %427 = extractvalue { i32, i32, i32, i32 } %426, 0
  %428 = extractvalue { i32, i32, i32, i32 } %426, 1
  %429 = extractvalue { i32, i32, i32, i32 } %426, 2
  %430 = extractvalue { i32, i32, i32, i32 } %426, 3
  %431 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %305, i64 %260
  %432 = ptrtoint ptr addrspace(3) %431 to i64
  %433 = trunc i64 %432 to i32
  %434 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %433) #9
  %435 = extractvalue { i32, i32, i32, i32 } %434, 0
  %436 = extractvalue { i32, i32, i32, i32 } %434, 1
  %437 = extractvalue { i32, i32, i32, i32 } %434, 2
  %438 = extractvalue { i32, i32, i32, i32 } %434, 3
  %439 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 0
  %440 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 1
  %441 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 2
  %442 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 3
  %443 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 4
  %444 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 5
  %445 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 6
  %446 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 7
  %447 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 8
  %448 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 9
  %449 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 10
  %450 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 11
  %451 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 12
  %452 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 13
  %453 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 14
  %454 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 15
  %455 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 16
  %456 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 17
  %457 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 18
  %458 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 19
  %459 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 20
  %460 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 21
  %461 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 22
  %462 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 23
  %463 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 24
  %464 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 25
  %465 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 26
  %466 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 27
  %467 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 28
  %468 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 29
  %469 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 30
  %470 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, 31
  %471 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %439, float %440, float %441, float %442, i32 %315, i32 %316, i32 %317, i32 %318, i32 0, i32 0) #9
  %472 = extractvalue { float, float, float, float } %471, 0
  %473 = extractvalue { float, float, float, float } %471, 1
  %474 = extractvalue { float, float, float, float } %471, 2
  %475 = extractvalue { float, float, float, float } %471, 3
  %476 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %443, float %444, float %445, float %446, i32 %315, i32 %316, i32 %317, i32 %318, i32 0, i32 0) #9
  %477 = extractvalue { float, float, float, float } %476, 0
  %478 = extractvalue { float, float, float, float } %476, 1
  %479 = extractvalue { float, float, float, float } %476, 2
  %480 = extractvalue { float, float, float, float } %476, 3
  %481 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %447, float %448, float %449, float %450, i32 %315, i32 %316, i32 %317, i32 %318, i32 0, i32 0) #9
  %482 = extractvalue { float, float, float, float } %481, 0
  %483 = extractvalue { float, float, float, float } %481, 1
  %484 = extractvalue { float, float, float, float } %481, 2
  %485 = extractvalue { float, float, float, float } %481, 3
  %486 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %451, float %452, float %453, float %454, i32 %315, i32 %316, i32 %317, i32 %318, i32 0, i32 0) #9
  %487 = extractvalue { float, float, float, float } %486, 0
  %488 = extractvalue { float, float, float, float } %486, 1
  %489 = extractvalue { float, float, float, float } %486, 2
  %490 = extractvalue { float, float, float, float } %486, 3
  %491 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %455, float %456, float %457, float %458, i32 %379, i32 %380, i32 %381, i32 %382, i32 0, i32 0) #9
  %492 = extractvalue { float, float, float, float } %491, 0
  %493 = extractvalue { float, float, float, float } %491, 1
  %494 = extractvalue { float, float, float, float } %491, 2
  %495 = extractvalue { float, float, float, float } %491, 3
  %496 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %459, float %460, float %461, float %462, i32 %379, i32 %380, i32 %381, i32 %382, i32 0, i32 0) #9
  %497 = extractvalue { float, float, float, float } %496, 0
  %498 = extractvalue { float, float, float, float } %496, 1
  %499 = extractvalue { float, float, float, float } %496, 2
  %500 = extractvalue { float, float, float, float } %496, 3
  %501 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %463, float %464, float %465, float %466, i32 %379, i32 %380, i32 %381, i32 %382, i32 0, i32 0) #9
  %502 = extractvalue { float, float, float, float } %501, 0
  %503 = extractvalue { float, float, float, float } %501, 1
  %504 = extractvalue { float, float, float, float } %501, 2
  %505 = extractvalue { float, float, float, float } %501, 3
  %506 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %467, float %468, float %469, float %470, i32 %379, i32 %380, i32 %381, i32 %382, i32 0, i32 0) #9
  %507 = extractvalue { float, float, float, float } %506, 0
  %508 = extractvalue { float, float, float, float } %506, 1
  %509 = extractvalue { float, float, float, float } %506, 2
  %510 = extractvalue { float, float, float, float } %506, 3
  %511 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %472, float %473, float %474, float %475, i32 %323, i32 %324, i32 %325, i32 %326, i32 0, i32 0) #9
  %512 = extractvalue { float, float, float, float } %511, 0
  %513 = extractvalue { float, float, float, float } %511, 1
  %514 = extractvalue { float, float, float, float } %511, 2
  %515 = extractvalue { float, float, float, float } %511, 3
  %516 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %477, float %478, float %479, float %480, i32 %323, i32 %324, i32 %325, i32 %326, i32 0, i32 0) #9
  %517 = extractvalue { float, float, float, float } %516, 0
  %518 = extractvalue { float, float, float, float } %516, 1
  %519 = extractvalue { float, float, float, float } %516, 2
  %520 = extractvalue { float, float, float, float } %516, 3
  %521 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %482, float %483, float %484, float %485, i32 %323, i32 %324, i32 %325, i32 %326, i32 0, i32 0) #9
  %522 = extractvalue { float, float, float, float } %521, 0
  %523 = extractvalue { float, float, float, float } %521, 1
  %524 = extractvalue { float, float, float, float } %521, 2
  %525 = extractvalue { float, float, float, float } %521, 3
  %526 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %487, float %488, float %489, float %490, i32 %323, i32 %324, i32 %325, i32 %326, i32 0, i32 0) #9
  %527 = extractvalue { float, float, float, float } %526, 0
  %528 = extractvalue { float, float, float, float } %526, 1
  %529 = extractvalue { float, float, float, float } %526, 2
  %530 = extractvalue { float, float, float, float } %526, 3
  %531 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %492, float %493, float %494, float %495, i32 %387, i32 %388, i32 %389, i32 %390, i32 0, i32 0) #9
  %532 = extractvalue { float, float, float, float } %531, 0
  %533 = extractvalue { float, float, float, float } %531, 1
  %534 = extractvalue { float, float, float, float } %531, 2
  %535 = extractvalue { float, float, float, float } %531, 3
  %536 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %497, float %498, float %499, float %500, i32 %387, i32 %388, i32 %389, i32 %390, i32 0, i32 0) #9
  %537 = extractvalue { float, float, float, float } %536, 0
  %538 = extractvalue { float, float, float, float } %536, 1
  %539 = extractvalue { float, float, float, float } %536, 2
  %540 = extractvalue { float, float, float, float } %536, 3
  %541 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %502, float %503, float %504, float %505, i32 %387, i32 %388, i32 %389, i32 %390, i32 0, i32 0) #9
  %542 = extractvalue { float, float, float, float } %541, 0
  %543 = extractvalue { float, float, float, float } %541, 1
  %544 = extractvalue { float, float, float, float } %541, 2
  %545 = extractvalue { float, float, float, float } %541, 3
  %546 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %507, float %508, float %509, float %510, i32 %387, i32 %388, i32 %389, i32 %390, i32 0, i32 0) #9
  %547 = extractvalue { float, float, float, float } %546, 0
  %548 = extractvalue { float, float, float, float } %546, 1
  %549 = extractvalue { float, float, float, float } %546, 2
  %550 = extractvalue { float, float, float, float } %546, 3
  %551 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %512, float %513, float %514, float %515, i32 %331, i32 %332, i32 %333, i32 %334, i32 0, i32 0) #9
  %552 = extractvalue { float, float, float, float } %551, 0
  %553 = extractvalue { float, float, float, float } %551, 1
  %554 = extractvalue { float, float, float, float } %551, 2
  %555 = extractvalue { float, float, float, float } %551, 3
  %556 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %517, float %518, float %519, float %520, i32 %331, i32 %332, i32 %333, i32 %334, i32 0, i32 0) #9
  %557 = extractvalue { float, float, float, float } %556, 0
  %558 = extractvalue { float, float, float, float } %556, 1
  %559 = extractvalue { float, float, float, float } %556, 2
  %560 = extractvalue { float, float, float, float } %556, 3
  %561 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %522, float %523, float %524, float %525, i32 %331, i32 %332, i32 %333, i32 %334, i32 0, i32 0) #9
  %562 = extractvalue { float, float, float, float } %561, 0
  %563 = extractvalue { float, float, float, float } %561, 1
  %564 = extractvalue { float, float, float, float } %561, 2
  %565 = extractvalue { float, float, float, float } %561, 3
  %566 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %527, float %528, float %529, float %530, i32 %331, i32 %332, i32 %333, i32 %334, i32 0, i32 0) #9
  %567 = extractvalue { float, float, float, float } %566, 0
  %568 = extractvalue { float, float, float, float } %566, 1
  %569 = extractvalue { float, float, float, float } %566, 2
  %570 = extractvalue { float, float, float, float } %566, 3
  %571 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %532, float %533, float %534, float %535, i32 %395, i32 %396, i32 %397, i32 %398, i32 0, i32 0) #9
  %572 = extractvalue { float, float, float, float } %571, 0
  %573 = extractvalue { float, float, float, float } %571, 1
  %574 = extractvalue { float, float, float, float } %571, 2
  %575 = extractvalue { float, float, float, float } %571, 3
  %576 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %537, float %538, float %539, float %540, i32 %395, i32 %396, i32 %397, i32 %398, i32 0, i32 0) #9
  %577 = extractvalue { float, float, float, float } %576, 0
  %578 = extractvalue { float, float, float, float } %576, 1
  %579 = extractvalue { float, float, float, float } %576, 2
  %580 = extractvalue { float, float, float, float } %576, 3
  %581 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %542, float %543, float %544, float %545, i32 %395, i32 %396, i32 %397, i32 %398, i32 0, i32 0) #9
  %582 = extractvalue { float, float, float, float } %581, 0
  %583 = extractvalue { float, float, float, float } %581, 1
  %584 = extractvalue { float, float, float, float } %581, 2
  %585 = extractvalue { float, float, float, float } %581, 3
  %586 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %547, float %548, float %549, float %550, i32 %395, i32 %396, i32 %397, i32 %398, i32 0, i32 0) #9
  %587 = extractvalue { float, float, float, float } %586, 0
  %588 = extractvalue { float, float, float, float } %586, 1
  %589 = extractvalue { float, float, float, float } %586, 2
  %590 = extractvalue { float, float, float, float } %586, 3
  %591 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %552, float %553, float %554, float %555, i32 %339, i32 %340, i32 %341, i32 %342, i32 0, i32 0) #9
  %592 = extractvalue { float, float, float, float } %591, 0
  %593 = extractvalue { float, float, float, float } %591, 1
  %594 = extractvalue { float, float, float, float } %591, 2
  %595 = extractvalue { float, float, float, float } %591, 3
  %596 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %557, float %558, float %559, float %560, i32 %339, i32 %340, i32 %341, i32 %342, i32 0, i32 0) #9
  %597 = extractvalue { float, float, float, float } %596, 0
  %598 = extractvalue { float, float, float, float } %596, 1
  %599 = extractvalue { float, float, float, float } %596, 2
  %600 = extractvalue { float, float, float, float } %596, 3
  %601 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %562, float %563, float %564, float %565, i32 %339, i32 %340, i32 %341, i32 %342, i32 0, i32 0) #9
  %602 = extractvalue { float, float, float, float } %601, 0
  %603 = extractvalue { float, float, float, float } %601, 1
  %604 = extractvalue { float, float, float, float } %601, 2
  %605 = extractvalue { float, float, float, float } %601, 3
  %606 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %567, float %568, float %569, float %570, i32 %339, i32 %340, i32 %341, i32 %342, i32 0, i32 0) #9
  %607 = extractvalue { float, float, float, float } %606, 0
  %608 = extractvalue { float, float, float, float } %606, 1
  %609 = extractvalue { float, float, float, float } %606, 2
  %610 = extractvalue { float, float, float, float } %606, 3
  %611 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %572, float %573, float %574, float %575, i32 %403, i32 %404, i32 %405, i32 %406, i32 0, i32 0) #9
  %612 = extractvalue { float, float, float, float } %611, 0
  %613 = extractvalue { float, float, float, float } %611, 1
  %614 = extractvalue { float, float, float, float } %611, 2
  %615 = extractvalue { float, float, float, float } %611, 3
  %616 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %577, float %578, float %579, float %580, i32 %403, i32 %404, i32 %405, i32 %406, i32 0, i32 0) #9
  %617 = extractvalue { float, float, float, float } %616, 0
  %618 = extractvalue { float, float, float, float } %616, 1
  %619 = extractvalue { float, float, float, float } %616, 2
  %620 = extractvalue { float, float, float, float } %616, 3
  %621 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %582, float %583, float %584, float %585, i32 %403, i32 %404, i32 %405, i32 %406, i32 0, i32 0) #9
  %622 = extractvalue { float, float, float, float } %621, 0
  %623 = extractvalue { float, float, float, float } %621, 1
  %624 = extractvalue { float, float, float, float } %621, 2
  %625 = extractvalue { float, float, float, float } %621, 3
  %626 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %587, float %588, float %589, float %590, i32 %403, i32 %404, i32 %405, i32 %406, i32 0, i32 0) #9
  %627 = extractvalue { float, float, float, float } %626, 0
  %628 = extractvalue { float, float, float, float } %626, 1
  %629 = extractvalue { float, float, float, float } %626, 2
  %630 = extractvalue { float, float, float, float } %626, 3
  %631 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %592, float %593, float %594, float %595, i32 %347, i32 %348, i32 %349, i32 %350, i32 0, i32 0) #9
  %632 = extractvalue { float, float, float, float } %631, 0
  %633 = extractvalue { float, float, float, float } %631, 1
  %634 = extractvalue { float, float, float, float } %631, 2
  %635 = extractvalue { float, float, float, float } %631, 3
  %636 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %597, float %598, float %599, float %600, i32 %347, i32 %348, i32 %349, i32 %350, i32 0, i32 0) #9
  %637 = extractvalue { float, float, float, float } %636, 0
  %638 = extractvalue { float, float, float, float } %636, 1
  %639 = extractvalue { float, float, float, float } %636, 2
  %640 = extractvalue { float, float, float, float } %636, 3
  %641 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %602, float %603, float %604, float %605, i32 %347, i32 %348, i32 %349, i32 %350, i32 0, i32 0) #9
  %642 = extractvalue { float, float, float, float } %641, 0
  %643 = extractvalue { float, float, float, float } %641, 1
  %644 = extractvalue { float, float, float, float } %641, 2
  %645 = extractvalue { float, float, float, float } %641, 3
  %646 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %607, float %608, float %609, float %610, i32 %347, i32 %348, i32 %349, i32 %350, i32 0, i32 0) #9
  %647 = extractvalue { float, float, float, float } %646, 0
  %648 = extractvalue { float, float, float, float } %646, 1
  %649 = extractvalue { float, float, float, float } %646, 2
  %650 = extractvalue { float, float, float, float } %646, 3
  %651 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %612, float %613, float %614, float %615, i32 %411, i32 %412, i32 %413, i32 %414, i32 0, i32 0) #9
  %652 = extractvalue { float, float, float, float } %651, 0
  %653 = extractvalue { float, float, float, float } %651, 1
  %654 = extractvalue { float, float, float, float } %651, 2
  %655 = extractvalue { float, float, float, float } %651, 3
  %656 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %617, float %618, float %619, float %620, i32 %411, i32 %412, i32 %413, i32 %414, i32 0, i32 0) #9
  %657 = extractvalue { float, float, float, float } %656, 0
  %658 = extractvalue { float, float, float, float } %656, 1
  %659 = extractvalue { float, float, float, float } %656, 2
  %660 = extractvalue { float, float, float, float } %656, 3
  %661 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %622, float %623, float %624, float %625, i32 %411, i32 %412, i32 %413, i32 %414, i32 0, i32 0) #9
  %662 = extractvalue { float, float, float, float } %661, 0
  %663 = extractvalue { float, float, float, float } %661, 1
  %664 = extractvalue { float, float, float, float } %661, 2
  %665 = extractvalue { float, float, float, float } %661, 3
  %666 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %627, float %628, float %629, float %630, i32 %411, i32 %412, i32 %413, i32 %414, i32 0, i32 0) #9
  %667 = extractvalue { float, float, float, float } %666, 0
  %668 = extractvalue { float, float, float, float } %666, 1
  %669 = extractvalue { float, float, float, float } %666, 2
  %670 = extractvalue { float, float, float, float } %666, 3
  %671 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %632, float %633, float %634, float %635, i32 %355, i32 %356, i32 %357, i32 %358, i32 0, i32 0) #9
  %672 = extractvalue { float, float, float, float } %671, 0
  %673 = extractvalue { float, float, float, float } %671, 1
  %674 = extractvalue { float, float, float, float } %671, 2
  %675 = extractvalue { float, float, float, float } %671, 3
  %676 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %637, float %638, float %639, float %640, i32 %355, i32 %356, i32 %357, i32 %358, i32 0, i32 0) #9
  %677 = extractvalue { float, float, float, float } %676, 0
  %678 = extractvalue { float, float, float, float } %676, 1
  %679 = extractvalue { float, float, float, float } %676, 2
  %680 = extractvalue { float, float, float, float } %676, 3
  %681 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %642, float %643, float %644, float %645, i32 %355, i32 %356, i32 %357, i32 %358, i32 0, i32 0) #9
  %682 = extractvalue { float, float, float, float } %681, 0
  %683 = extractvalue { float, float, float, float } %681, 1
  %684 = extractvalue { float, float, float, float } %681, 2
  %685 = extractvalue { float, float, float, float } %681, 3
  %686 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %647, float %648, float %649, float %650, i32 %355, i32 %356, i32 %357, i32 %358, i32 0, i32 0) #9
  %687 = extractvalue { float, float, float, float } %686, 0
  %688 = extractvalue { float, float, float, float } %686, 1
  %689 = extractvalue { float, float, float, float } %686, 2
  %690 = extractvalue { float, float, float, float } %686, 3
  %691 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %652, float %653, float %654, float %655, i32 %419, i32 %420, i32 %421, i32 %422, i32 0, i32 0) #9
  %692 = extractvalue { float, float, float, float } %691, 0
  %693 = extractvalue { float, float, float, float } %691, 1
  %694 = extractvalue { float, float, float, float } %691, 2
  %695 = extractvalue { float, float, float, float } %691, 3
  %696 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %657, float %658, float %659, float %660, i32 %419, i32 %420, i32 %421, i32 %422, i32 0, i32 0) #9
  %697 = extractvalue { float, float, float, float } %696, 0
  %698 = extractvalue { float, float, float, float } %696, 1
  %699 = extractvalue { float, float, float, float } %696, 2
  %700 = extractvalue { float, float, float, float } %696, 3
  %701 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %662, float %663, float %664, float %665, i32 %419, i32 %420, i32 %421, i32 %422, i32 0, i32 0) #9
  %702 = extractvalue { float, float, float, float } %701, 0
  %703 = extractvalue { float, float, float, float } %701, 1
  %704 = extractvalue { float, float, float, float } %701, 2
  %705 = extractvalue { float, float, float, float } %701, 3
  %706 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %667, float %668, float %669, float %670, i32 %419, i32 %420, i32 %421, i32 %422, i32 0, i32 0) #9
  %707 = extractvalue { float, float, float, float } %706, 0
  %708 = extractvalue { float, float, float, float } %706, 1
  %709 = extractvalue { float, float, float, float } %706, 2
  %710 = extractvalue { float, float, float, float } %706, 3
  %711 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %672, float %673, float %674, float %675, i32 %363, i32 %364, i32 %365, i32 %366, i32 0, i32 0) #9
  %712 = extractvalue { float, float, float, float } %711, 0
  %713 = extractvalue { float, float, float, float } %711, 1
  %714 = extractvalue { float, float, float, float } %711, 2
  %715 = extractvalue { float, float, float, float } %711, 3
  %716 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %677, float %678, float %679, float %680, i32 %363, i32 %364, i32 %365, i32 %366, i32 0, i32 0) #9
  %717 = extractvalue { float, float, float, float } %716, 0
  %718 = extractvalue { float, float, float, float } %716, 1
  %719 = extractvalue { float, float, float, float } %716, 2
  %720 = extractvalue { float, float, float, float } %716, 3
  %721 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %682, float %683, float %684, float %685, i32 %363, i32 %364, i32 %365, i32 %366, i32 0, i32 0) #9
  %722 = extractvalue { float, float, float, float } %721, 0
  %723 = extractvalue { float, float, float, float } %721, 1
  %724 = extractvalue { float, float, float, float } %721, 2
  %725 = extractvalue { float, float, float, float } %721, 3
  %726 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %687, float %688, float %689, float %690, i32 %363, i32 %364, i32 %365, i32 %366, i32 0, i32 0) #9
  %727 = extractvalue { float, float, float, float } %726, 0
  %728 = extractvalue { float, float, float, float } %726, 1
  %729 = extractvalue { float, float, float, float } %726, 2
  %730 = extractvalue { float, float, float, float } %726, 3
  %731 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %692, float %693, float %694, float %695, i32 %427, i32 %428, i32 %429, i32 %430, i32 0, i32 0) #9
  %732 = extractvalue { float, float, float, float } %731, 0
  %733 = extractvalue { float, float, float, float } %731, 1
  %734 = extractvalue { float, float, float, float } %731, 2
  %735 = extractvalue { float, float, float, float } %731, 3
  %736 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %697, float %698, float %699, float %700, i32 %427, i32 %428, i32 %429, i32 %430, i32 0, i32 0) #9
  %737 = extractvalue { float, float, float, float } %736, 0
  %738 = extractvalue { float, float, float, float } %736, 1
  %739 = extractvalue { float, float, float, float } %736, 2
  %740 = extractvalue { float, float, float, float } %736, 3
  %741 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %702, float %703, float %704, float %705, i32 %427, i32 %428, i32 %429, i32 %430, i32 0, i32 0) #9
  %742 = extractvalue { float, float, float, float } %741, 0
  %743 = extractvalue { float, float, float, float } %741, 1
  %744 = extractvalue { float, float, float, float } %741, 2
  %745 = extractvalue { float, float, float, float } %741, 3
  %746 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %707, float %708, float %709, float %710, i32 %427, i32 %428, i32 %429, i32 %430, i32 0, i32 0) #9
  %747 = extractvalue { float, float, float, float } %746, 0
  %748 = extractvalue { float, float, float, float } %746, 1
  %749 = extractvalue { float, float, float, float } %746, 2
  %750 = extractvalue { float, float, float, float } %746, 3
  %751 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %712, float %713, float %714, float %715, i32 %371, i32 %372, i32 %373, i32 %374, i32 0, i32 0) #9
  %752 = extractvalue { float, float, float, float } %751, 0
  %753 = extractvalue { float, float, float, float } %751, 1
  %754 = extractvalue { float, float, float, float } %751, 2
  %755 = extractvalue { float, float, float, float } %751, 3
  %756 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %717, float %718, float %719, float %720, i32 %371, i32 %372, i32 %373, i32 %374, i32 0, i32 0) #9
  %757 = extractvalue { float, float, float, float } %756, 0
  %758 = extractvalue { float, float, float, float } %756, 1
  %759 = extractvalue { float, float, float, float } %756, 2
  %760 = extractvalue { float, float, float, float } %756, 3
  %761 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %722, float %723, float %724, float %725, i32 %371, i32 %372, i32 %373, i32 %374, i32 0, i32 0) #9
  %762 = extractvalue { float, float, float, float } %761, 0
  %763 = extractvalue { float, float, float, float } %761, 1
  %764 = extractvalue { float, float, float, float } %761, 2
  %765 = extractvalue { float, float, float, float } %761, 3
  %766 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %727, float %728, float %729, float %730, i32 %371, i32 %372, i32 %373, i32 %374, i32 0, i32 0) #9
  %767 = extractvalue { float, float, float, float } %766, 0
  %768 = extractvalue { float, float, float, float } %766, 1
  %769 = extractvalue { float, float, float, float } %766, 2
  %770 = extractvalue { float, float, float, float } %766, 3
  %771 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %732, float %733, float %734, float %735, i32 %435, i32 %436, i32 %437, i32 %438, i32 0, i32 0) #9
  %772 = extractvalue { float, float, float, float } %771, 0
  %773 = extractvalue { float, float, float, float } %771, 1
  %774 = extractvalue { float, float, float, float } %771, 2
  %775 = extractvalue { float, float, float, float } %771, 3
  %776 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %737, float %738, float %739, float %740, i32 %435, i32 %436, i32 %437, i32 %438, i32 0, i32 0) #9
  %777 = extractvalue { float, float, float, float } %776, 0
  %778 = extractvalue { float, float, float, float } %776, 1
  %779 = extractvalue { float, float, float, float } %776, 2
  %780 = extractvalue { float, float, float, float } %776, 3
  %781 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %742, float %743, float %744, float %745, i32 %435, i32 %436, i32 %437, i32 %438, i32 0, i32 0) #9
  %782 = extractvalue { float, float, float, float } %781, 0
  %783 = extractvalue { float, float, float, float } %781, 1
  %784 = extractvalue { float, float, float, float } %781, 2
  %785 = extractvalue { float, float, float, float } %781, 3
  %786 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %747, float %748, float %749, float %750, i32 %435, i32 %436, i32 %437, i32 %438, i32 0, i32 0) #9
  %787 = extractvalue { float, float, float, float } %786, 0
  %788 = extractvalue { float, float, float, float } %786, 1
  %789 = extractvalue { float, float, float, float } %786, 2
  %790 = extractvalue { float, float, float, float } %786, 3
  %791 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %752, 0
  %792 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %791, float %753, 1
  %793 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %792, float %754, 2
  %794 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %793, float %755, 3
  %795 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %794, float %757, 4
  %796 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %795, float %758, 5
  %797 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %796, float %759, 6
  %798 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %797, float %760, 7
  %799 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %798, float %762, 8
  %800 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %799, float %763, 9
  %801 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %800, float %764, 10
  %802 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %801, float %765, 11
  %803 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %802, float %767, 12
  %804 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %803, float %768, 13
  %805 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %804, float %769, 14
  %806 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %805, float %770, 15
  %807 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %806, float %772, 16
  %808 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %807, float %773, 17
  %809 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %808, float %774, 18
  %810 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %809, float %775, 19
  %811 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %810, float %777, 20
  %812 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %811, float %778, 21
  %813 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %812, float %779, 22
  %814 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %813, float %780, 23
  %815 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %814, float %782, 24
  %816 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %815, float %783, 25
  %817 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %816, float %784, 26
  %818 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %817, float %785, 27
  %819 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %818, float %787, 28
  %820 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %819, float %788, 29
  %821 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %820, float %789, 30
  %822 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %821, float %790, 31
  %823 = add i32 %307, 1
  %824 = icmp slt i32 %823, 3
  %825 = select i1 %824, i32 %823, i32 0
  %scevgep280 = getelementptr i8, ptr addrspace(1) %lsr.iv278, i64 %263
  %scevgep276 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 %263
  %scevgep272 = getelementptr i8, ptr addrspace(1) %lsr.iv270, i64 %263
  %scevgep268 = getelementptr i8, ptr addrspace(1) %lsr.iv266, i64 %263
  %scevgep264 = getelementptr i8, ptr addrspace(1) %lsr.iv262, i64 %263
  %scevgep260 = getelementptr i8, ptr addrspace(1) %lsr.iv258, i64 %263
  %scevgep256 = getelementptr i8, ptr addrspace(1) %lsr.iv254, i64 %263
  %scevgep252 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %263
  %826 = shl i32 %825, 13
  %827 = sext i32 %826 to i64
  %828 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %827
  tail call void @llvm.nvvm.barrier0()
  %829 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %88
  %830 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %93
  %831 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %98
  %832 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %103
  %833 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %108
  %834 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %113
  %835 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %118
  %836 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %828, i64 %123
  %837 = select i1 %310, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %829, ptr addrspace(1) %scevgep280, i32 %837) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %830, ptr addrspace(1) %scevgep276, i32 %837) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %831, ptr addrspace(1) %scevgep272, i32 %837) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %832, ptr addrspace(1) %scevgep268, i32 %837) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %833, ptr addrspace(1) %scevgep264, i32 %837) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %834, ptr addrspace(1) %scevgep260, i32 %837) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %835, ptr addrspace(1) %scevgep256, i32 %837) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %836, ptr addrspace(1) %scevgep252, i32 %837) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %838 = add i32 %306, 1
  %839 = icmp slt i32 %838, 3
  %840 = select i1 %839, i32 %838, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %841 = shl i32 %840, 13
  %842 = sext i32 %841 to i64
  %843 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %842
  %scevgep251 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep255 = getelementptr i8, ptr addrspace(1) %lsr.iv254, i64 256
  %scevgep259 = getelementptr i8, ptr addrspace(1) %lsr.iv258, i64 256
  %scevgep263 = getelementptr i8, ptr addrspace(1) %lsr.iv262, i64 256
  %scevgep267 = getelementptr i8, ptr addrspace(1) %lsr.iv266, i64 256
  %scevgep271 = getelementptr i8, ptr addrspace(1) %lsr.iv270, i64 256
  %scevgep275 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 256
  %scevgep279 = getelementptr i8, ptr addrspace(1) %lsr.iv278, i64 256
  %844 = icmp samesign ult i32 %309, 1920
  br i1 %844, label %304, label %845

845:                                              ; preds = %304
  %846 = icmp ult i32 %19, 64
  %847 = and i32 %63, 56
  %848 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %848
  %849 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %850 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %752) #9
  %851 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %753) #9
  %852 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %754) #9
  %853 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %755) #9
  %854 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %757) #9
  %855 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %758) #9
  %856 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %759) #9
  %857 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %760) #9
  %858 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %762) #9
  %859 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %763) #9
  %860 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %764) #9
  %861 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %765) #9
  %862 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %767) #9
  %863 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %768) #9
  %864 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %769) #9
  %865 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %770) #9
  %866 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %772) #9
  %867 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %773) #9
  %868 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %774) #9
  %869 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %775) #9
  %870 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %777) #9
  %871 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %778) #9
  %872 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %779) #9
  %873 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %780) #9
  %874 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %782) #9
  %875 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %783) #9
  %876 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %784) #9
  %877 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %785) #9
  %878 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %787) #9
  %879 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %788) #9
  %880 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %789) #9
  %881 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %790) #9
  %882 = shl nsw i32 %849, 6
  %883 = sext i32 %8 to i64
  %884 = sext i32 %882 to i64
  %885 = lshr i32 %19, 3
  %886 = and i32 %885, 7
  %887 = select i1 %846, i32 0, i32 8
  %888 = or disjoint i32 %886, %887
  %889 = or disjoint i32 %888, 16
  %890 = or disjoint i32 %888, 32
  %891 = or disjoint i32 %888, 48
  %892 = zext nneg i32 %847 to i64
  %893 = zext nneg i32 %888 to i64
  %894 = zext nneg i32 %889 to i64
  %895 = zext nneg i32 %890 to i64
  %896 = zext nneg i32 %891 to i64
  %897 = or disjoint i64 %883, %892
  %898 = or disjoint i64 %884, %893
  %899 = or disjoint i64 %884, %894
  %900 = or disjoint i64 %884, %895
  %901 = or disjoint i64 %884, %896
  %902 = getelementptr bfloat, ptr addrspace(1) %arg4249, i64 %897
  %.idx = shl nsw i64 %898, 13
  %903 = getelementptr i8, ptr addrspace(1) %902, i64 %.idx
  %.idx6 = shl nsw i64 %899, 13
  %904 = getelementptr i8, ptr addrspace(1) %902, i64 %.idx6
  %.idx7 = shl nsw i64 %900, 13
  %905 = getelementptr i8, ptr addrspace(1) %902, i64 %.idx7
  %.idx8 = shl nsw i64 %901, 13
  %906 = getelementptr i8, ptr addrspace(1) %902, i64 %.idx8
  %907 = and i32 %177, 384
  %908 = lshr i32 %19, 2
  %909 = and i32 %908, 3
  %910 = or disjoint i32 %909, %907
  %911 = lshr exact i32 %20, 2
  %912 = or disjoint i32 %910, %911
  %913 = shl nuw nsw i32 %21, 4
  %914 = or disjoint i32 %912, %913
  %915 = select i1 %846, i32 0, i32 16
  %916 = or disjoint i32 %914, %915
  %917 = and i32 %63, 504
  %918 = select i1 %846, i32 0, i32 512
  %919 = or disjoint i32 %917, %918
  %920 = lshr i32 %914, 3
  %921 = add nuw nsw i32 %920, %916
  %922 = zext nneg i32 %921 to i64
  %923 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %922
  %924 = bitcast bfloat %850 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %923, <1 x i16> %924, i1 true) #9
  %925 = or disjoint i32 %916, 64
  %926 = lshr i32 %925, 3
  %927 = and i32 %926, 536870904
  %928 = zext nneg i32 %927 to i64
  %929 = zext nneg i32 %916 to i64
  %930 = add i64 %928, %929
  %931 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %930
  %932 = getelementptr inbounds i8, ptr addrspace(3) %931, i64 128
  %933 = bitcast bfloat %851 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %932, <1 x i16> %933, i1 true) #9
  %934 = zext nneg i32 %920 to i64
  %935 = add i64 %929, %934
  %936 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %935
  %937 = getelementptr inbounds i8, ptr addrspace(3) %936, i64 16
  %938 = bitcast bfloat %852 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %937, <1 x i16> %938, i1 true) #9
  %939 = or disjoint i32 %916, 72
  %940 = lshr i32 %939, 3
  %941 = and i32 %940, 536870904
  %942 = zext nneg i32 %941 to i64
  %943 = add i64 %942, %929
  %944 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %943
  %945 = getelementptr inbounds i8, ptr addrspace(3) %944, i64 144
  %946 = bitcast bfloat %853 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %945, <1 x i16> %946, i1 true) #9
  %947 = getelementptr inbounds i8, ptr addrspace(3) %936, i64 64
  %948 = bitcast bfloat %866 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %947, <1 x i16> %948, i1 true) #9
  %949 = or disjoint i32 %916, 96
  %950 = lshr i32 %949, 3
  %951 = and i32 %950, 536870904
  %952 = zext nneg i32 %951 to i64
  %953 = add i64 %952, %929
  %954 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %953
  %955 = getelementptr inbounds i8, ptr addrspace(3) %954, i64 192
  %956 = bitcast bfloat %867 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %955, <1 x i16> %956, i1 true) #9
  %957 = getelementptr inbounds i8, ptr addrspace(3) %936, i64 80
  %958 = bitcast bfloat %868 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %957, <1 x i16> %958, i1 true) #9
  %959 = or disjoint i32 %916, 104
  %960 = lshr i32 %959, 3
  %961 = and i32 %960, 536870904
  %962 = zext nneg i32 %961 to i64
  %963 = add i64 %962, %929
  %964 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %963
  %965 = getelementptr inbounds i8, ptr addrspace(3) %964, i64 208
  %966 = bitcast bfloat %869 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %965, <1 x i16> %966, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %967 = lshr exact i32 %919, 3
  %968 = and i32 %967, 120
  %969 = add nuw nsw i32 %968, %919
  %970 = zext nneg i32 %969 to i64
  %971 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %970
  %972 = load <4 x i32>, ptr addrspace(3) %971, align 16
  tail call void @llvm.nvvm.barrier0()
  %973 = bitcast bfloat %854 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %923, <1 x i16> %973, i1 true) #9
  %974 = bitcast bfloat %855 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %932, <1 x i16> %974, i1 true) #9
  %975 = bitcast bfloat %856 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %937, <1 x i16> %975, i1 true) #9
  %976 = bitcast bfloat %857 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %945, <1 x i16> %976, i1 true) #9
  %977 = bitcast bfloat %870 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %947, <1 x i16> %977, i1 true) #9
  %978 = bitcast bfloat %871 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %955, <1 x i16> %978, i1 true) #9
  %979 = bitcast bfloat %872 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %957, <1 x i16> %979, i1 true) #9
  %980 = bitcast bfloat %873 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %965, <1 x i16> %980, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %981 = load <4 x i32>, ptr addrspace(3) %971, align 16
  tail call void @llvm.nvvm.barrier0()
  %982 = bitcast bfloat %858 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %923, <1 x i16> %982, i1 true) #9
  %983 = bitcast bfloat %859 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %932, <1 x i16> %983, i1 true) #9
  %984 = bitcast bfloat %860 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %937, <1 x i16> %984, i1 true) #9
  %985 = bitcast bfloat %861 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %945, <1 x i16> %985, i1 true) #9
  %986 = bitcast bfloat %874 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %947, <1 x i16> %986, i1 true) #9
  %987 = bitcast bfloat %875 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %955, <1 x i16> %987, i1 true) #9
  %988 = bitcast bfloat %876 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %957, <1 x i16> %988, i1 true) #9
  %989 = bitcast bfloat %877 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %965, <1 x i16> %989, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %990 = load <4 x i32>, ptr addrspace(3) %971, align 16
  tail call void @llvm.nvvm.barrier0()
  %991 = bitcast bfloat %862 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %923, <1 x i16> %991, i1 true) #9
  %992 = bitcast bfloat %863 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %932, <1 x i16> %992, i1 true) #9
  %993 = bitcast bfloat %864 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %937, <1 x i16> %993, i1 true) #9
  %994 = bitcast bfloat %865 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %945, <1 x i16> %994, i1 true) #9
  %995 = bitcast bfloat %878 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %947, <1 x i16> %995, i1 true) #9
  %996 = bitcast bfloat %879 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %955, <1 x i16> %996, i1 true) #9
  %997 = bitcast bfloat %880 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %957, <1 x i16> %997, i1 true) #9
  %998 = bitcast bfloat %881 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %965, <1 x i16> %998, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %999 = load <4 x i32>, ptr addrspace(3) %971, align 16
  %.extract = extractelement <4 x i32> %972, i64 0
  %.extract57 = extractelement <4 x i32> %972, i64 1
  %.extract59 = extractelement <4 x i32> %972, i64 2
  %.extract61 = extractelement <4 x i32> %972, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract57, i32 %.extract59, i32 %.extract61, ptr addrspace(1) %903) #9
  %.extract63 = extractelement <4 x i32> %981, i64 0
  %.extract65 = extractelement <4 x i32> %981, i64 1
  %.extract67 = extractelement <4 x i32> %981, i64 2
  %.extract69 = extractelement <4 x i32> %981, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract63, i32 %.extract65, i32 %.extract67, i32 %.extract69, ptr addrspace(1) %904) #9
  %.extract71 = extractelement <4 x i32> %990, i64 0
  %.extract73 = extractelement <4 x i32> %990, i64 1
  %.extract75 = extractelement <4 x i32> %990, i64 2
  %.extract77 = extractelement <4 x i32> %990, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract71, i32 %.extract73, i32 %.extract75, i32 %.extract77, ptr addrspace(1) %905) #9
  %.extract79 = extractelement <4 x i32> %999, i64 0
  %.extract81 = extractelement <4 x i32> %999, i64 1
  %.extract83 = extractelement <4 x i32> %999, i64 2
  %.extract85 = extractelement <4 x i32> %999, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract79, i32 %.extract81, i32 %.extract83, i32 %.extract85, ptr addrspace(1) %906) #9
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_63(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 12
  %4 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 3
  %10 = and i32 %9, 248
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 256
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
  %20 = extractvalue { i32, i32, i32, i32 } %19, 0
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %19, 1
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractvalue { i32, i32, i32, i32 } %19, 2
  %25 = bitcast i32 %24 to <2 x bfloat>
  %26 = extractvalue { i32, i32, i32, i32 } %19, 3
  %27 = bitcast i32 %26 to <2 x bfloat>
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = extractelement <2 x bfloat> %25, i64 0
  %33 = extractelement <2 x bfloat> %25, i64 1
  %34 = extractelement <2 x bfloat> %27, i64 0
  %35 = extractelement <2 x bfloat> %27, i64 1
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #9
  %37 = extractvalue { i32, i32, i32, i32 } %36, 0
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractvalue { i32, i32, i32, i32 } %36, 1
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractvalue { i32, i32, i32, i32 } %36, 2
  %42 = bitcast i32 %41 to <2 x bfloat>
  %43 = extractvalue { i32, i32, i32, i32 } %36, 3
  %44 = bitcast i32 %43 to <2 x bfloat>
  %45 = extractelement <2 x bfloat> %38, i64 0
  %46 = extractelement <2 x bfloat> %38, i64 1
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = extractelement <2 x bfloat> %42, i64 0
  %50 = extractelement <2 x bfloat> %42, i64 1
  %51 = extractelement <2 x bfloat> %44, i64 0
  %52 = extractelement <2 x bfloat> %44, i64 1
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #9
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i64 0
  %83 = extractelement <2 x bfloat> %75, i64 1
  %84 = extractelement <2 x bfloat> %77, i64 0
  %85 = extractelement <2 x bfloat> %77, i64 1
  %86 = extractelement <2 x bfloat> %79, i64 0
  %87 = extractelement <2 x bfloat> %79, i64 1
  %88 = extractelement <2 x bfloat> %81, i64 0
  %89 = extractelement <2 x bfloat> %81, i64 1
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #9
  %91 = extractvalue { i32, i32, i32, i32 } %90, 0
  %92 = bitcast i32 %91 to <2 x bfloat>
  %93 = extractvalue { i32, i32, i32, i32 } %90, 1
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractvalue { i32, i32, i32, i32 } %90, 2
  %96 = bitcast i32 %95 to <2 x bfloat>
  %97 = extractvalue { i32, i32, i32, i32 } %90, 3
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractelement <2 x bfloat> %92, i64 0
  %100 = extractelement <2 x bfloat> %92, i64 1
  %101 = extractelement <2 x bfloat> %94, i64 0
  %102 = extractelement <2 x bfloat> %94, i64 1
  %103 = extractelement <2 x bfloat> %96, i64 0
  %104 = extractelement <2 x bfloat> %96, i64 1
  %105 = extractelement <2 x bfloat> %98, i64 0
  %106 = extractelement <2 x bfloat> %98, i64 1
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
  %123 = fadd float %53, %107
  %124 = fadd float %54, %108
  %125 = fadd float %55, %109
  %126 = fadd float %56, %110
  %127 = fadd float %57, %111
  %128 = fadd float %58, %112
  %129 = fadd float %59, %113
  %130 = fadd float %60, %114
  %131 = fadd float %61, %115
  %132 = fadd float %62, %116
  %133 = fadd float %63, %117
  %134 = fadd float %64, %118
  %135 = fadd float %65, %119
  %136 = fadd float %66, %120
  %137 = fadd float %67, %121
  %138 = fadd float %68, %122
  %139 = fmul float %123, %123
  %140 = fmul float %124, %124
  %141 = fmul float %125, %125
  %142 = fmul float %126, %126
  %143 = fmul float %127, %127
  %144 = fmul float %128, %128
  %145 = fmul float %129, %129
  %146 = fmul float %130, %130
  %147 = fmul float %131, %131
  %148 = fmul float %132, %132
  %149 = fmul float %133, %133
  %150 = fmul float %134, %134
  %151 = fmul float %135, %135
  %152 = fmul float %136, %136
  %153 = fmul float %137, %137
  %154 = fmul float %138, %138
  %155 = fadd float %139, %140
  %156 = fadd float %155, %141
  %157 = fadd float %156, %142
  %158 = fadd float %157, %143
  %159 = fadd float %158, %144
  %160 = fadd float %159, %145
  %161 = fadd float %160, %146
  %162 = fadd float %161, %147
  %163 = fadd float %162, %148
  %164 = fadd float %163, %149
  %165 = fadd float %164, %150
  %166 = fadd float %165, %151
  %167 = fadd float %166, %152
  %168 = fadd float %167, %153
  %169 = fadd float %168, %154
  %170 = bitcast float %169 to i32
  %171 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %170, i32 16, i32 31)
  %172 = bitcast i32 %171 to float
  %173 = fadd float %169, %172
  %174 = bitcast float %173 to i32
  %175 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %174, i32 8, i32 31)
  %176 = bitcast i32 %175 to float
  %177 = fadd float %173, %176
  %178 = bitcast float %177 to i32
  %179 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %178, i32 4, i32 31)
  %180 = bitcast i32 %179 to float
  %181 = fadd float %177, %180
  %182 = bitcast float %181 to i32
  %183 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %182, i32 2, i32 31)
  %184 = bitcast i32 %183 to float
  %185 = fadd float %181, %184
  %186 = bitcast float %185 to i32
  %187 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %186, i32 1, i32 31)
  %188 = bitcast i32 %187 to float
  %189 = fadd float %185, %188
  %190 = icmp eq i32 %7, 0
  %191 = zext nneg i32 %8 to i64
  %192 = getelementptr float, ptr addrspace(3) @global_smem, i64 %191
  %193 = bitcast float %189 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %192, <1 x i32> %193, i1 %190) #9
  tail call void @llvm.nvvm.barrier0()
  %194 = icmp samesign ult i32 %6, 2
  %195 = zext nneg i32 %6 to i64
  %196 = getelementptr float, ptr addrspace(3) @global_smem, i64 %195
  %197 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %196, i1 %194) #9
  %198 = bitcast i32 %197 to float
  %199 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %197, i32 1, i32 31)
  %200 = bitcast i32 %199 to float
  %201 = fadd float %198, %200
  %202 = icmp eq i32 %6, 0
  %203 = bitcast float %201 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %196, <1 x i32> %203, i1 %202) #9
  tail call void @llvm.nvvm.barrier0()
  %204 = load float, ptr addrspace(3) @global_smem, align 16
  %205 = fmul float %204, 0x3F50000000000000
  %206 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %207 = bitcast i32 %206 to float
  %208 = fadd float %205, %207
  %209 = tail call float @llvm.nvvm.rsqrt.approx.f(float %208)
  %210 = fmul float %123, %209
  %211 = fmul float %124, %209
  %212 = fmul float %125, %209
  %213 = fmul float %126, %209
  %214 = fmul float %127, %209
  %215 = fmul float %128, %209
  %216 = fmul float %129, %209
  %217 = fmul float %130, %209
  %218 = fmul float %131, %209
  %219 = fmul float %132, %209
  %220 = fmul float %133, %209
  %221 = fmul float %134, %209
  %222 = fmul float %135, %209
  %223 = fmul float %136, %209
  %224 = fmul float %137, %209
  %225 = fmul float %138, %209
  %226 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %14
  %227 = getelementptr i8, ptr addrspace(1) %226, i64 1024
  %228 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %226) #9
  %229 = extractvalue { i32, i32, i32, i32 } %228, 0
  %230 = bitcast i32 %229 to <2 x bfloat>
  %231 = extractvalue { i32, i32, i32, i32 } %228, 1
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %228, 2
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %228, 3
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractelement <2 x bfloat> %230, i64 0
  %238 = extractelement <2 x bfloat> %230, i64 1
  %239 = extractelement <2 x bfloat> %232, i64 0
  %240 = extractelement <2 x bfloat> %232, i64 1
  %241 = extractelement <2 x bfloat> %234, i64 0
  %242 = extractelement <2 x bfloat> %234, i64 1
  %243 = extractelement <2 x bfloat> %236, i64 0
  %244 = extractelement <2 x bfloat> %236, i64 1
  %245 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #9
  %246 = extractvalue { i32, i32, i32, i32 } %245, 0
  %247 = bitcast i32 %246 to <2 x bfloat>
  %248 = extractvalue { i32, i32, i32, i32 } %245, 1
  %249 = bitcast i32 %248 to <2 x bfloat>
  %250 = extractvalue { i32, i32, i32, i32 } %245, 2
  %251 = bitcast i32 %250 to <2 x bfloat>
  %252 = extractvalue { i32, i32, i32, i32 } %245, 3
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractelement <2 x bfloat> %247, i64 0
  %255 = extractelement <2 x bfloat> %247, i64 1
  %256 = extractelement <2 x bfloat> %249, i64 0
  %257 = extractelement <2 x bfloat> %249, i64 1
  %258 = extractelement <2 x bfloat> %251, i64 0
  %259 = extractelement <2 x bfloat> %251, i64 1
  %260 = extractelement <2 x bfloat> %253, i64 0
  %261 = extractelement <2 x bfloat> %253, i64 1
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #9
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #9
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = fmul float %210, %262
  %279 = fmul float %211, %263
  %280 = fmul float %212, %264
  %281 = fmul float %213, %265
  %282 = fmul float %214, %266
  %283 = fmul float %215, %267
  %284 = fmul float %216, %268
  %285 = fmul float %217, %269
  %286 = fmul float %218, %270
  %287 = fmul float %219, %271
  %288 = fmul float %220, %272
  %289 = fmul float %221, %273
  %290 = fmul float %222, %274
  %291 = fmul float %223, %275
  %292 = fmul float %224, %276
  %293 = fmul float %225, %277
  %294 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %278) #9
  %295 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %279) #9
  %296 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %280) #9
  %297 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %281) #9
  %298 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %282) #9
  %299 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %283) #9
  %300 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %284) #9
  %301 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %285) #9
  %302 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %286) #9
  %303 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %287) #9
  %304 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %288) #9
  %305 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %289) #9
  %306 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %290) #9
  %307 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %291) #9
  %308 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %292) #9
  %309 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %293) #9
  %310 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %311 = getelementptr bfloat, ptr addrspace(1) %310, i64 %14
  %312 = getelementptr i8, ptr addrspace(1) %311, i64 1024
  %313 = insertelement <2 x bfloat> poison, bfloat %294, i64 0
  %314 = insertelement <2 x bfloat> %313, bfloat %295, i64 1
  %315 = bitcast <2 x bfloat> %314 to i32
  %316 = insertelement <2 x bfloat> poison, bfloat %296, i64 0
  %317 = insertelement <2 x bfloat> %316, bfloat %297, i64 1
  %318 = bitcast <2 x bfloat> %317 to i32
  %319 = insertelement <2 x bfloat> poison, bfloat %298, i64 0
  %320 = insertelement <2 x bfloat> %319, bfloat %299, i64 1
  %321 = bitcast <2 x bfloat> %320 to i32
  %322 = insertelement <2 x bfloat> poison, bfloat %300, i64 0
  %323 = insertelement <2 x bfloat> %322, bfloat %301, i64 1
  %324 = bitcast <2 x bfloat> %323 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %315, i32 %318, i32 %321, i32 %324, ptr addrspace(1) %311) #9
  %325 = insertelement <2 x bfloat> poison, bfloat %302, i64 0
  %326 = insertelement <2 x bfloat> %325, bfloat %303, i64 1
  %327 = bitcast <2 x bfloat> %326 to i32
  %328 = insertelement <2 x bfloat> poison, bfloat %304, i64 0
  %329 = insertelement <2 x bfloat> %328, bfloat %305, i64 1
  %330 = bitcast <2 x bfloat> %329 to i32
  %331 = insertelement <2 x bfloat> poison, bfloat %306, i64 0
  %332 = insertelement <2 x bfloat> %331, bfloat %307, i64 1
  %333 = bitcast <2 x bfloat> %332 to i32
  %334 = insertelement <2 x bfloat> poison, bfloat %308, i64 0
  %335 = insertelement <2 x bfloat> %334, bfloat %309, i64 1
  %336 = bitcast <2 x bfloat> %335 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %327, i32 %330, i32 %333, i32 %336, ptr addrspace(1) %312) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion_3(ptr noalias readonly align 128 captures(none) dereferenceable(786432) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(393216) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %.lhs.trunc = trunc nuw nsw i32 %6 to i16
  %7 = udiv i16 %.lhs.trunc, 24
  %.zext = zext nneg i16 %7 to i32
  %8 = mul i16 %7, 24
  %.decomposed = sub i16 %.lhs.trunc, %8
  %9 = shl nuw nsw i16 %.decomposed, 7
  %10 = zext nneg i16 %9 to i32
  %11 = or disjoint i32 %5, %10
  %12 = mul nuw nsw i32 %.zext, 6144
  %13 = add nuw nsw i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %14
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !6, !alias.scope !8
  %17 = fpext bfloat %16 to float
  %18 = fneg bfloat %16
  %19 = fpext bfloat %18 to float
  %20 = fmul float %19, 0x3FF7154760000000
  %21 = tail call float @llvm.nvvm.ex2.approx.f(float %20) #9
  %22 = fptrunc float %21 to bfloat
  %23 = fpext bfloat %22 to float
  %24 = fadd float %23, 1.000000e+00
  %25 = fdiv float 1.000000e+00, %24
  %26 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 6144
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !6, !alias.scope !11
  %28 = fmul float %25, %17
  %29 = fpext bfloat %27 to float
  %30 = fmul float %28, %29
  %31 = fptrunc float %30 to bfloat
  %32 = shl nuw nsw i32 %6, 7
  %33 = or disjoint i32 %32, %5
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %34
  store bfloat %31, ptr addrspace(1) %35, align 2
  ret void
}

define ptx_kernel void @fusion_62(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(524288) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 12
  %4 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 3
  %10 = and i32 %9, 248
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 256
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 4096
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
  %20 = extractvalue { i32, i32, i32, i32 } %19, 0
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %19, 1
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractvalue { i32, i32, i32, i32 } %19, 2
  %25 = bitcast i32 %24 to <2 x bfloat>
  %26 = extractvalue { i32, i32, i32, i32 } %19, 3
  %27 = bitcast i32 %26 to <2 x bfloat>
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = extractelement <2 x bfloat> %25, i64 0
  %33 = extractelement <2 x bfloat> %25, i64 1
  %34 = extractelement <2 x bfloat> %27, i64 0
  %35 = extractelement <2 x bfloat> %27, i64 1
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #9
  %37 = extractvalue { i32, i32, i32, i32 } %36, 0
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractvalue { i32, i32, i32, i32 } %36, 1
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractvalue { i32, i32, i32, i32 } %36, 2
  %42 = bitcast i32 %41 to <2 x bfloat>
  %43 = extractvalue { i32, i32, i32, i32 } %36, 3
  %44 = bitcast i32 %43 to <2 x bfloat>
  %45 = extractelement <2 x bfloat> %38, i64 0
  %46 = extractelement <2 x bfloat> %38, i64 1
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = extractelement <2 x bfloat> %42, i64 0
  %50 = extractelement <2 x bfloat> %42, i64 1
  %51 = extractelement <2 x bfloat> %44, i64 0
  %52 = extractelement <2 x bfloat> %44, i64 1
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #9
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i64 0
  %83 = extractelement <2 x bfloat> %75, i64 1
  %84 = extractelement <2 x bfloat> %77, i64 0
  %85 = extractelement <2 x bfloat> %77, i64 1
  %86 = extractelement <2 x bfloat> %79, i64 0
  %87 = extractelement <2 x bfloat> %79, i64 1
  %88 = extractelement <2 x bfloat> %81, i64 0
  %89 = extractelement <2 x bfloat> %81, i64 1
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #9
  %91 = extractvalue { i32, i32, i32, i32 } %90, 0
  %92 = bitcast i32 %91 to <2 x bfloat>
  %93 = extractvalue { i32, i32, i32, i32 } %90, 1
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractvalue { i32, i32, i32, i32 } %90, 2
  %96 = bitcast i32 %95 to <2 x bfloat>
  %97 = extractvalue { i32, i32, i32, i32 } %90, 3
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractelement <2 x bfloat> %92, i64 0
  %100 = extractelement <2 x bfloat> %92, i64 1
  %101 = extractelement <2 x bfloat> %94, i64 0
  %102 = extractelement <2 x bfloat> %94, i64 1
  %103 = extractelement <2 x bfloat> %96, i64 0
  %104 = extractelement <2 x bfloat> %96, i64 1
  %105 = extractelement <2 x bfloat> %98, i64 0
  %106 = extractelement <2 x bfloat> %98, i64 1
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %127, 1
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %127, 2
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractvalue { i32, i32, i32, i32 } %127, 3
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractelement <2 x bfloat> %129, i64 0
  %137 = extractelement <2 x bfloat> %129, i64 1
  %138 = extractelement <2 x bfloat> %131, i64 0
  %139 = extractelement <2 x bfloat> %131, i64 1
  %140 = extractelement <2 x bfloat> %133, i64 0
  %141 = extractelement <2 x bfloat> %133, i64 1
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
  %145 = extractvalue { i32, i32, i32, i32 } %144, 0
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractvalue { i32, i32, i32, i32 } %144, 1
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractvalue { i32, i32, i32, i32 } %144, 2
  %150 = bitcast i32 %149 to <2 x bfloat>
  %151 = extractvalue { i32, i32, i32, i32 } %144, 3
  %152 = bitcast i32 %151 to <2 x bfloat>
  %153 = extractelement <2 x bfloat> %146, i64 0
  %154 = extractelement <2 x bfloat> %146, i64 1
  %155 = extractelement <2 x bfloat> %148, i64 0
  %156 = extractelement <2 x bfloat> %148, i64 1
  %157 = extractelement <2 x bfloat> %150, i64 0
  %158 = extractelement <2 x bfloat> %150, i64 1
  %159 = extractelement <2 x bfloat> %152, i64 0
  %160 = extractelement <2 x bfloat> %152, i64 1
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #9
  %177 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
  %181 = extractvalue { i32, i32, i32, i32 } %180, 0
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %180, 1
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractvalue { i32, i32, i32, i32 } %180, 2
  %186 = bitcast i32 %185 to <2 x bfloat>
  %187 = extractvalue { i32, i32, i32, i32 } %180, 3
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractelement <2 x bfloat> %182, i64 0
  %190 = extractelement <2 x bfloat> %182, i64 1
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = extractelement <2 x bfloat> %186, i64 0
  %194 = extractelement <2 x bfloat> %186, i64 1
  %195 = extractelement <2 x bfloat> %188, i64 0
  %196 = extractelement <2 x bfloat> %188, i64 1
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #9
  %198 = extractvalue { i32, i32, i32, i32 } %197, 0
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %197, 1
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractvalue { i32, i32, i32, i32 } %197, 2
  %203 = bitcast i32 %202 to <2 x bfloat>
  %204 = extractvalue { i32, i32, i32, i32 } %197, 3
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = extractelement <2 x bfloat> %203, i64 0
  %211 = extractelement <2 x bfloat> %203, i64 1
  %212 = extractelement <2 x bfloat> %205, i64 0
  %213 = extractelement <2 x bfloat> %205, i64 1
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #9
  %230 = fadd float %161, %214
  %231 = fadd float %162, %215
  %232 = fadd float %163, %216
  %233 = fadd float %164, %217
  %234 = fadd float %165, %218
  %235 = fadd float %166, %219
  %236 = fadd float %167, %220
  %237 = fadd float %168, %221
  %238 = fadd float %169, %222
  %239 = fadd float %170, %223
  %240 = fadd float %171, %224
  %241 = fadd float %172, %225
  %242 = fadd float %173, %226
  %243 = fadd float %174, %227
  %244 = fadd float %175, %228
  %245 = fadd float %176, %229
  %246 = fadd float %107, %230
  %247 = fadd float %108, %231
  %248 = fadd float %109, %232
  %249 = fadd float %110, %233
  %250 = fadd float %111, %234
  %251 = fadd float %112, %235
  %252 = fadd float %113, %236
  %253 = fadd float %114, %237
  %254 = fadd float %115, %238
  %255 = fadd float %116, %239
  %256 = fadd float %117, %240
  %257 = fadd float %118, %241
  %258 = fadd float %119, %242
  %259 = fadd float %120, %243
  %260 = fadd float %121, %244
  %261 = fadd float %122, %245
  %262 = fadd float %53, %246
  %263 = fadd float %54, %247
  %264 = fadd float %55, %248
  %265 = fadd float %56, %249
  %266 = fadd float %57, %250
  %267 = fadd float %58, %251
  %268 = fadd float %59, %252
  %269 = fadd float %60, %253
  %270 = fadd float %61, %254
  %271 = fadd float %62, %255
  %272 = fadd float %63, %256
  %273 = fadd float %64, %257
  %274 = fadd float %65, %258
  %275 = fadd float %66, %259
  %276 = fadd float %67, %260
  %277 = fadd float %68, %261
  %278 = fmul float %262, %262
  %279 = fmul float %263, %263
  %280 = fmul float %264, %264
  %281 = fmul float %265, %265
  %282 = fmul float %266, %266
  %283 = fmul float %267, %267
  %284 = fmul float %268, %268
  %285 = fmul float %269, %269
  %286 = fmul float %270, %270
  %287 = fmul float %271, %271
  %288 = fmul float %272, %272
  %289 = fmul float %273, %273
  %290 = fmul float %274, %274
  %291 = fmul float %275, %275
  %292 = fmul float %276, %276
  %293 = fmul float %277, %277
  %294 = fadd float %278, %279
  %295 = fadd float %294, %280
  %296 = fadd float %295, %281
  %297 = fadd float %296, %282
  %298 = fadd float %297, %283
  %299 = fadd float %298, %284
  %300 = fadd float %299, %285
  %301 = fadd float %300, %286
  %302 = fadd float %301, %287
  %303 = fadd float %302, %288
  %304 = fadd float %303, %289
  %305 = fadd float %304, %290
  %306 = fadd float %305, %291
  %307 = fadd float %306, %292
  %308 = fadd float %307, %293
  %309 = bitcast float %308 to i32
  %310 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %309, i32 16, i32 31)
  %311 = bitcast i32 %310 to float
  %312 = fadd float %308, %311
  %313 = bitcast float %312 to i32
  %314 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %313, i32 8, i32 31)
  %315 = bitcast i32 %314 to float
  %316 = fadd float %312, %315
  %317 = bitcast float %316 to i32
  %318 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %317, i32 4, i32 31)
  %319 = bitcast i32 %318 to float
  %320 = fadd float %316, %319
  %321 = bitcast float %320 to i32
  %322 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %321, i32 2, i32 31)
  %323 = bitcast i32 %322 to float
  %324 = fadd float %320, %323
  %325 = bitcast float %324 to i32
  %326 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %325, i32 1, i32 31)
  %327 = bitcast i32 %326 to float
  %328 = fadd float %324, %327
  %329 = icmp eq i32 %7, 0
  %330 = zext nneg i32 %8 to i64
  %331 = getelementptr float, ptr addrspace(3) @global_smem, i64 %330
  %332 = bitcast float %328 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %331, <1 x i32> %332, i1 %329) #9
  tail call void @llvm.nvvm.barrier0()
  %333 = icmp samesign ult i32 %6, 2
  %334 = zext nneg i32 %6 to i64
  %335 = getelementptr float, ptr addrspace(3) @global_smem, i64 %334
  %336 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %335, i1 %333) #9
  %337 = bitcast i32 %336 to float
  %338 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %336, i32 1, i32 31)
  %339 = bitcast i32 %338 to float
  %340 = fadd float %337, %339
  %341 = icmp eq i32 %6, 0
  %342 = bitcast float %340 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %335, <1 x i32> %342, i1 %341) #9
  tail call void @llvm.nvvm.barrier0()
  %343 = load float, ptr addrspace(3) @global_smem, align 16
  %344 = fmul float %343, 0x3F50000000000000
  %345 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %346 = bitcast i32 %345 to float
  %347 = fadd float %344, %346
  %348 = tail call float @llvm.nvvm.rsqrt.approx.f(float %347)
  %349 = fmul float %262, %348
  %350 = fmul float %263, %348
  %351 = fmul float %264, %348
  %352 = fmul float %265, %348
  %353 = fmul float %266, %348
  %354 = fmul float %267, %348
  %355 = fmul float %268, %348
  %356 = fmul float %269, %348
  %357 = fmul float %270, %348
  %358 = fmul float %271, %348
  %359 = fmul float %272, %348
  %360 = fmul float %273, %348
  %361 = fmul float %274, %348
  %362 = fmul float %275, %348
  %363 = fmul float %276, %348
  %364 = fmul float %277, %348
  %365 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %14
  %366 = getelementptr i8, ptr addrspace(1) %365, i64 1024
  %367 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %365) #9
  %368 = extractvalue { i32, i32, i32, i32 } %367, 0
  %369 = bitcast i32 %368 to <2 x bfloat>
  %370 = extractvalue { i32, i32, i32, i32 } %367, 1
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %367, 2
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %367, 3
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractelement <2 x bfloat> %369, i64 0
  %377 = extractelement <2 x bfloat> %369, i64 1
  %378 = extractelement <2 x bfloat> %371, i64 0
  %379 = extractelement <2 x bfloat> %371, i64 1
  %380 = extractelement <2 x bfloat> %373, i64 0
  %381 = extractelement <2 x bfloat> %373, i64 1
  %382 = extractelement <2 x bfloat> %375, i64 0
  %383 = extractelement <2 x bfloat> %375, i64 1
  %384 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %366) #9
  %385 = extractvalue { i32, i32, i32, i32 } %384, 0
  %386 = bitcast i32 %385 to <2 x bfloat>
  %387 = extractvalue { i32, i32, i32, i32 } %384, 1
  %388 = bitcast i32 %387 to <2 x bfloat>
  %389 = extractvalue { i32, i32, i32, i32 } %384, 2
  %390 = bitcast i32 %389 to <2 x bfloat>
  %391 = extractvalue { i32, i32, i32, i32 } %384, 3
  %392 = bitcast i32 %391 to <2 x bfloat>
  %393 = extractelement <2 x bfloat> %386, i64 0
  %394 = extractelement <2 x bfloat> %386, i64 1
  %395 = extractelement <2 x bfloat> %388, i64 0
  %396 = extractelement <2 x bfloat> %388, i64 1
  %397 = extractelement <2 x bfloat> %390, i64 0
  %398 = extractelement <2 x bfloat> %390, i64 1
  %399 = extractelement <2 x bfloat> %392, i64 0
  %400 = extractelement <2 x bfloat> %392, i64 1
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #9
  %402 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #9
  %403 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #9
  %404 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #9
  %405 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #9
  %406 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #9
  %407 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382) #9
  %408 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383) #9
  %409 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393) #9
  %410 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394) #9
  %411 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %395) #9
  %412 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396) #9
  %413 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397) #9
  %414 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398) #9
  %415 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399) #9
  %416 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #9
  %417 = fmul float %349, %401
  %418 = fmul float %350, %402
  %419 = fmul float %351, %403
  %420 = fmul float %352, %404
  %421 = fmul float %353, %405
  %422 = fmul float %354, %406
  %423 = fmul float %355, %407
  %424 = fmul float %356, %408
  %425 = fmul float %357, %409
  %426 = fmul float %358, %410
  %427 = fmul float %359, %411
  %428 = fmul float %360, %412
  %429 = fmul float %361, %413
  %430 = fmul float %362, %414
  %431 = fmul float %363, %415
  %432 = fmul float %364, %416
  %433 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417) #9
  %434 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %418) #9
  %435 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %419) #9
  %436 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %420) #9
  %437 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %421) #9
  %438 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %422) #9
  %439 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %423) #9
  %440 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %424) #9
  %441 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %425) #9
  %442 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %426) #9
  %443 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %427) #9
  %444 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %428) #9
  %445 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %429) #9
  %446 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %430) #9
  %447 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %431) #9
  %448 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %432) #9
  %449 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %450 = getelementptr bfloat, ptr addrspace(1) %449, i64 %14
  %451 = getelementptr i8, ptr addrspace(1) %450, i64 1024
  %452 = insertelement <2 x bfloat> poison, bfloat %433, i64 0
  %453 = insertelement <2 x bfloat> %452, bfloat %434, i64 1
  %454 = bitcast <2 x bfloat> %453 to i32
  %455 = insertelement <2 x bfloat> poison, bfloat %435, i64 0
  %456 = insertelement <2 x bfloat> %455, bfloat %436, i64 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> poison, bfloat %437, i64 0
  %459 = insertelement <2 x bfloat> %458, bfloat %438, i64 1
  %460 = bitcast <2 x bfloat> %459 to i32
  %461 = insertelement <2 x bfloat> poison, bfloat %439, i64 0
  %462 = insertelement <2 x bfloat> %461, bfloat %440, i64 1
  %463 = bitcast <2 x bfloat> %462 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %454, i32 %457, i32 %460, i32 %463, ptr addrspace(1) %450) #9
  %464 = insertelement <2 x bfloat> poison, bfloat %441, i64 0
  %465 = insertelement <2 x bfloat> %464, bfloat %442, i64 1
  %466 = bitcast <2 x bfloat> %465 to i32
  %467 = insertelement <2 x bfloat> poison, bfloat %443, i64 0
  %468 = insertelement <2 x bfloat> %467, bfloat %444, i64 1
  %469 = bitcast <2 x bfloat> %468 to i32
  %470 = insertelement <2 x bfloat> poison, bfloat %445, i64 0
  %471 = insertelement <2 x bfloat> %470, bfloat %446, i64 1
  %472 = bitcast <2 x bfloat> %471 to i32
  %473 = insertelement <2 x bfloat> poison, bfloat %447, i64 0
  %474 = insertelement <2 x bfloat> %473, bfloat %448, i64 1
  %475 = bitcast <2 x bfloat> %474 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %466, i32 %469, i32 %472, i32 %475, ptr addrspace(1) %451) #9
  ret void
}

define ptx_kernel void @fusion_61(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) local_unnamed_addr #5 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 12
  %4 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 2048
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 3
  %10 = and i32 %9, 248
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 256
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 2048
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
  %20 = extractvalue { i32, i32, i32, i32 } %19, 0
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %19, 1
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractvalue { i32, i32, i32, i32 } %19, 2
  %25 = bitcast i32 %24 to <2 x bfloat>
  %26 = extractvalue { i32, i32, i32, i32 } %19, 3
  %27 = bitcast i32 %26 to <2 x bfloat>
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = extractelement <2 x bfloat> %25, i64 0
  %33 = extractelement <2 x bfloat> %25, i64 1
  %34 = extractelement <2 x bfloat> %27, i64 0
  %35 = extractelement <2 x bfloat> %27, i64 1
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #9
  %37 = extractvalue { i32, i32, i32, i32 } %36, 0
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractvalue { i32, i32, i32, i32 } %36, 1
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractvalue { i32, i32, i32, i32 } %36, 2
  %42 = bitcast i32 %41 to <2 x bfloat>
  %43 = extractvalue { i32, i32, i32, i32 } %36, 3
  %44 = bitcast i32 %43 to <2 x bfloat>
  %45 = extractelement <2 x bfloat> %38, i64 0
  %46 = extractelement <2 x bfloat> %38, i64 1
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = extractelement <2 x bfloat> %42, i64 0
  %50 = extractelement <2 x bfloat> %42, i64 1
  %51 = extractelement <2 x bfloat> %44, i64 0
  %52 = extractelement <2 x bfloat> %44, i64 1
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #9
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i64 0
  %83 = extractelement <2 x bfloat> %75, i64 1
  %84 = extractelement <2 x bfloat> %77, i64 0
  %85 = extractelement <2 x bfloat> %77, i64 1
  %86 = extractelement <2 x bfloat> %79, i64 0
  %87 = extractelement <2 x bfloat> %79, i64 1
  %88 = extractelement <2 x bfloat> %81, i64 0
  %89 = extractelement <2 x bfloat> %81, i64 1
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #9
  %91 = extractvalue { i32, i32, i32, i32 } %90, 0
  %92 = bitcast i32 %91 to <2 x bfloat>
  %93 = extractvalue { i32, i32, i32, i32 } %90, 1
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractvalue { i32, i32, i32, i32 } %90, 2
  %96 = bitcast i32 %95 to <2 x bfloat>
  %97 = extractvalue { i32, i32, i32, i32 } %90, 3
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractelement <2 x bfloat> %92, i64 0
  %100 = extractelement <2 x bfloat> %92, i64 1
  %101 = extractelement <2 x bfloat> %94, i64 0
  %102 = extractelement <2 x bfloat> %94, i64 1
  %103 = extractelement <2 x bfloat> %96, i64 0
  %104 = extractelement <2 x bfloat> %96, i64 1
  %105 = extractelement <2 x bfloat> %98, i64 0
  %106 = extractelement <2 x bfloat> %98, i64 1
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 4096
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %127, 1
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %127, 2
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractvalue { i32, i32, i32, i32 } %127, 3
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractelement <2 x bfloat> %129, i64 0
  %137 = extractelement <2 x bfloat> %129, i64 1
  %138 = extractelement <2 x bfloat> %131, i64 0
  %139 = extractelement <2 x bfloat> %131, i64 1
  %140 = extractelement <2 x bfloat> %133, i64 0
  %141 = extractelement <2 x bfloat> %133, i64 1
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
  %145 = extractvalue { i32, i32, i32, i32 } %144, 0
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractvalue { i32, i32, i32, i32 } %144, 1
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractvalue { i32, i32, i32, i32 } %144, 2
  %150 = bitcast i32 %149 to <2 x bfloat>
  %151 = extractvalue { i32, i32, i32, i32 } %144, 3
  %152 = bitcast i32 %151 to <2 x bfloat>
  %153 = extractelement <2 x bfloat> %146, i64 0
  %154 = extractelement <2 x bfloat> %146, i64 1
  %155 = extractelement <2 x bfloat> %148, i64 0
  %156 = extractelement <2 x bfloat> %148, i64 1
  %157 = extractelement <2 x bfloat> %150, i64 0
  %158 = extractelement <2 x bfloat> %150, i64 1
  %159 = extractelement <2 x bfloat> %152, i64 0
  %160 = extractelement <2 x bfloat> %152, i64 1
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #9
  %177 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
  %181 = extractvalue { i32, i32, i32, i32 } %180, 0
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %180, 1
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractvalue { i32, i32, i32, i32 } %180, 2
  %186 = bitcast i32 %185 to <2 x bfloat>
  %187 = extractvalue { i32, i32, i32, i32 } %180, 3
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractelement <2 x bfloat> %182, i64 0
  %190 = extractelement <2 x bfloat> %182, i64 1
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = extractelement <2 x bfloat> %186, i64 0
  %194 = extractelement <2 x bfloat> %186, i64 1
  %195 = extractelement <2 x bfloat> %188, i64 0
  %196 = extractelement <2 x bfloat> %188, i64 1
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #9
  %198 = extractvalue { i32, i32, i32, i32 } %197, 0
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %197, 1
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractvalue { i32, i32, i32, i32 } %197, 2
  %203 = bitcast i32 %202 to <2 x bfloat>
  %204 = extractvalue { i32, i32, i32, i32 } %197, 3
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = extractelement <2 x bfloat> %203, i64 0
  %211 = extractelement <2 x bfloat> %203, i64 1
  %212 = extractelement <2 x bfloat> %205, i64 0
  %213 = extractelement <2 x bfloat> %205, i64 1
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #9
  %230 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %231 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %232 = getelementptr bfloat, ptr addrspace(1) %230, i64 %14
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 1024
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %234, 1
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractvalue { i32, i32, i32, i32 } %234, 2
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = extractvalue { i32, i32, i32, i32 } %234, 3
  %242 = bitcast i32 %241 to <2 x bfloat>
  %243 = extractelement <2 x bfloat> %236, i64 0
  %244 = extractelement <2 x bfloat> %236, i64 1
  %245 = extractelement <2 x bfloat> %238, i64 0
  %246 = extractelement <2 x bfloat> %238, i64 1
  %247 = extractelement <2 x bfloat> %240, i64 0
  %248 = extractelement <2 x bfloat> %240, i64 1
  %249 = extractelement <2 x bfloat> %242, i64 0
  %250 = extractelement <2 x bfloat> %242, i64 1
  %251 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #9
  %252 = extractvalue { i32, i32, i32, i32 } %251, 0
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractvalue { i32, i32, i32, i32 } %251, 1
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractvalue { i32, i32, i32, i32 } %251, 2
  %257 = bitcast i32 %256 to <2 x bfloat>
  %258 = extractvalue { i32, i32, i32, i32 } %251, 3
  %259 = bitcast i32 %258 to <2 x bfloat>
  %260 = extractelement <2 x bfloat> %253, i64 0
  %261 = extractelement <2 x bfloat> %253, i64 1
  %262 = extractelement <2 x bfloat> %255, i64 0
  %263 = extractelement <2 x bfloat> %255, i64 1
  %264 = extractelement <2 x bfloat> %257, i64 0
  %265 = extractelement <2 x bfloat> %257, i64 1
  %266 = extractelement <2 x bfloat> %259, i64 0
  %267 = extractelement <2 x bfloat> %259, i64 1
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #9
  %284 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %285 = getelementptr bfloat, ptr addrspace(1) %284, i64 %14
  %286 = getelementptr i8, ptr addrspace(1) %285, i64 1024
  %287 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
  %288 = extractvalue { i32, i32, i32, i32 } %287, 0
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %287, 1
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractvalue { i32, i32, i32, i32 } %287, 2
  %293 = bitcast i32 %292 to <2 x bfloat>
  %294 = extractvalue { i32, i32, i32, i32 } %287, 3
  %295 = bitcast i32 %294 to <2 x bfloat>
  %296 = extractelement <2 x bfloat> %289, i64 0
  %297 = extractelement <2 x bfloat> %289, i64 1
  %298 = extractelement <2 x bfloat> %291, i64 0
  %299 = extractelement <2 x bfloat> %291, i64 1
  %300 = extractelement <2 x bfloat> %293, i64 0
  %301 = extractelement <2 x bfloat> %293, i64 1
  %302 = extractelement <2 x bfloat> %295, i64 0
  %303 = extractelement <2 x bfloat> %295, i64 1
  %304 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %286) #9
  %305 = extractvalue { i32, i32, i32, i32 } %304, 0
  %306 = bitcast i32 %305 to <2 x bfloat>
  %307 = extractvalue { i32, i32, i32, i32 } %304, 1
  %308 = bitcast i32 %307 to <2 x bfloat>
  %309 = extractvalue { i32, i32, i32, i32 } %304, 2
  %310 = bitcast i32 %309 to <2 x bfloat>
  %311 = extractvalue { i32, i32, i32, i32 } %304, 3
  %312 = bitcast i32 %311 to <2 x bfloat>
  %313 = extractelement <2 x bfloat> %306, i64 0
  %314 = extractelement <2 x bfloat> %306, i64 1
  %315 = extractelement <2 x bfloat> %308, i64 0
  %316 = extractelement <2 x bfloat> %308, i64 1
  %317 = extractelement <2 x bfloat> %310, i64 0
  %318 = extractelement <2 x bfloat> %310, i64 1
  %319 = extractelement <2 x bfloat> %312, i64 0
  %320 = extractelement <2 x bfloat> %312, i64 1
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #9
  %337 = fadd float %268, %321
  %338 = fadd float %269, %322
  %339 = fadd float %270, %323
  %340 = fadd float %271, %324
  %341 = fadd float %272, %325
  %342 = fadd float %273, %326
  %343 = fadd float %274, %327
  %344 = fadd float %275, %328
  %345 = fadd float %276, %329
  %346 = fadd float %277, %330
  %347 = fadd float %278, %331
  %348 = fadd float %279, %332
  %349 = fadd float %280, %333
  %350 = fadd float %281, %334
  %351 = fadd float %282, %335
  %352 = fadd float %283, %336
  %353 = fadd float %214, %337
  %354 = fadd float %215, %338
  %355 = fadd float %216, %339
  %356 = fadd float %217, %340
  %357 = fadd float %218, %341
  %358 = fadd float %219, %342
  %359 = fadd float %220, %343
  %360 = fadd float %221, %344
  %361 = fadd float %222, %345
  %362 = fadd float %223, %346
  %363 = fadd float %224, %347
  %364 = fadd float %225, %348
  %365 = fadd float %226, %349
  %366 = fadd float %227, %350
  %367 = fadd float %228, %351
  %368 = fadd float %229, %352
  %369 = fadd float %161, %353
  %370 = fadd float %162, %354
  %371 = fadd float %163, %355
  %372 = fadd float %164, %356
  %373 = fadd float %165, %357
  %374 = fadd float %166, %358
  %375 = fadd float %167, %359
  %376 = fadd float %168, %360
  %377 = fadd float %169, %361
  %378 = fadd float %170, %362
  %379 = fadd float %171, %363
  %380 = fadd float %172, %364
  %381 = fadd float %173, %365
  %382 = fadd float %174, %366
  %383 = fadd float %175, %367
  %384 = fadd float %176, %368
  %385 = fadd float %107, %369
  %386 = fadd float %108, %370
  %387 = fadd float %109, %371
  %388 = fadd float %110, %372
  %389 = fadd float %111, %373
  %390 = fadd float %112, %374
  %391 = fadd float %113, %375
  %392 = fadd float %114, %376
  %393 = fadd float %115, %377
  %394 = fadd float %116, %378
  %395 = fadd float %117, %379
  %396 = fadd float %118, %380
  %397 = fadd float %119, %381
  %398 = fadd float %120, %382
  %399 = fadd float %121, %383
  %400 = fadd float %122, %384
  %401 = fadd float %53, %385
  %402 = fadd float %54, %386
  %403 = fadd float %55, %387
  %404 = fadd float %56, %388
  %405 = fadd float %57, %389
  %406 = fadd float %58, %390
  %407 = fadd float %59, %391
  %408 = fadd float %60, %392
  %409 = fadd float %61, %393
  %410 = fadd float %62, %394
  %411 = fadd float %63, %395
  %412 = fadd float %64, %396
  %413 = fadd float %65, %397
  %414 = fadd float %66, %398
  %415 = fadd float %67, %399
  %416 = fadd float %68, %400
  %417 = fmul float %401, %401
  %418 = fmul float %402, %402
  %419 = fmul float %403, %403
  %420 = fmul float %404, %404
  %421 = fmul float %405, %405
  %422 = fmul float %406, %406
  %423 = fmul float %407, %407
  %424 = fmul float %408, %408
  %425 = fmul float %409, %409
  %426 = fmul float %410, %410
  %427 = fmul float %411, %411
  %428 = fmul float %412, %412
  %429 = fmul float %413, %413
  %430 = fmul float %414, %414
  %431 = fmul float %415, %415
  %432 = fmul float %416, %416
  %433 = fadd float %417, %418
  %434 = fadd float %433, %419
  %435 = fadd float %434, %420
  %436 = fadd float %435, %421
  %437 = fadd float %436, %422
  %438 = fadd float %437, %423
  %439 = fadd float %438, %424
  %440 = fadd float %439, %425
  %441 = fadd float %440, %426
  %442 = fadd float %441, %427
  %443 = fadd float %442, %428
  %444 = fadd float %443, %429
  %445 = fadd float %444, %430
  %446 = fadd float %445, %431
  %447 = fadd float %446, %432
  %448 = bitcast float %447 to i32
  %449 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %448, i32 16, i32 31)
  %450 = bitcast i32 %449 to float
  %451 = fadd float %447, %450
  %452 = bitcast float %451 to i32
  %453 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %452, i32 8, i32 31)
  %454 = bitcast i32 %453 to float
  %455 = fadd float %451, %454
  %456 = bitcast float %455 to i32
  %457 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %456, i32 4, i32 31)
  %458 = bitcast i32 %457 to float
  %459 = fadd float %455, %458
  %460 = bitcast float %459 to i32
  %461 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %460, i32 2, i32 31)
  %462 = bitcast i32 %461 to float
  %463 = fadd float %459, %462
  %464 = bitcast float %463 to i32
  %465 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %464, i32 1, i32 31)
  %466 = bitcast i32 %465 to float
  %467 = fadd float %463, %466
  %468 = icmp eq i32 %7, 0
  %469 = zext nneg i32 %8 to i64
  %470 = getelementptr float, ptr addrspace(3) @global_smem, i64 %469
  %471 = bitcast float %467 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %470, <1 x i32> %471, i1 %468) #9
  tail call void @llvm.nvvm.barrier0()
  %472 = icmp samesign ult i32 %6, 2
  %473 = zext nneg i32 %6 to i64
  %474 = getelementptr float, ptr addrspace(3) @global_smem, i64 %473
  %475 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %474, i1 %472) #9
  %476 = bitcast i32 %475 to float
  %477 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %475, i32 1, i32 31)
  %478 = bitcast i32 %477 to float
  %479 = fadd float %476, %478
  %480 = icmp eq i32 %6, 0
  %481 = bitcast float %479 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %474, <1 x i32> %481, i1 %480) #9
  tail call void @llvm.nvvm.barrier0()
  %482 = load float, ptr addrspace(3) @global_smem, align 16
  %483 = fmul float %482, 0x3F50000000000000
  %484 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %485 = bitcast i32 %484 to float
  %486 = fadd float %483, %485
  %487 = tail call float @llvm.nvvm.rsqrt.approx.f(float %486)
  %488 = fmul float %401, %487
  %489 = fmul float %402, %487
  %490 = fmul float %403, %487
  %491 = fmul float %404, %487
  %492 = fmul float %405, %487
  %493 = fmul float %406, %487
  %494 = fmul float %407, %487
  %495 = fmul float %408, %487
  %496 = fmul float %409, %487
  %497 = fmul float %410, %487
  %498 = fmul float %411, %487
  %499 = fmul float %412, %487
  %500 = fmul float %413, %487
  %501 = fmul float %414, %487
  %502 = fmul float %415, %487
  %503 = fmul float %416, %487
  %504 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %14
  %505 = getelementptr i8, ptr addrspace(1) %504, i64 1024
  %506 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %504) #9
  %507 = extractvalue { i32, i32, i32, i32 } %506, 0
  %508 = bitcast i32 %507 to <2 x bfloat>
  %509 = extractvalue { i32, i32, i32, i32 } %506, 1
  %510 = bitcast i32 %509 to <2 x bfloat>
  %511 = extractvalue { i32, i32, i32, i32 } %506, 2
  %512 = bitcast i32 %511 to <2 x bfloat>
  %513 = extractvalue { i32, i32, i32, i32 } %506, 3
  %514 = bitcast i32 %513 to <2 x bfloat>
  %515 = extractelement <2 x bfloat> %508, i64 0
  %516 = extractelement <2 x bfloat> %508, i64 1
  %517 = extractelement <2 x bfloat> %510, i64 0
  %518 = extractelement <2 x bfloat> %510, i64 1
  %519 = extractelement <2 x bfloat> %512, i64 0
  %520 = extractelement <2 x bfloat> %512, i64 1
  %521 = extractelement <2 x bfloat> %514, i64 0
  %522 = extractelement <2 x bfloat> %514, i64 1
  %523 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %505) #9
  %524 = extractvalue { i32, i32, i32, i32 } %523, 0
  %525 = bitcast i32 %524 to <2 x bfloat>
  %526 = extractvalue { i32, i32, i32, i32 } %523, 1
  %527 = bitcast i32 %526 to <2 x bfloat>
  %528 = extractvalue { i32, i32, i32, i32 } %523, 2
  %529 = bitcast i32 %528 to <2 x bfloat>
  %530 = extractvalue { i32, i32, i32, i32 } %523, 3
  %531 = bitcast i32 %530 to <2 x bfloat>
  %532 = extractelement <2 x bfloat> %525, i64 0
  %533 = extractelement <2 x bfloat> %525, i64 1
  %534 = extractelement <2 x bfloat> %527, i64 0
  %535 = extractelement <2 x bfloat> %527, i64 1
  %536 = extractelement <2 x bfloat> %529, i64 0
  %537 = extractelement <2 x bfloat> %529, i64 1
  %538 = extractelement <2 x bfloat> %531, i64 0
  %539 = extractelement <2 x bfloat> %531, i64 1
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #9
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #9
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #9
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #9
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #9
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #9
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #9
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #9
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #9
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #9
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #9
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #9
  %552 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %536) #9
  %553 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %537) #9
  %554 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %538) #9
  %555 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %539) #9
  %556 = fmul float %488, %540
  %557 = fmul float %489, %541
  %558 = fmul float %490, %542
  %559 = fmul float %491, %543
  %560 = fmul float %492, %544
  %561 = fmul float %493, %545
  %562 = fmul float %494, %546
  %563 = fmul float %495, %547
  %564 = fmul float %496, %548
  %565 = fmul float %497, %549
  %566 = fmul float %498, %550
  %567 = fmul float %499, %551
  %568 = fmul float %500, %552
  %569 = fmul float %501, %553
  %570 = fmul float %502, %554
  %571 = fmul float %503, %555
  %572 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %556) #9
  %573 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %557) #9
  %574 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %558) #9
  %575 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %559) #9
  %576 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %560) #9
  %577 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %561) #9
  %578 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %562) #9
  %579 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %563) #9
  %580 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %564) #9
  %581 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %565) #9
  %582 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %566) #9
  %583 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %567) #9
  %584 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %568) #9
  %585 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %569) #9
  %586 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %570) #9
  %587 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %571) #9
  %588 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %69
  %589 = getelementptr bfloat, ptr addrspace(1) %588, i64 %14
  %590 = getelementptr i8, ptr addrspace(1) %589, i64 1024
  %591 = insertelement <2 x bfloat> poison, bfloat %572, i64 0
  %592 = insertelement <2 x bfloat> %591, bfloat %573, i64 1
  %593 = bitcast <2 x bfloat> %592 to i32
  %594 = insertelement <2 x bfloat> poison, bfloat %574, i64 0
  %595 = insertelement <2 x bfloat> %594, bfloat %575, i64 1
  %596 = bitcast <2 x bfloat> %595 to i32
  %597 = insertelement <2 x bfloat> poison, bfloat %576, i64 0
  %598 = insertelement <2 x bfloat> %597, bfloat %577, i64 1
  %599 = bitcast <2 x bfloat> %598 to i32
  %600 = insertelement <2 x bfloat> poison, bfloat %578, i64 0
  %601 = insertelement <2 x bfloat> %600, bfloat %579, i64 1
  %602 = bitcast <2 x bfloat> %601 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %593, i32 %596, i32 %599, i32 %602, ptr addrspace(1) %589) #9
  %603 = insertelement <2 x bfloat> poison, bfloat %580, i64 0
  %604 = insertelement <2 x bfloat> %603, bfloat %581, i64 1
  %605 = bitcast <2 x bfloat> %604 to i32
  %606 = insertelement <2 x bfloat> poison, bfloat %582, i64 0
  %607 = insertelement <2 x bfloat> %606, bfloat %583, i64 1
  %608 = bitcast <2 x bfloat> %607 to i32
  %609 = insertelement <2 x bfloat> poison, bfloat %584, i64 0
  %610 = insertelement <2 x bfloat> %609, bfloat %585, i64 1
  %611 = bitcast <2 x bfloat> %610 to i32
  %612 = insertelement <2 x bfloat> poison, bfloat %586, i64 0
  %613 = insertelement <2 x bfloat> %612, bfloat %587, i64 1
  %614 = bitcast <2 x bfloat> %613 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %605, i32 %608, i32 %611, i32 %614, ptr addrspace(1) %590) #9
  ret void
}

define ptx_kernel void @fusion_60(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(524288) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) local_unnamed_addr #5 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 12
  %4 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 1024
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #9
  %17 = extractvalue { i32, i32, i32, i32 } %16, 0
  %18 = bitcast i32 %17 to <2 x bfloat>
  %19 = extractvalue { i32, i32, i32, i32 } %16, 1
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32, i32, i32 } %16, 2
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32, i32, i32 } %16, 3
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %18, i64 0
  %26 = extractelement <2 x bfloat> %18, i64 1
  %27 = extractelement <2 x bfloat> %20, i64 0
  %28 = extractelement <2 x bfloat> %20, i64 1
  %29 = extractelement <2 x bfloat> %22, i64 0
  %30 = extractelement <2 x bfloat> %22, i64 1
  %31 = extractelement <2 x bfloat> %24, i64 0
  %32 = extractelement <2 x bfloat> %24, i64 1
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
  %34 = extractvalue { i32, i32, i32, i32 } %33, 0
  %35 = bitcast i32 %34 to <2 x bfloat>
  %36 = extractvalue { i32, i32, i32, i32 } %33, 1
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %33, 2
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %33, 3
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractelement <2 x bfloat> %35, i64 0
  %43 = extractelement <2 x bfloat> %35, i64 1
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #9
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = shl nsw i64 %2, 10
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
  %71 = extractvalue { i32, i32, i32, i32 } %70, 0
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractvalue { i32, i32, i32, i32 } %70, 1
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %70, 2
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %70, 3
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractelement <2 x bfloat> %72, i64 0
  %80 = extractelement <2 x bfloat> %72, i64 1
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #9
  %88 = extractvalue { i32, i32, i32, i32 } %87, 0
  %89 = bitcast i32 %88 to <2 x bfloat>
  %90 = extractvalue { i32, i32, i32, i32 } %87, 1
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %87, 2
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %87, 3
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractelement <2 x bfloat> %89, i64 0
  %97 = extractelement <2 x bfloat> %89, i64 1
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = getelementptr i8, ptr addrspace(1) %4, i64 2048
  %121 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %122 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 1024
  %124 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
  %125 = extractvalue { i32, i32, i32, i32 } %124, 0
  %126 = bitcast i32 %125 to <2 x bfloat>
  %127 = extractvalue { i32, i32, i32, i32 } %124, 1
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %124, 2
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %124, 3
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractelement <2 x bfloat> %126, i64 0
  %134 = extractelement <2 x bfloat> %126, i64 1
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %142 = extractvalue { i32, i32, i32, i32 } %141, 0
  %143 = bitcast i32 %142 to <2 x bfloat>
  %144 = extractvalue { i32, i32, i32, i32 } %141, 1
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %141, 2
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %141, 3
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractelement <2 x bfloat> %143, i64 0
  %151 = extractelement <2 x bfloat> %143, i64 1
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %66
  %175 = getelementptr bfloat, ptr addrspace(1) %174, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #9
  %178 = extractvalue { i32, i32, i32, i32 } %177, 0
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractvalue { i32, i32, i32, i32 } %177, 1
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %177, 2
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %177, 3
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractelement <2 x bfloat> %179, i64 0
  %187 = extractelement <2 x bfloat> %179, i64 1
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #9
  %195 = extractvalue { i32, i32, i32, i32 } %194, 0
  %196 = bitcast i32 %195 to <2 x bfloat>
  %197 = extractvalue { i32, i32, i32, i32 } %194, 1
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %194, 2
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %194, 3
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractelement <2 x bfloat> %196, i64 0
  %204 = extractelement <2 x bfloat> %196, i64 1
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %228 = getelementptr i8, ptr addrspace(1) %14, i64 4096
  %229 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %230 = getelementptr i8, ptr addrspace(1) %229, i64 1024
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #9
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %231, 1
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %231, 2
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %231, 3
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = extractelement <2 x bfloat> %239, i64 0
  %247 = extractelement <2 x bfloat> %239, i64 1
  %248 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
  %249 = extractvalue { i32, i32, i32, i32 } %248, 0
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %248, 1
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %248, 2
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %248, 3
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = extractelement <2 x bfloat> %256, i64 0
  %264 = extractelement <2 x bfloat> %256, i64 1
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %66
  %282 = getelementptr bfloat, ptr addrspace(1) %281, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractvalue { i32, i32, i32, i32 } %284, 1
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %284, 2
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %284, 3
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractelement <2 x bfloat> %286, i64 0
  %294 = extractelement <2 x bfloat> %286, i64 1
  %295 = extractelement <2 x bfloat> %288, i64 0
  %296 = extractelement <2 x bfloat> %288, i64 1
  %297 = extractelement <2 x bfloat> %290, i64 0
  %298 = extractelement <2 x bfloat> %290, i64 1
  %299 = extractelement <2 x bfloat> %292, i64 0
  %300 = extractelement <2 x bfloat> %292, i64 1
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
  %302 = extractvalue { i32, i32, i32, i32 } %301, 0
  %303 = bitcast i32 %302 to <2 x bfloat>
  %304 = extractvalue { i32, i32, i32, i32 } %301, 1
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %301, 2
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %301, 3
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractelement <2 x bfloat> %303, i64 0
  %311 = extractelement <2 x bfloat> %303, i64 1
  %312 = extractelement <2 x bfloat> %305, i64 0
  %313 = extractelement <2 x bfloat> %305, i64 1
  %314 = extractelement <2 x bfloat> %307, i64 0
  %315 = extractelement <2 x bfloat> %307, i64 1
  %316 = extractelement <2 x bfloat> %309, i64 0
  %317 = extractelement <2 x bfloat> %309, i64 1
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %335 = getelementptr i8, ptr addrspace(1) %14, i64 6144
  %336 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %337 = getelementptr i8, ptr addrspace(1) %336, i64 1024
  %338 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #9
  %339 = extractvalue { i32, i32, i32, i32 } %338, 0
  %340 = bitcast i32 %339 to <2 x bfloat>
  %341 = extractvalue { i32, i32, i32, i32 } %338, 1
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %338, 2
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %338, 3
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractelement <2 x bfloat> %340, i64 0
  %348 = extractelement <2 x bfloat> %340, i64 1
  %349 = extractelement <2 x bfloat> %342, i64 0
  %350 = extractelement <2 x bfloat> %342, i64 1
  %351 = extractelement <2 x bfloat> %344, i64 0
  %352 = extractelement <2 x bfloat> %344, i64 1
  %353 = extractelement <2 x bfloat> %346, i64 0
  %354 = extractelement <2 x bfloat> %346, i64 1
  %355 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #9
  %356 = extractvalue { i32, i32, i32, i32 } %355, 0
  %357 = bitcast i32 %356 to <2 x bfloat>
  %358 = extractvalue { i32, i32, i32, i32 } %355, 1
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %355, 2
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %355, 3
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractelement <2 x bfloat> %357, i64 0
  %365 = extractelement <2 x bfloat> %357, i64 1
  %366 = extractelement <2 x bfloat> %359, i64 0
  %367 = extractelement <2 x bfloat> %359, i64 1
  %368 = extractelement <2 x bfloat> %361, i64 0
  %369 = extractelement <2 x bfloat> %361, i64 1
  %370 = extractelement <2 x bfloat> %363, i64 0
  %371 = extractelement <2 x bfloat> %363, i64 1
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #9
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #9
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #9
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #9
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #9
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #9
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #9
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #9
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #9
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #9
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #9
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #9
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #9
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #9
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #9
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #9
  %388 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
  %389 = getelementptr bfloat, ptr addrspace(1) %388, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %389) #9
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i64 0
  %401 = extractelement <2 x bfloat> %393, i64 1
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #9
  %409 = extractvalue { i32, i32, i32, i32 } %408, 0
  %410 = bitcast i32 %409 to <2 x bfloat>
  %411 = extractvalue { i32, i32, i32, i32 } %408, 1
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %408, 2
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %408, 3
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractelement <2 x bfloat> %410, i64 0
  %418 = extractelement <2 x bfloat> %410, i64 1
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #9
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #9
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #9
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #9
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #9
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #9
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #9
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #9
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #9
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #9
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #9
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #9
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #9
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #9
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #9
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #9
  %441 = fadd float %372, %425
  %442 = fadd float %373, %426
  %443 = fadd float %374, %427
  %444 = fadd float %375, %428
  %445 = fadd float %376, %429
  %446 = fadd float %377, %430
  %447 = fadd float %378, %431
  %448 = fadd float %379, %432
  %449 = fadd float %380, %433
  %450 = fadd float %381, %434
  %451 = fadd float %382, %435
  %452 = fadd float %383, %436
  %453 = fadd float %384, %437
  %454 = fadd float %385, %438
  %455 = fadd float %386, %439
  %456 = fadd float %387, %440
  %457 = fadd float %318, %441
  %458 = fadd float %319, %442
  %459 = fadd float %320, %443
  %460 = fadd float %321, %444
  %461 = fadd float %322, %445
  %462 = fadd float %323, %446
  %463 = fadd float %324, %447
  %464 = fadd float %325, %448
  %465 = fadd float %326, %449
  %466 = fadd float %327, %450
  %467 = fadd float %328, %451
  %468 = fadd float %329, %452
  %469 = fadd float %330, %453
  %470 = fadd float %331, %454
  %471 = fadd float %332, %455
  %472 = fadd float %333, %456
  %473 = fadd float %265, %457
  %474 = fadd float %266, %458
  %475 = fadd float %267, %459
  %476 = fadd float %268, %460
  %477 = fadd float %269, %461
  %478 = fadd float %270, %462
  %479 = fadd float %271, %463
  %480 = fadd float %272, %464
  %481 = fadd float %273, %465
  %482 = fadd float %274, %466
  %483 = fadd float %275, %467
  %484 = fadd float %276, %468
  %485 = fadd float %277, %469
  %486 = fadd float %278, %470
  %487 = fadd float %279, %471
  %488 = fadd float %280, %472
  %489 = fadd float %211, %473
  %490 = fadd float %212, %474
  %491 = fadd float %213, %475
  %492 = fadd float %214, %476
  %493 = fadd float %215, %477
  %494 = fadd float %216, %478
  %495 = fadd float %217, %479
  %496 = fadd float %218, %480
  %497 = fadd float %219, %481
  %498 = fadd float %220, %482
  %499 = fadd float %221, %483
  %500 = fadd float %222, %484
  %501 = fadd float %223, %485
  %502 = fadd float %224, %486
  %503 = fadd float %225, %487
  %504 = fadd float %226, %488
  %505 = fadd float %158, %489
  %506 = fadd float %159, %490
  %507 = fadd float %160, %491
  %508 = fadd float %161, %492
  %509 = fadd float %162, %493
  %510 = fadd float %163, %494
  %511 = fadd float %164, %495
  %512 = fadd float %165, %496
  %513 = fadd float %166, %497
  %514 = fadd float %167, %498
  %515 = fadd float %168, %499
  %516 = fadd float %169, %500
  %517 = fadd float %170, %501
  %518 = fadd float %171, %502
  %519 = fadd float %172, %503
  %520 = fadd float %173, %504
  %521 = fadd float %104, %505
  %522 = fadd float %105, %506
  %523 = fadd float %106, %507
  %524 = fadd float %107, %508
  %525 = fadd float %108, %509
  %526 = fadd float %109, %510
  %527 = fadd float %110, %511
  %528 = fadd float %111, %512
  %529 = fadd float %112, %513
  %530 = fadd float %113, %514
  %531 = fadd float %114, %515
  %532 = fadd float %115, %516
  %533 = fadd float %116, %517
  %534 = fadd float %117, %518
  %535 = fadd float %118, %519
  %536 = fadd float %119, %520
  %537 = fadd float %50, %521
  %538 = fadd float %51, %522
  %539 = fadd float %52, %523
  %540 = fadd float %53, %524
  %541 = fadd float %54, %525
  %542 = fadd float %55, %526
  %543 = fadd float %56, %527
  %544 = fadd float %57, %528
  %545 = fadd float %58, %529
  %546 = fadd float %59, %530
  %547 = fadd float %60, %531
  %548 = fadd float %61, %532
  %549 = fadd float %62, %533
  %550 = fadd float %63, %534
  %551 = fadd float %64, %535
  %552 = fadd float %65, %536
  %553 = fmul float %537, %537
  %554 = fmul float %538, %538
  %555 = fmul float %539, %539
  %556 = fmul float %540, %540
  %557 = fmul float %541, %541
  %558 = fmul float %542, %542
  %559 = fmul float %543, %543
  %560 = fmul float %544, %544
  %561 = fmul float %545, %545
  %562 = fmul float %546, %546
  %563 = fmul float %547, %547
  %564 = fmul float %548, %548
  %565 = fmul float %549, %549
  %566 = fmul float %550, %550
  %567 = fmul float %551, %551
  %568 = fmul float %552, %552
  %569 = fadd float %553, %554
  %570 = fadd float %569, %555
  %571 = fadd float %570, %556
  %572 = fadd float %571, %557
  %573 = fadd float %572, %558
  %574 = fadd float %573, %559
  %575 = fadd float %574, %560
  %576 = fadd float %575, %561
  %577 = fadd float %576, %562
  %578 = fadd float %577, %563
  %579 = fadd float %578, %564
  %580 = fadd float %579, %565
  %581 = fadd float %580, %566
  %582 = fadd float %581, %567
  %583 = fadd float %582, %568
  %584 = bitcast float %583 to i32
  %585 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %584, i32 16, i32 31)
  %586 = bitcast i32 %585 to float
  %587 = fadd float %583, %586
  %588 = bitcast float %587 to i32
  %589 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %588, i32 8, i32 31)
  %590 = bitcast i32 %589 to float
  %591 = fadd float %587, %590
  %592 = bitcast float %591 to i32
  %593 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %592, i32 4, i32 31)
  %594 = bitcast i32 %593 to float
  %595 = fadd float %591, %594
  %596 = bitcast float %595 to i32
  %597 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %596, i32 2, i32 31)
  %598 = bitcast i32 %597 to float
  %599 = fadd float %595, %598
  %600 = bitcast float %599 to i32
  %601 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %600, i32 1, i32 31)
  %602 = bitcast i32 %601 to float
  %603 = fadd float %599, %602
  %604 = icmp eq i32 %6, 0
  %605 = zext nneg i32 %7 to i64
  %606 = getelementptr float, ptr addrspace(3) @global_smem, i64 %605
  %607 = bitcast float %603 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %606, <1 x i32> %607, i1 %604) #9
  tail call void @llvm.nvvm.barrier0()
  %608 = icmp samesign ult i32 %5, 2
  %609 = zext nneg i32 %5 to i64
  %610 = getelementptr float, ptr addrspace(3) @global_smem, i64 %609
  %611 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %610, i1 %608) #9
  %612 = bitcast i32 %611 to float
  %613 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %611, i32 1, i32 31)
  %614 = bitcast i32 %613 to float
  %615 = fadd float %612, %614
  %616 = icmp eq i32 %5, 0
  %617 = bitcast float %615 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %610, <1 x i32> %617, i1 %616) #9
  tail call void @llvm.nvvm.barrier0()
  %618 = load float, ptr addrspace(3) @global_smem, align 16
  %619 = fmul float %618, 0x3F50000000000000
  %620 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %621 = bitcast i32 %620 to float
  %622 = fadd float %619, %621
  %623 = tail call float @llvm.nvvm.rsqrt.approx.f(float %622)
  %624 = fmul float %537, %623
  %625 = fmul float %538, %623
  %626 = fmul float %539, %623
  %627 = fmul float %540, %623
  %628 = fmul float %541, %623
  %629 = fmul float %542, %623
  %630 = fmul float %543, %623
  %631 = fmul float %544, %623
  %632 = fmul float %545, %623
  %633 = fmul float %546, %623
  %634 = fmul float %547, %623
  %635 = fmul float %548, %623
  %636 = fmul float %549, %623
  %637 = fmul float %550, %623
  %638 = fmul float %551, %623
  %639 = fmul float %552, %623
  %640 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %641 = getelementptr i8, ptr addrspace(1) %640, i64 1024
  %642 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %640) #9
  %643 = extractvalue { i32, i32, i32, i32 } %642, 0
  %644 = bitcast i32 %643 to <2 x bfloat>
  %645 = extractvalue { i32, i32, i32, i32 } %642, 1
  %646 = bitcast i32 %645 to <2 x bfloat>
  %647 = extractvalue { i32, i32, i32, i32 } %642, 2
  %648 = bitcast i32 %647 to <2 x bfloat>
  %649 = extractvalue { i32, i32, i32, i32 } %642, 3
  %650 = bitcast i32 %649 to <2 x bfloat>
  %651 = extractelement <2 x bfloat> %644, i64 0
  %652 = extractelement <2 x bfloat> %644, i64 1
  %653 = extractelement <2 x bfloat> %646, i64 0
  %654 = extractelement <2 x bfloat> %646, i64 1
  %655 = extractelement <2 x bfloat> %648, i64 0
  %656 = extractelement <2 x bfloat> %648, i64 1
  %657 = extractelement <2 x bfloat> %650, i64 0
  %658 = extractelement <2 x bfloat> %650, i64 1
  %659 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %641) #9
  %660 = extractvalue { i32, i32, i32, i32 } %659, 0
  %661 = bitcast i32 %660 to <2 x bfloat>
  %662 = extractvalue { i32, i32, i32, i32 } %659, 1
  %663 = bitcast i32 %662 to <2 x bfloat>
  %664 = extractvalue { i32, i32, i32, i32 } %659, 2
  %665 = bitcast i32 %664 to <2 x bfloat>
  %666 = extractvalue { i32, i32, i32, i32 } %659, 3
  %667 = bitcast i32 %666 to <2 x bfloat>
  %668 = extractelement <2 x bfloat> %661, i64 0
  %669 = extractelement <2 x bfloat> %661, i64 1
  %670 = extractelement <2 x bfloat> %663, i64 0
  %671 = extractelement <2 x bfloat> %663, i64 1
  %672 = extractelement <2 x bfloat> %665, i64 0
  %673 = extractelement <2 x bfloat> %665, i64 1
  %674 = extractelement <2 x bfloat> %667, i64 0
  %675 = extractelement <2 x bfloat> %667, i64 1
  %676 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %651) #9
  %677 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %652) #9
  %678 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653) #9
  %679 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654) #9
  %680 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655) #9
  %681 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656) #9
  %682 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %657) #9
  %683 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658) #9
  %684 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %668) #9
  %685 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %669) #9
  %686 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670) #9
  %687 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671) #9
  %688 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672) #9
  %689 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673) #9
  %690 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %674) #9
  %691 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %675) #9
  %692 = fmul float %624, %676
  %693 = fmul float %625, %677
  %694 = fmul float %626, %678
  %695 = fmul float %627, %679
  %696 = fmul float %628, %680
  %697 = fmul float %629, %681
  %698 = fmul float %630, %682
  %699 = fmul float %631, %683
  %700 = fmul float %632, %684
  %701 = fmul float %633, %685
  %702 = fmul float %634, %686
  %703 = fmul float %635, %687
  %704 = fmul float %636, %688
  %705 = fmul float %637, %689
  %706 = fmul float %638, %690
  %707 = fmul float %639, %691
  %708 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %692) #9
  %709 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %693) #9
  %710 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %694) #9
  %711 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695) #9
  %712 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696) #9
  %713 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697) #9
  %714 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %698) #9
  %715 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %699) #9
  %716 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %700) #9
  %717 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %701) #9
  %718 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %702) #9
  %719 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %703) #9
  %720 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %704) #9
  %721 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %705) #9
  %722 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %706) #9
  %723 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %707) #9
  %724 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %66
  %725 = getelementptr bfloat, ptr addrspace(1) %724, i64 %13
  %726 = getelementptr i8, ptr addrspace(1) %725, i64 1024
  %727 = insertelement <2 x bfloat> poison, bfloat %708, i64 0
  %728 = insertelement <2 x bfloat> %727, bfloat %709, i64 1
  %729 = bitcast <2 x bfloat> %728 to i32
  %730 = insertelement <2 x bfloat> poison, bfloat %710, i64 0
  %731 = insertelement <2 x bfloat> %730, bfloat %711, i64 1
  %732 = bitcast <2 x bfloat> %731 to i32
  %733 = insertelement <2 x bfloat> poison, bfloat %712, i64 0
  %734 = insertelement <2 x bfloat> %733, bfloat %713, i64 1
  %735 = bitcast <2 x bfloat> %734 to i32
  %736 = insertelement <2 x bfloat> poison, bfloat %714, i64 0
  %737 = insertelement <2 x bfloat> %736, bfloat %715, i64 1
  %738 = bitcast <2 x bfloat> %737 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %729, i32 %732, i32 %735, i32 %738, ptr addrspace(1) %725) #9
  %739 = insertelement <2 x bfloat> poison, bfloat %716, i64 0
  %740 = insertelement <2 x bfloat> %739, bfloat %717, i64 1
  %741 = bitcast <2 x bfloat> %740 to i32
  %742 = insertelement <2 x bfloat> poison, bfloat %718, i64 0
  %743 = insertelement <2 x bfloat> %742, bfloat %719, i64 1
  %744 = bitcast <2 x bfloat> %743 to i32
  %745 = insertelement <2 x bfloat> poison, bfloat %720, i64 0
  %746 = insertelement <2 x bfloat> %745, bfloat %721, i64 1
  %747 = bitcast <2 x bfloat> %746 to i32
  %748 = insertelement <2 x bfloat> poison, bfloat %722, i64 0
  %749 = insertelement <2 x bfloat> %748, bfloat %723, i64 1
  %750 = bitcast <2 x bfloat> %749 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %741, i32 %744, i32 %747, i32 %750, ptr addrspace(1) %726) #9
  ret void
}

define ptx_kernel void @fusion_58(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(524288) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8) local_unnamed_addr #5 {
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 10
  %4 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 1024
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #9
  %17 = extractvalue { i32, i32, i32, i32 } %16, 0
  %18 = bitcast i32 %17 to <2 x bfloat>
  %19 = extractvalue { i32, i32, i32, i32 } %16, 1
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32, i32, i32 } %16, 2
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32, i32, i32 } %16, 3
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %18, i64 0
  %26 = extractelement <2 x bfloat> %18, i64 1
  %27 = extractelement <2 x bfloat> %20, i64 0
  %28 = extractelement <2 x bfloat> %20, i64 1
  %29 = extractelement <2 x bfloat> %22, i64 0
  %30 = extractelement <2 x bfloat> %22, i64 1
  %31 = extractelement <2 x bfloat> %24, i64 0
  %32 = extractelement <2 x bfloat> %24, i64 1
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
  %34 = extractvalue { i32, i32, i32, i32 } %33, 0
  %35 = bitcast i32 %34 to <2 x bfloat>
  %36 = extractvalue { i32, i32, i32, i32 } %33, 1
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %33, 2
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %33, 3
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractelement <2 x bfloat> %35, i64 0
  %43 = extractelement <2 x bfloat> %35, i64 1
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #9
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = shl nsw i64 %2, 12
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
  %71 = extractvalue { i32, i32, i32, i32 } %70, 0
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractvalue { i32, i32, i32, i32 } %70, 1
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %70, 2
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %70, 3
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractelement <2 x bfloat> %72, i64 0
  %80 = extractelement <2 x bfloat> %72, i64 1
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #9
  %88 = extractvalue { i32, i32, i32, i32 } %87, 0
  %89 = bitcast i32 %88 to <2 x bfloat>
  %90 = extractvalue { i32, i32, i32, i32 } %87, 1
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %87, 2
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %87, 3
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractelement <2 x bfloat> %89, i64 0
  %97 = extractelement <2 x bfloat> %89, i64 1
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %121 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
  %124 = extractvalue { i32, i32, i32, i32 } %123, 0
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractvalue { i32, i32, i32, i32 } %123, 1
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %123, 2
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %123, 3
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractelement <2 x bfloat> %125, i64 0
  %133 = extractelement <2 x bfloat> %125, i64 1
  %134 = extractelement <2 x bfloat> %127, i64 0
  %135 = extractelement <2 x bfloat> %127, i64 1
  %136 = extractelement <2 x bfloat> %129, i64 0
  %137 = extractelement <2 x bfloat> %129, i64 1
  %138 = extractelement <2 x bfloat> %131, i64 0
  %139 = extractelement <2 x bfloat> %131, i64 1
  %140 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %122) #9
  %141 = extractvalue { i32, i32, i32, i32 } %140, 0
  %142 = bitcast i32 %141 to <2 x bfloat>
  %143 = extractvalue { i32, i32, i32, i32 } %140, 1
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractvalue { i32, i32, i32, i32 } %140, 2
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractvalue { i32, i32, i32, i32 } %140, 3
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractelement <2 x bfloat> %142, i64 0
  %150 = extractelement <2 x bfloat> %142, i64 1
  %151 = extractelement <2 x bfloat> %144, i64 0
  %152 = extractelement <2 x bfloat> %144, i64 1
  %153 = extractelement <2 x bfloat> %146, i64 0
  %154 = extractelement <2 x bfloat> %146, i64 1
  %155 = extractelement <2 x bfloat> %148, i64 0
  %156 = extractelement <2 x bfloat> %148, i64 1
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #9
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr i8, ptr addrspace(1) %68, i64 2048
  %175 = getelementptr bfloat, ptr addrspace(1) %173, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #9
  %178 = extractvalue { i32, i32, i32, i32 } %177, 0
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractvalue { i32, i32, i32, i32 } %177, 1
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %177, 2
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %177, 3
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractelement <2 x bfloat> %179, i64 0
  %187 = extractelement <2 x bfloat> %179, i64 1
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #9
  %195 = extractvalue { i32, i32, i32, i32 } %194, 0
  %196 = bitcast i32 %195 to <2 x bfloat>
  %197 = extractvalue { i32, i32, i32, i32 } %194, 1
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %194, 2
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %194, 3
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractelement <2 x bfloat> %196, i64 0
  %204 = extractelement <2 x bfloat> %196, i64 1
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %228 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 1024
  %230 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #9
  %231 = extractvalue { i32, i32, i32, i32 } %230, 0
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %230, 1
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %230, 2
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %230, 3
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractelement <2 x bfloat> %232, i64 0
  %240 = extractelement <2 x bfloat> %232, i64 1
  %241 = extractelement <2 x bfloat> %234, i64 0
  %242 = extractelement <2 x bfloat> %234, i64 1
  %243 = extractelement <2 x bfloat> %236, i64 0
  %244 = extractelement <2 x bfloat> %236, i64 1
  %245 = extractelement <2 x bfloat> %238, i64 0
  %246 = extractelement <2 x bfloat> %238, i64 1
  %247 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #9
  %248 = extractvalue { i32, i32, i32, i32 } %247, 0
  %249 = bitcast i32 %248 to <2 x bfloat>
  %250 = extractvalue { i32, i32, i32, i32 } %247, 1
  %251 = bitcast i32 %250 to <2 x bfloat>
  %252 = extractvalue { i32, i32, i32, i32 } %247, 2
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractvalue { i32, i32, i32, i32 } %247, 3
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractelement <2 x bfloat> %249, i64 0
  %257 = extractelement <2 x bfloat> %249, i64 1
  %258 = extractelement <2 x bfloat> %251, i64 0
  %259 = extractelement <2 x bfloat> %251, i64 1
  %260 = extractelement <2 x bfloat> %253, i64 0
  %261 = extractelement <2 x bfloat> %253, i64 1
  %262 = extractelement <2 x bfloat> %255, i64 0
  %263 = extractelement <2 x bfloat> %255, i64 1
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = getelementptr i8, ptr addrspace(1) %67, i64 4096
  %281 = getelementptr i8, ptr addrspace(1) %68, i64 4096
  %282 = getelementptr bfloat, ptr addrspace(1) %280, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #9
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractvalue { i32, i32, i32, i32 } %284, 1
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %284, 2
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %284, 3
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractelement <2 x bfloat> %286, i64 0
  %294 = extractelement <2 x bfloat> %286, i64 1
  %295 = extractelement <2 x bfloat> %288, i64 0
  %296 = extractelement <2 x bfloat> %288, i64 1
  %297 = extractelement <2 x bfloat> %290, i64 0
  %298 = extractelement <2 x bfloat> %290, i64 1
  %299 = extractelement <2 x bfloat> %292, i64 0
  %300 = extractelement <2 x bfloat> %292, i64 1
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
  %302 = extractvalue { i32, i32, i32, i32 } %301, 0
  %303 = bitcast i32 %302 to <2 x bfloat>
  %304 = extractvalue { i32, i32, i32, i32 } %301, 1
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %301, 2
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %301, 3
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractelement <2 x bfloat> %303, i64 0
  %311 = extractelement <2 x bfloat> %303, i64 1
  %312 = extractelement <2 x bfloat> %305, i64 0
  %313 = extractelement <2 x bfloat> %305, i64 1
  %314 = extractelement <2 x bfloat> %307, i64 0
  %315 = extractelement <2 x bfloat> %307, i64 1
  %316 = extractelement <2 x bfloat> %309, i64 0
  %317 = extractelement <2 x bfloat> %309, i64 1
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %3
  %335 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %336 = getelementptr i8, ptr addrspace(1) %335, i64 1024
  %337 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #9
  %338 = extractvalue { i32, i32, i32, i32 } %337, 0
  %339 = bitcast i32 %338 to <2 x bfloat>
  %340 = extractvalue { i32, i32, i32, i32 } %337, 1
  %341 = bitcast i32 %340 to <2 x bfloat>
  %342 = extractvalue { i32, i32, i32, i32 } %337, 2
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32, i32, i32 } %337, 3
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractelement <2 x bfloat> %339, i64 0
  %347 = extractelement <2 x bfloat> %339, i64 1
  %348 = extractelement <2 x bfloat> %341, i64 0
  %349 = extractelement <2 x bfloat> %341, i64 1
  %350 = extractelement <2 x bfloat> %343, i64 0
  %351 = extractelement <2 x bfloat> %343, i64 1
  %352 = extractelement <2 x bfloat> %345, i64 0
  %353 = extractelement <2 x bfloat> %345, i64 1
  %354 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %336) #9
  %355 = extractvalue { i32, i32, i32, i32 } %354, 0
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %354, 1
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %354, 2
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractvalue { i32, i32, i32, i32 } %354, 3
  %362 = bitcast i32 %361 to <2 x bfloat>
  %363 = extractelement <2 x bfloat> %356, i64 0
  %364 = extractelement <2 x bfloat> %356, i64 1
  %365 = extractelement <2 x bfloat> %358, i64 0
  %366 = extractelement <2 x bfloat> %358, i64 1
  %367 = extractelement <2 x bfloat> %360, i64 0
  %368 = extractelement <2 x bfloat> %360, i64 1
  %369 = extractelement <2 x bfloat> %362, i64 0
  %370 = extractelement <2 x bfloat> %362, i64 1
  %371 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346) #9
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #9
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #9
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #9
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #9
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #9
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #9
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #9
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #9
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #9
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #9
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #9
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #9
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #9
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #9
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #9
  %387 = getelementptr i8, ptr addrspace(1) %67, i64 6144
  %388 = getelementptr i8, ptr addrspace(1) %68, i64 6144
  %389 = getelementptr bfloat, ptr addrspace(1) %387, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %388) #9
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i64 0
  %401 = extractelement <2 x bfloat> %393, i64 1
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #9
  %409 = extractvalue { i32, i32, i32, i32 } %408, 0
  %410 = bitcast i32 %409 to <2 x bfloat>
  %411 = extractvalue { i32, i32, i32, i32 } %408, 1
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %408, 2
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %408, 3
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractelement <2 x bfloat> %410, i64 0
  %418 = extractelement <2 x bfloat> %410, i64 1
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #9
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #9
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #9
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #9
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #9
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #9
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #9
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #9
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #9
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #9
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #9
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #9
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #9
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #9
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #9
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #9
  %441 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %442 = getelementptr bfloat, ptr addrspace(1) %441, i64 %13
  %443 = getelementptr i8, ptr addrspace(1) %442, i64 1024
  %444 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %442) #9
  %445 = extractvalue { i32, i32, i32, i32 } %444, 0
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %444, 1
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractvalue { i32, i32, i32, i32 } %444, 2
  %450 = bitcast i32 %449 to <2 x bfloat>
  %451 = extractvalue { i32, i32, i32, i32 } %444, 3
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = extractelement <2 x bfloat> %450, i64 0
  %458 = extractelement <2 x bfloat> %450, i64 1
  %459 = extractelement <2 x bfloat> %452, i64 0
  %460 = extractelement <2 x bfloat> %452, i64 1
  %461 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %443) #9
  %462 = extractvalue { i32, i32, i32, i32 } %461, 0
  %463 = bitcast i32 %462 to <2 x bfloat>
  %464 = extractvalue { i32, i32, i32, i32 } %461, 1
  %465 = bitcast i32 %464 to <2 x bfloat>
  %466 = extractvalue { i32, i32, i32, i32 } %461, 2
  %467 = bitcast i32 %466 to <2 x bfloat>
  %468 = extractvalue { i32, i32, i32, i32 } %461, 3
  %469 = bitcast i32 %468 to <2 x bfloat>
  %470 = extractelement <2 x bfloat> %463, i64 0
  %471 = extractelement <2 x bfloat> %463, i64 1
  %472 = extractelement <2 x bfloat> %465, i64 0
  %473 = extractelement <2 x bfloat> %465, i64 1
  %474 = extractelement <2 x bfloat> %467, i64 0
  %475 = extractelement <2 x bfloat> %467, i64 1
  %476 = extractelement <2 x bfloat> %469, i64 0
  %477 = extractelement <2 x bfloat> %469, i64 1
  %478 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #9
  %479 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #9
  %480 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #9
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #9
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #9
  %483 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458) #9
  %484 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #9
  %485 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #9
  %486 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %470) #9
  %487 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %471) #9
  %488 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %472) #9
  %489 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %473) #9
  %490 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474) #9
  %491 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475) #9
  %492 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476) #9
  %493 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477) #9
  %494 = fadd float %425, %478
  %495 = fadd float %426, %479
  %496 = fadd float %427, %480
  %497 = fadd float %428, %481
  %498 = fadd float %429, %482
  %499 = fadd float %430, %483
  %500 = fadd float %431, %484
  %501 = fadd float %432, %485
  %502 = fadd float %433, %486
  %503 = fadd float %434, %487
  %504 = fadd float %435, %488
  %505 = fadd float %436, %489
  %506 = fadd float %437, %490
  %507 = fadd float %438, %491
  %508 = fadd float %439, %492
  %509 = fadd float %440, %493
  %510 = fadd float %371, %494
  %511 = fadd float %372, %495
  %512 = fadd float %373, %496
  %513 = fadd float %374, %497
  %514 = fadd float %375, %498
  %515 = fadd float %376, %499
  %516 = fadd float %377, %500
  %517 = fadd float %378, %501
  %518 = fadd float %379, %502
  %519 = fadd float %380, %503
  %520 = fadd float %381, %504
  %521 = fadd float %382, %505
  %522 = fadd float %383, %506
  %523 = fadd float %384, %507
  %524 = fadd float %385, %508
  %525 = fadd float %386, %509
  %526 = fadd float %318, %510
  %527 = fadd float %319, %511
  %528 = fadd float %320, %512
  %529 = fadd float %321, %513
  %530 = fadd float %322, %514
  %531 = fadd float %323, %515
  %532 = fadd float %324, %516
  %533 = fadd float %325, %517
  %534 = fadd float %326, %518
  %535 = fadd float %327, %519
  %536 = fadd float %328, %520
  %537 = fadd float %329, %521
  %538 = fadd float %330, %522
  %539 = fadd float %331, %523
  %540 = fadd float %332, %524
  %541 = fadd float %333, %525
  %542 = fadd float %264, %526
  %543 = fadd float %265, %527
  %544 = fadd float %266, %528
  %545 = fadd float %267, %529
  %546 = fadd float %268, %530
  %547 = fadd float %269, %531
  %548 = fadd float %270, %532
  %549 = fadd float %271, %533
  %550 = fadd float %272, %534
  %551 = fadd float %273, %535
  %552 = fadd float %274, %536
  %553 = fadd float %275, %537
  %554 = fadd float %276, %538
  %555 = fadd float %277, %539
  %556 = fadd float %278, %540
  %557 = fadd float %279, %541
  %558 = fadd float %211, %542
  %559 = fadd float %212, %543
  %560 = fadd float %213, %544
  %561 = fadd float %214, %545
  %562 = fadd float %215, %546
  %563 = fadd float %216, %547
  %564 = fadd float %217, %548
  %565 = fadd float %218, %549
  %566 = fadd float %219, %550
  %567 = fadd float %220, %551
  %568 = fadd float %221, %552
  %569 = fadd float %222, %553
  %570 = fadd float %223, %554
  %571 = fadd float %224, %555
  %572 = fadd float %225, %556
  %573 = fadd float %226, %557
  %574 = fadd float %157, %558
  %575 = fadd float %158, %559
  %576 = fadd float %159, %560
  %577 = fadd float %160, %561
  %578 = fadd float %161, %562
  %579 = fadd float %162, %563
  %580 = fadd float %163, %564
  %581 = fadd float %164, %565
  %582 = fadd float %165, %566
  %583 = fadd float %166, %567
  %584 = fadd float %167, %568
  %585 = fadd float %168, %569
  %586 = fadd float %169, %570
  %587 = fadd float %170, %571
  %588 = fadd float %171, %572
  %589 = fadd float %172, %573
  %590 = fadd float %104, %574
  %591 = fadd float %105, %575
  %592 = fadd float %106, %576
  %593 = fadd float %107, %577
  %594 = fadd float %108, %578
  %595 = fadd float %109, %579
  %596 = fadd float %110, %580
  %597 = fadd float %111, %581
  %598 = fadd float %112, %582
  %599 = fadd float %113, %583
  %600 = fadd float %114, %584
  %601 = fadd float %115, %585
  %602 = fadd float %116, %586
  %603 = fadd float %117, %587
  %604 = fadd float %118, %588
  %605 = fadd float %119, %589
  %606 = fadd float %50, %590
  %607 = fadd float %51, %591
  %608 = fadd float %52, %592
  %609 = fadd float %53, %593
  %610 = fadd float %54, %594
  %611 = fadd float %55, %595
  %612 = fadd float %56, %596
  %613 = fadd float %57, %597
  %614 = fadd float %58, %598
  %615 = fadd float %59, %599
  %616 = fadd float %60, %600
  %617 = fadd float %61, %601
  %618 = fadd float %62, %602
  %619 = fadd float %63, %603
  %620 = fadd float %64, %604
  %621 = fadd float %65, %605
  %622 = fmul float %606, %606
  %623 = fmul float %607, %607
  %624 = fmul float %608, %608
  %625 = fmul float %609, %609
  %626 = fmul float %610, %610
  %627 = fmul float %611, %611
  %628 = fmul float %612, %612
  %629 = fmul float %613, %613
  %630 = fmul float %614, %614
  %631 = fmul float %615, %615
  %632 = fmul float %616, %616
  %633 = fmul float %617, %617
  %634 = fmul float %618, %618
  %635 = fmul float %619, %619
  %636 = fmul float %620, %620
  %637 = fmul float %621, %621
  %638 = fadd float %622, %623
  %639 = fadd float %638, %624
  %640 = fadd float %639, %625
  %641 = fadd float %640, %626
  %642 = fadd float %641, %627
  %643 = fadd float %642, %628
  %644 = fadd float %643, %629
  %645 = fadd float %644, %630
  %646 = fadd float %645, %631
  %647 = fadd float %646, %632
  %648 = fadd float %647, %633
  %649 = fadd float %648, %634
  %650 = fadd float %649, %635
  %651 = fadd float %650, %636
  %652 = fadd float %651, %637
  %653 = bitcast float %652 to i32
  %654 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %653, i32 16, i32 31)
  %655 = bitcast i32 %654 to float
  %656 = fadd float %652, %655
  %657 = bitcast float %656 to i32
  %658 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %657, i32 8, i32 31)
  %659 = bitcast i32 %658 to float
  %660 = fadd float %656, %659
  %661 = bitcast float %660 to i32
  %662 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %661, i32 4, i32 31)
  %663 = bitcast i32 %662 to float
  %664 = fadd float %660, %663
  %665 = bitcast float %664 to i32
  %666 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %665, i32 2, i32 31)
  %667 = bitcast i32 %666 to float
  %668 = fadd float %664, %667
  %669 = bitcast float %668 to i32
  %670 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %669, i32 1, i32 31)
  %671 = bitcast i32 %670 to float
  %672 = fadd float %668, %671
  %673 = icmp eq i32 %6, 0
  %674 = zext nneg i32 %7 to i64
  %675 = getelementptr float, ptr addrspace(3) @global_smem, i64 %674
  %676 = bitcast float %672 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %675, <1 x i32> %676, i1 %673) #9
  tail call void @llvm.nvvm.barrier0()
  %677 = icmp samesign ult i32 %5, 2
  %678 = zext nneg i32 %5 to i64
  %679 = getelementptr float, ptr addrspace(3) @global_smem, i64 %678
  %680 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %679, i1 %677) #9
  %681 = bitcast i32 %680 to float
  %682 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %680, i32 1, i32 31)
  %683 = bitcast i32 %682 to float
  %684 = fadd float %681, %683
  %685 = icmp eq i32 %5, 0
  %686 = bitcast float %684 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %679, <1 x i32> %686, i1 %685) #9
  tail call void @llvm.nvvm.barrier0()
  %687 = load float, ptr addrspace(3) @global_smem, align 16
  %688 = fmul float %687, 0x3F50000000000000
  %689 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %690 = bitcast i32 %689 to float
  %691 = fadd float %688, %690
  %692 = tail call float @llvm.nvvm.rsqrt.approx.f(float %691)
  %693 = fmul float %606, %692
  %694 = fmul float %607, %692
  %695 = fmul float %608, %692
  %696 = fmul float %609, %692
  %697 = fmul float %610, %692
  %698 = fmul float %611, %692
  %699 = fmul float %612, %692
  %700 = fmul float %613, %692
  %701 = fmul float %614, %692
  %702 = fmul float %615, %692
  %703 = fmul float %616, %692
  %704 = fmul float %617, %692
  %705 = fmul float %618, %692
  %706 = fmul float %619, %692
  %707 = fmul float %620, %692
  %708 = fmul float %621, %692
  %709 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %710 = getelementptr i8, ptr addrspace(1) %709, i64 1024
  %711 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %709) #9
  %712 = extractvalue { i32, i32, i32, i32 } %711, 0
  %713 = bitcast i32 %712 to <2 x bfloat>
  %714 = extractvalue { i32, i32, i32, i32 } %711, 1
  %715 = bitcast i32 %714 to <2 x bfloat>
  %716 = extractvalue { i32, i32, i32, i32 } %711, 2
  %717 = bitcast i32 %716 to <2 x bfloat>
  %718 = extractvalue { i32, i32, i32, i32 } %711, 3
  %719 = bitcast i32 %718 to <2 x bfloat>
  %720 = extractelement <2 x bfloat> %713, i64 0
  %721 = extractelement <2 x bfloat> %713, i64 1
  %722 = extractelement <2 x bfloat> %715, i64 0
  %723 = extractelement <2 x bfloat> %715, i64 1
  %724 = extractelement <2 x bfloat> %717, i64 0
  %725 = extractelement <2 x bfloat> %717, i64 1
  %726 = extractelement <2 x bfloat> %719, i64 0
  %727 = extractelement <2 x bfloat> %719, i64 1
  %728 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %710) #9
  %729 = extractvalue { i32, i32, i32, i32 } %728, 0
  %730 = bitcast i32 %729 to <2 x bfloat>
  %731 = extractvalue { i32, i32, i32, i32 } %728, 1
  %732 = bitcast i32 %731 to <2 x bfloat>
  %733 = extractvalue { i32, i32, i32, i32 } %728, 2
  %734 = bitcast i32 %733 to <2 x bfloat>
  %735 = extractvalue { i32, i32, i32, i32 } %728, 3
  %736 = bitcast i32 %735 to <2 x bfloat>
  %737 = extractelement <2 x bfloat> %730, i64 0
  %738 = extractelement <2 x bfloat> %730, i64 1
  %739 = extractelement <2 x bfloat> %732, i64 0
  %740 = extractelement <2 x bfloat> %732, i64 1
  %741 = extractelement <2 x bfloat> %734, i64 0
  %742 = extractelement <2 x bfloat> %734, i64 1
  %743 = extractelement <2 x bfloat> %736, i64 0
  %744 = extractelement <2 x bfloat> %736, i64 1
  %745 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %720) #9
  %746 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %721) #9
  %747 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %722) #9
  %748 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %723) #9
  %749 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %724) #9
  %750 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %725) #9
  %751 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %726) #9
  %752 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %727) #9
  %753 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %737) #9
  %754 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %738) #9
  %755 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %739) #9
  %756 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %740) #9
  %757 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %741) #9
  %758 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %742) #9
  %759 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %743) #9
  %760 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %744) #9
  %761 = fmul float %693, %745
  %762 = fmul float %694, %746
  %763 = fmul float %695, %747
  %764 = fmul float %696, %748
  %765 = fmul float %697, %749
  %766 = fmul float %698, %750
  %767 = fmul float %699, %751
  %768 = fmul float %700, %752
  %769 = fmul float %701, %753
  %770 = fmul float %702, %754
  %771 = fmul float %703, %755
  %772 = fmul float %704, %756
  %773 = fmul float %705, %757
  %774 = fmul float %706, %758
  %775 = fmul float %707, %759
  %776 = fmul float %708, %760
  %777 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %761) #9
  %778 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %762) #9
  %779 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %763) #9
  %780 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %764) #9
  %781 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %765) #9
  %782 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %766) #9
  %783 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %767) #9
  %784 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %768) #9
  %785 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %769) #9
  %786 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %770) #9
  %787 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %771) #9
  %788 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %772) #9
  %789 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %773) #9
  %790 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %774) #9
  %791 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %775) #9
  %792 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %776) #9
  %793 = getelementptr bfloat, ptr addrspace(1) %arg817, i64 %3
  %794 = getelementptr bfloat, ptr addrspace(1) %793, i64 %13
  %795 = getelementptr i8, ptr addrspace(1) %794, i64 1024
  %796 = insertelement <2 x bfloat> poison, bfloat %777, i64 0
  %797 = insertelement <2 x bfloat> %796, bfloat %778, i64 1
  %798 = bitcast <2 x bfloat> %797 to i32
  %799 = insertelement <2 x bfloat> poison, bfloat %779, i64 0
  %800 = insertelement <2 x bfloat> %799, bfloat %780, i64 1
  %801 = bitcast <2 x bfloat> %800 to i32
  %802 = insertelement <2 x bfloat> poison, bfloat %781, i64 0
  %803 = insertelement <2 x bfloat> %802, bfloat %782, i64 1
  %804 = bitcast <2 x bfloat> %803 to i32
  %805 = insertelement <2 x bfloat> poison, bfloat %783, i64 0
  %806 = insertelement <2 x bfloat> %805, bfloat %784, i64 1
  %807 = bitcast <2 x bfloat> %806 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %798, i32 %801, i32 %804, i32 %807, ptr addrspace(1) %794) #9
  %808 = insertelement <2 x bfloat> poison, bfloat %785, i64 0
  %809 = insertelement <2 x bfloat> %808, bfloat %786, i64 1
  %810 = bitcast <2 x bfloat> %809 to i32
  %811 = insertelement <2 x bfloat> poison, bfloat %787, i64 0
  %812 = insertelement <2 x bfloat> %811, bfloat %788, i64 1
  %813 = bitcast <2 x bfloat> %812 to i32
  %814 = insertelement <2 x bfloat> poison, bfloat %789, i64 0
  %815 = insertelement <2 x bfloat> %814, bfloat %790, i64 1
  %816 = bitcast <2 x bfloat> %815 to i32
  %817 = insertelement <2 x bfloat> poison, bfloat %791, i64 0
  %818 = insertelement <2 x bfloat> %817, bfloat %792, i64 1
  %819 = bitcast <2 x bfloat> %818 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %810, i32 %813, i32 %816, i32 %819, ptr addrspace(1) %795) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(524288) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 258048
  %11 = or disjoint i32 %10, %8
  %12 = or disjoint i32 %11, %5
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 6144
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !6
  %17 = or disjoint i32 %7, %5
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %18
  store bfloat %16, ptr addrspace(1) %19, align 2
  ret void
}

define ptx_kernel void @triton_softmax_6_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2) local_unnamed_addr #5 {
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 9
  %4 = and i64 %3, 512
  %5 = shl nsw i64 %2, 11
  %6 = or disjoint i64 %5, %4
  %7 = or i64 %6, 2048
  %8 = getelementptr bfloat, ptr addrspace(1) %arg117, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = shl nuw nsw i32 %9, 3
  %11 = and i32 %10, 248
  %12 = icmp samesign ugt i32 %9, 31
  %13 = select i1 %12, i32 256, i32 0
  %14 = or disjoint i32 %11, %13
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr bfloat, ptr addrspace(1) %8, i64 %15
  %17 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
  %18 = extractvalue { i32, i32, i32, i32 } %17, 0
  %19 = bitcast i32 %18 to <2 x bfloat>
  %20 = extractvalue { i32, i32, i32, i32 } %17, 1
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %17, 2
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractvalue { i32, i32, i32, i32 } %17, 3
  %25 = bitcast i32 %24 to <2 x bfloat>
  %26 = extractelement <2 x bfloat> %19, i64 0
  %27 = extractelement <2 x bfloat> %19, i64 1
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = extractelement <2 x bfloat> %25, i64 0
  %33 = extractelement <2 x bfloat> %25, i64 1
  %34 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %35 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %36 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %37 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %38 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %39 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %42 = fmul float %34, %34
  %43 = fmul float %35, %35
  %44 = fmul float %36, %36
  %45 = fmul float %37, %37
  %46 = fmul float %38, %38
  %47 = fmul float %39, %39
  %48 = fmul float %40, %40
  %49 = fmul float %41, %41
  %50 = fadd float %42, %43
  %51 = fadd float %50, %44
  %52 = fadd float %51, %45
  %53 = fadd float %52, %46
  %54 = fadd float %53, %47
  %55 = fadd float %54, %48
  %56 = fadd float %55, %49
  %57 = bitcast float %56 to i32
  %58 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %57, i32 8, i32 31)
  %59 = bitcast i32 %58 to float
  %60 = fadd float %56, %59
  %61 = bitcast float %60 to i32
  %62 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %61, i32 4, i32 31)
  %63 = bitcast i32 %62 to float
  %64 = fadd float %60, %63
  %65 = bitcast float %64 to i32
  %66 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %65, i32 2, i32 31)
  %67 = bitcast i32 %66 to float
  %68 = fadd float %64, %67
  %69 = bitcast float %68 to i32
  %70 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %69, i32 1, i32 31)
  %71 = bitcast i32 %70 to float
  %72 = fadd float %68, %71
  %73 = fmul float %72, 7.812500e-03
  %74 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg015) #9
  %75 = bitcast i32 %74 to float
  %76 = fadd float %73, %75
  %77 = tail call float @llvm.nvvm.rsqrt.approx.f(float %76)
  %78 = fmul float %34, %77
  %79 = fmul float %35, %77
  %80 = fmul float %36, %77
  %81 = fmul float %37, %77
  %82 = fmul float %38, %77
  %83 = fmul float %39, %77
  %84 = fmul float %40, %77
  %85 = fmul float %41, %77
  %86 = getelementptr i8, ptr addrspace(1) %arg219, i64 %5
  %87 = select i1 %12, i64 128, i64 0
  %88 = select i1 %12, i64 384, i64 256
  %89 = shl nuw nsw i32 %9, 2
  %90 = and i32 %89, 124
  %91 = zext nneg i32 %90 to i64
  %92 = or disjoint i64 %87, %91
  %93 = or disjoint i64 %88, %91
  %94 = getelementptr float, ptr addrspace(1) %86, i64 %92
  %95 = getelementptr float, ptr addrspace(1) %86, i64 %93
  %96 = select i1 %12, i32 128, i32 0
  %97 = or disjoint i32 %90, %96
  %98 = lshr i32 %14, 4
  %99 = and i32 %98, 24
  %100 = add nuw nsw i32 %99, %14
  %101 = zext nneg i32 %100 to i64
  %102 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %101
  %103 = bitcast float %78 to i32
  %104 = bitcast float %79 to i32
  %105 = bitcast float %80 to i32
  %106 = bitcast float %81 to i32
  %107 = bitcast float %82 to i32
  %108 = bitcast float %83 to i32
  %109 = bitcast float %84 to i32
  %110 = bitcast float %85 to i32
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %102, i32 %103, i32 %104, i32 %105, i32 %106, i1 true) #9
  %111 = getelementptr inbounds nuw i8, ptr addrspace(3) %102, i64 16
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) nonnull %111, i32 %107, i32 %108, i32 %109, i32 %110, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %112 = lshr exact i32 %96, 4
  %113 = add nuw nsw i32 %112, %97
  %114 = zext nneg i32 %113 to i64
  %115 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %114
  %116 = or disjoint i32 %97, 256
  %117 = lshr i32 %116, 4
  %118 = and i32 %117, 24
  %119 = zext nneg i32 %118 to i64
  %120 = zext nneg i32 %97 to i64
  %121 = add i64 %119, %120
  %122 = getelementptr float, ptr addrspace(3) @global_smem, i64 %121
  %123 = getelementptr inbounds i8, ptr addrspace(3) %122, i64 1024
  %124 = load <4 x i32>, ptr addrspace(3) %123, align 16
  %125 = load <4 x i32>, ptr addrspace(3) %115, align 16
  %.extract21 = extractelement <4 x i32> %125, i32 0
  %.extract822 = extractelement <4 x i32> %125, i32 1
  %.extract923 = extractelement <4 x i32> %125, i32 2
  %.extract1024 = extractelement <4 x i32> %125, i32 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract21, i32 %.extract822, i32 %.extract923, i32 %.extract1024, ptr addrspace(1) %94) #9
  %.extract11 = extractelement <4 x i32> %124, i64 0
  %.extract12 = extractelement <4 x i32> %124, i64 1
  %.extract13 = extractelement <4 x i32> %124, i64 2
  %.extract14 = extractelement <4 x i32> %124, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract11, i32 %.extract12, i32 %.extract13, i32 %.extract14, ptr addrspace(1) %95) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(262144) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(256) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %4) local_unnamed_addr #6 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !14
  %13 = lshr i32 %12, 2
  %14 = and i32 %11, 63
  %15 = shl nuw nsw i32 %11, 1
  %16 = and i32 %15, 128
  %17 = shl nuw nsw i32 %12, 8
  %18 = or disjoint i32 %16, %17
  %19 = or disjoint i32 %18, %14
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr float, ptr addrspace(1) %10, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !6
  %23 = zext nneg i32 %14 to i64
  %24 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %23
  %25 = load bfloat, ptr addrspace(1) %24, align 2, !invariant.load !6
  %26 = fpext bfloat %25 to float
  %27 = fmul float %22, %26
  tail call void @llvm.experimental.noalias.scope.decl(metadata !15)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !18)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !6, !alias.scope !18, !noalias !15
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !6, !alias.scope !15, !noalias !18
  %38 = fpext bfloat %37 to float
  %39 = fmul float %27, %38
  %40 = or i32 %11, 64
  %41 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 256
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !6
  %43 = zext nneg i32 %40 to i64
  %44 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %43
  %45 = load bfloat, ptr addrspace(1) %44, align 2, !invariant.load !6
  %46 = fpext bfloat %45 to float
  %47 = fmul float %42, %46
  %48 = or disjoint i32 %33, %40
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %49
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !6, !alias.scope !20, !noalias !23
  %52 = fpext bfloat %51 to float
  %53 = fmul float %47, %52
  %54 = fsub float %39, %53
  %55 = fptrunc float %54 to bfloat
  %56 = getelementptr bfloat, ptr addrspace(1) %6, i64 %20
  store bfloat %55, ptr addrspace(1) %56, align 2
  %57 = fmul float %47, %38
  %58 = fmul float %27, %52
  %59 = fadd float %57, %58
  %60 = fptrunc float %59 to bfloat
  %61 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 128
  store bfloat %60, ptr addrspace(1) %61, align 2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_slice_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(277413888) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(138706944) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %7 = shl nuw nsw i32 %5, 2
  %8 = shl nuw nsw i32 %6, 9
  %9 = or disjoint i32 %7, %8
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %10
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 138706944
  %13 = load <4 x bfloat>, ptr addrspace(1) %12, align 8, !invariant.load !6
  %14 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %10
  store <4 x bfloat> %13, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_1(ptr noalias readonly align 16 captures(none) dereferenceable(277413888) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(138706944) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %7 = shl nuw nsw i32 %5, 2
  %8 = shl nuw nsw i32 %6, 9
  %9 = or disjoint i32 %7, %8
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %10
  %12 = load <4 x bfloat>, ptr addrspace(1) %11, align 8, !invariant.load !6
  %13 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %10
  store <4 x bfloat> %12, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.rsqrt.approx.f(float) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { "nvvm.reqntid"="128,1,1" }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { "nvvm.reqntid"="64,1,1" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 0, i32 128}
!5 = !{i32 0, i32 512}
!6 = !{}
!7 = !{i32 0, i32 1536}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_3_param_0_210: argument 0"}
!10 = distinct !{!10, !"fused_convert_3_param_0_210"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_3_param_0_210: argument 0"}
!13 = distinct !{!13, !"fused_convert_3_param_0_210"}
!14 = !{i32 0, i32 256}
!15 = !{!16}
!16 = distinct !{!16, !17, !"fused_concatenate_convert_316_7: argument 0"}
!17 = distinct !{!17, !"fused_concatenate_convert_316_7"}
!18 = !{!19}
!19 = distinct !{!19, !17, !"fused_concatenate_convert_316_7: argument 1"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"fused_concatenate_convert_316_7: argument 0"}
!22 = distinct !{!22, !"fused_concatenate_convert_316_7"}
!23 = !{!24}
!24 = distinct !{!24, !22, !"fused_concatenate_convert_316_7: argument 1"}
!25 = !{i32 0, i32 135456}

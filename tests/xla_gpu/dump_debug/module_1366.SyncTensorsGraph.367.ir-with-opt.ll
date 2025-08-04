; ModuleID = 'SyncTensorsGraph.367'
source_filename = "SyncTensorsGraph.367"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(128) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %2) local_unnamed_addr #0 {
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

define ptx_kernel void @gemm_fusion_dot_11_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3) local_unnamed_addr #3 {
  %arg3124 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2122 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0118 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 48, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 6
  %9 = icmp slt i32 %8, 1024
  %.v = select i1 %9, ptr addrspace(1) %arg0118, ptr addrspace(1) %arg1120
  %10 = icmp slt i32 %8, 2048
  %.v1 = select i1 %10, ptr addrspace(1) %.v, ptr addrspace(1) %arg2122
  %11 = add i32 %8, -1024
  %12 = add i32 %8, -2048
  %13 = select i1 %9, i32 %8, i32 %11
  %14 = select i1 %10, i32 %13, i32 %12
  %15 = sext i32 %14 to i64
  %16 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = and i32 %16, 16
  %.not = icmp eq i32 %17, 0
  %18 = and i32 %16, 32
  %19 = icmp eq i32 %18, 0
  %.lobit2 = lshr i32 %16, 4
  %20 = and i32 %.lobit2, 3
  %21 = icmp samesign ult i32 %16, 64
  %22 = select i1 %21, i32 0, i32 4
  %23 = or disjoint i32 %20, %22
  %24 = or disjoint i32 %23, 8
  %25 = or disjoint i32 %23, 16
  %26 = or disjoint i32 %23, 24
  %27 = or disjoint i32 %23, 32
  %28 = or disjoint i32 %23, 40
  %29 = or disjoint i32 %23, 48
  %30 = or disjoint i32 %23, 56
  %31 = zext nneg i32 %23 to i64
  %32 = zext nneg i32 %24 to i64
  %33 = zext nneg i32 %25 to i64
  %34 = zext nneg i32 %26 to i64
  %35 = zext nneg i32 %27 to i64
  %36 = zext nneg i32 %28 to i64
  %37 = zext nneg i32 %29 to i64
  %38 = zext nneg i32 %30 to i64
  %39 = or disjoint i64 %15, %31
  %40 = or disjoint i64 %15, %32
  %41 = or disjoint i64 %15, %33
  %42 = or disjoint i64 %15, %34
  %43 = or disjoint i64 %15, %35
  %44 = or disjoint i64 %15, %36
  %45 = or disjoint i64 %15, %37
  %46 = or disjoint i64 %15, %38
  %47 = shl nsw i64 %39, 11
  %48 = shl nsw i64 %40, 11
  %49 = shl nsw i64 %41, 11
  %50 = shl nsw i64 %42, 11
  %51 = shl nsw i64 %43, 11
  %52 = shl nsw i64 %44, 11
  %53 = shl nsw i64 %45, 11
  %54 = shl nsw i64 %46, 11
  %55 = and i32 %16, 1
  %56 = icmp eq i32 %55, 0
  %57 = and i32 %16, 2
  %58 = icmp eq i32 %57, 0
  %59 = and i32 %16, 4
  %.not6 = icmp eq i32 %59, 0
  %60 = shl nuw nsw i32 %16, 3
  %61 = and i32 %60, 120
  %62 = zext nneg i32 %61 to i64
  %63 = or disjoint i64 %47, %62
  %64 = or disjoint i64 %48, %62
  %65 = or disjoint i64 %49, %62
  %66 = or disjoint i64 %50, %62
  %67 = or disjoint i64 %51, %62
  %68 = or disjoint i64 %52, %62
  %69 = or disjoint i64 %53, %62
  %70 = or disjoint i64 %54, %62
  %71 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %63
  %72 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %64
  %73 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %65
  %74 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %66
  %75 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %67
  %76 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %68
  %77 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %69
  %78 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %70
  %79 = select i1 %.not, i32 0, i32 136
  %80 = select i1 %19, i32 0, i32 272
  %81 = select i1 %21, i32 0, i32 544
  %82 = or disjoint i32 %79, %81
  %83 = xor i32 %82, %61
  %84 = xor i32 %83, %80
  %85 = zext nneg i32 %84 to i64
  %86 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %85
  %87 = or disjoint i32 %61, 1024
  %88 = xor i32 %82, %87
  %89 = xor i32 %88, %80
  %90 = zext nneg i32 %89 to i64
  %91 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %90
  %92 = or disjoint i32 %61, 2048
  %93 = xor i32 %82, %92
  %94 = xor i32 %93, %80
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %95
  %97 = or disjoint i32 %61, 3072
  %98 = xor i32 %82, %97
  %99 = xor i32 %98, %80
  %100 = zext nneg i32 %99 to i64
  %101 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %100
  %102 = or disjoint i32 %61, 4096
  %103 = xor i32 %82, %102
  %104 = xor i32 %103, %80
  %105 = zext nneg i32 %104 to i64
  %106 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %105
  %107 = or disjoint i32 %61, 5120
  %108 = xor i32 %82, %107
  %109 = xor i32 %108, %80
  %110 = zext nneg i32 %109 to i64
  %111 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %110
  %112 = or disjoint i32 %61, 6144
  %113 = xor i32 %82, %112
  %114 = xor i32 %113, %80
  %115 = zext nneg i32 %114 to i64
  %116 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %115
  %117 = or disjoint i32 %61, 7168
  %118 = xor i32 %82, %117
  %119 = xor i32 %118, %80
  %120 = zext nneg i32 %119 to i64
  %121 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %120
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %86, ptr addrspace(1) %71, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %91, ptr addrspace(1) %72, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %96, ptr addrspace(1) %73, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %101, ptr addrspace(1) %74, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %106, ptr addrspace(1) %75, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %111, ptr addrspace(1) %76, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %116, ptr addrspace(1) %77, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %121, ptr addrspace(1) %78, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %122 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %47
  %123 = getelementptr bfloat, ptr addrspace(1) %122, i64 %62
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 256
  %125 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %48
  %126 = getelementptr bfloat, ptr addrspace(1) %125, i64 %62
  %127 = getelementptr i8, ptr addrspace(1) %126, i64 256
  %128 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %49
  %129 = getelementptr bfloat, ptr addrspace(1) %128, i64 %62
  %130 = getelementptr i8, ptr addrspace(1) %129, i64 256
  %131 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %50
  %132 = getelementptr bfloat, ptr addrspace(1) %131, i64 %62
  %133 = getelementptr i8, ptr addrspace(1) %132, i64 256
  %134 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %51
  %135 = getelementptr bfloat, ptr addrspace(1) %134, i64 %62
  %136 = getelementptr i8, ptr addrspace(1) %135, i64 256
  %137 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %52
  %138 = getelementptr bfloat, ptr addrspace(1) %137, i64 %62
  %139 = getelementptr i8, ptr addrspace(1) %138, i64 256
  %140 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %53
  %141 = getelementptr bfloat, ptr addrspace(1) %140, i64 %62
  %142 = getelementptr i8, ptr addrspace(1) %141, i64 256
  %143 = getelementptr bfloat, ptr addrspace(1) %.v1, i64 %54
  %144 = getelementptr bfloat, ptr addrspace(1) %143, i64 %62
  %145 = getelementptr i8, ptr addrspace(1) %144, i64 256
  tail call void @llvm.nvvm.barrier0()
  %146 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %85
  %147 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %90
  %148 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %95
  %149 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %100
  %150 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %105
  %151 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %110
  %152 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %115
  %153 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %120
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %146, ptr addrspace(1) %124, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %147, ptr addrspace(1) %127, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %148, ptr addrspace(1) %130, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %149, ptr addrspace(1) %133, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %150, ptr addrspace(1) %136, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %151, ptr addrspace(1) %139, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %142, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %153, ptr addrspace(1) %145, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %154 = getelementptr i8, ptr addrspace(1) %123, i64 512
  %155 = getelementptr i8, ptr addrspace(1) %126, i64 512
  %156 = getelementptr i8, ptr addrspace(1) %129, i64 512
  %157 = getelementptr i8, ptr addrspace(1) %132, i64 512
  %158 = getelementptr i8, ptr addrspace(1) %135, i64 512
  %159 = getelementptr i8, ptr addrspace(1) %138, i64 512
  %160 = getelementptr i8, ptr addrspace(1) %141, i64 512
  %161 = getelementptr i8, ptr addrspace(1) %144, i64 512
  tail call void @llvm.nvvm.barrier0()
  %162 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %85
  %163 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %90
  %164 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %95
  %165 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %100
  %166 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %105
  %167 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %110
  %168 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %115
  %169 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %120
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %154, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %163, ptr addrspace(1) %155, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %164, ptr addrspace(1) %156, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %165, ptr addrspace(1) %157, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %166, ptr addrspace(1) %158, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %167, ptr addrspace(1) %159, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %160, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %169, ptr addrspace(1) %161, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %170 = select i1 %56, i32 0, i32 136
  %171 = select i1 %58, i32 0, i32 272
  %172 = or disjoint i32 %170, %171
  %173 = select i1 %.not6, i32 0, i32 544
  %174 = shl nuw nsw i32 %16, 7
  %175 = and i32 %174, 1024
  %176 = or disjoint i32 %173, %175
  %177 = or disjoint i32 %176, %172
  %178 = lshr exact i32 %17, 1
  %179 = xor i32 %177, %178
  %180 = select i1 %21, i32 0, i32 2048
  %181 = or disjoint i32 %179, %180
  %182 = zext nneg i32 %181 to i64
  %183 = or disjoint i32 %170, 16
  %184 = xor i32 %183, %171
  %185 = or disjoint i32 %175, %184
  %186 = or disjoint i32 %185, %173
  %187 = or disjoint i32 %180, %178
  %188 = xor i32 %187, %186
  %189 = zext nneg i32 %188 to i64
  %190 = or disjoint i32 %172, 32
  %191 = xor i32 %190, %173
  %192 = or disjoint i32 %191, %175
  %193 = xor i32 %187, %192
  %194 = zext nneg i32 %193 to i64
  %195 = or disjoint i32 %170, 48
  %196 = or disjoint i32 %173, %171
  %197 = xor i32 %196, %195
  %198 = or disjoint i32 %197, %175
  %199 = xor i32 %187, %198
  %200 = zext nneg i32 %199 to i64
  %201 = or disjoint i32 %177, 64
  %202 = xor i32 %187, %201
  %203 = zext nneg i32 %202 to i64
  %204 = or disjoint i32 %170, 80
  %205 = xor i32 %204, %171
  %206 = or disjoint i32 %175, %205
  %207 = or disjoint i32 %206, %173
  %208 = xor i32 %187, %207
  %209 = zext nneg i32 %208 to i64
  %210 = or disjoint i32 %172, 96
  %211 = xor i32 %210, %173
  %212 = or disjoint i32 %211, %175
  %213 = xor i32 %187, %212
  %214 = zext nneg i32 %213 to i64
  %215 = or disjoint i32 %170, 112
  %216 = xor i32 %196, %215
  %217 = or disjoint i32 %216, %175
  %218 = xor i32 %187, %217
  %219 = zext nneg i32 %218 to i64
  %220 = or disjoint i32 %177, 4096
  %221 = xor i32 %187, %220
  %222 = zext nneg i32 %221 to i64
  %223 = or disjoint i32 %170, 4112
  %224 = xor i32 %223, %171
  %225 = or disjoint i32 %175, %224
  %226 = or disjoint i32 %225, %173
  %227 = xor i32 %187, %226
  %228 = zext nneg i32 %227 to i64
  %229 = or disjoint i32 %172, 4128
  %230 = xor i32 %229, %173
  %231 = or disjoint i32 %230, %175
  %232 = xor i32 %187, %231
  %233 = zext nneg i32 %232 to i64
  %234 = or disjoint i32 %170, 4144
  %235 = xor i32 %196, %234
  %236 = or disjoint i32 %235, %175
  %237 = xor i32 %187, %236
  %238 = zext nneg i32 %237 to i64
  %239 = or disjoint i32 %177, 4160
  %240 = xor i32 %187, %239
  %241 = zext nneg i32 %240 to i64
  %242 = or disjoint i32 %170, 4176
  %243 = xor i32 %242, %171
  %244 = or disjoint i32 %175, %243
  %245 = or disjoint i32 %244, %173
  %246 = xor i32 %187, %245
  %247 = zext nneg i32 %246 to i64
  %248 = or disjoint i32 %172, 4192
  %249 = xor i32 %248, %173
  %250 = or disjoint i32 %249, %175
  %251 = xor i32 %187, %250
  %252 = zext nneg i32 %251 to i64
  %253 = or disjoint i32 %170, 4208
  %254 = xor i32 %196, %253
  %255 = or disjoint i32 %254, %175
  %256 = xor i32 %187, %255
  %257 = zext nneg i32 %256 to i64
  %258 = trunc i32 %16 to i4
  %259 = zext i4 %258 to i64
  %260 = shl nuw nsw i64 %259, 4
  %261 = add i32 %22, %20
  %262 = add i32 %261, 56
  %263 = zext nneg i32 %262 to i64
  %264 = add i64 %15, %263
  %265 = shl nsw i64 %264, 12
  %266 = add nuw nsw i64 %265, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %.v1, i64 %266
  %267 = add i32 %261, 48
  %268 = zext nneg i32 %267 to i64
  %269 = add i64 %15, %268
  %270 = shl nsw i64 %269, 12
  %271 = add nuw nsw i64 %270, 768
  %scevgep128 = getelementptr i8, ptr addrspace(1) %.v1, i64 %271
  %272 = add i32 %261, 40
  %273 = zext nneg i32 %272 to i64
  %274 = add i64 %15, %273
  %275 = shl nsw i64 %274, 12
  %276 = add nuw nsw i64 %275, 768
  %scevgep132 = getelementptr i8, ptr addrspace(1) %.v1, i64 %276
  %277 = add i32 %261, 32
  %278 = zext nneg i32 %277 to i64
  %279 = add i64 %15, %278
  %280 = shl nsw i64 %279, 12
  %281 = add nuw nsw i64 %280, 768
  %scevgep136 = getelementptr i8, ptr addrspace(1) %.v1, i64 %281
  %282 = add i32 %261, 24
  %283 = zext nneg i32 %282 to i64
  %284 = add i64 %15, %283
  %285 = shl nsw i64 %284, 12
  %286 = add nuw nsw i64 %285, 768
  %scevgep140 = getelementptr i8, ptr addrspace(1) %.v1, i64 %286
  %287 = add i32 %261, 16
  %288 = zext nneg i32 %287 to i64
  %289 = add i64 %15, %288
  %290 = shl nsw i64 %289, 12
  %291 = add nuw nsw i64 %290, 768
  %scevgep144 = getelementptr i8, ptr addrspace(1) %.v1, i64 %291
  %292 = add i32 %261, 8
  %293 = zext nneg i32 %292 to i64
  %294 = add i64 %15, %293
  %295 = shl nsw i64 %294, 12
  %296 = add nuw nsw i64 %295, 768
  %scevgep148 = getelementptr i8, ptr addrspace(1) %.v1, i64 %296
  %297 = zext nneg i32 %261 to i64
  %298 = add i64 %15, %297
  %299 = shl nsw i64 %298, 12
  %300 = add nuw nsw i64 %299, 768
  %scevgep152 = getelementptr i8, ptr addrspace(1) %.v1, i64 %300
  br label %301

301:                                              ; preds = %0, %301
  %lsr.iv156 = phi i32 [ -128, %0 ], [ %306, %301 ]
  %lsr.iv153 = phi ptr addrspace(1) [ %scevgep152, %0 ], [ %scevgep154, %301 ]
  %lsr.iv149 = phi ptr addrspace(1) [ %scevgep148, %0 ], [ %scevgep150, %301 ]
  %lsr.iv145 = phi ptr addrspace(1) [ %scevgep144, %0 ], [ %scevgep146, %301 ]
  %lsr.iv141 = phi ptr addrspace(1) [ %scevgep140, %0 ], [ %scevgep142, %301 ]
  %lsr.iv137 = phi ptr addrspace(1) [ %scevgep136, %0 ], [ %scevgep138, %301 ]
  %lsr.iv133 = phi ptr addrspace(1) [ %scevgep132, %0 ], [ %scevgep134, %301 ]
  %lsr.iv129 = phi ptr addrspace(1) [ %scevgep128, %0 ], [ %scevgep130, %301 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep126, %301 ]
  %302 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %648, %301 ]
  %303 = phi i32 [ 0, %0 ], [ %645, %301 ]
  %304 = phi i32 [ 2, %0 ], [ %630, %301 ]
  %305 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %627, %301 ]
  %306 = add i32 %lsr.iv156, 128
  %307 = icmp samesign ult i32 %306, 1664
  %308 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %182
  %309 = ptrtoint ptr addrspace(3) %308 to i64
  %310 = trunc i64 %309 to i32
  %311 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %310) #9
  %312 = extractvalue { i32, i32, i32, i32 } %311, 0
  %313 = extractvalue { i32, i32, i32, i32 } %311, 1
  %314 = extractvalue { i32, i32, i32, i32 } %311, 2
  %315 = extractvalue { i32, i32, i32, i32 } %311, 3
  %316 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %189
  %317 = ptrtoint ptr addrspace(3) %316 to i64
  %318 = trunc i64 %317 to i32
  %319 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %318) #9
  %320 = extractvalue { i32, i32, i32, i32 } %319, 0
  %321 = extractvalue { i32, i32, i32, i32 } %319, 1
  %322 = extractvalue { i32, i32, i32, i32 } %319, 2
  %323 = extractvalue { i32, i32, i32, i32 } %319, 3
  %324 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %194
  %325 = ptrtoint ptr addrspace(3) %324 to i64
  %326 = trunc i64 %325 to i32
  %327 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %326) #9
  %328 = extractvalue { i32, i32, i32, i32 } %327, 0
  %329 = extractvalue { i32, i32, i32, i32 } %327, 1
  %330 = extractvalue { i32, i32, i32, i32 } %327, 2
  %331 = extractvalue { i32, i32, i32, i32 } %327, 3
  %332 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %200
  %333 = ptrtoint ptr addrspace(3) %332 to i64
  %334 = trunc i64 %333 to i32
  %335 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %334) #9
  %336 = extractvalue { i32, i32, i32, i32 } %335, 0
  %337 = extractvalue { i32, i32, i32, i32 } %335, 1
  %338 = extractvalue { i32, i32, i32, i32 } %335, 2
  %339 = extractvalue { i32, i32, i32, i32 } %335, 3
  %340 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %203
  %341 = ptrtoint ptr addrspace(3) %340 to i64
  %342 = trunc i64 %341 to i32
  %343 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %342) #9
  %344 = extractvalue { i32, i32, i32, i32 } %343, 0
  %345 = extractvalue { i32, i32, i32, i32 } %343, 1
  %346 = extractvalue { i32, i32, i32, i32 } %343, 2
  %347 = extractvalue { i32, i32, i32, i32 } %343, 3
  %348 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %209
  %349 = ptrtoint ptr addrspace(3) %348 to i64
  %350 = trunc i64 %349 to i32
  %351 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %350) #9
  %352 = extractvalue { i32, i32, i32, i32 } %351, 0
  %353 = extractvalue { i32, i32, i32, i32 } %351, 1
  %354 = extractvalue { i32, i32, i32, i32 } %351, 2
  %355 = extractvalue { i32, i32, i32, i32 } %351, 3
  %356 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %214
  %357 = ptrtoint ptr addrspace(3) %356 to i64
  %358 = trunc i64 %357 to i32
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %358) #9
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %219
  %365 = ptrtoint ptr addrspace(3) %364 to i64
  %366 = trunc i64 %365 to i32
  %367 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %366) #9
  %368 = extractvalue { i32, i32, i32, i32 } %367, 0
  %369 = extractvalue { i32, i32, i32, i32 } %367, 1
  %370 = extractvalue { i32, i32, i32, i32 } %367, 2
  %371 = extractvalue { i32, i32, i32, i32 } %367, 3
  %372 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %222
  %373 = ptrtoint ptr addrspace(3) %372 to i64
  %374 = trunc i64 %373 to i32
  %375 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %374) #9
  %376 = extractvalue { i32, i32, i32, i32 } %375, 0
  %377 = extractvalue { i32, i32, i32, i32 } %375, 1
  %378 = extractvalue { i32, i32, i32, i32 } %375, 2
  %379 = extractvalue { i32, i32, i32, i32 } %375, 3
  %380 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %228
  %381 = ptrtoint ptr addrspace(3) %380 to i64
  %382 = trunc i64 %381 to i32
  %383 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %382) #9
  %384 = extractvalue { i32, i32, i32, i32 } %383, 0
  %385 = extractvalue { i32, i32, i32, i32 } %383, 1
  %386 = extractvalue { i32, i32, i32, i32 } %383, 2
  %387 = extractvalue { i32, i32, i32, i32 } %383, 3
  %388 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %233
  %389 = ptrtoint ptr addrspace(3) %388 to i64
  %390 = trunc i64 %389 to i32
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %390) #9
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = extractvalue { i32, i32, i32, i32 } %391, 1
  %394 = extractvalue { i32, i32, i32, i32 } %391, 2
  %395 = extractvalue { i32, i32, i32, i32 } %391, 3
  %396 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %238
  %397 = ptrtoint ptr addrspace(3) %396 to i64
  %398 = trunc i64 %397 to i32
  %399 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %398) #9
  %400 = extractvalue { i32, i32, i32, i32 } %399, 0
  %401 = extractvalue { i32, i32, i32, i32 } %399, 1
  %402 = extractvalue { i32, i32, i32, i32 } %399, 2
  %403 = extractvalue { i32, i32, i32, i32 } %399, 3
  %404 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %241
  %405 = ptrtoint ptr addrspace(3) %404 to i64
  %406 = trunc i64 %405 to i32
  %407 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %406) #9
  %408 = extractvalue { i32, i32, i32, i32 } %407, 0
  %409 = extractvalue { i32, i32, i32, i32 } %407, 1
  %410 = extractvalue { i32, i32, i32, i32 } %407, 2
  %411 = extractvalue { i32, i32, i32, i32 } %407, 3
  %412 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %247
  %413 = ptrtoint ptr addrspace(3) %412 to i64
  %414 = trunc i64 %413 to i32
  %415 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %414) #9
  %416 = extractvalue { i32, i32, i32, i32 } %415, 0
  %417 = extractvalue { i32, i32, i32, i32 } %415, 1
  %418 = extractvalue { i32, i32, i32, i32 } %415, 2
  %419 = extractvalue { i32, i32, i32, i32 } %415, 3
  %420 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %252
  %421 = ptrtoint ptr addrspace(3) %420 to i64
  %422 = trunc i64 %421 to i32
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %422) #9
  %424 = extractvalue { i32, i32, i32, i32 } %423, 0
  %425 = extractvalue { i32, i32, i32, i32 } %423, 1
  %426 = extractvalue { i32, i32, i32, i32 } %423, 2
  %427 = extractvalue { i32, i32, i32, i32 } %423, 3
  %428 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %302, i64 %257
  %429 = ptrtoint ptr addrspace(3) %428 to i64
  %430 = trunc i64 %429 to i32
  %431 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %430) #9
  %432 = extractvalue { i32, i32, i32, i32 } %431, 0
  %433 = extractvalue { i32, i32, i32, i32 } %431, 1
  %434 = extractvalue { i32, i32, i32, i32 } %431, 2
  %435 = extractvalue { i32, i32, i32, i32 } %431, 3
  %436 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 0
  %437 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 1
  %438 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 2
  %439 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 3
  %440 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 4
  %441 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 5
  %442 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 6
  %443 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 7
  %444 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 8
  %445 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 9
  %446 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 10
  %447 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 11
  %448 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 12
  %449 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 13
  %450 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 14
  %451 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %305, 15
  %452 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %436, float %437, float %438, float %439, i32 %312, i32 %313, i32 %314, i32 %315, i32 0, i32 0) #9
  %453 = extractvalue { float, float, float, float } %452, 0
  %454 = extractvalue { float, float, float, float } %452, 1
  %455 = extractvalue { float, float, float, float } %452, 2
  %456 = extractvalue { float, float, float, float } %452, 3
  %457 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %440, float %441, float %442, float %443, i32 %312, i32 %313, i32 %314, i32 %315, i32 0, i32 0) #9
  %458 = extractvalue { float, float, float, float } %457, 0
  %459 = extractvalue { float, float, float, float } %457, 1
  %460 = extractvalue { float, float, float, float } %457, 2
  %461 = extractvalue { float, float, float, float } %457, 3
  %462 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %444, float %445, float %446, float %447, i32 %376, i32 %377, i32 %378, i32 %379, i32 0, i32 0) #9
  %463 = extractvalue { float, float, float, float } %462, 0
  %464 = extractvalue { float, float, float, float } %462, 1
  %465 = extractvalue { float, float, float, float } %462, 2
  %466 = extractvalue { float, float, float, float } %462, 3
  %467 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %448, float %449, float %450, float %451, i32 %376, i32 %377, i32 %378, i32 %379, i32 0, i32 0) #9
  %468 = extractvalue { float, float, float, float } %467, 0
  %469 = extractvalue { float, float, float, float } %467, 1
  %470 = extractvalue { float, float, float, float } %467, 2
  %471 = extractvalue { float, float, float, float } %467, 3
  %472 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %453, float %454, float %455, float %456, i32 %320, i32 %321, i32 %322, i32 %323, i32 0, i32 0) #9
  %473 = extractvalue { float, float, float, float } %472, 0
  %474 = extractvalue { float, float, float, float } %472, 1
  %475 = extractvalue { float, float, float, float } %472, 2
  %476 = extractvalue { float, float, float, float } %472, 3
  %477 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %458, float %459, float %460, float %461, i32 %320, i32 %321, i32 %322, i32 %323, i32 0, i32 0) #9
  %478 = extractvalue { float, float, float, float } %477, 0
  %479 = extractvalue { float, float, float, float } %477, 1
  %480 = extractvalue { float, float, float, float } %477, 2
  %481 = extractvalue { float, float, float, float } %477, 3
  %482 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %463, float %464, float %465, float %466, i32 %384, i32 %385, i32 %386, i32 %387, i32 0, i32 0) #9
  %483 = extractvalue { float, float, float, float } %482, 0
  %484 = extractvalue { float, float, float, float } %482, 1
  %485 = extractvalue { float, float, float, float } %482, 2
  %486 = extractvalue { float, float, float, float } %482, 3
  %487 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %468, float %469, float %470, float %471, i32 %384, i32 %385, i32 %386, i32 %387, i32 0, i32 0) #9
  %488 = extractvalue { float, float, float, float } %487, 0
  %489 = extractvalue { float, float, float, float } %487, 1
  %490 = extractvalue { float, float, float, float } %487, 2
  %491 = extractvalue { float, float, float, float } %487, 3
  %492 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %473, float %474, float %475, float %476, i32 %328, i32 %329, i32 %330, i32 %331, i32 0, i32 0) #9
  %493 = extractvalue { float, float, float, float } %492, 0
  %494 = extractvalue { float, float, float, float } %492, 1
  %495 = extractvalue { float, float, float, float } %492, 2
  %496 = extractvalue { float, float, float, float } %492, 3
  %497 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %478, float %479, float %480, float %481, i32 %328, i32 %329, i32 %330, i32 %331, i32 0, i32 0) #9
  %498 = extractvalue { float, float, float, float } %497, 0
  %499 = extractvalue { float, float, float, float } %497, 1
  %500 = extractvalue { float, float, float, float } %497, 2
  %501 = extractvalue { float, float, float, float } %497, 3
  %502 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %483, float %484, float %485, float %486, i32 %392, i32 %393, i32 %394, i32 %395, i32 0, i32 0) #9
  %503 = extractvalue { float, float, float, float } %502, 0
  %504 = extractvalue { float, float, float, float } %502, 1
  %505 = extractvalue { float, float, float, float } %502, 2
  %506 = extractvalue { float, float, float, float } %502, 3
  %507 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %488, float %489, float %490, float %491, i32 %392, i32 %393, i32 %394, i32 %395, i32 0, i32 0) #9
  %508 = extractvalue { float, float, float, float } %507, 0
  %509 = extractvalue { float, float, float, float } %507, 1
  %510 = extractvalue { float, float, float, float } %507, 2
  %511 = extractvalue { float, float, float, float } %507, 3
  %512 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %493, float %494, float %495, float %496, i32 %336, i32 %337, i32 %338, i32 %339, i32 0, i32 0) #9
  %513 = extractvalue { float, float, float, float } %512, 0
  %514 = extractvalue { float, float, float, float } %512, 1
  %515 = extractvalue { float, float, float, float } %512, 2
  %516 = extractvalue { float, float, float, float } %512, 3
  %517 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %498, float %499, float %500, float %501, i32 %336, i32 %337, i32 %338, i32 %339, i32 0, i32 0) #9
  %518 = extractvalue { float, float, float, float } %517, 0
  %519 = extractvalue { float, float, float, float } %517, 1
  %520 = extractvalue { float, float, float, float } %517, 2
  %521 = extractvalue { float, float, float, float } %517, 3
  %522 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %503, float %504, float %505, float %506, i32 %400, i32 %401, i32 %402, i32 %403, i32 0, i32 0) #9
  %523 = extractvalue { float, float, float, float } %522, 0
  %524 = extractvalue { float, float, float, float } %522, 1
  %525 = extractvalue { float, float, float, float } %522, 2
  %526 = extractvalue { float, float, float, float } %522, 3
  %527 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %508, float %509, float %510, float %511, i32 %400, i32 %401, i32 %402, i32 %403, i32 0, i32 0) #9
  %528 = extractvalue { float, float, float, float } %527, 0
  %529 = extractvalue { float, float, float, float } %527, 1
  %530 = extractvalue { float, float, float, float } %527, 2
  %531 = extractvalue { float, float, float, float } %527, 3
  %532 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %513, float %514, float %515, float %516, i32 %344, i32 %345, i32 %346, i32 %347, i32 0, i32 0) #9
  %533 = extractvalue { float, float, float, float } %532, 0
  %534 = extractvalue { float, float, float, float } %532, 1
  %535 = extractvalue { float, float, float, float } %532, 2
  %536 = extractvalue { float, float, float, float } %532, 3
  %537 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %518, float %519, float %520, float %521, i32 %344, i32 %345, i32 %346, i32 %347, i32 0, i32 0) #9
  %538 = extractvalue { float, float, float, float } %537, 0
  %539 = extractvalue { float, float, float, float } %537, 1
  %540 = extractvalue { float, float, float, float } %537, 2
  %541 = extractvalue { float, float, float, float } %537, 3
  %542 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %523, float %524, float %525, float %526, i32 %408, i32 %409, i32 %410, i32 %411, i32 0, i32 0) #9
  %543 = extractvalue { float, float, float, float } %542, 0
  %544 = extractvalue { float, float, float, float } %542, 1
  %545 = extractvalue { float, float, float, float } %542, 2
  %546 = extractvalue { float, float, float, float } %542, 3
  %547 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %528, float %529, float %530, float %531, i32 %408, i32 %409, i32 %410, i32 %411, i32 0, i32 0) #9
  %548 = extractvalue { float, float, float, float } %547, 0
  %549 = extractvalue { float, float, float, float } %547, 1
  %550 = extractvalue { float, float, float, float } %547, 2
  %551 = extractvalue { float, float, float, float } %547, 3
  %552 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %533, float %534, float %535, float %536, i32 %352, i32 %353, i32 %354, i32 %355, i32 0, i32 0) #9
  %553 = extractvalue { float, float, float, float } %552, 0
  %554 = extractvalue { float, float, float, float } %552, 1
  %555 = extractvalue { float, float, float, float } %552, 2
  %556 = extractvalue { float, float, float, float } %552, 3
  %557 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %538, float %539, float %540, float %541, i32 %352, i32 %353, i32 %354, i32 %355, i32 0, i32 0) #9
  %558 = extractvalue { float, float, float, float } %557, 0
  %559 = extractvalue { float, float, float, float } %557, 1
  %560 = extractvalue { float, float, float, float } %557, 2
  %561 = extractvalue { float, float, float, float } %557, 3
  %562 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %543, float %544, float %545, float %546, i32 %416, i32 %417, i32 %418, i32 %419, i32 0, i32 0) #9
  %563 = extractvalue { float, float, float, float } %562, 0
  %564 = extractvalue { float, float, float, float } %562, 1
  %565 = extractvalue { float, float, float, float } %562, 2
  %566 = extractvalue { float, float, float, float } %562, 3
  %567 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %548, float %549, float %550, float %551, i32 %416, i32 %417, i32 %418, i32 %419, i32 0, i32 0) #9
  %568 = extractvalue { float, float, float, float } %567, 0
  %569 = extractvalue { float, float, float, float } %567, 1
  %570 = extractvalue { float, float, float, float } %567, 2
  %571 = extractvalue { float, float, float, float } %567, 3
  %572 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %553, float %554, float %555, float %556, i32 %360, i32 %361, i32 %362, i32 %363, i32 0, i32 0) #9
  %573 = extractvalue { float, float, float, float } %572, 0
  %574 = extractvalue { float, float, float, float } %572, 1
  %575 = extractvalue { float, float, float, float } %572, 2
  %576 = extractvalue { float, float, float, float } %572, 3
  %577 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %558, float %559, float %560, float %561, i32 %360, i32 %361, i32 %362, i32 %363, i32 0, i32 0) #9
  %578 = extractvalue { float, float, float, float } %577, 0
  %579 = extractvalue { float, float, float, float } %577, 1
  %580 = extractvalue { float, float, float, float } %577, 2
  %581 = extractvalue { float, float, float, float } %577, 3
  %582 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %563, float %564, float %565, float %566, i32 %424, i32 %425, i32 %426, i32 %427, i32 0, i32 0) #9
  %583 = extractvalue { float, float, float, float } %582, 0
  %584 = extractvalue { float, float, float, float } %582, 1
  %585 = extractvalue { float, float, float, float } %582, 2
  %586 = extractvalue { float, float, float, float } %582, 3
  %587 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %568, float %569, float %570, float %571, i32 %424, i32 %425, i32 %426, i32 %427, i32 0, i32 0) #9
  %588 = extractvalue { float, float, float, float } %587, 0
  %589 = extractvalue { float, float, float, float } %587, 1
  %590 = extractvalue { float, float, float, float } %587, 2
  %591 = extractvalue { float, float, float, float } %587, 3
  %592 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %573, float %574, float %575, float %576, i32 %368, i32 %369, i32 %370, i32 %371, i32 0, i32 0) #9
  %593 = extractvalue { float, float, float, float } %592, 0
  %594 = extractvalue { float, float, float, float } %592, 1
  %595 = extractvalue { float, float, float, float } %592, 2
  %596 = extractvalue { float, float, float, float } %592, 3
  %597 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %578, float %579, float %580, float %581, i32 %368, i32 %369, i32 %370, i32 %371, i32 0, i32 0) #9
  %598 = extractvalue { float, float, float, float } %597, 0
  %599 = extractvalue { float, float, float, float } %597, 1
  %600 = extractvalue { float, float, float, float } %597, 2
  %601 = extractvalue { float, float, float, float } %597, 3
  %602 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %583, float %584, float %585, float %586, i32 %432, i32 %433, i32 %434, i32 %435, i32 0, i32 0) #9
  %603 = extractvalue { float, float, float, float } %602, 0
  %604 = extractvalue { float, float, float, float } %602, 1
  %605 = extractvalue { float, float, float, float } %602, 2
  %606 = extractvalue { float, float, float, float } %602, 3
  %607 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %588, float %589, float %590, float %591, i32 %432, i32 %433, i32 %434, i32 %435, i32 0, i32 0) #9
  %608 = extractvalue { float, float, float, float } %607, 0
  %609 = extractvalue { float, float, float, float } %607, 1
  %610 = extractvalue { float, float, float, float } %607, 2
  %611 = extractvalue { float, float, float, float } %607, 3
  %612 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %593, 0
  %613 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %612, float %594, 1
  %614 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %613, float %595, 2
  %615 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %614, float %596, 3
  %616 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %615, float %598, 4
  %617 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %616, float %599, 5
  %618 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %617, float %600, 6
  %619 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %618, float %601, 7
  %620 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %619, float %603, 8
  %621 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %620, float %604, 9
  %622 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %621, float %605, 10
  %623 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %622, float %606, 11
  %624 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %623, float %608, 12
  %625 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %624, float %609, 13
  %626 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %625, float %610, 14
  %627 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %626, float %611, 15
  %628 = add i32 %304, 1
  %629 = icmp slt i32 %628, 3
  %630 = select i1 %629, i32 %628, i32 0
  %scevgep155 = getelementptr i8, ptr addrspace(1) %lsr.iv153, i64 %260
  %scevgep151 = getelementptr i8, ptr addrspace(1) %lsr.iv149, i64 %260
  %scevgep147 = getelementptr i8, ptr addrspace(1) %lsr.iv145, i64 %260
  %scevgep143 = getelementptr i8, ptr addrspace(1) %lsr.iv141, i64 %260
  %scevgep139 = getelementptr i8, ptr addrspace(1) %lsr.iv137, i64 %260
  %scevgep135 = getelementptr i8, ptr addrspace(1) %lsr.iv133, i64 %260
  %scevgep131 = getelementptr i8, ptr addrspace(1) %lsr.iv129, i64 %260
  %scevgep127 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %260
  %631 = shl i32 %630, 13
  %632 = sext i32 %631 to i64
  %633 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %632
  tail call void @llvm.nvvm.barrier0()
  %634 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %85
  %635 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %90
  %636 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %95
  %637 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %100
  %638 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %105
  %639 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %110
  %640 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %115
  %641 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %633, i64 %120
  %642 = select i1 %307, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %634, ptr addrspace(1) %scevgep155, i32 %642) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %635, ptr addrspace(1) %scevgep151, i32 %642) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %636, ptr addrspace(1) %scevgep147, i32 %642) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %637, ptr addrspace(1) %scevgep143, i32 %642) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %638, ptr addrspace(1) %scevgep139, i32 %642) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %639, ptr addrspace(1) %scevgep135, i32 %642) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %640, ptr addrspace(1) %scevgep131, i32 %642) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %641, ptr addrspace(1) %scevgep127, i32 %642) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %643 = add i32 %303, 1
  %644 = icmp slt i32 %643, 3
  %645 = select i1 %644, i32 %643, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %646 = shl i32 %645, 13
  %647 = sext i32 %646 to i64
  %648 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %647
  %scevgep126 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep130 = getelementptr i8, ptr addrspace(1) %lsr.iv129, i64 256
  %scevgep134 = getelementptr i8, ptr addrspace(1) %lsr.iv133, i64 256
  %scevgep138 = getelementptr i8, ptr addrspace(1) %lsr.iv137, i64 256
  %scevgep142 = getelementptr i8, ptr addrspace(1) %lsr.iv141, i64 256
  %scevgep146 = getelementptr i8, ptr addrspace(1) %lsr.iv145, i64 256
  %scevgep150 = getelementptr i8, ptr addrspace(1) %lsr.iv149, i64 256
  %scevgep154 = getelementptr i8, ptr addrspace(1) %lsr.iv153, i64 256
  %649 = icmp samesign ult i32 %306, 1920
  br i1 %649, label %301, label %650

650:                                              ; preds = %301
  %651 = icmp ult i32 %16, 64
  %652 = and i32 %60, 56
  %653 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %653
  %654 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %655 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %593) #9
  %656 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %594) #9
  %657 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %595) #9
  %658 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %596) #9
  %659 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %598) #9
  %660 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %599) #9
  %661 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %600) #9
  %662 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %601) #9
  %663 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %603) #9
  %664 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %604) #9
  %665 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %605) #9
  %666 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %606) #9
  %667 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %608) #9
  %668 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %609) #9
  %669 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %610) #9
  %670 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %611) #9
  %671 = shl nsw i32 %654, 5
  %672 = sext i32 %8 to i64
  %673 = sext i32 %671 to i64
  %674 = zext nneg i32 %652 to i64
  %675 = or disjoint i64 %672, %674
  %676 = lshr i32 %16, 3
  %677 = and i32 %676, 7
  %678 = select i1 %651, i32 0, i32 8
  %679 = or disjoint i32 %677, %678
  %680 = or disjoint i32 %679, 16
  %681 = zext nneg i32 %679 to i64
  %682 = zext nneg i32 %680 to i64
  %683 = or disjoint i64 %673, %681
  %684 = or disjoint i64 %673, %682
  %685 = getelementptr bfloat, ptr addrspace(1) %arg3124, i64 %675
  %.idx = mul nsw i64 %683, 6144
  %686 = getelementptr i8, ptr addrspace(1) %685, i64 %.idx
  %.idx5 = mul nsw i64 %684, 6144
  %687 = getelementptr i8, ptr addrspace(1) %685, i64 %.idx5
  %688 = and i32 %174, 384
  %689 = lshr i32 %16, 2
  %690 = and i32 %689, 3
  %691 = or disjoint i32 %690, %688
  %692 = lshr exact i32 %17, 2
  %693 = or disjoint i32 %691, %692
  %694 = shl nuw nsw i32 %18, 4
  %695 = or disjoint i32 %693, %694
  %696 = select i1 %651, i32 0, i32 16
  %697 = or disjoint i32 %695, %696
  %698 = and i32 %60, 504
  %699 = select i1 %651, i32 0, i32 512
  %700 = or disjoint i32 %698, %699
  %701 = lshr i32 %695, 3
  %702 = add nuw nsw i32 %701, %697
  %703 = zext nneg i32 %702 to i64
  %704 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %703
  %705 = bitcast bfloat %655 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %704, <1 x i16> %705, i1 true) #9
  %706 = or disjoint i32 %697, 64
  %707 = lshr i32 %706, 3
  %708 = and i32 %707, 536870904
  %709 = zext nneg i32 %708 to i64
  %710 = zext nneg i32 %697 to i64
  %711 = add i64 %709, %710
  %712 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %711
  %713 = getelementptr inbounds i8, ptr addrspace(3) %712, i64 128
  %714 = bitcast bfloat %656 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %713, <1 x i16> %714, i1 true) #9
  %715 = zext nneg i32 %701 to i64
  %716 = add i64 %710, %715
  %717 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %716
  %718 = getelementptr inbounds i8, ptr addrspace(3) %717, i64 16
  %719 = bitcast bfloat %657 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %718, <1 x i16> %719, i1 true) #9
  %720 = or disjoint i32 %697, 72
  %721 = lshr i32 %720, 3
  %722 = and i32 %721, 536870904
  %723 = zext nneg i32 %722 to i64
  %724 = add i64 %723, %710
  %725 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %724
  %726 = getelementptr inbounds i8, ptr addrspace(3) %725, i64 144
  %727 = bitcast bfloat %658 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %726, <1 x i16> %727, i1 true) #9
  %728 = getelementptr inbounds i8, ptr addrspace(3) %717, i64 64
  %729 = bitcast bfloat %663 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %728, <1 x i16> %729, i1 true) #9
  %730 = or disjoint i32 %697, 96
  %731 = lshr i32 %730, 3
  %732 = and i32 %731, 536870904
  %733 = zext nneg i32 %732 to i64
  %734 = add i64 %733, %710
  %735 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %734
  %736 = getelementptr inbounds i8, ptr addrspace(3) %735, i64 192
  %737 = bitcast bfloat %664 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %736, <1 x i16> %737, i1 true) #9
  %738 = getelementptr inbounds i8, ptr addrspace(3) %717, i64 80
  %739 = bitcast bfloat %665 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %738, <1 x i16> %739, i1 true) #9
  %740 = or disjoint i32 %697, 104
  %741 = lshr i32 %740, 3
  %742 = and i32 %741, 536870904
  %743 = zext nneg i32 %742 to i64
  %744 = add i64 %743, %710
  %745 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %744
  %746 = getelementptr inbounds i8, ptr addrspace(3) %745, i64 208
  %747 = bitcast bfloat %666 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %746, <1 x i16> %747, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %748 = lshr exact i32 %700, 3
  %749 = and i32 %748, 120
  %750 = add nuw nsw i32 %749, %700
  %751 = zext nneg i32 %750 to i64
  %752 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %751
  %753 = load <4 x i32>, ptr addrspace(3) %752, align 16
  tail call void @llvm.nvvm.barrier0()
  %754 = bitcast bfloat %659 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %704, <1 x i16> %754, i1 true) #9
  %755 = bitcast bfloat %660 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %713, <1 x i16> %755, i1 true) #9
  %756 = bitcast bfloat %661 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %718, <1 x i16> %756, i1 true) #9
  %757 = bitcast bfloat %662 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %726, <1 x i16> %757, i1 true) #9
  %758 = bitcast bfloat %667 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %728, <1 x i16> %758, i1 true) #9
  %759 = bitcast bfloat %668 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %736, <1 x i16> %759, i1 true) #9
  %760 = bitcast bfloat %669 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %738, <1 x i16> %760, i1 true) #9
  %761 = bitcast bfloat %670 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %746, <1 x i16> %761, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %762 = load <4 x i32>, ptr addrspace(3) %752, align 16
  %.extract = extractelement <4 x i32> %753, i64 0
  %.extract30 = extractelement <4 x i32> %753, i64 1
  %.extract32 = extractelement <4 x i32> %753, i64 2
  %.extract34 = extractelement <4 x i32> %753, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract30, i32 %.extract32, i32 %.extract34, ptr addrspace(1) %686) #9
  %.extract36 = extractelement <4 x i32> %762, i64 0
  %.extract38 = extractelement <4 x i32> %762, i64 1
  %.extract40 = extractelement <4 x i32> %762, i64 2
  %.extract42 = extractelement <4 x i32> %762, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract36, i32 %.extract38, i32 %.extract40, i32 %.extract42, ptr addrspace(1) %687) #9
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_50(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(196608) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 6144
  %3 = getelementptr i8, ptr addrspace(1) %arg25, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 4096
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 4096
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
  %19 = extractvalue { i32, i32, i32, i32 } %18, 0
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32, i32, i32 } %18, 1
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32, i32, i32 } %18, 2
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractvalue { i32, i32, i32, i32 } %18, 3
  %26 = bitcast i32 %25 to <2 x bfloat>
  %27 = extractelement <2 x bfloat> %20, i64 0
  %28 = extractelement <2 x bfloat> %20, i64 1
  %29 = extractelement <2 x bfloat> %22, i64 0
  %30 = extractelement <2 x bfloat> %22, i64 1
  %31 = extractelement <2 x bfloat> %24, i64 0
  %32 = extractelement <2 x bfloat> %24, i64 1
  %33 = extractelement <2 x bfloat> %26, i64 0
  %34 = extractelement <2 x bfloat> %26, i64 1
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = fadd float %52, %106
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
  %138 = fmul float %122, %122
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
  %154 = fadd float %138, %139
  %155 = fadd float %154, %140
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
  %169 = bitcast float %168 to i32
  %170 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %169, i32 16, i32 31)
  %171 = bitcast i32 %170 to float
  %172 = fadd float %168, %171
  %173 = bitcast float %172 to i32
  %174 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %173, i32 8, i32 31)
  %175 = bitcast i32 %174 to float
  %176 = fadd float %172, %175
  %177 = bitcast float %176 to i32
  %178 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %177, i32 4, i32 31)
  %179 = bitcast i32 %178 to float
  %180 = fadd float %176, %179
  %181 = bitcast float %180 to i32
  %182 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %181, i32 2, i32 31)
  %183 = bitcast i32 %182 to float
  %184 = fadd float %180, %183
  %185 = bitcast float %184 to i32
  %186 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %185, i32 1, i32 31)
  %187 = bitcast i32 %186 to float
  %188 = fadd float %184, %187
  %189 = icmp eq i32 %6, 0
  %190 = zext nneg i32 %7 to i64
  %191 = getelementptr float, ptr addrspace(3) @global_smem, i64 %190
  %192 = bitcast float %188 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %191, <1 x i32> %192, i1 %189) #9
  tail call void @llvm.nvvm.barrier0()
  %193 = icmp samesign ult i32 %5, 2
  %194 = zext nneg i32 %5 to i64
  %195 = getelementptr float, ptr addrspace(3) @global_smem, i64 %194
  %196 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %195, i1 %193) #9
  %197 = bitcast i32 %196 to float
  %198 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %196, i32 1, i32 31)
  %199 = bitcast i32 %198 to float
  %200 = fadd float %197, %199
  %201 = icmp eq i32 %5, 0
  %202 = bitcast float %200 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %195, <1 x i32> %202, i1 %201) #9
  tail call void @llvm.nvvm.barrier0()
  %203 = load float, ptr addrspace(3) @global_smem, align 16
  %204 = fmul float %203, 0x3F50000000000000
  %205 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %206 = bitcast i32 %205 to float
  %207 = fadd float %204, %206
  %208 = tail call float @llvm.nvvm.rsqrt.approx.f(float %207)
  %209 = fmul float %122, %208
  %210 = fmul float %123, %208
  %211 = fmul float %124, %208
  %212 = fmul float %125, %208
  %213 = fmul float %126, %208
  %214 = fmul float %127, %208
  %215 = fmul float %128, %208
  %216 = fmul float %129, %208
  %217 = fmul float %130, %208
  %218 = fmul float %131, %208
  %219 = fmul float %132, %208
  %220 = fmul float %133, %208
  %221 = fmul float %134, %208
  %222 = fmul float %135, %208
  %223 = fmul float %136, %208
  %224 = fmul float %137, %208
  %225 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %13
  %226 = getelementptr i8, ptr addrspace(1) %225, i64 1024
  %227 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %225) #9
  %228 = extractvalue { i32, i32, i32, i32 } %227, 0
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %227, 1
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %227, 2
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %227, 3
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractelement <2 x bfloat> %229, i64 0
  %237 = extractelement <2 x bfloat> %229, i64 1
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %226) #9
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = bitcast i32 %245 to <2 x bfloat>
  %247 = extractvalue { i32, i32, i32, i32 } %244, 1
  %248 = bitcast i32 %247 to <2 x bfloat>
  %249 = extractvalue { i32, i32, i32, i32 } %244, 2
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %244, 3
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractelement <2 x bfloat> %246, i64 0
  %254 = extractelement <2 x bfloat> %246, i64 1
  %255 = extractelement <2 x bfloat> %248, i64 0
  %256 = extractelement <2 x bfloat> %248, i64 1
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #9
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #9
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #9
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %253) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = fmul float %209, %261
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
  %293 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %277) #9
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
  %309 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %310 = getelementptr bfloat, ptr addrspace(1) %309, i64 %13
  %311 = getelementptr i8, ptr addrspace(1) %310, i64 1024
  %312 = insertelement <2 x bfloat> poison, bfloat %293, i64 0
  %313 = insertelement <2 x bfloat> %312, bfloat %294, i64 1
  %314 = bitcast <2 x bfloat> %313 to i32
  %315 = insertelement <2 x bfloat> poison, bfloat %295, i64 0
  %316 = insertelement <2 x bfloat> %315, bfloat %296, i64 1
  %317 = bitcast <2 x bfloat> %316 to i32
  %318 = insertelement <2 x bfloat> poison, bfloat %297, i64 0
  %319 = insertelement <2 x bfloat> %318, bfloat %298, i64 1
  %320 = bitcast <2 x bfloat> %319 to i32
  %321 = insertelement <2 x bfloat> poison, bfloat %299, i64 0
  %322 = insertelement <2 x bfloat> %321, bfloat %300, i64 1
  %323 = bitcast <2 x bfloat> %322 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %314, i32 %317, i32 %320, i32 %323, ptr addrspace(1) %310) #9
  %324 = insertelement <2 x bfloat> poison, bfloat %301, i64 0
  %325 = insertelement <2 x bfloat> %324, bfloat %302, i64 1
  %326 = bitcast <2 x bfloat> %325 to i32
  %327 = insertelement <2 x bfloat> poison, bfloat %303, i64 0
  %328 = insertelement <2 x bfloat> %327, bfloat %304, i64 1
  %329 = bitcast <2 x bfloat> %328 to i32
  %330 = insertelement <2 x bfloat> poison, bfloat %305, i64 0
  %331 = insertelement <2 x bfloat> %330, bfloat %306, i64 1
  %332 = bitcast <2 x bfloat> %331 to i32
  %333 = insertelement <2 x bfloat> poison, bfloat %307, i64 0
  %334 = insertelement <2 x bfloat> %333, bfloat %308, i64 1
  %335 = bitcast <2 x bfloat> %334 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %326, i32 %329, i32 %332, i32 %335, ptr addrspace(1) %311) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(393216) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(196608) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_51(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 6144
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 2048
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
  %19 = extractvalue { i32, i32, i32, i32 } %18, 0
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32, i32, i32 } %18, 1
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32, i32, i32 } %18, 2
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractvalue { i32, i32, i32, i32 } %18, 3
  %26 = bitcast i32 %25 to <2 x bfloat>
  %27 = extractelement <2 x bfloat> %20, i64 0
  %28 = extractelement <2 x bfloat> %20, i64 1
  %29 = extractelement <2 x bfloat> %22, i64 0
  %30 = extractelement <2 x bfloat> %22, i64 1
  %31 = extractelement <2 x bfloat> %24, i64 0
  %32 = extractelement <2 x bfloat> %24, i64 1
  %33 = extractelement <2 x bfloat> %26, i64 0
  %34 = extractelement <2 x bfloat> %26, i64 1
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 4096
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 4096
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = extractelement <2 x bfloat> %134, i64 0
  %142 = extractelement <2 x bfloat> %134, i64 1
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %143, 1
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %143, 2
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %143, 3
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = extractelement <2 x bfloat> %151, i64 0
  %159 = extractelement <2 x bfloat> %151, i64 1
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = extractelement <2 x bfloat> %187, i64 0
  %195 = extractelement <2 x bfloat> %187, i64 1
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %196, 1
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %196, 2
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %196, 3
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = extractelement <2 x bfloat> %204, i64 0
  %212 = extractelement <2 x bfloat> %204, i64 1
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = fadd float %160, %213
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
  %245 = fadd float %106, %229
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
  %261 = fadd float %52, %245
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
  %277 = fmul float %261, %261
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
  %293 = fadd float %277, %278
  %294 = fadd float %293, %279
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
  %308 = bitcast float %307 to i32
  %309 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %308, i32 16, i32 31)
  %310 = bitcast i32 %309 to float
  %311 = fadd float %307, %310
  %312 = bitcast float %311 to i32
  %313 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %312, i32 8, i32 31)
  %314 = bitcast i32 %313 to float
  %315 = fadd float %311, %314
  %316 = bitcast float %315 to i32
  %317 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %316, i32 4, i32 31)
  %318 = bitcast i32 %317 to float
  %319 = fadd float %315, %318
  %320 = bitcast float %319 to i32
  %321 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %320, i32 2, i32 31)
  %322 = bitcast i32 %321 to float
  %323 = fadd float %319, %322
  %324 = bitcast float %323 to i32
  %325 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %324, i32 1, i32 31)
  %326 = bitcast i32 %325 to float
  %327 = fadd float %323, %326
  %328 = icmp eq i32 %6, 0
  %329 = zext nneg i32 %7 to i64
  %330 = getelementptr float, ptr addrspace(3) @global_smem, i64 %329
  %331 = bitcast float %327 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %330, <1 x i32> %331, i1 %328) #9
  tail call void @llvm.nvvm.barrier0()
  %332 = icmp samesign ult i32 %5, 2
  %333 = zext nneg i32 %5 to i64
  %334 = getelementptr float, ptr addrspace(3) @global_smem, i64 %333
  %335 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %334, i1 %332) #9
  %336 = bitcast i32 %335 to float
  %337 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %335, i32 1, i32 31)
  %338 = bitcast i32 %337 to float
  %339 = fadd float %336, %338
  %340 = icmp eq i32 %5, 0
  %341 = bitcast float %339 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %334, <1 x i32> %341, i1 %340) #9
  tail call void @llvm.nvvm.barrier0()
  %342 = load float, ptr addrspace(3) @global_smem, align 16
  %343 = fmul float %342, 0x3F50000000000000
  %344 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %345 = bitcast i32 %344 to float
  %346 = fadd float %343, %345
  %347 = tail call float @llvm.nvvm.rsqrt.approx.f(float %346)
  %348 = fmul float %261, %347
  %349 = fmul float %262, %347
  %350 = fmul float %263, %347
  %351 = fmul float %264, %347
  %352 = fmul float %265, %347
  %353 = fmul float %266, %347
  %354 = fmul float %267, %347
  %355 = fmul float %268, %347
  %356 = fmul float %269, %347
  %357 = fmul float %270, %347
  %358 = fmul float %271, %347
  %359 = fmul float %272, %347
  %360 = fmul float %273, %347
  %361 = fmul float %274, %347
  %362 = fmul float %275, %347
  %363 = fmul float %276, %347
  %364 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %365 = getelementptr i8, ptr addrspace(1) %364, i64 1024
  %366 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %364) #9
  %367 = extractvalue { i32, i32, i32, i32 } %366, 0
  %368 = bitcast i32 %367 to <2 x bfloat>
  %369 = extractvalue { i32, i32, i32, i32 } %366, 1
  %370 = bitcast i32 %369 to <2 x bfloat>
  %371 = extractvalue { i32, i32, i32, i32 } %366, 2
  %372 = bitcast i32 %371 to <2 x bfloat>
  %373 = extractvalue { i32, i32, i32, i32 } %366, 3
  %374 = bitcast i32 %373 to <2 x bfloat>
  %375 = extractelement <2 x bfloat> %368, i64 0
  %376 = extractelement <2 x bfloat> %368, i64 1
  %377 = extractelement <2 x bfloat> %370, i64 0
  %378 = extractelement <2 x bfloat> %370, i64 1
  %379 = extractelement <2 x bfloat> %372, i64 0
  %380 = extractelement <2 x bfloat> %372, i64 1
  %381 = extractelement <2 x bfloat> %374, i64 0
  %382 = extractelement <2 x bfloat> %374, i64 1
  %383 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %365) #9
  %384 = extractvalue { i32, i32, i32, i32 } %383, 0
  %385 = bitcast i32 %384 to <2 x bfloat>
  %386 = extractvalue { i32, i32, i32, i32 } %383, 1
  %387 = bitcast i32 %386 to <2 x bfloat>
  %388 = extractvalue { i32, i32, i32, i32 } %383, 2
  %389 = bitcast i32 %388 to <2 x bfloat>
  %390 = extractvalue { i32, i32, i32, i32 } %383, 3
  %391 = bitcast i32 %390 to <2 x bfloat>
  %392 = extractelement <2 x bfloat> %385, i64 0
  %393 = extractelement <2 x bfloat> %385, i64 1
  %394 = extractelement <2 x bfloat> %387, i64 0
  %395 = extractelement <2 x bfloat> %387, i64 1
  %396 = extractelement <2 x bfloat> %389, i64 0
  %397 = extractelement <2 x bfloat> %389, i64 1
  %398 = extractelement <2 x bfloat> %391, i64 0
  %399 = extractelement <2 x bfloat> %391, i64 1
  %400 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %375) #9
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #9
  %402 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #9
  %403 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #9
  %404 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #9
  %405 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #9
  %406 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #9
  %407 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382) #9
  %408 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %392) #9
  %409 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393) #9
  %410 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394) #9
  %411 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %395) #9
  %412 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396) #9
  %413 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397) #9
  %414 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398) #9
  %415 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399) #9
  %416 = fmul float %348, %400
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
  %432 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416) #9
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
  %448 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %449 = getelementptr bfloat, ptr addrspace(1) %448, i64 %13
  %450 = getelementptr i8, ptr addrspace(1) %449, i64 1024
  %451 = insertelement <2 x bfloat> poison, bfloat %432, i64 0
  %452 = insertelement <2 x bfloat> %451, bfloat %433, i64 1
  %453 = bitcast <2 x bfloat> %452 to i32
  %454 = insertelement <2 x bfloat> poison, bfloat %434, i64 0
  %455 = insertelement <2 x bfloat> %454, bfloat %435, i64 1
  %456 = bitcast <2 x bfloat> %455 to i32
  %457 = insertelement <2 x bfloat> poison, bfloat %436, i64 0
  %458 = insertelement <2 x bfloat> %457, bfloat %437, i64 1
  %459 = bitcast <2 x bfloat> %458 to i32
  %460 = insertelement <2 x bfloat> poison, bfloat %438, i64 0
  %461 = insertelement <2 x bfloat> %460, bfloat %439, i64 1
  %462 = bitcast <2 x bfloat> %461 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %453, i32 %456, i32 %459, i32 %462, ptr addrspace(1) %449) #9
  %463 = insertelement <2 x bfloat> poison, bfloat %440, i64 0
  %464 = insertelement <2 x bfloat> %463, bfloat %441, i64 1
  %465 = bitcast <2 x bfloat> %464 to i32
  %466 = insertelement <2 x bfloat> poison, bfloat %442, i64 0
  %467 = insertelement <2 x bfloat> %466, bfloat %443, i64 1
  %468 = bitcast <2 x bfloat> %467 to i32
  %469 = insertelement <2 x bfloat> poison, bfloat %444, i64 0
  %470 = insertelement <2 x bfloat> %469, bfloat %445, i64 1
  %471 = bitcast <2 x bfloat> %470 to i32
  %472 = insertelement <2 x bfloat> poison, bfloat %446, i64 0
  %473 = insertelement <2 x bfloat> %472, bfloat %447, i64 1
  %474 = bitcast <2 x bfloat> %473 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %465, i32 %468, i32 %471, i32 %474, ptr addrspace(1) %450) #9
  ret void
}

define ptx_kernel void @fusion_52(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) local_unnamed_addr #5 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 6144
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %5 = and i32 %4, 31
  %6 = lshr i32 %4, 5
  %7 = shl nuw nsw i32 %4, 3
  %8 = and i32 %7, 248
  %9 = icmp samesign ult i32 %4, 32
  %10 = select i1 %9, i32 0, i32 256
  %11 = or disjoint i32 %8, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr bfloat, ptr addrspace(1) %3, i64 %12
  %14 = getelementptr i8, ptr addrspace(1) %13, i64 1024
  %15 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %13) #9
  %16 = extractvalue { i32, i32, i32, i32 } %15, 0
  %17 = bitcast i32 %16 to <2 x bfloat>
  %18 = extractvalue { i32, i32, i32, i32 } %15, 1
  %19 = bitcast i32 %18 to <2 x bfloat>
  %20 = extractvalue { i32, i32, i32, i32 } %15, 2
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %15, 3
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractelement <2 x bfloat> %17, i64 0
  %25 = extractelement <2 x bfloat> %17, i64 1
  %26 = extractelement <2 x bfloat> %19, i64 0
  %27 = extractelement <2 x bfloat> %19, i64 1
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #9
  %33 = extractvalue { i32, i32, i32, i32 } %32, 0
  %34 = bitcast i32 %33 to <2 x bfloat>
  %35 = extractvalue { i32, i32, i32, i32 } %32, 1
  %36 = bitcast i32 %35 to <2 x bfloat>
  %37 = extractvalue { i32, i32, i32, i32 } %32, 2
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractvalue { i32, i32, i32, i32 } %32, 3
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractelement <2 x bfloat> %34, i64 0
  %42 = extractelement <2 x bfloat> %34, i64 1
  %43 = extractelement <2 x bfloat> %36, i64 0
  %44 = extractelement <2 x bfloat> %36, i64 1
  %45 = extractelement <2 x bfloat> %38, i64 0
  %46 = extractelement <2 x bfloat> %38, i64 1
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #9
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #9
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = shl nsw i64 %2, 10
  %66 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %65
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %12
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #9
  %70 = extractvalue { i32, i32, i32, i32 } %69, 0
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractvalue { i32, i32, i32, i32 } %69, 1
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %69, 2
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %69, 3
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractelement <2 x bfloat> %71, i64 0
  %79 = extractelement <2 x bfloat> %71, i64 1
  %80 = extractelement <2 x bfloat> %73, i64 0
  %81 = extractelement <2 x bfloat> %73, i64 1
  %82 = extractelement <2 x bfloat> %75, i64 0
  %83 = extractelement <2 x bfloat> %75, i64 1
  %84 = extractelement <2 x bfloat> %77, i64 0
  %85 = extractelement <2 x bfloat> %77, i64 1
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
  %87 = extractvalue { i32, i32, i32, i32 } %86, 0
  %88 = bitcast i32 %87 to <2 x bfloat>
  %89 = extractvalue { i32, i32, i32, i32 } %86, 1
  %90 = bitcast i32 %89 to <2 x bfloat>
  %91 = extractvalue { i32, i32, i32, i32 } %86, 2
  %92 = bitcast i32 %91 to <2 x bfloat>
  %93 = extractvalue { i32, i32, i32, i32 } %86, 3
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractelement <2 x bfloat> %88, i64 0
  %96 = extractelement <2 x bfloat> %88, i64 1
  %97 = extractelement <2 x bfloat> %90, i64 0
  %98 = extractelement <2 x bfloat> %90, i64 1
  %99 = extractelement <2 x bfloat> %92, i64 0
  %100 = extractelement <2 x bfloat> %92, i64 1
  %101 = extractelement <2 x bfloat> %94, i64 0
  %102 = extractelement <2 x bfloat> %94, i64 1
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #9
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = getelementptr i8, ptr addrspace(1) %3, i64 2048
  %120 = getelementptr i8, ptr addrspace(1) %13, i64 2048
  %121 = getelementptr bfloat, ptr addrspace(1) %119, i64 %12
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #9
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
  %173 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %65
  %174 = getelementptr bfloat, ptr addrspace(1) %173, i64 %12
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #9
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractelement <2 x bfloat> %178, i64 0
  %186 = extractelement <2 x bfloat> %178, i64 1
  %187 = extractelement <2 x bfloat> %180, i64 0
  %188 = extractelement <2 x bfloat> %180, i64 1
  %189 = extractelement <2 x bfloat> %182, i64 0
  %190 = extractelement <2 x bfloat> %182, i64 1
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #9
  %194 = extractvalue { i32, i32, i32, i32 } %193, 0
  %195 = bitcast i32 %194 to <2 x bfloat>
  %196 = extractvalue { i32, i32, i32, i32 } %193, 1
  %197 = bitcast i32 %196 to <2 x bfloat>
  %198 = extractvalue { i32, i32, i32, i32 } %193, 2
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %193, 3
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractelement <2 x bfloat> %195, i64 0
  %203 = extractelement <2 x bfloat> %195, i64 1
  %204 = extractelement <2 x bfloat> %197, i64 0
  %205 = extractelement <2 x bfloat> %197, i64 1
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #9
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = getelementptr i8, ptr addrspace(1) %3, i64 4096
  %227 = getelementptr i8, ptr addrspace(1) %13, i64 4096
  %228 = getelementptr bfloat, ptr addrspace(1) %226, i64 %12
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 1024
  %230 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #9
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
  %280 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %65
  %281 = getelementptr bfloat, ptr addrspace(1) %280, i64 %12
  %282 = getelementptr i8, ptr addrspace(1) %281, i64 1024
  %283 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #9
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %283, 1
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %283, 2
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %283, 3
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractelement <2 x bfloat> %285, i64 0
  %293 = extractelement <2 x bfloat> %285, i64 1
  %294 = extractelement <2 x bfloat> %287, i64 0
  %295 = extractelement <2 x bfloat> %287, i64 1
  %296 = extractelement <2 x bfloat> %289, i64 0
  %297 = extractelement <2 x bfloat> %289, i64 1
  %298 = extractelement <2 x bfloat> %291, i64 0
  %299 = extractelement <2 x bfloat> %291, i64 1
  %300 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
  %301 = extractvalue { i32, i32, i32, i32 } %300, 0
  %302 = bitcast i32 %301 to <2 x bfloat>
  %303 = extractvalue { i32, i32, i32, i32 } %300, 1
  %304 = bitcast i32 %303 to <2 x bfloat>
  %305 = extractvalue { i32, i32, i32, i32 } %300, 2
  %306 = bitcast i32 %305 to <2 x bfloat>
  %307 = extractvalue { i32, i32, i32, i32 } %300, 3
  %308 = bitcast i32 %307 to <2 x bfloat>
  %309 = extractelement <2 x bfloat> %302, i64 0
  %310 = extractelement <2 x bfloat> %302, i64 1
  %311 = extractelement <2 x bfloat> %304, i64 0
  %312 = extractelement <2 x bfloat> %304, i64 1
  %313 = extractelement <2 x bfloat> %306, i64 0
  %314 = extractelement <2 x bfloat> %306, i64 1
  %315 = extractelement <2 x bfloat> %308, i64 0
  %316 = extractelement <2 x bfloat> %308, i64 1
  %317 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292) #9
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = fadd float %264, %317
  %334 = fadd float %265, %318
  %335 = fadd float %266, %319
  %336 = fadd float %267, %320
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
  %349 = fadd float %210, %333
  %350 = fadd float %211, %334
  %351 = fadd float %212, %335
  %352 = fadd float %213, %336
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
  %365 = fadd float %157, %349
  %366 = fadd float %158, %350
  %367 = fadd float %159, %351
  %368 = fadd float %160, %352
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
  %381 = fadd float %103, %365
  %382 = fadd float %104, %366
  %383 = fadd float %105, %367
  %384 = fadd float %106, %368
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
  %397 = fadd float %49, %381
  %398 = fadd float %50, %382
  %399 = fadd float %51, %383
  %400 = fadd float %52, %384
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
  %413 = fmul float %397, %397
  %414 = fmul float %398, %398
  %415 = fmul float %399, %399
  %416 = fmul float %400, %400
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
  %429 = fadd float %413, %414
  %430 = fadd float %429, %415
  %431 = fadd float %430, %416
  %432 = fadd float %431, %417
  %433 = fadd float %432, %418
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
  %444 = bitcast float %443 to i32
  %445 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %444, i32 16, i32 31)
  %446 = bitcast i32 %445 to float
  %447 = fadd float %443, %446
  %448 = bitcast float %447 to i32
  %449 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %448, i32 8, i32 31)
  %450 = bitcast i32 %449 to float
  %451 = fadd float %447, %450
  %452 = bitcast float %451 to i32
  %453 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %452, i32 4, i32 31)
  %454 = bitcast i32 %453 to float
  %455 = fadd float %451, %454
  %456 = bitcast float %455 to i32
  %457 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %456, i32 2, i32 31)
  %458 = bitcast i32 %457 to float
  %459 = fadd float %455, %458
  %460 = bitcast float %459 to i32
  %461 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %460, i32 1, i32 31)
  %462 = bitcast i32 %461 to float
  %463 = fadd float %459, %462
  %464 = icmp eq i32 %5, 0
  %465 = zext nneg i32 %6 to i64
  %466 = getelementptr float, ptr addrspace(3) @global_smem, i64 %465
  %467 = bitcast float %463 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %466, <1 x i32> %467, i1 %464) #9
  tail call void @llvm.nvvm.barrier0()
  %468 = icmp samesign ult i32 %4, 2
  %469 = zext nneg i32 %4 to i64
  %470 = getelementptr float, ptr addrspace(3) @global_smem, i64 %469
  %471 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %470, i1 %468) #9
  %472 = bitcast i32 %471 to float
  %473 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %471, i32 1, i32 31)
  %474 = bitcast i32 %473 to float
  %475 = fadd float %472, %474
  %476 = icmp eq i32 %4, 0
  %477 = bitcast float %475 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %470, <1 x i32> %477, i1 %476) #9
  tail call void @llvm.nvvm.barrier0()
  %478 = load float, ptr addrspace(3) @global_smem, align 16
  %479 = fmul float %478, 0x3F50000000000000
  %480 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %481 = bitcast i32 %480 to float
  %482 = fadd float %479, %481
  %483 = tail call float @llvm.nvvm.rsqrt.approx.f(float %482)
  %484 = fmul float %397, %483
  %485 = fmul float %398, %483
  %486 = fmul float %399, %483
  %487 = fmul float %400, %483
  %488 = fmul float %401, %483
  %489 = fmul float %402, %483
  %490 = fmul float %403, %483
  %491 = fmul float %404, %483
  %492 = fmul float %405, %483
  %493 = fmul float %406, %483
  %494 = fmul float %407, %483
  %495 = fmul float %408, %483
  %496 = fmul float %409, %483
  %497 = fmul float %410, %483
  %498 = fmul float %411, %483
  %499 = fmul float %412, %483
  %500 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %12
  %501 = getelementptr i8, ptr addrspace(1) %500, i64 1024
  %502 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %500) #9
  %503 = extractvalue { i32, i32, i32, i32 } %502, 0
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractvalue { i32, i32, i32, i32 } %502, 1
  %506 = bitcast i32 %505 to <2 x bfloat>
  %507 = extractvalue { i32, i32, i32, i32 } %502, 2
  %508 = bitcast i32 %507 to <2 x bfloat>
  %509 = extractvalue { i32, i32, i32, i32 } %502, 3
  %510 = bitcast i32 %509 to <2 x bfloat>
  %511 = extractelement <2 x bfloat> %504, i64 0
  %512 = extractelement <2 x bfloat> %504, i64 1
  %513 = extractelement <2 x bfloat> %506, i64 0
  %514 = extractelement <2 x bfloat> %506, i64 1
  %515 = extractelement <2 x bfloat> %508, i64 0
  %516 = extractelement <2 x bfloat> %508, i64 1
  %517 = extractelement <2 x bfloat> %510, i64 0
  %518 = extractelement <2 x bfloat> %510, i64 1
  %519 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %501) #9
  %520 = extractvalue { i32, i32, i32, i32 } %519, 0
  %521 = bitcast i32 %520 to <2 x bfloat>
  %522 = extractvalue { i32, i32, i32, i32 } %519, 1
  %523 = bitcast i32 %522 to <2 x bfloat>
  %524 = extractvalue { i32, i32, i32, i32 } %519, 2
  %525 = bitcast i32 %524 to <2 x bfloat>
  %526 = extractvalue { i32, i32, i32, i32 } %519, 3
  %527 = bitcast i32 %526 to <2 x bfloat>
  %528 = extractelement <2 x bfloat> %521, i64 0
  %529 = extractelement <2 x bfloat> %521, i64 1
  %530 = extractelement <2 x bfloat> %523, i64 0
  %531 = extractelement <2 x bfloat> %523, i64 1
  %532 = extractelement <2 x bfloat> %525, i64 0
  %533 = extractelement <2 x bfloat> %525, i64 1
  %534 = extractelement <2 x bfloat> %527, i64 0
  %535 = extractelement <2 x bfloat> %527, i64 1
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511) #9
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512) #9
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513) #9
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #9
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #9
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #9
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #9
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #9
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %528) #9
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %529) #9
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %530) #9
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #9
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #9
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #9
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #9
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #9
  %552 = fmul float %484, %536
  %553 = fmul float %485, %537
  %554 = fmul float %486, %538
  %555 = fmul float %487, %539
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
  %568 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552) #9
  %569 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553) #9
  %570 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554) #9
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #9
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
  %584 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %65
  %585 = getelementptr bfloat, ptr addrspace(1) %584, i64 %12
  %586 = getelementptr i8, ptr addrspace(1) %585, i64 1024
  %587 = insertelement <2 x bfloat> poison, bfloat %568, i64 0
  %588 = insertelement <2 x bfloat> %587, bfloat %569, i64 1
  %589 = bitcast <2 x bfloat> %588 to i32
  %590 = insertelement <2 x bfloat> poison, bfloat %570, i64 0
  %591 = insertelement <2 x bfloat> %590, bfloat %571, i64 1
  %592 = bitcast <2 x bfloat> %591 to i32
  %593 = insertelement <2 x bfloat> poison, bfloat %572, i64 0
  %594 = insertelement <2 x bfloat> %593, bfloat %573, i64 1
  %595 = bitcast <2 x bfloat> %594 to i32
  %596 = insertelement <2 x bfloat> poison, bfloat %574, i64 0
  %597 = insertelement <2 x bfloat> %596, bfloat %575, i64 1
  %598 = bitcast <2 x bfloat> %597 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %589, i32 %592, i32 %595, i32 %598, ptr addrspace(1) %585) #9
  %599 = insertelement <2 x bfloat> poison, bfloat %576, i64 0
  %600 = insertelement <2 x bfloat> %599, bfloat %577, i64 1
  %601 = bitcast <2 x bfloat> %600 to i32
  %602 = insertelement <2 x bfloat> poison, bfloat %578, i64 0
  %603 = insertelement <2 x bfloat> %602, bfloat %579, i64 1
  %604 = bitcast <2 x bfloat> %603 to i32
  %605 = insertelement <2 x bfloat> poison, bfloat %580, i64 0
  %606 = insertelement <2 x bfloat> %605, bfloat %581, i64 1
  %607 = bitcast <2 x bfloat> %606 to i32
  %608 = insertelement <2 x bfloat> poison, bfloat %582, i64 0
  %609 = insertelement <2 x bfloat> %608, bfloat %583, i64 1
  %610 = bitcast <2 x bfloat> %609 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %601, i32 %604, i32 %607, i32 %610, ptr addrspace(1) %586) #9
  ret void
}

define ptx_kernel void @fusion_53(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(196608) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) local_unnamed_addr #5 {
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
  %.idx = mul nsw i64 %2, 6144
  %66 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %13
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #9
  %70 = extractvalue { i32, i32, i32, i32 } %69, 0
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractvalue { i32, i32, i32, i32 } %69, 1
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %69, 2
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %69, 3
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractelement <2 x bfloat> %71, i64 0
  %79 = extractelement <2 x bfloat> %71, i64 1
  %80 = extractelement <2 x bfloat> %73, i64 0
  %81 = extractelement <2 x bfloat> %73, i64 1
  %82 = extractelement <2 x bfloat> %75, i64 0
  %83 = extractelement <2 x bfloat> %75, i64 1
  %84 = extractelement <2 x bfloat> %77, i64 0
  %85 = extractelement <2 x bfloat> %77, i64 1
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
  %87 = extractvalue { i32, i32, i32, i32 } %86, 0
  %88 = bitcast i32 %87 to <2 x bfloat>
  %89 = extractvalue { i32, i32, i32, i32 } %86, 1
  %90 = bitcast i32 %89 to <2 x bfloat>
  %91 = extractvalue { i32, i32, i32, i32 } %86, 2
  %92 = bitcast i32 %91 to <2 x bfloat>
  %93 = extractvalue { i32, i32, i32, i32 } %86, 3
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractelement <2 x bfloat> %88, i64 0
  %96 = extractelement <2 x bfloat> %88, i64 1
  %97 = extractelement <2 x bfloat> %90, i64 0
  %98 = extractelement <2 x bfloat> %90, i64 1
  %99 = extractelement <2 x bfloat> %92, i64 0
  %100 = extractelement <2 x bfloat> %92, i64 1
  %101 = extractelement <2 x bfloat> %94, i64 0
  %102 = extractelement <2 x bfloat> %94, i64 1
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #9
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %13
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 1024
  %122 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #9
  %123 = extractvalue { i32, i32, i32, i32 } %122, 0
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractvalue { i32, i32, i32, i32 } %122, 1
  %126 = bitcast i32 %125 to <2 x bfloat>
  %127 = extractvalue { i32, i32, i32, i32 } %122, 2
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %122, 3
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractelement <2 x bfloat> %124, i64 0
  %132 = extractelement <2 x bfloat> %124, i64 1
  %133 = extractelement <2 x bfloat> %126, i64 0
  %134 = extractelement <2 x bfloat> %126, i64 1
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
  %140 = extractvalue { i32, i32, i32, i32 } %139, 0
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractvalue { i32, i32, i32, i32 } %139, 1
  %143 = bitcast i32 %142 to <2 x bfloat>
  %144 = extractvalue { i32, i32, i32, i32 } %139, 2
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %139, 3
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractelement <2 x bfloat> %141, i64 0
  %149 = extractelement <2 x bfloat> %141, i64 1
  %150 = extractelement <2 x bfloat> %143, i64 0
  %151 = extractelement <2 x bfloat> %143, i64 1
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #9
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #9
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = getelementptr i8, ptr addrspace(1) %66, i64 2048
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr bfloat, ptr addrspace(1) %172, i64 %13
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %173) #9
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractelement <2 x bfloat> %178, i64 0
  %186 = extractelement <2 x bfloat> %178, i64 1
  %187 = extractelement <2 x bfloat> %180, i64 0
  %188 = extractelement <2 x bfloat> %180, i64 1
  %189 = extractelement <2 x bfloat> %182, i64 0
  %190 = extractelement <2 x bfloat> %182, i64 1
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #9
  %194 = extractvalue { i32, i32, i32, i32 } %193, 0
  %195 = bitcast i32 %194 to <2 x bfloat>
  %196 = extractvalue { i32, i32, i32, i32 } %193, 1
  %197 = bitcast i32 %196 to <2 x bfloat>
  %198 = extractvalue { i32, i32, i32, i32 } %193, 2
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %193, 3
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractelement <2 x bfloat> %195, i64 0
  %203 = extractelement <2 x bfloat> %195, i64 1
  %204 = extractelement <2 x bfloat> %197, i64 0
  %205 = extractelement <2 x bfloat> %197, i64 1
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #9
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %227 = getelementptr bfloat, ptr addrspace(1) %226, i64 %13
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 1024
  %229 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #9
  %230 = extractvalue { i32, i32, i32, i32 } %229, 0
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %229, 1
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %229, 2
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %229, 3
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #9
  %247 = extractvalue { i32, i32, i32, i32 } %246, 0
  %248 = bitcast i32 %247 to <2 x bfloat>
  %249 = extractvalue { i32, i32, i32, i32 } %246, 1
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %246, 2
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %246, 3
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractelement <2 x bfloat> %248, i64 0
  %256 = extractelement <2 x bfloat> %248, i64 1
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #9
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = getelementptr i8, ptr addrspace(1) %66, i64 4096
  %280 = getelementptr i8, ptr addrspace(1) %67, i64 4096
  %281 = getelementptr bfloat, ptr addrspace(1) %279, i64 %13
  %282 = getelementptr i8, ptr addrspace(1) %281, i64 1024
  %283 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %280) #9
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %283, 1
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %283, 2
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %283, 3
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractelement <2 x bfloat> %285, i64 0
  %293 = extractelement <2 x bfloat> %285, i64 1
  %294 = extractelement <2 x bfloat> %287, i64 0
  %295 = extractelement <2 x bfloat> %287, i64 1
  %296 = extractelement <2 x bfloat> %289, i64 0
  %297 = extractelement <2 x bfloat> %289, i64 1
  %298 = extractelement <2 x bfloat> %291, i64 0
  %299 = extractelement <2 x bfloat> %291, i64 1
  %300 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
  %301 = extractvalue { i32, i32, i32, i32 } %300, 0
  %302 = bitcast i32 %301 to <2 x bfloat>
  %303 = extractvalue { i32, i32, i32, i32 } %300, 1
  %304 = bitcast i32 %303 to <2 x bfloat>
  %305 = extractvalue { i32, i32, i32, i32 } %300, 2
  %306 = bitcast i32 %305 to <2 x bfloat>
  %307 = extractvalue { i32, i32, i32, i32 } %300, 3
  %308 = bitcast i32 %307 to <2 x bfloat>
  %309 = extractelement <2 x bfloat> %302, i64 0
  %310 = extractelement <2 x bfloat> %302, i64 1
  %311 = extractelement <2 x bfloat> %304, i64 0
  %312 = extractelement <2 x bfloat> %304, i64 1
  %313 = extractelement <2 x bfloat> %306, i64 0
  %314 = extractelement <2 x bfloat> %306, i64 1
  %315 = extractelement <2 x bfloat> %308, i64 0
  %316 = extractelement <2 x bfloat> %308, i64 1
  %317 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292) #9
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %334 = getelementptr bfloat, ptr addrspace(1) %333, i64 %13
  %335 = getelementptr i8, ptr addrspace(1) %334, i64 1024
  %336 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %334) #9
  %337 = extractvalue { i32, i32, i32, i32 } %336, 0
  %338 = bitcast i32 %337 to <2 x bfloat>
  %339 = extractvalue { i32, i32, i32, i32 } %336, 1
  %340 = bitcast i32 %339 to <2 x bfloat>
  %341 = extractvalue { i32, i32, i32, i32 } %336, 2
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %336, 3
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractelement <2 x bfloat> %338, i64 0
  %346 = extractelement <2 x bfloat> %338, i64 1
  %347 = extractelement <2 x bfloat> %340, i64 0
  %348 = extractelement <2 x bfloat> %340, i64 1
  %349 = extractelement <2 x bfloat> %342, i64 0
  %350 = extractelement <2 x bfloat> %342, i64 1
  %351 = extractelement <2 x bfloat> %344, i64 0
  %352 = extractelement <2 x bfloat> %344, i64 1
  %353 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #9
  %354 = extractvalue { i32, i32, i32, i32 } %353, 0
  %355 = bitcast i32 %354 to <2 x bfloat>
  %356 = extractvalue { i32, i32, i32, i32 } %353, 1
  %357 = bitcast i32 %356 to <2 x bfloat>
  %358 = extractvalue { i32, i32, i32, i32 } %353, 2
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %353, 3
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractelement <2 x bfloat> %355, i64 0
  %363 = extractelement <2 x bfloat> %355, i64 1
  %364 = extractelement <2 x bfloat> %357, i64 0
  %365 = extractelement <2 x bfloat> %357, i64 1
  %366 = extractelement <2 x bfloat> %359, i64 0
  %367 = extractelement <2 x bfloat> %359, i64 1
  %368 = extractelement <2 x bfloat> %361, i64 0
  %369 = extractelement <2 x bfloat> %361, i64 1
  %370 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %345) #9
  %371 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346) #9
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #9
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #9
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #9
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #9
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #9
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #9
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362) #9
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #9
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #9
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #9
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #9
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #9
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #9
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #9
  %386 = fadd float %317, %370
  %387 = fadd float %318, %371
  %388 = fadd float %319, %372
  %389 = fadd float %320, %373
  %390 = fadd float %321, %374
  %391 = fadd float %322, %375
  %392 = fadd float %323, %376
  %393 = fadd float %324, %377
  %394 = fadd float %325, %378
  %395 = fadd float %326, %379
  %396 = fadd float %327, %380
  %397 = fadd float %328, %381
  %398 = fadd float %329, %382
  %399 = fadd float %330, %383
  %400 = fadd float %331, %384
  %401 = fadd float %332, %385
  %402 = fadd float %263, %386
  %403 = fadd float %264, %387
  %404 = fadd float %265, %388
  %405 = fadd float %266, %389
  %406 = fadd float %267, %390
  %407 = fadd float %268, %391
  %408 = fadd float %269, %392
  %409 = fadd float %270, %393
  %410 = fadd float %271, %394
  %411 = fadd float %272, %395
  %412 = fadd float %273, %396
  %413 = fadd float %274, %397
  %414 = fadd float %275, %398
  %415 = fadd float %276, %399
  %416 = fadd float %277, %400
  %417 = fadd float %278, %401
  %418 = fadd float %210, %402
  %419 = fadd float %211, %403
  %420 = fadd float %212, %404
  %421 = fadd float %213, %405
  %422 = fadd float %214, %406
  %423 = fadd float %215, %407
  %424 = fadd float %216, %408
  %425 = fadd float %217, %409
  %426 = fadd float %218, %410
  %427 = fadd float %219, %411
  %428 = fadd float %220, %412
  %429 = fadd float %221, %413
  %430 = fadd float %222, %414
  %431 = fadd float %223, %415
  %432 = fadd float %224, %416
  %433 = fadd float %225, %417
  %434 = fadd float %156, %418
  %435 = fadd float %157, %419
  %436 = fadd float %158, %420
  %437 = fadd float %159, %421
  %438 = fadd float %160, %422
  %439 = fadd float %161, %423
  %440 = fadd float %162, %424
  %441 = fadd float %163, %425
  %442 = fadd float %164, %426
  %443 = fadd float %165, %427
  %444 = fadd float %166, %428
  %445 = fadd float %167, %429
  %446 = fadd float %168, %430
  %447 = fadd float %169, %431
  %448 = fadd float %170, %432
  %449 = fadd float %171, %433
  %450 = fadd float %103, %434
  %451 = fadd float %104, %435
  %452 = fadd float %105, %436
  %453 = fadd float %106, %437
  %454 = fadd float %107, %438
  %455 = fadd float %108, %439
  %456 = fadd float %109, %440
  %457 = fadd float %110, %441
  %458 = fadd float %111, %442
  %459 = fadd float %112, %443
  %460 = fadd float %113, %444
  %461 = fadd float %114, %445
  %462 = fadd float %115, %446
  %463 = fadd float %116, %447
  %464 = fadd float %117, %448
  %465 = fadd float %118, %449
  %466 = fadd float %50, %450
  %467 = fadd float %51, %451
  %468 = fadd float %52, %452
  %469 = fadd float %53, %453
  %470 = fadd float %54, %454
  %471 = fadd float %55, %455
  %472 = fadd float %56, %456
  %473 = fadd float %57, %457
  %474 = fadd float %58, %458
  %475 = fadd float %59, %459
  %476 = fadd float %60, %460
  %477 = fadd float %61, %461
  %478 = fadd float %62, %462
  %479 = fadd float %63, %463
  %480 = fadd float %64, %464
  %481 = fadd float %65, %465
  %482 = fmul float %466, %466
  %483 = fmul float %467, %467
  %484 = fmul float %468, %468
  %485 = fmul float %469, %469
  %486 = fmul float %470, %470
  %487 = fmul float %471, %471
  %488 = fmul float %472, %472
  %489 = fmul float %473, %473
  %490 = fmul float %474, %474
  %491 = fmul float %475, %475
  %492 = fmul float %476, %476
  %493 = fmul float %477, %477
  %494 = fmul float %478, %478
  %495 = fmul float %479, %479
  %496 = fmul float %480, %480
  %497 = fmul float %481, %481
  %498 = fadd float %482, %483
  %499 = fadd float %498, %484
  %500 = fadd float %499, %485
  %501 = fadd float %500, %486
  %502 = fadd float %501, %487
  %503 = fadd float %502, %488
  %504 = fadd float %503, %489
  %505 = fadd float %504, %490
  %506 = fadd float %505, %491
  %507 = fadd float %506, %492
  %508 = fadd float %507, %493
  %509 = fadd float %508, %494
  %510 = fadd float %509, %495
  %511 = fadd float %510, %496
  %512 = fadd float %511, %497
  %513 = bitcast float %512 to i32
  %514 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %513, i32 16, i32 31)
  %515 = bitcast i32 %514 to float
  %516 = fadd float %512, %515
  %517 = bitcast float %516 to i32
  %518 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %517, i32 8, i32 31)
  %519 = bitcast i32 %518 to float
  %520 = fadd float %516, %519
  %521 = bitcast float %520 to i32
  %522 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %521, i32 4, i32 31)
  %523 = bitcast i32 %522 to float
  %524 = fadd float %520, %523
  %525 = bitcast float %524 to i32
  %526 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %525, i32 2, i32 31)
  %527 = bitcast i32 %526 to float
  %528 = fadd float %524, %527
  %529 = bitcast float %528 to i32
  %530 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %529, i32 1, i32 31)
  %531 = bitcast i32 %530 to float
  %532 = fadd float %528, %531
  %533 = icmp eq i32 %6, 0
  %534 = zext nneg i32 %7 to i64
  %535 = getelementptr float, ptr addrspace(3) @global_smem, i64 %534
  %536 = bitcast float %532 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %535, <1 x i32> %536, i1 %533) #9
  tail call void @llvm.nvvm.barrier0()
  %537 = icmp samesign ult i32 %5, 2
  %538 = zext nneg i32 %5 to i64
  %539 = getelementptr float, ptr addrspace(3) @global_smem, i64 %538
  %540 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %539, i1 %537) #9
  %541 = bitcast i32 %540 to float
  %542 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %540, i32 1, i32 31)
  %543 = bitcast i32 %542 to float
  %544 = fadd float %541, %543
  %545 = icmp eq i32 %5, 0
  %546 = bitcast float %544 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %539, <1 x i32> %546, i1 %545) #9
  tail call void @llvm.nvvm.barrier0()
  %547 = load float, ptr addrspace(3) @global_smem, align 16
  %548 = fmul float %547, 0x3F50000000000000
  %549 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %550 = bitcast i32 %549 to float
  %551 = fadd float %548, %550
  %552 = tail call float @llvm.nvvm.rsqrt.approx.f(float %551)
  %553 = fmul float %466, %552
  %554 = fmul float %467, %552
  %555 = fmul float %468, %552
  %556 = fmul float %469, %552
  %557 = fmul float %470, %552
  %558 = fmul float %471, %552
  %559 = fmul float %472, %552
  %560 = fmul float %473, %552
  %561 = fmul float %474, %552
  %562 = fmul float %475, %552
  %563 = fmul float %476, %552
  %564 = fmul float %477, %552
  %565 = fmul float %478, %552
  %566 = fmul float %479, %552
  %567 = fmul float %480, %552
  %568 = fmul float %481, %552
  %569 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %570 = getelementptr i8, ptr addrspace(1) %569, i64 1024
  %571 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %569) #9
  %572 = extractvalue { i32, i32, i32, i32 } %571, 0
  %573 = bitcast i32 %572 to <2 x bfloat>
  %574 = extractvalue { i32, i32, i32, i32 } %571, 1
  %575 = bitcast i32 %574 to <2 x bfloat>
  %576 = extractvalue { i32, i32, i32, i32 } %571, 2
  %577 = bitcast i32 %576 to <2 x bfloat>
  %578 = extractvalue { i32, i32, i32, i32 } %571, 3
  %579 = bitcast i32 %578 to <2 x bfloat>
  %580 = extractelement <2 x bfloat> %573, i64 0
  %581 = extractelement <2 x bfloat> %573, i64 1
  %582 = extractelement <2 x bfloat> %575, i64 0
  %583 = extractelement <2 x bfloat> %575, i64 1
  %584 = extractelement <2 x bfloat> %577, i64 0
  %585 = extractelement <2 x bfloat> %577, i64 1
  %586 = extractelement <2 x bfloat> %579, i64 0
  %587 = extractelement <2 x bfloat> %579, i64 1
  %588 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %570) #9
  %589 = extractvalue { i32, i32, i32, i32 } %588, 0
  %590 = bitcast i32 %589 to <2 x bfloat>
  %591 = extractvalue { i32, i32, i32, i32 } %588, 1
  %592 = bitcast i32 %591 to <2 x bfloat>
  %593 = extractvalue { i32, i32, i32, i32 } %588, 2
  %594 = bitcast i32 %593 to <2 x bfloat>
  %595 = extractvalue { i32, i32, i32, i32 } %588, 3
  %596 = bitcast i32 %595 to <2 x bfloat>
  %597 = extractelement <2 x bfloat> %590, i64 0
  %598 = extractelement <2 x bfloat> %590, i64 1
  %599 = extractelement <2 x bfloat> %592, i64 0
  %600 = extractelement <2 x bfloat> %592, i64 1
  %601 = extractelement <2 x bfloat> %594, i64 0
  %602 = extractelement <2 x bfloat> %594, i64 1
  %603 = extractelement <2 x bfloat> %596, i64 0
  %604 = extractelement <2 x bfloat> %596, i64 1
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %580) #9
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %581) #9
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %582) #9
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %583) #9
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %584) #9
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %585) #9
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %586) #9
  %612 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %587) #9
  %613 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %597) #9
  %614 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %598) #9
  %615 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %599) #9
  %616 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %600) #9
  %617 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %601) #9
  %618 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %602) #9
  %619 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %603) #9
  %620 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %604) #9
  %621 = fmul float %553, %605
  %622 = fmul float %554, %606
  %623 = fmul float %555, %607
  %624 = fmul float %556, %608
  %625 = fmul float %557, %609
  %626 = fmul float %558, %610
  %627 = fmul float %559, %611
  %628 = fmul float %560, %612
  %629 = fmul float %561, %613
  %630 = fmul float %562, %614
  %631 = fmul float %563, %615
  %632 = fmul float %564, %616
  %633 = fmul float %565, %617
  %634 = fmul float %566, %618
  %635 = fmul float %567, %619
  %636 = fmul float %568, %620
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #9
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #9
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #9
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #9
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #9
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #9
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #9
  %644 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %628) #9
  %645 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %629) #9
  %646 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %630) #9
  %647 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %631) #9
  %648 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %632) #9
  %649 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %633) #9
  %650 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %634) #9
  %651 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %635) #9
  %652 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %636) #9
  %653 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %3
  %654 = getelementptr bfloat, ptr addrspace(1) %653, i64 %13
  %655 = getelementptr i8, ptr addrspace(1) %654, i64 1024
  %656 = insertelement <2 x bfloat> poison, bfloat %637, i64 0
  %657 = insertelement <2 x bfloat> %656, bfloat %638, i64 1
  %658 = bitcast <2 x bfloat> %657 to i32
  %659 = insertelement <2 x bfloat> poison, bfloat %639, i64 0
  %660 = insertelement <2 x bfloat> %659, bfloat %640, i64 1
  %661 = bitcast <2 x bfloat> %660 to i32
  %662 = insertelement <2 x bfloat> poison, bfloat %641, i64 0
  %663 = insertelement <2 x bfloat> %662, bfloat %642, i64 1
  %664 = bitcast <2 x bfloat> %663 to i32
  %665 = insertelement <2 x bfloat> poison, bfloat %643, i64 0
  %666 = insertelement <2 x bfloat> %665, bfloat %644, i64 1
  %667 = bitcast <2 x bfloat> %666 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %658, i32 %661, i32 %664, i32 %667, ptr addrspace(1) %654) #9
  %668 = insertelement <2 x bfloat> poison, bfloat %645, i64 0
  %669 = insertelement <2 x bfloat> %668, bfloat %646, i64 1
  %670 = bitcast <2 x bfloat> %669 to i32
  %671 = insertelement <2 x bfloat> poison, bfloat %647, i64 0
  %672 = insertelement <2 x bfloat> %671, bfloat %648, i64 1
  %673 = bitcast <2 x bfloat> %672 to i32
  %674 = insertelement <2 x bfloat> poison, bfloat %649, i64 0
  %675 = insertelement <2 x bfloat> %674, bfloat %650, i64 1
  %676 = bitcast <2 x bfloat> %675 to i32
  %677 = insertelement <2 x bfloat> poison, bfloat %651, i64 0
  %678 = insertelement <2 x bfloat> %677, bfloat %652, i64 1
  %679 = bitcast <2 x bfloat> %678 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %670, i32 %673, i32 %676, i32 %679, ptr addrspace(1) %655) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(262144) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 126976
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

define ptx_kernel void @fusion_45(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) local_unnamed_addr #5 {
  %arg336 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg234 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 9
  %4 = and i64 %3, 512
  %5 = shl nsw i64 %2, 11
  %6 = or disjoint i64 %5, %4
  %7 = or i64 %6, 2048
  %8 = getelementptr bfloat, ptr addrspace(1) %arg132, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = shl nuw nsw i32 %9, 3
  %11 = and i32 %10, 120
  %12 = and i32 %10, 248
  %13 = icmp samesign ugt i32 %9, 31
  %14 = select i1 %13, i32 256, i32 0
  %15 = or disjoint i32 %12, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr bfloat, ptr addrspace(1) %8, i64 %16
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
  %19 = extractvalue { i32, i32, i32, i32 } %18, 0
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32, i32, i32 } %18, 1
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32, i32, i32 } %18, 2
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractvalue { i32, i32, i32, i32 } %18, 3
  %26 = bitcast i32 %25 to <2 x bfloat>
  %27 = extractelement <2 x bfloat> %20, i64 0
  %28 = extractelement <2 x bfloat> %20, i64 1
  %29 = extractelement <2 x bfloat> %22, i64 0
  %30 = extractelement <2 x bfloat> %22, i64 1
  %31 = extractelement <2 x bfloat> %24, i64 0
  %32 = extractelement <2 x bfloat> %24, i64 1
  %33 = extractelement <2 x bfloat> %26, i64 0
  %34 = extractelement <2 x bfloat> %26, i64 1
  %35 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %36 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %37 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %38 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %39 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %42 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %43 = fmul float %35, %35
  %44 = fmul float %36, %36
  %45 = fmul float %37, %37
  %46 = fmul float %38, %38
  %47 = fmul float %39, %39
  %48 = fmul float %40, %40
  %49 = fmul float %41, %41
  %50 = fmul float %42, %42
  %51 = fadd float %43, %44
  %52 = fadd float %51, %45
  %53 = fadd float %52, %46
  %54 = fadd float %53, %47
  %55 = fadd float %54, %48
  %56 = fadd float %55, %49
  %57 = fadd float %56, %50
  %58 = bitcast float %57 to i32
  %59 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %58, i32 8, i32 31)
  %60 = bitcast i32 %59 to float
  %61 = fadd float %57, %60
  %62 = bitcast float %61 to i32
  %63 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %62, i32 4, i32 31)
  %64 = bitcast i32 %63 to float
  %65 = fadd float %61, %64
  %66 = bitcast float %65 to i32
  %67 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %66, i32 2, i32 31)
  %68 = bitcast i32 %67 to float
  %69 = fadd float %65, %68
  %70 = bitcast float %69 to i32
  %71 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %70, i32 1, i32 31)
  %72 = bitcast i32 %71 to float
  %73 = fadd float %69, %72
  %74 = fmul float %73, 7.812500e-03
  %75 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg030) #9
  %76 = bitcast i32 %75 to float
  %77 = fadd float %74, %76
  %78 = tail call float @llvm.nvvm.rsqrt.approx.f(float %77)
  %79 = fmul float %35, %78
  %80 = fmul float %36, %78
  %81 = fmul float %37, %78
  %82 = fmul float %38, %78
  %83 = fmul float %39, %78
  %84 = fmul float %40, %78
  %85 = fmul float %41, %78
  %86 = fmul float %42, %78
  %87 = shl nuw nsw i32 %9, 1
  %88 = and i32 %87, 62
  %89 = select i1 %13, i32 64, i32 0
  %90 = or disjoint i32 %88, %89
  %91 = shl nuw nsw i32 %9, 2
  %92 = and i32 %91, 124
  %93 = zext nneg i32 %90 to i64
  %94 = zext nneg i32 %92 to i64
  %95 = getelementptr bfloat, ptr addrspace(1) %arg234, i64 %93
  %96 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %95) #9
  %extelt.offset = lshr i32 %96, 16
  %97 = trunc nuw i32 %extelt.offset to i16
  %98 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %93
  %99 = trunc i32 %96 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %98, i16 %99, i16 %97, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %100 = zext nneg i32 %11 to i64
  %101 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %100
  %102 = load <8 x bfloat>, ptr addrspace(3) %101, align 16
  %103 = extractelement <8 x bfloat> %102, i32 0
  %104 = extractelement <8 x bfloat> %102, i32 1
  %105 = extractelement <8 x bfloat> %102, i32 2
  %106 = extractelement <8 x bfloat> %102, i32 3
  %107 = extractelement <8 x bfloat> %102, i32 4
  %108 = extractelement <8 x bfloat> %102, i32 5
  %109 = extractelement <8 x bfloat> %102, i32 6
  %110 = extractelement <8 x bfloat> %102, i32 7
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %107) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110) #9
  %119 = fmul float %79, %111
  %120 = fmul float %80, %112
  %121 = fmul float %81, %113
  %122 = fmul float %82, %114
  %123 = fmul float %83, %115
  %124 = fmul float %84, %116
  %125 = fmul float %85, %117
  %126 = fmul float %86, %118
  %127 = getelementptr i8, ptr addrspace(1) %arg336, i64 %5
  %128 = select i1 %13, i64 128, i64 0
  %129 = select i1 %13, i64 384, i64 256
  %130 = or disjoint i64 %128, %94
  %131 = or disjoint i64 %129, %94
  %132 = getelementptr float, ptr addrspace(1) %127, i64 %130
  %133 = getelementptr float, ptr addrspace(1) %127, i64 %131
  tail call void @llvm.nvvm.barrier0()
  %134 = select i1 %13, i32 128, i32 0
  %135 = or disjoint i32 %92, %134
  %136 = lshr i32 %15, 4
  %137 = and i32 %136, 24
  %138 = add nuw nsw i32 %137, %15
  %139 = zext nneg i32 %138 to i64
  %140 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %139
  %141 = bitcast float %119 to i32
  %142 = bitcast float %120 to i32
  %143 = bitcast float %121 to i32
  %144 = bitcast float %122 to i32
  %145 = bitcast float %123 to i32
  %146 = bitcast float %124 to i32
  %147 = bitcast float %125 to i32
  %148 = bitcast float %126 to i32
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %140, i32 %141, i32 %142, i32 %143, i32 %144, i1 true) #9
  %149 = getelementptr inbounds nuw i8, ptr addrspace(3) %140, i64 16
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) nonnull %149, i32 %145, i32 %146, i32 %147, i32 %148, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %150 = lshr exact i32 %134, 4
  %151 = add nuw nsw i32 %150, %135
  %152 = zext nneg i32 %151 to i64
  %153 = getelementptr inbounds nuw float, ptr addrspace(3) @global_smem, i64 %152
  %154 = or disjoint i32 %135, 256
  %155 = lshr i32 %154, 4
  %156 = and i32 %155, 24
  %157 = zext nneg i32 %156 to i64
  %158 = zext nneg i32 %135 to i64
  %159 = add i64 %157, %158
  %160 = getelementptr float, ptr addrspace(3) @global_smem, i64 %159
  %161 = getelementptr inbounds i8, ptr addrspace(3) %160, i64 1024
  %162 = load <4 x i32>, ptr addrspace(3) %161, align 16
  %163 = load <4 x i32>, ptr addrspace(3) %153, align 16
  %.extract38 = extractelement <4 x i32> %163, i32 0
  %.extract2339 = extractelement <4 x i32> %163, i32 1
  %.extract2440 = extractelement <4 x i32> %163, i32 2
  %.extract2541 = extractelement <4 x i32> %163, i32 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract38, i32 %.extract2339, i32 %.extract2440, i32 %.extract2541, ptr addrspace(1) %132) #9
  %.extract26 = extractelement <4 x i32> %162, i64 0
  %.extract27 = extractelement <4 x i32> %162, i64 1
  %.extract28 = extractelement <4 x i32> %162, i64 2
  %.extract29 = extractelement <4 x i32> %162, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract26, i32 %.extract27, i32 %.extract28, i32 %.extract29, ptr addrspace(1) %133) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(131072) %0, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %1, ptr noalias readonly align 16 captures(none) dereferenceable(128) %2, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %3) local_unnamed_addr #6 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %11 = lshr i32 %10, 2
  %12 = and i32 %9, 63
  %13 = shl nuw nsw i32 %9, 1
  %14 = and i32 %13, 128
  %15 = shl nuw nsw i32 %10, 8
  %16 = or disjoint i32 %14, %15
  %17 = or disjoint i32 %16, %12
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr float, ptr addrspace(1) %8, i64 %18
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !6
  tail call void @llvm.experimental.noalias.scope.decl(metadata !14)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  %21 = zext nneg i32 %11 to i64
  %22 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %21
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !6, !alias.scope !17, !noalias !14
  %24 = tail call i32 @llvm.smin.i32(i32 %23, i32 40959)
  %25 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %26 = shl nuw nsw i32 %25, 7
  %27 = or disjoint i32 %26, %12
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %28
  %30 = load bfloat, ptr addrspace(1) %29, align 2, !invariant.load !6, !alias.scope !14, !noalias !17
  %31 = fpext bfloat %30 to float
  %32 = fmul float %20, %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 256
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !6
  %35 = or disjoint i32 %9, %26
  %36 = or i32 %35, 64
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %37
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !6, !alias.scope !19, !noalias !22
  %40 = fpext bfloat %39 to float
  %41 = fmul float %34, %40
  %42 = fsub float %32, %41
  %43 = fptrunc float %42 to bfloat
  %44 = getelementptr bfloat, ptr addrspace(1) %5, i64 %18
  store bfloat %43, ptr addrspace(1) %44, align 2
  %45 = fmul float %34, %31
  %46 = fmul float %20, %40
  %47 = fadd float %45, %46
  %48 = fptrunc float %47 to bfloat
  %49 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 128
  store bfloat %48, ptr addrspace(1) %49, align 2
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
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
!5 = !{i32 0, i32 256}
!6 = !{}
!7 = !{i32 0, i32 768}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_param_0_185: argument 0"}
!10 = distinct !{!10, !"fused_convert_param_0_185"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_param_0_185: argument 0"}
!13 = distinct !{!13, !"fused_convert_param_0_185"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_concatenate_convert_255_7: argument 0"}
!16 = distinct !{!16, !"fused_concatenate_convert_255_7"}
!17 = !{!18}
!18 = distinct !{!18, !16, !"fused_concatenate_convert_255_7: argument 1"}
!19 = !{!20}
!20 = distinct !{!20, !21, !"fused_concatenate_convert_255_7: argument 0"}
!21 = distinct !{!21, !"fused_concatenate_convert_255_7"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"fused_concatenate_convert_255_7: argument 1"}
!24 = !{i32 0, i32 135456}

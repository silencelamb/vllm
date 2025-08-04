; ModuleID = 'SyncTensorsGraph.367'
source_filename = "SyncTensorsGraph.367"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(64) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %9 = lshr i32 %8, 3
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %10
  %12 = load i32, ptr addrspace(1) %11, align 4, !invariant.load !5
  %13 = tail call i32 @llvm.umin.i32(i32 %12, i32 151935)
  %14 = shl nuw nsw i32 %8, 7
  %15 = and i32 %14, 896
  %16 = shl nuw nsw i32 %13, 10
  %17 = or disjoint i32 %16, %15
  %18 = or disjoint i32 %17, %7
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds bfloat, ptr addrspace(1) %6, i64 %19
  %21 = load bfloat, ptr addrspace(1) %20, align 2, !invariant.load !5
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

define ptx_kernel void @gemm_fusion_dot_11_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 128 dereferenceable(98304) %arg3) local_unnamed_addr #3 {
  %arg363 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg261 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg159 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg057 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 48, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 6
  %9 = icmp slt i32 %8, 1024
  %.v = select i1 %9, ptr addrspace(1) %arg057, ptr addrspace(1) %arg159
  %10 = icmp slt i32 %8, 2048
  %.v1 = select i1 %10, ptr addrspace(1) %.v, ptr addrspace(1) %arg261
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
  %.not5 = icmp eq i32 %59, 0
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %86, ptr addrspace(1) %71, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %91, ptr addrspace(1) %72, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %96, ptr addrspace(1) %73, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %101, ptr addrspace(1) %74, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %106, ptr addrspace(1) %75, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %111, ptr addrspace(1) %76, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %116, ptr addrspace(1) %77, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %121, ptr addrspace(1) %78, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %146, ptr addrspace(1) %124, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %147, ptr addrspace(1) %127, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %148, ptr addrspace(1) %130, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %149, ptr addrspace(1) %133, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %150, ptr addrspace(1) %136, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %151, ptr addrspace(1) %139, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %142, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %153, ptr addrspace(1) %145, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %154, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %163, ptr addrspace(1) %155, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %164, ptr addrspace(1) %156, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %165, ptr addrspace(1) %157, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %166, ptr addrspace(1) %158, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %167, ptr addrspace(1) %159, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %160, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %169, ptr addrspace(1) %161, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %170 = select i1 %56, i32 0, i32 136
  %171 = select i1 %58, i32 0, i32 272
  %172 = or disjoint i32 %170, %171
  %173 = select i1 %.not5, i32 0, i32 544
  %174 = shl nuw nsw i32 %16, 7
  %175 = and i32 %174, 1024
  %176 = or disjoint i32 %173, %175
  %177 = or disjoint i32 %176, %172
  %178 = lshr exact i32 %17, 1
  %179 = xor i32 %177, %178
  %180 = shl nuw nsw i32 %18, 6
  %181 = or disjoint i32 %179, %180
  %182 = select i1 %21, i32 0, i32 4096
  %183 = or disjoint i32 %181, %182
  %184 = zext nneg i32 %183 to i64
  %185 = or disjoint i32 %170, 16
  %186 = xor i32 %185, %171
  %187 = or disjoint i32 %175, %186
  %188 = or disjoint i32 %187, %173
  %189 = or disjoint i32 %180, %178
  %190 = or disjoint i32 %189, %182
  %191 = xor i32 %190, %188
  %192 = zext nneg i32 %191 to i64
  %193 = or disjoint i32 %172, 32
  %194 = xor i32 %193, %173
  %195 = or disjoint i32 %194, %175
  %196 = xor i32 %190, %195
  %197 = zext nneg i32 %196 to i64
  %198 = or disjoint i32 %170, 48
  %199 = or disjoint i32 %173, %171
  %200 = xor i32 %199, %198
  %201 = or disjoint i32 %200, %175
  %202 = xor i32 %190, %201
  %203 = zext nneg i32 %202 to i64
  %204 = or disjoint i32 %177, 64
  %205 = xor i32 %190, %204
  %206 = zext nneg i32 %205 to i64
  %207 = or disjoint i32 %170, 80
  %208 = xor i32 %207, %171
  %209 = or disjoint i32 %175, %208
  %210 = or disjoint i32 %209, %173
  %211 = xor i32 %190, %210
  %212 = zext nneg i32 %211 to i64
  %213 = or disjoint i32 %172, 96
  %214 = xor i32 %213, %173
  %215 = or disjoint i32 %214, %175
  %216 = xor i32 %190, %215
  %217 = zext nneg i32 %216 to i64
  %218 = or disjoint i32 %170, 112
  %219 = xor i32 %199, %218
  %220 = or disjoint i32 %219, %175
  %221 = xor i32 %190, %220
  %222 = zext nneg i32 %221 to i64
  %223 = trunc i32 %16 to i4
  %224 = zext i4 %223 to i64
  %225 = shl nuw nsw i64 %224, 4
  %226 = add i32 %22, %20
  %227 = add i32 %226, 56
  %228 = zext nneg i32 %227 to i64
  %229 = add i64 %15, %228
  %230 = shl nsw i64 %229, 12
  %231 = add nuw nsw i64 %230, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %.v1, i64 %231
  %232 = add i32 %226, 48
  %233 = zext nneg i32 %232 to i64
  %234 = add i64 %15, %233
  %235 = shl nsw i64 %234, 12
  %236 = add nuw nsw i64 %235, 768
  %scevgep67 = getelementptr i8, ptr addrspace(1) %.v1, i64 %236
  %237 = add i32 %226, 40
  %238 = zext nneg i32 %237 to i64
  %239 = add i64 %15, %238
  %240 = shl nsw i64 %239, 12
  %241 = add nuw nsw i64 %240, 768
  %scevgep71 = getelementptr i8, ptr addrspace(1) %.v1, i64 %241
  %242 = add i32 %226, 32
  %243 = zext nneg i32 %242 to i64
  %244 = add i64 %15, %243
  %245 = shl nsw i64 %244, 12
  %246 = add nuw nsw i64 %245, 768
  %scevgep75 = getelementptr i8, ptr addrspace(1) %.v1, i64 %246
  %247 = add i32 %226, 24
  %248 = zext nneg i32 %247 to i64
  %249 = add i64 %15, %248
  %250 = shl nsw i64 %249, 12
  %251 = add nuw nsw i64 %250, 768
  %scevgep79 = getelementptr i8, ptr addrspace(1) %.v1, i64 %251
  %252 = add i32 %226, 16
  %253 = zext nneg i32 %252 to i64
  %254 = add i64 %15, %253
  %255 = shl nsw i64 %254, 12
  %256 = add nuw nsw i64 %255, 768
  %scevgep83 = getelementptr i8, ptr addrspace(1) %.v1, i64 %256
  %257 = add i32 %226, 8
  %258 = zext nneg i32 %257 to i64
  %259 = add i64 %15, %258
  %260 = shl nsw i64 %259, 12
  %261 = add nuw nsw i64 %260, 768
  %scevgep87 = getelementptr i8, ptr addrspace(1) %.v1, i64 %261
  %262 = zext nneg i32 %226 to i64
  %263 = add i64 %15, %262
  %264 = shl nsw i64 %263, 12
  %265 = add nuw nsw i64 %264, 768
  %scevgep91 = getelementptr i8, ptr addrspace(1) %.v1, i64 %265
  br label %266

266:                                              ; preds = %0, %266
  %lsr.iv95 = phi i32 [ -128, %0 ], [ %271, %266 ]
  %lsr.iv92 = phi ptr addrspace(1) [ %scevgep91, %0 ], [ %scevgep93, %266 ]
  %lsr.iv88 = phi ptr addrspace(1) [ %scevgep87, %0 ], [ %scevgep89, %266 ]
  %lsr.iv84 = phi ptr addrspace(1) [ %scevgep83, %0 ], [ %scevgep85, %266 ]
  %lsr.iv80 = phi ptr addrspace(1) [ %scevgep79, %0 ], [ %scevgep81, %266 ]
  %lsr.iv76 = phi ptr addrspace(1) [ %scevgep75, %0 ], [ %scevgep77, %266 ]
  %lsr.iv72 = phi ptr addrspace(1) [ %scevgep71, %0 ], [ %scevgep73, %266 ]
  %lsr.iv68 = phi ptr addrspace(1) [ %scevgep67, %0 ], [ %scevgep69, %266 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep65, %266 ]
  %267 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %453, %266 ]
  %268 = phi i32 [ 0, %0 ], [ %450, %266 ]
  %269 = phi i32 [ 2, %0 ], [ %435, %266 ]
  %270 = phi { float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %432, %266 ]
  %271 = add i32 %lsr.iv95, 128
  %272 = icmp samesign ult i32 %271, 1664
  %273 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %184
  %274 = ptrtoint ptr addrspace(3) %273 to i64
  %275 = trunc i64 %274 to i32
  %276 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %275) #10
  %277 = extractvalue { i32, i32, i32, i32 } %276, 0
  %278 = extractvalue { i32, i32, i32, i32 } %276, 1
  %279 = extractvalue { i32, i32, i32, i32 } %276, 2
  %280 = extractvalue { i32, i32, i32, i32 } %276, 3
  %281 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %192
  %282 = ptrtoint ptr addrspace(3) %281 to i64
  %283 = trunc i64 %282 to i32
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %283) #10
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = extractvalue { i32, i32, i32, i32 } %284, 1
  %287 = extractvalue { i32, i32, i32, i32 } %284, 2
  %288 = extractvalue { i32, i32, i32, i32 } %284, 3
  %289 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %197
  %290 = ptrtoint ptr addrspace(3) %289 to i64
  %291 = trunc i64 %290 to i32
  %292 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %291) #10
  %293 = extractvalue { i32, i32, i32, i32 } %292, 0
  %294 = extractvalue { i32, i32, i32, i32 } %292, 1
  %295 = extractvalue { i32, i32, i32, i32 } %292, 2
  %296 = extractvalue { i32, i32, i32, i32 } %292, 3
  %297 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %203
  %298 = ptrtoint ptr addrspace(3) %297 to i64
  %299 = trunc i64 %298 to i32
  %300 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %299) #10
  %301 = extractvalue { i32, i32, i32, i32 } %300, 0
  %302 = extractvalue { i32, i32, i32, i32 } %300, 1
  %303 = extractvalue { i32, i32, i32, i32 } %300, 2
  %304 = extractvalue { i32, i32, i32, i32 } %300, 3
  %305 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %206
  %306 = ptrtoint ptr addrspace(3) %305 to i64
  %307 = trunc i64 %306 to i32
  %308 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %307) #10
  %309 = extractvalue { i32, i32, i32, i32 } %308, 0
  %310 = extractvalue { i32, i32, i32, i32 } %308, 1
  %311 = extractvalue { i32, i32, i32, i32 } %308, 2
  %312 = extractvalue { i32, i32, i32, i32 } %308, 3
  %313 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %212
  %314 = ptrtoint ptr addrspace(3) %313 to i64
  %315 = trunc i64 %314 to i32
  %316 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %315) #10
  %317 = extractvalue { i32, i32, i32, i32 } %316, 0
  %318 = extractvalue { i32, i32, i32, i32 } %316, 1
  %319 = extractvalue { i32, i32, i32, i32 } %316, 2
  %320 = extractvalue { i32, i32, i32, i32 } %316, 3
  %321 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %217
  %322 = ptrtoint ptr addrspace(3) %321 to i64
  %323 = trunc i64 %322 to i32
  %324 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %323) #10
  %325 = extractvalue { i32, i32, i32, i32 } %324, 0
  %326 = extractvalue { i32, i32, i32, i32 } %324, 1
  %327 = extractvalue { i32, i32, i32, i32 } %324, 2
  %328 = extractvalue { i32, i32, i32, i32 } %324, 3
  %329 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %267, i64 %222
  %330 = ptrtoint ptr addrspace(3) %329 to i64
  %331 = trunc i64 %330 to i32
  %332 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %331) #10
  %333 = extractvalue { i32, i32, i32, i32 } %332, 0
  %334 = extractvalue { i32, i32, i32, i32 } %332, 1
  %335 = extractvalue { i32, i32, i32, i32 } %332, 2
  %336 = extractvalue { i32, i32, i32, i32 } %332, 3
  %337 = extractvalue { float, float, float, float, float, float, float, float } %270, 0
  %338 = extractvalue { float, float, float, float, float, float, float, float } %270, 1
  %339 = extractvalue { float, float, float, float, float, float, float, float } %270, 2
  %340 = extractvalue { float, float, float, float, float, float, float, float } %270, 3
  %341 = extractvalue { float, float, float, float, float, float, float, float } %270, 4
  %342 = extractvalue { float, float, float, float, float, float, float, float } %270, 5
  %343 = extractvalue { float, float, float, float, float, float, float, float } %270, 6
  %344 = extractvalue { float, float, float, float, float, float, float, float } %270, 7
  %345 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %337, float %338, float %339, float %340, i32 %277, i32 %278, i32 %279, i32 %280, i32 0, i32 0) #10
  %346 = extractvalue { float, float, float, float } %345, 0
  %347 = extractvalue { float, float, float, float } %345, 1
  %348 = extractvalue { float, float, float, float } %345, 2
  %349 = extractvalue { float, float, float, float } %345, 3
  %350 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %341, float %342, float %343, float %344, i32 %277, i32 %278, i32 %279, i32 %280, i32 0, i32 0) #10
  %351 = extractvalue { float, float, float, float } %350, 0
  %352 = extractvalue { float, float, float, float } %350, 1
  %353 = extractvalue { float, float, float, float } %350, 2
  %354 = extractvalue { float, float, float, float } %350, 3
  %355 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %346, float %347, float %348, float %349, i32 %285, i32 %286, i32 %287, i32 %288, i32 0, i32 0) #10
  %356 = extractvalue { float, float, float, float } %355, 0
  %357 = extractvalue { float, float, float, float } %355, 1
  %358 = extractvalue { float, float, float, float } %355, 2
  %359 = extractvalue { float, float, float, float } %355, 3
  %360 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %351, float %352, float %353, float %354, i32 %285, i32 %286, i32 %287, i32 %288, i32 0, i32 0) #10
  %361 = extractvalue { float, float, float, float } %360, 0
  %362 = extractvalue { float, float, float, float } %360, 1
  %363 = extractvalue { float, float, float, float } %360, 2
  %364 = extractvalue { float, float, float, float } %360, 3
  %365 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %356, float %357, float %358, float %359, i32 %293, i32 %294, i32 %295, i32 %296, i32 0, i32 0) #10
  %366 = extractvalue { float, float, float, float } %365, 0
  %367 = extractvalue { float, float, float, float } %365, 1
  %368 = extractvalue { float, float, float, float } %365, 2
  %369 = extractvalue { float, float, float, float } %365, 3
  %370 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %361, float %362, float %363, float %364, i32 %293, i32 %294, i32 %295, i32 %296, i32 0, i32 0) #10
  %371 = extractvalue { float, float, float, float } %370, 0
  %372 = extractvalue { float, float, float, float } %370, 1
  %373 = extractvalue { float, float, float, float } %370, 2
  %374 = extractvalue { float, float, float, float } %370, 3
  %375 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %366, float %367, float %368, float %369, i32 %301, i32 %302, i32 %303, i32 %304, i32 0, i32 0) #10
  %376 = extractvalue { float, float, float, float } %375, 0
  %377 = extractvalue { float, float, float, float } %375, 1
  %378 = extractvalue { float, float, float, float } %375, 2
  %379 = extractvalue { float, float, float, float } %375, 3
  %380 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %371, float %372, float %373, float %374, i32 %301, i32 %302, i32 %303, i32 %304, i32 0, i32 0) #10
  %381 = extractvalue { float, float, float, float } %380, 0
  %382 = extractvalue { float, float, float, float } %380, 1
  %383 = extractvalue { float, float, float, float } %380, 2
  %384 = extractvalue { float, float, float, float } %380, 3
  %385 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %376, float %377, float %378, float %379, i32 %309, i32 %310, i32 %311, i32 %312, i32 0, i32 0) #10
  %386 = extractvalue { float, float, float, float } %385, 0
  %387 = extractvalue { float, float, float, float } %385, 1
  %388 = extractvalue { float, float, float, float } %385, 2
  %389 = extractvalue { float, float, float, float } %385, 3
  %390 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %381, float %382, float %383, float %384, i32 %309, i32 %310, i32 %311, i32 %312, i32 0, i32 0) #10
  %391 = extractvalue { float, float, float, float } %390, 0
  %392 = extractvalue { float, float, float, float } %390, 1
  %393 = extractvalue { float, float, float, float } %390, 2
  %394 = extractvalue { float, float, float, float } %390, 3
  %395 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %386, float %387, float %388, float %389, i32 %317, i32 %318, i32 %319, i32 %320, i32 0, i32 0) #10
  %396 = extractvalue { float, float, float, float } %395, 0
  %397 = extractvalue { float, float, float, float } %395, 1
  %398 = extractvalue { float, float, float, float } %395, 2
  %399 = extractvalue { float, float, float, float } %395, 3
  %400 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %391, float %392, float %393, float %394, i32 %317, i32 %318, i32 %319, i32 %320, i32 0, i32 0) #10
  %401 = extractvalue { float, float, float, float } %400, 0
  %402 = extractvalue { float, float, float, float } %400, 1
  %403 = extractvalue { float, float, float, float } %400, 2
  %404 = extractvalue { float, float, float, float } %400, 3
  %405 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %396, float %397, float %398, float %399, i32 %325, i32 %326, i32 %327, i32 %328, i32 0, i32 0) #10
  %406 = extractvalue { float, float, float, float } %405, 0
  %407 = extractvalue { float, float, float, float } %405, 1
  %408 = extractvalue { float, float, float, float } %405, 2
  %409 = extractvalue { float, float, float, float } %405, 3
  %410 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %401, float %402, float %403, float %404, i32 %325, i32 %326, i32 %327, i32 %328, i32 0, i32 0) #10
  %411 = extractvalue { float, float, float, float } %410, 0
  %412 = extractvalue { float, float, float, float } %410, 1
  %413 = extractvalue { float, float, float, float } %410, 2
  %414 = extractvalue { float, float, float, float } %410, 3
  %415 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %406, float %407, float %408, float %409, i32 %333, i32 %334, i32 %335, i32 %336, i32 0, i32 0) #10
  %416 = extractvalue { float, float, float, float } %415, 0
  %417 = extractvalue { float, float, float, float } %415, 1
  %418 = extractvalue { float, float, float, float } %415, 2
  %419 = extractvalue { float, float, float, float } %415, 3
  %420 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %411, float %412, float %413, float %414, i32 %333, i32 %334, i32 %335, i32 %336, i32 0, i32 0) #10
  %421 = extractvalue { float, float, float, float } %420, 0
  %422 = extractvalue { float, float, float, float } %420, 1
  %423 = extractvalue { float, float, float, float } %420, 2
  %424 = extractvalue { float, float, float, float } %420, 3
  %425 = insertvalue { float, float, float, float, float, float, float, float } undef, float %416, 0
  %426 = insertvalue { float, float, float, float, float, float, float, float } %425, float %417, 1
  %427 = insertvalue { float, float, float, float, float, float, float, float } %426, float %418, 2
  %428 = insertvalue { float, float, float, float, float, float, float, float } %427, float %419, 3
  %429 = insertvalue { float, float, float, float, float, float, float, float } %428, float %421, 4
  %430 = insertvalue { float, float, float, float, float, float, float, float } %429, float %422, 5
  %431 = insertvalue { float, float, float, float, float, float, float, float } %430, float %423, 6
  %432 = insertvalue { float, float, float, float, float, float, float, float } %431, float %424, 7
  %433 = add i32 %269, 1
  %434 = icmp slt i32 %433, 3
  %435 = select i1 %434, i32 %433, i32 0
  %scevgep94 = getelementptr i8, ptr addrspace(1) %lsr.iv92, i64 %225
  %scevgep90 = getelementptr i8, ptr addrspace(1) %lsr.iv88, i64 %225
  %scevgep86 = getelementptr i8, ptr addrspace(1) %lsr.iv84, i64 %225
  %scevgep82 = getelementptr i8, ptr addrspace(1) %lsr.iv80, i64 %225
  %scevgep78 = getelementptr i8, ptr addrspace(1) %lsr.iv76, i64 %225
  %scevgep74 = getelementptr i8, ptr addrspace(1) %lsr.iv72, i64 %225
  %scevgep70 = getelementptr i8, ptr addrspace(1) %lsr.iv68, i64 %225
  %scevgep66 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %225
  %436 = shl i32 %435, 13
  %437 = sext i32 %436 to i64
  %438 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %437
  tail call void @llvm.nvvm.barrier0()
  %439 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %85
  %440 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %90
  %441 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %95
  %442 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %100
  %443 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %105
  %444 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %110
  %445 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %115
  %446 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %438, i64 %120
  %447 = select i1 %272, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %439, ptr addrspace(1) %scevgep94, i32 %447) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %440, ptr addrspace(1) %scevgep90, i32 %447) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %441, ptr addrspace(1) %scevgep86, i32 %447) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %442, ptr addrspace(1) %scevgep82, i32 %447) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %443, ptr addrspace(1) %scevgep78, i32 %447) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %444, ptr addrspace(1) %scevgep74, i32 %447) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %445, ptr addrspace(1) %scevgep70, i32 %447) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %446, ptr addrspace(1) %scevgep66, i32 %447) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %448 = add i32 %268, 1
  %449 = icmp slt i32 %448, 3
  %450 = select i1 %449, i32 %448, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %451 = shl i32 %450, 13
  %452 = sext i32 %451 to i64
  %453 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %452
  %scevgep65 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep69 = getelementptr i8, ptr addrspace(1) %lsr.iv68, i64 256
  %scevgep73 = getelementptr i8, ptr addrspace(1) %lsr.iv72, i64 256
  %scevgep77 = getelementptr i8, ptr addrspace(1) %lsr.iv76, i64 256
  %scevgep81 = getelementptr i8, ptr addrspace(1) %lsr.iv80, i64 256
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv84, i64 256
  %scevgep89 = getelementptr i8, ptr addrspace(1) %lsr.iv88, i64 256
  %scevgep93 = getelementptr i8, ptr addrspace(1) %lsr.iv92, i64 256
  %454 = icmp samesign ult i32 %271, 1920
  br i1 %454, label %266, label %455

455:                                              ; preds = %266
  %456 = icmp ult i32 %16, 64
  %457 = and i32 %60, 56
  %458 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %458
  %459 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %460 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416) #10
  %461 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417) #10
  %462 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %418) #10
  %463 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %419) #10
  %464 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %421) #10
  %465 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %422) #10
  %466 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %423) #10
  %467 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %424) #10
  %468 = shl nsw i32 %459, 4
  %469 = sext i32 %8 to i64
  %470 = sext i32 %468 to i64
  %471 = zext nneg i32 %457 to i64
  %472 = or disjoint i64 %469, %471
  %473 = lshr i32 %16, 3
  %474 = and i32 %473, 7
  %475 = select i1 %456, i32 0, i32 8
  %476 = or disjoint i32 %474, %475
  %477 = zext nneg i32 %476 to i64
  %478 = or disjoint i64 %470, %477
  %479 = getelementptr bfloat, ptr addrspace(1) %arg363, i64 %472
  %.idx = mul nsw i64 %478, 6144
  %480 = getelementptr i8, ptr addrspace(1) %479, i64 %.idx
  %481 = and i32 %174, 384
  %482 = lshr i32 %16, 2
  %483 = and i32 %482, 7
  %484 = lshr exact i32 %18, 1
  %485 = select i1 %456, i32 0, i32 32
  %486 = or disjoint i32 %484, %485
  %487 = or disjoint i32 %486, %483
  %488 = or disjoint i32 %487, %481
  %489 = and i32 %60, 504
  %490 = select i1 %456, i32 0, i32 512
  %491 = or disjoint i32 %489, %490
  %492 = lshr exact i32 %481, 3
  %493 = add nuw nsw i32 %488, %492
  %494 = zext nneg i32 %493 to i64
  %495 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %494
  %496 = bitcast bfloat %460 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %495, <1 x i16> %496, i1 true) #10
  %497 = or disjoint i32 %488, 64
  %498 = lshr i32 %497, 3
  %499 = and i32 %498, 268435448
  %500 = zext nneg i32 %499 to i64
  %501 = zext nneg i32 %488 to i64
  %502 = add i64 %500, %501
  %503 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %502
  %504 = getelementptr inbounds i8, ptr addrspace(3) %503, i64 128
  %505 = bitcast bfloat %461 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %504, <1 x i16> %505, i1 true) #10
  %506 = zext nneg i32 %492 to i64
  %507 = add i64 %506, %501
  %508 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %507
  %509 = getelementptr inbounds i8, ptr addrspace(3) %508, i64 16
  %510 = bitcast bfloat %462 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %509, <1 x i16> %510, i1 true) #10
  %511 = or disjoint i32 %488, 72
  %512 = lshr i32 %511, 3
  %513 = and i32 %512, 268435448
  %514 = zext nneg i32 %513 to i64
  %515 = add i64 %514, %501
  %516 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %515
  %517 = getelementptr inbounds i8, ptr addrspace(3) %516, i64 144
  %518 = bitcast bfloat %463 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %517, <1 x i16> %518, i1 true) #10
  %519 = or disjoint i32 %488, 512
  %520 = lshr i32 %519, 3
  %521 = and i32 %520, 268435448
  %522 = zext nneg i32 %521 to i64
  %523 = add i64 %522, %501
  %524 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %523
  %525 = getelementptr inbounds i8, ptr addrspace(3) %524, i64 1024
  %526 = bitcast bfloat %464 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %525, <1 x i16> %526, i1 true) #10
  %527 = or disjoint i32 %488, 576
  %528 = lshr i32 %527, 3
  %529 = and i32 %528, 268435448
  %530 = zext nneg i32 %529 to i64
  %531 = add i64 %530, %501
  %532 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %531
  %533 = getelementptr inbounds i8, ptr addrspace(3) %532, i64 1152
  %534 = bitcast bfloat %465 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %533, <1 x i16> %534, i1 true) #10
  %535 = or disjoint i32 %488, 520
  %536 = lshr i32 %535, 3
  %537 = and i32 %536, 268435448
  %538 = zext nneg i32 %537 to i64
  %539 = add i64 %538, %501
  %540 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %539
  %541 = getelementptr inbounds i8, ptr addrspace(3) %540, i64 1040
  %542 = bitcast bfloat %466 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %541, <1 x i16> %542, i1 true) #10
  %543 = or disjoint i32 %488, 584
  %544 = lshr i32 %543, 3
  %545 = and i32 %544, 268435448
  %546 = zext nneg i32 %545 to i64
  %547 = add i64 %546, %501
  %548 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %547
  %549 = getelementptr inbounds i8, ptr addrspace(3) %548, i64 1168
  %550 = bitcast bfloat %467 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %549, <1 x i16> %550, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %551 = lshr exact i32 %491, 3
  %552 = and i32 %551, 120
  %553 = add nuw nsw i32 %552, %491
  %554 = zext nneg i32 %553 to i64
  %555 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %554
  %556 = load <4 x i32>, ptr addrspace(3) %555, align 16
  %.extract96 = extractelement <4 x i32> %556, i32 0
  %.extract1797 = extractelement <4 x i32> %556, i32 1
  %.extract1998 = extractelement <4 x i32> %556, i32 2
  %.extract2199 = extractelement <4 x i32> %556, i32 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract96, i32 %.extract1797, i32 %.extract1998, i32 %.extract2199, ptr addrspace(1) %480) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_51(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(98304) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = mul i64 %3, 3072
  %7 = or disjoint i64 %5, %6
  %8 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = and i32 %9, 31
  %11 = lshr i32 %9, 5
  %12 = shl nuw nsw i32 %9, 2
  %13 = and i32 %12, 124
  %14 = icmp samesign ult i32 %9, 32
  %15 = select i1 %14, i32 0, i32 128
  %16 = or disjoint i32 %13, %15
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr bfloat, ptr addrspace(1) %8, i64 %17
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 4096
  %20 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %19) #10
  %21 = extractvalue { i32, i32 } %20, 0
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32 } %20, 1
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = extractelement <2 x bfloat> %24, i64 0
  %28 = extractelement <2 x bfloat> %24, i64 1
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %32 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %33 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %4
  %34 = getelementptr bfloat, ptr addrspace(1) %33, i64 %17
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %34) #10
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractelement <2 x bfloat> %37, i64 0
  %41 = extractelement <2 x bfloat> %37, i64 1
  %42 = extractelement <2 x bfloat> %39, i64 0
  %43 = extractelement <2 x bfloat> %39, i64 1
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #10
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %47 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #10
  %48 = fadd float %29, %44
  %49 = fadd float %30, %45
  %50 = fadd float %31, %46
  %51 = fadd float %32, %47
  %52 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %6
  %53 = getelementptr i8, ptr addrspace(1) %52, i64 4096
  %54 = shl nuw nsw i32 %9, 3
  %55 = and i32 %54, 248
  %56 = select i1 %14, i32 0, i32 256
  %57 = or disjoint i32 %55, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr bfloat, ptr addrspace(1) %52, i64 %58
  %60 = getelementptr i8, ptr addrspace(1) %59, i64 4096
  %61 = getelementptr bfloat, ptr addrspace(1) %53, i64 %58
  %62 = getelementptr i8, ptr addrspace(1) %61, i64 1024
  %63 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %60) #10
  %64 = extractvalue { i32, i32, i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32, i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractvalue { i32, i32, i32, i32 } %63, 2
  %69 = bitcast i32 %68 to <2 x bfloat>
  %70 = extractvalue { i32, i32, i32, i32 } %63, 3
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractelement <2 x bfloat> %65, i64 0
  %73 = extractelement <2 x bfloat> %65, i64 1
  %74 = extractelement <2 x bfloat> %67, i64 0
  %75 = extractelement <2 x bfloat> %67, i64 1
  %76 = extractelement <2 x bfloat> %69, i64 0
  %77 = extractelement <2 x bfloat> %69, i64 1
  %78 = extractelement <2 x bfloat> %71, i64 0
  %79 = extractelement <2 x bfloat> %71, i64 1
  %80 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %62) #10
  %81 = extractvalue { i32, i32, i32, i32 } %80, 0
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractvalue { i32, i32, i32, i32 } %80, 1
  %84 = bitcast i32 %83 to <2 x bfloat>
  %85 = extractvalue { i32, i32, i32, i32 } %80, 2
  %86 = bitcast i32 %85 to <2 x bfloat>
  %87 = extractvalue { i32, i32, i32, i32 } %80, 3
  %88 = bitcast i32 %87 to <2 x bfloat>
  %89 = extractelement <2 x bfloat> %82, i64 0
  %90 = extractelement <2 x bfloat> %82, i64 1
  %91 = extractelement <2 x bfloat> %84, i64 0
  %92 = extractelement <2 x bfloat> %84, i64 1
  %93 = extractelement <2 x bfloat> %86, i64 0
  %94 = extractelement <2 x bfloat> %86, i64 1
  %95 = extractelement <2 x bfloat> %88, i64 0
  %96 = extractelement <2 x bfloat> %88, i64 1
  %97 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #10
  %98 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73) #10
  %99 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74) #10
  %100 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75) #10
  %101 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76) #10
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77) #10
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %91) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %92) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %93) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %94) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %.idx = shl i64 %3, 11
  %113 = getelementptr i8, ptr addrspace(1) %arg13, i64 %.idx
  %114 = getelementptr bfloat, ptr addrspace(1) %113, i64 %58
  %115 = getelementptr i8, ptr addrspace(1) %114, i64 1024
  %116 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %114) #10
  %117 = extractvalue { i32, i32, i32, i32 } %116, 0
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractvalue { i32, i32, i32, i32 } %116, 1
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %116, 2
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %116, 3
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractelement <2 x bfloat> %118, i64 0
  %126 = extractelement <2 x bfloat> %118, i64 1
  %127 = extractelement <2 x bfloat> %120, i64 0
  %128 = extractelement <2 x bfloat> %120, i64 1
  %129 = extractelement <2 x bfloat> %122, i64 0
  %130 = extractelement <2 x bfloat> %122, i64 1
  %131 = extractelement <2 x bfloat> %124, i64 0
  %132 = extractelement <2 x bfloat> %124, i64 1
  %133 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %115) #10
  %134 = extractvalue { i32, i32, i32, i32 } %133, 0
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractvalue { i32, i32, i32, i32 } %133, 1
  %137 = bitcast i32 %136 to <2 x bfloat>
  %138 = extractvalue { i32, i32, i32, i32 } %133, 2
  %139 = bitcast i32 %138 to <2 x bfloat>
  %140 = extractvalue { i32, i32, i32, i32 } %133, 3
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = extractelement <2 x bfloat> %137, i64 0
  %145 = extractelement <2 x bfloat> %137, i64 1
  %146 = extractelement <2 x bfloat> %139, i64 0
  %147 = extractelement <2 x bfloat> %139, i64 1
  %148 = extractelement <2 x bfloat> %141, i64 0
  %149 = extractelement <2 x bfloat> %141, i64 1
  %150 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #10
  %151 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #10
  %152 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #10
  %153 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #10
  %154 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #10
  %155 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #10
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %166 = fadd float %97, %150
  %167 = fadd float %98, %151
  %168 = fadd float %99, %152
  %169 = fadd float %100, %153
  %170 = fadd float %101, %154
  %171 = fadd float %102, %155
  %172 = fadd float %103, %156
  %173 = fadd float %104, %157
  %174 = fadd float %105, %158
  %175 = fadd float %106, %159
  %176 = fadd float %107, %160
  %177 = fadd float %108, %161
  %178 = fadd float %109, %162
  %179 = fadd float %110, %163
  %180 = fadd float %111, %164
  %181 = fadd float %112, %165
  %182 = fmul float %166, %166
  %183 = fmul float %167, %167
  %184 = fmul float %168, %168
  %185 = fmul float %169, %169
  %186 = fmul float %170, %170
  %187 = fmul float %171, %171
  %188 = fmul float %172, %172
  %189 = fmul float %173, %173
  %190 = fmul float %174, %174
  %191 = fmul float %175, %175
  %192 = fmul float %176, %176
  %193 = fmul float %177, %177
  %194 = fmul float %178, %178
  %195 = fmul float %179, %179
  %196 = fmul float %180, %180
  %197 = fmul float %181, %181
  %198 = fadd float %182, %183
  %199 = fadd float %198, %184
  %200 = fadd float %199, %185
  %201 = fadd float %200, %186
  %202 = fadd float %201, %187
  %203 = fadd float %202, %188
  %204 = fadd float %203, %189
  %205 = fadd float %204, %190
  %206 = fadd float %205, %191
  %207 = fadd float %206, %192
  %208 = fadd float %207, %193
  %209 = fadd float %208, %194
  %210 = fadd float %209, %195
  %211 = fadd float %210, %196
  %212 = fadd float %211, %197
  %213 = bitcast float %212 to i32
  %214 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %213, i32 16, i32 31)
  %215 = bitcast i32 %214 to float
  %216 = fadd float %212, %215
  %217 = bitcast float %216 to i32
  %218 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %217, i32 8, i32 31)
  %219 = bitcast i32 %218 to float
  %220 = fadd float %216, %219
  %221 = bitcast float %220 to i32
  %222 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %221, i32 4, i32 31)
  %223 = bitcast i32 %222 to float
  %224 = fadd float %220, %223
  %225 = bitcast float %224 to i32
  %226 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %225, i32 2, i32 31)
  %227 = bitcast i32 %226 to float
  %228 = fadd float %224, %227
  %229 = bitcast float %228 to i32
  %230 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %229, i32 1, i32 31)
  %231 = bitcast i32 %230 to float
  %232 = fadd float %228, %231
  %233 = icmp eq i32 %10, 0
  %234 = zext nneg i32 %11 to i64
  %235 = getelementptr float, ptr addrspace(3) @global_smem, i64 %234
  %236 = bitcast float %232 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %235, <1 x i32> %236, i1 %233) #10
  tail call void @llvm.nvvm.barrier0()
  %237 = icmp samesign ult i32 %9, 2
  %238 = zext nneg i32 %9 to i64
  %239 = getelementptr float, ptr addrspace(3) @global_smem, i64 %238
  %240 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %239, i1 %237) #10
  %241 = bitcast i32 %240 to float
  %242 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %240, i32 1, i32 31)
  %243 = bitcast i32 %242 to float
  %244 = fadd float %241, %243
  %245 = icmp eq i32 %9, 0
  %246 = bitcast float %244 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %239, <1 x i32> %246, i1 %245) #10
  tail call void @llvm.nvvm.barrier0()
  %247 = load float, ptr addrspace(3) @global_smem, align 16
  %248 = fmul float %247, 0x3F50000000000000
  %249 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %250 = bitcast i32 %249 to float
  %251 = fadd float %248, %250
  %252 = tail call float @llvm.nvvm.rsqrt.approx.f(float %251)
  %253 = fmul float %48, %252
  %254 = fmul float %49, %252
  %255 = fmul float %50, %252
  %256 = fmul float %51, %252
  %257 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %5
  %258 = getelementptr bfloat, ptr addrspace(1) %257, i64 %17
  %259 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %258) #10
  %260 = extractvalue { i32, i32 } %259, 0
  %261 = bitcast i32 %260 to <2 x bfloat>
  %262 = extractvalue { i32, i32 } %259, 1
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractelement <2 x bfloat> %261, i64 0
  %265 = extractelement <2 x bfloat> %261, i64 1
  %266 = extractelement <2 x bfloat> %263, i64 0
  %267 = extractelement <2 x bfloat> %263, i64 1
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #10
  %272 = fmul float %253, %268
  %273 = fmul float %254, %269
  %274 = fmul float %255, %270
  %275 = fmul float %256, %271
  %276 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %272) #10
  %277 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %273) #10
  %278 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %274) #10
  %279 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %275) #10
  %280 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %281 = getelementptr bfloat, ptr addrspace(1) %280, i64 %17
  %282 = insertelement <2 x bfloat> poison, bfloat %276, i64 0
  %283 = insertelement <2 x bfloat> %282, bfloat %277, i64 1
  %284 = bitcast <2 x bfloat> %283 to i32
  %285 = insertelement <2 x bfloat> poison, bfloat %278, i64 0
  %286 = insertelement <2 x bfloat> %285, bfloat %279, i64 1
  %287 = bitcast <2 x bfloat> %286 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %284, i32 %287, ptr addrspace(1) %281) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion_2(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !5, !alias.scope !7
  %17 = fpext bfloat %16 to float
  %18 = fneg bfloat %16
  %19 = fpext bfloat %18 to float
  %20 = fmul float %19, 0x3FF7154760000000
  %21 = tail call float @llvm.nvvm.ex2.approx.f(float %20) #10
  %22 = fptrunc float %21 to bfloat
  %23 = fpext bfloat %22 to float
  %24 = fadd float %23, 1.000000e+00
  %25 = fdiv float 1.000000e+00, %24
  %26 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 6144
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5, !alias.scope !10
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

define ptx_kernel void @fusion_49(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(98304) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = mul i64 %3, 3072
  %7 = or disjoint i64 %5, %6
  %8 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = and i32 %9, 31
  %11 = lshr i32 %9, 5
  %12 = shl nuw nsw i32 %9, 2
  %13 = and i32 %12, 124
  %14 = icmp samesign ult i32 %9, 32
  %15 = select i1 %14, i32 0, i32 128
  %16 = or disjoint i32 %13, %15
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr bfloat, ptr addrspace(1) %8, i64 %17
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 2048
  %20 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %19) #10
  %21 = extractvalue { i32, i32 } %20, 0
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32 } %20, 1
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = extractelement <2 x bfloat> %24, i64 0
  %28 = extractelement <2 x bfloat> %24, i64 1
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %32 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %33 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %34 = getelementptr bfloat, ptr addrspace(1) %33, i64 %17
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %34) #10
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractelement <2 x bfloat> %37, i64 0
  %41 = extractelement <2 x bfloat> %37, i64 1
  %42 = extractelement <2 x bfloat> %39, i64 0
  %43 = extractelement <2 x bfloat> %39, i64 1
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #10
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %47 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #10
  %48 = getelementptr i8, ptr addrspace(1) %18, i64 4096
  %49 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %48) #10
  %50 = extractvalue { i32, i32 } %49, 0
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32 } %49, 1
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractelement <2 x bfloat> %51, i64 0
  %55 = extractelement <2 x bfloat> %51, i64 1
  %56 = extractelement <2 x bfloat> %53, i64 0
  %57 = extractelement <2 x bfloat> %53, i64 1
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57) #10
  %62 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %63 = getelementptr bfloat, ptr addrspace(1) %62, i64 %17
  %64 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %63) #10
  %65 = extractvalue { i32, i32 } %64, 0
  %66 = bitcast i32 %65 to <2 x bfloat>
  %67 = extractvalue { i32, i32 } %64, 1
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractelement <2 x bfloat> %66, i64 0
  %70 = extractelement <2 x bfloat> %66, i64 1
  %71 = extractelement <2 x bfloat> %68, i64 0
  %72 = extractelement <2 x bfloat> %68, i64 1
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #10
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #10
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #10
  %76 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #10
  %77 = fadd float %58, %73
  %78 = fadd float %59, %74
  %79 = fadd float %60, %75
  %80 = fadd float %61, %76
  %81 = fadd float %44, %77
  %82 = fadd float %45, %78
  %83 = fadd float %46, %79
  %84 = fadd float %47, %80
  %85 = fadd float %29, %81
  %86 = fadd float %30, %82
  %87 = fadd float %31, %83
  %88 = fadd float %32, %84
  %89 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %6
  %90 = getelementptr i8, ptr addrspace(1) %89, i64 2048
  %91 = shl nuw nsw i32 %9, 3
  %92 = and i32 %91, 248
  %93 = select i1 %14, i32 0, i32 256
  %94 = or disjoint i32 %92, %93
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr bfloat, ptr addrspace(1) %89, i64 %95
  %97 = getelementptr i8, ptr addrspace(1) %96, i64 2048
  %98 = getelementptr bfloat, ptr addrspace(1) %90, i64 %95
  %99 = getelementptr i8, ptr addrspace(1) %98, i64 1024
  %100 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %97) #10
  %101 = extractvalue { i32, i32, i32, i32 } %100, 0
  %102 = bitcast i32 %101 to <2 x bfloat>
  %103 = extractvalue { i32, i32, i32, i32 } %100, 1
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractvalue { i32, i32, i32, i32 } %100, 2
  %106 = bitcast i32 %105 to <2 x bfloat>
  %107 = extractvalue { i32, i32, i32, i32 } %100, 3
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractelement <2 x bfloat> %102, i64 0
  %110 = extractelement <2 x bfloat> %102, i64 1
  %111 = extractelement <2 x bfloat> %104, i64 0
  %112 = extractelement <2 x bfloat> %104, i64 1
  %113 = extractelement <2 x bfloat> %106, i64 0
  %114 = extractelement <2 x bfloat> %106, i64 1
  %115 = extractelement <2 x bfloat> %108, i64 0
  %116 = extractelement <2 x bfloat> %108, i64 1
  %117 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %99) #10
  %118 = extractvalue { i32, i32, i32, i32 } %117, 0
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractvalue { i32, i32, i32, i32 } %117, 1
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractvalue { i32, i32, i32, i32 } %117, 2
  %123 = bitcast i32 %122 to <2 x bfloat>
  %124 = extractvalue { i32, i32, i32, i32 } %117, 3
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractelement <2 x bfloat> %119, i64 0
  %127 = extractelement <2 x bfloat> %119, i64 1
  %128 = extractelement <2 x bfloat> %121, i64 0
  %129 = extractelement <2 x bfloat> %121, i64 1
  %130 = extractelement <2 x bfloat> %123, i64 0
  %131 = extractelement <2 x bfloat> %123, i64 1
  %132 = extractelement <2 x bfloat> %125, i64 0
  %133 = extractelement <2 x bfloat> %125, i64 1
  %134 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #10
  %135 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110) #10
  %136 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111) #10
  %137 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112) #10
  %138 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113) #10
  %139 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114) #10
  %140 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115) #10
  %141 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116) #10
  %142 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #10
  %143 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #10
  %144 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #10
  %145 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #10
  %146 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #10
  %147 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %148 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %149 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #10
  %150 = shl i64 %3, 10
  %151 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %150
  %152 = getelementptr bfloat, ptr addrspace(1) %151, i64 %95
  %153 = getelementptr i8, ptr addrspace(1) %152, i64 1024
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %152) #10
  %155 = extractvalue { i32, i32, i32, i32 } %154, 0
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %154, 1
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractvalue { i32, i32, i32, i32 } %154, 2
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractvalue { i32, i32, i32, i32 } %154, 3
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractelement <2 x bfloat> %156, i64 0
  %164 = extractelement <2 x bfloat> %156, i64 1
  %165 = extractelement <2 x bfloat> %158, i64 0
  %166 = extractelement <2 x bfloat> %158, i64 1
  %167 = extractelement <2 x bfloat> %160, i64 0
  %168 = extractelement <2 x bfloat> %160, i64 1
  %169 = extractelement <2 x bfloat> %162, i64 0
  %170 = extractelement <2 x bfloat> %162, i64 1
  %171 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153) #10
  %172 = extractvalue { i32, i32, i32, i32 } %171, 0
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %171, 1
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %171, 2
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractvalue { i32, i32, i32, i32 } %171, 3
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractelement <2 x bfloat> %173, i64 0
  %181 = extractelement <2 x bfloat> %173, i64 1
  %182 = extractelement <2 x bfloat> %175, i64 0
  %183 = extractelement <2 x bfloat> %175, i64 1
  %184 = extractelement <2 x bfloat> %177, i64 0
  %185 = extractelement <2 x bfloat> %177, i64 1
  %186 = extractelement <2 x bfloat> %179, i64 0
  %187 = extractelement <2 x bfloat> %179, i64 1
  %188 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163) #10
  %189 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164) #10
  %190 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165) #10
  %191 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166) #10
  %192 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167) #10
  %193 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168) #10
  %194 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169) #10
  %195 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170) #10
  %196 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180) #10
  %197 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181) #10
  %198 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182) #10
  %199 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183) #10
  %200 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184) #10
  %201 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %202 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %203 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %204 = getelementptr i8, ptr addrspace(1) %89, i64 4096
  %205 = getelementptr i8, ptr addrspace(1) %96, i64 4096
  %206 = getelementptr bfloat, ptr addrspace(1) %204, i64 %95
  %207 = getelementptr i8, ptr addrspace(1) %206, i64 1024
  %208 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %205) #10
  %209 = extractvalue { i32, i32, i32, i32 } %208, 0
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %208, 1
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractvalue { i32, i32, i32, i32 } %208, 2
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %208, 3
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractelement <2 x bfloat> %210, i64 0
  %218 = extractelement <2 x bfloat> %210, i64 1
  %219 = extractelement <2 x bfloat> %212, i64 0
  %220 = extractelement <2 x bfloat> %212, i64 1
  %221 = extractelement <2 x bfloat> %214, i64 0
  %222 = extractelement <2 x bfloat> %214, i64 1
  %223 = extractelement <2 x bfloat> %216, i64 0
  %224 = extractelement <2 x bfloat> %216, i64 1
  %225 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %207) #10
  %226 = extractvalue { i32, i32, i32, i32 } %225, 0
  %227 = bitcast i32 %226 to <2 x bfloat>
  %228 = extractvalue { i32, i32, i32, i32 } %225, 1
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %225, 2
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %225, 3
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractelement <2 x bfloat> %227, i64 0
  %235 = extractelement <2 x bfloat> %227, i64 1
  %236 = extractelement <2 x bfloat> %229, i64 0
  %237 = extractelement <2 x bfloat> %229, i64 1
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217) #10
  %243 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218) #10
  %244 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219) #10
  %245 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220) #10
  %246 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221) #10
  %247 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222) #10
  %248 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223) #10
  %249 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224) #10
  %250 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234) #10
  %251 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235) #10
  %252 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #10
  %253 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #10
  %254 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %255 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %256 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %257 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %258 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %150
  %259 = getelementptr bfloat, ptr addrspace(1) %258, i64 %95
  %260 = getelementptr i8, ptr addrspace(1) %259, i64 1024
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %259) #10
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractvalue { i32, i32, i32, i32 } %261, 1
  %265 = bitcast i32 %264 to <2 x bfloat>
  %266 = extractvalue { i32, i32, i32, i32 } %261, 2
  %267 = bitcast i32 %266 to <2 x bfloat>
  %268 = extractvalue { i32, i32, i32, i32 } %261, 3
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = extractelement <2 x bfloat> %263, i64 0
  %271 = extractelement <2 x bfloat> %263, i64 1
  %272 = extractelement <2 x bfloat> %265, i64 0
  %273 = extractelement <2 x bfloat> %265, i64 1
  %274 = extractelement <2 x bfloat> %267, i64 0
  %275 = extractelement <2 x bfloat> %267, i64 1
  %276 = extractelement <2 x bfloat> %269, i64 0
  %277 = extractelement <2 x bfloat> %269, i64 1
  %278 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %260) #10
  %279 = extractvalue { i32, i32, i32, i32 } %278, 0
  %280 = bitcast i32 %279 to <2 x bfloat>
  %281 = extractvalue { i32, i32, i32, i32 } %278, 1
  %282 = bitcast i32 %281 to <2 x bfloat>
  %283 = extractvalue { i32, i32, i32, i32 } %278, 2
  %284 = bitcast i32 %283 to <2 x bfloat>
  %285 = extractvalue { i32, i32, i32, i32 } %278, 3
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractelement <2 x bfloat> %280, i64 0
  %288 = extractelement <2 x bfloat> %280, i64 1
  %289 = extractelement <2 x bfloat> %282, i64 0
  %290 = extractelement <2 x bfloat> %282, i64 1
  %291 = extractelement <2 x bfloat> %284, i64 0
  %292 = extractelement <2 x bfloat> %284, i64 1
  %293 = extractelement <2 x bfloat> %286, i64 0
  %294 = extractelement <2 x bfloat> %286, i64 1
  %295 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %270) #10
  %296 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271) #10
  %297 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272) #10
  %298 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273) #10
  %299 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274) #10
  %300 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275) #10
  %301 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276) #10
  %302 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277) #10
  %303 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287) #10
  %304 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288) #10
  %305 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289) #10
  %306 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290) #10
  %307 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291) #10
  %308 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292) #10
  %309 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #10
  %310 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #10
  %311 = fadd float %242, %295
  %312 = fadd float %243, %296
  %313 = fadd float %244, %297
  %314 = fadd float %245, %298
  %315 = fadd float %246, %299
  %316 = fadd float %247, %300
  %317 = fadd float %248, %301
  %318 = fadd float %249, %302
  %319 = fadd float %250, %303
  %320 = fadd float %251, %304
  %321 = fadd float %252, %305
  %322 = fadd float %253, %306
  %323 = fadd float %254, %307
  %324 = fadd float %255, %308
  %325 = fadd float %256, %309
  %326 = fadd float %257, %310
  %327 = fadd float %188, %311
  %328 = fadd float %189, %312
  %329 = fadd float %190, %313
  %330 = fadd float %191, %314
  %331 = fadd float %192, %315
  %332 = fadd float %193, %316
  %333 = fadd float %194, %317
  %334 = fadd float %195, %318
  %335 = fadd float %196, %319
  %336 = fadd float %197, %320
  %337 = fadd float %198, %321
  %338 = fadd float %199, %322
  %339 = fadd float %200, %323
  %340 = fadd float %201, %324
  %341 = fadd float %202, %325
  %342 = fadd float %203, %326
  %343 = fadd float %134, %327
  %344 = fadd float %135, %328
  %345 = fadd float %136, %329
  %346 = fadd float %137, %330
  %347 = fadd float %138, %331
  %348 = fadd float %139, %332
  %349 = fadd float %140, %333
  %350 = fadd float %141, %334
  %351 = fadd float %142, %335
  %352 = fadd float %143, %336
  %353 = fadd float %144, %337
  %354 = fadd float %145, %338
  %355 = fadd float %146, %339
  %356 = fadd float %147, %340
  %357 = fadd float %148, %341
  %358 = fadd float %149, %342
  %359 = fmul float %343, %343
  %360 = fmul float %344, %344
  %361 = fmul float %345, %345
  %362 = fmul float %346, %346
  %363 = fmul float %347, %347
  %364 = fmul float %348, %348
  %365 = fmul float %349, %349
  %366 = fmul float %350, %350
  %367 = fmul float %351, %351
  %368 = fmul float %352, %352
  %369 = fmul float %353, %353
  %370 = fmul float %354, %354
  %371 = fmul float %355, %355
  %372 = fmul float %356, %356
  %373 = fmul float %357, %357
  %374 = fmul float %358, %358
  %375 = fadd float %359, %360
  %376 = fadd float %375, %361
  %377 = fadd float %376, %362
  %378 = fadd float %377, %363
  %379 = fadd float %378, %364
  %380 = fadd float %379, %365
  %381 = fadd float %380, %366
  %382 = fadd float %381, %367
  %383 = fadd float %382, %368
  %384 = fadd float %383, %369
  %385 = fadd float %384, %370
  %386 = fadd float %385, %371
  %387 = fadd float %386, %372
  %388 = fadd float %387, %373
  %389 = fadd float %388, %374
  %390 = bitcast float %389 to i32
  %391 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %390, i32 16, i32 31)
  %392 = bitcast i32 %391 to float
  %393 = fadd float %389, %392
  %394 = bitcast float %393 to i32
  %395 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %394, i32 8, i32 31)
  %396 = bitcast i32 %395 to float
  %397 = fadd float %393, %396
  %398 = bitcast float %397 to i32
  %399 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %398, i32 4, i32 31)
  %400 = bitcast i32 %399 to float
  %401 = fadd float %397, %400
  %402 = bitcast float %401 to i32
  %403 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %402, i32 2, i32 31)
  %404 = bitcast i32 %403 to float
  %405 = fadd float %401, %404
  %406 = bitcast float %405 to i32
  %407 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %406, i32 1, i32 31)
  %408 = bitcast i32 %407 to float
  %409 = fadd float %405, %408
  %410 = icmp eq i32 %10, 0
  %411 = zext nneg i32 %11 to i64
  %412 = getelementptr float, ptr addrspace(3) @global_smem, i64 %411
  %413 = bitcast float %409 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %412, <1 x i32> %413, i1 %410) #10
  tail call void @llvm.nvvm.barrier0()
  %414 = icmp samesign ult i32 %9, 2
  %415 = zext nneg i32 %9 to i64
  %416 = getelementptr float, ptr addrspace(3) @global_smem, i64 %415
  %417 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %416, i1 %414) #10
  %418 = bitcast i32 %417 to float
  %419 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %417, i32 1, i32 31)
  %420 = bitcast i32 %419 to float
  %421 = fadd float %418, %420
  %422 = icmp eq i32 %9, 0
  %423 = bitcast float %421 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %416, <1 x i32> %423, i1 %422) #10
  tail call void @llvm.nvvm.barrier0()
  %424 = load float, ptr addrspace(3) @global_smem, align 16
  %425 = fmul float %424, 0x3F50000000000000
  %426 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %427 = bitcast i32 %426 to float
  %428 = fadd float %425, %427
  %429 = tail call float @llvm.nvvm.rsqrt.approx.f(float %428)
  %430 = fmul float %85, %429
  %431 = fmul float %86, %429
  %432 = fmul float %87, %429
  %433 = fmul float %88, %429
  %434 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %5
  %435 = getelementptr bfloat, ptr addrspace(1) %434, i64 %17
  %436 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %435) #10
  %437 = extractvalue { i32, i32 } %436, 0
  %438 = bitcast i32 %437 to <2 x bfloat>
  %439 = extractvalue { i32, i32 } %436, 1
  %440 = bitcast i32 %439 to <2 x bfloat>
  %441 = extractelement <2 x bfloat> %438, i64 0
  %442 = extractelement <2 x bfloat> %438, i64 1
  %443 = extractelement <2 x bfloat> %440, i64 0
  %444 = extractelement <2 x bfloat> %440, i64 1
  %445 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441) #10
  %446 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442) #10
  %447 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443) #10
  %448 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444) #10
  %449 = fmul float %430, %445
  %450 = fmul float %431, %446
  %451 = fmul float %432, %447
  %452 = fmul float %433, %448
  %453 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %449) #10
  %454 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %450) #10
  %455 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %451) #10
  %456 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %452) #10
  %457 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %4
  %458 = getelementptr bfloat, ptr addrspace(1) %457, i64 %17
  %459 = insertelement <2 x bfloat> poison, bfloat %453, i64 0
  %460 = insertelement <2 x bfloat> %459, bfloat %454, i64 1
  %461 = bitcast <2 x bfloat> %460 to i32
  %462 = insertelement <2 x bfloat> poison, bfloat %455, i64 0
  %463 = insertelement <2 x bfloat> %462, bfloat %456, i64 1
  %464 = bitcast <2 x bfloat> %463 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %461, i32 %464, ptr addrspace(1) %458) #10
  ret void
}

define ptx_kernel void @fusion_47(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(98304) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #5 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = mul i64 %3, 3072
  %7 = or disjoint i64 %5, %6
  %8 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = and i32 %9, 31
  %11 = lshr i32 %9, 5
  %12 = shl nuw nsw i32 %9, 2
  %13 = and i32 %12, 124
  %14 = icmp samesign ult i32 %9, 32
  %15 = select i1 %14, i32 0, i32 128
  %16 = or disjoint i32 %13, %15
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr bfloat, ptr addrspace(1) %8, i64 %17
  %19 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %18) #10
  %20 = extractvalue { i32, i32 } %19, 0
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32 } %19, 1
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractelement <2 x bfloat> %21, i64 0
  %25 = extractelement <2 x bfloat> %21, i64 1
  %26 = extractelement <2 x bfloat> %23, i64 0
  %27 = extractelement <2 x bfloat> %23, i64 1
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %32 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %4
  %33 = getelementptr bfloat, ptr addrspace(1) %32, i64 %17
  %34 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %33) #10
  %35 = extractvalue { i32, i32 } %34, 0
  %36 = bitcast i32 %35 to <2 x bfloat>
  %37 = extractvalue { i32, i32 } %34, 1
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractelement <2 x bfloat> %36, i64 0
  %40 = extractelement <2 x bfloat> %36, i64 1
  %41 = extractelement <2 x bfloat> %38, i64 0
  %42 = extractelement <2 x bfloat> %38, i64 1
  %43 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %39) #10
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #10
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %47 = getelementptr i8, ptr addrspace(1) %18, i64 2048
  %48 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %47) #10
  %49 = extractvalue { i32, i32 } %48, 0
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractvalue { i32, i32 } %48, 1
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractelement <2 x bfloat> %50, i64 0
  %54 = extractelement <2 x bfloat> %50, i64 1
  %55 = extractelement <2 x bfloat> %52, i64 0
  %56 = extractelement <2 x bfloat> %52, i64 1
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56) #10
  %61 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %62 = getelementptr bfloat, ptr addrspace(1) %61, i64 %17
  %63 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %62) #10
  %64 = extractvalue { i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractelement <2 x bfloat> %65, i64 0
  %69 = extractelement <2 x bfloat> %65, i64 1
  %70 = extractelement <2 x bfloat> %67, i64 0
  %71 = extractelement <2 x bfloat> %67, i64 1
  %72 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68) #10
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #10
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #10
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #10
  %76 = getelementptr i8, ptr addrspace(1) %18, i64 4096
  %77 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %76) #10
  %78 = extractvalue { i32, i32 } %77, 0
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32 } %77, 1
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %79, i64 0
  %83 = extractelement <2 x bfloat> %79, i64 1
  %84 = extractelement <2 x bfloat> %81, i64 0
  %85 = extractelement <2 x bfloat> %81, i64 1
  %86 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %87 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %88 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %89 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %90 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %91 = getelementptr bfloat, ptr addrspace(1) %90, i64 %17
  %92 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %91) #10
  %93 = extractvalue { i32, i32 } %92, 0
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractvalue { i32, i32 } %92, 1
  %96 = bitcast i32 %95 to <2 x bfloat>
  %97 = extractelement <2 x bfloat> %94, i64 0
  %98 = extractelement <2 x bfloat> %94, i64 1
  %99 = extractelement <2 x bfloat> %96, i64 0
  %100 = extractelement <2 x bfloat> %96, i64 1
  %101 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %105 = fadd float %86, %101
  %106 = fadd float %87, %102
  %107 = fadd float %88, %103
  %108 = fadd float %89, %104
  %109 = fadd float %72, %105
  %110 = fadd float %73, %106
  %111 = fadd float %74, %107
  %112 = fadd float %75, %108
  %113 = fadd float %57, %109
  %114 = fadd float %58, %110
  %115 = fadd float %59, %111
  %116 = fadd float %60, %112
  %117 = fadd float %43, %113
  %118 = fadd float %44, %114
  %119 = fadd float %45, %115
  %120 = fadd float %46, %116
  %121 = fadd float %28, %117
  %122 = fadd float %29, %118
  %123 = fadd float %30, %119
  %124 = fadd float %31, %120
  %125 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %6
  %126 = shl nuw nsw i32 %9, 3
  %127 = and i32 %126, 248
  %128 = select i1 %14, i32 0, i32 256
  %129 = or disjoint i32 %127, %128
  %130 = zext nneg i32 %129 to i64
  %131 = getelementptr bfloat, ptr addrspace(1) %125, i64 %130
  %132 = getelementptr i8, ptr addrspace(1) %131, i64 1024
  %133 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %131) #10
  %134 = extractvalue { i32, i32, i32, i32 } %133, 0
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractvalue { i32, i32, i32, i32 } %133, 1
  %137 = bitcast i32 %136 to <2 x bfloat>
  %138 = extractvalue { i32, i32, i32, i32 } %133, 2
  %139 = bitcast i32 %138 to <2 x bfloat>
  %140 = extractvalue { i32, i32, i32, i32 } %133, 3
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = extractelement <2 x bfloat> %137, i64 0
  %145 = extractelement <2 x bfloat> %137, i64 1
  %146 = extractelement <2 x bfloat> %139, i64 0
  %147 = extractelement <2 x bfloat> %139, i64 1
  %148 = extractelement <2 x bfloat> %141, i64 0
  %149 = extractelement <2 x bfloat> %141, i64 1
  %150 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %132) #10
  %151 = extractvalue { i32, i32, i32, i32 } %150, 0
  %152 = bitcast i32 %151 to <2 x bfloat>
  %153 = extractvalue { i32, i32, i32, i32 } %150, 1
  %154 = bitcast i32 %153 to <2 x bfloat>
  %155 = extractvalue { i32, i32, i32, i32 } %150, 2
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %150, 3
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractelement <2 x bfloat> %152, i64 0
  %160 = extractelement <2 x bfloat> %152, i64 1
  %161 = extractelement <2 x bfloat> %154, i64 0
  %162 = extractelement <2 x bfloat> %154, i64 1
  %163 = extractelement <2 x bfloat> %156, i64 0
  %164 = extractelement <2 x bfloat> %156, i64 1
  %165 = extractelement <2 x bfloat> %158, i64 0
  %166 = extractelement <2 x bfloat> %158, i64 1
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #10
  %177 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %161) #10
  %178 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %162) #10
  %179 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163) #10
  %180 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164) #10
  %181 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165) #10
  %182 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166) #10
  %183 = shl i64 %3, 10
  %184 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %183
  %185 = getelementptr bfloat, ptr addrspace(1) %184, i64 %130
  %186 = getelementptr i8, ptr addrspace(1) %185, i64 1024
  %187 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %185) #10
  %188 = extractvalue { i32, i32, i32, i32 } %187, 0
  %189 = bitcast i32 %188 to <2 x bfloat>
  %190 = extractvalue { i32, i32, i32, i32 } %187, 1
  %191 = bitcast i32 %190 to <2 x bfloat>
  %192 = extractvalue { i32, i32, i32, i32 } %187, 2
  %193 = bitcast i32 %192 to <2 x bfloat>
  %194 = extractvalue { i32, i32, i32, i32 } %187, 3
  %195 = bitcast i32 %194 to <2 x bfloat>
  %196 = extractelement <2 x bfloat> %189, i64 0
  %197 = extractelement <2 x bfloat> %189, i64 1
  %198 = extractelement <2 x bfloat> %191, i64 0
  %199 = extractelement <2 x bfloat> %191, i64 1
  %200 = extractelement <2 x bfloat> %193, i64 0
  %201 = extractelement <2 x bfloat> %193, i64 1
  %202 = extractelement <2 x bfloat> %195, i64 0
  %203 = extractelement <2 x bfloat> %195, i64 1
  %204 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %186) #10
  %205 = extractvalue { i32, i32, i32, i32 } %204, 0
  %206 = bitcast i32 %205 to <2 x bfloat>
  %207 = extractvalue { i32, i32, i32, i32 } %204, 1
  %208 = bitcast i32 %207 to <2 x bfloat>
  %209 = extractvalue { i32, i32, i32, i32 } %204, 2
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %204, 3
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractelement <2 x bfloat> %206, i64 0
  %214 = extractelement <2 x bfloat> %206, i64 1
  %215 = extractelement <2 x bfloat> %208, i64 0
  %216 = extractelement <2 x bfloat> %208, i64 1
  %217 = extractelement <2 x bfloat> %210, i64 0
  %218 = extractelement <2 x bfloat> %210, i64 1
  %219 = extractelement <2 x bfloat> %212, i64 0
  %220 = extractelement <2 x bfloat> %212, i64 1
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %198) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %199) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %200) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %201) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #10
  %230 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %214) #10
  %231 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %215) #10
  %232 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %216) #10
  %233 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217) #10
  %234 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218) #10
  %235 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219) #10
  %236 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220) #10
  %237 = getelementptr i8, ptr addrspace(1) %125, i64 2048
  %238 = getelementptr i8, ptr addrspace(1) %131, i64 2048
  %239 = getelementptr bfloat, ptr addrspace(1) %237, i64 %130
  %240 = getelementptr i8, ptr addrspace(1) %239, i64 1024
  %241 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %238) #10
  %242 = extractvalue { i32, i32, i32, i32 } %241, 0
  %243 = bitcast i32 %242 to <2 x bfloat>
  %244 = extractvalue { i32, i32, i32, i32 } %241, 1
  %245 = bitcast i32 %244 to <2 x bfloat>
  %246 = extractvalue { i32, i32, i32, i32 } %241, 2
  %247 = bitcast i32 %246 to <2 x bfloat>
  %248 = extractvalue { i32, i32, i32, i32 } %241, 3
  %249 = bitcast i32 %248 to <2 x bfloat>
  %250 = extractelement <2 x bfloat> %243, i64 0
  %251 = extractelement <2 x bfloat> %243, i64 1
  %252 = extractelement <2 x bfloat> %245, i64 0
  %253 = extractelement <2 x bfloat> %245, i64 1
  %254 = extractelement <2 x bfloat> %247, i64 0
  %255 = extractelement <2 x bfloat> %247, i64 1
  %256 = extractelement <2 x bfloat> %249, i64 0
  %257 = extractelement <2 x bfloat> %249, i64 1
  %258 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %240) #10
  %259 = extractvalue { i32, i32, i32, i32 } %258, 0
  %260 = bitcast i32 %259 to <2 x bfloat>
  %261 = extractvalue { i32, i32, i32, i32 } %258, 1
  %262 = bitcast i32 %261 to <2 x bfloat>
  %263 = extractvalue { i32, i32, i32, i32 } %258, 2
  %264 = bitcast i32 %263 to <2 x bfloat>
  %265 = extractvalue { i32, i32, i32, i32 } %258, 3
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractelement <2 x bfloat> %260, i64 0
  %268 = extractelement <2 x bfloat> %260, i64 1
  %269 = extractelement <2 x bfloat> %262, i64 0
  %270 = extractelement <2 x bfloat> %262, i64 1
  %271 = extractelement <2 x bfloat> %264, i64 0
  %272 = extractelement <2 x bfloat> %264, i64 1
  %273 = extractelement <2 x bfloat> %266, i64 0
  %274 = extractelement <2 x bfloat> %266, i64 1
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %251) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %252) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %253) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #10
  %284 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %268) #10
  %285 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %269) #10
  %286 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %270) #10
  %287 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271) #10
  %288 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272) #10
  %289 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273) #10
  %290 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274) #10
  %291 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %183
  %292 = getelementptr bfloat, ptr addrspace(1) %291, i64 %130
  %293 = getelementptr i8, ptr addrspace(1) %292, i64 1024
  %294 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %292) #10
  %295 = extractvalue { i32, i32, i32, i32 } %294, 0
  %296 = bitcast i32 %295 to <2 x bfloat>
  %297 = extractvalue { i32, i32, i32, i32 } %294, 1
  %298 = bitcast i32 %297 to <2 x bfloat>
  %299 = extractvalue { i32, i32, i32, i32 } %294, 2
  %300 = bitcast i32 %299 to <2 x bfloat>
  %301 = extractvalue { i32, i32, i32, i32 } %294, 3
  %302 = bitcast i32 %301 to <2 x bfloat>
  %303 = extractelement <2 x bfloat> %296, i64 0
  %304 = extractelement <2 x bfloat> %296, i64 1
  %305 = extractelement <2 x bfloat> %298, i64 0
  %306 = extractelement <2 x bfloat> %298, i64 1
  %307 = extractelement <2 x bfloat> %300, i64 0
  %308 = extractelement <2 x bfloat> %300, i64 1
  %309 = extractelement <2 x bfloat> %302, i64 0
  %310 = extractelement <2 x bfloat> %302, i64 1
  %311 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %293) #10
  %312 = extractvalue { i32, i32, i32, i32 } %311, 0
  %313 = bitcast i32 %312 to <2 x bfloat>
  %314 = extractvalue { i32, i32, i32, i32 } %311, 1
  %315 = bitcast i32 %314 to <2 x bfloat>
  %316 = extractvalue { i32, i32, i32, i32 } %311, 2
  %317 = bitcast i32 %316 to <2 x bfloat>
  %318 = extractvalue { i32, i32, i32, i32 } %311, 3
  %319 = bitcast i32 %318 to <2 x bfloat>
  %320 = extractelement <2 x bfloat> %313, i64 0
  %321 = extractelement <2 x bfloat> %313, i64 1
  %322 = extractelement <2 x bfloat> %315, i64 0
  %323 = extractelement <2 x bfloat> %315, i64 1
  %324 = extractelement <2 x bfloat> %317, i64 0
  %325 = extractelement <2 x bfloat> %317, i64 1
  %326 = extractelement <2 x bfloat> %319, i64 0
  %327 = extractelement <2 x bfloat> %319, i64 1
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %305) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %306) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %307) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %308) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #10
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #10
  %337 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %321) #10
  %338 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %322) #10
  %339 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %323) #10
  %340 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %324) #10
  %341 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %325) #10
  %342 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %326) #10
  %343 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %327) #10
  %344 = getelementptr i8, ptr addrspace(1) %125, i64 4096
  %345 = getelementptr i8, ptr addrspace(1) %131, i64 4096
  %346 = getelementptr bfloat, ptr addrspace(1) %344, i64 %130
  %347 = getelementptr i8, ptr addrspace(1) %346, i64 1024
  %348 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %345) #10
  %349 = extractvalue { i32, i32, i32, i32 } %348, 0
  %350 = bitcast i32 %349 to <2 x bfloat>
  %351 = extractvalue { i32, i32, i32, i32 } %348, 1
  %352 = bitcast i32 %351 to <2 x bfloat>
  %353 = extractvalue { i32, i32, i32, i32 } %348, 2
  %354 = bitcast i32 %353 to <2 x bfloat>
  %355 = extractvalue { i32, i32, i32, i32 } %348, 3
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractelement <2 x bfloat> %350, i64 0
  %358 = extractelement <2 x bfloat> %350, i64 1
  %359 = extractelement <2 x bfloat> %352, i64 0
  %360 = extractelement <2 x bfloat> %352, i64 1
  %361 = extractelement <2 x bfloat> %354, i64 0
  %362 = extractelement <2 x bfloat> %354, i64 1
  %363 = extractelement <2 x bfloat> %356, i64 0
  %364 = extractelement <2 x bfloat> %356, i64 1
  %365 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %347) #10
  %366 = extractvalue { i32, i32, i32, i32 } %365, 0
  %367 = bitcast i32 %366 to <2 x bfloat>
  %368 = extractvalue { i32, i32, i32, i32 } %365, 1
  %369 = bitcast i32 %368 to <2 x bfloat>
  %370 = extractvalue { i32, i32, i32, i32 } %365, 2
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %365, 3
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractelement <2 x bfloat> %367, i64 0
  %375 = extractelement <2 x bfloat> %367, i64 1
  %376 = extractelement <2 x bfloat> %369, i64 0
  %377 = extractelement <2 x bfloat> %369, i64 1
  %378 = extractelement <2 x bfloat> %371, i64 0
  %379 = extractelement <2 x bfloat> %371, i64 1
  %380 = extractelement <2 x bfloat> %373, i64 0
  %381 = extractelement <2 x bfloat> %373, i64 1
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %358) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %359) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %360) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %361) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362) #10
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #10
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #10
  %390 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %374) #10
  %391 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %375) #10
  %392 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #10
  %393 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #10
  %394 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #10
  %395 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #10
  %396 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #10
  %397 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #10
  %398 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %183
  %399 = getelementptr bfloat, ptr addrspace(1) %398, i64 %130
  %400 = getelementptr i8, ptr addrspace(1) %399, i64 1024
  %401 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %399) #10
  %402 = extractvalue { i32, i32, i32, i32 } %401, 0
  %403 = bitcast i32 %402 to <2 x bfloat>
  %404 = extractvalue { i32, i32, i32, i32 } %401, 1
  %405 = bitcast i32 %404 to <2 x bfloat>
  %406 = extractvalue { i32, i32, i32, i32 } %401, 2
  %407 = bitcast i32 %406 to <2 x bfloat>
  %408 = extractvalue { i32, i32, i32, i32 } %401, 3
  %409 = bitcast i32 %408 to <2 x bfloat>
  %410 = extractelement <2 x bfloat> %403, i64 0
  %411 = extractelement <2 x bfloat> %403, i64 1
  %412 = extractelement <2 x bfloat> %405, i64 0
  %413 = extractelement <2 x bfloat> %405, i64 1
  %414 = extractelement <2 x bfloat> %407, i64 0
  %415 = extractelement <2 x bfloat> %407, i64 1
  %416 = extractelement <2 x bfloat> %409, i64 0
  %417 = extractelement <2 x bfloat> %409, i64 1
  %418 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %400) #10
  %419 = extractvalue { i32, i32, i32, i32 } %418, 0
  %420 = bitcast i32 %419 to <2 x bfloat>
  %421 = extractvalue { i32, i32, i32, i32 } %418, 1
  %422 = bitcast i32 %421 to <2 x bfloat>
  %423 = extractvalue { i32, i32, i32, i32 } %418, 2
  %424 = bitcast i32 %423 to <2 x bfloat>
  %425 = extractvalue { i32, i32, i32, i32 } %418, 3
  %426 = bitcast i32 %425 to <2 x bfloat>
  %427 = extractelement <2 x bfloat> %420, i64 0
  %428 = extractelement <2 x bfloat> %420, i64 1
  %429 = extractelement <2 x bfloat> %422, i64 0
  %430 = extractelement <2 x bfloat> %422, i64 1
  %431 = extractelement <2 x bfloat> %424, i64 0
  %432 = extractelement <2 x bfloat> %424, i64 1
  %433 = extractelement <2 x bfloat> %426, i64 0
  %434 = extractelement <2 x bfloat> %426, i64 1
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %410) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %411) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %412) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %413) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %414) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %415) #10
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %416) #10
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #10
  %443 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %427) #10
  %444 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %428) #10
  %445 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %429) #10
  %446 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430) #10
  %447 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #10
  %448 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %449 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %450 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %451 = fadd float %382, %435
  %452 = fadd float %383, %436
  %453 = fadd float %384, %437
  %454 = fadd float %385, %438
  %455 = fadd float %386, %439
  %456 = fadd float %387, %440
  %457 = fadd float %388, %441
  %458 = fadd float %389, %442
  %459 = fadd float %390, %443
  %460 = fadd float %391, %444
  %461 = fadd float %392, %445
  %462 = fadd float %393, %446
  %463 = fadd float %394, %447
  %464 = fadd float %395, %448
  %465 = fadd float %396, %449
  %466 = fadd float %397, %450
  %467 = fadd float %328, %451
  %468 = fadd float %329, %452
  %469 = fadd float %330, %453
  %470 = fadd float %331, %454
  %471 = fadd float %332, %455
  %472 = fadd float %333, %456
  %473 = fadd float %334, %457
  %474 = fadd float %335, %458
  %475 = fadd float %336, %459
  %476 = fadd float %337, %460
  %477 = fadd float %338, %461
  %478 = fadd float %339, %462
  %479 = fadd float %340, %463
  %480 = fadd float %341, %464
  %481 = fadd float %342, %465
  %482 = fadd float %343, %466
  %483 = fadd float %275, %467
  %484 = fadd float %276, %468
  %485 = fadd float %277, %469
  %486 = fadd float %278, %470
  %487 = fadd float %279, %471
  %488 = fadd float %280, %472
  %489 = fadd float %281, %473
  %490 = fadd float %282, %474
  %491 = fadd float %283, %475
  %492 = fadd float %284, %476
  %493 = fadd float %285, %477
  %494 = fadd float %286, %478
  %495 = fadd float %287, %479
  %496 = fadd float %288, %480
  %497 = fadd float %289, %481
  %498 = fadd float %290, %482
  %499 = fadd float %221, %483
  %500 = fadd float %222, %484
  %501 = fadd float %223, %485
  %502 = fadd float %224, %486
  %503 = fadd float %225, %487
  %504 = fadd float %226, %488
  %505 = fadd float %227, %489
  %506 = fadd float %228, %490
  %507 = fadd float %229, %491
  %508 = fadd float %230, %492
  %509 = fadd float %231, %493
  %510 = fadd float %232, %494
  %511 = fadd float %233, %495
  %512 = fadd float %234, %496
  %513 = fadd float %235, %497
  %514 = fadd float %236, %498
  %515 = fadd float %167, %499
  %516 = fadd float %168, %500
  %517 = fadd float %169, %501
  %518 = fadd float %170, %502
  %519 = fadd float %171, %503
  %520 = fadd float %172, %504
  %521 = fadd float %173, %505
  %522 = fadd float %174, %506
  %523 = fadd float %175, %507
  %524 = fadd float %176, %508
  %525 = fadd float %177, %509
  %526 = fadd float %178, %510
  %527 = fadd float %179, %511
  %528 = fadd float %180, %512
  %529 = fadd float %181, %513
  %530 = fadd float %182, %514
  %531 = fmul float %515, %515
  %532 = fmul float %516, %516
  %533 = fmul float %517, %517
  %534 = fmul float %518, %518
  %535 = fmul float %519, %519
  %536 = fmul float %520, %520
  %537 = fmul float %521, %521
  %538 = fmul float %522, %522
  %539 = fmul float %523, %523
  %540 = fmul float %524, %524
  %541 = fmul float %525, %525
  %542 = fmul float %526, %526
  %543 = fmul float %527, %527
  %544 = fmul float %528, %528
  %545 = fmul float %529, %529
  %546 = fmul float %530, %530
  %547 = fadd float %531, %532
  %548 = fadd float %547, %533
  %549 = fadd float %548, %534
  %550 = fadd float %549, %535
  %551 = fadd float %550, %536
  %552 = fadd float %551, %537
  %553 = fadd float %552, %538
  %554 = fadd float %553, %539
  %555 = fadd float %554, %540
  %556 = fadd float %555, %541
  %557 = fadd float %556, %542
  %558 = fadd float %557, %543
  %559 = fadd float %558, %544
  %560 = fadd float %559, %545
  %561 = fadd float %560, %546
  %562 = bitcast float %561 to i32
  %563 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %562, i32 16, i32 31)
  %564 = bitcast i32 %563 to float
  %565 = fadd float %561, %564
  %566 = bitcast float %565 to i32
  %567 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %566, i32 8, i32 31)
  %568 = bitcast i32 %567 to float
  %569 = fadd float %565, %568
  %570 = bitcast float %569 to i32
  %571 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %570, i32 4, i32 31)
  %572 = bitcast i32 %571 to float
  %573 = fadd float %569, %572
  %574 = bitcast float %573 to i32
  %575 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %574, i32 2, i32 31)
  %576 = bitcast i32 %575 to float
  %577 = fadd float %573, %576
  %578 = bitcast float %577 to i32
  %579 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %578, i32 1, i32 31)
  %580 = bitcast i32 %579 to float
  %581 = fadd float %577, %580
  %582 = icmp eq i32 %10, 0
  %583 = zext nneg i32 %11 to i64
  %584 = getelementptr float, ptr addrspace(3) @global_smem, i64 %583
  %585 = bitcast float %581 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %584, <1 x i32> %585, i1 %582) #10
  tail call void @llvm.nvvm.barrier0()
  %586 = icmp samesign ult i32 %9, 2
  %587 = zext nneg i32 %9 to i64
  %588 = getelementptr float, ptr addrspace(3) @global_smem, i64 %587
  %589 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %588, i1 %586) #10
  %590 = bitcast i32 %589 to float
  %591 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %589, i32 1, i32 31)
  %592 = bitcast i32 %591 to float
  %593 = fadd float %590, %592
  %594 = icmp eq i32 %9, 0
  %595 = bitcast float %593 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %588, <1 x i32> %595, i1 %594) #10
  tail call void @llvm.nvvm.barrier0()
  %596 = load float, ptr addrspace(3) @global_smem, align 16
  %597 = fmul float %596, 0x3F50000000000000
  %598 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %599 = bitcast i32 %598 to float
  %600 = fadd float %597, %599
  %601 = tail call float @llvm.nvvm.rsqrt.approx.f(float %600)
  %602 = fmul float %121, %601
  %603 = fmul float %122, %601
  %604 = fmul float %123, %601
  %605 = fmul float %124, %601
  %606 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %5
  %607 = getelementptr bfloat, ptr addrspace(1) %606, i64 %17
  %608 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %607) #10
  %609 = extractvalue { i32, i32 } %608, 0
  %610 = bitcast i32 %609 to <2 x bfloat>
  %611 = extractvalue { i32, i32 } %608, 1
  %612 = bitcast i32 %611 to <2 x bfloat>
  %613 = extractelement <2 x bfloat> %610, i64 0
  %614 = extractelement <2 x bfloat> %610, i64 1
  %615 = extractelement <2 x bfloat> %612, i64 0
  %616 = extractelement <2 x bfloat> %612, i64 1
  %617 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %613) #10
  %618 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %614) #10
  %619 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %615) #10
  %620 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %616) #10
  %621 = fmul float %602, %617
  %622 = fmul float %603, %618
  %623 = fmul float %604, %619
  %624 = fmul float %605, %620
  %625 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #10
  %626 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #10
  %627 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #10
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #10
  %629 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %4
  %630 = getelementptr bfloat, ptr addrspace(1) %629, i64 %17
  %631 = insertelement <2 x bfloat> poison, bfloat %625, i64 0
  %632 = insertelement <2 x bfloat> %631, bfloat %626, i64 1
  %633 = bitcast <2 x bfloat> %632 to i32
  %634 = insertelement <2 x bfloat> poison, bfloat %627, i64 0
  %635 = insertelement <2 x bfloat> %634, bfloat %628, i64 1
  %636 = bitcast <2 x bfloat> %635 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %633, i32 %636, ptr addrspace(1) %630) #10
  ret void
}

define ptx_kernel void @fusion_45(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(98304) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #5 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
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
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #10
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
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %.idx = mul nsw i64 %2, 6144
  %66 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %13
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #10
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #10
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %13
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 1024
  %122 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #10
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
  %139 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #10
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
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = getelementptr i8, ptr addrspace(1) %66, i64 2048
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr bfloat, ptr addrspace(1) %172, i64 %13
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %173) #10
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
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #10
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
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %227 = getelementptr bfloat, ptr addrspace(1) %226, i64 %13
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 1024
  %229 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #10
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
  %246 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
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
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = getelementptr i8, ptr addrspace(1) %66, i64 4096
  %280 = getelementptr i8, ptr addrspace(1) %67, i64 4096
  %281 = getelementptr bfloat, ptr addrspace(1) %279, i64 %13
  %282 = getelementptr i8, ptr addrspace(1) %281, i64 1024
  %283 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %280) #10
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
  %300 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #10
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
  %317 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292) #10
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #10
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #10
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %334 = getelementptr bfloat, ptr addrspace(1) %333, i64 %13
  %335 = getelementptr i8, ptr addrspace(1) %334, i64 1024
  %336 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %334) #10
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
  %353 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #10
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
  %370 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %345) #10
  %371 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346) #10
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #10
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #10
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %535, <1 x i32> %536, i1 %533) #10
  tail call void @llvm.nvvm.barrier0()
  %537 = icmp samesign ult i32 %5, 2
  %538 = zext nneg i32 %5 to i64
  %539 = getelementptr float, ptr addrspace(3) @global_smem, i64 %538
  %540 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %539, i1 %537) #10
  %541 = bitcast i32 %540 to float
  %542 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %540, i32 1, i32 31)
  %543 = bitcast i32 %542 to float
  %544 = fadd float %541, %543
  %545 = icmp eq i32 %5, 0
  %546 = bitcast float %544 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %539, <1 x i32> %546, i1 %545) #10
  tail call void @llvm.nvvm.barrier0()
  %547 = load float, ptr addrspace(3) @global_smem, align 16
  %548 = fmul float %547, 0x3F50000000000000
  %549 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %571 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %569) #10
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
  %588 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %570) #10
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
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %580) #10
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %581) #10
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %582) #10
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %583) #10
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %584) #10
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %585) #10
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %586) #10
  %612 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %587) #10
  %613 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %597) #10
  %614 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %598) #10
  %615 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %599) #10
  %616 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %600) #10
  %617 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %601) #10
  %618 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %602) #10
  %619 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %603) #10
  %620 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %604) #10
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
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #10
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #10
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #10
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #10
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #10
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #10
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #10
  %644 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %628) #10
  %645 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %629) #10
  %646 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %630) #10
  %647 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %631) #10
  %648 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %632) #10
  %649 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %633) #10
  %650 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %634) #10
  %651 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %635) #10
  %652 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %636) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %658, i32 %661, i32 %664, i32 %667, ptr addrspace(1) %654) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %670, i32 %673, i32 %676, i32 %679, ptr addrspace(1) %655) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(131072) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 61440
  %11 = or disjoint i32 %10, %8
  %12 = or disjoint i32 %11, %5
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 6144
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !5
  %17 = or disjoint i32 %7, %5
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %18
  store bfloat %16, ptr addrspace(1) %19, align 2
  ret void
}

define ptx_kernel void @triton_softmax_5_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #6 {
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 7
  %4 = and i64 %3, 896
  %5 = shl nsw i64 %2, 9
  %6 = and i64 %5, -4096
  %7 = or disjoint i64 %6, %4
  %8 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %7
  %9 = tail call range(i32 0, 32) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = shl nuw nsw i32 %9, 2
  %11 = and i32 %10, 60
  %12 = icmp samesign ult i32 %9, 16
  %13 = select i1 %12, i32 0, i32 64
  %14 = or disjoint i32 %11, %13
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr bfloat, ptr addrspace(1) %8, i64 %15
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 4096
  %18 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %17) #10
  %19 = extractvalue { i32, i32 } %18, 0
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32 } %18, 1
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractelement <2 x bfloat> %20, i64 0
  %24 = extractelement <2 x bfloat> %20, i64 1
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #10
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %31 = fmul float %27, %27
  %32 = fmul float %28, %28
  %33 = fmul float %29, %29
  %34 = fmul float %30, %30
  %35 = fadd float %31, %32
  %36 = fadd float %35, %33
  %37 = fadd float %36, %34
  %38 = bitcast float %37 to i32
  %39 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %38, i32 16, i32 31)
  %40 = bitcast i32 %39 to float
  %41 = fadd float %37, %40
  %42 = bitcast float %41 to i32
  %43 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %42, i32 8, i32 31)
  %44 = bitcast i32 %43 to float
  %45 = fadd float %41, %44
  %46 = bitcast float %45 to i32
  %47 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %46, i32 4, i32 31)
  %48 = bitcast i32 %47 to float
  %49 = fadd float %45, %48
  %50 = bitcast float %49 to i32
  %51 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = bitcast i32 %51 to float
  %53 = fadd float %49, %52
  %54 = bitcast float %53 to i32
  %55 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %54, i32 1, i32 31)
  %56 = bitcast i32 %55 to float
  %57 = fadd float %53, %56
  %58 = fmul float %57, 7.812500e-03
  %59 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %60 = bitcast i32 %59 to float
  %61 = fadd float %58, %60
  %62 = tail call float @llvm.nvvm.rsqrt.approx.f(float %61)
  %63 = fmul float %27, %62
  %64 = fmul float %28, %62
  %65 = fmul float %29, %62
  %66 = fmul float %30, %62
  %67 = getelementptr i8, ptr addrspace(1) %arg25, i64 %5
  %68 = getelementptr float, ptr addrspace(1) %67, i64 %15
  %69 = bitcast float %63 to i32
  %70 = bitcast float %64 to i32
  %71 = bitcast float %65 to i32
  %72 = bitcast float %66 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %69, i32 %70, i32 %71, i32 %72, ptr addrspace(1) %68) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(65536) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(64) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %4) local_unnamed_addr #7 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %13 = lshr i32 %12, 2
  %14 = and i32 %11, 63
  %15 = shl nuw nsw i32 %11, 1
  %16 = and i32 %15, 128
  %17 = shl nuw nsw i32 %12, 8
  %18 = or disjoint i32 %16, %17
  %19 = or disjoint i32 %18, %14
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr float, ptr addrspace(1) %10, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !5
  %23 = zext nneg i32 %14 to i64
  %24 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %23
  %25 = load bfloat, ptr addrspace(1) %24, align 2, !invariant.load !5
  %26 = fpext bfloat %25 to float
  %27 = fmul float %22, %26
  tail call void @llvm.experimental.noalias.scope.decl(metadata !14)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !5, !alias.scope !17, !noalias !14
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !5, !alias.scope !14, !noalias !17
  %38 = fpext bfloat %37 to float
  %39 = fmul float %27, %38
  %40 = or i32 %11, 64
  %41 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 256
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !5
  %43 = zext nneg i32 %40 to i64
  %44 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %43
  %45 = load bfloat, ptr addrspace(1) %44, align 2, !invariant.load !5
  %46 = fpext bfloat %45 to float
  %47 = fmul float %42, %46
  %48 = or disjoint i32 %33, %40
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %49
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !5, !alias.scope !19, !noalias !22
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
  %7 = shl nuw nsw i32 %5, 2
  %8 = shl nuw nsw i32 %6, 9
  %9 = or disjoint i32 %7, %8
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %10
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 138706944
  %13 = load <4 x bfloat>, ptr addrspace(1) %12, align 8, !invariant.load !5
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
  %12 = load <4 x bfloat>, ptr addrspace(1) %11, align 8, !invariant.load !5
  %13 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %10
  store <4 x bfloat> %12, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.rsqrt.approx.f(float) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #8

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { "nvvm.reqntid"="128,1,1" }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { "nvvm.reqntid"="64,1,1" }
attributes #6 = { "nvvm.reqntid"="32,1,1" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 0, i32 128}
!5 = !{}
!6 = !{i32 0, i32 384}
!7 = !{!8}
!8 = distinct !{!8, !9, !"fused_convert_2_param_0_139: argument 0"}
!9 = distinct !{!9, !"fused_convert_2_param_0_139"}
!10 = !{!11}
!11 = distinct !{!11, !12, !"fused_convert_2_param_0_139: argument 0"}
!12 = distinct !{!12, !"fused_convert_2_param_0_139"}
!13 = !{i32 0, i32 64}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_concatenate_convert_255_17: argument 0"}
!16 = distinct !{!16, !"fused_concatenate_convert_255_17"}
!17 = !{!18}
!18 = distinct !{!18, !16, !"fused_concatenate_convert_255_17: argument 1"}
!19 = !{!20}
!20 = distinct !{!20, !21, !"fused_concatenate_convert_255_17: argument 0"}
!21 = distinct !{!21, !"fused_concatenate_convert_255_17"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"fused_concatenate_convert_255_17: argument 1"}
!24 = !{i32 0, i32 135456}

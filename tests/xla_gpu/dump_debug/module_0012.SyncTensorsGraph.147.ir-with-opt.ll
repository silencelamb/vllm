; ModuleID = 'SyncTensorsGraph.147'
source_filename = "SyncTensorsGraph.147"
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

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @fusion_9(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) local_unnamed_addr #4 {
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 8
  %4 = and i64 %3, 768
  %5 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 2
  %10 = and i32 %9, 124
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 128
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %16 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %15) #9
  %17 = extractvalue { i32, i32 } %16, 0
  %18 = bitcast i32 %17 to <2 x bfloat>
  %19 = extractvalue { i32, i32 } %16, 1
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractelement <2 x bfloat> %18, i64 0
  %22 = extractelement <2 x bfloat> %18, i64 1
  %23 = extractelement <2 x bfloat> %20, i64 0
  %24 = extractelement <2 x bfloat> %20, i64 1
  %25 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %21) #9
  %26 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %22) #9
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #9
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #9
  %29 = and i64 %3, -1024
  %30 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %29
  %31 = shl nuw nsw i32 %6, 3
  %32 = and i32 %31, 248
  %33 = select i1 %11, i32 0, i32 256
  %34 = or disjoint i32 %32, %33
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr bfloat, ptr addrspace(1) %30, i64 %35
  %37 = getelementptr i8, ptr addrspace(1) %36, i64 1024
  %38 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %36) #9
  %39 = extractvalue { i32, i32, i32, i32 } %38, 0
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractvalue { i32, i32, i32, i32 } %38, 1
  %42 = bitcast i32 %41 to <2 x bfloat>
  %43 = extractvalue { i32, i32, i32, i32 } %38, 2
  %44 = bitcast i32 %43 to <2 x bfloat>
  %45 = extractvalue { i32, i32, i32, i32 } %38, 3
  %46 = bitcast i32 %45 to <2 x bfloat>
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = extractelement <2 x bfloat> %42, i64 0
  %50 = extractelement <2 x bfloat> %42, i64 1
  %51 = extractelement <2 x bfloat> %44, i64 0
  %52 = extractelement <2 x bfloat> %44, i64 1
  %53 = extractelement <2 x bfloat> %46, i64 0
  %54 = extractelement <2 x bfloat> %46, i64 1
  %55 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %37) #9
  %56 = extractvalue { i32, i32, i32, i32 } %55, 0
  %57 = bitcast i32 %56 to <2 x bfloat>
  %58 = extractvalue { i32, i32, i32, i32 } %55, 1
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractvalue { i32, i32, i32, i32 } %55, 2
  %61 = bitcast i32 %60 to <2 x bfloat>
  %62 = extractvalue { i32, i32, i32, i32 } %55, 3
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractelement <2 x bfloat> %57, i64 0
  %65 = extractelement <2 x bfloat> %57, i64 1
  %66 = extractelement <2 x bfloat> %59, i64 0
  %67 = extractelement <2 x bfloat> %59, i64 1
  %68 = extractelement <2 x bfloat> %61, i64 0
  %69 = extractelement <2 x bfloat> %61, i64 1
  %70 = extractelement <2 x bfloat> %63, i64 0
  %71 = extractelement <2 x bfloat> %63, i64 1
  %72 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %76 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %77 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #9
  %78 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53) #9
  %79 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54) #9
  %80 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64) #9
  %81 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65) #9
  %82 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66) #9
  %83 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67) #9
  %84 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68) #9
  %85 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #9
  %86 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #9
  %87 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #9
  %88 = fmul float %72, %72
  %89 = fmul float %73, %73
  %90 = fmul float %74, %74
  %91 = fmul float %75, %75
  %92 = fmul float %76, %76
  %93 = fmul float %77, %77
  %94 = fmul float %78, %78
  %95 = fmul float %79, %79
  %96 = fmul float %80, %80
  %97 = fmul float %81, %81
  %98 = fmul float %82, %82
  %99 = fmul float %83, %83
  %100 = fmul float %84, %84
  %101 = fmul float %85, %85
  %102 = fmul float %86, %86
  %103 = fmul float %87, %87
  %104 = fadd float %88, %89
  %105 = fadd float %104, %90
  %106 = fadd float %105, %91
  %107 = fadd float %106, %92
  %108 = fadd float %107, %93
  %109 = fadd float %108, %94
  %110 = fadd float %109, %95
  %111 = fadd float %110, %96
  %112 = fadd float %111, %97
  %113 = fadd float %112, %98
  %114 = fadd float %113, %99
  %115 = fadd float %114, %100
  %116 = fadd float %115, %101
  %117 = fadd float %116, %102
  %118 = fadd float %117, %103
  %119 = bitcast float %118 to i32
  %120 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %119, i32 16, i32 31)
  %121 = bitcast i32 %120 to float
  %122 = fadd float %118, %121
  %123 = bitcast float %122 to i32
  %124 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %123, i32 8, i32 31)
  %125 = bitcast i32 %124 to float
  %126 = fadd float %122, %125
  %127 = bitcast float %126 to i32
  %128 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %127, i32 4, i32 31)
  %129 = bitcast i32 %128 to float
  %130 = fadd float %126, %129
  %131 = bitcast float %130 to i32
  %132 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %131, i32 2, i32 31)
  %133 = bitcast i32 %132 to float
  %134 = fadd float %130, %133
  %135 = bitcast float %134 to i32
  %136 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %135, i32 1, i32 31)
  %137 = bitcast i32 %136 to float
  %138 = fadd float %134, %137
  %139 = icmp eq i32 %7, 0
  %140 = zext nneg i32 %8 to i64
  %141 = getelementptr float, ptr addrspace(3) @global_smem, i64 %140
  %142 = bitcast float %138 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %141, <1 x i32> %142, i1 %139) #9
  tail call void @llvm.nvvm.barrier0()
  %143 = icmp samesign ult i32 %6, 2
  %144 = zext nneg i32 %6 to i64
  %145 = getelementptr float, ptr addrspace(3) @global_smem, i64 %144
  %146 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %145, i1 %143) #9
  %147 = bitcast i32 %146 to float
  %148 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %146, i32 1, i32 31)
  %149 = bitcast i32 %148 to float
  %150 = fadd float %147, %149
  %151 = icmp eq i32 %6, 0
  %152 = bitcast float %150 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %145, <1 x i32> %152, i1 %151) #9
  tail call void @llvm.nvvm.barrier0()
  %153 = load float, ptr addrspace(3) @global_smem, align 16
  %154 = fmul float %153, 0x3F50000000000000
  %155 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %156 = bitcast i32 %155 to float
  %157 = fadd float %154, %156
  %158 = tail call float @llvm.nvvm.rsqrt.approx.f(float %157)
  %159 = fmul float %25, %158
  %160 = fmul float %26, %158
  %161 = fmul float %27, %158
  %162 = fmul float %28, %158
  %163 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %164 = getelementptr bfloat, ptr addrspace(1) %163, i64 %14
  %165 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %164) #9
  %166 = extractvalue { i32, i32 } %165, 0
  %167 = bitcast i32 %166 to <2 x bfloat>
  %168 = extractvalue { i32, i32 } %165, 1
  %169 = bitcast i32 %168 to <2 x bfloat>
  %170 = extractelement <2 x bfloat> %167, i64 0
  %171 = extractelement <2 x bfloat> %167, i64 1
  %172 = extractelement <2 x bfloat> %169, i64 0
  %173 = extractelement <2 x bfloat> %169, i64 1
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171) #9
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172) #9
  %177 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173) #9
  %178 = fmul float %159, %174
  %179 = fmul float %160, %175
  %180 = fmul float %161, %176
  %181 = fmul float %162, %177
  %182 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %178) #9
  %183 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %179) #9
  %184 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %180) #9
  %185 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %181) #9
  %186 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %187 = getelementptr bfloat, ptr addrspace(1) %186, i64 %14
  %188 = insertelement <2 x bfloat> poison, bfloat %182, i64 0
  %189 = insertelement <2 x bfloat> %188, bfloat %183, i64 1
  %190 = bitcast <2 x bfloat> %189 to i32
  %191 = insertelement <2 x bfloat> poison, bfloat %184, i64 0
  %192 = insertelement <2 x bfloat> %191, bfloat %185, i64 1
  %193 = bitcast <2 x bfloat> %192 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %190, i32 %193, ptr addrspace(1) %187) #9
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

define ptx_kernel void @triton_softmax_2_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #5 {
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
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
  %18 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %17) #9
  %19 = extractvalue { i32, i32 } %18, 0
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32 } %18, 1
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractelement <2 x bfloat> %20, i64 0
  %24 = extractelement <2 x bfloat> %20, i64 1
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #9
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #9
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #9
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
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
  %59 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %69, i32 %70, i32 %71, i32 %72, ptr addrspace(1) %68) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(65536) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(64) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %4) local_unnamed_addr #6 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !7)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !10)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !5, !alias.scope !10, !noalias !7
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !5, !alias.scope !7, !noalias !10
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
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !5, !alias.scope !12, !noalias !15
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
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
declare float @llvm.nvvm.rsqrt.approx.f(float) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { "nvvm.reqntid"="64,1,1" }
attributes #5 = { "nvvm.reqntid"="32,1,1" }
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
!5 = !{}
!6 = !{i32 0, i32 64}
!7 = !{!8}
!8 = distinct !{!8, !9, !"fused_concatenate_convert_80_17: argument 0"}
!9 = distinct !{!9, !"fused_concatenate_convert_80_17"}
!10 = !{!11}
!11 = distinct !{!11, !9, !"fused_concatenate_convert_80_17: argument 1"}
!12 = !{!13}
!13 = distinct !{!13, !14, !"fused_concatenate_convert_80_17: argument 0"}
!14 = distinct !{!14, !"fused_concatenate_convert_80_17"}
!15 = !{!16}
!16 = distinct !{!16, !14, !"fused_concatenate_convert_80_17: argument 1"}
!17 = !{i32 0, i32 135456}

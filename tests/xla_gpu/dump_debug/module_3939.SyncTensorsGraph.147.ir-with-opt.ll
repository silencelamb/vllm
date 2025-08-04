; ModuleID = 'SyncTensorsGraph.147'
source_filename = "SyncTensorsGraph.147"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(512) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(262144) %2) local_unnamed_addr #0 {
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

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @fusion_9(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3) local_unnamed_addr #4 {
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #8
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
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #8
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
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #8
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
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #8
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #8
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #8
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #8
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #8
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #8
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #8
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #8
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #8
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #8
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #8
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #8
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #8
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #8
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #8
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #8
  %66 = fmul float %50, %50
  %67 = fmul float %51, %51
  %68 = fmul float %52, %52
  %69 = fmul float %53, %53
  %70 = fmul float %54, %54
  %71 = fmul float %55, %55
  %72 = fmul float %56, %56
  %73 = fmul float %57, %57
  %74 = fmul float %58, %58
  %75 = fmul float %59, %59
  %76 = fmul float %60, %60
  %77 = fmul float %61, %61
  %78 = fmul float %62, %62
  %79 = fmul float %63, %63
  %80 = fmul float %64, %64
  %81 = fmul float %65, %65
  %82 = fadd float %66, %67
  %83 = fadd float %82, %68
  %84 = fadd float %83, %69
  %85 = fadd float %84, %70
  %86 = fadd float %85, %71
  %87 = fadd float %86, %72
  %88 = fadd float %87, %73
  %89 = fadd float %88, %74
  %90 = fadd float %89, %75
  %91 = fadd float %90, %76
  %92 = fadd float %91, %77
  %93 = fadd float %92, %78
  %94 = fadd float %93, %79
  %95 = fadd float %94, %80
  %96 = fadd float %95, %81
  %97 = bitcast float %96 to i32
  %98 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %97, i32 16, i32 31)
  %99 = bitcast i32 %98 to float
  %100 = fadd float %96, %99
  %101 = bitcast float %100 to i32
  %102 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %101, i32 8, i32 31)
  %103 = bitcast i32 %102 to float
  %104 = fadd float %100, %103
  %105 = bitcast float %104 to i32
  %106 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %105, i32 4, i32 31)
  %107 = bitcast i32 %106 to float
  %108 = fadd float %104, %107
  %109 = bitcast float %108 to i32
  %110 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %109, i32 2, i32 31)
  %111 = bitcast i32 %110 to float
  %112 = fadd float %108, %111
  %113 = bitcast float %112 to i32
  %114 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %113, i32 1, i32 31)
  %115 = bitcast i32 %114 to float
  %116 = fadd float %112, %115
  %117 = icmp eq i32 %6, 0
  %118 = zext nneg i32 %7 to i64
  %119 = getelementptr float, ptr addrspace(3) @global_smem, i64 %118
  %120 = bitcast float %116 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %119, <1 x i32> %120, i1 %117) #8
  tail call void @llvm.nvvm.barrier0()
  %121 = icmp samesign ult i32 %5, 2
  %122 = zext nneg i32 %5 to i64
  %123 = getelementptr float, ptr addrspace(3) @global_smem, i64 %122
  %124 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %123, i1 %121) #8
  %125 = bitcast i32 %124 to float
  %126 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %124, i32 1, i32 31)
  %127 = bitcast i32 %126 to float
  %128 = fadd float %125, %127
  %129 = icmp eq i32 %5, 0
  %130 = bitcast float %128 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %123, <1 x i32> %130, i1 %129) #8
  tail call void @llvm.nvvm.barrier0()
  %131 = load float, ptr addrspace(3) @global_smem, align 16
  %132 = fmul float %131, 0x3F50000000000000
  %133 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #8
  %134 = bitcast i32 %133 to float
  %135 = fadd float %132, %134
  %136 = tail call float @llvm.nvvm.rsqrt.approx.f(float %135)
  %137 = fmul float %50, %136
  %138 = fmul float %51, %136
  %139 = fmul float %52, %136
  %140 = fmul float %53, %136
  %141 = fmul float %54, %136
  %142 = fmul float %55, %136
  %143 = fmul float %56, %136
  %144 = fmul float %57, %136
  %145 = fmul float %58, %136
  %146 = fmul float %59, %136
  %147 = fmul float %60, %136
  %148 = fmul float %61, %136
  %149 = fmul float %62, %136
  %150 = fmul float %63, %136
  %151 = fmul float %64, %136
  %152 = fmul float %65, %136
  %153 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %154 = getelementptr i8, ptr addrspace(1) %153, i64 1024
  %155 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153) #8
  %156 = extractvalue { i32, i32, i32, i32 } %155, 0
  %157 = bitcast i32 %156 to <2 x bfloat>
  %158 = extractvalue { i32, i32, i32, i32 } %155, 1
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %155, 2
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %155, 3
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractelement <2 x bfloat> %157, i64 0
  %165 = extractelement <2 x bfloat> %157, i64 1
  %166 = extractelement <2 x bfloat> %159, i64 0
  %167 = extractelement <2 x bfloat> %159, i64 1
  %168 = extractelement <2 x bfloat> %161, i64 0
  %169 = extractelement <2 x bfloat> %161, i64 1
  %170 = extractelement <2 x bfloat> %163, i64 0
  %171 = extractelement <2 x bfloat> %163, i64 1
  %172 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %154) #8
  %173 = extractvalue { i32, i32, i32, i32 } %172, 0
  %174 = bitcast i32 %173 to <2 x bfloat>
  %175 = extractvalue { i32, i32, i32, i32 } %172, 1
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %172, 2
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %172, 3
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractelement <2 x bfloat> %174, i64 0
  %182 = extractelement <2 x bfloat> %174, i64 1
  %183 = extractelement <2 x bfloat> %176, i64 0
  %184 = extractelement <2 x bfloat> %176, i64 1
  %185 = extractelement <2 x bfloat> %178, i64 0
  %186 = extractelement <2 x bfloat> %178, i64 1
  %187 = extractelement <2 x bfloat> %180, i64 0
  %188 = extractelement <2 x bfloat> %180, i64 1
  %189 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164) #8
  %190 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165) #8
  %191 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166) #8
  %192 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167) #8
  %193 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168) #8
  %194 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169) #8
  %195 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170) #8
  %196 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171) #8
  %197 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181) #8
  %198 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182) #8
  %199 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183) #8
  %200 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184) #8
  %201 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #8
  %202 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #8
  %203 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #8
  %204 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #8
  %205 = fmul float %137, %189
  %206 = fmul float %138, %190
  %207 = fmul float %139, %191
  %208 = fmul float %140, %192
  %209 = fmul float %141, %193
  %210 = fmul float %142, %194
  %211 = fmul float %143, %195
  %212 = fmul float %144, %196
  %213 = fmul float %145, %197
  %214 = fmul float %146, %198
  %215 = fmul float %147, %199
  %216 = fmul float %148, %200
  %217 = fmul float %149, %201
  %218 = fmul float %150, %202
  %219 = fmul float %151, %203
  %220 = fmul float %152, %204
  %221 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %205) #8
  %222 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %206) #8
  %223 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %207) #8
  %224 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %208) #8
  %225 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %209) #8
  %226 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %210) #8
  %227 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %211) #8
  %228 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %212) #8
  %229 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %213) #8
  %230 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %214) #8
  %231 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %215) #8
  %232 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %216) #8
  %233 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %217) #8
  %234 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %218) #8
  %235 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %219) #8
  %236 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %220) #8
  %237 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %238 = getelementptr bfloat, ptr addrspace(1) %237, i64 %13
  %239 = getelementptr i8, ptr addrspace(1) %238, i64 1024
  %240 = insertelement <2 x bfloat> poison, bfloat %221, i64 0
  %241 = insertelement <2 x bfloat> %240, bfloat %222, i64 1
  %242 = bitcast <2 x bfloat> %241 to i32
  %243 = insertelement <2 x bfloat> poison, bfloat %223, i64 0
  %244 = insertelement <2 x bfloat> %243, bfloat %224, i64 1
  %245 = bitcast <2 x bfloat> %244 to i32
  %246 = insertelement <2 x bfloat> poison, bfloat %225, i64 0
  %247 = insertelement <2 x bfloat> %246, bfloat %226, i64 1
  %248 = bitcast <2 x bfloat> %247 to i32
  %249 = insertelement <2 x bfloat> poison, bfloat %227, i64 0
  %250 = insertelement <2 x bfloat> %249, bfloat %228, i64 1
  %251 = bitcast <2 x bfloat> %250 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %242, i32 %245, i32 %248, i32 %251, ptr addrspace(1) %238) #8
  %252 = insertelement <2 x bfloat> poison, bfloat %229, i64 0
  %253 = insertelement <2 x bfloat> %252, bfloat %230, i64 1
  %254 = bitcast <2 x bfloat> %253 to i32
  %255 = insertelement <2 x bfloat> poison, bfloat %231, i64 0
  %256 = insertelement <2 x bfloat> %255, bfloat %232, i64 1
  %257 = bitcast <2 x bfloat> %256 to i32
  %258 = insertelement <2 x bfloat> poison, bfloat %233, i64 0
  %259 = insertelement <2 x bfloat> %258, bfloat %234, i64 1
  %260 = bitcast <2 x bfloat> %259 to i32
  %261 = insertelement <2 x bfloat> poison, bfloat %235, i64 0
  %262 = insertelement <2 x bfloat> %261, bfloat %236, i64 1
  %263 = bitcast <2 x bfloat> %262 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %254, i32 %257, i32 %260, i32 %263, ptr addrspace(1) %239) #8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(1048576) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(262144) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 520192
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

define ptx_kernel void @triton_softmax_2_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(1048576) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2) local_unnamed_addr #4 {
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #8
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
  %17 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #8
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
  %34 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #8
  %35 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #8
  %36 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #8
  %37 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #8
  %38 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #8
  %39 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #8
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #8
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #8
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
  %74 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg015) #8
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
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %102, i32 %103, i32 %104, i32 %105, i32 %106, i1 true) #8
  %111 = getelementptr inbounds nuw i8, ptr addrspace(3) %102, i64 16
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) nonnull %111, i32 %107, i32 %108, i32 %109, i32 %110, i1 true) #8
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract21, i32 %.extract822, i32 %.extract923, i32 %.extract1024, ptr addrspace(1) %94) #8
  %.extract11 = extractelement <4 x i32> %124, i64 0
  %.extract12 = extractelement <4 x i32> %124, i64 1
  %.extract13 = extractelement <4 x i32> %124, i64 2
  %.extract14 = extractelement <4 x i32> %124, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract11, i32 %.extract12, i32 %.extract13, i32 %.extract14, ptr addrspace(1) %95) #8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(524288) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(512) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(262144) %4) local_unnamed_addr #5 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !8)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !11)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !6, !alias.scope !11, !noalias !8
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !6, !alias.scope !8, !noalias !11
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
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !6, !alias.scope !13, !noalias !16
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
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
declare float @llvm.nvvm.rsqrt.approx.f(float) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { "nvvm.reqntid"="64,1,1" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #6 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #7 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 0, i32 128}
!5 = !{i32 0, i32 1024}
!6 = !{}
!7 = !{i32 0, i32 512}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_concatenate_convert_80_7: argument 0"}
!10 = distinct !{!10, !"fused_concatenate_convert_80_7"}
!11 = !{!12}
!12 = distinct !{!12, !10, !"fused_concatenate_convert_80_7: argument 1"}
!13 = !{!14}
!14 = distinct !{!14, !15, !"fused_concatenate_convert_80_7: argument 0"}
!15 = distinct !{!15, !"fused_concatenate_convert_80_7"}
!16 = !{!17}
!17 = distinct !{!17, !15, !"fused_concatenate_convert_80_7: argument 1"}
!18 = !{i32 0, i32 135456}

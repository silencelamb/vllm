; ModuleID = 'SyncTensorsGraph.147'
source_filename = "SyncTensorsGraph.147"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(64) %1, ptr noalias align 128 dereferenceable(32768) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %6 = udiv i32 %5, 8
  %7 = getelementptr inbounds i32, ptr %1, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !2
  %9 = call i32 @llvm.umin.i32(i32 %8, i32 151935)
  %10 = urem i32 %5, 8
  %11 = mul i32 %10, 128
  %12 = mul i32 %9, 1024
  %13 = add i32 %11, %12
  %14 = add i32 %13, %4
  %15 = getelementptr inbounds bfloat, ptr %0, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !2
  %17 = mul i32 %5, 128
  %18 = add i32 %17, %4
  %19 = getelementptr inbounds bfloat, ptr %2, i32 %18
  store bfloat %16, ptr %19, align 2
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #1

declare ptx_kernel void @fusion_9_impl(ptr, ptr, ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_9(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) #5 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = udiv i64 %7, 4
  %9 = urem i64 %7, 4
  %10 = mul i64 %9, 256
  %11 = mul i64 %7, 256
  %12 = getelementptr bfloat, ptr addrspace(1) %2, i64 %11
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = urem i32 %13, 32
  %15 = udiv i32 %13, 32
  %16 = and i32 %14, 1
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 0, i32 4
  %19 = xor i32 0, %18
  %20 = and i32 %14, 2
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 8
  %23 = xor i32 %19, %22
  %24 = and i32 %14, 4
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 16
  %27 = xor i32 %23, %26
  %28 = and i32 %14, 8
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 32
  %31 = xor i32 %27, %30
  %32 = and i32 %14, 16
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 64
  %35 = xor i32 %31, %34
  %36 = and i32 %15, 1
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 0, i32 128
  %39 = xor i32 %35, %38
  %40 = xor i32 %39, 0
  %41 = add i32 %40, 0
  %42 = sext i32 %41 to i64
  %43 = getelementptr bfloat, ptr addrspace(1) %12, i64 %42
  %44 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %43)
  %45 = extractvalue { i32, i32 } %44, 0
  %46 = bitcast i32 %45 to <2 x bfloat>
  %47 = extractvalue { i32, i32 } %44, 1
  %48 = bitcast i32 %47 to <2 x bfloat>
  %49 = extractelement <2 x bfloat> %46, i32 0
  %50 = extractelement <2 x bfloat> %46, i32 1
  %51 = extractelement <2 x bfloat> %48, i32 0
  %52 = extractelement <2 x bfloat> %48, i32 1
  %53 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49)
  %54 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50)
  %55 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51)
  %56 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52)
  %57 = mul i64 %8, 1024
  %58 = getelementptr bfloat, ptr addrspace(1) %2, i64 %57
  %59 = select i1 %17, i32 0, i32 8
  %60 = xor i32 0, %59
  %61 = select i1 %21, i32 0, i32 16
  %62 = xor i32 %60, %61
  %63 = select i1 %25, i32 0, i32 32
  %64 = xor i32 %62, %63
  %65 = select i1 %29, i32 0, i32 64
  %66 = xor i32 %64, %65
  %67 = select i1 %33, i32 0, i32 128
  %68 = xor i32 %66, %67
  %69 = select i1 %37, i32 0, i32 256
  %70 = xor i32 %68, %69
  %71 = xor i32 %70, 0
  %72 = xor i32 %70, 512
  %73 = add i32 %71, 0
  %74 = add i32 %72, 0
  %75 = sext i32 %73 to i64
  %76 = sext i32 %74 to i64
  %77 = getelementptr bfloat, ptr addrspace(1) %58, i64 %75
  %78 = getelementptr bfloat, ptr addrspace(1) %58, i64 %76
  %79 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %77)
  %80 = extractvalue { i32, i32, i32, i32 } %79, 0
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractvalue { i32, i32, i32, i32 } %79, 1
  %83 = bitcast i32 %82 to <2 x bfloat>
  %84 = extractvalue { i32, i32, i32, i32 } %79, 2
  %85 = bitcast i32 %84 to <2 x bfloat>
  %86 = extractvalue { i32, i32, i32, i32 } %79, 3
  %87 = bitcast i32 %86 to <2 x bfloat>
  %88 = extractelement <2 x bfloat> %81, i32 0
  %89 = extractelement <2 x bfloat> %81, i32 1
  %90 = extractelement <2 x bfloat> %83, i32 0
  %91 = extractelement <2 x bfloat> %83, i32 1
  %92 = extractelement <2 x bfloat> %85, i32 0
  %93 = extractelement <2 x bfloat> %85, i32 1
  %94 = extractelement <2 x bfloat> %87, i32 0
  %95 = extractelement <2 x bfloat> %87, i32 1
  %96 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %78)
  %97 = extractvalue { i32, i32, i32, i32 } %96, 0
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractvalue { i32, i32, i32, i32 } %96, 1
  %100 = bitcast i32 %99 to <2 x bfloat>
  %101 = extractvalue { i32, i32, i32, i32 } %96, 2
  %102 = bitcast i32 %101 to <2 x bfloat>
  %103 = extractvalue { i32, i32, i32, i32 } %96, 3
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractelement <2 x bfloat> %98, i32 0
  %106 = extractelement <2 x bfloat> %98, i32 1
  %107 = extractelement <2 x bfloat> %100, i32 0
  %108 = extractelement <2 x bfloat> %100, i32 1
  %109 = extractelement <2 x bfloat> %102, i32 0
  %110 = extractelement <2 x bfloat> %102, i32 1
  %111 = extractelement <2 x bfloat> %104, i32 0
  %112 = extractelement <2 x bfloat> %104, i32 1
  %113 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %114 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89)
  %115 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90)
  %116 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %91)
  %117 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %92)
  %118 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %93)
  %119 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %94)
  %120 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95)
  %121 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105)
  %122 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106)
  %123 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %107)
  %124 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108)
  %125 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109)
  %126 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110)
  %127 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %128 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %129 = fmul float %113, %113
  %130 = fmul float %114, %114
  %131 = fmul float %115, %115
  %132 = fmul float %116, %116
  %133 = fmul float %117, %117
  %134 = fmul float %118, %118
  %135 = fmul float %119, %119
  %136 = fmul float %120, %120
  %137 = fmul float %121, %121
  %138 = fmul float %122, %122
  %139 = fmul float %123, %123
  %140 = fmul float %124, %124
  %141 = fmul float %125, %125
  %142 = fmul float %126, %126
  %143 = fmul float %127, %127
  %144 = fmul float %128, %128
  %145 = fadd float %129, %130
  %146 = fadd float %145, %131
  %147 = fadd float %146, %132
  %148 = fadd float %147, %133
  %149 = fadd float %148, %134
  %150 = fadd float %149, %135
  %151 = fadd float %150, %136
  %152 = fadd float %151, %137
  %153 = fadd float %152, %138
  %154 = fadd float %153, %139
  %155 = fadd float %154, %140
  %156 = fadd float %155, %141
  %157 = fadd float %156, %142
  %158 = fadd float %157, %143
  %159 = fadd float %158, %144
  %160 = bitcast float %159 to i32
  %161 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %160, i32 16, i32 31)
  %162 = bitcast i32 %161 to float
  %163 = fadd float %159, %162
  %164 = bitcast float %163 to i32
  %165 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %164, i32 8, i32 31)
  %166 = bitcast i32 %165 to float
  %167 = fadd float %163, %166
  %168 = bitcast float %167 to i32
  %169 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %168, i32 4, i32 31)
  %170 = bitcast i32 %169 to float
  %171 = fadd float %167, %170
  %172 = bitcast float %171 to i32
  %173 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %172, i32 2, i32 31)
  %174 = bitcast i32 %173 to float
  %175 = fadd float %171, %174
  %176 = bitcast float %175 to i32
  %177 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %176, i32 1, i32 31)
  %178 = bitcast i32 %177 to float
  %179 = fadd float %175, %178
  %180 = urem i32 %14, 32
  %181 = urem i32 %15, 2
  %182 = icmp eq i32 %180, 0
  %183 = and i1 true, %182
  %184 = add i32 0, %181
  %185 = getelementptr float, ptr addrspace(3) @global_smem, i32 %184
  %186 = insertelement <1 x float> undef, float %179, i32 0
  %187 = extractelement <1 x float> %186, i32 0
  %188 = bitcast float %187 to i32
  %189 = insertelement <1 x i32> undef, i32 %188, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %185, <1 x i32> %189, i1 %183)
  call void @llvm.nvvm.barrier0()
  %190 = icmp slt i32 %13, 2
  %191 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %192 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %191, i1 %190)
  %193 = insertelement <1 x i32> undef, i32 %192, i32 0
  %194 = extractelement <1 x i32> %193, i32 0
  %195 = bitcast i32 %194 to float
  %196 = insertelement <1 x float> undef, float %195, i32 0
  %197 = extractelement <1 x float> %196, i32 0
  %198 = bitcast float %197 to i32
  %199 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %198, i32 1, i32 31)
  %200 = bitcast i32 %199 to float
  %201 = fadd float %197, %200
  %202 = urem i32 %14, 2
  %203 = icmp eq i32 %202, 0
  %204 = and i1 %190, %203
  %205 = insertelement <1 x float> undef, float %201, i32 0
  %206 = extractelement <1 x float> %205, i32 0
  %207 = bitcast float %206 to i32
  %208 = insertelement <1 x i32> undef, i32 %207, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %191, <1 x i32> %208, i1 %204)
  call void @llvm.nvvm.barrier0()
  %209 = load float, ptr addrspace(3) @global_smem, align 4
  %210 = fmul float %209, 0x3F50000000000000
  %211 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %212 = bitcast i32 %211 to <1 x float>
  %213 = extractelement <1 x float> %212, i32 0
  %214 = fadd float %210, %213
  %215 = call float @__nv_rsqrtf(float %214)
  %216 = fmul float %53, %215
  %217 = fmul float %54, %215
  %218 = fmul float %55, %215
  %219 = fmul float %56, %215
  %220 = getelementptr bfloat, ptr addrspace(1) %3, i64 %10
  %221 = getelementptr bfloat, ptr addrspace(1) %220, i64 %42
  %222 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %221)
  %223 = extractvalue { i32, i32 } %222, 0
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractvalue { i32, i32 } %222, 1
  %226 = bitcast i32 %225 to <2 x bfloat>
  %227 = extractelement <2 x bfloat> %224, i32 0
  %228 = extractelement <2 x bfloat> %224, i32 1
  %229 = extractelement <2 x bfloat> %226, i32 0
  %230 = extractelement <2 x bfloat> %226, i32 1
  %231 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %232 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %233 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %234 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %235 = fmul float %216, %231
  %236 = fmul float %217, %232
  %237 = fmul float %218, %233
  %238 = fmul float %219, %234
  %239 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %235)
  %240 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %236)
  %241 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %237)
  %242 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %238)
  %243 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
  %244 = getelementptr bfloat, ptr addrspace(1) %243, i64 %42
  %245 = insertelement <2 x bfloat> undef, bfloat %239, i32 0
  %246 = insertelement <2 x bfloat> %245, bfloat %240, i32 1
  %247 = bitcast <2 x bfloat> %246 to i32
  %248 = insertelement <2 x bfloat> undef, bfloat %241, i32 0
  %249 = insertelement <2 x bfloat> %248, bfloat %242, i32 1
  %250 = bitcast <2 x bfloat> %249 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %247, i32 %250, ptr addrspace(1) %244)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(131072) %0, ptr noalias align 128 dereferenceable(32768) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %5 = urem i32 %4, 8
  %6 = mul i32 %5, 128
  %7 = udiv i32 %4, 8
  %8 = mul i32 %7, 4096
  %9 = add i32 %6, %8
  %10 = add i32 %9, %3
  %11 = add i32 %10, 3072
  %12 = getelementptr inbounds bfloat, ptr %0, i32 %11
  %13 = load bfloat, ptr %12, align 2, !invariant.load !2
  %14 = mul i32 %4, 128
  %15 = add i32 %14, %3
  %16 = getelementptr inbounds bfloat, ptr %1, i32 %15
  store bfloat %13, ptr %16, align 2
  ret void
}

declare ptx_kernel void @triton_softmax_2_0_impl(ptr, ptr, ptr, ptr) #6

define ptx_kernel void @triton_softmax_2_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #7 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr null to ptr addrspace(1)
  %5 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %6 = sext i32 %5 to i64
  %7 = urem i64 %6, 8
  %8 = mul i64 %7, 128
  %9 = udiv i64 %6, 8
  %10 = mul i64 %9, 4096
  %11 = add i64 %8, %10
  %12 = add i64 %11, 2048
  %13 = getelementptr bfloat, ptr addrspace(1) %2, i64 %12
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %15 = urem i32 %14, 32
  %16 = and i32 %15, 1
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 0, i32 4
  %19 = xor i32 0, %18
  %20 = and i32 %15, 2
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 8
  %23 = xor i32 %19, %22
  %24 = and i32 %15, 4
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 16
  %27 = xor i32 %23, %26
  %28 = and i32 %15, 8
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 32
  %31 = xor i32 %27, %30
  %32 = and i32 %15, 16
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 64
  %35 = xor i32 %31, %34
  %36 = xor i32 %35, 0
  %37 = add i32 %36, 0
  %38 = sext i32 %37 to i64
  %39 = getelementptr bfloat, ptr addrspace(1) %13, i64 %38
  %40 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %39)
  %41 = extractvalue { i32, i32 } %40, 0
  %42 = bitcast i32 %41 to <2 x bfloat>
  %43 = extractvalue { i32, i32 } %40, 1
  %44 = bitcast i32 %43 to <2 x bfloat>
  %45 = extractelement <2 x bfloat> %42, i32 0
  %46 = extractelement <2 x bfloat> %42, i32 1
  %47 = extractelement <2 x bfloat> %44, i32 0
  %48 = extractelement <2 x bfloat> %44, i32 1
  %49 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45)
  %50 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46)
  %51 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47)
  %52 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48)
  %53 = fmul float %49, %49
  %54 = fmul float %50, %50
  %55 = fmul float %51, %51
  %56 = fmul float %52, %52
  %57 = fadd float %53, %54
  %58 = fadd float %57, %55
  %59 = fadd float %58, %56
  %60 = bitcast float %59 to i32
  %61 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %60, i32 16, i32 31)
  %62 = bitcast i32 %61 to float
  %63 = fadd float %59, %62
  %64 = bitcast float %63 to i32
  %65 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %64, i32 8, i32 31)
  %66 = bitcast i32 %65 to float
  %67 = fadd float %63, %66
  %68 = bitcast float %67 to i32
  %69 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %68, i32 4, i32 31)
  %70 = bitcast i32 %69 to float
  %71 = fadd float %67, %70
  %72 = bitcast float %71 to i32
  %73 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %72, i32 2, i32 31)
  %74 = bitcast i32 %73 to float
  %75 = fadd float %71, %74
  %76 = bitcast float %75 to i32
  %77 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %76, i32 1, i32 31)
  %78 = bitcast i32 %77 to float
  %79 = fadd float %75, %78
  %80 = fmul float %79, 7.812500e-03
  %81 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %82 = bitcast i32 %81 to <1 x float>
  %83 = extractelement <1 x float> %82, i32 0
  %84 = fadd float %80, %83
  %85 = call float @__nv_rsqrtf(float %84)
  %86 = fmul float %49, %85
  %87 = fmul float %50, %85
  %88 = fmul float %51, %85
  %89 = fmul float %52, %85
  %90 = mul i64 %6, 128
  %91 = getelementptr float, ptr addrspace(1) %3, i64 %90
  %92 = getelementptr float, ptr addrspace(1) %91, i64 %38
  %93 = insertelement <1 x float> undef, float %86, i32 0
  %94 = bitcast <1 x float> %93 to i32
  %95 = insertelement <1 x float> undef, float %87, i32 0
  %96 = bitcast <1 x float> %95 to i32
  %97 = insertelement <1 x float> undef, float %88, i32 0
  %98 = bitcast <1 x float> %97 to i32
  %99 = insertelement <1 x float> undef, float %89, i32 0
  %100 = bitcast <1 x float> %99 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %94, i32 %96, i32 %98, i32 %100, ptr addrspace(1) %92)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(65536) %0, ptr noalias align 16 dereferenceable(256) %1, ptr noalias align 16 dereferenceable(10485760) %2, ptr noalias align 16 dereferenceable(64) %3, ptr noalias align 128 dereferenceable(32768) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %8 = udiv i32 %7, 4
  %9 = urem i32 %6, 64
  %10 = udiv i32 %6, 64
  %11 = mul i32 %10, 128
  %12 = mul i32 %7, 256
  %13 = add i32 %11, %12
  %14 = add i32 %13, %9
  %15 = getelementptr inbounds float, ptr %0, i32 %14
  %16 = load float, ptr %15, align 4, !invariant.load !2
  %17 = getelementptr inbounds bfloat, ptr %1, i32 %9
  %18 = load bfloat, ptr %17, align 2, !invariant.load !2
  %19 = fpext bfloat %18 to float
  %20 = fmul float %16, %19
  %21 = call float @fused_concatenate_convert_80_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_80_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_80_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_80_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_80_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = getelementptr inbounds i32, ptr %3, i32 %4
  %8 = load i32, ptr %7, align 4, !invariant.load !2
  %9 = call i32 @llvm.smin.i32(i32 %8, i32 40959)
  %10 = call i32 @llvm.smax.i32(i32 %9, i32 0)
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %5
  %13 = getelementptr inbounds bfloat, ptr %2, i32 %12
  %14 = load bfloat, ptr %13, align 2, !invariant.load !2
  %15 = fpext bfloat %14 to float
  ret float %15
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

define ptx_kernel void @loop_slice_fusion(ptr noalias align 16 dereferenceable(277413888) %0, ptr noalias align 128 dereferenceable(138706944) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = mul i32 %3, 4
  %6 = mul i32 %4, 512
  %7 = add i32 %5, %6
  %8 = add i32 %7, 69353472
  %9 = getelementptr inbounds bfloat, ptr %0, i32 %8
  %10 = load <4 x bfloat>, ptr %9, align 8, !invariant.load !2
  %11 = extractelement <4 x bfloat> %10, i64 0
  %12 = insertelement <4 x bfloat> zeroinitializer, bfloat %11, i64 0
  %13 = extractelement <4 x bfloat> %10, i64 1
  %14 = insertelement <4 x bfloat> %12, bfloat %13, i64 1
  %15 = extractelement <4 x bfloat> %10, i64 2
  %16 = insertelement <4 x bfloat> %14, bfloat %15, i64 2
  %17 = extractelement <4 x bfloat> %10, i64 3
  %18 = insertelement <4 x bfloat> %16, bfloat %17, i64 3
  %19 = getelementptr inbounds bfloat, ptr %1, i32 %7
  store <4 x bfloat> %18, ptr %19, align 8
  ret void
}

define ptx_kernel void @wrapped_slice_1(ptr noalias align 16 dereferenceable(277413888) %0, ptr noalias align 128 dereferenceable(138706944) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = mul i32 %3, 4
  %6 = mul i32 %4, 512
  %7 = add i32 %5, %6
  %8 = getelementptr inbounds bfloat, ptr %0, i32 %7
  %9 = load <4 x bfloat>, ptr %8, align 8, !invariant.load !2
  %10 = extractelement <4 x bfloat> %9, i64 0
  %11 = insertelement <4 x bfloat> zeroinitializer, bfloat %10, i64 0
  %12 = extractelement <4 x bfloat> %9, i64 1
  %13 = insertelement <4 x bfloat> %11, bfloat %12, i64 1
  %14 = extractelement <4 x bfloat> %9, i64 2
  %15 = insertelement <4 x bfloat> %13, bfloat %14, i64 2
  %16 = extractelement <4 x bfloat> %9, i64 3
  %17 = insertelement <4 x bfloat> %15, bfloat %16, i64 3
  %18 = getelementptr inbounds bfloat, ptr %1, i32 %7
  store <4 x bfloat> %17, ptr %18, align 8
  ret void
}

attributes #0 = { "nvvm.reqntid"="128,1,1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "nvvm.reqntid"="64" }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind }
attributes #5 = { "nvvm.reqntid"="64,1,1" }
attributes #6 = { "nvvm.reqntid"="32" }
attributes #7 = { "nvvm.reqntid"="32,1,1" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 128}
!2 = !{}
!3 = !{i32 0, i32 64}
!4 = !{i32 0, i32 135456}

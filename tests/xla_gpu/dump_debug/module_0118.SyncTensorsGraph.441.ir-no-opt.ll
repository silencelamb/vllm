; ModuleID = 'SyncTensorsGraph.441'
source_filename = "SyncTensorsGraph.441"
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

declare ptx_kernel void @gemm_fusion_dot_15_0_impl(ptr, ptr, ptr, ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_15_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sdiv i32 %7, 8
  %9 = mul i32 %8, 8
  %10 = sub i32 32, %9
  %11 = icmp slt i32 %10, 8
  %12 = select i1 %11, i32 %10, i32 8
  %13 = srem i32 %7, %12
  %14 = add i32 %9, %13
  %15 = srem i32 %7, 8
  %16 = sdiv i32 %15, %12
  %17 = mul i32 %14, 128
  %18 = icmp slt i32 %17, 1024
  %19 = select i1 %18, ptr addrspace(1) %1, ptr addrspace(1) %2
  %20 = icmp slt i32 %17, 2048
  %21 = select i1 %20, ptr addrspace(1) %19, ptr addrspace(1) %3
  %22 = icmp slt i32 %17, 3072
  %23 = select i1 %22, ptr addrspace(1) %21, ptr addrspace(1) %4
  %24 = add i32 %17, -1024
  %25 = add i32 %17, -2048
  %26 = add i32 %17, -3072
  %27 = select i1 %18, i32 %17, i32 %24
  %28 = select i1 %20, i32 %27, i32 %25
  %29 = select i1 %22, i32 %28, i32 %26
  %30 = sext i32 %29 to i64
  %31 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %32 = urem i32 %31, 32
  %33 = udiv i32 %31, 32
  %34 = and i32 %32, 16
  %35 = icmp eq i32 %34, 0
  %36 = select i1 %35, i32 0, i32 1
  %37 = xor i32 0, %36
  %38 = and i32 %33, 1
  %39 = icmp eq i32 %38, 0
  %40 = select i1 %39, i32 0, i32 2
  %41 = xor i32 %37, %40
  %42 = and i32 %33, 2
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, i32 0, i32 4
  %45 = xor i32 %41, %44
  %46 = xor i32 %45, 0
  %47 = xor i32 %45, 8
  %48 = xor i32 %45, 16
  %49 = xor i32 %45, 24
  %50 = xor i32 %45, 32
  %51 = xor i32 %45, 40
  %52 = xor i32 %45, 48
  %53 = xor i32 %45, 56
  %54 = xor i32 %45, 64
  %55 = xor i32 %45, 72
  %56 = xor i32 %45, 80
  %57 = xor i32 %45, 88
  %58 = xor i32 %45, 96
  %59 = xor i32 %45, 104
  %60 = xor i32 %45, 112
  %61 = xor i32 %45, 120
  %62 = add i32 %46, 0
  %63 = add i32 %47, 0
  %64 = add i32 %48, 0
  %65 = add i32 %49, 0
  %66 = add i32 %50, 0
  %67 = add i32 %51, 0
  %68 = add i32 %52, 0
  %69 = add i32 %53, 0
  %70 = add i32 %54, 0
  %71 = add i32 %55, 0
  %72 = add i32 %56, 0
  %73 = add i32 %57, 0
  %74 = add i32 %58, 0
  %75 = add i32 %59, 0
  %76 = add i32 %60, 0
  %77 = add i32 %61, 0
  %78 = and i32 %32, 1
  %79 = icmp eq i32 %78, 0
  %80 = select i1 %79, i32 0, i32 8
  %81 = xor i32 0, %80
  %82 = and i32 %32, 2
  %83 = icmp eq i32 %82, 0
  %84 = select i1 %83, i32 0, i32 16
  %85 = xor i32 %81, %84
  %86 = and i32 %32, 4
  %87 = icmp eq i32 %86, 0
  %88 = select i1 %87, i32 0, i32 32
  %89 = xor i32 %85, %88
  %90 = and i32 %32, 8
  %91 = icmp eq i32 %90, 0
  %92 = select i1 %91, i32 0, i32 64
  %93 = xor i32 %89, %92
  %94 = xor i32 %93, 0
  %95 = add i32 %94, 0
  %96 = sext i32 %62 to i64
  %97 = sext i32 %63 to i64
  %98 = sext i32 %64 to i64
  %99 = sext i32 %65 to i64
  %100 = sext i32 %66 to i64
  %101 = sext i32 %67 to i64
  %102 = sext i32 %68 to i64
  %103 = sext i32 %69 to i64
  %104 = sext i32 %70 to i64
  %105 = sext i32 %71 to i64
  %106 = sext i32 %72 to i64
  %107 = sext i32 %73 to i64
  %108 = sext i32 %74 to i64
  %109 = sext i32 %75 to i64
  %110 = sext i32 %76 to i64
  %111 = sext i32 %77 to i64
  %112 = sext i32 %95 to i64
  %113 = add i64 %30, %96
  %114 = add i64 %30, %97
  %115 = add i64 %30, %98
  %116 = add i64 %30, %99
  %117 = add i64 %30, %100
  %118 = add i64 %30, %101
  %119 = add i64 %30, %102
  %120 = add i64 %30, %103
  %121 = add i64 %30, %104
  %122 = add i64 %30, %105
  %123 = add i64 %30, %106
  %124 = add i64 %30, %107
  %125 = add i64 %30, %108
  %126 = add i64 %30, %109
  %127 = add i64 %30, %110
  %128 = add i64 %30, %111
  %129 = mul i64 %113, 2048
  %130 = mul i64 %114, 2048
  %131 = mul i64 %115, 2048
  %132 = mul i64 %116, 2048
  %133 = mul i64 %117, 2048
  %134 = mul i64 %118, 2048
  %135 = mul i64 %119, 2048
  %136 = mul i64 %120, 2048
  %137 = mul i64 %121, 2048
  %138 = mul i64 %122, 2048
  %139 = mul i64 %123, 2048
  %140 = mul i64 %124, 2048
  %141 = mul i64 %125, 2048
  %142 = mul i64 %126, 2048
  %143 = mul i64 %127, 2048
  %144 = mul i64 %128, 2048
  %145 = add i64 %129, %112
  %146 = add i64 %130, %112
  %147 = add i64 %131, %112
  %148 = add i64 %132, %112
  %149 = add i64 %133, %112
  %150 = add i64 %134, %112
  %151 = add i64 %135, %112
  %152 = add i64 %136, %112
  %153 = add i64 %137, %112
  %154 = add i64 %138, %112
  %155 = add i64 %139, %112
  %156 = add i64 %140, %112
  %157 = add i64 %141, %112
  %158 = add i64 %142, %112
  %159 = add i64 %143, %112
  %160 = add i64 %144, %112
  %161 = getelementptr bfloat, ptr addrspace(1) %23, i64 %145
  %162 = getelementptr bfloat, ptr addrspace(1) %23, i64 %146
  %163 = getelementptr bfloat, ptr addrspace(1) %23, i64 %147
  %164 = getelementptr bfloat, ptr addrspace(1) %23, i64 %148
  %165 = getelementptr bfloat, ptr addrspace(1) %23, i64 %149
  %166 = getelementptr bfloat, ptr addrspace(1) %23, i64 %150
  %167 = getelementptr bfloat, ptr addrspace(1) %23, i64 %151
  %168 = getelementptr bfloat, ptr addrspace(1) %23, i64 %152
  %169 = getelementptr bfloat, ptr addrspace(1) %23, i64 %153
  %170 = getelementptr bfloat, ptr addrspace(1) %23, i64 %154
  %171 = getelementptr bfloat, ptr addrspace(1) %23, i64 %155
  %172 = getelementptr bfloat, ptr addrspace(1) %23, i64 %156
  %173 = getelementptr bfloat, ptr addrspace(1) %23, i64 %157
  %174 = getelementptr bfloat, ptr addrspace(1) %23, i64 %158
  %175 = getelementptr bfloat, ptr addrspace(1) %23, i64 %159
  %176 = getelementptr bfloat, ptr addrspace(1) %23, i64 %160
  %177 = select i1 %35, i32 0, i32 136
  %178 = xor i32 %93, %177
  %179 = select i1 %39, i32 0, i32 272
  %180 = xor i32 %178, %179
  %181 = select i1 %43, i32 0, i32 544
  %182 = xor i32 %180, %181
  %183 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %182
  %184 = xor i32 1024, %80
  %185 = xor i32 %184, %84
  %186 = xor i32 %185, %88
  %187 = xor i32 %186, %92
  %188 = xor i32 %187, %177
  %189 = xor i32 %188, %179
  %190 = xor i32 %189, %181
  %191 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %190
  %192 = xor i32 2048, %80
  %193 = xor i32 %192, %84
  %194 = xor i32 %193, %88
  %195 = xor i32 %194, %92
  %196 = xor i32 %195, %177
  %197 = xor i32 %196, %179
  %198 = xor i32 %197, %181
  %199 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %198
  %200 = xor i32 3072, %80
  %201 = xor i32 %200, %84
  %202 = xor i32 %201, %88
  %203 = xor i32 %202, %92
  %204 = xor i32 %203, %177
  %205 = xor i32 %204, %179
  %206 = xor i32 %205, %181
  %207 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %206
  %208 = xor i32 4096, %80
  %209 = xor i32 %208, %84
  %210 = xor i32 %209, %88
  %211 = xor i32 %210, %92
  %212 = xor i32 %211, %177
  %213 = xor i32 %212, %179
  %214 = xor i32 %213, %181
  %215 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %214
  %216 = xor i32 5120, %80
  %217 = xor i32 %216, %84
  %218 = xor i32 %217, %88
  %219 = xor i32 %218, %92
  %220 = xor i32 %219, %177
  %221 = xor i32 %220, %179
  %222 = xor i32 %221, %181
  %223 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %222
  %224 = xor i32 6144, %80
  %225 = xor i32 %224, %84
  %226 = xor i32 %225, %88
  %227 = xor i32 %226, %92
  %228 = xor i32 %227, %177
  %229 = xor i32 %228, %179
  %230 = xor i32 %229, %181
  %231 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %230
  %232 = xor i32 7168, %80
  %233 = xor i32 %232, %84
  %234 = xor i32 %233, %88
  %235 = xor i32 %234, %92
  %236 = xor i32 %235, %177
  %237 = xor i32 %236, %179
  %238 = xor i32 %237, %181
  %239 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %238
  %240 = xor i32 8192, %80
  %241 = xor i32 %240, %84
  %242 = xor i32 %241, %88
  %243 = xor i32 %242, %92
  %244 = xor i32 %243, %177
  %245 = xor i32 %244, %179
  %246 = xor i32 %245, %181
  %247 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %246
  %248 = xor i32 9216, %80
  %249 = xor i32 %248, %84
  %250 = xor i32 %249, %88
  %251 = xor i32 %250, %92
  %252 = xor i32 %251, %177
  %253 = xor i32 %252, %179
  %254 = xor i32 %253, %181
  %255 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %254
  %256 = xor i32 10240, %80
  %257 = xor i32 %256, %84
  %258 = xor i32 %257, %88
  %259 = xor i32 %258, %92
  %260 = xor i32 %259, %177
  %261 = xor i32 %260, %179
  %262 = xor i32 %261, %181
  %263 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %262
  %264 = xor i32 11264, %80
  %265 = xor i32 %264, %84
  %266 = xor i32 %265, %88
  %267 = xor i32 %266, %92
  %268 = xor i32 %267, %177
  %269 = xor i32 %268, %179
  %270 = xor i32 %269, %181
  %271 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %270
  %272 = xor i32 12288, %80
  %273 = xor i32 %272, %84
  %274 = xor i32 %273, %88
  %275 = xor i32 %274, %92
  %276 = xor i32 %275, %177
  %277 = xor i32 %276, %179
  %278 = xor i32 %277, %181
  %279 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %278
  %280 = xor i32 13312, %80
  %281 = xor i32 %280, %84
  %282 = xor i32 %281, %88
  %283 = xor i32 %282, %92
  %284 = xor i32 %283, %177
  %285 = xor i32 %284, %179
  %286 = xor i32 %285, %181
  %287 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %286
  %288 = xor i32 14336, %80
  %289 = xor i32 %288, %84
  %290 = xor i32 %289, %88
  %291 = xor i32 %290, %92
  %292 = xor i32 %291, %177
  %293 = xor i32 %292, %179
  %294 = xor i32 %293, %181
  %295 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %294
  %296 = xor i32 15360, %80
  %297 = xor i32 %296, %84
  %298 = xor i32 %297, %88
  %299 = xor i32 %298, %92
  %300 = xor i32 %299, %177
  %301 = xor i32 %300, %179
  %302 = xor i32 %301, %181
  %303 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %302
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %183, ptr addrspace(1) %161, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %191, ptr addrspace(1) %162, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %199, ptr addrspace(1) %163, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %207, ptr addrspace(1) %164, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %215, ptr addrspace(1) %165, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %223, ptr addrspace(1) %166, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %231, ptr addrspace(1) %167, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %239, ptr addrspace(1) %168, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %247, ptr addrspace(1) %169, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %255, ptr addrspace(1) %170, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %263, ptr addrspace(1) %171, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %271, ptr addrspace(1) %172, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %279, ptr addrspace(1) %173, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %287, ptr addrspace(1) %174, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %295, ptr addrspace(1) %175, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %303, ptr addrspace(1) %176, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %304 = add i64 %112, 128
  %305 = add i64 %129, %304
  %306 = add i64 %130, %304
  %307 = add i64 %131, %304
  %308 = add i64 %132, %304
  %309 = add i64 %133, %304
  %310 = add i64 %134, %304
  %311 = add i64 %135, %304
  %312 = add i64 %136, %304
  %313 = add i64 %137, %304
  %314 = add i64 %138, %304
  %315 = add i64 %139, %304
  %316 = add i64 %140, %304
  %317 = add i64 %141, %304
  %318 = add i64 %142, %304
  %319 = add i64 %143, %304
  %320 = add i64 %144, %304
  %321 = getelementptr bfloat, ptr addrspace(1) %23, i64 %305
  %322 = getelementptr bfloat, ptr addrspace(1) %23, i64 %306
  %323 = getelementptr bfloat, ptr addrspace(1) %23, i64 %307
  %324 = getelementptr bfloat, ptr addrspace(1) %23, i64 %308
  %325 = getelementptr bfloat, ptr addrspace(1) %23, i64 %309
  %326 = getelementptr bfloat, ptr addrspace(1) %23, i64 %310
  %327 = getelementptr bfloat, ptr addrspace(1) %23, i64 %311
  %328 = getelementptr bfloat, ptr addrspace(1) %23, i64 %312
  %329 = getelementptr bfloat, ptr addrspace(1) %23, i64 %313
  %330 = getelementptr bfloat, ptr addrspace(1) %23, i64 %314
  %331 = getelementptr bfloat, ptr addrspace(1) %23, i64 %315
  %332 = getelementptr bfloat, ptr addrspace(1) %23, i64 %316
  %333 = getelementptr bfloat, ptr addrspace(1) %23, i64 %317
  %334 = getelementptr bfloat, ptr addrspace(1) %23, i64 %318
  %335 = getelementptr bfloat, ptr addrspace(1) %23, i64 %319
  %336 = getelementptr bfloat, ptr addrspace(1) %23, i64 %320
  call void @llvm.nvvm.barrier0()
  %337 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %182
  %338 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %190
  %339 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %198
  %340 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %206
  %341 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %214
  %342 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %222
  %343 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %230
  %344 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %238
  %345 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %246
  %346 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %254
  %347 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %262
  %348 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %270
  %349 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %278
  %350 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %286
  %351 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %294
  %352 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %302
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %337, ptr addrspace(1) %321, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %338, ptr addrspace(1) %322, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %339, ptr addrspace(1) %323, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %340, ptr addrspace(1) %324, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %341, ptr addrspace(1) %325, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %342, ptr addrspace(1) %326, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %343, ptr addrspace(1) %327, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %344, ptr addrspace(1) %328, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %345, ptr addrspace(1) %329, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %346, ptr addrspace(1) %330, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %347, ptr addrspace(1) %331, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %348, ptr addrspace(1) %332, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %349, ptr addrspace(1) %333, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %350, ptr addrspace(1) %334, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %351, ptr addrspace(1) %335, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %352, ptr addrspace(1) %336, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %353 = add i64 %112, 256
  %354 = add i64 %129, %353
  %355 = add i64 %130, %353
  %356 = add i64 %131, %353
  %357 = add i64 %132, %353
  %358 = add i64 %133, %353
  %359 = add i64 %134, %353
  %360 = add i64 %135, %353
  %361 = add i64 %136, %353
  %362 = add i64 %137, %353
  %363 = add i64 %138, %353
  %364 = add i64 %139, %353
  %365 = add i64 %140, %353
  %366 = add i64 %141, %353
  %367 = add i64 %142, %353
  %368 = add i64 %143, %353
  %369 = add i64 %144, %353
  %370 = getelementptr bfloat, ptr addrspace(1) %23, i64 %354
  %371 = getelementptr bfloat, ptr addrspace(1) %23, i64 %355
  %372 = getelementptr bfloat, ptr addrspace(1) %23, i64 %356
  %373 = getelementptr bfloat, ptr addrspace(1) %23, i64 %357
  %374 = getelementptr bfloat, ptr addrspace(1) %23, i64 %358
  %375 = getelementptr bfloat, ptr addrspace(1) %23, i64 %359
  %376 = getelementptr bfloat, ptr addrspace(1) %23, i64 %360
  %377 = getelementptr bfloat, ptr addrspace(1) %23, i64 %361
  %378 = getelementptr bfloat, ptr addrspace(1) %23, i64 %362
  %379 = getelementptr bfloat, ptr addrspace(1) %23, i64 %363
  %380 = getelementptr bfloat, ptr addrspace(1) %23, i64 %364
  %381 = getelementptr bfloat, ptr addrspace(1) %23, i64 %365
  %382 = getelementptr bfloat, ptr addrspace(1) %23, i64 %366
  %383 = getelementptr bfloat, ptr addrspace(1) %23, i64 %367
  %384 = getelementptr bfloat, ptr addrspace(1) %23, i64 %368
  %385 = getelementptr bfloat, ptr addrspace(1) %23, i64 %369
  call void @llvm.nvvm.barrier0()
  %386 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %182
  %387 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %190
  %388 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %198
  %389 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %206
  %390 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %214
  %391 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %222
  %392 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %230
  %393 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %238
  %394 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %246
  %395 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %254
  %396 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %262
  %397 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %270
  %398 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %278
  %399 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %286
  %400 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %294
  %401 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %302
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %386, ptr addrspace(1) %370, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %387, ptr addrspace(1) %371, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %388, ptr addrspace(1) %372, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %389, ptr addrspace(1) %373, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %390, ptr addrspace(1) %374, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %391, ptr addrspace(1) %375, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %392, ptr addrspace(1) %376, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %393, ptr addrspace(1) %377, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %394, ptr addrspace(1) %378, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %395, ptr addrspace(1) %379, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %396, ptr addrspace(1) %380, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %397, ptr addrspace(1) %381, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %398, ptr addrspace(1) %382, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %399, ptr addrspace(1) %383, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %400, ptr addrspace(1) %384, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %401, ptr addrspace(1) %385, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %402

402:                                              ; preds = %410, %0
  %403 = phi i32 [ %1290, %410 ], [ 0, %0 ]
  %404 = phi i64 [ %1220, %410 ], [ 256, %0 ]
  %405 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %1219, %410 ], [ zeroinitializer, %0 ]
  %406 = phi i32 [ %1223, %410 ], [ 2, %0 ]
  %407 = phi i32 [ %1281, %410 ], [ 0, %0 ]
  %408 = phi { ptr addrspace(3), i32, i32 } [ %1289, %410 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %409 = icmp slt i32 %403, 2048
  br i1 %409, label %410, label %1291

410:                                              ; preds = %402
  %411 = icmp slt i32 %403, 1664
  %412 = extractvalue { ptr addrspace(3), i32, i32 } %408, 0
  %413 = select i1 %79, i32 0, i32 136
  %414 = xor i32 0, %413
  %415 = select i1 %83, i32 0, i32 272
  %416 = xor i32 %414, %415
  %417 = select i1 %87, i32 0, i32 544
  %418 = xor i32 %416, %417
  %419 = select i1 %91, i32 0, i32 1024
  %420 = xor i32 %418, %419
  %421 = select i1 %35, i32 0, i32 8
  %422 = xor i32 %420, %421
  %423 = select i1 %39, i32 0, i32 2048
  %424 = xor i32 %422, %423
  %425 = select i1 %43, i32 0, i32 4096
  %426 = xor i32 %424, %425
  %427 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %426
  %428 = ptrtoint ptr addrspace(3) %427 to i32
  %429 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %428)
  %430 = extractvalue { i32, i32, i32, i32 } %429, 0
  %431 = extractvalue { i32, i32, i32, i32 } %429, 1
  %432 = extractvalue { i32, i32, i32, i32 } %429, 2
  %433 = extractvalue { i32, i32, i32, i32 } %429, 3
  %434 = xor i32 16, %413
  %435 = xor i32 %434, %415
  %436 = xor i32 %435, %417
  %437 = xor i32 %436, %419
  %438 = xor i32 %437, %421
  %439 = xor i32 %438, %423
  %440 = xor i32 %439, %425
  %441 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %440
  %442 = ptrtoint ptr addrspace(3) %441 to i32
  %443 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %442)
  %444 = extractvalue { i32, i32, i32, i32 } %443, 0
  %445 = extractvalue { i32, i32, i32, i32 } %443, 1
  %446 = extractvalue { i32, i32, i32, i32 } %443, 2
  %447 = extractvalue { i32, i32, i32, i32 } %443, 3
  %448 = xor i32 32, %413
  %449 = xor i32 %448, %415
  %450 = xor i32 %449, %417
  %451 = xor i32 %450, %419
  %452 = xor i32 %451, %421
  %453 = xor i32 %452, %423
  %454 = xor i32 %453, %425
  %455 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %454
  %456 = ptrtoint ptr addrspace(3) %455 to i32
  %457 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %456)
  %458 = extractvalue { i32, i32, i32, i32 } %457, 0
  %459 = extractvalue { i32, i32, i32, i32 } %457, 1
  %460 = extractvalue { i32, i32, i32, i32 } %457, 2
  %461 = extractvalue { i32, i32, i32, i32 } %457, 3
  %462 = xor i32 48, %413
  %463 = xor i32 %462, %415
  %464 = xor i32 %463, %417
  %465 = xor i32 %464, %419
  %466 = xor i32 %465, %421
  %467 = xor i32 %466, %423
  %468 = xor i32 %467, %425
  %469 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %468
  %470 = ptrtoint ptr addrspace(3) %469 to i32
  %471 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %470)
  %472 = extractvalue { i32, i32, i32, i32 } %471, 0
  %473 = extractvalue { i32, i32, i32, i32 } %471, 1
  %474 = extractvalue { i32, i32, i32, i32 } %471, 2
  %475 = extractvalue { i32, i32, i32, i32 } %471, 3
  %476 = xor i32 64, %413
  %477 = xor i32 %476, %415
  %478 = xor i32 %477, %417
  %479 = xor i32 %478, %419
  %480 = xor i32 %479, %421
  %481 = xor i32 %480, %423
  %482 = xor i32 %481, %425
  %483 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %482
  %484 = ptrtoint ptr addrspace(3) %483 to i32
  %485 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %484)
  %486 = extractvalue { i32, i32, i32, i32 } %485, 0
  %487 = extractvalue { i32, i32, i32, i32 } %485, 1
  %488 = extractvalue { i32, i32, i32, i32 } %485, 2
  %489 = extractvalue { i32, i32, i32, i32 } %485, 3
  %490 = xor i32 80, %413
  %491 = xor i32 %490, %415
  %492 = xor i32 %491, %417
  %493 = xor i32 %492, %419
  %494 = xor i32 %493, %421
  %495 = xor i32 %494, %423
  %496 = xor i32 %495, %425
  %497 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %496
  %498 = ptrtoint ptr addrspace(3) %497 to i32
  %499 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %498)
  %500 = extractvalue { i32, i32, i32, i32 } %499, 0
  %501 = extractvalue { i32, i32, i32, i32 } %499, 1
  %502 = extractvalue { i32, i32, i32, i32 } %499, 2
  %503 = extractvalue { i32, i32, i32, i32 } %499, 3
  %504 = xor i32 96, %413
  %505 = xor i32 %504, %415
  %506 = xor i32 %505, %417
  %507 = xor i32 %506, %419
  %508 = xor i32 %507, %421
  %509 = xor i32 %508, %423
  %510 = xor i32 %509, %425
  %511 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %510
  %512 = ptrtoint ptr addrspace(3) %511 to i32
  %513 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %512)
  %514 = extractvalue { i32, i32, i32, i32 } %513, 0
  %515 = extractvalue { i32, i32, i32, i32 } %513, 1
  %516 = extractvalue { i32, i32, i32, i32 } %513, 2
  %517 = extractvalue { i32, i32, i32, i32 } %513, 3
  %518 = xor i32 112, %413
  %519 = xor i32 %518, %415
  %520 = xor i32 %519, %417
  %521 = xor i32 %520, %419
  %522 = xor i32 %521, %421
  %523 = xor i32 %522, %423
  %524 = xor i32 %523, %425
  %525 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %524
  %526 = ptrtoint ptr addrspace(3) %525 to i32
  %527 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %526)
  %528 = extractvalue { i32, i32, i32, i32 } %527, 0
  %529 = extractvalue { i32, i32, i32, i32 } %527, 1
  %530 = extractvalue { i32, i32, i32, i32 } %527, 2
  %531 = extractvalue { i32, i32, i32, i32 } %527, 3
  %532 = xor i32 8192, %413
  %533 = xor i32 %532, %415
  %534 = xor i32 %533, %417
  %535 = xor i32 %534, %419
  %536 = xor i32 %535, %421
  %537 = xor i32 %536, %423
  %538 = xor i32 %537, %425
  %539 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %538
  %540 = ptrtoint ptr addrspace(3) %539 to i32
  %541 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %540)
  %542 = extractvalue { i32, i32, i32, i32 } %541, 0
  %543 = extractvalue { i32, i32, i32, i32 } %541, 1
  %544 = extractvalue { i32, i32, i32, i32 } %541, 2
  %545 = extractvalue { i32, i32, i32, i32 } %541, 3
  %546 = xor i32 8208, %413
  %547 = xor i32 %546, %415
  %548 = xor i32 %547, %417
  %549 = xor i32 %548, %419
  %550 = xor i32 %549, %421
  %551 = xor i32 %550, %423
  %552 = xor i32 %551, %425
  %553 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %552
  %554 = ptrtoint ptr addrspace(3) %553 to i32
  %555 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %554)
  %556 = extractvalue { i32, i32, i32, i32 } %555, 0
  %557 = extractvalue { i32, i32, i32, i32 } %555, 1
  %558 = extractvalue { i32, i32, i32, i32 } %555, 2
  %559 = extractvalue { i32, i32, i32, i32 } %555, 3
  %560 = xor i32 8224, %413
  %561 = xor i32 %560, %415
  %562 = xor i32 %561, %417
  %563 = xor i32 %562, %419
  %564 = xor i32 %563, %421
  %565 = xor i32 %564, %423
  %566 = xor i32 %565, %425
  %567 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %566
  %568 = ptrtoint ptr addrspace(3) %567 to i32
  %569 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %568)
  %570 = extractvalue { i32, i32, i32, i32 } %569, 0
  %571 = extractvalue { i32, i32, i32, i32 } %569, 1
  %572 = extractvalue { i32, i32, i32, i32 } %569, 2
  %573 = extractvalue { i32, i32, i32, i32 } %569, 3
  %574 = xor i32 8240, %413
  %575 = xor i32 %574, %415
  %576 = xor i32 %575, %417
  %577 = xor i32 %576, %419
  %578 = xor i32 %577, %421
  %579 = xor i32 %578, %423
  %580 = xor i32 %579, %425
  %581 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %580
  %582 = ptrtoint ptr addrspace(3) %581 to i32
  %583 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %582)
  %584 = extractvalue { i32, i32, i32, i32 } %583, 0
  %585 = extractvalue { i32, i32, i32, i32 } %583, 1
  %586 = extractvalue { i32, i32, i32, i32 } %583, 2
  %587 = extractvalue { i32, i32, i32, i32 } %583, 3
  %588 = xor i32 8256, %413
  %589 = xor i32 %588, %415
  %590 = xor i32 %589, %417
  %591 = xor i32 %590, %419
  %592 = xor i32 %591, %421
  %593 = xor i32 %592, %423
  %594 = xor i32 %593, %425
  %595 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %594
  %596 = ptrtoint ptr addrspace(3) %595 to i32
  %597 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %596)
  %598 = extractvalue { i32, i32, i32, i32 } %597, 0
  %599 = extractvalue { i32, i32, i32, i32 } %597, 1
  %600 = extractvalue { i32, i32, i32, i32 } %597, 2
  %601 = extractvalue { i32, i32, i32, i32 } %597, 3
  %602 = xor i32 8272, %413
  %603 = xor i32 %602, %415
  %604 = xor i32 %603, %417
  %605 = xor i32 %604, %419
  %606 = xor i32 %605, %421
  %607 = xor i32 %606, %423
  %608 = xor i32 %607, %425
  %609 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %608
  %610 = ptrtoint ptr addrspace(3) %609 to i32
  %611 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %610)
  %612 = extractvalue { i32, i32, i32, i32 } %611, 0
  %613 = extractvalue { i32, i32, i32, i32 } %611, 1
  %614 = extractvalue { i32, i32, i32, i32 } %611, 2
  %615 = extractvalue { i32, i32, i32, i32 } %611, 3
  %616 = xor i32 8288, %413
  %617 = xor i32 %616, %415
  %618 = xor i32 %617, %417
  %619 = xor i32 %618, %419
  %620 = xor i32 %619, %421
  %621 = xor i32 %620, %423
  %622 = xor i32 %621, %425
  %623 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %622
  %624 = ptrtoint ptr addrspace(3) %623 to i32
  %625 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %624)
  %626 = extractvalue { i32, i32, i32, i32 } %625, 0
  %627 = extractvalue { i32, i32, i32, i32 } %625, 1
  %628 = extractvalue { i32, i32, i32, i32 } %625, 2
  %629 = extractvalue { i32, i32, i32, i32 } %625, 3
  %630 = xor i32 8304, %413
  %631 = xor i32 %630, %415
  %632 = xor i32 %631, %417
  %633 = xor i32 %632, %419
  %634 = xor i32 %633, %421
  %635 = xor i32 %634, %423
  %636 = xor i32 %635, %425
  %637 = getelementptr inbounds bfloat, ptr addrspace(3) %412, i32 %636
  %638 = ptrtoint ptr addrspace(3) %637 to i32
  %639 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %638)
  %640 = extractvalue { i32, i32, i32, i32 } %639, 0
  %641 = extractvalue { i32, i32, i32, i32 } %639, 1
  %642 = extractvalue { i32, i32, i32, i32 } %639, 2
  %643 = extractvalue { i32, i32, i32, i32 } %639, 3
  %644 = bitcast i32 %430 to <2 x bfloat>
  %645 = extractelement <2 x bfloat> %644, i32 0
  %646 = extractelement <2 x bfloat> %644, i32 1
  %647 = bitcast i32 %431 to <2 x bfloat>
  %648 = extractelement <2 x bfloat> %647, i32 0
  %649 = extractelement <2 x bfloat> %647, i32 1
  %650 = bitcast i32 %432 to <2 x bfloat>
  %651 = extractelement <2 x bfloat> %650, i32 0
  %652 = extractelement <2 x bfloat> %650, i32 1
  %653 = bitcast i32 %433 to <2 x bfloat>
  %654 = extractelement <2 x bfloat> %653, i32 0
  %655 = extractelement <2 x bfloat> %653, i32 1
  %656 = bitcast i32 %444 to <2 x bfloat>
  %657 = extractelement <2 x bfloat> %656, i32 0
  %658 = extractelement <2 x bfloat> %656, i32 1
  %659 = bitcast i32 %445 to <2 x bfloat>
  %660 = extractelement <2 x bfloat> %659, i32 0
  %661 = extractelement <2 x bfloat> %659, i32 1
  %662 = bitcast i32 %446 to <2 x bfloat>
  %663 = extractelement <2 x bfloat> %662, i32 0
  %664 = extractelement <2 x bfloat> %662, i32 1
  %665 = bitcast i32 %447 to <2 x bfloat>
  %666 = extractelement <2 x bfloat> %665, i32 0
  %667 = extractelement <2 x bfloat> %665, i32 1
  %668 = bitcast i32 %458 to <2 x bfloat>
  %669 = extractelement <2 x bfloat> %668, i32 0
  %670 = extractelement <2 x bfloat> %668, i32 1
  %671 = bitcast i32 %459 to <2 x bfloat>
  %672 = extractelement <2 x bfloat> %671, i32 0
  %673 = extractelement <2 x bfloat> %671, i32 1
  %674 = bitcast i32 %460 to <2 x bfloat>
  %675 = extractelement <2 x bfloat> %674, i32 0
  %676 = extractelement <2 x bfloat> %674, i32 1
  %677 = bitcast i32 %461 to <2 x bfloat>
  %678 = extractelement <2 x bfloat> %677, i32 0
  %679 = extractelement <2 x bfloat> %677, i32 1
  %680 = bitcast i32 %472 to <2 x bfloat>
  %681 = extractelement <2 x bfloat> %680, i32 0
  %682 = extractelement <2 x bfloat> %680, i32 1
  %683 = bitcast i32 %473 to <2 x bfloat>
  %684 = extractelement <2 x bfloat> %683, i32 0
  %685 = extractelement <2 x bfloat> %683, i32 1
  %686 = bitcast i32 %474 to <2 x bfloat>
  %687 = extractelement <2 x bfloat> %686, i32 0
  %688 = extractelement <2 x bfloat> %686, i32 1
  %689 = bitcast i32 %475 to <2 x bfloat>
  %690 = extractelement <2 x bfloat> %689, i32 0
  %691 = extractelement <2 x bfloat> %689, i32 1
  %692 = bitcast i32 %486 to <2 x bfloat>
  %693 = extractelement <2 x bfloat> %692, i32 0
  %694 = extractelement <2 x bfloat> %692, i32 1
  %695 = bitcast i32 %487 to <2 x bfloat>
  %696 = extractelement <2 x bfloat> %695, i32 0
  %697 = extractelement <2 x bfloat> %695, i32 1
  %698 = bitcast i32 %488 to <2 x bfloat>
  %699 = extractelement <2 x bfloat> %698, i32 0
  %700 = extractelement <2 x bfloat> %698, i32 1
  %701 = bitcast i32 %489 to <2 x bfloat>
  %702 = extractelement <2 x bfloat> %701, i32 0
  %703 = extractelement <2 x bfloat> %701, i32 1
  %704 = bitcast i32 %500 to <2 x bfloat>
  %705 = extractelement <2 x bfloat> %704, i32 0
  %706 = extractelement <2 x bfloat> %704, i32 1
  %707 = bitcast i32 %501 to <2 x bfloat>
  %708 = extractelement <2 x bfloat> %707, i32 0
  %709 = extractelement <2 x bfloat> %707, i32 1
  %710 = bitcast i32 %502 to <2 x bfloat>
  %711 = extractelement <2 x bfloat> %710, i32 0
  %712 = extractelement <2 x bfloat> %710, i32 1
  %713 = bitcast i32 %503 to <2 x bfloat>
  %714 = extractelement <2 x bfloat> %713, i32 0
  %715 = extractelement <2 x bfloat> %713, i32 1
  %716 = bitcast i32 %514 to <2 x bfloat>
  %717 = extractelement <2 x bfloat> %716, i32 0
  %718 = extractelement <2 x bfloat> %716, i32 1
  %719 = bitcast i32 %515 to <2 x bfloat>
  %720 = extractelement <2 x bfloat> %719, i32 0
  %721 = extractelement <2 x bfloat> %719, i32 1
  %722 = bitcast i32 %516 to <2 x bfloat>
  %723 = extractelement <2 x bfloat> %722, i32 0
  %724 = extractelement <2 x bfloat> %722, i32 1
  %725 = bitcast i32 %517 to <2 x bfloat>
  %726 = extractelement <2 x bfloat> %725, i32 0
  %727 = extractelement <2 x bfloat> %725, i32 1
  %728 = bitcast i32 %528 to <2 x bfloat>
  %729 = extractelement <2 x bfloat> %728, i32 0
  %730 = extractelement <2 x bfloat> %728, i32 1
  %731 = bitcast i32 %529 to <2 x bfloat>
  %732 = extractelement <2 x bfloat> %731, i32 0
  %733 = extractelement <2 x bfloat> %731, i32 1
  %734 = bitcast i32 %530 to <2 x bfloat>
  %735 = extractelement <2 x bfloat> %734, i32 0
  %736 = extractelement <2 x bfloat> %734, i32 1
  %737 = bitcast i32 %531 to <2 x bfloat>
  %738 = extractelement <2 x bfloat> %737, i32 0
  %739 = extractelement <2 x bfloat> %737, i32 1
  %740 = bitcast i32 %542 to <2 x bfloat>
  %741 = extractelement <2 x bfloat> %740, i32 0
  %742 = extractelement <2 x bfloat> %740, i32 1
  %743 = bitcast i32 %543 to <2 x bfloat>
  %744 = extractelement <2 x bfloat> %743, i32 0
  %745 = extractelement <2 x bfloat> %743, i32 1
  %746 = bitcast i32 %544 to <2 x bfloat>
  %747 = extractelement <2 x bfloat> %746, i32 0
  %748 = extractelement <2 x bfloat> %746, i32 1
  %749 = bitcast i32 %545 to <2 x bfloat>
  %750 = extractelement <2 x bfloat> %749, i32 0
  %751 = extractelement <2 x bfloat> %749, i32 1
  %752 = bitcast i32 %556 to <2 x bfloat>
  %753 = extractelement <2 x bfloat> %752, i32 0
  %754 = extractelement <2 x bfloat> %752, i32 1
  %755 = bitcast i32 %557 to <2 x bfloat>
  %756 = extractelement <2 x bfloat> %755, i32 0
  %757 = extractelement <2 x bfloat> %755, i32 1
  %758 = bitcast i32 %558 to <2 x bfloat>
  %759 = extractelement <2 x bfloat> %758, i32 0
  %760 = extractelement <2 x bfloat> %758, i32 1
  %761 = bitcast i32 %559 to <2 x bfloat>
  %762 = extractelement <2 x bfloat> %761, i32 0
  %763 = extractelement <2 x bfloat> %761, i32 1
  %764 = bitcast i32 %570 to <2 x bfloat>
  %765 = extractelement <2 x bfloat> %764, i32 0
  %766 = extractelement <2 x bfloat> %764, i32 1
  %767 = bitcast i32 %571 to <2 x bfloat>
  %768 = extractelement <2 x bfloat> %767, i32 0
  %769 = extractelement <2 x bfloat> %767, i32 1
  %770 = bitcast i32 %572 to <2 x bfloat>
  %771 = extractelement <2 x bfloat> %770, i32 0
  %772 = extractelement <2 x bfloat> %770, i32 1
  %773 = bitcast i32 %573 to <2 x bfloat>
  %774 = extractelement <2 x bfloat> %773, i32 0
  %775 = extractelement <2 x bfloat> %773, i32 1
  %776 = bitcast i32 %584 to <2 x bfloat>
  %777 = extractelement <2 x bfloat> %776, i32 0
  %778 = extractelement <2 x bfloat> %776, i32 1
  %779 = bitcast i32 %585 to <2 x bfloat>
  %780 = extractelement <2 x bfloat> %779, i32 0
  %781 = extractelement <2 x bfloat> %779, i32 1
  %782 = bitcast i32 %586 to <2 x bfloat>
  %783 = extractelement <2 x bfloat> %782, i32 0
  %784 = extractelement <2 x bfloat> %782, i32 1
  %785 = bitcast i32 %587 to <2 x bfloat>
  %786 = extractelement <2 x bfloat> %785, i32 0
  %787 = extractelement <2 x bfloat> %785, i32 1
  %788 = bitcast i32 %598 to <2 x bfloat>
  %789 = extractelement <2 x bfloat> %788, i32 0
  %790 = extractelement <2 x bfloat> %788, i32 1
  %791 = bitcast i32 %599 to <2 x bfloat>
  %792 = extractelement <2 x bfloat> %791, i32 0
  %793 = extractelement <2 x bfloat> %791, i32 1
  %794 = bitcast i32 %600 to <2 x bfloat>
  %795 = extractelement <2 x bfloat> %794, i32 0
  %796 = extractelement <2 x bfloat> %794, i32 1
  %797 = bitcast i32 %601 to <2 x bfloat>
  %798 = extractelement <2 x bfloat> %797, i32 0
  %799 = extractelement <2 x bfloat> %797, i32 1
  %800 = bitcast i32 %612 to <2 x bfloat>
  %801 = extractelement <2 x bfloat> %800, i32 0
  %802 = extractelement <2 x bfloat> %800, i32 1
  %803 = bitcast i32 %613 to <2 x bfloat>
  %804 = extractelement <2 x bfloat> %803, i32 0
  %805 = extractelement <2 x bfloat> %803, i32 1
  %806 = bitcast i32 %614 to <2 x bfloat>
  %807 = extractelement <2 x bfloat> %806, i32 0
  %808 = extractelement <2 x bfloat> %806, i32 1
  %809 = bitcast i32 %615 to <2 x bfloat>
  %810 = extractelement <2 x bfloat> %809, i32 0
  %811 = extractelement <2 x bfloat> %809, i32 1
  %812 = bitcast i32 %626 to <2 x bfloat>
  %813 = extractelement <2 x bfloat> %812, i32 0
  %814 = extractelement <2 x bfloat> %812, i32 1
  %815 = bitcast i32 %627 to <2 x bfloat>
  %816 = extractelement <2 x bfloat> %815, i32 0
  %817 = extractelement <2 x bfloat> %815, i32 1
  %818 = bitcast i32 %628 to <2 x bfloat>
  %819 = extractelement <2 x bfloat> %818, i32 0
  %820 = extractelement <2 x bfloat> %818, i32 1
  %821 = bitcast i32 %629 to <2 x bfloat>
  %822 = extractelement <2 x bfloat> %821, i32 0
  %823 = extractelement <2 x bfloat> %821, i32 1
  %824 = bitcast i32 %640 to <2 x bfloat>
  %825 = extractelement <2 x bfloat> %824, i32 0
  %826 = extractelement <2 x bfloat> %824, i32 1
  %827 = bitcast i32 %641 to <2 x bfloat>
  %828 = extractelement <2 x bfloat> %827, i32 0
  %829 = extractelement <2 x bfloat> %827, i32 1
  %830 = bitcast i32 %642 to <2 x bfloat>
  %831 = extractelement <2 x bfloat> %830, i32 0
  %832 = extractelement <2 x bfloat> %830, i32 1
  %833 = bitcast i32 %643 to <2 x bfloat>
  %834 = extractelement <2 x bfloat> %833, i32 0
  %835 = extractelement <2 x bfloat> %833, i32 1
  %836 = insertelement <2 x bfloat> undef, bfloat %645, i32 0
  %837 = insertelement <2 x bfloat> %836, bfloat %646, i32 1
  %838 = bitcast <2 x bfloat> %837 to i32
  %839 = insertelement <2 x bfloat> undef, bfloat %648, i32 0
  %840 = insertelement <2 x bfloat> %839, bfloat %649, i32 1
  %841 = bitcast <2 x bfloat> %840 to i32
  %842 = insertelement <2 x bfloat> undef, bfloat %651, i32 0
  %843 = insertelement <2 x bfloat> %842, bfloat %652, i32 1
  %844 = bitcast <2 x bfloat> %843 to i32
  %845 = insertelement <2 x bfloat> undef, bfloat %654, i32 0
  %846 = insertelement <2 x bfloat> %845, bfloat %655, i32 1
  %847 = bitcast <2 x bfloat> %846 to i32
  %848 = insertelement <2 x bfloat> undef, bfloat %657, i32 0
  %849 = insertelement <2 x bfloat> %848, bfloat %658, i32 1
  %850 = bitcast <2 x bfloat> %849 to i32
  %851 = insertelement <2 x bfloat> undef, bfloat %660, i32 0
  %852 = insertelement <2 x bfloat> %851, bfloat %661, i32 1
  %853 = bitcast <2 x bfloat> %852 to i32
  %854 = insertelement <2 x bfloat> undef, bfloat %663, i32 0
  %855 = insertelement <2 x bfloat> %854, bfloat %664, i32 1
  %856 = bitcast <2 x bfloat> %855 to i32
  %857 = insertelement <2 x bfloat> undef, bfloat %666, i32 0
  %858 = insertelement <2 x bfloat> %857, bfloat %667, i32 1
  %859 = bitcast <2 x bfloat> %858 to i32
  %860 = insertelement <2 x bfloat> undef, bfloat %669, i32 0
  %861 = insertelement <2 x bfloat> %860, bfloat %670, i32 1
  %862 = bitcast <2 x bfloat> %861 to i32
  %863 = insertelement <2 x bfloat> undef, bfloat %672, i32 0
  %864 = insertelement <2 x bfloat> %863, bfloat %673, i32 1
  %865 = bitcast <2 x bfloat> %864 to i32
  %866 = insertelement <2 x bfloat> undef, bfloat %675, i32 0
  %867 = insertelement <2 x bfloat> %866, bfloat %676, i32 1
  %868 = bitcast <2 x bfloat> %867 to i32
  %869 = insertelement <2 x bfloat> undef, bfloat %678, i32 0
  %870 = insertelement <2 x bfloat> %869, bfloat %679, i32 1
  %871 = bitcast <2 x bfloat> %870 to i32
  %872 = insertelement <2 x bfloat> undef, bfloat %681, i32 0
  %873 = insertelement <2 x bfloat> %872, bfloat %682, i32 1
  %874 = bitcast <2 x bfloat> %873 to i32
  %875 = insertelement <2 x bfloat> undef, bfloat %684, i32 0
  %876 = insertelement <2 x bfloat> %875, bfloat %685, i32 1
  %877 = bitcast <2 x bfloat> %876 to i32
  %878 = insertelement <2 x bfloat> undef, bfloat %687, i32 0
  %879 = insertelement <2 x bfloat> %878, bfloat %688, i32 1
  %880 = bitcast <2 x bfloat> %879 to i32
  %881 = insertelement <2 x bfloat> undef, bfloat %690, i32 0
  %882 = insertelement <2 x bfloat> %881, bfloat %691, i32 1
  %883 = bitcast <2 x bfloat> %882 to i32
  %884 = insertelement <2 x bfloat> undef, bfloat %693, i32 0
  %885 = insertelement <2 x bfloat> %884, bfloat %694, i32 1
  %886 = bitcast <2 x bfloat> %885 to i32
  %887 = insertelement <2 x bfloat> undef, bfloat %696, i32 0
  %888 = insertelement <2 x bfloat> %887, bfloat %697, i32 1
  %889 = bitcast <2 x bfloat> %888 to i32
  %890 = insertelement <2 x bfloat> undef, bfloat %699, i32 0
  %891 = insertelement <2 x bfloat> %890, bfloat %700, i32 1
  %892 = bitcast <2 x bfloat> %891 to i32
  %893 = insertelement <2 x bfloat> undef, bfloat %702, i32 0
  %894 = insertelement <2 x bfloat> %893, bfloat %703, i32 1
  %895 = bitcast <2 x bfloat> %894 to i32
  %896 = insertelement <2 x bfloat> undef, bfloat %705, i32 0
  %897 = insertelement <2 x bfloat> %896, bfloat %706, i32 1
  %898 = bitcast <2 x bfloat> %897 to i32
  %899 = insertelement <2 x bfloat> undef, bfloat %708, i32 0
  %900 = insertelement <2 x bfloat> %899, bfloat %709, i32 1
  %901 = bitcast <2 x bfloat> %900 to i32
  %902 = insertelement <2 x bfloat> undef, bfloat %711, i32 0
  %903 = insertelement <2 x bfloat> %902, bfloat %712, i32 1
  %904 = bitcast <2 x bfloat> %903 to i32
  %905 = insertelement <2 x bfloat> undef, bfloat %714, i32 0
  %906 = insertelement <2 x bfloat> %905, bfloat %715, i32 1
  %907 = bitcast <2 x bfloat> %906 to i32
  %908 = insertelement <2 x bfloat> undef, bfloat %717, i32 0
  %909 = insertelement <2 x bfloat> %908, bfloat %718, i32 1
  %910 = bitcast <2 x bfloat> %909 to i32
  %911 = insertelement <2 x bfloat> undef, bfloat %720, i32 0
  %912 = insertelement <2 x bfloat> %911, bfloat %721, i32 1
  %913 = bitcast <2 x bfloat> %912 to i32
  %914 = insertelement <2 x bfloat> undef, bfloat %723, i32 0
  %915 = insertelement <2 x bfloat> %914, bfloat %724, i32 1
  %916 = bitcast <2 x bfloat> %915 to i32
  %917 = insertelement <2 x bfloat> undef, bfloat %726, i32 0
  %918 = insertelement <2 x bfloat> %917, bfloat %727, i32 1
  %919 = bitcast <2 x bfloat> %918 to i32
  %920 = insertelement <2 x bfloat> undef, bfloat %729, i32 0
  %921 = insertelement <2 x bfloat> %920, bfloat %730, i32 1
  %922 = bitcast <2 x bfloat> %921 to i32
  %923 = insertelement <2 x bfloat> undef, bfloat %732, i32 0
  %924 = insertelement <2 x bfloat> %923, bfloat %733, i32 1
  %925 = bitcast <2 x bfloat> %924 to i32
  %926 = insertelement <2 x bfloat> undef, bfloat %735, i32 0
  %927 = insertelement <2 x bfloat> %926, bfloat %736, i32 1
  %928 = bitcast <2 x bfloat> %927 to i32
  %929 = insertelement <2 x bfloat> undef, bfloat %738, i32 0
  %930 = insertelement <2 x bfloat> %929, bfloat %739, i32 1
  %931 = bitcast <2 x bfloat> %930 to i32
  %932 = insertelement <2 x bfloat> undef, bfloat %741, i32 0
  %933 = insertelement <2 x bfloat> %932, bfloat %742, i32 1
  %934 = bitcast <2 x bfloat> %933 to i32
  %935 = insertelement <2 x bfloat> undef, bfloat %744, i32 0
  %936 = insertelement <2 x bfloat> %935, bfloat %745, i32 1
  %937 = bitcast <2 x bfloat> %936 to i32
  %938 = insertelement <2 x bfloat> undef, bfloat %747, i32 0
  %939 = insertelement <2 x bfloat> %938, bfloat %748, i32 1
  %940 = bitcast <2 x bfloat> %939 to i32
  %941 = insertelement <2 x bfloat> undef, bfloat %750, i32 0
  %942 = insertelement <2 x bfloat> %941, bfloat %751, i32 1
  %943 = bitcast <2 x bfloat> %942 to i32
  %944 = insertelement <2 x bfloat> undef, bfloat %753, i32 0
  %945 = insertelement <2 x bfloat> %944, bfloat %754, i32 1
  %946 = bitcast <2 x bfloat> %945 to i32
  %947 = insertelement <2 x bfloat> undef, bfloat %756, i32 0
  %948 = insertelement <2 x bfloat> %947, bfloat %757, i32 1
  %949 = bitcast <2 x bfloat> %948 to i32
  %950 = insertelement <2 x bfloat> undef, bfloat %759, i32 0
  %951 = insertelement <2 x bfloat> %950, bfloat %760, i32 1
  %952 = bitcast <2 x bfloat> %951 to i32
  %953 = insertelement <2 x bfloat> undef, bfloat %762, i32 0
  %954 = insertelement <2 x bfloat> %953, bfloat %763, i32 1
  %955 = bitcast <2 x bfloat> %954 to i32
  %956 = insertelement <2 x bfloat> undef, bfloat %765, i32 0
  %957 = insertelement <2 x bfloat> %956, bfloat %766, i32 1
  %958 = bitcast <2 x bfloat> %957 to i32
  %959 = insertelement <2 x bfloat> undef, bfloat %768, i32 0
  %960 = insertelement <2 x bfloat> %959, bfloat %769, i32 1
  %961 = bitcast <2 x bfloat> %960 to i32
  %962 = insertelement <2 x bfloat> undef, bfloat %771, i32 0
  %963 = insertelement <2 x bfloat> %962, bfloat %772, i32 1
  %964 = bitcast <2 x bfloat> %963 to i32
  %965 = insertelement <2 x bfloat> undef, bfloat %774, i32 0
  %966 = insertelement <2 x bfloat> %965, bfloat %775, i32 1
  %967 = bitcast <2 x bfloat> %966 to i32
  %968 = insertelement <2 x bfloat> undef, bfloat %777, i32 0
  %969 = insertelement <2 x bfloat> %968, bfloat %778, i32 1
  %970 = bitcast <2 x bfloat> %969 to i32
  %971 = insertelement <2 x bfloat> undef, bfloat %780, i32 0
  %972 = insertelement <2 x bfloat> %971, bfloat %781, i32 1
  %973 = bitcast <2 x bfloat> %972 to i32
  %974 = insertelement <2 x bfloat> undef, bfloat %783, i32 0
  %975 = insertelement <2 x bfloat> %974, bfloat %784, i32 1
  %976 = bitcast <2 x bfloat> %975 to i32
  %977 = insertelement <2 x bfloat> undef, bfloat %786, i32 0
  %978 = insertelement <2 x bfloat> %977, bfloat %787, i32 1
  %979 = bitcast <2 x bfloat> %978 to i32
  %980 = insertelement <2 x bfloat> undef, bfloat %789, i32 0
  %981 = insertelement <2 x bfloat> %980, bfloat %790, i32 1
  %982 = bitcast <2 x bfloat> %981 to i32
  %983 = insertelement <2 x bfloat> undef, bfloat %792, i32 0
  %984 = insertelement <2 x bfloat> %983, bfloat %793, i32 1
  %985 = bitcast <2 x bfloat> %984 to i32
  %986 = insertelement <2 x bfloat> undef, bfloat %795, i32 0
  %987 = insertelement <2 x bfloat> %986, bfloat %796, i32 1
  %988 = bitcast <2 x bfloat> %987 to i32
  %989 = insertelement <2 x bfloat> undef, bfloat %798, i32 0
  %990 = insertelement <2 x bfloat> %989, bfloat %799, i32 1
  %991 = bitcast <2 x bfloat> %990 to i32
  %992 = insertelement <2 x bfloat> undef, bfloat %801, i32 0
  %993 = insertelement <2 x bfloat> %992, bfloat %802, i32 1
  %994 = bitcast <2 x bfloat> %993 to i32
  %995 = insertelement <2 x bfloat> undef, bfloat %804, i32 0
  %996 = insertelement <2 x bfloat> %995, bfloat %805, i32 1
  %997 = bitcast <2 x bfloat> %996 to i32
  %998 = insertelement <2 x bfloat> undef, bfloat %807, i32 0
  %999 = insertelement <2 x bfloat> %998, bfloat %808, i32 1
  %1000 = bitcast <2 x bfloat> %999 to i32
  %1001 = insertelement <2 x bfloat> undef, bfloat %810, i32 0
  %1002 = insertelement <2 x bfloat> %1001, bfloat %811, i32 1
  %1003 = bitcast <2 x bfloat> %1002 to i32
  %1004 = insertelement <2 x bfloat> undef, bfloat %813, i32 0
  %1005 = insertelement <2 x bfloat> %1004, bfloat %814, i32 1
  %1006 = bitcast <2 x bfloat> %1005 to i32
  %1007 = insertelement <2 x bfloat> undef, bfloat %816, i32 0
  %1008 = insertelement <2 x bfloat> %1007, bfloat %817, i32 1
  %1009 = bitcast <2 x bfloat> %1008 to i32
  %1010 = insertelement <2 x bfloat> undef, bfloat %819, i32 0
  %1011 = insertelement <2 x bfloat> %1010, bfloat %820, i32 1
  %1012 = bitcast <2 x bfloat> %1011 to i32
  %1013 = insertelement <2 x bfloat> undef, bfloat %822, i32 0
  %1014 = insertelement <2 x bfloat> %1013, bfloat %823, i32 1
  %1015 = bitcast <2 x bfloat> %1014 to i32
  %1016 = insertelement <2 x bfloat> undef, bfloat %825, i32 0
  %1017 = insertelement <2 x bfloat> %1016, bfloat %826, i32 1
  %1018 = bitcast <2 x bfloat> %1017 to i32
  %1019 = insertelement <2 x bfloat> undef, bfloat %828, i32 0
  %1020 = insertelement <2 x bfloat> %1019, bfloat %829, i32 1
  %1021 = bitcast <2 x bfloat> %1020 to i32
  %1022 = insertelement <2 x bfloat> undef, bfloat %831, i32 0
  %1023 = insertelement <2 x bfloat> %1022, bfloat %832, i32 1
  %1024 = bitcast <2 x bfloat> %1023 to i32
  %1025 = insertelement <2 x bfloat> undef, bfloat %834, i32 0
  %1026 = insertelement <2 x bfloat> %1025, bfloat %835, i32 1
  %1027 = bitcast <2 x bfloat> %1026 to i32
  %1028 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 0
  %1029 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 1
  %1030 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 2
  %1031 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 3
  %1032 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 4
  %1033 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 5
  %1034 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 6
  %1035 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 7
  %1036 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 8
  %1037 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 9
  %1038 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 10
  %1039 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 11
  %1040 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 12
  %1041 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 13
  %1042 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 14
  %1043 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 15
  %1044 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1028, float %1029, float %1030, float %1031, i32 %838, i32 %841, i32 %844, i32 %847, i32 0, i32 0)
  %1045 = extractvalue { float, float, float, float } %1044, 0
  %1046 = extractvalue { float, float, float, float } %1044, 1
  %1047 = extractvalue { float, float, float, float } %1044, 2
  %1048 = extractvalue { float, float, float, float } %1044, 3
  %1049 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1032, float %1033, float %1034, float %1035, i32 %838, i32 %841, i32 %844, i32 %847, i32 0, i32 0)
  %1050 = extractvalue { float, float, float, float } %1049, 0
  %1051 = extractvalue { float, float, float, float } %1049, 1
  %1052 = extractvalue { float, float, float, float } %1049, 2
  %1053 = extractvalue { float, float, float, float } %1049, 3
  %1054 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1036, float %1037, float %1038, float %1039, i32 %934, i32 %937, i32 %940, i32 %943, i32 0, i32 0)
  %1055 = extractvalue { float, float, float, float } %1054, 0
  %1056 = extractvalue { float, float, float, float } %1054, 1
  %1057 = extractvalue { float, float, float, float } %1054, 2
  %1058 = extractvalue { float, float, float, float } %1054, 3
  %1059 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1040, float %1041, float %1042, float %1043, i32 %934, i32 %937, i32 %940, i32 %943, i32 0, i32 0)
  %1060 = extractvalue { float, float, float, float } %1059, 0
  %1061 = extractvalue { float, float, float, float } %1059, 1
  %1062 = extractvalue { float, float, float, float } %1059, 2
  %1063 = extractvalue { float, float, float, float } %1059, 3
  %1064 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1045, float %1046, float %1047, float %1048, i32 %850, i32 %853, i32 %856, i32 %859, i32 0, i32 0)
  %1065 = extractvalue { float, float, float, float } %1064, 0
  %1066 = extractvalue { float, float, float, float } %1064, 1
  %1067 = extractvalue { float, float, float, float } %1064, 2
  %1068 = extractvalue { float, float, float, float } %1064, 3
  %1069 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1050, float %1051, float %1052, float %1053, i32 %850, i32 %853, i32 %856, i32 %859, i32 0, i32 0)
  %1070 = extractvalue { float, float, float, float } %1069, 0
  %1071 = extractvalue { float, float, float, float } %1069, 1
  %1072 = extractvalue { float, float, float, float } %1069, 2
  %1073 = extractvalue { float, float, float, float } %1069, 3
  %1074 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1055, float %1056, float %1057, float %1058, i32 %946, i32 %949, i32 %952, i32 %955, i32 0, i32 0)
  %1075 = extractvalue { float, float, float, float } %1074, 0
  %1076 = extractvalue { float, float, float, float } %1074, 1
  %1077 = extractvalue { float, float, float, float } %1074, 2
  %1078 = extractvalue { float, float, float, float } %1074, 3
  %1079 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1060, float %1061, float %1062, float %1063, i32 %946, i32 %949, i32 %952, i32 %955, i32 0, i32 0)
  %1080 = extractvalue { float, float, float, float } %1079, 0
  %1081 = extractvalue { float, float, float, float } %1079, 1
  %1082 = extractvalue { float, float, float, float } %1079, 2
  %1083 = extractvalue { float, float, float, float } %1079, 3
  %1084 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1065, float %1066, float %1067, float %1068, i32 %862, i32 %865, i32 %868, i32 %871, i32 0, i32 0)
  %1085 = extractvalue { float, float, float, float } %1084, 0
  %1086 = extractvalue { float, float, float, float } %1084, 1
  %1087 = extractvalue { float, float, float, float } %1084, 2
  %1088 = extractvalue { float, float, float, float } %1084, 3
  %1089 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1070, float %1071, float %1072, float %1073, i32 %862, i32 %865, i32 %868, i32 %871, i32 0, i32 0)
  %1090 = extractvalue { float, float, float, float } %1089, 0
  %1091 = extractvalue { float, float, float, float } %1089, 1
  %1092 = extractvalue { float, float, float, float } %1089, 2
  %1093 = extractvalue { float, float, float, float } %1089, 3
  %1094 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1075, float %1076, float %1077, float %1078, i32 %958, i32 %961, i32 %964, i32 %967, i32 0, i32 0)
  %1095 = extractvalue { float, float, float, float } %1094, 0
  %1096 = extractvalue { float, float, float, float } %1094, 1
  %1097 = extractvalue { float, float, float, float } %1094, 2
  %1098 = extractvalue { float, float, float, float } %1094, 3
  %1099 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1080, float %1081, float %1082, float %1083, i32 %958, i32 %961, i32 %964, i32 %967, i32 0, i32 0)
  %1100 = extractvalue { float, float, float, float } %1099, 0
  %1101 = extractvalue { float, float, float, float } %1099, 1
  %1102 = extractvalue { float, float, float, float } %1099, 2
  %1103 = extractvalue { float, float, float, float } %1099, 3
  %1104 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1085, float %1086, float %1087, float %1088, i32 %874, i32 %877, i32 %880, i32 %883, i32 0, i32 0)
  %1105 = extractvalue { float, float, float, float } %1104, 0
  %1106 = extractvalue { float, float, float, float } %1104, 1
  %1107 = extractvalue { float, float, float, float } %1104, 2
  %1108 = extractvalue { float, float, float, float } %1104, 3
  %1109 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1090, float %1091, float %1092, float %1093, i32 %874, i32 %877, i32 %880, i32 %883, i32 0, i32 0)
  %1110 = extractvalue { float, float, float, float } %1109, 0
  %1111 = extractvalue { float, float, float, float } %1109, 1
  %1112 = extractvalue { float, float, float, float } %1109, 2
  %1113 = extractvalue { float, float, float, float } %1109, 3
  %1114 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1095, float %1096, float %1097, float %1098, i32 %970, i32 %973, i32 %976, i32 %979, i32 0, i32 0)
  %1115 = extractvalue { float, float, float, float } %1114, 0
  %1116 = extractvalue { float, float, float, float } %1114, 1
  %1117 = extractvalue { float, float, float, float } %1114, 2
  %1118 = extractvalue { float, float, float, float } %1114, 3
  %1119 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1100, float %1101, float %1102, float %1103, i32 %970, i32 %973, i32 %976, i32 %979, i32 0, i32 0)
  %1120 = extractvalue { float, float, float, float } %1119, 0
  %1121 = extractvalue { float, float, float, float } %1119, 1
  %1122 = extractvalue { float, float, float, float } %1119, 2
  %1123 = extractvalue { float, float, float, float } %1119, 3
  %1124 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1105, float %1106, float %1107, float %1108, i32 %886, i32 %889, i32 %892, i32 %895, i32 0, i32 0)
  %1125 = extractvalue { float, float, float, float } %1124, 0
  %1126 = extractvalue { float, float, float, float } %1124, 1
  %1127 = extractvalue { float, float, float, float } %1124, 2
  %1128 = extractvalue { float, float, float, float } %1124, 3
  %1129 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1110, float %1111, float %1112, float %1113, i32 %886, i32 %889, i32 %892, i32 %895, i32 0, i32 0)
  %1130 = extractvalue { float, float, float, float } %1129, 0
  %1131 = extractvalue { float, float, float, float } %1129, 1
  %1132 = extractvalue { float, float, float, float } %1129, 2
  %1133 = extractvalue { float, float, float, float } %1129, 3
  %1134 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1115, float %1116, float %1117, float %1118, i32 %982, i32 %985, i32 %988, i32 %991, i32 0, i32 0)
  %1135 = extractvalue { float, float, float, float } %1134, 0
  %1136 = extractvalue { float, float, float, float } %1134, 1
  %1137 = extractvalue { float, float, float, float } %1134, 2
  %1138 = extractvalue { float, float, float, float } %1134, 3
  %1139 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1120, float %1121, float %1122, float %1123, i32 %982, i32 %985, i32 %988, i32 %991, i32 0, i32 0)
  %1140 = extractvalue { float, float, float, float } %1139, 0
  %1141 = extractvalue { float, float, float, float } %1139, 1
  %1142 = extractvalue { float, float, float, float } %1139, 2
  %1143 = extractvalue { float, float, float, float } %1139, 3
  %1144 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1125, float %1126, float %1127, float %1128, i32 %898, i32 %901, i32 %904, i32 %907, i32 0, i32 0)
  %1145 = extractvalue { float, float, float, float } %1144, 0
  %1146 = extractvalue { float, float, float, float } %1144, 1
  %1147 = extractvalue { float, float, float, float } %1144, 2
  %1148 = extractvalue { float, float, float, float } %1144, 3
  %1149 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1130, float %1131, float %1132, float %1133, i32 %898, i32 %901, i32 %904, i32 %907, i32 0, i32 0)
  %1150 = extractvalue { float, float, float, float } %1149, 0
  %1151 = extractvalue { float, float, float, float } %1149, 1
  %1152 = extractvalue { float, float, float, float } %1149, 2
  %1153 = extractvalue { float, float, float, float } %1149, 3
  %1154 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1135, float %1136, float %1137, float %1138, i32 %994, i32 %997, i32 %1000, i32 %1003, i32 0, i32 0)
  %1155 = extractvalue { float, float, float, float } %1154, 0
  %1156 = extractvalue { float, float, float, float } %1154, 1
  %1157 = extractvalue { float, float, float, float } %1154, 2
  %1158 = extractvalue { float, float, float, float } %1154, 3
  %1159 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1140, float %1141, float %1142, float %1143, i32 %994, i32 %997, i32 %1000, i32 %1003, i32 0, i32 0)
  %1160 = extractvalue { float, float, float, float } %1159, 0
  %1161 = extractvalue { float, float, float, float } %1159, 1
  %1162 = extractvalue { float, float, float, float } %1159, 2
  %1163 = extractvalue { float, float, float, float } %1159, 3
  %1164 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1145, float %1146, float %1147, float %1148, i32 %910, i32 %913, i32 %916, i32 %919, i32 0, i32 0)
  %1165 = extractvalue { float, float, float, float } %1164, 0
  %1166 = extractvalue { float, float, float, float } %1164, 1
  %1167 = extractvalue { float, float, float, float } %1164, 2
  %1168 = extractvalue { float, float, float, float } %1164, 3
  %1169 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1150, float %1151, float %1152, float %1153, i32 %910, i32 %913, i32 %916, i32 %919, i32 0, i32 0)
  %1170 = extractvalue { float, float, float, float } %1169, 0
  %1171 = extractvalue { float, float, float, float } %1169, 1
  %1172 = extractvalue { float, float, float, float } %1169, 2
  %1173 = extractvalue { float, float, float, float } %1169, 3
  %1174 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1155, float %1156, float %1157, float %1158, i32 %1006, i32 %1009, i32 %1012, i32 %1015, i32 0, i32 0)
  %1175 = extractvalue { float, float, float, float } %1174, 0
  %1176 = extractvalue { float, float, float, float } %1174, 1
  %1177 = extractvalue { float, float, float, float } %1174, 2
  %1178 = extractvalue { float, float, float, float } %1174, 3
  %1179 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1160, float %1161, float %1162, float %1163, i32 %1006, i32 %1009, i32 %1012, i32 %1015, i32 0, i32 0)
  %1180 = extractvalue { float, float, float, float } %1179, 0
  %1181 = extractvalue { float, float, float, float } %1179, 1
  %1182 = extractvalue { float, float, float, float } %1179, 2
  %1183 = extractvalue { float, float, float, float } %1179, 3
  %1184 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1165, float %1166, float %1167, float %1168, i32 %922, i32 %925, i32 %928, i32 %931, i32 0, i32 0)
  %1185 = extractvalue { float, float, float, float } %1184, 0
  %1186 = extractvalue { float, float, float, float } %1184, 1
  %1187 = extractvalue { float, float, float, float } %1184, 2
  %1188 = extractvalue { float, float, float, float } %1184, 3
  %1189 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1170, float %1171, float %1172, float %1173, i32 %922, i32 %925, i32 %928, i32 %931, i32 0, i32 0)
  %1190 = extractvalue { float, float, float, float } %1189, 0
  %1191 = extractvalue { float, float, float, float } %1189, 1
  %1192 = extractvalue { float, float, float, float } %1189, 2
  %1193 = extractvalue { float, float, float, float } %1189, 3
  %1194 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1175, float %1176, float %1177, float %1178, i32 %1018, i32 %1021, i32 %1024, i32 %1027, i32 0, i32 0)
  %1195 = extractvalue { float, float, float, float } %1194, 0
  %1196 = extractvalue { float, float, float, float } %1194, 1
  %1197 = extractvalue { float, float, float, float } %1194, 2
  %1198 = extractvalue { float, float, float, float } %1194, 3
  %1199 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1180, float %1181, float %1182, float %1183, i32 %1018, i32 %1021, i32 %1024, i32 %1027, i32 0, i32 0)
  %1200 = extractvalue { float, float, float, float } %1199, 0
  %1201 = extractvalue { float, float, float, float } %1199, 1
  %1202 = extractvalue { float, float, float, float } %1199, 2
  %1203 = extractvalue { float, float, float, float } %1199, 3
  %1204 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %1185, 0
  %1205 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1204, float %1186, 1
  %1206 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1205, float %1187, 2
  %1207 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1206, float %1188, 3
  %1208 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1207, float %1190, 4
  %1209 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1208, float %1191, 5
  %1210 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1209, float %1192, 6
  %1211 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1210, float %1193, 7
  %1212 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1211, float %1195, 8
  %1213 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1212, float %1196, 9
  %1214 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1213, float %1197, 10
  %1215 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1214, float %1198, 11
  %1216 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1215, float %1200, 12
  %1217 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1216, float %1201, 13
  %1218 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1217, float %1202, 14
  %1219 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1218, float %1203, 15
  %1220 = add i64 %404, 128
  %1221 = add i32 %406, 1
  %1222 = icmp slt i32 %1221, 3
  %1223 = select i1 %1222, i32 %1221, i32 0
  %1224 = add i64 %1220, %112
  %1225 = add i64 %129, %1224
  %1226 = add i64 %130, %1224
  %1227 = add i64 %131, %1224
  %1228 = add i64 %132, %1224
  %1229 = add i64 %133, %1224
  %1230 = add i64 %134, %1224
  %1231 = add i64 %135, %1224
  %1232 = add i64 %136, %1224
  %1233 = add i64 %137, %1224
  %1234 = add i64 %138, %1224
  %1235 = add i64 %139, %1224
  %1236 = add i64 %140, %1224
  %1237 = add i64 %141, %1224
  %1238 = add i64 %142, %1224
  %1239 = add i64 %143, %1224
  %1240 = add i64 %144, %1224
  %1241 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1225
  %1242 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1226
  %1243 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1227
  %1244 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1228
  %1245 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1229
  %1246 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1230
  %1247 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1231
  %1248 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1232
  %1249 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1233
  %1250 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1234
  %1251 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1235
  %1252 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1236
  %1253 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1237
  %1254 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1238
  %1255 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1239
  %1256 = getelementptr bfloat, ptr addrspace(1) %23, i64 %1240
  %1257 = mul i32 %1223, 16384
  %1258 = add i32 %1257, 0
  %1259 = add i32 %1258, 0
  %1260 = add i32 %1259, 0
  %1261 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1260
  call void @llvm.nvvm.barrier0()
  %1262 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %182
  %1263 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %190
  %1264 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %198
  %1265 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %206
  %1266 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %214
  %1267 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %222
  %1268 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %230
  %1269 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %238
  %1270 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %246
  %1271 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %254
  %1272 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %262
  %1273 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %270
  %1274 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %278
  %1275 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %286
  %1276 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %294
  %1277 = getelementptr inbounds bfloat, ptr addrspace(3) %1261, i32 %302
  %1278 = select i1 %411, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1262, ptr addrspace(1) %1241, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1263, ptr addrspace(1) %1242, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1264, ptr addrspace(1) %1243, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1265, ptr addrspace(1) %1244, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1266, ptr addrspace(1) %1245, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1267, ptr addrspace(1) %1246, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1268, ptr addrspace(1) %1247, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1269, ptr addrspace(1) %1248, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1270, ptr addrspace(1) %1249, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1271, ptr addrspace(1) %1250, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1272, ptr addrspace(1) %1251, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1273, ptr addrspace(1) %1252, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1274, ptr addrspace(1) %1253, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1275, ptr addrspace(1) %1254, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1276, ptr addrspace(1) %1255, i32 %1278)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1277, ptr addrspace(1) %1256, i32 %1278)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %1279 = add i32 %407, 1
  %1280 = icmp slt i32 %1279, 3
  %1281 = select i1 %1280, i32 %1279, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %1282 = mul i32 %1281, 16384
  %1283 = add i32 %1282, 0
  %1284 = add i32 %1283, 0
  %1285 = add i32 %1284, 0
  %1286 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1285
  %1287 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %1286, 0
  %1288 = insertvalue { ptr addrspace(3), i32, i32 } %1287, i32 0, 1
  %1289 = insertvalue { ptr addrspace(3), i32, i32 } %1288, i32 0, 2
  %1290 = add i32 %403, 128
  br label %402

1291:                                             ; preds = %402
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %1292 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 0
  %1293 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 1
  %1294 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 2
  %1295 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 3
  %1296 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 4
  %1297 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 5
  %1298 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 6
  %1299 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 7
  %1300 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 8
  %1301 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 9
  %1302 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 10
  %1303 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 11
  %1304 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 12
  %1305 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 13
  %1306 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 14
  %1307 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %405, 15
  %1308 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1292)
  %1309 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1293)
  %1310 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1294)
  %1311 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1295)
  %1312 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1296)
  %1313 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1297)
  %1314 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1298)
  %1315 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1299)
  %1316 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1300)
  %1317 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1301)
  %1318 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1302)
  %1319 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1303)
  %1320 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1304)
  %1321 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1305)
  %1322 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1306)
  %1323 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1307)
  %1324 = mul i32 %16, 16
  %1325 = sext i32 %17 to i64
  %1326 = sext i32 %1324 to i64
  %1327 = add i64 %1325, %112
  %1328 = add i64 %1326, %96
  %1329 = add i64 %1326, %97
  %1330 = mul i64 %1328, 4096
  %1331 = mul i64 %1329, 4096
  %1332 = add i64 %1327, %1330
  %1333 = add i64 %1327, %1331
  %1334 = getelementptr bfloat, ptr addrspace(1) %5, i64 %1332
  %1335 = getelementptr bfloat, ptr addrspace(1) %5, i64 %1333
  %1336 = select i1 %79, i32 0, i32 256
  %1337 = xor i32 0, %1336
  %1338 = select i1 %83, i32 0, i32 512
  %1339 = xor i32 %1337, %1338
  %1340 = select i1 %87, i32 0, i32 1
  %1341 = xor i32 %1339, %1340
  %1342 = select i1 %91, i32 0, i32 2
  %1343 = xor i32 %1341, %1342
  %1344 = select i1 %35, i32 0, i32 4
  %1345 = xor i32 %1343, %1344
  %1346 = select i1 %39, i32 0, i32 16
  %1347 = xor i32 %1345, %1346
  %1348 = select i1 %43, i32 0, i32 32
  %1349 = xor i32 %1347, %1348
  %1350 = select i1 %35, i32 0, i32 128
  %1351 = xor i32 %93, %1350
  %1352 = select i1 %39, i32 0, i32 256
  %1353 = xor i32 %1351, %1352
  %1354 = select i1 %43, i32 0, i32 512
  %1355 = xor i32 %1353, %1354
  %1356 = xor i32 %1349, 0
  %1357 = lshr i32 %1356, 7
  %1358 = shl i32 %1357, 3
  %1359 = add i32 %1358, %1356
  %1360 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1359
  %1361 = insertelement <1 x bfloat> undef, bfloat %1308, i32 0
  %1362 = extractelement <1 x bfloat> %1361, i32 0
  %1363 = bitcast bfloat %1362 to i16
  %1364 = insertelement <1 x i16> undef, i16 %1363, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1360, <1 x i16> %1364, i1 true)
  %1365 = xor i32 %1349, 128
  %1366 = lshr i32 %1365, 7
  %1367 = shl i32 %1366, 3
  %1368 = add i32 %1367, %1365
  %1369 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1368
  %1370 = insertelement <1 x bfloat> undef, bfloat %1309, i32 0
  %1371 = extractelement <1 x bfloat> %1370, i32 0
  %1372 = bitcast bfloat %1371 to i16
  %1373 = insertelement <1 x i16> undef, i16 %1372, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1369, <1 x i16> %1373, i1 true)
  %1374 = xor i32 %1349, 8
  %1375 = lshr i32 %1374, 7
  %1376 = shl i32 %1375, 3
  %1377 = add i32 %1376, %1374
  %1378 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1377
  %1379 = insertelement <1 x bfloat> undef, bfloat %1310, i32 0
  %1380 = extractelement <1 x bfloat> %1379, i32 0
  %1381 = bitcast bfloat %1380 to i16
  %1382 = insertelement <1 x i16> undef, i16 %1381, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1378, <1 x i16> %1382, i1 true)
  %1383 = xor i32 %1349, 136
  %1384 = lshr i32 %1383, 7
  %1385 = shl i32 %1384, 3
  %1386 = add i32 %1385, %1383
  %1387 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1386
  %1388 = insertelement <1 x bfloat> undef, bfloat %1311, i32 0
  %1389 = extractelement <1 x bfloat> %1388, i32 0
  %1390 = bitcast bfloat %1389 to i16
  %1391 = insertelement <1 x i16> undef, i16 %1390, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1387, <1 x i16> %1391, i1 true)
  %1392 = xor i32 %1349, 64
  %1393 = lshr i32 %1392, 7
  %1394 = shl i32 %1393, 3
  %1395 = add i32 %1394, %1392
  %1396 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1395
  %1397 = insertelement <1 x bfloat> undef, bfloat %1316, i32 0
  %1398 = extractelement <1 x bfloat> %1397, i32 0
  %1399 = bitcast bfloat %1398 to i16
  %1400 = insertelement <1 x i16> undef, i16 %1399, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1396, <1 x i16> %1400, i1 true)
  %1401 = xor i32 %1349, 192
  %1402 = lshr i32 %1401, 7
  %1403 = shl i32 %1402, 3
  %1404 = add i32 %1403, %1401
  %1405 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1404
  %1406 = insertelement <1 x bfloat> undef, bfloat %1317, i32 0
  %1407 = extractelement <1 x bfloat> %1406, i32 0
  %1408 = bitcast bfloat %1407 to i16
  %1409 = insertelement <1 x i16> undef, i16 %1408, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1405, <1 x i16> %1409, i1 true)
  %1410 = xor i32 %1349, 72
  %1411 = lshr i32 %1410, 7
  %1412 = shl i32 %1411, 3
  %1413 = add i32 %1412, %1410
  %1414 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1413
  %1415 = insertelement <1 x bfloat> undef, bfloat %1318, i32 0
  %1416 = extractelement <1 x bfloat> %1415, i32 0
  %1417 = bitcast bfloat %1416 to i16
  %1418 = insertelement <1 x i16> undef, i16 %1417, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1414, <1 x i16> %1418, i1 true)
  %1419 = xor i32 %1349, 200
  %1420 = lshr i32 %1419, 7
  %1421 = shl i32 %1420, 3
  %1422 = add i32 %1421, %1419
  %1423 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1422
  %1424 = insertelement <1 x bfloat> undef, bfloat %1319, i32 0
  %1425 = extractelement <1 x bfloat> %1424, i32 0
  %1426 = bitcast bfloat %1425 to i16
  %1427 = insertelement <1 x i16> undef, i16 %1426, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1423, <1 x i16> %1427, i1 true)
  call void @llvm.nvvm.barrier0()
  %1428 = xor i32 %1355, 0
  %1429 = lshr i32 %1428, 7
  %1430 = shl i32 %1429, 3
  %1431 = add i32 %1430, %1428
  %1432 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1431
  %1433 = load <4 x i32>, ptr addrspace(3) %1432, align 16
  %1434 = extractelement <4 x i32> %1433, i32 0
  %1435 = extractelement <4 x i32> %1433, i32 1
  %1436 = extractelement <4 x i32> %1433, i32 2
  %1437 = extractelement <4 x i32> %1433, i32 3
  %1438 = insertelement <4 x i32> undef, i32 %1434, i32 0
  %1439 = insertelement <4 x i32> %1438, i32 %1435, i32 1
  %1440 = insertelement <4 x i32> %1439, i32 %1436, i32 2
  %1441 = insertelement <4 x i32> %1440, i32 %1437, i32 3
  %1442 = extractelement <4 x i32> %1441, i32 0
  %1443 = extractelement <4 x i32> %1441, i32 1
  %1444 = extractelement <4 x i32> %1441, i32 2
  %1445 = extractelement <4 x i32> %1441, i32 3
  %1446 = bitcast i32 %1442 to <2 x i16>
  %1447 = extractelement <2 x i16> %1446, i32 0
  %1448 = extractelement <2 x i16> %1446, i32 1
  %1449 = bitcast i32 %1443 to <2 x i16>
  %1450 = extractelement <2 x i16> %1449, i32 0
  %1451 = extractelement <2 x i16> %1449, i32 1
  %1452 = bitcast i32 %1444 to <2 x i16>
  %1453 = extractelement <2 x i16> %1452, i32 0
  %1454 = extractelement <2 x i16> %1452, i32 1
  %1455 = bitcast i32 %1445 to <2 x i16>
  %1456 = extractelement <2 x i16> %1455, i32 0
  %1457 = extractelement <2 x i16> %1455, i32 1
  %1458 = insertelement <8 x i16> undef, i16 %1447, i32 0
  %1459 = insertelement <8 x i16> %1458, i16 %1448, i32 1
  %1460 = insertelement <8 x i16> %1459, i16 %1450, i32 2
  %1461 = insertelement <8 x i16> %1460, i16 %1451, i32 3
  %1462 = insertelement <8 x i16> %1461, i16 %1453, i32 4
  %1463 = insertelement <8 x i16> %1462, i16 %1454, i32 5
  %1464 = insertelement <8 x i16> %1463, i16 %1456, i32 6
  %1465 = insertelement <8 x i16> %1464, i16 %1457, i32 7
  %1466 = extractelement <8 x i16> %1465, i32 0
  %1467 = extractelement <8 x i16> %1465, i32 1
  %1468 = extractelement <8 x i16> %1465, i32 2
  %1469 = extractelement <8 x i16> %1465, i32 3
  %1470 = extractelement <8 x i16> %1465, i32 4
  %1471 = extractelement <8 x i16> %1465, i32 5
  %1472 = extractelement <8 x i16> %1465, i32 6
  %1473 = extractelement <8 x i16> %1465, i32 7
  %1474 = bitcast i16 %1466 to bfloat
  %1475 = bitcast i16 %1467 to bfloat
  %1476 = bitcast i16 %1468 to bfloat
  %1477 = bitcast i16 %1469 to bfloat
  %1478 = bitcast i16 %1470 to bfloat
  %1479 = bitcast i16 %1471 to bfloat
  %1480 = bitcast i16 %1472 to bfloat
  %1481 = bitcast i16 %1473 to bfloat
  %1482 = insertelement <8 x bfloat> undef, bfloat %1474, i32 0
  %1483 = insertelement <8 x bfloat> %1482, bfloat %1475, i32 1
  %1484 = insertelement <8 x bfloat> %1483, bfloat %1476, i32 2
  %1485 = insertelement <8 x bfloat> %1484, bfloat %1477, i32 3
  %1486 = insertelement <8 x bfloat> %1485, bfloat %1478, i32 4
  %1487 = insertelement <8 x bfloat> %1486, bfloat %1479, i32 5
  %1488 = insertelement <8 x bfloat> %1487, bfloat %1480, i32 6
  %1489 = insertelement <8 x bfloat> %1488, bfloat %1481, i32 7
  %1490 = extractelement <8 x bfloat> %1489, i32 0
  %1491 = extractelement <8 x bfloat> %1489, i32 1
  %1492 = extractelement <8 x bfloat> %1489, i32 2
  %1493 = extractelement <8 x bfloat> %1489, i32 3
  %1494 = extractelement <8 x bfloat> %1489, i32 4
  %1495 = extractelement <8 x bfloat> %1489, i32 5
  %1496 = extractelement <8 x bfloat> %1489, i32 6
  %1497 = extractelement <8 x bfloat> %1489, i32 7
  call void @llvm.nvvm.barrier0()
  %1498 = insertelement <1 x bfloat> undef, bfloat %1312, i32 0
  %1499 = extractelement <1 x bfloat> %1498, i32 0
  %1500 = bitcast bfloat %1499 to i16
  %1501 = insertelement <1 x i16> undef, i16 %1500, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1360, <1 x i16> %1501, i1 true)
  %1502 = insertelement <1 x bfloat> undef, bfloat %1313, i32 0
  %1503 = extractelement <1 x bfloat> %1502, i32 0
  %1504 = bitcast bfloat %1503 to i16
  %1505 = insertelement <1 x i16> undef, i16 %1504, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1369, <1 x i16> %1505, i1 true)
  %1506 = insertelement <1 x bfloat> undef, bfloat %1314, i32 0
  %1507 = extractelement <1 x bfloat> %1506, i32 0
  %1508 = bitcast bfloat %1507 to i16
  %1509 = insertelement <1 x i16> undef, i16 %1508, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1378, <1 x i16> %1509, i1 true)
  %1510 = insertelement <1 x bfloat> undef, bfloat %1315, i32 0
  %1511 = extractelement <1 x bfloat> %1510, i32 0
  %1512 = bitcast bfloat %1511 to i16
  %1513 = insertelement <1 x i16> undef, i16 %1512, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1387, <1 x i16> %1513, i1 true)
  %1514 = insertelement <1 x bfloat> undef, bfloat %1320, i32 0
  %1515 = extractelement <1 x bfloat> %1514, i32 0
  %1516 = bitcast bfloat %1515 to i16
  %1517 = insertelement <1 x i16> undef, i16 %1516, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1396, <1 x i16> %1517, i1 true)
  %1518 = insertelement <1 x bfloat> undef, bfloat %1321, i32 0
  %1519 = extractelement <1 x bfloat> %1518, i32 0
  %1520 = bitcast bfloat %1519 to i16
  %1521 = insertelement <1 x i16> undef, i16 %1520, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1405, <1 x i16> %1521, i1 true)
  %1522 = insertelement <1 x bfloat> undef, bfloat %1322, i32 0
  %1523 = extractelement <1 x bfloat> %1522, i32 0
  %1524 = bitcast bfloat %1523 to i16
  %1525 = insertelement <1 x i16> undef, i16 %1524, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1414, <1 x i16> %1525, i1 true)
  %1526 = insertelement <1 x bfloat> undef, bfloat %1323, i32 0
  %1527 = extractelement <1 x bfloat> %1526, i32 0
  %1528 = bitcast bfloat %1527 to i16
  %1529 = insertelement <1 x i16> undef, i16 %1528, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1423, <1 x i16> %1529, i1 true)
  call void @llvm.nvvm.barrier0()
  %1530 = load <4 x i32>, ptr addrspace(3) %1432, align 16
  %1531 = extractelement <4 x i32> %1530, i32 0
  %1532 = extractelement <4 x i32> %1530, i32 1
  %1533 = extractelement <4 x i32> %1530, i32 2
  %1534 = extractelement <4 x i32> %1530, i32 3
  %1535 = insertelement <4 x i32> undef, i32 %1531, i32 0
  %1536 = insertelement <4 x i32> %1535, i32 %1532, i32 1
  %1537 = insertelement <4 x i32> %1536, i32 %1533, i32 2
  %1538 = insertelement <4 x i32> %1537, i32 %1534, i32 3
  %1539 = extractelement <4 x i32> %1538, i32 0
  %1540 = extractelement <4 x i32> %1538, i32 1
  %1541 = extractelement <4 x i32> %1538, i32 2
  %1542 = extractelement <4 x i32> %1538, i32 3
  %1543 = bitcast i32 %1539 to <2 x i16>
  %1544 = extractelement <2 x i16> %1543, i32 0
  %1545 = extractelement <2 x i16> %1543, i32 1
  %1546 = bitcast i32 %1540 to <2 x i16>
  %1547 = extractelement <2 x i16> %1546, i32 0
  %1548 = extractelement <2 x i16> %1546, i32 1
  %1549 = bitcast i32 %1541 to <2 x i16>
  %1550 = extractelement <2 x i16> %1549, i32 0
  %1551 = extractelement <2 x i16> %1549, i32 1
  %1552 = bitcast i32 %1542 to <2 x i16>
  %1553 = extractelement <2 x i16> %1552, i32 0
  %1554 = extractelement <2 x i16> %1552, i32 1
  %1555 = insertelement <8 x i16> undef, i16 %1544, i32 0
  %1556 = insertelement <8 x i16> %1555, i16 %1545, i32 1
  %1557 = insertelement <8 x i16> %1556, i16 %1547, i32 2
  %1558 = insertelement <8 x i16> %1557, i16 %1548, i32 3
  %1559 = insertelement <8 x i16> %1558, i16 %1550, i32 4
  %1560 = insertelement <8 x i16> %1559, i16 %1551, i32 5
  %1561 = insertelement <8 x i16> %1560, i16 %1553, i32 6
  %1562 = insertelement <8 x i16> %1561, i16 %1554, i32 7
  %1563 = extractelement <8 x i16> %1562, i32 0
  %1564 = extractelement <8 x i16> %1562, i32 1
  %1565 = extractelement <8 x i16> %1562, i32 2
  %1566 = extractelement <8 x i16> %1562, i32 3
  %1567 = extractelement <8 x i16> %1562, i32 4
  %1568 = extractelement <8 x i16> %1562, i32 5
  %1569 = extractelement <8 x i16> %1562, i32 6
  %1570 = extractelement <8 x i16> %1562, i32 7
  %1571 = bitcast i16 %1563 to bfloat
  %1572 = bitcast i16 %1564 to bfloat
  %1573 = bitcast i16 %1565 to bfloat
  %1574 = bitcast i16 %1566 to bfloat
  %1575 = bitcast i16 %1567 to bfloat
  %1576 = bitcast i16 %1568 to bfloat
  %1577 = bitcast i16 %1569 to bfloat
  %1578 = bitcast i16 %1570 to bfloat
  %1579 = insertelement <8 x bfloat> undef, bfloat %1571, i32 0
  %1580 = insertelement <8 x bfloat> %1579, bfloat %1572, i32 1
  %1581 = insertelement <8 x bfloat> %1580, bfloat %1573, i32 2
  %1582 = insertelement <8 x bfloat> %1581, bfloat %1574, i32 3
  %1583 = insertelement <8 x bfloat> %1582, bfloat %1575, i32 4
  %1584 = insertelement <8 x bfloat> %1583, bfloat %1576, i32 5
  %1585 = insertelement <8 x bfloat> %1584, bfloat %1577, i32 6
  %1586 = insertelement <8 x bfloat> %1585, bfloat %1578, i32 7
  %1587 = extractelement <8 x bfloat> %1586, i32 0
  %1588 = extractelement <8 x bfloat> %1586, i32 1
  %1589 = extractelement <8 x bfloat> %1586, i32 2
  %1590 = extractelement <8 x bfloat> %1586, i32 3
  %1591 = extractelement <8 x bfloat> %1586, i32 4
  %1592 = extractelement <8 x bfloat> %1586, i32 5
  %1593 = extractelement <8 x bfloat> %1586, i32 6
  %1594 = extractelement <8 x bfloat> %1586, i32 7
  %1595 = insertelement <2 x bfloat> undef, bfloat %1490, i32 0
  %1596 = insertelement <2 x bfloat> %1595, bfloat %1491, i32 1
  %1597 = bitcast <2 x bfloat> %1596 to i32
  %1598 = insertelement <2 x bfloat> undef, bfloat %1492, i32 0
  %1599 = insertelement <2 x bfloat> %1598, bfloat %1493, i32 1
  %1600 = bitcast <2 x bfloat> %1599 to i32
  %1601 = insertelement <2 x bfloat> undef, bfloat %1494, i32 0
  %1602 = insertelement <2 x bfloat> %1601, bfloat %1495, i32 1
  %1603 = bitcast <2 x bfloat> %1602 to i32
  %1604 = insertelement <2 x bfloat> undef, bfloat %1496, i32 0
  %1605 = insertelement <2 x bfloat> %1604, bfloat %1497, i32 1
  %1606 = bitcast <2 x bfloat> %1605 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1597, i32 %1600, i32 %1603, i32 %1606, ptr addrspace(1) %1334)
  %1607 = insertelement <2 x bfloat> undef, bfloat %1587, i32 0
  %1608 = insertelement <2 x bfloat> %1607, bfloat %1588, i32 1
  %1609 = bitcast <2 x bfloat> %1608 to i32
  %1610 = insertelement <2 x bfloat> undef, bfloat %1589, i32 0
  %1611 = insertelement <2 x bfloat> %1610, bfloat %1590, i32 1
  %1612 = bitcast <2 x bfloat> %1611 to i32
  %1613 = insertelement <2 x bfloat> undef, bfloat %1591, i32 0
  %1614 = insertelement <2 x bfloat> %1613, bfloat %1592, i32 1
  %1615 = bitcast <2 x bfloat> %1614 to i32
  %1616 = insertelement <2 x bfloat> undef, bfloat %1593, i32 0
  %1617 = insertelement <2 x bfloat> %1616, bfloat %1594, i32 1
  %1618 = bitcast <2 x bfloat> %1617 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1609, i32 %1612, i32 %1615, i32 %1618, ptr addrspace(1) %1335)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_64_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_64(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = udiv i64 %8, 4
  %10 = urem i64 %8, 4
  %11 = mul i64 %10, 256
  %12 = mul i64 %9, 4096
  %13 = add i64 %11, %12
  %14 = add i64 %13, 3072
  %15 = getelementptr bfloat, ptr addrspace(1) %3, i64 %14
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = urem i32 %16, 32
  %18 = udiv i32 %16, 32
  %19 = and i32 %17, 1
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 0, i32 4
  %22 = xor i32 0, %21
  %23 = and i32 %17, 2
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 0, i32 8
  %26 = xor i32 %22, %25
  %27 = and i32 %17, 4
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 0, i32 16
  %30 = xor i32 %26, %29
  %31 = and i32 %17, 8
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %32, i32 0, i32 32
  %34 = xor i32 %30, %33
  %35 = and i32 %17, 16
  %36 = icmp eq i32 %35, 0
  %37 = select i1 %36, i32 0, i32 64
  %38 = xor i32 %34, %37
  %39 = and i32 %18, 1
  %40 = icmp eq i32 %39, 0
  %41 = select i1 %40, i32 0, i32 128
  %42 = xor i32 %38, %41
  %43 = xor i32 %42, 0
  %44 = add i32 %43, 0
  %45 = sext i32 %44 to i64
  %46 = getelementptr bfloat, ptr addrspace(1) %15, i64 %45
  %47 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %46)
  %48 = extractvalue { i32, i32 } %47, 0
  %49 = bitcast i32 %48 to <2 x bfloat>
  %50 = extractvalue { i32, i32 } %47, 1
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractelement <2 x bfloat> %49, i32 0
  %53 = extractelement <2 x bfloat> %49, i32 1
  %54 = extractelement <2 x bfloat> %51, i32 0
  %55 = extractelement <2 x bfloat> %51, i32 1
  %56 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52)
  %57 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53)
  %58 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54)
  %59 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %60 = mul i64 %8, 256
  %61 = getelementptr bfloat, ptr addrspace(1) %2, i64 %60
  %62 = getelementptr bfloat, ptr addrspace(1) %61, i64 %45
  %63 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %62)
  %64 = extractvalue { i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractelement <2 x bfloat> %65, i32 0
  %69 = extractelement <2 x bfloat> %65, i32 1
  %70 = extractelement <2 x bfloat> %67, i32 0
  %71 = extractelement <2 x bfloat> %67, i32 1
  %72 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %73 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %74 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %75 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %76 = fadd float %56, %72
  %77 = fadd float %57, %73
  %78 = fadd float %58, %74
  %79 = fadd float %59, %75
  %80 = add i64 %12, 3072
  %81 = getelementptr bfloat, ptr addrspace(1) %3, i64 %80
  %82 = select i1 %20, i32 0, i32 8
  %83 = xor i32 0, %82
  %84 = select i1 %24, i32 0, i32 16
  %85 = xor i32 %83, %84
  %86 = select i1 %28, i32 0, i32 32
  %87 = xor i32 %85, %86
  %88 = select i1 %32, i32 0, i32 64
  %89 = xor i32 %87, %88
  %90 = select i1 %36, i32 0, i32 128
  %91 = xor i32 %89, %90
  %92 = select i1 %40, i32 0, i32 256
  %93 = xor i32 %91, %92
  %94 = xor i32 %93, 0
  %95 = xor i32 %93, 512
  %96 = add i32 %94, 0
  %97 = add i32 %95, 0
  %98 = sext i32 %96 to i64
  %99 = sext i32 %97 to i64
  %100 = getelementptr bfloat, ptr addrspace(1) %81, i64 %98
  %101 = getelementptr bfloat, ptr addrspace(1) %81, i64 %99
  %102 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %100)
  %103 = extractvalue { i32, i32, i32, i32 } %102, 0
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractvalue { i32, i32, i32, i32 } %102, 1
  %106 = bitcast i32 %105 to <2 x bfloat>
  %107 = extractvalue { i32, i32, i32, i32 } %102, 2
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractvalue { i32, i32, i32, i32 } %102, 3
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractelement <2 x bfloat> %104, i32 0
  %112 = extractelement <2 x bfloat> %104, i32 1
  %113 = extractelement <2 x bfloat> %106, i32 0
  %114 = extractelement <2 x bfloat> %106, i32 1
  %115 = extractelement <2 x bfloat> %108, i32 0
  %116 = extractelement <2 x bfloat> %108, i32 1
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %101)
  %120 = extractvalue { i32, i32, i32, i32 } %119, 0
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractvalue { i32, i32, i32, i32 } %119, 1
  %123 = bitcast i32 %122 to <2 x bfloat>
  %124 = extractvalue { i32, i32, i32, i32 } %119, 2
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractvalue { i32, i32, i32, i32 } %119, 3
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractelement <2 x bfloat> %121, i32 0
  %129 = extractelement <2 x bfloat> %121, i32 1
  %130 = extractelement <2 x bfloat> %123, i32 0
  %131 = extractelement <2 x bfloat> %123, i32 1
  %132 = extractelement <2 x bfloat> %125, i32 0
  %133 = extractelement <2 x bfloat> %125, i32 1
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = mul i64 %9, 1024
  %153 = getelementptr bfloat, ptr addrspace(1) %2, i64 %152
  %154 = getelementptr bfloat, ptr addrspace(1) %153, i64 %98
  %155 = getelementptr bfloat, ptr addrspace(1) %153, i64 %99
  %156 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %154)
  %157 = extractvalue { i32, i32, i32, i32 } %156, 0
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractvalue { i32, i32, i32, i32 } %156, 1
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractvalue { i32, i32, i32, i32 } %156, 2
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractvalue { i32, i32, i32, i32 } %156, 3
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractelement <2 x bfloat> %158, i32 0
  %166 = extractelement <2 x bfloat> %158, i32 1
  %167 = extractelement <2 x bfloat> %160, i32 0
  %168 = extractelement <2 x bfloat> %160, i32 1
  %169 = extractelement <2 x bfloat> %162, i32 0
  %170 = extractelement <2 x bfloat> %162, i32 1
  %171 = extractelement <2 x bfloat> %164, i32 0
  %172 = extractelement <2 x bfloat> %164, i32 1
  %173 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %155)
  %174 = extractvalue { i32, i32, i32, i32 } %173, 0
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %173, 1
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractvalue { i32, i32, i32, i32 } %173, 2
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractvalue { i32, i32, i32, i32 } %173, 3
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractelement <2 x bfloat> %175, i32 0
  %183 = extractelement <2 x bfloat> %175, i32 1
  %184 = extractelement <2 x bfloat> %177, i32 0
  %185 = extractelement <2 x bfloat> %177, i32 1
  %186 = extractelement <2 x bfloat> %179, i32 0
  %187 = extractelement <2 x bfloat> %179, i32 1
  %188 = extractelement <2 x bfloat> %181, i32 0
  %189 = extractelement <2 x bfloat> %181, i32 1
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = fadd float %136, %190
  %207 = fadd float %137, %191
  %208 = fadd float %138, %192
  %209 = fadd float %139, %193
  %210 = fadd float %140, %194
  %211 = fadd float %141, %195
  %212 = fadd float %142, %196
  %213 = fadd float %143, %197
  %214 = fadd float %144, %198
  %215 = fadd float %145, %199
  %216 = fadd float %146, %200
  %217 = fadd float %147, %201
  %218 = fadd float %148, %202
  %219 = fadd float %149, %203
  %220 = fadd float %150, %204
  %221 = fadd float %151, %205
  %222 = fmul float %206, %206
  %223 = fmul float %207, %207
  %224 = fmul float %208, %208
  %225 = fmul float %209, %209
  %226 = fmul float %210, %210
  %227 = fmul float %211, %211
  %228 = fmul float %212, %212
  %229 = fmul float %213, %213
  %230 = fmul float %214, %214
  %231 = fmul float %215, %215
  %232 = fmul float %216, %216
  %233 = fmul float %217, %217
  %234 = fmul float %218, %218
  %235 = fmul float %219, %219
  %236 = fmul float %220, %220
  %237 = fmul float %221, %221
  %238 = fadd float %222, %223
  %239 = fadd float %238, %224
  %240 = fadd float %239, %225
  %241 = fadd float %240, %226
  %242 = fadd float %241, %227
  %243 = fadd float %242, %228
  %244 = fadd float %243, %229
  %245 = fadd float %244, %230
  %246 = fadd float %245, %231
  %247 = fadd float %246, %232
  %248 = fadd float %247, %233
  %249 = fadd float %248, %234
  %250 = fadd float %249, %235
  %251 = fadd float %250, %236
  %252 = fadd float %251, %237
  %253 = bitcast float %252 to i32
  %254 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 16, i32 31)
  %255 = bitcast i32 %254 to float
  %256 = fadd float %252, %255
  %257 = bitcast float %256 to i32
  %258 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %257, i32 8, i32 31)
  %259 = bitcast i32 %258 to float
  %260 = fadd float %256, %259
  %261 = bitcast float %260 to i32
  %262 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %261, i32 4, i32 31)
  %263 = bitcast i32 %262 to float
  %264 = fadd float %260, %263
  %265 = bitcast float %264 to i32
  %266 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %265, i32 2, i32 31)
  %267 = bitcast i32 %266 to float
  %268 = fadd float %264, %267
  %269 = bitcast float %268 to i32
  %270 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %269, i32 1, i32 31)
  %271 = bitcast i32 %270 to float
  %272 = fadd float %268, %271
  %273 = urem i32 %17, 32
  %274 = urem i32 %18, 2
  %275 = icmp eq i32 %273, 0
  %276 = and i1 true, %275
  %277 = add i32 0, %274
  %278 = getelementptr float, ptr addrspace(3) @global_smem, i32 %277
  %279 = insertelement <1 x float> undef, float %272, i32 0
  %280 = extractelement <1 x float> %279, i32 0
  %281 = bitcast float %280 to i32
  %282 = insertelement <1 x i32> undef, i32 %281, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %278, <1 x i32> %282, i1 %276)
  call void @llvm.nvvm.barrier0()
  %283 = icmp slt i32 %16, 2
  %284 = getelementptr float, ptr addrspace(3) @global_smem, i32 %16
  %285 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %284, i1 %283)
  %286 = insertelement <1 x i32> undef, i32 %285, i32 0
  %287 = extractelement <1 x i32> %286, i32 0
  %288 = bitcast i32 %287 to float
  %289 = insertelement <1 x float> undef, float %288, i32 0
  %290 = extractelement <1 x float> %289, i32 0
  %291 = bitcast float %290 to i32
  %292 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %291, i32 1, i32 31)
  %293 = bitcast i32 %292 to float
  %294 = fadd float %290, %293
  %295 = urem i32 %17, 2
  %296 = icmp eq i32 %295, 0
  %297 = and i1 %283, %296
  %298 = insertelement <1 x float> undef, float %294, i32 0
  %299 = extractelement <1 x float> %298, i32 0
  %300 = bitcast float %299 to i32
  %301 = insertelement <1 x i32> undef, i32 %300, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %284, <1 x i32> %301, i1 %297)
  call void @llvm.nvvm.barrier0()
  %302 = load float, ptr addrspace(3) @global_smem, align 4
  %303 = fmul float %302, 0x3F50000000000000
  %304 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %305 = bitcast i32 %304 to <1 x float>
  %306 = extractelement <1 x float> %305, i32 0
  %307 = fadd float %303, %306
  %308 = call float @__nv_rsqrtf(float %307)
  %309 = fmul float %76, %308
  %310 = fmul float %77, %308
  %311 = fmul float %78, %308
  %312 = fmul float %79, %308
  %313 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
  %314 = getelementptr bfloat, ptr addrspace(1) %313, i64 %45
  %315 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %314)
  %316 = extractvalue { i32, i32 } %315, 0
  %317 = bitcast i32 %316 to <2 x bfloat>
  %318 = extractvalue { i32, i32 } %315, 1
  %319 = bitcast i32 %318 to <2 x bfloat>
  %320 = extractelement <2 x bfloat> %317, i32 0
  %321 = extractelement <2 x bfloat> %317, i32 1
  %322 = extractelement <2 x bfloat> %319, i32 0
  %323 = extractelement <2 x bfloat> %319, i32 1
  %324 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320)
  %325 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %321)
  %326 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %322)
  %327 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %323)
  %328 = fmul float %309, %324
  %329 = fmul float %310, %325
  %330 = fmul float %311, %326
  %331 = fmul float %312, %327
  %332 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %328)
  %333 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %329)
  %334 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %330)
  %335 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %331)
  %336 = getelementptr bfloat, ptr addrspace(1) %5, i64 %60
  %337 = getelementptr bfloat, ptr addrspace(1) %336, i64 %45
  %338 = insertelement <2 x bfloat> undef, bfloat %332, i32 0
  %339 = insertelement <2 x bfloat> %338, bfloat %333, i32 1
  %340 = bitcast <2 x bfloat> %339 to i32
  %341 = insertelement <2 x bfloat> undef, bfloat %334, i32 0
  %342 = insertelement <2 x bfloat> %341, bfloat %335, i32 1
  %343 = bitcast <2 x bfloat> %342 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %340, i32 %343, ptr addrspace(1) %337)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_convert_fusion_3(ptr noalias align 128 dereferenceable(196608) %0, ptr noalias align 128 dereferenceable(98304) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_3_param_0_165(ptr %0, i32 %5, i32 %8)
  %10 = fpext bfloat %9 to float
  %11 = fneg float %10
  %12 = fptrunc float %11 to bfloat
  %13 = fpext bfloat %12 to float
  %14 = call float @__nv_fast_expf(float %13)
  %15 = fptrunc float %14 to bfloat
  %16 = fpext bfloat %15 to float
  %17 = fadd float %16, 1.000000e+00
  %18 = fdiv float 1.000000e+00, %17
  %19 = add i32 %8, 3072
  %20 = call bfloat @fused_convert_3_param_0_165(ptr %0, i32 %5, i32 %19)
  %21 = fmul float %10, %18
  %22 = fpext bfloat %20 to float
  %23 = fmul float %21, %22
  %24 = fptrunc float %23 to bfloat
  %25 = mul i32 %4, 128
  %26 = add i32 %25, %3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %26
  store bfloat %24, ptr %27, align 2
  ret void
}

define internal bfloat @fused_convert_3_param_0_165(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !2
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_62_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_62(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = udiv i64 %9, 4
  %11 = urem i64 %9, 4
  %12 = mul i64 %11, 256
  %13 = mul i64 %10, 4096
  %14 = add i64 %12, %13
  %15 = add i64 %14, 2048
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %15
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %18 = urem i32 %17, 32
  %19 = udiv i32 %17, 32
  %20 = and i32 %18, 1
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 4
  %23 = xor i32 0, %22
  %24 = and i32 %18, 2
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 8
  %27 = xor i32 %23, %26
  %28 = and i32 %18, 4
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 16
  %31 = xor i32 %27, %30
  %32 = and i32 %18, 8
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 32
  %35 = xor i32 %31, %34
  %36 = and i32 %18, 16
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 0, i32 64
  %39 = xor i32 %35, %38
  %40 = and i32 %19, 1
  %41 = icmp eq i32 %40, 0
  %42 = select i1 %41, i32 0, i32 128
  %43 = xor i32 %39, %42
  %44 = xor i32 %43, 0
  %45 = add i32 %44, 0
  %46 = sext i32 %45 to i64
  %47 = getelementptr bfloat, ptr addrspace(1) %16, i64 %46
  %48 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %47)
  %49 = extractvalue { i32, i32 } %48, 0
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractvalue { i32, i32 } %48, 1
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractelement <2 x bfloat> %50, i32 0
  %54 = extractelement <2 x bfloat> %50, i32 1
  %55 = extractelement <2 x bfloat> %52, i32 0
  %56 = extractelement <2 x bfloat> %52, i32 1
  %57 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53)
  %58 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54)
  %59 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %60 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %61 = mul i64 %9, 256
  %62 = getelementptr bfloat, ptr addrspace(1) %5, i64 %61
  %63 = getelementptr bfloat, ptr addrspace(1) %62, i64 %46
  %64 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %63)
  %65 = extractvalue { i32, i32 } %64, 0
  %66 = bitcast i32 %65 to <2 x bfloat>
  %67 = extractvalue { i32, i32 } %64, 1
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractelement <2 x bfloat> %66, i32 0
  %70 = extractelement <2 x bfloat> %66, i32 1
  %71 = extractelement <2 x bfloat> %68, i32 0
  %72 = extractelement <2 x bfloat> %68, i32 1
  %73 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %74 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %75 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %76 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72)
  %77 = add i64 %14, 3072
  %78 = getelementptr bfloat, ptr addrspace(1) %4, i64 %77
  %79 = getelementptr bfloat, ptr addrspace(1) %78, i64 %46
  %80 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %79)
  %81 = extractvalue { i32, i32 } %80, 0
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractvalue { i32, i32 } %80, 1
  %84 = bitcast i32 %83 to <2 x bfloat>
  %85 = extractelement <2 x bfloat> %82, i32 0
  %86 = extractelement <2 x bfloat> %82, i32 1
  %87 = extractelement <2 x bfloat> %84, i32 0
  %88 = extractelement <2 x bfloat> %84, i32 1
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %93 = getelementptr bfloat, ptr addrspace(1) %3, i64 %61
  %94 = getelementptr bfloat, ptr addrspace(1) %93, i64 %46
  %95 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %94)
  %96 = extractvalue { i32, i32 } %95, 0
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractvalue { i32, i32 } %95, 1
  %99 = bitcast i32 %98 to <2 x bfloat>
  %100 = extractelement <2 x bfloat> %97, i32 0
  %101 = extractelement <2 x bfloat> %97, i32 1
  %102 = extractelement <2 x bfloat> %99, i32 0
  %103 = extractelement <2 x bfloat> %99, i32 1
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100)
  %105 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101)
  %106 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102)
  %107 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103)
  %108 = fadd float %89, %104
  %109 = fadd float %90, %105
  %110 = fadd float %91, %106
  %111 = fadd float %92, %107
  %112 = fadd float %73, %108
  %113 = fadd float %74, %109
  %114 = fadd float %75, %110
  %115 = fadd float %76, %111
  %116 = fadd float %57, %112
  %117 = fadd float %58, %113
  %118 = fadd float %59, %114
  %119 = fadd float %60, %115
  %120 = add i64 %13, 2048
  %121 = getelementptr bfloat, ptr addrspace(1) %4, i64 %120
  %122 = select i1 %21, i32 0, i32 8
  %123 = xor i32 0, %122
  %124 = select i1 %25, i32 0, i32 16
  %125 = xor i32 %123, %124
  %126 = select i1 %29, i32 0, i32 32
  %127 = xor i32 %125, %126
  %128 = select i1 %33, i32 0, i32 64
  %129 = xor i32 %127, %128
  %130 = select i1 %37, i32 0, i32 128
  %131 = xor i32 %129, %130
  %132 = select i1 %41, i32 0, i32 256
  %133 = xor i32 %131, %132
  %134 = xor i32 %133, 0
  %135 = xor i32 %133, 512
  %136 = add i32 %134, 0
  %137 = add i32 %135, 0
  %138 = sext i32 %136 to i64
  %139 = sext i32 %137 to i64
  %140 = getelementptr bfloat, ptr addrspace(1) %121, i64 %138
  %141 = getelementptr bfloat, ptr addrspace(1) %121, i64 %139
  %142 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %140)
  %143 = extractvalue { i32, i32, i32, i32 } %142, 0
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractvalue { i32, i32, i32, i32 } %142, 1
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractvalue { i32, i32, i32, i32 } %142, 2
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractvalue { i32, i32, i32, i32 } %142, 3
  %150 = bitcast i32 %149 to <2 x bfloat>
  %151 = extractelement <2 x bfloat> %144, i32 0
  %152 = extractelement <2 x bfloat> %144, i32 1
  %153 = extractelement <2 x bfloat> %146, i32 0
  %154 = extractelement <2 x bfloat> %146, i32 1
  %155 = extractelement <2 x bfloat> %148, i32 0
  %156 = extractelement <2 x bfloat> %148, i32 1
  %157 = extractelement <2 x bfloat> %150, i32 0
  %158 = extractelement <2 x bfloat> %150, i32 1
  %159 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %141)
  %160 = extractvalue { i32, i32, i32, i32 } %159, 0
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %159, 1
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractvalue { i32, i32, i32, i32 } %159, 2
  %165 = bitcast i32 %164 to <2 x bfloat>
  %166 = extractvalue { i32, i32, i32, i32 } %159, 3
  %167 = bitcast i32 %166 to <2 x bfloat>
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = extractelement <2 x bfloat> %165, i32 0
  %173 = extractelement <2 x bfloat> %165, i32 1
  %174 = extractelement <2 x bfloat> %167, i32 0
  %175 = extractelement <2 x bfloat> %167, i32 1
  %176 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151)
  %177 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152)
  %178 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153)
  %179 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154)
  %180 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155)
  %181 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156)
  %182 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157)
  %183 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158)
  %184 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %185 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %186 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %187 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %188 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %192 = mul i64 %10, 1024
  %193 = getelementptr bfloat, ptr addrspace(1) %5, i64 %192
  %194 = getelementptr bfloat, ptr addrspace(1) %193, i64 %138
  %195 = getelementptr bfloat, ptr addrspace(1) %193, i64 %139
  %196 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %194)
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %196, 1
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %196, 2
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %196, 3
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractelement <2 x bfloat> %198, i32 0
  %206 = extractelement <2 x bfloat> %198, i32 1
  %207 = extractelement <2 x bfloat> %200, i32 0
  %208 = extractelement <2 x bfloat> %200, i32 1
  %209 = extractelement <2 x bfloat> %202, i32 0
  %210 = extractelement <2 x bfloat> %202, i32 1
  %211 = extractelement <2 x bfloat> %204, i32 0
  %212 = extractelement <2 x bfloat> %204, i32 1
  %213 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %195)
  %214 = extractvalue { i32, i32, i32, i32 } %213, 0
  %215 = bitcast i32 %214 to <2 x bfloat>
  %216 = extractvalue { i32, i32, i32, i32 } %213, 1
  %217 = bitcast i32 %216 to <2 x bfloat>
  %218 = extractvalue { i32, i32, i32, i32 } %213, 2
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractvalue { i32, i32, i32, i32 } %213, 3
  %221 = bitcast i32 %220 to <2 x bfloat>
  %222 = extractelement <2 x bfloat> %215, i32 0
  %223 = extractelement <2 x bfloat> %215, i32 1
  %224 = extractelement <2 x bfloat> %217, i32 0
  %225 = extractelement <2 x bfloat> %217, i32 1
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = extractelement <2 x bfloat> %221, i32 0
  %229 = extractelement <2 x bfloat> %221, i32 1
  %230 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205)
  %231 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206)
  %232 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207)
  %233 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208)
  %234 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209)
  %235 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210)
  %236 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211)
  %237 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212)
  %238 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %239 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %240 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %241 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %242 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %243 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %244 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %245 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %246 = add i64 %13, 3072
  %247 = getelementptr bfloat, ptr addrspace(1) %4, i64 %246
  %248 = getelementptr bfloat, ptr addrspace(1) %247, i64 %138
  %249 = getelementptr bfloat, ptr addrspace(1) %247, i64 %139
  %250 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %248)
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %250, 1
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %250, 2
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractvalue { i32, i32, i32, i32 } %250, 3
  %258 = bitcast i32 %257 to <2 x bfloat>
  %259 = extractelement <2 x bfloat> %252, i32 0
  %260 = extractelement <2 x bfloat> %252, i32 1
  %261 = extractelement <2 x bfloat> %254, i32 0
  %262 = extractelement <2 x bfloat> %254, i32 1
  %263 = extractelement <2 x bfloat> %256, i32 0
  %264 = extractelement <2 x bfloat> %256, i32 1
  %265 = extractelement <2 x bfloat> %258, i32 0
  %266 = extractelement <2 x bfloat> %258, i32 1
  %267 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %249)
  %268 = extractvalue { i32, i32, i32, i32 } %267, 0
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = extractvalue { i32, i32, i32, i32 } %267, 1
  %271 = bitcast i32 %270 to <2 x bfloat>
  %272 = extractvalue { i32, i32, i32, i32 } %267, 2
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = extractvalue { i32, i32, i32, i32 } %267, 3
  %275 = bitcast i32 %274 to <2 x bfloat>
  %276 = extractelement <2 x bfloat> %269, i32 0
  %277 = extractelement <2 x bfloat> %269, i32 1
  %278 = extractelement <2 x bfloat> %271, i32 0
  %279 = extractelement <2 x bfloat> %271, i32 1
  %280 = extractelement <2 x bfloat> %273, i32 0
  %281 = extractelement <2 x bfloat> %273, i32 1
  %282 = extractelement <2 x bfloat> %275, i32 0
  %283 = extractelement <2 x bfloat> %275, i32 1
  %284 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259)
  %285 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260)
  %286 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261)
  %287 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262)
  %288 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263)
  %289 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264)
  %290 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265)
  %291 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266)
  %292 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %293 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %294 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %295 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %296 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %297 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %298 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %300 = getelementptr bfloat, ptr addrspace(1) %3, i64 %192
  %301 = getelementptr bfloat, ptr addrspace(1) %300, i64 %138
  %302 = getelementptr bfloat, ptr addrspace(1) %300, i64 %139
  %303 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %301)
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %303, 1
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %303, 2
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %303, 3
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractelement <2 x bfloat> %305, i32 0
  %313 = extractelement <2 x bfloat> %305, i32 1
  %314 = extractelement <2 x bfloat> %307, i32 0
  %315 = extractelement <2 x bfloat> %307, i32 1
  %316 = extractelement <2 x bfloat> %309, i32 0
  %317 = extractelement <2 x bfloat> %309, i32 1
  %318 = extractelement <2 x bfloat> %311, i32 0
  %319 = extractelement <2 x bfloat> %311, i32 1
  %320 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %302)
  %321 = extractvalue { i32, i32, i32, i32 } %320, 0
  %322 = bitcast i32 %321 to <2 x bfloat>
  %323 = extractvalue { i32, i32, i32, i32 } %320, 1
  %324 = bitcast i32 %323 to <2 x bfloat>
  %325 = extractvalue { i32, i32, i32, i32 } %320, 2
  %326 = bitcast i32 %325 to <2 x bfloat>
  %327 = extractvalue { i32, i32, i32, i32 } %320, 3
  %328 = bitcast i32 %327 to <2 x bfloat>
  %329 = extractelement <2 x bfloat> %322, i32 0
  %330 = extractelement <2 x bfloat> %322, i32 1
  %331 = extractelement <2 x bfloat> %324, i32 0
  %332 = extractelement <2 x bfloat> %324, i32 1
  %333 = extractelement <2 x bfloat> %326, i32 0
  %334 = extractelement <2 x bfloat> %326, i32 1
  %335 = extractelement <2 x bfloat> %328, i32 0
  %336 = extractelement <2 x bfloat> %328, i32 1
  %337 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312)
  %338 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313)
  %339 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314)
  %340 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315)
  %341 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316)
  %342 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317)
  %343 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318)
  %344 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319)
  %345 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329)
  %346 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %347 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %348 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %349 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %350 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %351 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %352 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %336)
  %353 = fadd float %284, %337
  %354 = fadd float %285, %338
  %355 = fadd float %286, %339
  %356 = fadd float %287, %340
  %357 = fadd float %288, %341
  %358 = fadd float %289, %342
  %359 = fadd float %290, %343
  %360 = fadd float %291, %344
  %361 = fadd float %292, %345
  %362 = fadd float %293, %346
  %363 = fadd float %294, %347
  %364 = fadd float %295, %348
  %365 = fadd float %296, %349
  %366 = fadd float %297, %350
  %367 = fadd float %298, %351
  %368 = fadd float %299, %352
  %369 = fadd float %230, %353
  %370 = fadd float %231, %354
  %371 = fadd float %232, %355
  %372 = fadd float %233, %356
  %373 = fadd float %234, %357
  %374 = fadd float %235, %358
  %375 = fadd float %236, %359
  %376 = fadd float %237, %360
  %377 = fadd float %238, %361
  %378 = fadd float %239, %362
  %379 = fadd float %240, %363
  %380 = fadd float %241, %364
  %381 = fadd float %242, %365
  %382 = fadd float %243, %366
  %383 = fadd float %244, %367
  %384 = fadd float %245, %368
  %385 = fadd float %176, %369
  %386 = fadd float %177, %370
  %387 = fadd float %178, %371
  %388 = fadd float %179, %372
  %389 = fadd float %180, %373
  %390 = fadd float %181, %374
  %391 = fadd float %182, %375
  %392 = fadd float %183, %376
  %393 = fadd float %184, %377
  %394 = fadd float %185, %378
  %395 = fadd float %186, %379
  %396 = fadd float %187, %380
  %397 = fadd float %188, %381
  %398 = fadd float %189, %382
  %399 = fadd float %190, %383
  %400 = fadd float %191, %384
  %401 = fmul float %385, %385
  %402 = fmul float %386, %386
  %403 = fmul float %387, %387
  %404 = fmul float %388, %388
  %405 = fmul float %389, %389
  %406 = fmul float %390, %390
  %407 = fmul float %391, %391
  %408 = fmul float %392, %392
  %409 = fmul float %393, %393
  %410 = fmul float %394, %394
  %411 = fmul float %395, %395
  %412 = fmul float %396, %396
  %413 = fmul float %397, %397
  %414 = fmul float %398, %398
  %415 = fmul float %399, %399
  %416 = fmul float %400, %400
  %417 = fadd float %401, %402
  %418 = fadd float %417, %403
  %419 = fadd float %418, %404
  %420 = fadd float %419, %405
  %421 = fadd float %420, %406
  %422 = fadd float %421, %407
  %423 = fadd float %422, %408
  %424 = fadd float %423, %409
  %425 = fadd float %424, %410
  %426 = fadd float %425, %411
  %427 = fadd float %426, %412
  %428 = fadd float %427, %413
  %429 = fadd float %428, %414
  %430 = fadd float %429, %415
  %431 = fadd float %430, %416
  %432 = bitcast float %431 to i32
  %433 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %432, i32 16, i32 31)
  %434 = bitcast i32 %433 to float
  %435 = fadd float %431, %434
  %436 = bitcast float %435 to i32
  %437 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %436, i32 8, i32 31)
  %438 = bitcast i32 %437 to float
  %439 = fadd float %435, %438
  %440 = bitcast float %439 to i32
  %441 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %440, i32 4, i32 31)
  %442 = bitcast i32 %441 to float
  %443 = fadd float %439, %442
  %444 = bitcast float %443 to i32
  %445 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %444, i32 2, i32 31)
  %446 = bitcast i32 %445 to float
  %447 = fadd float %443, %446
  %448 = bitcast float %447 to i32
  %449 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %448, i32 1, i32 31)
  %450 = bitcast i32 %449 to float
  %451 = fadd float %447, %450
  %452 = urem i32 %18, 32
  %453 = urem i32 %19, 2
  %454 = icmp eq i32 %452, 0
  %455 = and i1 true, %454
  %456 = add i32 0, %453
  %457 = getelementptr float, ptr addrspace(3) @global_smem, i32 %456
  %458 = insertelement <1 x float> undef, float %451, i32 0
  %459 = extractelement <1 x float> %458, i32 0
  %460 = bitcast float %459 to i32
  %461 = insertelement <1 x i32> undef, i32 %460, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %457, <1 x i32> %461, i1 %455)
  call void @llvm.nvvm.barrier0()
  %462 = icmp slt i32 %17, 2
  %463 = getelementptr float, ptr addrspace(3) @global_smem, i32 %17
  %464 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %463, i1 %462)
  %465 = insertelement <1 x i32> undef, i32 %464, i32 0
  %466 = extractelement <1 x i32> %465, i32 0
  %467 = bitcast i32 %466 to float
  %468 = insertelement <1 x float> undef, float %467, i32 0
  %469 = extractelement <1 x float> %468, i32 0
  %470 = bitcast float %469 to i32
  %471 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %470, i32 1, i32 31)
  %472 = bitcast i32 %471 to float
  %473 = fadd float %469, %472
  %474 = urem i32 %18, 2
  %475 = icmp eq i32 %474, 0
  %476 = and i1 %462, %475
  %477 = insertelement <1 x float> undef, float %473, i32 0
  %478 = extractelement <1 x float> %477, i32 0
  %479 = bitcast float %478 to i32
  %480 = insertelement <1 x i32> undef, i32 %479, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %463, <1 x i32> %480, i1 %476)
  call void @llvm.nvvm.barrier0()
  %481 = load float, ptr addrspace(3) @global_smem, align 4
  %482 = fmul float %481, 0x3F50000000000000
  %483 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %484 = bitcast i32 %483 to <1 x float>
  %485 = extractelement <1 x float> %484, i32 0
  %486 = fadd float %482, %485
  %487 = call float @__nv_rsqrtf(float %486)
  %488 = fmul float %116, %487
  %489 = fmul float %117, %487
  %490 = fmul float %118, %487
  %491 = fmul float %119, %487
  %492 = getelementptr bfloat, ptr addrspace(1) %2, i64 %12
  %493 = getelementptr bfloat, ptr addrspace(1) %492, i64 %46
  %494 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %493)
  %495 = extractvalue { i32, i32 } %494, 0
  %496 = bitcast i32 %495 to <2 x bfloat>
  %497 = extractvalue { i32, i32 } %494, 1
  %498 = bitcast i32 %497 to <2 x bfloat>
  %499 = extractelement <2 x bfloat> %496, i32 0
  %500 = extractelement <2 x bfloat> %496, i32 1
  %501 = extractelement <2 x bfloat> %498, i32 0
  %502 = extractelement <2 x bfloat> %498, i32 1
  %503 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499)
  %504 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500)
  %505 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501)
  %506 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502)
  %507 = fmul float %488, %503
  %508 = fmul float %489, %504
  %509 = fmul float %490, %505
  %510 = fmul float %491, %506
  %511 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %507)
  %512 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %508)
  %513 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %509)
  %514 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %510)
  %515 = getelementptr bfloat, ptr addrspace(1) %6, i64 %61
  %516 = getelementptr bfloat, ptr addrspace(1) %515, i64 %46
  %517 = insertelement <2 x bfloat> undef, bfloat %511, i32 0
  %518 = insertelement <2 x bfloat> %517, bfloat %512, i32 1
  %519 = bitcast <2 x bfloat> %518 to i32
  %520 = insertelement <2 x bfloat> undef, bfloat %513, i32 0
  %521 = insertelement <2 x bfloat> %520, bfloat %514, i32 1
  %522 = bitcast <2 x bfloat> %521 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %519, i32 %522, ptr addrspace(1) %516)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_60_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_60(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %8 = addrspacecast ptr null to ptr addrspace(1)
  %9 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %10 = sext i32 %9 to i64
  %11 = udiv i64 %10, 4
  %12 = urem i64 %10, 4
  %13 = mul i64 %12, 256
  %14 = mul i64 %11, 4096
  %15 = add i64 %13, %14
  %16 = add i64 %15, 1024
  %17 = getelementptr bfloat, ptr addrspace(1) %4, i64 %16
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %19 = urem i32 %18, 32
  %20 = udiv i32 %18, 32
  %21 = and i32 %19, 1
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 0, i32 4
  %24 = xor i32 0, %23
  %25 = and i32 %19, 2
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 0, i32 8
  %28 = xor i32 %24, %27
  %29 = and i32 %19, 4
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 16
  %32 = xor i32 %28, %31
  %33 = and i32 %19, 8
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 32
  %36 = xor i32 %32, %35
  %37 = and i32 %19, 16
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 0, i32 64
  %40 = xor i32 %36, %39
  %41 = and i32 %20, 1
  %42 = icmp eq i32 %41, 0
  %43 = select i1 %42, i32 0, i32 128
  %44 = xor i32 %40, %43
  %45 = xor i32 %44, 0
  %46 = add i32 %45, 0
  %47 = sext i32 %46 to i64
  %48 = getelementptr bfloat, ptr addrspace(1) %17, i64 %47
  %49 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %48)
  %50 = extractvalue { i32, i32 } %49, 0
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32 } %49, 1
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractelement <2 x bfloat> %51, i32 0
  %55 = extractelement <2 x bfloat> %51, i32 1
  %56 = extractelement <2 x bfloat> %53, i32 0
  %57 = extractelement <2 x bfloat> %53, i32 1
  %58 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54)
  %59 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %60 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %61 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %62 = mul i64 %10, 256
  %63 = getelementptr bfloat, ptr addrspace(1) %3, i64 %62
  %64 = getelementptr bfloat, ptr addrspace(1) %63, i64 %47
  %65 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %64)
  %66 = extractvalue { i32, i32 } %65, 0
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractvalue { i32, i32 } %65, 1
  %69 = bitcast i32 %68 to <2 x bfloat>
  %70 = extractelement <2 x bfloat> %67, i32 0
  %71 = extractelement <2 x bfloat> %67, i32 1
  %72 = extractelement <2 x bfloat> %69, i32 0
  %73 = extractelement <2 x bfloat> %69, i32 1
  %74 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %75 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %76 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72)
  %77 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73)
  %78 = add i64 %15, 2048
  %79 = getelementptr bfloat, ptr addrspace(1) %4, i64 %78
  %80 = getelementptr bfloat, ptr addrspace(1) %79, i64 %47
  %81 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %80)
  %82 = extractvalue { i32, i32 } %81, 0
  %83 = bitcast i32 %82 to <2 x bfloat>
  %84 = extractvalue { i32, i32 } %81, 1
  %85 = bitcast i32 %84 to <2 x bfloat>
  %86 = extractelement <2 x bfloat> %83, i32 0
  %87 = extractelement <2 x bfloat> %83, i32 1
  %88 = extractelement <2 x bfloat> %85, i32 0
  %89 = extractelement <2 x bfloat> %85, i32 1
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89)
  %94 = getelementptr bfloat, ptr addrspace(1) %6, i64 %62
  %95 = getelementptr bfloat, ptr addrspace(1) %94, i64 %47
  %96 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %95)
  %97 = extractvalue { i32, i32 } %96, 0
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractvalue { i32, i32 } %96, 1
  %100 = bitcast i32 %99 to <2 x bfloat>
  %101 = extractelement <2 x bfloat> %98, i32 0
  %102 = extractelement <2 x bfloat> %98, i32 1
  %103 = extractelement <2 x bfloat> %100, i32 0
  %104 = extractelement <2 x bfloat> %100, i32 1
  %105 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101)
  %106 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102)
  %107 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103)
  %108 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104)
  %109 = add i64 %15, 3072
  %110 = getelementptr bfloat, ptr addrspace(1) %4, i64 %109
  %111 = getelementptr bfloat, ptr addrspace(1) %110, i64 %47
  %112 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %111)
  %113 = extractvalue { i32, i32 } %112, 0
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32 } %112, 1
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractelement <2 x bfloat> %114, i32 0
  %118 = extractelement <2 x bfloat> %114, i32 1
  %119 = extractelement <2 x bfloat> %116, i32 0
  %120 = extractelement <2 x bfloat> %116, i32 1
  %121 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %122 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %123 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %124 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %125 = getelementptr bfloat, ptr addrspace(1) %5, i64 %62
  %126 = getelementptr bfloat, ptr addrspace(1) %125, i64 %47
  %127 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %126)
  %128 = extractvalue { i32, i32 } %127, 0
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32 } %127, 1
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractelement <2 x bfloat> %129, i32 0
  %133 = extractelement <2 x bfloat> %129, i32 1
  %134 = extractelement <2 x bfloat> %131, i32 0
  %135 = extractelement <2 x bfloat> %131, i32 1
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %140 = fadd float %121, %136
  %141 = fadd float %122, %137
  %142 = fadd float %123, %138
  %143 = fadd float %124, %139
  %144 = fadd float %105, %140
  %145 = fadd float %106, %141
  %146 = fadd float %107, %142
  %147 = fadd float %108, %143
  %148 = fadd float %90, %144
  %149 = fadd float %91, %145
  %150 = fadd float %92, %146
  %151 = fadd float %93, %147
  %152 = fadd float %74, %148
  %153 = fadd float %75, %149
  %154 = fadd float %76, %150
  %155 = fadd float %77, %151
  %156 = fadd float %58, %152
  %157 = fadd float %59, %153
  %158 = fadd float %60, %154
  %159 = fadd float %61, %155
  %160 = add i64 %14, 1024
  %161 = getelementptr bfloat, ptr addrspace(1) %4, i64 %160
  %162 = select i1 %22, i32 0, i32 8
  %163 = xor i32 0, %162
  %164 = select i1 %26, i32 0, i32 16
  %165 = xor i32 %163, %164
  %166 = select i1 %30, i32 0, i32 32
  %167 = xor i32 %165, %166
  %168 = select i1 %34, i32 0, i32 64
  %169 = xor i32 %167, %168
  %170 = select i1 %38, i32 0, i32 128
  %171 = xor i32 %169, %170
  %172 = select i1 %42, i32 0, i32 256
  %173 = xor i32 %171, %172
  %174 = xor i32 %173, 0
  %175 = xor i32 %173, 512
  %176 = add i32 %174, 0
  %177 = add i32 %175, 0
  %178 = sext i32 %176 to i64
  %179 = sext i32 %177 to i64
  %180 = getelementptr bfloat, ptr addrspace(1) %161, i64 %178
  %181 = getelementptr bfloat, ptr addrspace(1) %161, i64 %179
  %182 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %180)
  %183 = extractvalue { i32, i32, i32, i32 } %182, 0
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractvalue { i32, i32, i32, i32 } %182, 1
  %186 = bitcast i32 %185 to <2 x bfloat>
  %187 = extractvalue { i32, i32, i32, i32 } %182, 2
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractvalue { i32, i32, i32, i32 } %182, 3
  %190 = bitcast i32 %189 to <2 x bfloat>
  %191 = extractelement <2 x bfloat> %184, i32 0
  %192 = extractelement <2 x bfloat> %184, i32 1
  %193 = extractelement <2 x bfloat> %186, i32 0
  %194 = extractelement <2 x bfloat> %186, i32 1
  %195 = extractelement <2 x bfloat> %188, i32 0
  %196 = extractelement <2 x bfloat> %188, i32 1
  %197 = extractelement <2 x bfloat> %190, i32 0
  %198 = extractelement <2 x bfloat> %190, i32 1
  %199 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %181)
  %200 = extractvalue { i32, i32, i32, i32 } %199, 0
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractvalue { i32, i32, i32, i32 } %199, 1
  %203 = bitcast i32 %202 to <2 x bfloat>
  %204 = extractvalue { i32, i32, i32, i32 } %199, 2
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractvalue { i32, i32, i32, i32 } %199, 3
  %207 = bitcast i32 %206 to <2 x bfloat>
  %208 = extractelement <2 x bfloat> %201, i32 0
  %209 = extractelement <2 x bfloat> %201, i32 1
  %210 = extractelement <2 x bfloat> %203, i32 0
  %211 = extractelement <2 x bfloat> %203, i32 1
  %212 = extractelement <2 x bfloat> %205, i32 0
  %213 = extractelement <2 x bfloat> %205, i32 1
  %214 = extractelement <2 x bfloat> %207, i32 0
  %215 = extractelement <2 x bfloat> %207, i32 1
  %216 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %217 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %218 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %219 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %220 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %221 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %222 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197)
  %223 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %198)
  %224 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208)
  %225 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209)
  %226 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210)
  %227 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211)
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213)
  %230 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %214)
  %231 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %215)
  %232 = mul i64 %11, 1024
  %233 = getelementptr bfloat, ptr addrspace(1) %3, i64 %232
  %234 = getelementptr bfloat, ptr addrspace(1) %233, i64 %178
  %235 = getelementptr bfloat, ptr addrspace(1) %233, i64 %179
  %236 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %234)
  %237 = extractvalue { i32, i32, i32, i32 } %236, 0
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractvalue { i32, i32, i32, i32 } %236, 1
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = extractvalue { i32, i32, i32, i32 } %236, 2
  %242 = bitcast i32 %241 to <2 x bfloat>
  %243 = extractvalue { i32, i32, i32, i32 } %236, 3
  %244 = bitcast i32 %243 to <2 x bfloat>
  %245 = extractelement <2 x bfloat> %238, i32 0
  %246 = extractelement <2 x bfloat> %238, i32 1
  %247 = extractelement <2 x bfloat> %240, i32 0
  %248 = extractelement <2 x bfloat> %240, i32 1
  %249 = extractelement <2 x bfloat> %242, i32 0
  %250 = extractelement <2 x bfloat> %242, i32 1
  %251 = extractelement <2 x bfloat> %244, i32 0
  %252 = extractelement <2 x bfloat> %244, i32 1
  %253 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %235)
  %254 = extractvalue { i32, i32, i32, i32 } %253, 0
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractvalue { i32, i32, i32, i32 } %253, 1
  %257 = bitcast i32 %256 to <2 x bfloat>
  %258 = extractvalue { i32, i32, i32, i32 } %253, 2
  %259 = bitcast i32 %258 to <2 x bfloat>
  %260 = extractvalue { i32, i32, i32, i32 } %253, 3
  %261 = bitcast i32 %260 to <2 x bfloat>
  %262 = extractelement <2 x bfloat> %255, i32 0
  %263 = extractelement <2 x bfloat> %255, i32 1
  %264 = extractelement <2 x bfloat> %257, i32 0
  %265 = extractelement <2 x bfloat> %257, i32 1
  %266 = extractelement <2 x bfloat> %259, i32 0
  %267 = extractelement <2 x bfloat> %259, i32 1
  %268 = extractelement <2 x bfloat> %261, i32 0
  %269 = extractelement <2 x bfloat> %261, i32 1
  %270 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %271 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %272 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %273 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %274 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %275 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250)
  %276 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %251)
  %277 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %252)
  %278 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262)
  %279 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263)
  %280 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264)
  %281 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265)
  %282 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266)
  %283 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267)
  %284 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %268)
  %285 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %269)
  %286 = add i64 %14, 2048
  %287 = getelementptr bfloat, ptr addrspace(1) %4, i64 %286
  %288 = getelementptr bfloat, ptr addrspace(1) %287, i64 %178
  %289 = getelementptr bfloat, ptr addrspace(1) %287, i64 %179
  %290 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %288)
  %291 = extractvalue { i32, i32, i32, i32 } %290, 0
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %290, 1
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractvalue { i32, i32, i32, i32 } %290, 2
  %296 = bitcast i32 %295 to <2 x bfloat>
  %297 = extractvalue { i32, i32, i32, i32 } %290, 3
  %298 = bitcast i32 %297 to <2 x bfloat>
  %299 = extractelement <2 x bfloat> %292, i32 0
  %300 = extractelement <2 x bfloat> %292, i32 1
  %301 = extractelement <2 x bfloat> %294, i32 0
  %302 = extractelement <2 x bfloat> %294, i32 1
  %303 = extractelement <2 x bfloat> %296, i32 0
  %304 = extractelement <2 x bfloat> %296, i32 1
  %305 = extractelement <2 x bfloat> %298, i32 0
  %306 = extractelement <2 x bfloat> %298, i32 1
  %307 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %289)
  %308 = extractvalue { i32, i32, i32, i32 } %307, 0
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %307, 1
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractvalue { i32, i32, i32, i32 } %307, 2
  %313 = bitcast i32 %312 to <2 x bfloat>
  %314 = extractvalue { i32, i32, i32, i32 } %307, 3
  %315 = bitcast i32 %314 to <2 x bfloat>
  %316 = extractelement <2 x bfloat> %309, i32 0
  %317 = extractelement <2 x bfloat> %309, i32 1
  %318 = extractelement <2 x bfloat> %311, i32 0
  %319 = extractelement <2 x bfloat> %311, i32 1
  %320 = extractelement <2 x bfloat> %313, i32 0
  %321 = extractelement <2 x bfloat> %313, i32 1
  %322 = extractelement <2 x bfloat> %315, i32 0
  %323 = extractelement <2 x bfloat> %315, i32 1
  %324 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %325 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %326 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %327 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %328 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %329 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304)
  %330 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %305)
  %331 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %306)
  %332 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316)
  %333 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317)
  %334 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318)
  %335 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319)
  %336 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320)
  %337 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %321)
  %338 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %322)
  %339 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %323)
  %340 = getelementptr bfloat, ptr addrspace(1) %6, i64 %232
  %341 = getelementptr bfloat, ptr addrspace(1) %340, i64 %178
  %342 = getelementptr bfloat, ptr addrspace(1) %340, i64 %179
  %343 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %341)
  %344 = extractvalue { i32, i32, i32, i32 } %343, 0
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractvalue { i32, i32, i32, i32 } %343, 1
  %347 = bitcast i32 %346 to <2 x bfloat>
  %348 = extractvalue { i32, i32, i32, i32 } %343, 2
  %349 = bitcast i32 %348 to <2 x bfloat>
  %350 = extractvalue { i32, i32, i32, i32 } %343, 3
  %351 = bitcast i32 %350 to <2 x bfloat>
  %352 = extractelement <2 x bfloat> %345, i32 0
  %353 = extractelement <2 x bfloat> %345, i32 1
  %354 = extractelement <2 x bfloat> %347, i32 0
  %355 = extractelement <2 x bfloat> %347, i32 1
  %356 = extractelement <2 x bfloat> %349, i32 0
  %357 = extractelement <2 x bfloat> %349, i32 1
  %358 = extractelement <2 x bfloat> %351, i32 0
  %359 = extractelement <2 x bfloat> %351, i32 1
  %360 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %342)
  %361 = extractvalue { i32, i32, i32, i32 } %360, 0
  %362 = bitcast i32 %361 to <2 x bfloat>
  %363 = extractvalue { i32, i32, i32, i32 } %360, 1
  %364 = bitcast i32 %363 to <2 x bfloat>
  %365 = extractvalue { i32, i32, i32, i32 } %360, 2
  %366 = bitcast i32 %365 to <2 x bfloat>
  %367 = extractvalue { i32, i32, i32, i32 } %360, 3
  %368 = bitcast i32 %367 to <2 x bfloat>
  %369 = extractelement <2 x bfloat> %362, i32 0
  %370 = extractelement <2 x bfloat> %362, i32 1
  %371 = extractelement <2 x bfloat> %364, i32 0
  %372 = extractelement <2 x bfloat> %364, i32 1
  %373 = extractelement <2 x bfloat> %366, i32 0
  %374 = extractelement <2 x bfloat> %366, i32 1
  %375 = extractelement <2 x bfloat> %368, i32 0
  %376 = extractelement <2 x bfloat> %368, i32 1
  %377 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %378 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %379 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %380 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %381 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %382 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357)
  %383 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %358)
  %384 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %359)
  %385 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369)
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373)
  %390 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %374)
  %391 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %375)
  %392 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376)
  %393 = add i64 %14, 3072
  %394 = getelementptr bfloat, ptr addrspace(1) %4, i64 %393
  %395 = getelementptr bfloat, ptr addrspace(1) %394, i64 %178
  %396 = getelementptr bfloat, ptr addrspace(1) %394, i64 %179
  %397 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %395)
  %398 = extractvalue { i32, i32, i32, i32 } %397, 0
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractvalue { i32, i32, i32, i32 } %397, 1
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractvalue { i32, i32, i32, i32 } %397, 2
  %403 = bitcast i32 %402 to <2 x bfloat>
  %404 = extractvalue { i32, i32, i32, i32 } %397, 3
  %405 = bitcast i32 %404 to <2 x bfloat>
  %406 = extractelement <2 x bfloat> %399, i32 0
  %407 = extractelement <2 x bfloat> %399, i32 1
  %408 = extractelement <2 x bfloat> %401, i32 0
  %409 = extractelement <2 x bfloat> %401, i32 1
  %410 = extractelement <2 x bfloat> %403, i32 0
  %411 = extractelement <2 x bfloat> %403, i32 1
  %412 = extractelement <2 x bfloat> %405, i32 0
  %413 = extractelement <2 x bfloat> %405, i32 1
  %414 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %396)
  %415 = extractvalue { i32, i32, i32, i32 } %414, 0
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractvalue { i32, i32, i32, i32 } %414, 1
  %418 = bitcast i32 %417 to <2 x bfloat>
  %419 = extractvalue { i32, i32, i32, i32 } %414, 2
  %420 = bitcast i32 %419 to <2 x bfloat>
  %421 = extractvalue { i32, i32, i32, i32 } %414, 3
  %422 = bitcast i32 %421 to <2 x bfloat>
  %423 = extractelement <2 x bfloat> %416, i32 0
  %424 = extractelement <2 x bfloat> %416, i32 1
  %425 = extractelement <2 x bfloat> %418, i32 0
  %426 = extractelement <2 x bfloat> %418, i32 1
  %427 = extractelement <2 x bfloat> %420, i32 0
  %428 = extractelement <2 x bfloat> %420, i32 1
  %429 = extractelement <2 x bfloat> %422, i32 0
  %430 = extractelement <2 x bfloat> %422, i32 1
  %431 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %432 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407)
  %433 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408)
  %434 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409)
  %435 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %410)
  %436 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %411)
  %437 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %412)
  %438 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %413)
  %439 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423)
  %440 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424)
  %441 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425)
  %442 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426)
  %443 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %427)
  %444 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %428)
  %445 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %429)
  %446 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430)
  %447 = getelementptr bfloat, ptr addrspace(1) %5, i64 %232
  %448 = getelementptr bfloat, ptr addrspace(1) %447, i64 %178
  %449 = getelementptr bfloat, ptr addrspace(1) %447, i64 %179
  %450 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %448)
  %451 = extractvalue { i32, i32, i32, i32 } %450, 0
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractvalue { i32, i32, i32, i32 } %450, 1
  %454 = bitcast i32 %453 to <2 x bfloat>
  %455 = extractvalue { i32, i32, i32, i32 } %450, 2
  %456 = bitcast i32 %455 to <2 x bfloat>
  %457 = extractvalue { i32, i32, i32, i32 } %450, 3
  %458 = bitcast i32 %457 to <2 x bfloat>
  %459 = extractelement <2 x bfloat> %452, i32 0
  %460 = extractelement <2 x bfloat> %452, i32 1
  %461 = extractelement <2 x bfloat> %454, i32 0
  %462 = extractelement <2 x bfloat> %454, i32 1
  %463 = extractelement <2 x bfloat> %456, i32 0
  %464 = extractelement <2 x bfloat> %456, i32 1
  %465 = extractelement <2 x bfloat> %458, i32 0
  %466 = extractelement <2 x bfloat> %458, i32 1
  %467 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %449)
  %468 = extractvalue { i32, i32, i32, i32 } %467, 0
  %469 = bitcast i32 %468 to <2 x bfloat>
  %470 = extractvalue { i32, i32, i32, i32 } %467, 1
  %471 = bitcast i32 %470 to <2 x bfloat>
  %472 = extractvalue { i32, i32, i32, i32 } %467, 2
  %473 = bitcast i32 %472 to <2 x bfloat>
  %474 = extractvalue { i32, i32, i32, i32 } %467, 3
  %475 = bitcast i32 %474 to <2 x bfloat>
  %476 = extractelement <2 x bfloat> %469, i32 0
  %477 = extractelement <2 x bfloat> %469, i32 1
  %478 = extractelement <2 x bfloat> %471, i32 0
  %479 = extractelement <2 x bfloat> %471, i32 1
  %480 = extractelement <2 x bfloat> %473, i32 0
  %481 = extractelement <2 x bfloat> %473, i32 1
  %482 = extractelement <2 x bfloat> %475, i32 0
  %483 = extractelement <2 x bfloat> %475, i32 1
  %484 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459)
  %485 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460)
  %486 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461)
  %487 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462)
  %488 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463)
  %489 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %464)
  %490 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %465)
  %491 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %466)
  %492 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476)
  %493 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477)
  %494 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %478)
  %495 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %479)
  %496 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %480)
  %497 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %481)
  %498 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %482)
  %499 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %483)
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
  %510 = fadd float %441, %494
  %511 = fadd float %442, %495
  %512 = fadd float %443, %496
  %513 = fadd float %444, %497
  %514 = fadd float %445, %498
  %515 = fadd float %446, %499
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
  %526 = fadd float %387, %510
  %527 = fadd float %388, %511
  %528 = fadd float %389, %512
  %529 = fadd float %390, %513
  %530 = fadd float %391, %514
  %531 = fadd float %392, %515
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
  %542 = fadd float %334, %526
  %543 = fadd float %335, %527
  %544 = fadd float %336, %528
  %545 = fadd float %337, %529
  %546 = fadd float %338, %530
  %547 = fadd float %339, %531
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
  %558 = fadd float %280, %542
  %559 = fadd float %281, %543
  %560 = fadd float %282, %544
  %561 = fadd float %283, %545
  %562 = fadd float %284, %546
  %563 = fadd float %285, %547
  %564 = fadd float %216, %548
  %565 = fadd float %217, %549
  %566 = fadd float %218, %550
  %567 = fadd float %219, %551
  %568 = fadd float %220, %552
  %569 = fadd float %221, %553
  %570 = fadd float %222, %554
  %571 = fadd float %223, %555
  %572 = fadd float %224, %556
  %573 = fadd float %225, %557
  %574 = fadd float %226, %558
  %575 = fadd float %227, %559
  %576 = fadd float %228, %560
  %577 = fadd float %229, %561
  %578 = fadd float %230, %562
  %579 = fadd float %231, %563
  %580 = fmul float %564, %564
  %581 = fmul float %565, %565
  %582 = fmul float %566, %566
  %583 = fmul float %567, %567
  %584 = fmul float %568, %568
  %585 = fmul float %569, %569
  %586 = fmul float %570, %570
  %587 = fmul float %571, %571
  %588 = fmul float %572, %572
  %589 = fmul float %573, %573
  %590 = fmul float %574, %574
  %591 = fmul float %575, %575
  %592 = fmul float %576, %576
  %593 = fmul float %577, %577
  %594 = fmul float %578, %578
  %595 = fmul float %579, %579
  %596 = fadd float %580, %581
  %597 = fadd float %596, %582
  %598 = fadd float %597, %583
  %599 = fadd float %598, %584
  %600 = fadd float %599, %585
  %601 = fadd float %600, %586
  %602 = fadd float %601, %587
  %603 = fadd float %602, %588
  %604 = fadd float %603, %589
  %605 = fadd float %604, %590
  %606 = fadd float %605, %591
  %607 = fadd float %606, %592
  %608 = fadd float %607, %593
  %609 = fadd float %608, %594
  %610 = fadd float %609, %595
  %611 = bitcast float %610 to i32
  %612 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %611, i32 16, i32 31)
  %613 = bitcast i32 %612 to float
  %614 = fadd float %610, %613
  %615 = bitcast float %614 to i32
  %616 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %615, i32 8, i32 31)
  %617 = bitcast i32 %616 to float
  %618 = fadd float %614, %617
  %619 = bitcast float %618 to i32
  %620 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %619, i32 4, i32 31)
  %621 = bitcast i32 %620 to float
  %622 = fadd float %618, %621
  %623 = bitcast float %622 to i32
  %624 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %623, i32 2, i32 31)
  %625 = bitcast i32 %624 to float
  %626 = fadd float %622, %625
  %627 = bitcast float %626 to i32
  %628 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %627, i32 1, i32 31)
  %629 = bitcast i32 %628 to float
  %630 = fadd float %626, %629
  %631 = urem i32 %19, 32
  %632 = urem i32 %20, 2
  %633 = icmp eq i32 %631, 0
  %634 = and i1 true, %633
  %635 = add i32 0, %632
  %636 = getelementptr float, ptr addrspace(3) @global_smem, i32 %635
  %637 = insertelement <1 x float> undef, float %630, i32 0
  %638 = extractelement <1 x float> %637, i32 0
  %639 = bitcast float %638 to i32
  %640 = insertelement <1 x i32> undef, i32 %639, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %636, <1 x i32> %640, i1 %634)
  call void @llvm.nvvm.barrier0()
  %641 = icmp slt i32 %18, 2
  %642 = getelementptr float, ptr addrspace(3) @global_smem, i32 %18
  %643 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %642, i1 %641)
  %644 = insertelement <1 x i32> undef, i32 %643, i32 0
  %645 = extractelement <1 x i32> %644, i32 0
  %646 = bitcast i32 %645 to float
  %647 = insertelement <1 x float> undef, float %646, i32 0
  %648 = extractelement <1 x float> %647, i32 0
  %649 = bitcast float %648 to i32
  %650 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %649, i32 1, i32 31)
  %651 = bitcast i32 %650 to float
  %652 = fadd float %648, %651
  %653 = urem i32 %19, 2
  %654 = icmp eq i32 %653, 0
  %655 = and i1 %641, %654
  %656 = insertelement <1 x float> undef, float %652, i32 0
  %657 = extractelement <1 x float> %656, i32 0
  %658 = bitcast float %657 to i32
  %659 = insertelement <1 x i32> undef, i32 %658, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %642, <1 x i32> %659, i1 %655)
  call void @llvm.nvvm.barrier0()
  %660 = load float, ptr addrspace(3) @global_smem, align 4
  %661 = fmul float %660, 0x3F50000000000000
  %662 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %663 = bitcast i32 %662 to <1 x float>
  %664 = extractelement <1 x float> %663, i32 0
  %665 = fadd float %661, %664
  %666 = call float @__nv_rsqrtf(float %665)
  %667 = fmul float %156, %666
  %668 = fmul float %157, %666
  %669 = fmul float %158, %666
  %670 = fmul float %159, %666
  %671 = getelementptr bfloat, ptr addrspace(1) %2, i64 %13
  %672 = getelementptr bfloat, ptr addrspace(1) %671, i64 %47
  %673 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %672)
  %674 = extractvalue { i32, i32 } %673, 0
  %675 = bitcast i32 %674 to <2 x bfloat>
  %676 = extractvalue { i32, i32 } %673, 1
  %677 = bitcast i32 %676 to <2 x bfloat>
  %678 = extractelement <2 x bfloat> %675, i32 0
  %679 = extractelement <2 x bfloat> %675, i32 1
  %680 = extractelement <2 x bfloat> %677, i32 0
  %681 = extractelement <2 x bfloat> %677, i32 1
  %682 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %678)
  %683 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %679)
  %684 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %680)
  %685 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %681)
  %686 = fmul float %667, %682
  %687 = fmul float %668, %683
  %688 = fmul float %669, %684
  %689 = fmul float %670, %685
  %690 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %686)
  %691 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %687)
  %692 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %688)
  %693 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %689)
  %694 = getelementptr bfloat, ptr addrspace(1) %7, i64 %62
  %695 = getelementptr bfloat, ptr addrspace(1) %694, i64 %47
  %696 = insertelement <2 x bfloat> undef, bfloat %690, i32 0
  %697 = insertelement <2 x bfloat> %696, bfloat %691, i32 1
  %698 = bitcast <2 x bfloat> %697 to i32
  %699 = insertelement <2 x bfloat> undef, bfloat %692, i32 0
  %700 = insertelement <2 x bfloat> %699, bfloat %693, i32 1
  %701 = bitcast <2 x bfloat> %700 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %698, i32 %701, ptr addrspace(1) %695)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_58_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_58(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %8 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %9 = addrspacecast ptr null to ptr addrspace(1)
  %10 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %11 = sext i32 %10 to i64
  %12 = mul i64 %11, 4096
  %13 = getelementptr bfloat, ptr addrspace(1) %4, i64 %12
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %15 = urem i32 %14, 32
  %16 = udiv i32 %14, 32
  %17 = and i32 %15, 1
  %18 = icmp eq i32 %17, 0
  %19 = select i1 %18, i32 0, i32 8
  %20 = xor i32 0, %19
  %21 = and i32 %15, 2
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 0, i32 16
  %24 = xor i32 %20, %23
  %25 = and i32 %15, 4
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 0, i32 32
  %28 = xor i32 %24, %27
  %29 = and i32 %15, 8
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 64
  %32 = xor i32 %28, %31
  %33 = and i32 %15, 16
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 128
  %36 = xor i32 %32, %35
  %37 = and i32 %16, 1
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 0, i32 256
  %40 = xor i32 %36, %39
  %41 = xor i32 %40, 0
  %42 = xor i32 %40, 512
  %43 = add i32 %41, 0
  %44 = add i32 %42, 0
  %45 = sext i32 %43 to i64
  %46 = sext i32 %44 to i64
  %47 = getelementptr bfloat, ptr addrspace(1) %13, i64 %45
  %48 = getelementptr bfloat, ptr addrspace(1) %13, i64 %46
  %49 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %47)
  %50 = extractvalue { i32, i32, i32, i32 } %49, 0
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32, i32, i32 } %49, 1
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractvalue { i32, i32, i32, i32 } %49, 2
  %55 = bitcast i32 %54 to <2 x bfloat>
  %56 = extractvalue { i32, i32, i32, i32 } %49, 3
  %57 = bitcast i32 %56 to <2 x bfloat>
  %58 = extractelement <2 x bfloat> %51, i32 0
  %59 = extractelement <2 x bfloat> %51, i32 1
  %60 = extractelement <2 x bfloat> %53, i32 0
  %61 = extractelement <2 x bfloat> %53, i32 1
  %62 = extractelement <2 x bfloat> %55, i32 0
  %63 = extractelement <2 x bfloat> %55, i32 1
  %64 = extractelement <2 x bfloat> %57, i32 0
  %65 = extractelement <2 x bfloat> %57, i32 1
  %66 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %48)
  %67 = extractvalue { i32, i32, i32, i32 } %66, 0
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractvalue { i32, i32, i32, i32 } %66, 1
  %70 = bitcast i32 %69 to <2 x bfloat>
  %71 = extractvalue { i32, i32, i32, i32 } %66, 2
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractvalue { i32, i32, i32, i32 } %66, 3
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractelement <2 x bfloat> %68, i32 0
  %76 = extractelement <2 x bfloat> %68, i32 1
  %77 = extractelement <2 x bfloat> %70, i32 0
  %78 = extractelement <2 x bfloat> %70, i32 1
  %79 = extractelement <2 x bfloat> %72, i32 0
  %80 = extractelement <2 x bfloat> %72, i32 1
  %81 = extractelement <2 x bfloat> %74, i32 0
  %82 = extractelement <2 x bfloat> %74, i32 1
  %83 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %84 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = mul i64 %11, 1024
  %100 = getelementptr bfloat, ptr addrspace(1) %7, i64 %99
  %101 = getelementptr bfloat, ptr addrspace(1) %100, i64 %45
  %102 = getelementptr bfloat, ptr addrspace(1) %100, i64 %46
  %103 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %101)
  %104 = extractvalue { i32, i32, i32, i32 } %103, 0
  %105 = bitcast i32 %104 to <2 x bfloat>
  %106 = extractvalue { i32, i32, i32, i32 } %103, 1
  %107 = bitcast i32 %106 to <2 x bfloat>
  %108 = extractvalue { i32, i32, i32, i32 } %103, 2
  %109 = bitcast i32 %108 to <2 x bfloat>
  %110 = extractvalue { i32, i32, i32, i32 } %103, 3
  %111 = bitcast i32 %110 to <2 x bfloat>
  %112 = extractelement <2 x bfloat> %105, i32 0
  %113 = extractelement <2 x bfloat> %105, i32 1
  %114 = extractelement <2 x bfloat> %107, i32 0
  %115 = extractelement <2 x bfloat> %107, i32 1
  %116 = extractelement <2 x bfloat> %109, i32 0
  %117 = extractelement <2 x bfloat> %109, i32 1
  %118 = extractelement <2 x bfloat> %111, i32 0
  %119 = extractelement <2 x bfloat> %111, i32 1
  %120 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %102)
  %121 = extractvalue { i32, i32, i32, i32 } %120, 0
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %120, 1
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractvalue { i32, i32, i32, i32 } %120, 2
  %126 = bitcast i32 %125 to <2 x bfloat>
  %127 = extractvalue { i32, i32, i32, i32 } %120, 3
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractelement <2 x bfloat> %122, i32 0
  %130 = extractelement <2 x bfloat> %122, i32 1
  %131 = extractelement <2 x bfloat> %124, i32 0
  %132 = extractelement <2 x bfloat> %124, i32 1
  %133 = extractelement <2 x bfloat> %126, i32 0
  %134 = extractelement <2 x bfloat> %126, i32 1
  %135 = extractelement <2 x bfloat> %128, i32 0
  %136 = extractelement <2 x bfloat> %128, i32 1
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = add i64 %12, 1024
  %154 = getelementptr bfloat, ptr addrspace(1) %4, i64 %153
  %155 = getelementptr bfloat, ptr addrspace(1) %154, i64 %45
  %156 = getelementptr bfloat, ptr addrspace(1) %154, i64 %46
  %157 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %155)
  %158 = extractvalue { i32, i32, i32, i32 } %157, 0
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %157, 1
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %157, 2
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractvalue { i32, i32, i32, i32 } %157, 3
  %165 = bitcast i32 %164 to <2 x bfloat>
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = extractelement <2 x bfloat> %165, i32 0
  %173 = extractelement <2 x bfloat> %165, i32 1
  %174 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %156)
  %175 = extractvalue { i32, i32, i32, i32 } %174, 0
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %174, 1
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %174, 2
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %174, 3
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = extractelement <2 x bfloat> %182, i32 0
  %190 = extractelement <2 x bfloat> %182, i32 1
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = getelementptr bfloat, ptr addrspace(1) %6, i64 %99
  %208 = getelementptr bfloat, ptr addrspace(1) %207, i64 %45
  %209 = getelementptr bfloat, ptr addrspace(1) %207, i64 %46
  %210 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %208)
  %211 = extractvalue { i32, i32, i32, i32 } %210, 0
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractvalue { i32, i32, i32, i32 } %210, 1
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %210, 2
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractvalue { i32, i32, i32, i32 } %210, 3
  %218 = bitcast i32 %217 to <2 x bfloat>
  %219 = extractelement <2 x bfloat> %212, i32 0
  %220 = extractelement <2 x bfloat> %212, i32 1
  %221 = extractelement <2 x bfloat> %214, i32 0
  %222 = extractelement <2 x bfloat> %214, i32 1
  %223 = extractelement <2 x bfloat> %216, i32 0
  %224 = extractelement <2 x bfloat> %216, i32 1
  %225 = extractelement <2 x bfloat> %218, i32 0
  %226 = extractelement <2 x bfloat> %218, i32 1
  %227 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %209)
  %228 = extractvalue { i32, i32, i32, i32 } %227, 0
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %227, 1
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %227, 2
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %227, 3
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractelement <2 x bfloat> %229, i32 0
  %237 = extractelement <2 x bfloat> %229, i32 1
  %238 = extractelement <2 x bfloat> %231, i32 0
  %239 = extractelement <2 x bfloat> %231, i32 1
  %240 = extractelement <2 x bfloat> %233, i32 0
  %241 = extractelement <2 x bfloat> %233, i32 1
  %242 = extractelement <2 x bfloat> %235, i32 0
  %243 = extractelement <2 x bfloat> %235, i32 1
  %244 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219)
  %245 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %246 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %247 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = add i64 %12, 2048
  %261 = getelementptr bfloat, ptr addrspace(1) %4, i64 %260
  %262 = getelementptr bfloat, ptr addrspace(1) %261, i64 %45
  %263 = getelementptr bfloat, ptr addrspace(1) %261, i64 %46
  %264 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %262)
  %265 = extractvalue { i32, i32, i32, i32 } %264, 0
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractvalue { i32, i32, i32, i32 } %264, 1
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %264, 2
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = extractvalue { i32, i32, i32, i32 } %264, 3
  %272 = bitcast i32 %271 to <2 x bfloat>
  %273 = extractelement <2 x bfloat> %266, i32 0
  %274 = extractelement <2 x bfloat> %266, i32 1
  %275 = extractelement <2 x bfloat> %268, i32 0
  %276 = extractelement <2 x bfloat> %268, i32 1
  %277 = extractelement <2 x bfloat> %270, i32 0
  %278 = extractelement <2 x bfloat> %270, i32 1
  %279 = extractelement <2 x bfloat> %272, i32 0
  %280 = extractelement <2 x bfloat> %272, i32 1
  %281 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %263)
  %282 = extractvalue { i32, i32, i32, i32 } %281, 0
  %283 = bitcast i32 %282 to <2 x bfloat>
  %284 = extractvalue { i32, i32, i32, i32 } %281, 1
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %281, 2
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %281, 3
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractelement <2 x bfloat> %283, i32 0
  %291 = extractelement <2 x bfloat> %283, i32 1
  %292 = extractelement <2 x bfloat> %285, i32 0
  %293 = extractelement <2 x bfloat> %285, i32 1
  %294 = extractelement <2 x bfloat> %287, i32 0
  %295 = extractelement <2 x bfloat> %287, i32 1
  %296 = extractelement <2 x bfloat> %289, i32 0
  %297 = extractelement <2 x bfloat> %289, i32 1
  %298 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273)
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = getelementptr bfloat, ptr addrspace(1) %5, i64 %99
  %315 = getelementptr bfloat, ptr addrspace(1) %314, i64 %45
  %316 = getelementptr bfloat, ptr addrspace(1) %314, i64 %46
  %317 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %315)
  %318 = extractvalue { i32, i32, i32, i32 } %317, 0
  %319 = bitcast i32 %318 to <2 x bfloat>
  %320 = extractvalue { i32, i32, i32, i32 } %317, 1
  %321 = bitcast i32 %320 to <2 x bfloat>
  %322 = extractvalue { i32, i32, i32, i32 } %317, 2
  %323 = bitcast i32 %322 to <2 x bfloat>
  %324 = extractvalue { i32, i32, i32, i32 } %317, 3
  %325 = bitcast i32 %324 to <2 x bfloat>
  %326 = extractelement <2 x bfloat> %319, i32 0
  %327 = extractelement <2 x bfloat> %319, i32 1
  %328 = extractelement <2 x bfloat> %321, i32 0
  %329 = extractelement <2 x bfloat> %321, i32 1
  %330 = extractelement <2 x bfloat> %323, i32 0
  %331 = extractelement <2 x bfloat> %323, i32 1
  %332 = extractelement <2 x bfloat> %325, i32 0
  %333 = extractelement <2 x bfloat> %325, i32 1
  %334 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %316)
  %335 = extractvalue { i32, i32, i32, i32 } %334, 0
  %336 = bitcast i32 %335 to <2 x bfloat>
  %337 = extractvalue { i32, i32, i32, i32 } %334, 1
  %338 = bitcast i32 %337 to <2 x bfloat>
  %339 = extractvalue { i32, i32, i32, i32 } %334, 2
  %340 = bitcast i32 %339 to <2 x bfloat>
  %341 = extractvalue { i32, i32, i32, i32 } %334, 3
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractelement <2 x bfloat> %336, i32 0
  %344 = extractelement <2 x bfloat> %336, i32 1
  %345 = extractelement <2 x bfloat> %338, i32 0
  %346 = extractelement <2 x bfloat> %338, i32 1
  %347 = extractelement <2 x bfloat> %340, i32 0
  %348 = extractelement <2 x bfloat> %340, i32 1
  %349 = extractelement <2 x bfloat> %342, i32 0
  %350 = extractelement <2 x bfloat> %342, i32 1
  %351 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %326)
  %352 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %327)
  %353 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %328)
  %354 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329)
  %355 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %356 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %357 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %343)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %344)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %345)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = add i64 %12, 3072
  %368 = getelementptr bfloat, ptr addrspace(1) %4, i64 %367
  %369 = getelementptr bfloat, ptr addrspace(1) %368, i64 %45
  %370 = getelementptr bfloat, ptr addrspace(1) %368, i64 %46
  %371 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %369)
  %372 = extractvalue { i32, i32, i32, i32 } %371, 0
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %371, 1
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %371, 2
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractvalue { i32, i32, i32, i32 } %371, 3
  %379 = bitcast i32 %378 to <2 x bfloat>
  %380 = extractelement <2 x bfloat> %373, i32 0
  %381 = extractelement <2 x bfloat> %373, i32 1
  %382 = extractelement <2 x bfloat> %375, i32 0
  %383 = extractelement <2 x bfloat> %375, i32 1
  %384 = extractelement <2 x bfloat> %377, i32 0
  %385 = extractelement <2 x bfloat> %377, i32 1
  %386 = extractelement <2 x bfloat> %379, i32 0
  %387 = extractelement <2 x bfloat> %379, i32 1
  %388 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %370)
  %389 = extractvalue { i32, i32, i32, i32 } %388, 0
  %390 = bitcast i32 %389 to <2 x bfloat>
  %391 = extractvalue { i32, i32, i32, i32 } %388, 1
  %392 = bitcast i32 %391 to <2 x bfloat>
  %393 = extractvalue { i32, i32, i32, i32 } %388, 2
  %394 = bitcast i32 %393 to <2 x bfloat>
  %395 = extractvalue { i32, i32, i32, i32 } %388, 3
  %396 = bitcast i32 %395 to <2 x bfloat>
  %397 = extractelement <2 x bfloat> %390, i32 0
  %398 = extractelement <2 x bfloat> %390, i32 1
  %399 = extractelement <2 x bfloat> %392, i32 0
  %400 = extractelement <2 x bfloat> %392, i32 1
  %401 = extractelement <2 x bfloat> %394, i32 0
  %402 = extractelement <2 x bfloat> %394, i32 1
  %403 = extractelement <2 x bfloat> %396, i32 0
  %404 = extractelement <2 x bfloat> %396, i32 1
  %405 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380)
  %406 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %407 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %408 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %386)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = getelementptr bfloat, ptr addrspace(1) %3, i64 %99
  %422 = getelementptr bfloat, ptr addrspace(1) %421, i64 %45
  %423 = getelementptr bfloat, ptr addrspace(1) %421, i64 %46
  %424 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422)
  %425 = extractvalue { i32, i32, i32, i32 } %424, 0
  %426 = bitcast i32 %425 to <2 x bfloat>
  %427 = extractvalue { i32, i32, i32, i32 } %424, 1
  %428 = bitcast i32 %427 to <2 x bfloat>
  %429 = extractvalue { i32, i32, i32, i32 } %424, 2
  %430 = bitcast i32 %429 to <2 x bfloat>
  %431 = extractvalue { i32, i32, i32, i32 } %424, 3
  %432 = bitcast i32 %431 to <2 x bfloat>
  %433 = extractelement <2 x bfloat> %426, i32 0
  %434 = extractelement <2 x bfloat> %426, i32 1
  %435 = extractelement <2 x bfloat> %428, i32 0
  %436 = extractelement <2 x bfloat> %428, i32 1
  %437 = extractelement <2 x bfloat> %430, i32 0
  %438 = extractelement <2 x bfloat> %430, i32 1
  %439 = extractelement <2 x bfloat> %432, i32 0
  %440 = extractelement <2 x bfloat> %432, i32 1
  %441 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %423)
  %442 = extractvalue { i32, i32, i32, i32 } %441, 0
  %443 = bitcast i32 %442 to <2 x bfloat>
  %444 = extractvalue { i32, i32, i32, i32 } %441, 1
  %445 = bitcast i32 %444 to <2 x bfloat>
  %446 = extractvalue { i32, i32, i32, i32 } %441, 2
  %447 = bitcast i32 %446 to <2 x bfloat>
  %448 = extractvalue { i32, i32, i32, i32 } %441, 3
  %449 = bitcast i32 %448 to <2 x bfloat>
  %450 = extractelement <2 x bfloat> %443, i32 0
  %451 = extractelement <2 x bfloat> %443, i32 1
  %452 = extractelement <2 x bfloat> %445, i32 0
  %453 = extractelement <2 x bfloat> %445, i32 1
  %454 = extractelement <2 x bfloat> %447, i32 0
  %455 = extractelement <2 x bfloat> %447, i32 1
  %456 = extractelement <2 x bfloat> %449, i32 0
  %457 = extractelement <2 x bfloat> %449, i32 1
  %458 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433)
  %459 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434)
  %460 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435)
  %461 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436)
  %462 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437)
  %463 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438)
  %464 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439)
  %465 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %466 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450)
  %467 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451)
  %468 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452)
  %469 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453)
  %470 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454)
  %471 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455)
  %472 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456)
  %473 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457)
  %474 = fadd float %405, %458
  %475 = fadd float %406, %459
  %476 = fadd float %407, %460
  %477 = fadd float %408, %461
  %478 = fadd float %409, %462
  %479 = fadd float %410, %463
  %480 = fadd float %411, %464
  %481 = fadd float %412, %465
  %482 = fadd float %413, %466
  %483 = fadd float %414, %467
  %484 = fadd float %415, %468
  %485 = fadd float %416, %469
  %486 = fadd float %417, %470
  %487 = fadd float %418, %471
  %488 = fadd float %419, %472
  %489 = fadd float %420, %473
  %490 = fadd float %351, %474
  %491 = fadd float %352, %475
  %492 = fadd float %353, %476
  %493 = fadd float %354, %477
  %494 = fadd float %355, %478
  %495 = fadd float %356, %479
  %496 = fadd float %357, %480
  %497 = fadd float %358, %481
  %498 = fadd float %359, %482
  %499 = fadd float %360, %483
  %500 = fadd float %361, %484
  %501 = fadd float %362, %485
  %502 = fadd float %363, %486
  %503 = fadd float %364, %487
  %504 = fadd float %365, %488
  %505 = fadd float %366, %489
  %506 = fadd float %298, %490
  %507 = fadd float %299, %491
  %508 = fadd float %300, %492
  %509 = fadd float %301, %493
  %510 = fadd float %302, %494
  %511 = fadd float %303, %495
  %512 = fadd float %304, %496
  %513 = fadd float %305, %497
  %514 = fadd float %306, %498
  %515 = fadd float %307, %499
  %516 = fadd float %308, %500
  %517 = fadd float %309, %501
  %518 = fadd float %310, %502
  %519 = fadd float %311, %503
  %520 = fadd float %312, %504
  %521 = fadd float %313, %505
  %522 = fadd float %244, %506
  %523 = fadd float %245, %507
  %524 = fadd float %246, %508
  %525 = fadd float %247, %509
  %526 = fadd float %248, %510
  %527 = fadd float %249, %511
  %528 = fadd float %250, %512
  %529 = fadd float %251, %513
  %530 = fadd float %252, %514
  %531 = fadd float %253, %515
  %532 = fadd float %254, %516
  %533 = fadd float %255, %517
  %534 = fadd float %256, %518
  %535 = fadd float %257, %519
  %536 = fadd float %258, %520
  %537 = fadd float %259, %521
  %538 = fadd float %191, %522
  %539 = fadd float %192, %523
  %540 = fadd float %193, %524
  %541 = fadd float %194, %525
  %542 = fadd float %195, %526
  %543 = fadd float %196, %527
  %544 = fadd float %197, %528
  %545 = fadd float %198, %529
  %546 = fadd float %199, %530
  %547 = fadd float %200, %531
  %548 = fadd float %201, %532
  %549 = fadd float %202, %533
  %550 = fadd float %203, %534
  %551 = fadd float %204, %535
  %552 = fadd float %205, %536
  %553 = fadd float %206, %537
  %554 = fadd float %137, %538
  %555 = fadd float %138, %539
  %556 = fadd float %139, %540
  %557 = fadd float %140, %541
  %558 = fadd float %141, %542
  %559 = fadd float %142, %543
  %560 = fadd float %143, %544
  %561 = fadd float %144, %545
  %562 = fadd float %145, %546
  %563 = fadd float %146, %547
  %564 = fadd float %147, %548
  %565 = fadd float %148, %549
  %566 = fadd float %149, %550
  %567 = fadd float %150, %551
  %568 = fadd float %151, %552
  %569 = fadd float %152, %553
  %570 = fadd float %83, %554
  %571 = fadd float %84, %555
  %572 = fadd float %85, %556
  %573 = fadd float %86, %557
  %574 = fadd float %87, %558
  %575 = fadd float %88, %559
  %576 = fadd float %89, %560
  %577 = fadd float %90, %561
  %578 = fadd float %91, %562
  %579 = fadd float %92, %563
  %580 = fadd float %93, %564
  %581 = fadd float %94, %565
  %582 = fadd float %95, %566
  %583 = fadd float %96, %567
  %584 = fadd float %97, %568
  %585 = fadd float %98, %569
  %586 = fmul float %570, %570
  %587 = fmul float %571, %571
  %588 = fmul float %572, %572
  %589 = fmul float %573, %573
  %590 = fmul float %574, %574
  %591 = fmul float %575, %575
  %592 = fmul float %576, %576
  %593 = fmul float %577, %577
  %594 = fmul float %578, %578
  %595 = fmul float %579, %579
  %596 = fmul float %580, %580
  %597 = fmul float %581, %581
  %598 = fmul float %582, %582
  %599 = fmul float %583, %583
  %600 = fmul float %584, %584
  %601 = fmul float %585, %585
  %602 = fadd float %586, %587
  %603 = fadd float %602, %588
  %604 = fadd float %603, %589
  %605 = fadd float %604, %590
  %606 = fadd float %605, %591
  %607 = fadd float %606, %592
  %608 = fadd float %607, %593
  %609 = fadd float %608, %594
  %610 = fadd float %609, %595
  %611 = fadd float %610, %596
  %612 = fadd float %611, %597
  %613 = fadd float %612, %598
  %614 = fadd float %613, %599
  %615 = fadd float %614, %600
  %616 = fadd float %615, %601
  %617 = bitcast float %616 to i32
  %618 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %617, i32 16, i32 31)
  %619 = bitcast i32 %618 to float
  %620 = fadd float %616, %619
  %621 = bitcast float %620 to i32
  %622 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %621, i32 8, i32 31)
  %623 = bitcast i32 %622 to float
  %624 = fadd float %620, %623
  %625 = bitcast float %624 to i32
  %626 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %625, i32 4, i32 31)
  %627 = bitcast i32 %626 to float
  %628 = fadd float %624, %627
  %629 = bitcast float %628 to i32
  %630 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %629, i32 2, i32 31)
  %631 = bitcast i32 %630 to float
  %632 = fadd float %628, %631
  %633 = bitcast float %632 to i32
  %634 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %633, i32 1, i32 31)
  %635 = bitcast i32 %634 to float
  %636 = fadd float %632, %635
  %637 = urem i32 %15, 32
  %638 = urem i32 %16, 2
  %639 = icmp eq i32 %637, 0
  %640 = and i1 true, %639
  %641 = add i32 0, %638
  %642 = getelementptr float, ptr addrspace(3) @global_smem, i32 %641
  %643 = insertelement <1 x float> undef, float %636, i32 0
  %644 = extractelement <1 x float> %643, i32 0
  %645 = bitcast float %644 to i32
  %646 = insertelement <1 x i32> undef, i32 %645, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %642, <1 x i32> %646, i1 %640)
  call void @llvm.nvvm.barrier0()
  %647 = icmp slt i32 %14, 2
  %648 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %649 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %648, i1 %647)
  %650 = insertelement <1 x i32> undef, i32 %649, i32 0
  %651 = extractelement <1 x i32> %650, i32 0
  %652 = bitcast i32 %651 to float
  %653 = insertelement <1 x float> undef, float %652, i32 0
  %654 = extractelement <1 x float> %653, i32 0
  %655 = bitcast float %654 to i32
  %656 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %655, i32 1, i32 31)
  %657 = bitcast i32 %656 to float
  %658 = fadd float %654, %657
  %659 = urem i32 %15, 2
  %660 = icmp eq i32 %659, 0
  %661 = and i1 %647, %660
  %662 = insertelement <1 x float> undef, float %658, i32 0
  %663 = extractelement <1 x float> %662, i32 0
  %664 = bitcast float %663 to i32
  %665 = insertelement <1 x i32> undef, i32 %664, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %648, <1 x i32> %665, i1 %661)
  call void @llvm.nvvm.barrier0()
  %666 = load float, ptr addrspace(3) @global_smem, align 4
  %667 = fmul float %666, 0x3F50000000000000
  %668 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %669 = bitcast i32 %668 to <1 x float>
  %670 = extractelement <1 x float> %669, i32 0
  %671 = fadd float %667, %670
  %672 = call float @__nv_rsqrtf(float %671)
  %673 = fmul float %570, %672
  %674 = fmul float %571, %672
  %675 = fmul float %572, %672
  %676 = fmul float %573, %672
  %677 = fmul float %574, %672
  %678 = fmul float %575, %672
  %679 = fmul float %576, %672
  %680 = fmul float %577, %672
  %681 = fmul float %578, %672
  %682 = fmul float %579, %672
  %683 = fmul float %580, %672
  %684 = fmul float %581, %672
  %685 = fmul float %582, %672
  %686 = fmul float %583, %672
  %687 = fmul float %584, %672
  %688 = fmul float %585, %672
  %689 = getelementptr bfloat, ptr addrspace(1) %2, i64 %45
  %690 = getelementptr bfloat, ptr addrspace(1) %2, i64 %46
  %691 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %689)
  %692 = extractvalue { i32, i32, i32, i32 } %691, 0
  %693 = bitcast i32 %692 to <2 x bfloat>
  %694 = extractvalue { i32, i32, i32, i32 } %691, 1
  %695 = bitcast i32 %694 to <2 x bfloat>
  %696 = extractvalue { i32, i32, i32, i32 } %691, 2
  %697 = bitcast i32 %696 to <2 x bfloat>
  %698 = extractvalue { i32, i32, i32, i32 } %691, 3
  %699 = bitcast i32 %698 to <2 x bfloat>
  %700 = extractelement <2 x bfloat> %693, i32 0
  %701 = extractelement <2 x bfloat> %693, i32 1
  %702 = extractelement <2 x bfloat> %695, i32 0
  %703 = extractelement <2 x bfloat> %695, i32 1
  %704 = extractelement <2 x bfloat> %697, i32 0
  %705 = extractelement <2 x bfloat> %697, i32 1
  %706 = extractelement <2 x bfloat> %699, i32 0
  %707 = extractelement <2 x bfloat> %699, i32 1
  %708 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %690)
  %709 = extractvalue { i32, i32, i32, i32 } %708, 0
  %710 = bitcast i32 %709 to <2 x bfloat>
  %711 = extractvalue { i32, i32, i32, i32 } %708, 1
  %712 = bitcast i32 %711 to <2 x bfloat>
  %713 = extractvalue { i32, i32, i32, i32 } %708, 2
  %714 = bitcast i32 %713 to <2 x bfloat>
  %715 = extractvalue { i32, i32, i32, i32 } %708, 3
  %716 = bitcast i32 %715 to <2 x bfloat>
  %717 = extractelement <2 x bfloat> %710, i32 0
  %718 = extractelement <2 x bfloat> %710, i32 1
  %719 = extractelement <2 x bfloat> %712, i32 0
  %720 = extractelement <2 x bfloat> %712, i32 1
  %721 = extractelement <2 x bfloat> %714, i32 0
  %722 = extractelement <2 x bfloat> %714, i32 1
  %723 = extractelement <2 x bfloat> %716, i32 0
  %724 = extractelement <2 x bfloat> %716, i32 1
  %725 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %700)
  %726 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %701)
  %727 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %702)
  %728 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %703)
  %729 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %704)
  %730 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %705)
  %731 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %706)
  %732 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %707)
  %733 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %717)
  %734 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %718)
  %735 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %719)
  %736 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %720)
  %737 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %721)
  %738 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %722)
  %739 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %723)
  %740 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %724)
  %741 = fmul float %673, %725
  %742 = fmul float %674, %726
  %743 = fmul float %675, %727
  %744 = fmul float %676, %728
  %745 = fmul float %677, %729
  %746 = fmul float %678, %730
  %747 = fmul float %679, %731
  %748 = fmul float %680, %732
  %749 = fmul float %681, %733
  %750 = fmul float %682, %734
  %751 = fmul float %683, %735
  %752 = fmul float %684, %736
  %753 = fmul float %685, %737
  %754 = fmul float %686, %738
  %755 = fmul float %687, %739
  %756 = fmul float %688, %740
  %757 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %741)
  %758 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %742)
  %759 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %743)
  %760 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %744)
  %761 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %745)
  %762 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %746)
  %763 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %747)
  %764 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %748)
  %765 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %749)
  %766 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %750)
  %767 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %751)
  %768 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %752)
  %769 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %753)
  %770 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %754)
  %771 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %755)
  %772 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %756)
  %773 = getelementptr bfloat, ptr addrspace(1) %8, i64 %99
  %774 = getelementptr bfloat, ptr addrspace(1) %773, i64 %45
  %775 = getelementptr bfloat, ptr addrspace(1) %773, i64 %46
  %776 = insertelement <2 x bfloat> undef, bfloat %757, i32 0
  %777 = insertelement <2 x bfloat> %776, bfloat %758, i32 1
  %778 = bitcast <2 x bfloat> %777 to i32
  %779 = insertelement <2 x bfloat> undef, bfloat %759, i32 0
  %780 = insertelement <2 x bfloat> %779, bfloat %760, i32 1
  %781 = bitcast <2 x bfloat> %780 to i32
  %782 = insertelement <2 x bfloat> undef, bfloat %761, i32 0
  %783 = insertelement <2 x bfloat> %782, bfloat %762, i32 1
  %784 = bitcast <2 x bfloat> %783 to i32
  %785 = insertelement <2 x bfloat> undef, bfloat %763, i32 0
  %786 = insertelement <2 x bfloat> %785, bfloat %764, i32 1
  %787 = bitcast <2 x bfloat> %786 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %778, i32 %781, i32 %784, i32 %787, ptr addrspace(1) %774)
  %788 = insertelement <2 x bfloat> undef, bfloat %765, i32 0
  %789 = insertelement <2 x bfloat> %788, bfloat %766, i32 1
  %790 = bitcast <2 x bfloat> %789 to i32
  %791 = insertelement <2 x bfloat> undef, bfloat %767, i32 0
  %792 = insertelement <2 x bfloat> %791, bfloat %768, i32 1
  %793 = bitcast <2 x bfloat> %792 to i32
  %794 = insertelement <2 x bfloat> undef, bfloat %769, i32 0
  %795 = insertelement <2 x bfloat> %794, bfloat %770, i32 1
  %796 = bitcast <2 x bfloat> %795 to i32
  %797 = insertelement <2 x bfloat> undef, bfloat %771, i32 0
  %798 = insertelement <2 x bfloat> %797, bfloat %772, i32 1
  %799 = bitcast <2 x bfloat> %798 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %790, i32 %793, i32 %796, i32 %799, ptr addrspace(1) %775)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_56_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_56(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %8 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %9 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %10 = addrspacecast ptr null to ptr addrspace(1)
  %11 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %12 = sext i32 %11 to i64
  %13 = mul i64 %12, 1024
  %14 = getelementptr bfloat, ptr addrspace(1) %2, i64 %13
  %15 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %16 = urem i32 %15, 32
  %17 = udiv i32 %15, 32
  %18 = and i32 %16, 1
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 8
  %21 = xor i32 0, %20
  %22 = and i32 %16, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 0, i32 16
  %25 = xor i32 %21, %24
  %26 = and i32 %16, 4
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 0, i32 32
  %29 = xor i32 %25, %28
  %30 = and i32 %16, 8
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, i32 0, i32 64
  %33 = xor i32 %29, %32
  %34 = and i32 %16, 16
  %35 = icmp eq i32 %34, 0
  %36 = select i1 %35, i32 0, i32 128
  %37 = xor i32 %33, %36
  %38 = and i32 %17, 1
  %39 = icmp eq i32 %38, 0
  %40 = select i1 %39, i32 0, i32 256
  %41 = xor i32 %37, %40
  %42 = xor i32 %41, 0
  %43 = xor i32 %41, 512
  %44 = add i32 %42, 0
  %45 = add i32 %43, 0
  %46 = sext i32 %44 to i64
  %47 = sext i32 %45 to i64
  %48 = getelementptr bfloat, ptr addrspace(1) %14, i64 %46
  %49 = getelementptr bfloat, ptr addrspace(1) %14, i64 %47
  %50 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %48)
  %51 = extractvalue { i32, i32, i32, i32 } %50, 0
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractvalue { i32, i32, i32, i32 } %50, 1
  %54 = bitcast i32 %53 to <2 x bfloat>
  %55 = extractvalue { i32, i32, i32, i32 } %50, 2
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %50, 3
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractelement <2 x bfloat> %52, i32 0
  %60 = extractelement <2 x bfloat> %52, i32 1
  %61 = extractelement <2 x bfloat> %54, i32 0
  %62 = extractelement <2 x bfloat> %54, i32 1
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %49)
  %68 = extractvalue { i32, i32, i32, i32 } %67, 0
  %69 = bitcast i32 %68 to <2 x bfloat>
  %70 = extractvalue { i32, i32, i32, i32 } %67, 1
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractvalue { i32, i32, i32, i32 } %67, 2
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %67, 3
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractelement <2 x bfloat> %69, i32 0
  %77 = extractelement <2 x bfloat> %69, i32 1
  %78 = extractelement <2 x bfloat> %71, i32 0
  %79 = extractelement <2 x bfloat> %71, i32 1
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = mul i64 %12, 4096
  %101 = getelementptr bfloat, ptr addrspace(1) %5, i64 %100
  %102 = getelementptr bfloat, ptr addrspace(1) %101, i64 %46
  %103 = getelementptr bfloat, ptr addrspace(1) %101, i64 %47
  %104 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %102)
  %105 = extractvalue { i32, i32, i32, i32 } %104, 0
  %106 = bitcast i32 %105 to <2 x bfloat>
  %107 = extractvalue { i32, i32, i32, i32 } %104, 1
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractvalue { i32, i32, i32, i32 } %104, 2
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %104, 3
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractelement <2 x bfloat> %106, i32 0
  %114 = extractelement <2 x bfloat> %106, i32 1
  %115 = extractelement <2 x bfloat> %108, i32 0
  %116 = extractelement <2 x bfloat> %108, i32 1
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %103)
  %122 = extractvalue { i32, i32, i32, i32 } %121, 0
  %123 = bitcast i32 %122 to <2 x bfloat>
  %124 = extractvalue { i32, i32, i32, i32 } %121, 1
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractvalue { i32, i32, i32, i32 } %121, 2
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %121, 3
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractelement <2 x bfloat> %123, i32 0
  %131 = extractelement <2 x bfloat> %123, i32 1
  %132 = extractelement <2 x bfloat> %125, i32 0
  %133 = extractelement <2 x bfloat> %125, i32 1
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = getelementptr bfloat, ptr addrspace(1) %8, i64 %13
  %155 = getelementptr bfloat, ptr addrspace(1) %154, i64 %46
  %156 = getelementptr bfloat, ptr addrspace(1) %154, i64 %47
  %157 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %155)
  %158 = extractvalue { i32, i32, i32, i32 } %157, 0
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %157, 1
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %157, 2
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractvalue { i32, i32, i32, i32 } %157, 3
  %165 = bitcast i32 %164 to <2 x bfloat>
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = extractelement <2 x bfloat> %165, i32 0
  %173 = extractelement <2 x bfloat> %165, i32 1
  %174 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %156)
  %175 = extractvalue { i32, i32, i32, i32 } %174, 0
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %174, 1
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %174, 2
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %174, 3
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = extractelement <2 x bfloat> %182, i32 0
  %190 = extractelement <2 x bfloat> %182, i32 1
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = add i64 %100, 1024
  %208 = getelementptr bfloat, ptr addrspace(1) %5, i64 %207
  %209 = getelementptr bfloat, ptr addrspace(1) %208, i64 %46
  %210 = getelementptr bfloat, ptr addrspace(1) %208, i64 %47
  %211 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %209)
  %212 = extractvalue { i32, i32, i32, i32 } %211, 0
  %213 = bitcast i32 %212 to <2 x bfloat>
  %214 = extractvalue { i32, i32, i32, i32 } %211, 1
  %215 = bitcast i32 %214 to <2 x bfloat>
  %216 = extractvalue { i32, i32, i32, i32 } %211, 2
  %217 = bitcast i32 %216 to <2 x bfloat>
  %218 = extractvalue { i32, i32, i32, i32 } %211, 3
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractelement <2 x bfloat> %213, i32 0
  %221 = extractelement <2 x bfloat> %213, i32 1
  %222 = extractelement <2 x bfloat> %215, i32 0
  %223 = extractelement <2 x bfloat> %215, i32 1
  %224 = extractelement <2 x bfloat> %217, i32 0
  %225 = extractelement <2 x bfloat> %217, i32 1
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %210)
  %229 = extractvalue { i32, i32, i32, i32 } %228, 0
  %230 = bitcast i32 %229 to <2 x bfloat>
  %231 = extractvalue { i32, i32, i32, i32 } %228, 1
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %228, 2
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %228, 3
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractelement <2 x bfloat> %230, i32 0
  %238 = extractelement <2 x bfloat> %230, i32 1
  %239 = extractelement <2 x bfloat> %232, i32 0
  %240 = extractelement <2 x bfloat> %232, i32 1
  %241 = extractelement <2 x bfloat> %234, i32 0
  %242 = extractelement <2 x bfloat> %234, i32 1
  %243 = extractelement <2 x bfloat> %236, i32 0
  %244 = extractelement <2 x bfloat> %236, i32 1
  %245 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %246 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %247 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = getelementptr bfloat, ptr addrspace(1) %7, i64 %13
  %262 = getelementptr bfloat, ptr addrspace(1) %261, i64 %46
  %263 = getelementptr bfloat, ptr addrspace(1) %261, i64 %47
  %264 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %262)
  %265 = extractvalue { i32, i32, i32, i32 } %264, 0
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractvalue { i32, i32, i32, i32 } %264, 1
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %264, 2
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = extractvalue { i32, i32, i32, i32 } %264, 3
  %272 = bitcast i32 %271 to <2 x bfloat>
  %273 = extractelement <2 x bfloat> %266, i32 0
  %274 = extractelement <2 x bfloat> %266, i32 1
  %275 = extractelement <2 x bfloat> %268, i32 0
  %276 = extractelement <2 x bfloat> %268, i32 1
  %277 = extractelement <2 x bfloat> %270, i32 0
  %278 = extractelement <2 x bfloat> %270, i32 1
  %279 = extractelement <2 x bfloat> %272, i32 0
  %280 = extractelement <2 x bfloat> %272, i32 1
  %281 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %263)
  %282 = extractvalue { i32, i32, i32, i32 } %281, 0
  %283 = bitcast i32 %282 to <2 x bfloat>
  %284 = extractvalue { i32, i32, i32, i32 } %281, 1
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %281, 2
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %281, 3
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractelement <2 x bfloat> %283, i32 0
  %291 = extractelement <2 x bfloat> %283, i32 1
  %292 = extractelement <2 x bfloat> %285, i32 0
  %293 = extractelement <2 x bfloat> %285, i32 1
  %294 = extractelement <2 x bfloat> %287, i32 0
  %295 = extractelement <2 x bfloat> %287, i32 1
  %296 = extractelement <2 x bfloat> %289, i32 0
  %297 = extractelement <2 x bfloat> %289, i32 1
  %298 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273)
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = add i64 %100, 2048
  %315 = getelementptr bfloat, ptr addrspace(1) %5, i64 %314
  %316 = getelementptr bfloat, ptr addrspace(1) %315, i64 %46
  %317 = getelementptr bfloat, ptr addrspace(1) %315, i64 %47
  %318 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %316)
  %319 = extractvalue { i32, i32, i32, i32 } %318, 0
  %320 = bitcast i32 %319 to <2 x bfloat>
  %321 = extractvalue { i32, i32, i32, i32 } %318, 1
  %322 = bitcast i32 %321 to <2 x bfloat>
  %323 = extractvalue { i32, i32, i32, i32 } %318, 2
  %324 = bitcast i32 %323 to <2 x bfloat>
  %325 = extractvalue { i32, i32, i32, i32 } %318, 3
  %326 = bitcast i32 %325 to <2 x bfloat>
  %327 = extractelement <2 x bfloat> %320, i32 0
  %328 = extractelement <2 x bfloat> %320, i32 1
  %329 = extractelement <2 x bfloat> %322, i32 0
  %330 = extractelement <2 x bfloat> %322, i32 1
  %331 = extractelement <2 x bfloat> %324, i32 0
  %332 = extractelement <2 x bfloat> %324, i32 1
  %333 = extractelement <2 x bfloat> %326, i32 0
  %334 = extractelement <2 x bfloat> %326, i32 1
  %335 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %317)
  %336 = extractvalue { i32, i32, i32, i32 } %335, 0
  %337 = bitcast i32 %336 to <2 x bfloat>
  %338 = extractvalue { i32, i32, i32, i32 } %335, 1
  %339 = bitcast i32 %338 to <2 x bfloat>
  %340 = extractvalue { i32, i32, i32, i32 } %335, 2
  %341 = bitcast i32 %340 to <2 x bfloat>
  %342 = extractvalue { i32, i32, i32, i32 } %335, 3
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractelement <2 x bfloat> %337, i32 0
  %345 = extractelement <2 x bfloat> %337, i32 1
  %346 = extractelement <2 x bfloat> %339, i32 0
  %347 = extractelement <2 x bfloat> %339, i32 1
  %348 = extractelement <2 x bfloat> %341, i32 0
  %349 = extractelement <2 x bfloat> %341, i32 1
  %350 = extractelement <2 x bfloat> %343, i32 0
  %351 = extractelement <2 x bfloat> %343, i32 1
  %352 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %327)
  %353 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %328)
  %354 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329)
  %355 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %356 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %357 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %344)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %345)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = getelementptr bfloat, ptr addrspace(1) %6, i64 %13
  %369 = getelementptr bfloat, ptr addrspace(1) %368, i64 %46
  %370 = getelementptr bfloat, ptr addrspace(1) %368, i64 %47
  %371 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %369)
  %372 = extractvalue { i32, i32, i32, i32 } %371, 0
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %371, 1
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %371, 2
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractvalue { i32, i32, i32, i32 } %371, 3
  %379 = bitcast i32 %378 to <2 x bfloat>
  %380 = extractelement <2 x bfloat> %373, i32 0
  %381 = extractelement <2 x bfloat> %373, i32 1
  %382 = extractelement <2 x bfloat> %375, i32 0
  %383 = extractelement <2 x bfloat> %375, i32 1
  %384 = extractelement <2 x bfloat> %377, i32 0
  %385 = extractelement <2 x bfloat> %377, i32 1
  %386 = extractelement <2 x bfloat> %379, i32 0
  %387 = extractelement <2 x bfloat> %379, i32 1
  %388 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %370)
  %389 = extractvalue { i32, i32, i32, i32 } %388, 0
  %390 = bitcast i32 %389 to <2 x bfloat>
  %391 = extractvalue { i32, i32, i32, i32 } %388, 1
  %392 = bitcast i32 %391 to <2 x bfloat>
  %393 = extractvalue { i32, i32, i32, i32 } %388, 2
  %394 = bitcast i32 %393 to <2 x bfloat>
  %395 = extractvalue { i32, i32, i32, i32 } %388, 3
  %396 = bitcast i32 %395 to <2 x bfloat>
  %397 = extractelement <2 x bfloat> %390, i32 0
  %398 = extractelement <2 x bfloat> %390, i32 1
  %399 = extractelement <2 x bfloat> %392, i32 0
  %400 = extractelement <2 x bfloat> %392, i32 1
  %401 = extractelement <2 x bfloat> %394, i32 0
  %402 = extractelement <2 x bfloat> %394, i32 1
  %403 = extractelement <2 x bfloat> %396, i32 0
  %404 = extractelement <2 x bfloat> %396, i32 1
  %405 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380)
  %406 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %407 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %408 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %386)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = add i64 %100, 3072
  %422 = getelementptr bfloat, ptr addrspace(1) %5, i64 %421
  %423 = getelementptr bfloat, ptr addrspace(1) %422, i64 %46
  %424 = getelementptr bfloat, ptr addrspace(1) %422, i64 %47
  %425 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %423)
  %426 = extractvalue { i32, i32, i32, i32 } %425, 0
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = extractvalue { i32, i32, i32, i32 } %425, 1
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractvalue { i32, i32, i32, i32 } %425, 2
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractvalue { i32, i32, i32, i32 } %425, 3
  %433 = bitcast i32 %432 to <2 x bfloat>
  %434 = extractelement <2 x bfloat> %427, i32 0
  %435 = extractelement <2 x bfloat> %427, i32 1
  %436 = extractelement <2 x bfloat> %429, i32 0
  %437 = extractelement <2 x bfloat> %429, i32 1
  %438 = extractelement <2 x bfloat> %431, i32 0
  %439 = extractelement <2 x bfloat> %431, i32 1
  %440 = extractelement <2 x bfloat> %433, i32 0
  %441 = extractelement <2 x bfloat> %433, i32 1
  %442 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %424)
  %443 = extractvalue { i32, i32, i32, i32 } %442, 0
  %444 = bitcast i32 %443 to <2 x bfloat>
  %445 = extractvalue { i32, i32, i32, i32 } %442, 1
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %442, 2
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractvalue { i32, i32, i32, i32 } %442, 3
  %450 = bitcast i32 %449 to <2 x bfloat>
  %451 = extractelement <2 x bfloat> %444, i32 0
  %452 = extractelement <2 x bfloat> %444, i32 1
  %453 = extractelement <2 x bfloat> %446, i32 0
  %454 = extractelement <2 x bfloat> %446, i32 1
  %455 = extractelement <2 x bfloat> %448, i32 0
  %456 = extractelement <2 x bfloat> %448, i32 1
  %457 = extractelement <2 x bfloat> %450, i32 0
  %458 = extractelement <2 x bfloat> %450, i32 1
  %459 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434)
  %460 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435)
  %461 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436)
  %462 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437)
  %463 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438)
  %464 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439)
  %465 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %466 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %467 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451)
  %468 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452)
  %469 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453)
  %470 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454)
  %471 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455)
  %472 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456)
  %473 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457)
  %474 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458)
  %475 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %476 = getelementptr bfloat, ptr addrspace(1) %475, i64 %46
  %477 = getelementptr bfloat, ptr addrspace(1) %475, i64 %47
  %478 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %476)
  %479 = extractvalue { i32, i32, i32, i32 } %478, 0
  %480 = bitcast i32 %479 to <2 x bfloat>
  %481 = extractvalue { i32, i32, i32, i32 } %478, 1
  %482 = bitcast i32 %481 to <2 x bfloat>
  %483 = extractvalue { i32, i32, i32, i32 } %478, 2
  %484 = bitcast i32 %483 to <2 x bfloat>
  %485 = extractvalue { i32, i32, i32, i32 } %478, 3
  %486 = bitcast i32 %485 to <2 x bfloat>
  %487 = extractelement <2 x bfloat> %480, i32 0
  %488 = extractelement <2 x bfloat> %480, i32 1
  %489 = extractelement <2 x bfloat> %482, i32 0
  %490 = extractelement <2 x bfloat> %482, i32 1
  %491 = extractelement <2 x bfloat> %484, i32 0
  %492 = extractelement <2 x bfloat> %484, i32 1
  %493 = extractelement <2 x bfloat> %486, i32 0
  %494 = extractelement <2 x bfloat> %486, i32 1
  %495 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %477)
  %496 = extractvalue { i32, i32, i32, i32 } %495, 0
  %497 = bitcast i32 %496 to <2 x bfloat>
  %498 = extractvalue { i32, i32, i32, i32 } %495, 1
  %499 = bitcast i32 %498 to <2 x bfloat>
  %500 = extractvalue { i32, i32, i32, i32 } %495, 2
  %501 = bitcast i32 %500 to <2 x bfloat>
  %502 = extractvalue { i32, i32, i32, i32 } %495, 3
  %503 = bitcast i32 %502 to <2 x bfloat>
  %504 = extractelement <2 x bfloat> %497, i32 0
  %505 = extractelement <2 x bfloat> %497, i32 1
  %506 = extractelement <2 x bfloat> %499, i32 0
  %507 = extractelement <2 x bfloat> %499, i32 1
  %508 = extractelement <2 x bfloat> %501, i32 0
  %509 = extractelement <2 x bfloat> %501, i32 1
  %510 = extractelement <2 x bfloat> %503, i32 0
  %511 = extractelement <2 x bfloat> %503, i32 1
  %512 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %487)
  %513 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %488)
  %514 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %489)
  %515 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %490)
  %516 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %491)
  %517 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %492)
  %518 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %493)
  %519 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %494)
  %520 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504)
  %521 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505)
  %522 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %523 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %524 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511)
  %528 = fadd float %459, %512
  %529 = fadd float %460, %513
  %530 = fadd float %461, %514
  %531 = fadd float %462, %515
  %532 = fadd float %463, %516
  %533 = fadd float %464, %517
  %534 = fadd float %465, %518
  %535 = fadd float %466, %519
  %536 = fadd float %467, %520
  %537 = fadd float %468, %521
  %538 = fadd float %469, %522
  %539 = fadd float %470, %523
  %540 = fadd float %471, %524
  %541 = fadd float %472, %525
  %542 = fadd float %473, %526
  %543 = fadd float %474, %527
  %544 = fadd float %405, %528
  %545 = fadd float %406, %529
  %546 = fadd float %407, %530
  %547 = fadd float %408, %531
  %548 = fadd float %409, %532
  %549 = fadd float %410, %533
  %550 = fadd float %411, %534
  %551 = fadd float %412, %535
  %552 = fadd float %413, %536
  %553 = fadd float %414, %537
  %554 = fadd float %415, %538
  %555 = fadd float %416, %539
  %556 = fadd float %417, %540
  %557 = fadd float %418, %541
  %558 = fadd float %419, %542
  %559 = fadd float %420, %543
  %560 = fadd float %352, %544
  %561 = fadd float %353, %545
  %562 = fadd float %354, %546
  %563 = fadd float %355, %547
  %564 = fadd float %356, %548
  %565 = fadd float %357, %549
  %566 = fadd float %358, %550
  %567 = fadd float %359, %551
  %568 = fadd float %360, %552
  %569 = fadd float %361, %553
  %570 = fadd float %362, %554
  %571 = fadd float %363, %555
  %572 = fadd float %364, %556
  %573 = fadd float %365, %557
  %574 = fadd float %366, %558
  %575 = fadd float %367, %559
  %576 = fadd float %298, %560
  %577 = fadd float %299, %561
  %578 = fadd float %300, %562
  %579 = fadd float %301, %563
  %580 = fadd float %302, %564
  %581 = fadd float %303, %565
  %582 = fadd float %304, %566
  %583 = fadd float %305, %567
  %584 = fadd float %306, %568
  %585 = fadd float %307, %569
  %586 = fadd float %308, %570
  %587 = fadd float %309, %571
  %588 = fadd float %310, %572
  %589 = fadd float %311, %573
  %590 = fadd float %312, %574
  %591 = fadd float %313, %575
  %592 = fadd float %245, %576
  %593 = fadd float %246, %577
  %594 = fadd float %247, %578
  %595 = fadd float %248, %579
  %596 = fadd float %249, %580
  %597 = fadd float %250, %581
  %598 = fadd float %251, %582
  %599 = fadd float %252, %583
  %600 = fadd float %253, %584
  %601 = fadd float %254, %585
  %602 = fadd float %255, %586
  %603 = fadd float %256, %587
  %604 = fadd float %257, %588
  %605 = fadd float %258, %589
  %606 = fadd float %259, %590
  %607 = fadd float %260, %591
  %608 = fadd float %191, %592
  %609 = fadd float %192, %593
  %610 = fadd float %193, %594
  %611 = fadd float %194, %595
  %612 = fadd float %195, %596
  %613 = fadd float %196, %597
  %614 = fadd float %197, %598
  %615 = fadd float %198, %599
  %616 = fadd float %199, %600
  %617 = fadd float %200, %601
  %618 = fadd float %201, %602
  %619 = fadd float %202, %603
  %620 = fadd float %203, %604
  %621 = fadd float %204, %605
  %622 = fadd float %205, %606
  %623 = fadd float %206, %607
  %624 = fadd float %138, %608
  %625 = fadd float %139, %609
  %626 = fadd float %140, %610
  %627 = fadd float %141, %611
  %628 = fadd float %142, %612
  %629 = fadd float %143, %613
  %630 = fadd float %144, %614
  %631 = fadd float %145, %615
  %632 = fadd float %146, %616
  %633 = fadd float %147, %617
  %634 = fadd float %148, %618
  %635 = fadd float %149, %619
  %636 = fadd float %150, %620
  %637 = fadd float %151, %621
  %638 = fadd float %152, %622
  %639 = fadd float %153, %623
  %640 = fadd float %84, %624
  %641 = fadd float %85, %625
  %642 = fadd float %86, %626
  %643 = fadd float %87, %627
  %644 = fadd float %88, %628
  %645 = fadd float %89, %629
  %646 = fadd float %90, %630
  %647 = fadd float %91, %631
  %648 = fadd float %92, %632
  %649 = fadd float %93, %633
  %650 = fadd float %94, %634
  %651 = fadd float %95, %635
  %652 = fadd float %96, %636
  %653 = fadd float %97, %637
  %654 = fadd float %98, %638
  %655 = fadd float %99, %639
  %656 = fmul float %640, %640
  %657 = fmul float %641, %641
  %658 = fmul float %642, %642
  %659 = fmul float %643, %643
  %660 = fmul float %644, %644
  %661 = fmul float %645, %645
  %662 = fmul float %646, %646
  %663 = fmul float %647, %647
  %664 = fmul float %648, %648
  %665 = fmul float %649, %649
  %666 = fmul float %650, %650
  %667 = fmul float %651, %651
  %668 = fmul float %652, %652
  %669 = fmul float %653, %653
  %670 = fmul float %654, %654
  %671 = fmul float %655, %655
  %672 = fadd float %656, %657
  %673 = fadd float %672, %658
  %674 = fadd float %673, %659
  %675 = fadd float %674, %660
  %676 = fadd float %675, %661
  %677 = fadd float %676, %662
  %678 = fadd float %677, %663
  %679 = fadd float %678, %664
  %680 = fadd float %679, %665
  %681 = fadd float %680, %666
  %682 = fadd float %681, %667
  %683 = fadd float %682, %668
  %684 = fadd float %683, %669
  %685 = fadd float %684, %670
  %686 = fadd float %685, %671
  %687 = bitcast float %686 to i32
  %688 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %687, i32 16, i32 31)
  %689 = bitcast i32 %688 to float
  %690 = fadd float %686, %689
  %691 = bitcast float %690 to i32
  %692 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %691, i32 8, i32 31)
  %693 = bitcast i32 %692 to float
  %694 = fadd float %690, %693
  %695 = bitcast float %694 to i32
  %696 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %695, i32 4, i32 31)
  %697 = bitcast i32 %696 to float
  %698 = fadd float %694, %697
  %699 = bitcast float %698 to i32
  %700 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %699, i32 2, i32 31)
  %701 = bitcast i32 %700 to float
  %702 = fadd float %698, %701
  %703 = bitcast float %702 to i32
  %704 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %703, i32 1, i32 31)
  %705 = bitcast i32 %704 to float
  %706 = fadd float %702, %705
  %707 = urem i32 %16, 32
  %708 = urem i32 %17, 2
  %709 = icmp eq i32 %707, 0
  %710 = and i1 true, %709
  %711 = add i32 0, %708
  %712 = getelementptr float, ptr addrspace(3) @global_smem, i32 %711
  %713 = insertelement <1 x float> undef, float %706, i32 0
  %714 = extractelement <1 x float> %713, i32 0
  %715 = bitcast float %714 to i32
  %716 = insertelement <1 x i32> undef, i32 %715, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %712, <1 x i32> %716, i1 %710)
  call void @llvm.nvvm.barrier0()
  %717 = icmp slt i32 %15, 2
  %718 = getelementptr float, ptr addrspace(3) @global_smem, i32 %15
  %719 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %718, i1 %717)
  %720 = insertelement <1 x i32> undef, i32 %719, i32 0
  %721 = extractelement <1 x i32> %720, i32 0
  %722 = bitcast i32 %721 to float
  %723 = insertelement <1 x float> undef, float %722, i32 0
  %724 = extractelement <1 x float> %723, i32 0
  %725 = bitcast float %724 to i32
  %726 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %725, i32 1, i32 31)
  %727 = bitcast i32 %726 to float
  %728 = fadd float %724, %727
  %729 = urem i32 %16, 2
  %730 = icmp eq i32 %729, 0
  %731 = and i1 %717, %730
  %732 = insertelement <1 x float> undef, float %728, i32 0
  %733 = extractelement <1 x float> %732, i32 0
  %734 = bitcast float %733 to i32
  %735 = insertelement <1 x i32> undef, i32 %734, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %718, <1 x i32> %735, i1 %731)
  call void @llvm.nvvm.barrier0()
  %736 = load float, ptr addrspace(3) @global_smem, align 4
  %737 = fmul float %736, 0x3F50000000000000
  %738 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %739 = bitcast i32 %738 to <1 x float>
  %740 = extractelement <1 x float> %739, i32 0
  %741 = fadd float %737, %740
  %742 = call float @__nv_rsqrtf(float %741)
  %743 = fmul float %640, %742
  %744 = fmul float %641, %742
  %745 = fmul float %642, %742
  %746 = fmul float %643, %742
  %747 = fmul float %644, %742
  %748 = fmul float %645, %742
  %749 = fmul float %646, %742
  %750 = fmul float %647, %742
  %751 = fmul float %648, %742
  %752 = fmul float %649, %742
  %753 = fmul float %650, %742
  %754 = fmul float %651, %742
  %755 = fmul float %652, %742
  %756 = fmul float %653, %742
  %757 = fmul float %654, %742
  %758 = fmul float %655, %742
  %759 = getelementptr bfloat, ptr addrspace(1) %3, i64 %46
  %760 = getelementptr bfloat, ptr addrspace(1) %3, i64 %47
  %761 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %759)
  %762 = extractvalue { i32, i32, i32, i32 } %761, 0
  %763 = bitcast i32 %762 to <2 x bfloat>
  %764 = extractvalue { i32, i32, i32, i32 } %761, 1
  %765 = bitcast i32 %764 to <2 x bfloat>
  %766 = extractvalue { i32, i32, i32, i32 } %761, 2
  %767 = bitcast i32 %766 to <2 x bfloat>
  %768 = extractvalue { i32, i32, i32, i32 } %761, 3
  %769 = bitcast i32 %768 to <2 x bfloat>
  %770 = extractelement <2 x bfloat> %763, i32 0
  %771 = extractelement <2 x bfloat> %763, i32 1
  %772 = extractelement <2 x bfloat> %765, i32 0
  %773 = extractelement <2 x bfloat> %765, i32 1
  %774 = extractelement <2 x bfloat> %767, i32 0
  %775 = extractelement <2 x bfloat> %767, i32 1
  %776 = extractelement <2 x bfloat> %769, i32 0
  %777 = extractelement <2 x bfloat> %769, i32 1
  %778 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %760)
  %779 = extractvalue { i32, i32, i32, i32 } %778, 0
  %780 = bitcast i32 %779 to <2 x bfloat>
  %781 = extractvalue { i32, i32, i32, i32 } %778, 1
  %782 = bitcast i32 %781 to <2 x bfloat>
  %783 = extractvalue { i32, i32, i32, i32 } %778, 2
  %784 = bitcast i32 %783 to <2 x bfloat>
  %785 = extractvalue { i32, i32, i32, i32 } %778, 3
  %786 = bitcast i32 %785 to <2 x bfloat>
  %787 = extractelement <2 x bfloat> %780, i32 0
  %788 = extractelement <2 x bfloat> %780, i32 1
  %789 = extractelement <2 x bfloat> %782, i32 0
  %790 = extractelement <2 x bfloat> %782, i32 1
  %791 = extractelement <2 x bfloat> %784, i32 0
  %792 = extractelement <2 x bfloat> %784, i32 1
  %793 = extractelement <2 x bfloat> %786, i32 0
  %794 = extractelement <2 x bfloat> %786, i32 1
  %795 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %770)
  %796 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %771)
  %797 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %772)
  %798 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %773)
  %799 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %774)
  %800 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %775)
  %801 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %776)
  %802 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %777)
  %803 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %787)
  %804 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %788)
  %805 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %789)
  %806 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %790)
  %807 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %791)
  %808 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %792)
  %809 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %793)
  %810 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %794)
  %811 = fmul float %743, %795
  %812 = fmul float %744, %796
  %813 = fmul float %745, %797
  %814 = fmul float %746, %798
  %815 = fmul float %747, %799
  %816 = fmul float %748, %800
  %817 = fmul float %749, %801
  %818 = fmul float %750, %802
  %819 = fmul float %751, %803
  %820 = fmul float %752, %804
  %821 = fmul float %753, %805
  %822 = fmul float %754, %806
  %823 = fmul float %755, %807
  %824 = fmul float %756, %808
  %825 = fmul float %757, %809
  %826 = fmul float %758, %810
  %827 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %811)
  %828 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %812)
  %829 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %813)
  %830 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %814)
  %831 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %815)
  %832 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %816)
  %833 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %817)
  %834 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %818)
  %835 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %819)
  %836 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %820)
  %837 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %821)
  %838 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %822)
  %839 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %823)
  %840 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %824)
  %841 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %825)
  %842 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %826)
  %843 = getelementptr bfloat, ptr addrspace(1) %9, i64 %13
  %844 = getelementptr bfloat, ptr addrspace(1) %843, i64 %46
  %845 = getelementptr bfloat, ptr addrspace(1) %843, i64 %47
  %846 = insertelement <2 x bfloat> undef, bfloat %827, i32 0
  %847 = insertelement <2 x bfloat> %846, bfloat %828, i32 1
  %848 = bitcast <2 x bfloat> %847 to i32
  %849 = insertelement <2 x bfloat> undef, bfloat %829, i32 0
  %850 = insertelement <2 x bfloat> %849, bfloat %830, i32 1
  %851 = bitcast <2 x bfloat> %850 to i32
  %852 = insertelement <2 x bfloat> undef, bfloat %831, i32 0
  %853 = insertelement <2 x bfloat> %852, bfloat %832, i32 1
  %854 = bitcast <2 x bfloat> %853 to i32
  %855 = insertelement <2 x bfloat> undef, bfloat %833, i32 0
  %856 = insertelement <2 x bfloat> %855, bfloat %834, i32 1
  %857 = bitcast <2 x bfloat> %856 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %848, i32 %851, i32 %854, i32 %857, ptr addrspace(1) %844)
  %858 = insertelement <2 x bfloat> undef, bfloat %835, i32 0
  %859 = insertelement <2 x bfloat> %858, bfloat %836, i32 1
  %860 = bitcast <2 x bfloat> %859 to i32
  %861 = insertelement <2 x bfloat> undef, bfloat %837, i32 0
  %862 = insertelement <2 x bfloat> %861, bfloat %838, i32 1
  %863 = bitcast <2 x bfloat> %862 to i32
  %864 = insertelement <2 x bfloat> undef, bfloat %839, i32 0
  %865 = insertelement <2 x bfloat> %864, bfloat %840, i32 1
  %866 = bitcast <2 x bfloat> %865 to i32
  %867 = insertelement <2 x bfloat> undef, bfloat %841, i32 0
  %868 = insertelement <2 x bfloat> %867, bfloat %842, i32 1
  %869 = bitcast <2 x bfloat> %868 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %860, i32 %863, i32 %866, i32 %869, ptr addrspace(1) %845)
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

declare ptx_kernel void @triton_softmax_6_0_impl(ptr, ptr, ptr, ptr) #7

define ptx_kernel void @triton_softmax_6_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #8 {
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
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
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
  %21 = call float @fused_concatenate_convert_316_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_316_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_316_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_316_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_316_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
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
attributes #2 = { "nvvm.reqntid"="128" }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { "nvvm.reqntid"="64" }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { "nvvm.reqntid"="64,1,1" }
attributes #7 = { "nvvm.reqntid"="32" }
attributes #8 = { "nvvm.reqntid"="32,1,1" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 128}
!2 = !{}
!3 = !{i32 0, i32 384}
!4 = !{i32 0, i32 64}
!5 = !{i32 0, i32 135456}

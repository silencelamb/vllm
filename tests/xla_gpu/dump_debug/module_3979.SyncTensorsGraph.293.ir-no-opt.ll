; ModuleID = 'SyncTensorsGraph.293'
source_filename = "SyncTensorsGraph.293"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(512) %1, ptr noalias align 128 dereferenceable(262144) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %6 = udiv i32 %5, 8
  %7 = getelementptr inbounds i32, ptr %1, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  %9 = call i32 @llvm.umin.i32(i32 %8, i32 151935)
  %10 = urem i32 %5, 8
  %11 = mul i32 %10, 128
  %12 = mul i32 %9, 1024
  %13 = add i32 %11, %12
  %14 = add i32 %13, %4
  %15 = getelementptr inbounds bfloat, ptr %0, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !3
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

declare ptx_kernel void @gemm_fusion_dot_7_0_impl(ptr, ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_7_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr null to ptr addrspace(1)
  %5 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %6 = sdiv i32 %5, 16
  %7 = mul i32 %6, 8
  %8 = sub i32 128, %7
  %9 = icmp slt i32 %8, 8
  %10 = select i1 %9, i32 %8, i32 8
  %11 = srem i32 %5, %10
  %12 = add i32 %7, %11
  %13 = srem i32 %5, 16
  %14 = sdiv i32 %13, %10
  %15 = mul i32 %12, 16
  %16 = icmp slt i32 %15, 1024
  %17 = select i1 %16, ptr addrspace(1) %1, ptr addrspace(1) %2
  %18 = add i32 %15, -1024
  %19 = select i1 %16, i32 %15, i32 %18
  %20 = sext i32 %19 to i64
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %22 = urem i32 %21, 32
  %23 = udiv i32 %21, 32
  %24 = and i32 %22, 16
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 1
  %27 = xor i32 0, %26
  %28 = and i32 %23, 1
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 2
  %31 = xor i32 %27, %30
  %32 = and i32 %23, 2
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 4
  %35 = xor i32 %31, %34
  %36 = xor i32 %35, 0
  %37 = xor i32 %35, 8
  %38 = add i32 %36, 0
  %39 = add i32 %37, 0
  %40 = sext i32 %38 to i64
  %41 = sext i32 %39 to i64
  %42 = add i64 %20, %40
  %43 = add i64 %20, %41
  %44 = mul i64 %42, 2048
  %45 = mul i64 %43, 2048
  %46 = and i32 %22, 1
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %47, i32 0, i32 8
  %49 = xor i32 0, %48
  %50 = and i32 %22, 2
  %51 = icmp eq i32 %50, 0
  %52 = select i1 %51, i32 0, i32 16
  %53 = xor i32 %49, %52
  %54 = and i32 %22, 4
  %55 = icmp eq i32 %54, 0
  %56 = select i1 %55, i32 0, i32 32
  %57 = xor i32 %53, %56
  %58 = and i32 %22, 8
  %59 = icmp eq i32 %58, 0
  %60 = select i1 %59, i32 0, i32 64
  %61 = xor i32 %57, %60
  %62 = xor i32 %61, 0
  %63 = add i32 %62, 0
  %64 = sext i32 %63 to i64
  br label %65

65:                                               ; preds = %70, %0
  %66 = phi i32 [ %531, %70 ], [ 0, %0 ]
  %67 = phi i64 [ %141, %70 ], [ 0, %0 ]
  %68 = phi { float, float, float, float, float, float, float, float } [ %530, %70 ], [ zeroinitializer, %0 ]
  %69 = icmp slt i32 %66, 2048
  br i1 %69, label %70, label %532

70:                                               ; preds = %65
  %71 = add i64 %67, %64
  %72 = add i64 %44, %71
  %73 = add i64 %45, %71
  %74 = getelementptr bfloat, ptr addrspace(1) %17, i64 %72
  %75 = getelementptr bfloat, ptr addrspace(1) %17, i64 %73
  %76 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %74)
  %77 = extractvalue { i32, i32, i32, i32 } %76, 0
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %76, 1
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractvalue { i32, i32, i32, i32 } %76, 2
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractvalue { i32, i32, i32, i32 } %76, 3
  %84 = bitcast i32 %83 to <2 x bfloat>
  %85 = extractelement <2 x bfloat> %78, i32 0
  %86 = extractelement <2 x bfloat> %78, i32 1
  %87 = extractelement <2 x bfloat> %80, i32 0
  %88 = extractelement <2 x bfloat> %80, i32 1
  %89 = extractelement <2 x bfloat> %82, i32 0
  %90 = extractelement <2 x bfloat> %82, i32 1
  %91 = extractelement <2 x bfloat> %84, i32 0
  %92 = extractelement <2 x bfloat> %84, i32 1
  %93 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %75)
  %94 = extractvalue { i32, i32, i32, i32 } %93, 0
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %93, 1
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractvalue { i32, i32, i32, i32 } %93, 2
  %99 = bitcast i32 %98 to <2 x bfloat>
  %100 = extractvalue { i32, i32, i32, i32 } %93, 3
  %101 = bitcast i32 %100 to <2 x bfloat>
  %102 = extractelement <2 x bfloat> %95, i32 0
  %103 = extractelement <2 x bfloat> %95, i32 1
  %104 = extractelement <2 x bfloat> %97, i32 0
  %105 = extractelement <2 x bfloat> %97, i32 1
  %106 = extractelement <2 x bfloat> %99, i32 0
  %107 = extractelement <2 x bfloat> %99, i32 1
  %108 = extractelement <2 x bfloat> %101, i32 0
  %109 = extractelement <2 x bfloat> %101, i32 1
  call void @llvm.nvvm.barrier0()
  %110 = select i1 %25, i32 0, i32 136
  %111 = xor i32 %61, %110
  %112 = select i1 %29, i32 0, i32 272
  %113 = xor i32 %111, %112
  %114 = select i1 %33, i32 0, i32 544
  %115 = xor i32 %113, %114
  %116 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %115
  %117 = insertelement <8 x bfloat> undef, bfloat %85, i32 0
  %118 = insertelement <8 x bfloat> %117, bfloat %86, i32 1
  %119 = insertelement <8 x bfloat> %118, bfloat %87, i32 2
  %120 = insertelement <8 x bfloat> %119, bfloat %88, i32 3
  %121 = insertelement <8 x bfloat> %120, bfloat %89, i32 4
  %122 = insertelement <8 x bfloat> %121, bfloat %90, i32 5
  %123 = insertelement <8 x bfloat> %122, bfloat %91, i32 6
  %124 = insertelement <8 x bfloat> %123, bfloat %92, i32 7
  store <8 x bfloat> %124, ptr addrspace(3) %116, align 16
  %125 = xor i32 1024, %48
  %126 = xor i32 %125, %52
  %127 = xor i32 %126, %56
  %128 = xor i32 %127, %60
  %129 = xor i32 %128, %110
  %130 = xor i32 %129, %112
  %131 = xor i32 %130, %114
  %132 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %131
  %133 = insertelement <8 x bfloat> undef, bfloat %102, i32 0
  %134 = insertelement <8 x bfloat> %133, bfloat %103, i32 1
  %135 = insertelement <8 x bfloat> %134, bfloat %104, i32 2
  %136 = insertelement <8 x bfloat> %135, bfloat %105, i32 3
  %137 = insertelement <8 x bfloat> %136, bfloat %106, i32 4
  %138 = insertelement <8 x bfloat> %137, bfloat %107, i32 5
  %139 = insertelement <8 x bfloat> %138, bfloat %108, i32 6
  %140 = insertelement <8 x bfloat> %139, bfloat %109, i32 7
  store <8 x bfloat> %140, ptr addrspace(3) %132, align 16
  %141 = add i64 %67, 128
  call void @llvm.nvvm.barrier0()
  %142 = select i1 %47, i32 0, i32 136
  %143 = xor i32 0, %142
  %144 = select i1 %51, i32 0, i32 272
  %145 = xor i32 %143, %144
  %146 = select i1 %55, i32 0, i32 544
  %147 = xor i32 %145, %146
  %148 = select i1 %59, i32 0, i32 1024
  %149 = xor i32 %147, %148
  %150 = select i1 %25, i32 0, i32 8
  %151 = xor i32 %149, %150
  %152 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %151
  %153 = ptrtoint ptr addrspace(3) %152 to i32
  %154 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %153)
  %155 = extractvalue { i32, i32, i32, i32 } %154, 0
  %156 = extractvalue { i32, i32, i32, i32 } %154, 1
  %157 = extractvalue { i32, i32, i32, i32 } %154, 2
  %158 = extractvalue { i32, i32, i32, i32 } %154, 3
  %159 = xor i32 16, %142
  %160 = xor i32 %159, %144
  %161 = xor i32 %160, %146
  %162 = xor i32 %161, %148
  %163 = xor i32 %162, %150
  %164 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %163
  %165 = ptrtoint ptr addrspace(3) %164 to i32
  %166 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %165)
  %167 = extractvalue { i32, i32, i32, i32 } %166, 0
  %168 = extractvalue { i32, i32, i32, i32 } %166, 1
  %169 = extractvalue { i32, i32, i32, i32 } %166, 2
  %170 = extractvalue { i32, i32, i32, i32 } %166, 3
  %171 = xor i32 32, %142
  %172 = xor i32 %171, %144
  %173 = xor i32 %172, %146
  %174 = xor i32 %173, %148
  %175 = xor i32 %174, %150
  %176 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %175
  %177 = ptrtoint ptr addrspace(3) %176 to i32
  %178 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %177)
  %179 = extractvalue { i32, i32, i32, i32 } %178, 0
  %180 = extractvalue { i32, i32, i32, i32 } %178, 1
  %181 = extractvalue { i32, i32, i32, i32 } %178, 2
  %182 = extractvalue { i32, i32, i32, i32 } %178, 3
  %183 = xor i32 48, %142
  %184 = xor i32 %183, %144
  %185 = xor i32 %184, %146
  %186 = xor i32 %185, %148
  %187 = xor i32 %186, %150
  %188 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %187
  %189 = ptrtoint ptr addrspace(3) %188 to i32
  %190 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %189)
  %191 = extractvalue { i32, i32, i32, i32 } %190, 0
  %192 = extractvalue { i32, i32, i32, i32 } %190, 1
  %193 = extractvalue { i32, i32, i32, i32 } %190, 2
  %194 = extractvalue { i32, i32, i32, i32 } %190, 3
  %195 = xor i32 64, %142
  %196 = xor i32 %195, %144
  %197 = xor i32 %196, %146
  %198 = xor i32 %197, %148
  %199 = xor i32 %198, %150
  %200 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %199
  %201 = ptrtoint ptr addrspace(3) %200 to i32
  %202 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %201)
  %203 = extractvalue { i32, i32, i32, i32 } %202, 0
  %204 = extractvalue { i32, i32, i32, i32 } %202, 1
  %205 = extractvalue { i32, i32, i32, i32 } %202, 2
  %206 = extractvalue { i32, i32, i32, i32 } %202, 3
  %207 = xor i32 80, %142
  %208 = xor i32 %207, %144
  %209 = xor i32 %208, %146
  %210 = xor i32 %209, %148
  %211 = xor i32 %210, %150
  %212 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %211
  %213 = ptrtoint ptr addrspace(3) %212 to i32
  %214 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %213)
  %215 = extractvalue { i32, i32, i32, i32 } %214, 0
  %216 = extractvalue { i32, i32, i32, i32 } %214, 1
  %217 = extractvalue { i32, i32, i32, i32 } %214, 2
  %218 = extractvalue { i32, i32, i32, i32 } %214, 3
  %219 = xor i32 96, %142
  %220 = xor i32 %219, %144
  %221 = xor i32 %220, %146
  %222 = xor i32 %221, %148
  %223 = xor i32 %222, %150
  %224 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %223
  %225 = ptrtoint ptr addrspace(3) %224 to i32
  %226 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %225)
  %227 = extractvalue { i32, i32, i32, i32 } %226, 0
  %228 = extractvalue { i32, i32, i32, i32 } %226, 1
  %229 = extractvalue { i32, i32, i32, i32 } %226, 2
  %230 = extractvalue { i32, i32, i32, i32 } %226, 3
  %231 = xor i32 112, %142
  %232 = xor i32 %231, %144
  %233 = xor i32 %232, %146
  %234 = xor i32 %233, %148
  %235 = xor i32 %234, %150
  %236 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %235
  %237 = ptrtoint ptr addrspace(3) %236 to i32
  %238 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %237)
  %239 = extractvalue { i32, i32, i32, i32 } %238, 0
  %240 = extractvalue { i32, i32, i32, i32 } %238, 1
  %241 = extractvalue { i32, i32, i32, i32 } %238, 2
  %242 = extractvalue { i32, i32, i32, i32 } %238, 3
  %243 = bitcast i32 %155 to <2 x bfloat>
  %244 = extractelement <2 x bfloat> %243, i32 0
  %245 = extractelement <2 x bfloat> %243, i32 1
  %246 = bitcast i32 %156 to <2 x bfloat>
  %247 = extractelement <2 x bfloat> %246, i32 0
  %248 = extractelement <2 x bfloat> %246, i32 1
  %249 = bitcast i32 %157 to <2 x bfloat>
  %250 = extractelement <2 x bfloat> %249, i32 0
  %251 = extractelement <2 x bfloat> %249, i32 1
  %252 = bitcast i32 %158 to <2 x bfloat>
  %253 = extractelement <2 x bfloat> %252, i32 0
  %254 = extractelement <2 x bfloat> %252, i32 1
  %255 = bitcast i32 %167 to <2 x bfloat>
  %256 = extractelement <2 x bfloat> %255, i32 0
  %257 = extractelement <2 x bfloat> %255, i32 1
  %258 = bitcast i32 %168 to <2 x bfloat>
  %259 = extractelement <2 x bfloat> %258, i32 0
  %260 = extractelement <2 x bfloat> %258, i32 1
  %261 = bitcast i32 %169 to <2 x bfloat>
  %262 = extractelement <2 x bfloat> %261, i32 0
  %263 = extractelement <2 x bfloat> %261, i32 1
  %264 = bitcast i32 %170 to <2 x bfloat>
  %265 = extractelement <2 x bfloat> %264, i32 0
  %266 = extractelement <2 x bfloat> %264, i32 1
  %267 = bitcast i32 %179 to <2 x bfloat>
  %268 = extractelement <2 x bfloat> %267, i32 0
  %269 = extractelement <2 x bfloat> %267, i32 1
  %270 = bitcast i32 %180 to <2 x bfloat>
  %271 = extractelement <2 x bfloat> %270, i32 0
  %272 = extractelement <2 x bfloat> %270, i32 1
  %273 = bitcast i32 %181 to <2 x bfloat>
  %274 = extractelement <2 x bfloat> %273, i32 0
  %275 = extractelement <2 x bfloat> %273, i32 1
  %276 = bitcast i32 %182 to <2 x bfloat>
  %277 = extractelement <2 x bfloat> %276, i32 0
  %278 = extractelement <2 x bfloat> %276, i32 1
  %279 = bitcast i32 %191 to <2 x bfloat>
  %280 = extractelement <2 x bfloat> %279, i32 0
  %281 = extractelement <2 x bfloat> %279, i32 1
  %282 = bitcast i32 %192 to <2 x bfloat>
  %283 = extractelement <2 x bfloat> %282, i32 0
  %284 = extractelement <2 x bfloat> %282, i32 1
  %285 = bitcast i32 %193 to <2 x bfloat>
  %286 = extractelement <2 x bfloat> %285, i32 0
  %287 = extractelement <2 x bfloat> %285, i32 1
  %288 = bitcast i32 %194 to <2 x bfloat>
  %289 = extractelement <2 x bfloat> %288, i32 0
  %290 = extractelement <2 x bfloat> %288, i32 1
  %291 = bitcast i32 %203 to <2 x bfloat>
  %292 = extractelement <2 x bfloat> %291, i32 0
  %293 = extractelement <2 x bfloat> %291, i32 1
  %294 = bitcast i32 %204 to <2 x bfloat>
  %295 = extractelement <2 x bfloat> %294, i32 0
  %296 = extractelement <2 x bfloat> %294, i32 1
  %297 = bitcast i32 %205 to <2 x bfloat>
  %298 = extractelement <2 x bfloat> %297, i32 0
  %299 = extractelement <2 x bfloat> %297, i32 1
  %300 = bitcast i32 %206 to <2 x bfloat>
  %301 = extractelement <2 x bfloat> %300, i32 0
  %302 = extractelement <2 x bfloat> %300, i32 1
  %303 = bitcast i32 %215 to <2 x bfloat>
  %304 = extractelement <2 x bfloat> %303, i32 0
  %305 = extractelement <2 x bfloat> %303, i32 1
  %306 = bitcast i32 %216 to <2 x bfloat>
  %307 = extractelement <2 x bfloat> %306, i32 0
  %308 = extractelement <2 x bfloat> %306, i32 1
  %309 = bitcast i32 %217 to <2 x bfloat>
  %310 = extractelement <2 x bfloat> %309, i32 0
  %311 = extractelement <2 x bfloat> %309, i32 1
  %312 = bitcast i32 %218 to <2 x bfloat>
  %313 = extractelement <2 x bfloat> %312, i32 0
  %314 = extractelement <2 x bfloat> %312, i32 1
  %315 = bitcast i32 %227 to <2 x bfloat>
  %316 = extractelement <2 x bfloat> %315, i32 0
  %317 = extractelement <2 x bfloat> %315, i32 1
  %318 = bitcast i32 %228 to <2 x bfloat>
  %319 = extractelement <2 x bfloat> %318, i32 0
  %320 = extractelement <2 x bfloat> %318, i32 1
  %321 = bitcast i32 %229 to <2 x bfloat>
  %322 = extractelement <2 x bfloat> %321, i32 0
  %323 = extractelement <2 x bfloat> %321, i32 1
  %324 = bitcast i32 %230 to <2 x bfloat>
  %325 = extractelement <2 x bfloat> %324, i32 0
  %326 = extractelement <2 x bfloat> %324, i32 1
  %327 = bitcast i32 %239 to <2 x bfloat>
  %328 = extractelement <2 x bfloat> %327, i32 0
  %329 = extractelement <2 x bfloat> %327, i32 1
  %330 = bitcast i32 %240 to <2 x bfloat>
  %331 = extractelement <2 x bfloat> %330, i32 0
  %332 = extractelement <2 x bfloat> %330, i32 1
  %333 = bitcast i32 %241 to <2 x bfloat>
  %334 = extractelement <2 x bfloat> %333, i32 0
  %335 = extractelement <2 x bfloat> %333, i32 1
  %336 = bitcast i32 %242 to <2 x bfloat>
  %337 = extractelement <2 x bfloat> %336, i32 0
  %338 = extractelement <2 x bfloat> %336, i32 1
  %339 = insertelement <2 x bfloat> undef, bfloat %244, i32 0
  %340 = insertelement <2 x bfloat> %339, bfloat %245, i32 1
  %341 = bitcast <2 x bfloat> %340 to i32
  %342 = insertelement <2 x bfloat> undef, bfloat %247, i32 0
  %343 = insertelement <2 x bfloat> %342, bfloat %248, i32 1
  %344 = bitcast <2 x bfloat> %343 to i32
  %345 = insertelement <2 x bfloat> undef, bfloat %250, i32 0
  %346 = insertelement <2 x bfloat> %345, bfloat %251, i32 1
  %347 = bitcast <2 x bfloat> %346 to i32
  %348 = insertelement <2 x bfloat> undef, bfloat %253, i32 0
  %349 = insertelement <2 x bfloat> %348, bfloat %254, i32 1
  %350 = bitcast <2 x bfloat> %349 to i32
  %351 = insertelement <2 x bfloat> undef, bfloat %256, i32 0
  %352 = insertelement <2 x bfloat> %351, bfloat %257, i32 1
  %353 = bitcast <2 x bfloat> %352 to i32
  %354 = insertelement <2 x bfloat> undef, bfloat %259, i32 0
  %355 = insertelement <2 x bfloat> %354, bfloat %260, i32 1
  %356 = bitcast <2 x bfloat> %355 to i32
  %357 = insertelement <2 x bfloat> undef, bfloat %262, i32 0
  %358 = insertelement <2 x bfloat> %357, bfloat %263, i32 1
  %359 = bitcast <2 x bfloat> %358 to i32
  %360 = insertelement <2 x bfloat> undef, bfloat %265, i32 0
  %361 = insertelement <2 x bfloat> %360, bfloat %266, i32 1
  %362 = bitcast <2 x bfloat> %361 to i32
  %363 = insertelement <2 x bfloat> undef, bfloat %268, i32 0
  %364 = insertelement <2 x bfloat> %363, bfloat %269, i32 1
  %365 = bitcast <2 x bfloat> %364 to i32
  %366 = insertelement <2 x bfloat> undef, bfloat %271, i32 0
  %367 = insertelement <2 x bfloat> %366, bfloat %272, i32 1
  %368 = bitcast <2 x bfloat> %367 to i32
  %369 = insertelement <2 x bfloat> undef, bfloat %274, i32 0
  %370 = insertelement <2 x bfloat> %369, bfloat %275, i32 1
  %371 = bitcast <2 x bfloat> %370 to i32
  %372 = insertelement <2 x bfloat> undef, bfloat %277, i32 0
  %373 = insertelement <2 x bfloat> %372, bfloat %278, i32 1
  %374 = bitcast <2 x bfloat> %373 to i32
  %375 = insertelement <2 x bfloat> undef, bfloat %280, i32 0
  %376 = insertelement <2 x bfloat> %375, bfloat %281, i32 1
  %377 = bitcast <2 x bfloat> %376 to i32
  %378 = insertelement <2 x bfloat> undef, bfloat %283, i32 0
  %379 = insertelement <2 x bfloat> %378, bfloat %284, i32 1
  %380 = bitcast <2 x bfloat> %379 to i32
  %381 = insertelement <2 x bfloat> undef, bfloat %286, i32 0
  %382 = insertelement <2 x bfloat> %381, bfloat %287, i32 1
  %383 = bitcast <2 x bfloat> %382 to i32
  %384 = insertelement <2 x bfloat> undef, bfloat %289, i32 0
  %385 = insertelement <2 x bfloat> %384, bfloat %290, i32 1
  %386 = bitcast <2 x bfloat> %385 to i32
  %387 = insertelement <2 x bfloat> undef, bfloat %292, i32 0
  %388 = insertelement <2 x bfloat> %387, bfloat %293, i32 1
  %389 = bitcast <2 x bfloat> %388 to i32
  %390 = insertelement <2 x bfloat> undef, bfloat %295, i32 0
  %391 = insertelement <2 x bfloat> %390, bfloat %296, i32 1
  %392 = bitcast <2 x bfloat> %391 to i32
  %393 = insertelement <2 x bfloat> undef, bfloat %298, i32 0
  %394 = insertelement <2 x bfloat> %393, bfloat %299, i32 1
  %395 = bitcast <2 x bfloat> %394 to i32
  %396 = insertelement <2 x bfloat> undef, bfloat %301, i32 0
  %397 = insertelement <2 x bfloat> %396, bfloat %302, i32 1
  %398 = bitcast <2 x bfloat> %397 to i32
  %399 = insertelement <2 x bfloat> undef, bfloat %304, i32 0
  %400 = insertelement <2 x bfloat> %399, bfloat %305, i32 1
  %401 = bitcast <2 x bfloat> %400 to i32
  %402 = insertelement <2 x bfloat> undef, bfloat %307, i32 0
  %403 = insertelement <2 x bfloat> %402, bfloat %308, i32 1
  %404 = bitcast <2 x bfloat> %403 to i32
  %405 = insertelement <2 x bfloat> undef, bfloat %310, i32 0
  %406 = insertelement <2 x bfloat> %405, bfloat %311, i32 1
  %407 = bitcast <2 x bfloat> %406 to i32
  %408 = insertelement <2 x bfloat> undef, bfloat %313, i32 0
  %409 = insertelement <2 x bfloat> %408, bfloat %314, i32 1
  %410 = bitcast <2 x bfloat> %409 to i32
  %411 = insertelement <2 x bfloat> undef, bfloat %316, i32 0
  %412 = insertelement <2 x bfloat> %411, bfloat %317, i32 1
  %413 = bitcast <2 x bfloat> %412 to i32
  %414 = insertelement <2 x bfloat> undef, bfloat %319, i32 0
  %415 = insertelement <2 x bfloat> %414, bfloat %320, i32 1
  %416 = bitcast <2 x bfloat> %415 to i32
  %417 = insertelement <2 x bfloat> undef, bfloat %322, i32 0
  %418 = insertelement <2 x bfloat> %417, bfloat %323, i32 1
  %419 = bitcast <2 x bfloat> %418 to i32
  %420 = insertelement <2 x bfloat> undef, bfloat %325, i32 0
  %421 = insertelement <2 x bfloat> %420, bfloat %326, i32 1
  %422 = bitcast <2 x bfloat> %421 to i32
  %423 = insertelement <2 x bfloat> undef, bfloat %328, i32 0
  %424 = insertelement <2 x bfloat> %423, bfloat %329, i32 1
  %425 = bitcast <2 x bfloat> %424 to i32
  %426 = insertelement <2 x bfloat> undef, bfloat %331, i32 0
  %427 = insertelement <2 x bfloat> %426, bfloat %332, i32 1
  %428 = bitcast <2 x bfloat> %427 to i32
  %429 = insertelement <2 x bfloat> undef, bfloat %334, i32 0
  %430 = insertelement <2 x bfloat> %429, bfloat %335, i32 1
  %431 = bitcast <2 x bfloat> %430 to i32
  %432 = insertelement <2 x bfloat> undef, bfloat %337, i32 0
  %433 = insertelement <2 x bfloat> %432, bfloat %338, i32 1
  %434 = bitcast <2 x bfloat> %433 to i32
  %435 = extractvalue { float, float, float, float, float, float, float, float } %68, 0
  %436 = extractvalue { float, float, float, float, float, float, float, float } %68, 1
  %437 = extractvalue { float, float, float, float, float, float, float, float } %68, 2
  %438 = extractvalue { float, float, float, float, float, float, float, float } %68, 3
  %439 = extractvalue { float, float, float, float, float, float, float, float } %68, 4
  %440 = extractvalue { float, float, float, float, float, float, float, float } %68, 5
  %441 = extractvalue { float, float, float, float, float, float, float, float } %68, 6
  %442 = extractvalue { float, float, float, float, float, float, float, float } %68, 7
  %443 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %435, float %436, float %437, float %438, i32 %341, i32 %344, i32 %347, i32 %350, i32 0, i32 0)
  %444 = extractvalue { float, float, float, float } %443, 0
  %445 = extractvalue { float, float, float, float } %443, 1
  %446 = extractvalue { float, float, float, float } %443, 2
  %447 = extractvalue { float, float, float, float } %443, 3
  %448 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %439, float %440, float %441, float %442, i32 %341, i32 %344, i32 %347, i32 %350, i32 0, i32 0)
  %449 = extractvalue { float, float, float, float } %448, 0
  %450 = extractvalue { float, float, float, float } %448, 1
  %451 = extractvalue { float, float, float, float } %448, 2
  %452 = extractvalue { float, float, float, float } %448, 3
  %453 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %444, float %445, float %446, float %447, i32 %353, i32 %356, i32 %359, i32 %362, i32 0, i32 0)
  %454 = extractvalue { float, float, float, float } %453, 0
  %455 = extractvalue { float, float, float, float } %453, 1
  %456 = extractvalue { float, float, float, float } %453, 2
  %457 = extractvalue { float, float, float, float } %453, 3
  %458 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %449, float %450, float %451, float %452, i32 %353, i32 %356, i32 %359, i32 %362, i32 0, i32 0)
  %459 = extractvalue { float, float, float, float } %458, 0
  %460 = extractvalue { float, float, float, float } %458, 1
  %461 = extractvalue { float, float, float, float } %458, 2
  %462 = extractvalue { float, float, float, float } %458, 3
  %463 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %454, float %455, float %456, float %457, i32 %365, i32 %368, i32 %371, i32 %374, i32 0, i32 0)
  %464 = extractvalue { float, float, float, float } %463, 0
  %465 = extractvalue { float, float, float, float } %463, 1
  %466 = extractvalue { float, float, float, float } %463, 2
  %467 = extractvalue { float, float, float, float } %463, 3
  %468 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %459, float %460, float %461, float %462, i32 %365, i32 %368, i32 %371, i32 %374, i32 0, i32 0)
  %469 = extractvalue { float, float, float, float } %468, 0
  %470 = extractvalue { float, float, float, float } %468, 1
  %471 = extractvalue { float, float, float, float } %468, 2
  %472 = extractvalue { float, float, float, float } %468, 3
  %473 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %464, float %465, float %466, float %467, i32 %377, i32 %380, i32 %383, i32 %386, i32 0, i32 0)
  %474 = extractvalue { float, float, float, float } %473, 0
  %475 = extractvalue { float, float, float, float } %473, 1
  %476 = extractvalue { float, float, float, float } %473, 2
  %477 = extractvalue { float, float, float, float } %473, 3
  %478 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %469, float %470, float %471, float %472, i32 %377, i32 %380, i32 %383, i32 %386, i32 0, i32 0)
  %479 = extractvalue { float, float, float, float } %478, 0
  %480 = extractvalue { float, float, float, float } %478, 1
  %481 = extractvalue { float, float, float, float } %478, 2
  %482 = extractvalue { float, float, float, float } %478, 3
  %483 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %474, float %475, float %476, float %477, i32 %389, i32 %392, i32 %395, i32 %398, i32 0, i32 0)
  %484 = extractvalue { float, float, float, float } %483, 0
  %485 = extractvalue { float, float, float, float } %483, 1
  %486 = extractvalue { float, float, float, float } %483, 2
  %487 = extractvalue { float, float, float, float } %483, 3
  %488 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %479, float %480, float %481, float %482, i32 %389, i32 %392, i32 %395, i32 %398, i32 0, i32 0)
  %489 = extractvalue { float, float, float, float } %488, 0
  %490 = extractvalue { float, float, float, float } %488, 1
  %491 = extractvalue { float, float, float, float } %488, 2
  %492 = extractvalue { float, float, float, float } %488, 3
  %493 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %484, float %485, float %486, float %487, i32 %401, i32 %404, i32 %407, i32 %410, i32 0, i32 0)
  %494 = extractvalue { float, float, float, float } %493, 0
  %495 = extractvalue { float, float, float, float } %493, 1
  %496 = extractvalue { float, float, float, float } %493, 2
  %497 = extractvalue { float, float, float, float } %493, 3
  %498 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %489, float %490, float %491, float %492, i32 %401, i32 %404, i32 %407, i32 %410, i32 0, i32 0)
  %499 = extractvalue { float, float, float, float } %498, 0
  %500 = extractvalue { float, float, float, float } %498, 1
  %501 = extractvalue { float, float, float, float } %498, 2
  %502 = extractvalue { float, float, float, float } %498, 3
  %503 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %494, float %495, float %496, float %497, i32 %413, i32 %416, i32 %419, i32 %422, i32 0, i32 0)
  %504 = extractvalue { float, float, float, float } %503, 0
  %505 = extractvalue { float, float, float, float } %503, 1
  %506 = extractvalue { float, float, float, float } %503, 2
  %507 = extractvalue { float, float, float, float } %503, 3
  %508 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %499, float %500, float %501, float %502, i32 %413, i32 %416, i32 %419, i32 %422, i32 0, i32 0)
  %509 = extractvalue { float, float, float, float } %508, 0
  %510 = extractvalue { float, float, float, float } %508, 1
  %511 = extractvalue { float, float, float, float } %508, 2
  %512 = extractvalue { float, float, float, float } %508, 3
  %513 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %504, float %505, float %506, float %507, i32 %425, i32 %428, i32 %431, i32 %434, i32 0, i32 0)
  %514 = extractvalue { float, float, float, float } %513, 0
  %515 = extractvalue { float, float, float, float } %513, 1
  %516 = extractvalue { float, float, float, float } %513, 2
  %517 = extractvalue { float, float, float, float } %513, 3
  %518 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %509, float %510, float %511, float %512, i32 %425, i32 %428, i32 %431, i32 %434, i32 0, i32 0)
  %519 = extractvalue { float, float, float, float } %518, 0
  %520 = extractvalue { float, float, float, float } %518, 1
  %521 = extractvalue { float, float, float, float } %518, 2
  %522 = extractvalue { float, float, float, float } %518, 3
  %523 = insertvalue { float, float, float, float, float, float, float, float } undef, float %514, 0
  %524 = insertvalue { float, float, float, float, float, float, float, float } %523, float %515, 1
  %525 = insertvalue { float, float, float, float, float, float, float, float } %524, float %516, 2
  %526 = insertvalue { float, float, float, float, float, float, float, float } %525, float %517, 3
  %527 = insertvalue { float, float, float, float, float, float, float, float } %526, float %519, 4
  %528 = insertvalue { float, float, float, float, float, float, float, float } %527, float %520, 5
  %529 = insertvalue { float, float, float, float, float, float, float, float } %528, float %521, 6
  %530 = insertvalue { float, float, float, float, float, float, float, float } %529, float %522, 7
  %531 = add i32 %66, 128
  br label %65

532:                                              ; preds = %65
  %533 = extractvalue { float, float, float, float, float, float, float, float } %68, 0
  %534 = extractvalue { float, float, float, float, float, float, float, float } %68, 1
  %535 = extractvalue { float, float, float, float, float, float, float, float } %68, 2
  %536 = extractvalue { float, float, float, float, float, float, float, float } %68, 3
  %537 = extractvalue { float, float, float, float, float, float, float, float } %68, 4
  %538 = extractvalue { float, float, float, float, float, float, float, float } %68, 5
  %539 = extractvalue { float, float, float, float, float, float, float, float } %68, 6
  %540 = extractvalue { float, float, float, float, float, float, float, float } %68, 7
  %541 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %533)
  %542 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %534)
  %543 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %535)
  %544 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %536)
  %545 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %537)
  %546 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %538)
  %547 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %539)
  %548 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %540)
  %549 = mul i32 %14, 64
  %550 = sext i32 %15 to i64
  %551 = sext i32 %549 to i64
  %552 = xor i32 %49, 0
  %553 = add i32 %552, 0
  %554 = sext i32 %553 to i64
  %555 = add i64 %550, %554
  %556 = select i1 %51, i32 0, i32 1
  %557 = xor i32 0, %556
  %558 = select i1 %55, i32 0, i32 2
  %559 = xor i32 %557, %558
  %560 = select i1 %59, i32 0, i32 4
  %561 = xor i32 %559, %560
  %562 = select i1 %25, i32 0, i32 8
  %563 = xor i32 %561, %562
  %564 = select i1 %29, i32 0, i32 16
  %565 = xor i32 %563, %564
  %566 = select i1 %33, i32 0, i32 32
  %567 = xor i32 %565, %566
  %568 = xor i32 %567, 0
  %569 = add i32 %568, 0
  %570 = sext i32 %569 to i64
  %571 = add i64 %551, %570
  %572 = mul i64 %571, 2048
  %573 = add i64 %555, %572
  %574 = getelementptr bfloat, ptr addrspace(1) %3, i64 %573
  call void @llvm.nvvm.barrier0()
  %575 = select i1 %47, i32 0, i32 32
  %576 = xor i32 0, %575
  %577 = select i1 %51, i32 0, i32 64
  %578 = xor i32 %576, %577
  %579 = select i1 %55, i32 0, i32 1
  %580 = xor i32 %578, %579
  %581 = select i1 %59, i32 0, i32 2
  %582 = xor i32 %580, %581
  %583 = select i1 %25, i32 0, i32 4
  %584 = xor i32 %582, %583
  %585 = select i1 %29, i32 0, i32 128
  %586 = xor i32 %584, %585
  %587 = select i1 %33, i32 0, i32 256
  %588 = xor i32 %586, %587
  %589 = select i1 %25, i32 0, i32 128
  %590 = xor i32 %61, %589
  %591 = select i1 %29, i32 0, i32 256
  %592 = xor i32 %590, %591
  %593 = select i1 %33, i32 0, i32 512
  %594 = xor i32 %592, %593
  %595 = xor i32 %588, 0
  %596 = lshr i32 %595, 4
  %597 = shl i32 %596, 3
  %598 = add i32 %597, %595
  %599 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %598
  %600 = insertelement <1 x bfloat> undef, bfloat %541, i32 0
  %601 = extractelement <1 x bfloat> %600, i32 0
  %602 = bitcast bfloat %601 to i16
  %603 = insertelement <1 x i16> undef, i16 %602, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %599, <1 x i16> %603, i1 true)
  %604 = xor i32 %588, 16
  %605 = lshr i32 %604, 4
  %606 = shl i32 %605, 3
  %607 = add i32 %606, %604
  %608 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %607
  %609 = insertelement <1 x bfloat> undef, bfloat %542, i32 0
  %610 = extractelement <1 x bfloat> %609, i32 0
  %611 = bitcast bfloat %610 to i16
  %612 = insertelement <1 x i16> undef, i16 %611, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %608, <1 x i16> %612, i1 true)
  %613 = xor i32 %588, 8
  %614 = lshr i32 %613, 4
  %615 = shl i32 %614, 3
  %616 = add i32 %615, %613
  %617 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %616
  %618 = insertelement <1 x bfloat> undef, bfloat %543, i32 0
  %619 = extractelement <1 x bfloat> %618, i32 0
  %620 = bitcast bfloat %619 to i16
  %621 = insertelement <1 x i16> undef, i16 %620, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %617, <1 x i16> %621, i1 true)
  %622 = xor i32 %588, 24
  %623 = lshr i32 %622, 4
  %624 = shl i32 %623, 3
  %625 = add i32 %624, %622
  %626 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %625
  %627 = insertelement <1 x bfloat> undef, bfloat %544, i32 0
  %628 = extractelement <1 x bfloat> %627, i32 0
  %629 = bitcast bfloat %628 to i16
  %630 = insertelement <1 x i16> undef, i16 %629, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %626, <1 x i16> %630, i1 true)
  %631 = xor i32 %588, 512
  %632 = lshr i32 %631, 4
  %633 = shl i32 %632, 3
  %634 = add i32 %633, %631
  %635 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %634
  %636 = insertelement <1 x bfloat> undef, bfloat %545, i32 0
  %637 = extractelement <1 x bfloat> %636, i32 0
  %638 = bitcast bfloat %637 to i16
  %639 = insertelement <1 x i16> undef, i16 %638, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %635, <1 x i16> %639, i1 true)
  %640 = xor i32 %588, 528
  %641 = lshr i32 %640, 4
  %642 = shl i32 %641, 3
  %643 = add i32 %642, %640
  %644 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %643
  %645 = insertelement <1 x bfloat> undef, bfloat %546, i32 0
  %646 = extractelement <1 x bfloat> %645, i32 0
  %647 = bitcast bfloat %646 to i16
  %648 = insertelement <1 x i16> undef, i16 %647, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %644, <1 x i16> %648, i1 true)
  %649 = xor i32 %588, 520
  %650 = lshr i32 %649, 4
  %651 = shl i32 %650, 3
  %652 = add i32 %651, %649
  %653 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %652
  %654 = insertelement <1 x bfloat> undef, bfloat %547, i32 0
  %655 = extractelement <1 x bfloat> %654, i32 0
  %656 = bitcast bfloat %655 to i16
  %657 = insertelement <1 x i16> undef, i16 %656, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %653, <1 x i16> %657, i1 true)
  %658 = xor i32 %588, 536
  %659 = lshr i32 %658, 4
  %660 = shl i32 %659, 3
  %661 = add i32 %660, %658
  %662 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %661
  %663 = insertelement <1 x bfloat> undef, bfloat %548, i32 0
  %664 = extractelement <1 x bfloat> %663, i32 0
  %665 = bitcast bfloat %664 to i16
  %666 = insertelement <1 x i16> undef, i16 %665, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %662, <1 x i16> %666, i1 true)
  call void @llvm.nvvm.barrier0()
  %667 = xor i32 %594, 0
  %668 = lshr i32 %667, 4
  %669 = shl i32 %668, 3
  %670 = add i32 %669, %667
  %671 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %670
  %672 = load <4 x i32>, ptr addrspace(3) %671, align 16
  %673 = extractelement <4 x i32> %672, i32 0
  %674 = extractelement <4 x i32> %672, i32 1
  %675 = extractelement <4 x i32> %672, i32 2
  %676 = extractelement <4 x i32> %672, i32 3
  %677 = insertelement <4 x i32> undef, i32 %673, i32 0
  %678 = insertelement <4 x i32> %677, i32 %674, i32 1
  %679 = insertelement <4 x i32> %678, i32 %675, i32 2
  %680 = insertelement <4 x i32> %679, i32 %676, i32 3
  %681 = extractelement <4 x i32> %680, i32 0
  %682 = extractelement <4 x i32> %680, i32 1
  %683 = extractelement <4 x i32> %680, i32 2
  %684 = extractelement <4 x i32> %680, i32 3
  %685 = bitcast i32 %681 to <2 x i16>
  %686 = extractelement <2 x i16> %685, i32 0
  %687 = extractelement <2 x i16> %685, i32 1
  %688 = bitcast i32 %682 to <2 x i16>
  %689 = extractelement <2 x i16> %688, i32 0
  %690 = extractelement <2 x i16> %688, i32 1
  %691 = bitcast i32 %683 to <2 x i16>
  %692 = extractelement <2 x i16> %691, i32 0
  %693 = extractelement <2 x i16> %691, i32 1
  %694 = bitcast i32 %684 to <2 x i16>
  %695 = extractelement <2 x i16> %694, i32 0
  %696 = extractelement <2 x i16> %694, i32 1
  %697 = insertelement <8 x i16> undef, i16 %686, i32 0
  %698 = insertelement <8 x i16> %697, i16 %687, i32 1
  %699 = insertelement <8 x i16> %698, i16 %689, i32 2
  %700 = insertelement <8 x i16> %699, i16 %690, i32 3
  %701 = insertelement <8 x i16> %700, i16 %692, i32 4
  %702 = insertelement <8 x i16> %701, i16 %693, i32 5
  %703 = insertelement <8 x i16> %702, i16 %695, i32 6
  %704 = insertelement <8 x i16> %703, i16 %696, i32 7
  %705 = extractelement <8 x i16> %704, i32 0
  %706 = extractelement <8 x i16> %704, i32 1
  %707 = extractelement <8 x i16> %704, i32 2
  %708 = extractelement <8 x i16> %704, i32 3
  %709 = extractelement <8 x i16> %704, i32 4
  %710 = extractelement <8 x i16> %704, i32 5
  %711 = extractelement <8 x i16> %704, i32 6
  %712 = extractelement <8 x i16> %704, i32 7
  %713 = bitcast i16 %705 to bfloat
  %714 = bitcast i16 %706 to bfloat
  %715 = bitcast i16 %707 to bfloat
  %716 = bitcast i16 %708 to bfloat
  %717 = bitcast i16 %709 to bfloat
  %718 = bitcast i16 %710 to bfloat
  %719 = bitcast i16 %711 to bfloat
  %720 = bitcast i16 %712 to bfloat
  %721 = insertelement <8 x bfloat> undef, bfloat %713, i32 0
  %722 = insertelement <8 x bfloat> %721, bfloat %714, i32 1
  %723 = insertelement <8 x bfloat> %722, bfloat %715, i32 2
  %724 = insertelement <8 x bfloat> %723, bfloat %716, i32 3
  %725 = insertelement <8 x bfloat> %724, bfloat %717, i32 4
  %726 = insertelement <8 x bfloat> %725, bfloat %718, i32 5
  %727 = insertelement <8 x bfloat> %726, bfloat %719, i32 6
  %728 = insertelement <8 x bfloat> %727, bfloat %720, i32 7
  %729 = extractelement <8 x bfloat> %728, i32 0
  %730 = extractelement <8 x bfloat> %728, i32 1
  %731 = extractelement <8 x bfloat> %728, i32 2
  %732 = extractelement <8 x bfloat> %728, i32 3
  %733 = extractelement <8 x bfloat> %728, i32 4
  %734 = extractelement <8 x bfloat> %728, i32 5
  %735 = extractelement <8 x bfloat> %728, i32 6
  %736 = extractelement <8 x bfloat> %728, i32 7
  %737 = insertelement <2 x bfloat> undef, bfloat %729, i32 0
  %738 = insertelement <2 x bfloat> %737, bfloat %730, i32 1
  %739 = bitcast <2 x bfloat> %738 to i32
  %740 = insertelement <2 x bfloat> undef, bfloat %731, i32 0
  %741 = insertelement <2 x bfloat> %740, bfloat %732, i32 1
  %742 = bitcast <2 x bfloat> %741 to i32
  %743 = insertelement <2 x bfloat> undef, bfloat %733, i32 0
  %744 = insertelement <2 x bfloat> %743, bfloat %734, i32 1
  %745 = bitcast <2 x bfloat> %744 to i32
  %746 = insertelement <2 x bfloat> undef, bfloat %735, i32 0
  %747 = insertelement <2 x bfloat> %746, bfloat %736, i32 1
  %748 = bitcast <2 x bfloat> %747 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %739, i32 %742, i32 %745, i32 %748, ptr addrspace(1) %574)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_40_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_40(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 2048
  %10 = add i64 %9, 1024
  %11 = getelementptr bfloat, ptr addrspace(1) %3, i64 %10
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = urem i32 %12, 32
  %14 = udiv i32 %12, 32
  %15 = and i32 %13, 1
  %16 = icmp eq i32 %15, 0
  %17 = select i1 %16, i32 0, i32 8
  %18 = xor i32 0, %17
  %19 = and i32 %13, 2
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 0, i32 16
  %22 = xor i32 %18, %21
  %23 = and i32 %13, 4
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 0, i32 32
  %26 = xor i32 %22, %25
  %27 = and i32 %13, 8
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 0, i32 64
  %30 = xor i32 %26, %29
  %31 = and i32 %13, 16
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %32, i32 0, i32 128
  %34 = xor i32 %30, %33
  %35 = and i32 %14, 1
  %36 = icmp eq i32 %35, 0
  %37 = select i1 %36, i32 0, i32 256
  %38 = xor i32 %34, %37
  %39 = xor i32 %38, 0
  %40 = xor i32 %38, 512
  %41 = add i32 %39, 0
  %42 = add i32 %40, 0
  %43 = sext i32 %41 to i64
  %44 = sext i32 %42 to i64
  %45 = getelementptr bfloat, ptr addrspace(1) %11, i64 %43
  %46 = getelementptr bfloat, ptr addrspace(1) %11, i64 %44
  %47 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %45)
  %48 = extractvalue { i32, i32, i32, i32 } %47, 0
  %49 = bitcast i32 %48 to <2 x bfloat>
  %50 = extractvalue { i32, i32, i32, i32 } %47, 1
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32, i32, i32 } %47, 2
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractvalue { i32, i32, i32, i32 } %47, 3
  %55 = bitcast i32 %54 to <2 x bfloat>
  %56 = extractelement <2 x bfloat> %49, i32 0
  %57 = extractelement <2 x bfloat> %49, i32 1
  %58 = extractelement <2 x bfloat> %51, i32 0
  %59 = extractelement <2 x bfloat> %51, i32 1
  %60 = extractelement <2 x bfloat> %53, i32 0
  %61 = extractelement <2 x bfloat> %53, i32 1
  %62 = extractelement <2 x bfloat> %55, i32 0
  %63 = extractelement <2 x bfloat> %55, i32 1
  %64 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %46)
  %65 = extractvalue { i32, i32, i32, i32 } %64, 0
  %66 = bitcast i32 %65 to <2 x bfloat>
  %67 = extractvalue { i32, i32, i32, i32 } %64, 1
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractvalue { i32, i32, i32, i32 } %64, 2
  %70 = bitcast i32 %69 to <2 x bfloat>
  %71 = extractvalue { i32, i32, i32, i32 } %64, 3
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractelement <2 x bfloat> %66, i32 0
  %74 = extractelement <2 x bfloat> %66, i32 1
  %75 = extractelement <2 x bfloat> %68, i32 0
  %76 = extractelement <2 x bfloat> %68, i32 1
  %77 = extractelement <2 x bfloat> %70, i32 0
  %78 = extractelement <2 x bfloat> %70, i32 1
  %79 = extractelement <2 x bfloat> %72, i32 0
  %80 = extractelement <2 x bfloat> %72, i32 1
  %81 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %82 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %83 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %84 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = mul i64 %8, 1024
  %98 = getelementptr bfloat, ptr addrspace(1) %2, i64 %97
  %99 = getelementptr bfloat, ptr addrspace(1) %98, i64 %43
  %100 = getelementptr bfloat, ptr addrspace(1) %98, i64 %44
  %101 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %99)
  %102 = extractvalue { i32, i32, i32, i32 } %101, 0
  %103 = bitcast i32 %102 to <2 x bfloat>
  %104 = extractvalue { i32, i32, i32, i32 } %101, 1
  %105 = bitcast i32 %104 to <2 x bfloat>
  %106 = extractvalue { i32, i32, i32, i32 } %101, 2
  %107 = bitcast i32 %106 to <2 x bfloat>
  %108 = extractvalue { i32, i32, i32, i32 } %101, 3
  %109 = bitcast i32 %108 to <2 x bfloat>
  %110 = extractelement <2 x bfloat> %103, i32 0
  %111 = extractelement <2 x bfloat> %103, i32 1
  %112 = extractelement <2 x bfloat> %105, i32 0
  %113 = extractelement <2 x bfloat> %105, i32 1
  %114 = extractelement <2 x bfloat> %107, i32 0
  %115 = extractelement <2 x bfloat> %107, i32 1
  %116 = extractelement <2 x bfloat> %109, i32 0
  %117 = extractelement <2 x bfloat> %109, i32 1
  %118 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %100)
  %119 = extractvalue { i32, i32, i32, i32 } %118, 0
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %118, 1
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %118, 2
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractvalue { i32, i32, i32, i32 } %118, 3
  %126 = bitcast i32 %125 to <2 x bfloat>
  %127 = extractelement <2 x bfloat> %120, i32 0
  %128 = extractelement <2 x bfloat> %120, i32 1
  %129 = extractelement <2 x bfloat> %122, i32 0
  %130 = extractelement <2 x bfloat> %122, i32 1
  %131 = extractelement <2 x bfloat> %124, i32 0
  %132 = extractelement <2 x bfloat> %124, i32 1
  %133 = extractelement <2 x bfloat> %126, i32 0
  %134 = extractelement <2 x bfloat> %126, i32 1
  %135 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110)
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = fadd float %81, %135
  %152 = fadd float %82, %136
  %153 = fadd float %83, %137
  %154 = fadd float %84, %138
  %155 = fadd float %85, %139
  %156 = fadd float %86, %140
  %157 = fadd float %87, %141
  %158 = fadd float %88, %142
  %159 = fadd float %89, %143
  %160 = fadd float %90, %144
  %161 = fadd float %91, %145
  %162 = fadd float %92, %146
  %163 = fadd float %93, %147
  %164 = fadd float %94, %148
  %165 = fadd float %95, %149
  %166 = fadd float %96, %150
  %167 = fmul float %151, %151
  %168 = fmul float %152, %152
  %169 = fmul float %153, %153
  %170 = fmul float %154, %154
  %171 = fmul float %155, %155
  %172 = fmul float %156, %156
  %173 = fmul float %157, %157
  %174 = fmul float %158, %158
  %175 = fmul float %159, %159
  %176 = fmul float %160, %160
  %177 = fmul float %161, %161
  %178 = fmul float %162, %162
  %179 = fmul float %163, %163
  %180 = fmul float %164, %164
  %181 = fmul float %165, %165
  %182 = fmul float %166, %166
  %183 = fadd float %167, %168
  %184 = fadd float %183, %169
  %185 = fadd float %184, %170
  %186 = fadd float %185, %171
  %187 = fadd float %186, %172
  %188 = fadd float %187, %173
  %189 = fadd float %188, %174
  %190 = fadd float %189, %175
  %191 = fadd float %190, %176
  %192 = fadd float %191, %177
  %193 = fadd float %192, %178
  %194 = fadd float %193, %179
  %195 = fadd float %194, %180
  %196 = fadd float %195, %181
  %197 = fadd float %196, %182
  %198 = bitcast float %197 to i32
  %199 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %198, i32 16, i32 31)
  %200 = bitcast i32 %199 to float
  %201 = fadd float %197, %200
  %202 = bitcast float %201 to i32
  %203 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %202, i32 8, i32 31)
  %204 = bitcast i32 %203 to float
  %205 = fadd float %201, %204
  %206 = bitcast float %205 to i32
  %207 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %206, i32 4, i32 31)
  %208 = bitcast i32 %207 to float
  %209 = fadd float %205, %208
  %210 = bitcast float %209 to i32
  %211 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %210, i32 2, i32 31)
  %212 = bitcast i32 %211 to float
  %213 = fadd float %209, %212
  %214 = bitcast float %213 to i32
  %215 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %214, i32 1, i32 31)
  %216 = bitcast i32 %215 to float
  %217 = fadd float %213, %216
  %218 = urem i32 %13, 32
  %219 = urem i32 %14, 2
  %220 = icmp eq i32 %218, 0
  %221 = and i1 true, %220
  %222 = add i32 0, %219
  %223 = getelementptr float, ptr addrspace(3) @global_smem, i32 %222
  %224 = insertelement <1 x float> undef, float %217, i32 0
  %225 = extractelement <1 x float> %224, i32 0
  %226 = bitcast float %225 to i32
  %227 = insertelement <1 x i32> undef, i32 %226, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %223, <1 x i32> %227, i1 %221)
  call void @llvm.nvvm.barrier0()
  %228 = icmp slt i32 %12, 2
  %229 = getelementptr float, ptr addrspace(3) @global_smem, i32 %12
  %230 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %229, i1 %228)
  %231 = insertelement <1 x i32> undef, i32 %230, i32 0
  %232 = extractelement <1 x i32> %231, i32 0
  %233 = bitcast i32 %232 to float
  %234 = insertelement <1 x float> undef, float %233, i32 0
  %235 = extractelement <1 x float> %234, i32 0
  %236 = bitcast float %235 to i32
  %237 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %236, i32 1, i32 31)
  %238 = bitcast i32 %237 to float
  %239 = fadd float %235, %238
  %240 = urem i32 %13, 2
  %241 = icmp eq i32 %240, 0
  %242 = and i1 %228, %241
  %243 = insertelement <1 x float> undef, float %239, i32 0
  %244 = extractelement <1 x float> %243, i32 0
  %245 = bitcast float %244 to i32
  %246 = insertelement <1 x i32> undef, i32 %245, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %229, <1 x i32> %246, i1 %242)
  call void @llvm.nvvm.barrier0()
  %247 = load float, ptr addrspace(3) @global_smem, align 4
  %248 = fmul float %247, 0x3F50000000000000
  %249 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %250 = bitcast i32 %249 to <1 x float>
  %251 = extractelement <1 x float> %250, i32 0
  %252 = fadd float %248, %251
  %253 = call float @__nv_rsqrtf(float %252)
  %254 = fmul float %151, %253
  %255 = fmul float %152, %253
  %256 = fmul float %153, %253
  %257 = fmul float %154, %253
  %258 = fmul float %155, %253
  %259 = fmul float %156, %253
  %260 = fmul float %157, %253
  %261 = fmul float %158, %253
  %262 = fmul float %159, %253
  %263 = fmul float %160, %253
  %264 = fmul float %161, %253
  %265 = fmul float %162, %253
  %266 = fmul float %163, %253
  %267 = fmul float %164, %253
  %268 = fmul float %165, %253
  %269 = fmul float %166, %253
  %270 = getelementptr bfloat, ptr addrspace(1) %4, i64 %43
  %271 = getelementptr bfloat, ptr addrspace(1) %4, i64 %44
  %272 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %270)
  %273 = extractvalue { i32, i32, i32, i32 } %272, 0
  %274 = bitcast i32 %273 to <2 x bfloat>
  %275 = extractvalue { i32, i32, i32, i32 } %272, 1
  %276 = bitcast i32 %275 to <2 x bfloat>
  %277 = extractvalue { i32, i32, i32, i32 } %272, 2
  %278 = bitcast i32 %277 to <2 x bfloat>
  %279 = extractvalue { i32, i32, i32, i32 } %272, 3
  %280 = bitcast i32 %279 to <2 x bfloat>
  %281 = extractelement <2 x bfloat> %274, i32 0
  %282 = extractelement <2 x bfloat> %274, i32 1
  %283 = extractelement <2 x bfloat> %276, i32 0
  %284 = extractelement <2 x bfloat> %276, i32 1
  %285 = extractelement <2 x bfloat> %278, i32 0
  %286 = extractelement <2 x bfloat> %278, i32 1
  %287 = extractelement <2 x bfloat> %280, i32 0
  %288 = extractelement <2 x bfloat> %280, i32 1
  %289 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %271)
  %290 = extractvalue { i32, i32, i32, i32 } %289, 0
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractvalue { i32, i32, i32, i32 } %289, 1
  %293 = bitcast i32 %292 to <2 x bfloat>
  %294 = extractvalue { i32, i32, i32, i32 } %289, 2
  %295 = bitcast i32 %294 to <2 x bfloat>
  %296 = extractvalue { i32, i32, i32, i32 } %289, 3
  %297 = bitcast i32 %296 to <2 x bfloat>
  %298 = extractelement <2 x bfloat> %291, i32 0
  %299 = extractelement <2 x bfloat> %291, i32 1
  %300 = extractelement <2 x bfloat> %293, i32 0
  %301 = extractelement <2 x bfloat> %293, i32 1
  %302 = extractelement <2 x bfloat> %295, i32 0
  %303 = extractelement <2 x bfloat> %295, i32 1
  %304 = extractelement <2 x bfloat> %297, i32 0
  %305 = extractelement <2 x bfloat> %297, i32 1
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %320 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304)
  %321 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %305)
  %322 = fmul float %254, %306
  %323 = fmul float %255, %307
  %324 = fmul float %256, %308
  %325 = fmul float %257, %309
  %326 = fmul float %258, %310
  %327 = fmul float %259, %311
  %328 = fmul float %260, %312
  %329 = fmul float %261, %313
  %330 = fmul float %262, %314
  %331 = fmul float %263, %315
  %332 = fmul float %264, %316
  %333 = fmul float %265, %317
  %334 = fmul float %266, %318
  %335 = fmul float %267, %319
  %336 = fmul float %268, %320
  %337 = fmul float %269, %321
  %338 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %322)
  %339 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %323)
  %340 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %324)
  %341 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %325)
  %342 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %326)
  %343 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %327)
  %344 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %328)
  %345 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %329)
  %346 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %330)
  %347 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %331)
  %348 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %332)
  %349 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %333)
  %350 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334)
  %351 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335)
  %352 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336)
  %353 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337)
  %354 = getelementptr bfloat, ptr addrspace(1) %5, i64 %97
  %355 = getelementptr bfloat, ptr addrspace(1) %354, i64 %43
  %356 = getelementptr bfloat, ptr addrspace(1) %354, i64 %44
  %357 = insertelement <2 x bfloat> undef, bfloat %338, i32 0
  %358 = insertelement <2 x bfloat> %357, bfloat %339, i32 1
  %359 = bitcast <2 x bfloat> %358 to i32
  %360 = insertelement <2 x bfloat> undef, bfloat %340, i32 0
  %361 = insertelement <2 x bfloat> %360, bfloat %341, i32 1
  %362 = bitcast <2 x bfloat> %361 to i32
  %363 = insertelement <2 x bfloat> undef, bfloat %342, i32 0
  %364 = insertelement <2 x bfloat> %363, bfloat %343, i32 1
  %365 = bitcast <2 x bfloat> %364 to i32
  %366 = insertelement <2 x bfloat> undef, bfloat %344, i32 0
  %367 = insertelement <2 x bfloat> %366, bfloat %345, i32 1
  %368 = bitcast <2 x bfloat> %367 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %359, i32 %362, i32 %365, i32 %368, ptr addrspace(1) %355)
  %369 = insertelement <2 x bfloat> undef, bfloat %346, i32 0
  %370 = insertelement <2 x bfloat> %369, bfloat %347, i32 1
  %371 = bitcast <2 x bfloat> %370 to i32
  %372 = insertelement <2 x bfloat> undef, bfloat %348, i32 0
  %373 = insertelement <2 x bfloat> %372, bfloat %349, i32 1
  %374 = bitcast <2 x bfloat> %373 to i32
  %375 = insertelement <2 x bfloat> undef, bfloat %350, i32 0
  %376 = insertelement <2 x bfloat> %375, bfloat %351, i32 1
  %377 = bitcast <2 x bfloat> %376 to i32
  %378 = insertelement <2 x bfloat> undef, bfloat %352, i32 0
  %379 = insertelement <2 x bfloat> %378, bfloat %353, i32 1
  %380 = bitcast <2 x bfloat> %379 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %356)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_convert_fusion(ptr noalias align 128 dereferenceable(1572864) %0, ptr noalias align 128 dereferenceable(786432) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = udiv i32 %4, 6
  %6 = mul i32 %3, 4
  %7 = mul i32 %4, 512
  %8 = add i32 %6, %7
  %9 = urem i32 %4, 6
  %10 = mul i32 %9, 512
  %11 = add i32 %10, %6
  %12 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %11)
  %13 = fpext bfloat %12 to float
  %14 = fneg float %13
  %15 = fptrunc float %14 to bfloat
  %16 = fpext bfloat %15 to float
  %17 = call float @__nv_fast_expf(float %16)
  %18 = fptrunc float %17 to bfloat
  %19 = fpext bfloat %18 to float
  %20 = fadd float %19, 1.000000e+00
  %21 = fdiv float 1.000000e+00, %20
  %22 = add i32 %11, 3072
  %23 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %22)
  %24 = fmul float %13, %21
  %25 = fpext bfloat %23 to float
  %26 = fmul float %24, %25
  %27 = fptrunc float %26 to bfloat
  %28 = insertelement <4 x bfloat> zeroinitializer, bfloat %27, i64 0
  %29 = add i32 %11, 1
  %30 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %29)
  %31 = fpext bfloat %30 to float
  %32 = fneg float %31
  %33 = fptrunc float %32 to bfloat
  %34 = fpext bfloat %33 to float
  %35 = call float @__nv_fast_expf(float %34)
  %36 = fptrunc float %35 to bfloat
  %37 = fpext bfloat %36 to float
  %38 = fadd float %37, 1.000000e+00
  %39 = fdiv float 1.000000e+00, %38
  %40 = add i32 %29, 3072
  %41 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %40)
  %42 = fmul float %31, %39
  %43 = fpext bfloat %41 to float
  %44 = fmul float %42, %43
  %45 = fptrunc float %44 to bfloat
  %46 = insertelement <4 x bfloat> %28, bfloat %45, i64 1
  %47 = add i32 %11, 2
  %48 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %47)
  %49 = fpext bfloat %48 to float
  %50 = fneg float %49
  %51 = fptrunc float %50 to bfloat
  %52 = fpext bfloat %51 to float
  %53 = call float @__nv_fast_expf(float %52)
  %54 = fptrunc float %53 to bfloat
  %55 = fpext bfloat %54 to float
  %56 = fadd float %55, 1.000000e+00
  %57 = fdiv float 1.000000e+00, %56
  %58 = add i32 %47, 3072
  %59 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %58)
  %60 = fmul float %49, %57
  %61 = fpext bfloat %59 to float
  %62 = fmul float %60, %61
  %63 = fptrunc float %62 to bfloat
  %64 = insertelement <4 x bfloat> %46, bfloat %63, i64 2
  %65 = add i32 %11, 3
  %66 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %65)
  %67 = fpext bfloat %66 to float
  %68 = fneg float %67
  %69 = fptrunc float %68 to bfloat
  %70 = fpext bfloat %69 to float
  %71 = call float @__nv_fast_expf(float %70)
  %72 = fptrunc float %71 to bfloat
  %73 = fpext bfloat %72 to float
  %74 = fadd float %73, 1.000000e+00
  %75 = fdiv float 1.000000e+00, %74
  %76 = add i32 %65, 3072
  %77 = call bfloat @fused_convert_param_0_147(ptr %0, i32 %5, i32 %76)
  %78 = fmul float %67, %75
  %79 = fpext bfloat %77 to float
  %80 = fmul float %78, %79
  %81 = fptrunc float %80 to bfloat
  %82 = insertelement <4 x bfloat> %64, bfloat %81, i64 3
  %83 = getelementptr inbounds bfloat, ptr %1, i32 %8
  store <4 x bfloat> %82, ptr %83, align 8
  ret void
}

define internal bfloat @fused_convert_param_0_147(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_38_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_38(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 2048
  %11 = getelementptr bfloat, ptr addrspace(1) %3, i64 %10
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = urem i32 %12, 32
  %14 = udiv i32 %12, 32
  %15 = and i32 %13, 1
  %16 = icmp eq i32 %15, 0
  %17 = select i1 %16, i32 0, i32 8
  %18 = xor i32 0, %17
  %19 = and i32 %13, 2
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 0, i32 16
  %22 = xor i32 %18, %21
  %23 = and i32 %13, 4
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 0, i32 32
  %26 = xor i32 %22, %25
  %27 = and i32 %13, 8
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 0, i32 64
  %30 = xor i32 %26, %29
  %31 = and i32 %13, 16
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %32, i32 0, i32 128
  %34 = xor i32 %30, %33
  %35 = and i32 %14, 1
  %36 = icmp eq i32 %35, 0
  %37 = select i1 %36, i32 0, i32 256
  %38 = xor i32 %34, %37
  %39 = xor i32 %38, 0
  %40 = xor i32 %38, 512
  %41 = add i32 %39, 0
  %42 = add i32 %40, 0
  %43 = sext i32 %41 to i64
  %44 = sext i32 %42 to i64
  %45 = getelementptr bfloat, ptr addrspace(1) %11, i64 %43
  %46 = getelementptr bfloat, ptr addrspace(1) %11, i64 %44
  %47 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %45)
  %48 = extractvalue { i32, i32, i32, i32 } %47, 0
  %49 = bitcast i32 %48 to <2 x bfloat>
  %50 = extractvalue { i32, i32, i32, i32 } %47, 1
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32, i32, i32 } %47, 2
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractvalue { i32, i32, i32, i32 } %47, 3
  %55 = bitcast i32 %54 to <2 x bfloat>
  %56 = extractelement <2 x bfloat> %49, i32 0
  %57 = extractelement <2 x bfloat> %49, i32 1
  %58 = extractelement <2 x bfloat> %51, i32 0
  %59 = extractelement <2 x bfloat> %51, i32 1
  %60 = extractelement <2 x bfloat> %53, i32 0
  %61 = extractelement <2 x bfloat> %53, i32 1
  %62 = extractelement <2 x bfloat> %55, i32 0
  %63 = extractelement <2 x bfloat> %55, i32 1
  %64 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %46)
  %65 = extractvalue { i32, i32, i32, i32 } %64, 0
  %66 = bitcast i32 %65 to <2 x bfloat>
  %67 = extractvalue { i32, i32, i32, i32 } %64, 1
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractvalue { i32, i32, i32, i32 } %64, 2
  %70 = bitcast i32 %69 to <2 x bfloat>
  %71 = extractvalue { i32, i32, i32, i32 } %64, 3
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractelement <2 x bfloat> %66, i32 0
  %74 = extractelement <2 x bfloat> %66, i32 1
  %75 = extractelement <2 x bfloat> %68, i32 0
  %76 = extractelement <2 x bfloat> %68, i32 1
  %77 = extractelement <2 x bfloat> %70, i32 0
  %78 = extractelement <2 x bfloat> %70, i32 1
  %79 = extractelement <2 x bfloat> %72, i32 0
  %80 = extractelement <2 x bfloat> %72, i32 1
  %81 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %82 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %83 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %84 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = mul i64 %9, 1024
  %98 = getelementptr bfloat, ptr addrspace(1) %4, i64 %97
  %99 = getelementptr bfloat, ptr addrspace(1) %98, i64 %43
  %100 = getelementptr bfloat, ptr addrspace(1) %98, i64 %44
  %101 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %99)
  %102 = extractvalue { i32, i32, i32, i32 } %101, 0
  %103 = bitcast i32 %102 to <2 x bfloat>
  %104 = extractvalue { i32, i32, i32, i32 } %101, 1
  %105 = bitcast i32 %104 to <2 x bfloat>
  %106 = extractvalue { i32, i32, i32, i32 } %101, 2
  %107 = bitcast i32 %106 to <2 x bfloat>
  %108 = extractvalue { i32, i32, i32, i32 } %101, 3
  %109 = bitcast i32 %108 to <2 x bfloat>
  %110 = extractelement <2 x bfloat> %103, i32 0
  %111 = extractelement <2 x bfloat> %103, i32 1
  %112 = extractelement <2 x bfloat> %105, i32 0
  %113 = extractelement <2 x bfloat> %105, i32 1
  %114 = extractelement <2 x bfloat> %107, i32 0
  %115 = extractelement <2 x bfloat> %107, i32 1
  %116 = extractelement <2 x bfloat> %109, i32 0
  %117 = extractelement <2 x bfloat> %109, i32 1
  %118 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %100)
  %119 = extractvalue { i32, i32, i32, i32 } %118, 0
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %118, 1
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %118, 2
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractvalue { i32, i32, i32, i32 } %118, 3
  %126 = bitcast i32 %125 to <2 x bfloat>
  %127 = extractelement <2 x bfloat> %120, i32 0
  %128 = extractelement <2 x bfloat> %120, i32 1
  %129 = extractelement <2 x bfloat> %122, i32 0
  %130 = extractelement <2 x bfloat> %122, i32 1
  %131 = extractelement <2 x bfloat> %124, i32 0
  %132 = extractelement <2 x bfloat> %124, i32 1
  %133 = extractelement <2 x bfloat> %126, i32 0
  %134 = extractelement <2 x bfloat> %126, i32 1
  %135 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110)
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = add i64 %10, 1024
  %152 = getelementptr bfloat, ptr addrspace(1) %3, i64 %151
  %153 = getelementptr bfloat, ptr addrspace(1) %152, i64 %43
  %154 = getelementptr bfloat, ptr addrspace(1) %152, i64 %44
  %155 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153)
  %156 = extractvalue { i32, i32, i32, i32 } %155, 0
  %157 = bitcast i32 %156 to <2 x bfloat>
  %158 = extractvalue { i32, i32, i32, i32 } %155, 1
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %155, 2
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %155, 3
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractelement <2 x bfloat> %157, i32 0
  %165 = extractelement <2 x bfloat> %157, i32 1
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %154)
  %173 = extractvalue { i32, i32, i32, i32 } %172, 0
  %174 = bitcast i32 %173 to <2 x bfloat>
  %175 = extractvalue { i32, i32, i32, i32 } %172, 1
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %172, 2
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %172, 3
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractelement <2 x bfloat> %174, i32 0
  %182 = extractelement <2 x bfloat> %174, i32 1
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = getelementptr bfloat, ptr addrspace(1) %2, i64 %97
  %206 = getelementptr bfloat, ptr addrspace(1) %205, i64 %43
  %207 = getelementptr bfloat, ptr addrspace(1) %205, i64 %44
  %208 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %206)
  %209 = extractvalue { i32, i32, i32, i32 } %208, 0
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %208, 1
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractvalue { i32, i32, i32, i32 } %208, 2
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %208, 3
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractelement <2 x bfloat> %210, i32 0
  %218 = extractelement <2 x bfloat> %210, i32 1
  %219 = extractelement <2 x bfloat> %212, i32 0
  %220 = extractelement <2 x bfloat> %212, i32 1
  %221 = extractelement <2 x bfloat> %214, i32 0
  %222 = extractelement <2 x bfloat> %214, i32 1
  %223 = extractelement <2 x bfloat> %216, i32 0
  %224 = extractelement <2 x bfloat> %216, i32 1
  %225 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %207)
  %226 = extractvalue { i32, i32, i32, i32 } %225, 0
  %227 = bitcast i32 %226 to <2 x bfloat>
  %228 = extractvalue { i32, i32, i32, i32 } %225, 1
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %225, 2
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %225, 3
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractelement <2 x bfloat> %227, i32 0
  %235 = extractelement <2 x bfloat> %227, i32 1
  %236 = extractelement <2 x bfloat> %229, i32 0
  %237 = extractelement <2 x bfloat> %229, i32 1
  %238 = extractelement <2 x bfloat> %231, i32 0
  %239 = extractelement <2 x bfloat> %231, i32 1
  %240 = extractelement <2 x bfloat> %233, i32 0
  %241 = extractelement <2 x bfloat> %233, i32 1
  %242 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217)
  %243 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218)
  %244 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219)
  %245 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %246 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %247 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = fadd float %189, %242
  %259 = fadd float %190, %243
  %260 = fadd float %191, %244
  %261 = fadd float %192, %245
  %262 = fadd float %193, %246
  %263 = fadd float %194, %247
  %264 = fadd float %195, %248
  %265 = fadd float %196, %249
  %266 = fadd float %197, %250
  %267 = fadd float %198, %251
  %268 = fadd float %199, %252
  %269 = fadd float %200, %253
  %270 = fadd float %201, %254
  %271 = fadd float %202, %255
  %272 = fadd float %203, %256
  %273 = fadd float %204, %257
  %274 = fadd float %135, %258
  %275 = fadd float %136, %259
  %276 = fadd float %137, %260
  %277 = fadd float %138, %261
  %278 = fadd float %139, %262
  %279 = fadd float %140, %263
  %280 = fadd float %141, %264
  %281 = fadd float %142, %265
  %282 = fadd float %143, %266
  %283 = fadd float %144, %267
  %284 = fadd float %145, %268
  %285 = fadd float %146, %269
  %286 = fadd float %147, %270
  %287 = fadd float %148, %271
  %288 = fadd float %149, %272
  %289 = fadd float %150, %273
  %290 = fadd float %81, %274
  %291 = fadd float %82, %275
  %292 = fadd float %83, %276
  %293 = fadd float %84, %277
  %294 = fadd float %85, %278
  %295 = fadd float %86, %279
  %296 = fadd float %87, %280
  %297 = fadd float %88, %281
  %298 = fadd float %89, %282
  %299 = fadd float %90, %283
  %300 = fadd float %91, %284
  %301 = fadd float %92, %285
  %302 = fadd float %93, %286
  %303 = fadd float %94, %287
  %304 = fadd float %95, %288
  %305 = fadd float %96, %289
  %306 = fmul float %290, %290
  %307 = fmul float %291, %291
  %308 = fmul float %292, %292
  %309 = fmul float %293, %293
  %310 = fmul float %294, %294
  %311 = fmul float %295, %295
  %312 = fmul float %296, %296
  %313 = fmul float %297, %297
  %314 = fmul float %298, %298
  %315 = fmul float %299, %299
  %316 = fmul float %300, %300
  %317 = fmul float %301, %301
  %318 = fmul float %302, %302
  %319 = fmul float %303, %303
  %320 = fmul float %304, %304
  %321 = fmul float %305, %305
  %322 = fadd float %306, %307
  %323 = fadd float %322, %308
  %324 = fadd float %323, %309
  %325 = fadd float %324, %310
  %326 = fadd float %325, %311
  %327 = fadd float %326, %312
  %328 = fadd float %327, %313
  %329 = fadd float %328, %314
  %330 = fadd float %329, %315
  %331 = fadd float %330, %316
  %332 = fadd float %331, %317
  %333 = fadd float %332, %318
  %334 = fadd float %333, %319
  %335 = fadd float %334, %320
  %336 = fadd float %335, %321
  %337 = bitcast float %336 to i32
  %338 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %337, i32 16, i32 31)
  %339 = bitcast i32 %338 to float
  %340 = fadd float %336, %339
  %341 = bitcast float %340 to i32
  %342 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %341, i32 8, i32 31)
  %343 = bitcast i32 %342 to float
  %344 = fadd float %340, %343
  %345 = bitcast float %344 to i32
  %346 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %345, i32 4, i32 31)
  %347 = bitcast i32 %346 to float
  %348 = fadd float %344, %347
  %349 = bitcast float %348 to i32
  %350 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %349, i32 2, i32 31)
  %351 = bitcast i32 %350 to float
  %352 = fadd float %348, %351
  %353 = bitcast float %352 to i32
  %354 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %353, i32 1, i32 31)
  %355 = bitcast i32 %354 to float
  %356 = fadd float %352, %355
  %357 = urem i32 %13, 32
  %358 = urem i32 %14, 2
  %359 = icmp eq i32 %357, 0
  %360 = and i1 true, %359
  %361 = add i32 0, %358
  %362 = getelementptr float, ptr addrspace(3) @global_smem, i32 %361
  %363 = insertelement <1 x float> undef, float %356, i32 0
  %364 = extractelement <1 x float> %363, i32 0
  %365 = bitcast float %364 to i32
  %366 = insertelement <1 x i32> undef, i32 %365, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %362, <1 x i32> %366, i1 %360)
  call void @llvm.nvvm.barrier0()
  %367 = icmp slt i32 %12, 2
  %368 = getelementptr float, ptr addrspace(3) @global_smem, i32 %12
  %369 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %368, i1 %367)
  %370 = insertelement <1 x i32> undef, i32 %369, i32 0
  %371 = extractelement <1 x i32> %370, i32 0
  %372 = bitcast i32 %371 to float
  %373 = insertelement <1 x float> undef, float %372, i32 0
  %374 = extractelement <1 x float> %373, i32 0
  %375 = bitcast float %374 to i32
  %376 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %375, i32 1, i32 31)
  %377 = bitcast i32 %376 to float
  %378 = fadd float %374, %377
  %379 = urem i32 %13, 2
  %380 = icmp eq i32 %379, 0
  %381 = and i1 %367, %380
  %382 = insertelement <1 x float> undef, float %378, i32 0
  %383 = extractelement <1 x float> %382, i32 0
  %384 = bitcast float %383 to i32
  %385 = insertelement <1 x i32> undef, i32 %384, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %368, <1 x i32> %385, i1 %381)
  call void @llvm.nvvm.barrier0()
  %386 = load float, ptr addrspace(3) @global_smem, align 4
  %387 = fmul float %386, 0x3F50000000000000
  %388 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %389 = bitcast i32 %388 to <1 x float>
  %390 = extractelement <1 x float> %389, i32 0
  %391 = fadd float %387, %390
  %392 = call float @__nv_rsqrtf(float %391)
  %393 = fmul float %290, %392
  %394 = fmul float %291, %392
  %395 = fmul float %292, %392
  %396 = fmul float %293, %392
  %397 = fmul float %294, %392
  %398 = fmul float %295, %392
  %399 = fmul float %296, %392
  %400 = fmul float %297, %392
  %401 = fmul float %298, %392
  %402 = fmul float %299, %392
  %403 = fmul float %300, %392
  %404 = fmul float %301, %392
  %405 = fmul float %302, %392
  %406 = fmul float %303, %392
  %407 = fmul float %304, %392
  %408 = fmul float %305, %392
  %409 = getelementptr bfloat, ptr addrspace(1) %5, i64 %43
  %410 = getelementptr bfloat, ptr addrspace(1) %5, i64 %44
  %411 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %409)
  %412 = extractvalue { i32, i32, i32, i32 } %411, 0
  %413 = bitcast i32 %412 to <2 x bfloat>
  %414 = extractvalue { i32, i32, i32, i32 } %411, 1
  %415 = bitcast i32 %414 to <2 x bfloat>
  %416 = extractvalue { i32, i32, i32, i32 } %411, 2
  %417 = bitcast i32 %416 to <2 x bfloat>
  %418 = extractvalue { i32, i32, i32, i32 } %411, 3
  %419 = bitcast i32 %418 to <2 x bfloat>
  %420 = extractelement <2 x bfloat> %413, i32 0
  %421 = extractelement <2 x bfloat> %413, i32 1
  %422 = extractelement <2 x bfloat> %415, i32 0
  %423 = extractelement <2 x bfloat> %415, i32 1
  %424 = extractelement <2 x bfloat> %417, i32 0
  %425 = extractelement <2 x bfloat> %417, i32 1
  %426 = extractelement <2 x bfloat> %419, i32 0
  %427 = extractelement <2 x bfloat> %419, i32 1
  %428 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %410)
  %429 = extractvalue { i32, i32, i32, i32 } %428, 0
  %430 = bitcast i32 %429 to <2 x bfloat>
  %431 = extractvalue { i32, i32, i32, i32 } %428, 1
  %432 = bitcast i32 %431 to <2 x bfloat>
  %433 = extractvalue { i32, i32, i32, i32 } %428, 2
  %434 = bitcast i32 %433 to <2 x bfloat>
  %435 = extractvalue { i32, i32, i32, i32 } %428, 3
  %436 = bitcast i32 %435 to <2 x bfloat>
  %437 = extractelement <2 x bfloat> %430, i32 0
  %438 = extractelement <2 x bfloat> %430, i32 1
  %439 = extractelement <2 x bfloat> %432, i32 0
  %440 = extractelement <2 x bfloat> %432, i32 1
  %441 = extractelement <2 x bfloat> %434, i32 0
  %442 = extractelement <2 x bfloat> %434, i32 1
  %443 = extractelement <2 x bfloat> %436, i32 0
  %444 = extractelement <2 x bfloat> %436, i32 1
  %445 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420)
  %446 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421)
  %447 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422)
  %448 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423)
  %449 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424)
  %450 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425)
  %451 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426)
  %452 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %427)
  %453 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437)
  %454 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438)
  %455 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439)
  %456 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %457 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %458 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442)
  %459 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443)
  %460 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444)
  %461 = fmul float %393, %445
  %462 = fmul float %394, %446
  %463 = fmul float %395, %447
  %464 = fmul float %396, %448
  %465 = fmul float %397, %449
  %466 = fmul float %398, %450
  %467 = fmul float %399, %451
  %468 = fmul float %400, %452
  %469 = fmul float %401, %453
  %470 = fmul float %402, %454
  %471 = fmul float %403, %455
  %472 = fmul float %404, %456
  %473 = fmul float %405, %457
  %474 = fmul float %406, %458
  %475 = fmul float %407, %459
  %476 = fmul float %408, %460
  %477 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %461)
  %478 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %462)
  %479 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %463)
  %480 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %464)
  %481 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %465)
  %482 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %466)
  %483 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %467)
  %484 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %468)
  %485 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %469)
  %486 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %470)
  %487 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %471)
  %488 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %472)
  %489 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473)
  %490 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474)
  %491 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475)
  %492 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476)
  %493 = getelementptr bfloat, ptr addrspace(1) %6, i64 %97
  %494 = getelementptr bfloat, ptr addrspace(1) %493, i64 %43
  %495 = getelementptr bfloat, ptr addrspace(1) %493, i64 %44
  %496 = insertelement <2 x bfloat> undef, bfloat %477, i32 0
  %497 = insertelement <2 x bfloat> %496, bfloat %478, i32 1
  %498 = bitcast <2 x bfloat> %497 to i32
  %499 = insertelement <2 x bfloat> undef, bfloat %479, i32 0
  %500 = insertelement <2 x bfloat> %499, bfloat %480, i32 1
  %501 = bitcast <2 x bfloat> %500 to i32
  %502 = insertelement <2 x bfloat> undef, bfloat %481, i32 0
  %503 = insertelement <2 x bfloat> %502, bfloat %482, i32 1
  %504 = bitcast <2 x bfloat> %503 to i32
  %505 = insertelement <2 x bfloat> undef, bfloat %483, i32 0
  %506 = insertelement <2 x bfloat> %505, bfloat %484, i32 1
  %507 = bitcast <2 x bfloat> %506 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %498, i32 %501, i32 %504, i32 %507, ptr addrspace(1) %494)
  %508 = insertelement <2 x bfloat> undef, bfloat %485, i32 0
  %509 = insertelement <2 x bfloat> %508, bfloat %486, i32 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> undef, bfloat %487, i32 0
  %512 = insertelement <2 x bfloat> %511, bfloat %488, i32 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> undef, bfloat %489, i32 0
  %515 = insertelement <2 x bfloat> %514, bfloat %490, i32 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> undef, bfloat %491, i32 0
  %518 = insertelement <2 x bfloat> %517, bfloat %492, i32 1
  %519 = bitcast <2 x bfloat> %518 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %495)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_36_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_36(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(524288) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 16 dereferenceable(2048) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) #6 {
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
  %11 = mul i64 %10, 1024
  %12 = getelementptr bfloat, ptr addrspace(1) %2, i64 %11
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = urem i32 %13, 32
  %15 = udiv i32 %13, 32
  %16 = and i32 %14, 1
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 0, i32 8
  %19 = xor i32 0, %18
  %20 = and i32 %14, 2
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 16
  %23 = xor i32 %19, %22
  %24 = and i32 %14, 4
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 32
  %27 = xor i32 %23, %26
  %28 = and i32 %14, 8
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 64
  %31 = xor i32 %27, %30
  %32 = and i32 %14, 16
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 128
  %35 = xor i32 %31, %34
  %36 = and i32 %15, 1
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 0, i32 256
  %39 = xor i32 %35, %38
  %40 = xor i32 %39, 0
  %41 = xor i32 %39, 512
  %42 = add i32 %40, 0
  %43 = add i32 %41, 0
  %44 = sext i32 %42 to i64
  %45 = sext i32 %43 to i64
  %46 = getelementptr bfloat, ptr addrspace(1) %12, i64 %44
  %47 = getelementptr bfloat, ptr addrspace(1) %12, i64 %45
  %48 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %46)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = bitcast i32 %53 to <2 x bfloat>
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractelement <2 x bfloat> %50, i32 0
  %58 = extractelement <2 x bfloat> %50, i32 1
  %59 = extractelement <2 x bfloat> %52, i32 0
  %60 = extractelement <2 x bfloat> %52, i32 1
  %61 = extractelement <2 x bfloat> %54, i32 0
  %62 = extractelement <2 x bfloat> %54, i32 1
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %47)
  %66 = extractvalue { i32, i32, i32, i32 } %65, 0
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractvalue { i32, i32, i32, i32 } %65, 1
  %69 = bitcast i32 %68 to <2 x bfloat>
  %70 = extractvalue { i32, i32, i32, i32 } %65, 2
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractvalue { i32, i32, i32, i32 } %65, 3
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractelement <2 x bfloat> %67, i32 0
  %75 = extractelement <2 x bfloat> %67, i32 1
  %76 = extractelement <2 x bfloat> %69, i32 0
  %77 = extractelement <2 x bfloat> %69, i32 1
  %78 = extractelement <2 x bfloat> %71, i32 0
  %79 = extractelement <2 x bfloat> %71, i32 1
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %83 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %84 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = mul i64 %10, 2048
  %99 = getelementptr bfloat, ptr addrspace(1) %4, i64 %98
  %100 = getelementptr bfloat, ptr addrspace(1) %99, i64 %44
  %101 = getelementptr bfloat, ptr addrspace(1) %99, i64 %45
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
  %152 = getelementptr bfloat, ptr addrspace(1) %5, i64 %11
  %153 = getelementptr bfloat, ptr addrspace(1) %152, i64 %44
  %154 = getelementptr bfloat, ptr addrspace(1) %152, i64 %45
  %155 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153)
  %156 = extractvalue { i32, i32, i32, i32 } %155, 0
  %157 = bitcast i32 %156 to <2 x bfloat>
  %158 = extractvalue { i32, i32, i32, i32 } %155, 1
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %155, 2
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractvalue { i32, i32, i32, i32 } %155, 3
  %163 = bitcast i32 %162 to <2 x bfloat>
  %164 = extractelement <2 x bfloat> %157, i32 0
  %165 = extractelement <2 x bfloat> %157, i32 1
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = extractelement <2 x bfloat> %163, i32 0
  %171 = extractelement <2 x bfloat> %163, i32 1
  %172 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %154)
  %173 = extractvalue { i32, i32, i32, i32 } %172, 0
  %174 = bitcast i32 %173 to <2 x bfloat>
  %175 = extractvalue { i32, i32, i32, i32 } %172, 1
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %172, 2
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %172, 3
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractelement <2 x bfloat> %174, i32 0
  %182 = extractelement <2 x bfloat> %174, i32 1
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = add i64 %98, 1024
  %206 = getelementptr bfloat, ptr addrspace(1) %4, i64 %205
  %207 = getelementptr bfloat, ptr addrspace(1) %206, i64 %44
  %208 = getelementptr bfloat, ptr addrspace(1) %206, i64 %45
  %209 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %207)
  %210 = extractvalue { i32, i32, i32, i32 } %209, 0
  %211 = bitcast i32 %210 to <2 x bfloat>
  %212 = extractvalue { i32, i32, i32, i32 } %209, 1
  %213 = bitcast i32 %212 to <2 x bfloat>
  %214 = extractvalue { i32, i32, i32, i32 } %209, 2
  %215 = bitcast i32 %214 to <2 x bfloat>
  %216 = extractvalue { i32, i32, i32, i32 } %209, 3
  %217 = bitcast i32 %216 to <2 x bfloat>
  %218 = extractelement <2 x bfloat> %211, i32 0
  %219 = extractelement <2 x bfloat> %211, i32 1
  %220 = extractelement <2 x bfloat> %213, i32 0
  %221 = extractelement <2 x bfloat> %213, i32 1
  %222 = extractelement <2 x bfloat> %215, i32 0
  %223 = extractelement <2 x bfloat> %215, i32 1
  %224 = extractelement <2 x bfloat> %217, i32 0
  %225 = extractelement <2 x bfloat> %217, i32 1
  %226 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %208)
  %227 = extractvalue { i32, i32, i32, i32 } %226, 0
  %228 = bitcast i32 %227 to <2 x bfloat>
  %229 = extractvalue { i32, i32, i32, i32 } %226, 1
  %230 = bitcast i32 %229 to <2 x bfloat>
  %231 = extractvalue { i32, i32, i32, i32 } %226, 2
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %226, 3
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractelement <2 x bfloat> %228, i32 0
  %236 = extractelement <2 x bfloat> %228, i32 1
  %237 = extractelement <2 x bfloat> %230, i32 0
  %238 = extractelement <2 x bfloat> %230, i32 1
  %239 = extractelement <2 x bfloat> %232, i32 0
  %240 = extractelement <2 x bfloat> %232, i32 1
  %241 = extractelement <2 x bfloat> %234, i32 0
  %242 = extractelement <2 x bfloat> %234, i32 1
  %243 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218)
  %244 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219)
  %245 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %246 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %247 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = getelementptr bfloat, ptr addrspace(1) %3, i64 %11
  %260 = getelementptr bfloat, ptr addrspace(1) %259, i64 %44
  %261 = getelementptr bfloat, ptr addrspace(1) %259, i64 %45
  %262 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %260)
  %263 = extractvalue { i32, i32, i32, i32 } %262, 0
  %264 = bitcast i32 %263 to <2 x bfloat>
  %265 = extractvalue { i32, i32, i32, i32 } %262, 1
  %266 = bitcast i32 %265 to <2 x bfloat>
  %267 = extractvalue { i32, i32, i32, i32 } %262, 2
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %262, 3
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = extractelement <2 x bfloat> %264, i32 0
  %272 = extractelement <2 x bfloat> %264, i32 1
  %273 = extractelement <2 x bfloat> %266, i32 0
  %274 = extractelement <2 x bfloat> %266, i32 1
  %275 = extractelement <2 x bfloat> %268, i32 0
  %276 = extractelement <2 x bfloat> %268, i32 1
  %277 = extractelement <2 x bfloat> %270, i32 0
  %278 = extractelement <2 x bfloat> %270, i32 1
  %279 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %261)
  %280 = extractvalue { i32, i32, i32, i32 } %279, 0
  %281 = bitcast i32 %280 to <2 x bfloat>
  %282 = extractvalue { i32, i32, i32, i32 } %279, 1
  %283 = bitcast i32 %282 to <2 x bfloat>
  %284 = extractvalue { i32, i32, i32, i32 } %279, 2
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %279, 3
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractelement <2 x bfloat> %281, i32 0
  %289 = extractelement <2 x bfloat> %281, i32 1
  %290 = extractelement <2 x bfloat> %283, i32 0
  %291 = extractelement <2 x bfloat> %283, i32 1
  %292 = extractelement <2 x bfloat> %285, i32 0
  %293 = extractelement <2 x bfloat> %285, i32 1
  %294 = extractelement <2 x bfloat> %287, i32 0
  %295 = extractelement <2 x bfloat> %287, i32 1
  %296 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271)
  %297 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272)
  %298 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273)
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
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
  %327 = fadd float %258, %311
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
  %343 = fadd float %204, %327
  %344 = fadd float %136, %328
  %345 = fadd float %137, %329
  %346 = fadd float %138, %330
  %347 = fadd float %139, %331
  %348 = fadd float %140, %332
  %349 = fadd float %141, %333
  %350 = fadd float %142, %334
  %351 = fadd float %143, %335
  %352 = fadd float %144, %336
  %353 = fadd float %145, %337
  %354 = fadd float %146, %338
  %355 = fadd float %147, %339
  %356 = fadd float %148, %340
  %357 = fadd float %149, %341
  %358 = fadd float %150, %342
  %359 = fadd float %151, %343
  %360 = fadd float %82, %344
  %361 = fadd float %83, %345
  %362 = fadd float %84, %346
  %363 = fadd float %85, %347
  %364 = fadd float %86, %348
  %365 = fadd float %87, %349
  %366 = fadd float %88, %350
  %367 = fadd float %89, %351
  %368 = fadd float %90, %352
  %369 = fadd float %91, %353
  %370 = fadd float %92, %354
  %371 = fadd float %93, %355
  %372 = fadd float %94, %356
  %373 = fadd float %95, %357
  %374 = fadd float %96, %358
  %375 = fadd float %97, %359
  %376 = fmul float %360, %360
  %377 = fmul float %361, %361
  %378 = fmul float %362, %362
  %379 = fmul float %363, %363
  %380 = fmul float %364, %364
  %381 = fmul float %365, %365
  %382 = fmul float %366, %366
  %383 = fmul float %367, %367
  %384 = fmul float %368, %368
  %385 = fmul float %369, %369
  %386 = fmul float %370, %370
  %387 = fmul float %371, %371
  %388 = fmul float %372, %372
  %389 = fmul float %373, %373
  %390 = fmul float %374, %374
  %391 = fmul float %375, %375
  %392 = fadd float %376, %377
  %393 = fadd float %392, %378
  %394 = fadd float %393, %379
  %395 = fadd float %394, %380
  %396 = fadd float %395, %381
  %397 = fadd float %396, %382
  %398 = fadd float %397, %383
  %399 = fadd float %398, %384
  %400 = fadd float %399, %385
  %401 = fadd float %400, %386
  %402 = fadd float %401, %387
  %403 = fadd float %402, %388
  %404 = fadd float %403, %389
  %405 = fadd float %404, %390
  %406 = fadd float %405, %391
  %407 = bitcast float %406 to i32
  %408 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %407, i32 16, i32 31)
  %409 = bitcast i32 %408 to float
  %410 = fadd float %406, %409
  %411 = bitcast float %410 to i32
  %412 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %411, i32 8, i32 31)
  %413 = bitcast i32 %412 to float
  %414 = fadd float %410, %413
  %415 = bitcast float %414 to i32
  %416 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %415, i32 4, i32 31)
  %417 = bitcast i32 %416 to float
  %418 = fadd float %414, %417
  %419 = bitcast float %418 to i32
  %420 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %419, i32 2, i32 31)
  %421 = bitcast i32 %420 to float
  %422 = fadd float %418, %421
  %423 = bitcast float %422 to i32
  %424 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %423, i32 1, i32 31)
  %425 = bitcast i32 %424 to float
  %426 = fadd float %422, %425
  %427 = urem i32 %14, 32
  %428 = urem i32 %15, 2
  %429 = icmp eq i32 %427, 0
  %430 = and i1 true, %429
  %431 = add i32 0, %428
  %432 = getelementptr float, ptr addrspace(3) @global_smem, i32 %431
  %433 = insertelement <1 x float> undef, float %426, i32 0
  %434 = extractelement <1 x float> %433, i32 0
  %435 = bitcast float %434 to i32
  %436 = insertelement <1 x i32> undef, i32 %435, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %432, <1 x i32> %436, i1 %430)
  call void @llvm.nvvm.barrier0()
  %437 = icmp slt i32 %13, 2
  %438 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %439 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %438, i1 %437)
  %440 = insertelement <1 x i32> undef, i32 %439, i32 0
  %441 = extractelement <1 x i32> %440, i32 0
  %442 = bitcast i32 %441 to float
  %443 = insertelement <1 x float> undef, float %442, i32 0
  %444 = extractelement <1 x float> %443, i32 0
  %445 = bitcast float %444 to i32
  %446 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %445, i32 1, i32 31)
  %447 = bitcast i32 %446 to float
  %448 = fadd float %444, %447
  %449 = urem i32 %14, 2
  %450 = icmp eq i32 %449, 0
  %451 = and i1 %437, %450
  %452 = insertelement <1 x float> undef, float %448, i32 0
  %453 = extractelement <1 x float> %452, i32 0
  %454 = bitcast float %453 to i32
  %455 = insertelement <1 x i32> undef, i32 %454, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %438, <1 x i32> %455, i1 %451)
  call void @llvm.nvvm.barrier0()
  %456 = load float, ptr addrspace(3) @global_smem, align 4
  %457 = fmul float %456, 0x3F50000000000000
  %458 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %459 = bitcast i32 %458 to <1 x float>
  %460 = extractelement <1 x float> %459, i32 0
  %461 = fadd float %457, %460
  %462 = call float @__nv_rsqrtf(float %461)
  %463 = fmul float %360, %462
  %464 = fmul float %361, %462
  %465 = fmul float %362, %462
  %466 = fmul float %363, %462
  %467 = fmul float %364, %462
  %468 = fmul float %365, %462
  %469 = fmul float %366, %462
  %470 = fmul float %367, %462
  %471 = fmul float %368, %462
  %472 = fmul float %369, %462
  %473 = fmul float %370, %462
  %474 = fmul float %371, %462
  %475 = fmul float %372, %462
  %476 = fmul float %373, %462
  %477 = fmul float %374, %462
  %478 = fmul float %375, %462
  %479 = getelementptr bfloat, ptr addrspace(1) %6, i64 %44
  %480 = getelementptr bfloat, ptr addrspace(1) %6, i64 %45
  %481 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %479)
  %482 = extractvalue { i32, i32, i32, i32 } %481, 0
  %483 = bitcast i32 %482 to <2 x bfloat>
  %484 = extractvalue { i32, i32, i32, i32 } %481, 1
  %485 = bitcast i32 %484 to <2 x bfloat>
  %486 = extractvalue { i32, i32, i32, i32 } %481, 2
  %487 = bitcast i32 %486 to <2 x bfloat>
  %488 = extractvalue { i32, i32, i32, i32 } %481, 3
  %489 = bitcast i32 %488 to <2 x bfloat>
  %490 = extractelement <2 x bfloat> %483, i32 0
  %491 = extractelement <2 x bfloat> %483, i32 1
  %492 = extractelement <2 x bfloat> %485, i32 0
  %493 = extractelement <2 x bfloat> %485, i32 1
  %494 = extractelement <2 x bfloat> %487, i32 0
  %495 = extractelement <2 x bfloat> %487, i32 1
  %496 = extractelement <2 x bfloat> %489, i32 0
  %497 = extractelement <2 x bfloat> %489, i32 1
  %498 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %480)
  %499 = extractvalue { i32, i32, i32, i32 } %498, 0
  %500 = bitcast i32 %499 to <2 x bfloat>
  %501 = extractvalue { i32, i32, i32, i32 } %498, 1
  %502 = bitcast i32 %501 to <2 x bfloat>
  %503 = extractvalue { i32, i32, i32, i32 } %498, 2
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractvalue { i32, i32, i32, i32 } %498, 3
  %506 = bitcast i32 %505 to <2 x bfloat>
  %507 = extractelement <2 x bfloat> %500, i32 0
  %508 = extractelement <2 x bfloat> %500, i32 1
  %509 = extractelement <2 x bfloat> %502, i32 0
  %510 = extractelement <2 x bfloat> %502, i32 1
  %511 = extractelement <2 x bfloat> %504, i32 0
  %512 = extractelement <2 x bfloat> %504, i32 1
  %513 = extractelement <2 x bfloat> %506, i32 0
  %514 = extractelement <2 x bfloat> %506, i32 1
  %515 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %490)
  %516 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %491)
  %517 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %492)
  %518 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %493)
  %519 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %494)
  %520 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %495)
  %521 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %496)
  %522 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %497)
  %523 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %524 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513)
  %530 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514)
  %531 = fmul float %463, %515
  %532 = fmul float %464, %516
  %533 = fmul float %465, %517
  %534 = fmul float %466, %518
  %535 = fmul float %467, %519
  %536 = fmul float %468, %520
  %537 = fmul float %469, %521
  %538 = fmul float %470, %522
  %539 = fmul float %471, %523
  %540 = fmul float %472, %524
  %541 = fmul float %473, %525
  %542 = fmul float %474, %526
  %543 = fmul float %475, %527
  %544 = fmul float %476, %528
  %545 = fmul float %477, %529
  %546 = fmul float %478, %530
  %547 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %531)
  %548 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %532)
  %549 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %533)
  %550 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %534)
  %551 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %535)
  %552 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %536)
  %553 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %537)
  %554 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %538)
  %555 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %539)
  %556 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %540)
  %557 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541)
  %558 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542)
  %559 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543)
  %560 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544)
  %561 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545)
  %562 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546)
  %563 = getelementptr bfloat, ptr addrspace(1) %7, i64 %11
  %564 = getelementptr bfloat, ptr addrspace(1) %563, i64 %44
  %565 = getelementptr bfloat, ptr addrspace(1) %563, i64 %45
  %566 = insertelement <2 x bfloat> undef, bfloat %547, i32 0
  %567 = insertelement <2 x bfloat> %566, bfloat %548, i32 1
  %568 = bitcast <2 x bfloat> %567 to i32
  %569 = insertelement <2 x bfloat> undef, bfloat %549, i32 0
  %570 = insertelement <2 x bfloat> %569, bfloat %550, i32 1
  %571 = bitcast <2 x bfloat> %570 to i32
  %572 = insertelement <2 x bfloat> undef, bfloat %551, i32 0
  %573 = insertelement <2 x bfloat> %572, bfloat %552, i32 1
  %574 = bitcast <2 x bfloat> %573 to i32
  %575 = insertelement <2 x bfloat> undef, bfloat %553, i32 0
  %576 = insertelement <2 x bfloat> %575, bfloat %554, i32 1
  %577 = bitcast <2 x bfloat> %576 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %568, i32 %571, i32 %574, i32 %577, ptr addrspace(1) %564)
  %578 = insertelement <2 x bfloat> undef, bfloat %555, i32 0
  %579 = insertelement <2 x bfloat> %578, bfloat %556, i32 1
  %580 = bitcast <2 x bfloat> %579 to i32
  %581 = insertelement <2 x bfloat> undef, bfloat %557, i32 0
  %582 = insertelement <2 x bfloat> %581, bfloat %558, i32 1
  %583 = bitcast <2 x bfloat> %582 to i32
  %584 = insertelement <2 x bfloat> undef, bfloat %559, i32 0
  %585 = insertelement <2 x bfloat> %584, bfloat %560, i32 1
  %586 = bitcast <2 x bfloat> %585 to i32
  %587 = insertelement <2 x bfloat> undef, bfloat %561, i32 0
  %588 = insertelement <2 x bfloat> %587, bfloat %562, i32 1
  %589 = bitcast <2 x bfloat> %588 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %580, i32 %583, i32 %586, i32 %589, ptr addrspace(1) %565)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(1048576) %0, ptr noalias align 128 dereferenceable(262144) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %5 = urem i32 %4, 8
  %6 = mul i32 %5, 128
  %7 = udiv i32 %4, 8
  %8 = mul i32 %7, 4096
  %9 = add i32 %6, %8
  %10 = add i32 %9, %3
  %11 = add i32 %10, 3072
  %12 = getelementptr inbounds bfloat, ptr %0, i32 %11
  %13 = load bfloat, ptr %12, align 2, !invariant.load !3
  %14 = mul i32 %4, 128
  %15 = add i32 %14, %3
  %16 = getelementptr inbounds bfloat, ptr %1, i32 %15
  store bfloat %13, ptr %16, align 2
  ret void
}

declare ptx_kernel void @triton_softmax_4_0_impl(ptr, ptr, ptr, ptr) #4

define ptx_kernel void @triton_softmax_4_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(1048576) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr null to ptr addrspace(1)
  %5 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %6 = sext i32 %5 to i64
  %7 = urem i64 %6, 2
  %8 = mul i64 %7, 512
  %9 = udiv i64 %6, 2
  %10 = mul i64 %9, 4096
  %11 = add i64 %8, %10
  %12 = add i64 %11, 2048
  %13 = getelementptr bfloat, ptr addrspace(1) %2, i64 %12
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
  %42 = add i32 %41, 0
  %43 = sext i32 %42 to i64
  %44 = getelementptr bfloat, ptr addrspace(1) %13, i64 %43
  %45 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %44)
  %46 = extractvalue { i32, i32, i32, i32 } %45, 0
  %47 = bitcast i32 %46 to <2 x bfloat>
  %48 = extractvalue { i32, i32, i32, i32 } %45, 1
  %49 = bitcast i32 %48 to <2 x bfloat>
  %50 = extractvalue { i32, i32, i32, i32 } %45, 2
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32, i32, i32 } %45, 3
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractelement <2 x bfloat> %47, i32 0
  %55 = extractelement <2 x bfloat> %47, i32 1
  %56 = extractelement <2 x bfloat> %49, i32 0
  %57 = extractelement <2 x bfloat> %49, i32 1
  %58 = extractelement <2 x bfloat> %51, i32 0
  %59 = extractelement <2 x bfloat> %51, i32 1
  %60 = extractelement <2 x bfloat> %53, i32 0
  %61 = extractelement <2 x bfloat> %53, i32 1
  %62 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54)
  %63 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %64 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %65 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %66 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %67 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %68 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %69 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %70 = fmul float %62, %62
  %71 = fmul float %63, %63
  %72 = fmul float %64, %64
  %73 = fmul float %65, %65
  %74 = fmul float %66, %66
  %75 = fmul float %67, %67
  %76 = fmul float %68, %68
  %77 = fmul float %69, %69
  %78 = fadd float %70, %71
  %79 = fadd float %78, %72
  %80 = fadd float %79, %73
  %81 = fadd float %80, %74
  %82 = fadd float %81, %75
  %83 = fadd float %82, %76
  %84 = fadd float %83, %77
  %85 = bitcast float %84 to i32
  %86 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %85, i32 8, i32 31)
  %87 = bitcast i32 %86 to float
  %88 = fadd float %84, %87
  %89 = bitcast float %88 to i32
  %90 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %89, i32 4, i32 31)
  %91 = bitcast i32 %90 to float
  %92 = fadd float %88, %91
  %93 = bitcast float %92 to i32
  %94 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %93, i32 2, i32 31)
  %95 = bitcast i32 %94 to float
  %96 = fadd float %92, %95
  %97 = bitcast float %96 to i32
  %98 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %97, i32 1, i32 31)
  %99 = bitcast i32 %98 to float
  %100 = fadd float %96, %99
  %101 = fmul float %100, 7.812500e-03
  %102 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %103 = bitcast i32 %102 to <1 x float>
  %104 = extractelement <1 x float> %103, i32 0
  %105 = fadd float %101, %104
  %106 = call float @__nv_rsqrtf(float %105)
  %107 = fmul float %62, %106
  %108 = fmul float %63, %106
  %109 = fmul float %64, %106
  %110 = fmul float %65, %106
  %111 = fmul float %66, %106
  %112 = fmul float %67, %106
  %113 = fmul float %68, %106
  %114 = fmul float %69, %106
  %115 = mul i64 %6, 512
  %116 = getelementptr float, ptr addrspace(1) %3, i64 %115
  %117 = select i1 %38, i32 0, i32 1
  %118 = xor i32 0, %117
  %119 = xor i32 %118, 0
  %120 = xor i32 %118, 2
  %121 = add i32 %119, 0
  %122 = add i32 %120, 0
  %123 = sext i32 %121 to i64
  %124 = sext i32 %122 to i64
  %125 = mul i64 %123, 128
  %126 = mul i64 %124, 128
  %127 = select i1 %18, i32 0, i32 4
  %128 = xor i32 0, %127
  %129 = select i1 %22, i32 0, i32 8
  %130 = xor i32 %128, %129
  %131 = select i1 %26, i32 0, i32 16
  %132 = xor i32 %130, %131
  %133 = select i1 %30, i32 0, i32 32
  %134 = xor i32 %132, %133
  %135 = select i1 %34, i32 0, i32 64
  %136 = xor i32 %134, %135
  %137 = xor i32 %136, 0
  %138 = add i32 %137, 0
  %139 = sext i32 %138 to i64
  %140 = add i64 %125, %139
  %141 = add i64 %126, %139
  %142 = getelementptr float, ptr addrspace(1) %116, i64 %140
  %143 = getelementptr float, ptr addrspace(1) %116, i64 %141
  %144 = select i1 %38, i32 0, i32 128
  %145 = xor i32 %136, %144
  %146 = lshr i32 %41, 7
  %147 = shl i32 %146, 3
  %148 = add i32 %147, %41
  %149 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %148
  %150 = insertelement <8 x float> undef, float %107, i32 0
  %151 = insertelement <8 x float> %150, float %108, i32 1
  %152 = insertelement <8 x float> %151, float %109, i32 2
  %153 = insertelement <8 x float> %152, float %110, i32 3
  %154 = insertelement <8 x float> %153, float %111, i32 4
  %155 = insertelement <8 x float> %154, float %112, i32 5
  %156 = insertelement <8 x float> %155, float %113, i32 6
  %157 = insertelement <8 x float> %156, float %114, i32 7
  %158 = extractelement <8 x float> %157, i32 0
  %159 = extractelement <8 x float> %157, i32 1
  %160 = extractelement <8 x float> %157, i32 2
  %161 = extractelement <8 x float> %157, i32 3
  %162 = extractelement <8 x float> %157, i32 4
  %163 = extractelement <8 x float> %157, i32 5
  %164 = extractelement <8 x float> %157, i32 6
  %165 = extractelement <8 x float> %157, i32 7
  %166 = bitcast float %158 to i32
  %167 = bitcast float %159 to i32
  %168 = bitcast float %160 to i32
  %169 = bitcast float %161 to i32
  %170 = bitcast float %162 to i32
  %171 = bitcast float %163 to i32
  %172 = bitcast float %164 to i32
  %173 = bitcast float %165 to i32
  %174 = insertelement <8 x i32> undef, i32 %166, i32 0
  %175 = insertelement <8 x i32> %174, i32 %167, i32 1
  %176 = insertelement <8 x i32> %175, i32 %168, i32 2
  %177 = insertelement <8 x i32> %176, i32 %169, i32 3
  %178 = insertelement <8 x i32> %177, i32 %170, i32 4
  %179 = insertelement <8 x i32> %178, i32 %171, i32 5
  %180 = insertelement <8 x i32> %179, i32 %172, i32 6
  %181 = insertelement <8 x i32> %180, i32 %173, i32 7
  %182 = extractelement <8 x i32> %181, i32 0
  %183 = extractelement <8 x i32> %181, i32 1
  %184 = extractelement <8 x i32> %181, i32 2
  %185 = extractelement <8 x i32> %181, i32 3
  %186 = extractelement <8 x i32> %181, i32 4
  %187 = extractelement <8 x i32> %181, i32 5
  %188 = extractelement <8 x i32> %181, i32 6
  %189 = extractelement <8 x i32> %181, i32 7
  %190 = insertelement <4 x i32> undef, i32 %182, i32 0
  %191 = insertelement <4 x i32> %190, i32 %183, i32 1
  %192 = insertelement <4 x i32> %191, i32 %184, i32 2
  %193 = insertelement <4 x i32> %192, i32 %185, i32 3
  %194 = extractelement <4 x i32> %193, i32 0
  %195 = extractelement <4 x i32> %193, i32 1
  %196 = extractelement <4 x i32> %193, i32 2
  %197 = extractelement <4 x i32> %193, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %149, i32 %194, i32 %195, i32 %196, i32 %197, i1 true)
  %198 = getelementptr inbounds i32, ptr addrspace(3) %149, i32 4
  %199 = insertelement <4 x i32> undef, i32 %186, i32 0
  %200 = insertelement <4 x i32> %199, i32 %187, i32 1
  %201 = insertelement <4 x i32> %200, i32 %188, i32 2
  %202 = insertelement <4 x i32> %201, i32 %189, i32 3
  %203 = extractelement <4 x i32> %202, i32 0
  %204 = extractelement <4 x i32> %202, i32 1
  %205 = extractelement <4 x i32> %202, i32 2
  %206 = extractelement <4 x i32> %202, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %198, i32 %203, i32 %204, i32 %205, i32 %206, i1 true)
  call void @llvm.nvvm.barrier0()
  %207 = xor i32 %145, 0
  %208 = lshr i32 %207, 7
  %209 = shl i32 %208, 3
  %210 = add i32 %209, %207
  %211 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %210
  %212 = load <4 x i32>, ptr addrspace(3) %211, align 16
  %213 = extractelement <4 x i32> %212, i32 0
  %214 = extractelement <4 x i32> %212, i32 1
  %215 = extractelement <4 x i32> %212, i32 2
  %216 = extractelement <4 x i32> %212, i32 3
  %217 = insertelement <4 x i32> undef, i32 %213, i32 0
  %218 = insertelement <4 x i32> %217, i32 %214, i32 1
  %219 = insertelement <4 x i32> %218, i32 %215, i32 2
  %220 = insertelement <4 x i32> %219, i32 %216, i32 3
  %221 = extractelement <4 x i32> %220, i32 0
  %222 = extractelement <4 x i32> %220, i32 1
  %223 = extractelement <4 x i32> %220, i32 2
  %224 = extractelement <4 x i32> %220, i32 3
  %225 = bitcast i32 %221 to float
  %226 = bitcast i32 %222 to float
  %227 = bitcast i32 %223 to float
  %228 = bitcast i32 %224 to float
  %229 = insertelement <4 x float> undef, float %225, i32 0
  %230 = insertelement <4 x float> %229, float %226, i32 1
  %231 = insertelement <4 x float> %230, float %227, i32 2
  %232 = insertelement <4 x float> %231, float %228, i32 3
  %233 = extractelement <4 x float> %232, i32 0
  %234 = extractelement <4 x float> %232, i32 1
  %235 = extractelement <4 x float> %232, i32 2
  %236 = extractelement <4 x float> %232, i32 3
  %237 = xor i32 %145, 256
  %238 = lshr i32 %237, 7
  %239 = shl i32 %238, 3
  %240 = add i32 %239, %237
  %241 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %240
  %242 = load <4 x i32>, ptr addrspace(3) %241, align 16
  %243 = extractelement <4 x i32> %242, i32 0
  %244 = extractelement <4 x i32> %242, i32 1
  %245 = extractelement <4 x i32> %242, i32 2
  %246 = extractelement <4 x i32> %242, i32 3
  %247 = insertelement <4 x i32> undef, i32 %243, i32 0
  %248 = insertelement <4 x i32> %247, i32 %244, i32 1
  %249 = insertelement <4 x i32> %248, i32 %245, i32 2
  %250 = insertelement <4 x i32> %249, i32 %246, i32 3
  %251 = extractelement <4 x i32> %250, i32 0
  %252 = extractelement <4 x i32> %250, i32 1
  %253 = extractelement <4 x i32> %250, i32 2
  %254 = extractelement <4 x i32> %250, i32 3
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = insertelement <4 x float> undef, float %255, i32 0
  %260 = insertelement <4 x float> %259, float %256, i32 1
  %261 = insertelement <4 x float> %260, float %257, i32 2
  %262 = insertelement <4 x float> %261, float %258, i32 3
  %263 = extractelement <4 x float> %262, i32 0
  %264 = extractelement <4 x float> %262, i32 1
  %265 = extractelement <4 x float> %262, i32 2
  %266 = extractelement <4 x float> %262, i32 3
  %267 = insertelement <1 x float> undef, float %233, i32 0
  %268 = bitcast <1 x float> %267 to i32
  %269 = insertelement <1 x float> undef, float %234, i32 0
  %270 = bitcast <1 x float> %269 to i32
  %271 = insertelement <1 x float> undef, float %235, i32 0
  %272 = bitcast <1 x float> %271 to i32
  %273 = insertelement <1 x float> undef, float %236, i32 0
  %274 = bitcast <1 x float> %273 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %268, i32 %270, i32 %272, i32 %274, ptr addrspace(1) %142)
  %275 = insertelement <1 x float> undef, float %263, i32 0
  %276 = bitcast <1 x float> %275 to i32
  %277 = insertelement <1 x float> undef, float %264, i32 0
  %278 = bitcast <1 x float> %277 to i32
  %279 = insertelement <1 x float> undef, float %265, i32 0
  %280 = bitcast <1 x float> %279 to i32
  %281 = insertelement <1 x float> undef, float %266, i32 0
  %282 = bitcast <1 x float> %281 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %276, i32 %278, i32 %280, i32 %282, ptr addrspace(1) %143)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(524288) %0, ptr noalias align 16 dereferenceable(256) %1, ptr noalias align 16 dereferenceable(10485760) %2, ptr noalias align 16 dereferenceable(512) %3, ptr noalias align 128 dereferenceable(262144) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %8 = udiv i32 %7, 4
  %9 = urem i32 %6, 64
  %10 = udiv i32 %6, 64
  %11 = mul i32 %10, 128
  %12 = mul i32 %7, 256
  %13 = add i32 %11, %12
  %14 = add i32 %13, %9
  %15 = getelementptr inbounds float, ptr %0, i32 %14
  %16 = load float, ptr %15, align 4, !invariant.load !3
  %17 = getelementptr inbounds bfloat, ptr %1, i32 %9
  %18 = load bfloat, ptr %17, align 2, !invariant.load !3
  %19 = fpext bfloat %18 to float
  %20 = fmul float %16, %19
  %21 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_197_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_197_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = getelementptr inbounds i32, ptr %3, i32 %4
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  %9 = call i32 @llvm.smin.i32(i32 %8, i32 40959)
  %10 = call i32 @llvm.smax.i32(i32 %9, i32 0)
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %5
  %13 = getelementptr inbounds bfloat, ptr %2, i32 %12
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = fpext bfloat %14 to float
  ret float %15
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

define ptx_kernel void @loop_slice_fusion(ptr noalias align 16 dereferenceable(277413888) %0, ptr noalias align 128 dereferenceable(138706944) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %5 = mul i32 %3, 4
  %6 = mul i32 %4, 512
  %7 = add i32 %5, %6
  %8 = add i32 %7, 69353472
  %9 = getelementptr inbounds bfloat, ptr %0, i32 %8
  %10 = load <4 x bfloat>, ptr %9, align 8, !invariant.load !3
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %5 = mul i32 %3, 4
  %6 = mul i32 %4, 512
  %7 = add i32 %5, %6
  %8 = getelementptr inbounds bfloat, ptr %0, i32 %7
  %9 = load <4 x bfloat>, ptr %8, align 8, !invariant.load !3
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

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 128}
!2 = !{i32 0, i32 1024}
!3 = !{}
!4 = !{i32 0, i32 768}
!5 = !{i32 0, i32 512}
!6 = !{i32 0, i32 135456}

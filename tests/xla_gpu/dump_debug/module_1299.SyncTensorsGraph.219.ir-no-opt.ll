; ModuleID = 'SyncTensorsGraph.219'
source_filename = "SyncTensorsGraph.219"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(128) %1, ptr noalias align 128 dereferenceable(65536) %2) #0 {
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

declare ptx_kernel void @gemm_fusion_dot_29_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_29_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 16
  %6 = mul i32 %5, 8
  %7 = sub i32 32, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 16
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %11, 32
  %15 = sext i32 %14 to i64
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = udiv i32 %16, 32
  %18 = and i32 %17, 2
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 1
  %21 = xor i32 0, %20
  %22 = xor i32 %21, 0
  %23 = xor i32 %21, 2
  %24 = xor i32 %21, 4
  %25 = xor i32 %21, 6
  %26 = xor i32 %21, 8
  %27 = xor i32 %21, 10
  %28 = xor i32 %21, 12
  %29 = xor i32 %21, 14
  %30 = xor i32 %21, 16
  %31 = xor i32 %21, 18
  %32 = xor i32 %21, 20
  %33 = xor i32 %21, 22
  %34 = xor i32 %21, 24
  %35 = xor i32 %21, 26
  %36 = xor i32 %21, 28
  %37 = xor i32 %21, 30
  %38 = add i32 %22, 0
  %39 = add i32 %23, 0
  %40 = add i32 %24, 0
  %41 = add i32 %25, 0
  %42 = add i32 %26, 0
  %43 = add i32 %27, 0
  %44 = add i32 %28, 0
  %45 = add i32 %29, 0
  %46 = add i32 %30, 0
  %47 = add i32 %31, 0
  %48 = add i32 %32, 0
  %49 = add i32 %33, 0
  %50 = add i32 %34, 0
  %51 = add i32 %35, 0
  %52 = add i32 %36, 0
  %53 = add i32 %37, 0
  %54 = sext i32 %38 to i64
  %55 = sext i32 %39 to i64
  %56 = sext i32 %40 to i64
  %57 = sext i32 %41 to i64
  %58 = sext i32 %42 to i64
  %59 = sext i32 %43 to i64
  %60 = sext i32 %44 to i64
  %61 = sext i32 %45 to i64
  %62 = sext i32 %46 to i64
  %63 = sext i32 %47 to i64
  %64 = sext i32 %48 to i64
  %65 = sext i32 %49 to i64
  %66 = sext i32 %50 to i64
  %67 = sext i32 %51 to i64
  %68 = sext i32 %52 to i64
  %69 = sext i32 %53 to i64
  %70 = add i64 %15, %54
  %71 = add i64 %15, %55
  %72 = add i64 %15, %56
  %73 = add i64 %15, %57
  %74 = add i64 %15, %58
  %75 = add i64 %15, %59
  %76 = add i64 %15, %60
  %77 = add i64 %15, %61
  %78 = add i64 %15, %62
  %79 = add i64 %15, %63
  %80 = add i64 %15, %64
  %81 = add i64 %15, %65
  %82 = add i64 %15, %66
  %83 = add i64 %15, %67
  %84 = add i64 %15, %68
  %85 = add i64 %15, %69
  %86 = mul i64 %70, 2048
  %87 = mul i64 %71, 2048
  %88 = mul i64 %72, 2048
  %89 = mul i64 %73, 2048
  %90 = mul i64 %74, 2048
  %91 = mul i64 %75, 2048
  %92 = mul i64 %76, 2048
  %93 = mul i64 %77, 2048
  %94 = mul i64 %78, 2048
  %95 = mul i64 %79, 2048
  %96 = mul i64 %80, 2048
  %97 = mul i64 %81, 2048
  %98 = mul i64 %82, 2048
  %99 = mul i64 %83, 2048
  %100 = mul i64 %84, 2048
  %101 = mul i64 %85, 2048
  %102 = urem i32 %16, 32
  %103 = and i32 %102, 1
  %104 = icmp eq i32 %103, 0
  %105 = select i1 %104, i32 0, i32 8
  %106 = xor i32 0, %105
  %107 = and i32 %102, 2
  %108 = icmp eq i32 %107, 0
  %109 = select i1 %108, i32 0, i32 16
  %110 = xor i32 %106, %109
  %111 = and i32 %102, 4
  %112 = icmp eq i32 %111, 0
  %113 = select i1 %112, i32 0, i32 32
  %114 = xor i32 %110, %113
  %115 = and i32 %102, 8
  %116 = icmp eq i32 %115, 0
  %117 = select i1 %116, i32 0, i32 64
  %118 = xor i32 %114, %117
  %119 = and i32 %102, 16
  %120 = icmp eq i32 %119, 0
  %121 = select i1 %120, i32 0, i32 128
  %122 = xor i32 %118, %121
  %123 = and i32 %17, 1
  %124 = icmp eq i32 %123, 0
  %125 = select i1 %124, i32 0, i32 256
  %126 = xor i32 %122, %125
  %127 = xor i32 %126, 0
  %128 = add i32 %127, 0
  %129 = sext i32 %128 to i64
  br label %130

130:                                              ; preds = %135, %0
  %131 = phi i32 [ %2051, %135 ], [ 0, %0 ]
  %132 = phi i64 [ %692, %135 ], [ 0, %0 ]
  %133 = phi { float, float, float, float } [ %2050, %135 ], [ zeroinitializer, %0 ]
  %134 = icmp slt i32 %131, 2048
  br i1 %134, label %135, label %2052

135:                                              ; preds = %130
  %136 = add i64 %132, %129
  %137 = add i64 %86, %136
  %138 = add i64 %87, %136
  %139 = add i64 %88, %136
  %140 = add i64 %89, %136
  %141 = add i64 %90, %136
  %142 = add i64 %91, %136
  %143 = add i64 %92, %136
  %144 = add i64 %93, %136
  %145 = add i64 %94, %136
  %146 = add i64 %95, %136
  %147 = add i64 %96, %136
  %148 = add i64 %97, %136
  %149 = add i64 %98, %136
  %150 = add i64 %99, %136
  %151 = add i64 %100, %136
  %152 = add i64 %101, %136
  %153 = getelementptr bfloat, ptr addrspace(1) %1, i64 %137
  %154 = getelementptr bfloat, ptr addrspace(1) %1, i64 %138
  %155 = getelementptr bfloat, ptr addrspace(1) %1, i64 %139
  %156 = getelementptr bfloat, ptr addrspace(1) %1, i64 %140
  %157 = getelementptr bfloat, ptr addrspace(1) %1, i64 %141
  %158 = getelementptr bfloat, ptr addrspace(1) %1, i64 %142
  %159 = getelementptr bfloat, ptr addrspace(1) %1, i64 %143
  %160 = getelementptr bfloat, ptr addrspace(1) %1, i64 %144
  %161 = getelementptr bfloat, ptr addrspace(1) %1, i64 %145
  %162 = getelementptr bfloat, ptr addrspace(1) %1, i64 %146
  %163 = getelementptr bfloat, ptr addrspace(1) %1, i64 %147
  %164 = getelementptr bfloat, ptr addrspace(1) %1, i64 %148
  %165 = getelementptr bfloat, ptr addrspace(1) %1, i64 %149
  %166 = getelementptr bfloat, ptr addrspace(1) %1, i64 %150
  %167 = getelementptr bfloat, ptr addrspace(1) %1, i64 %151
  %168 = getelementptr bfloat, ptr addrspace(1) %1, i64 %152
  %169 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153)
  %170 = extractvalue { i32, i32, i32, i32 } %169, 0
  %171 = bitcast i32 %170 to <2 x bfloat>
  %172 = extractvalue { i32, i32, i32, i32 } %169, 1
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %169, 2
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %169, 3
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractelement <2 x bfloat> %171, i32 0
  %179 = extractelement <2 x bfloat> %171, i32 1
  %180 = extractelement <2 x bfloat> %173, i32 0
  %181 = extractelement <2 x bfloat> %173, i32 1
  %182 = extractelement <2 x bfloat> %175, i32 0
  %183 = extractelement <2 x bfloat> %175, i32 1
  %184 = extractelement <2 x bfloat> %177, i32 0
  %185 = extractelement <2 x bfloat> %177, i32 1
  %186 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %154)
  %187 = extractvalue { i32, i32, i32, i32 } %186, 0
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractvalue { i32, i32, i32, i32 } %186, 1
  %190 = bitcast i32 %189 to <2 x bfloat>
  %191 = extractvalue { i32, i32, i32, i32 } %186, 2
  %192 = bitcast i32 %191 to <2 x bfloat>
  %193 = extractvalue { i32, i32, i32, i32 } %186, 3
  %194 = bitcast i32 %193 to <2 x bfloat>
  %195 = extractelement <2 x bfloat> %188, i32 0
  %196 = extractelement <2 x bfloat> %188, i32 1
  %197 = extractelement <2 x bfloat> %190, i32 0
  %198 = extractelement <2 x bfloat> %190, i32 1
  %199 = extractelement <2 x bfloat> %192, i32 0
  %200 = extractelement <2 x bfloat> %192, i32 1
  %201 = extractelement <2 x bfloat> %194, i32 0
  %202 = extractelement <2 x bfloat> %194, i32 1
  %203 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %155)
  %204 = extractvalue { i32, i32, i32, i32 } %203, 0
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractvalue { i32, i32, i32, i32 } %203, 1
  %207 = bitcast i32 %206 to <2 x bfloat>
  %208 = extractvalue { i32, i32, i32, i32 } %203, 2
  %209 = bitcast i32 %208 to <2 x bfloat>
  %210 = extractvalue { i32, i32, i32, i32 } %203, 3
  %211 = bitcast i32 %210 to <2 x bfloat>
  %212 = extractelement <2 x bfloat> %205, i32 0
  %213 = extractelement <2 x bfloat> %205, i32 1
  %214 = extractelement <2 x bfloat> %207, i32 0
  %215 = extractelement <2 x bfloat> %207, i32 1
  %216 = extractelement <2 x bfloat> %209, i32 0
  %217 = extractelement <2 x bfloat> %209, i32 1
  %218 = extractelement <2 x bfloat> %211, i32 0
  %219 = extractelement <2 x bfloat> %211, i32 1
  %220 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %156)
  %221 = extractvalue { i32, i32, i32, i32 } %220, 0
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractvalue { i32, i32, i32, i32 } %220, 1
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractvalue { i32, i32, i32, i32 } %220, 2
  %226 = bitcast i32 %225 to <2 x bfloat>
  %227 = extractvalue { i32, i32, i32, i32 } %220, 3
  %228 = bitcast i32 %227 to <2 x bfloat>
  %229 = extractelement <2 x bfloat> %222, i32 0
  %230 = extractelement <2 x bfloat> %222, i32 1
  %231 = extractelement <2 x bfloat> %224, i32 0
  %232 = extractelement <2 x bfloat> %224, i32 1
  %233 = extractelement <2 x bfloat> %226, i32 0
  %234 = extractelement <2 x bfloat> %226, i32 1
  %235 = extractelement <2 x bfloat> %228, i32 0
  %236 = extractelement <2 x bfloat> %228, i32 1
  %237 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %157)
  %238 = extractvalue { i32, i32, i32, i32 } %237, 0
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %237, 1
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractvalue { i32, i32, i32, i32 } %237, 2
  %243 = bitcast i32 %242 to <2 x bfloat>
  %244 = extractvalue { i32, i32, i32, i32 } %237, 3
  %245 = bitcast i32 %244 to <2 x bfloat>
  %246 = extractelement <2 x bfloat> %239, i32 0
  %247 = extractelement <2 x bfloat> %239, i32 1
  %248 = extractelement <2 x bfloat> %241, i32 0
  %249 = extractelement <2 x bfloat> %241, i32 1
  %250 = extractelement <2 x bfloat> %243, i32 0
  %251 = extractelement <2 x bfloat> %243, i32 1
  %252 = extractelement <2 x bfloat> %245, i32 0
  %253 = extractelement <2 x bfloat> %245, i32 1
  %254 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %158)
  %255 = extractvalue { i32, i32, i32, i32 } %254, 0
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractvalue { i32, i32, i32, i32 } %254, 1
  %258 = bitcast i32 %257 to <2 x bfloat>
  %259 = extractvalue { i32, i32, i32, i32 } %254, 2
  %260 = bitcast i32 %259 to <2 x bfloat>
  %261 = extractvalue { i32, i32, i32, i32 } %254, 3
  %262 = bitcast i32 %261 to <2 x bfloat>
  %263 = extractelement <2 x bfloat> %256, i32 0
  %264 = extractelement <2 x bfloat> %256, i32 1
  %265 = extractelement <2 x bfloat> %258, i32 0
  %266 = extractelement <2 x bfloat> %258, i32 1
  %267 = extractelement <2 x bfloat> %260, i32 0
  %268 = extractelement <2 x bfloat> %260, i32 1
  %269 = extractelement <2 x bfloat> %262, i32 0
  %270 = extractelement <2 x bfloat> %262, i32 1
  %271 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %159)
  %272 = extractvalue { i32, i32, i32, i32 } %271, 0
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = extractvalue { i32, i32, i32, i32 } %271, 1
  %275 = bitcast i32 %274 to <2 x bfloat>
  %276 = extractvalue { i32, i32, i32, i32 } %271, 2
  %277 = bitcast i32 %276 to <2 x bfloat>
  %278 = extractvalue { i32, i32, i32, i32 } %271, 3
  %279 = bitcast i32 %278 to <2 x bfloat>
  %280 = extractelement <2 x bfloat> %273, i32 0
  %281 = extractelement <2 x bfloat> %273, i32 1
  %282 = extractelement <2 x bfloat> %275, i32 0
  %283 = extractelement <2 x bfloat> %275, i32 1
  %284 = extractelement <2 x bfloat> %277, i32 0
  %285 = extractelement <2 x bfloat> %277, i32 1
  %286 = extractelement <2 x bfloat> %279, i32 0
  %287 = extractelement <2 x bfloat> %279, i32 1
  %288 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %289 = extractvalue { i32, i32, i32, i32 } %288, 0
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %288, 1
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %288, 2
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractvalue { i32, i32, i32, i32 } %288, 3
  %296 = bitcast i32 %295 to <2 x bfloat>
  %297 = extractelement <2 x bfloat> %290, i32 0
  %298 = extractelement <2 x bfloat> %290, i32 1
  %299 = extractelement <2 x bfloat> %292, i32 0
  %300 = extractelement <2 x bfloat> %292, i32 1
  %301 = extractelement <2 x bfloat> %294, i32 0
  %302 = extractelement <2 x bfloat> %294, i32 1
  %303 = extractelement <2 x bfloat> %296, i32 0
  %304 = extractelement <2 x bfloat> %296, i32 1
  %305 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %306 = extractvalue { i32, i32, i32, i32 } %305, 0
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %305, 1
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %305, 2
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractvalue { i32, i32, i32, i32 } %305, 3
  %313 = bitcast i32 %312 to <2 x bfloat>
  %314 = extractelement <2 x bfloat> %307, i32 0
  %315 = extractelement <2 x bfloat> %307, i32 1
  %316 = extractelement <2 x bfloat> %309, i32 0
  %317 = extractelement <2 x bfloat> %309, i32 1
  %318 = extractelement <2 x bfloat> %311, i32 0
  %319 = extractelement <2 x bfloat> %311, i32 1
  %320 = extractelement <2 x bfloat> %313, i32 0
  %321 = extractelement <2 x bfloat> %313, i32 1
  %322 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %323 = extractvalue { i32, i32, i32, i32 } %322, 0
  %324 = bitcast i32 %323 to <2 x bfloat>
  %325 = extractvalue { i32, i32, i32, i32 } %322, 1
  %326 = bitcast i32 %325 to <2 x bfloat>
  %327 = extractvalue { i32, i32, i32, i32 } %322, 2
  %328 = bitcast i32 %327 to <2 x bfloat>
  %329 = extractvalue { i32, i32, i32, i32 } %322, 3
  %330 = bitcast i32 %329 to <2 x bfloat>
  %331 = extractelement <2 x bfloat> %324, i32 0
  %332 = extractelement <2 x bfloat> %324, i32 1
  %333 = extractelement <2 x bfloat> %326, i32 0
  %334 = extractelement <2 x bfloat> %326, i32 1
  %335 = extractelement <2 x bfloat> %328, i32 0
  %336 = extractelement <2 x bfloat> %328, i32 1
  %337 = extractelement <2 x bfloat> %330, i32 0
  %338 = extractelement <2 x bfloat> %330, i32 1
  %339 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %163)
  %340 = extractvalue { i32, i32, i32, i32 } %339, 0
  %341 = bitcast i32 %340 to <2 x bfloat>
  %342 = extractvalue { i32, i32, i32, i32 } %339, 1
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32, i32, i32 } %339, 2
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractvalue { i32, i32, i32, i32 } %339, 3
  %347 = bitcast i32 %346 to <2 x bfloat>
  %348 = extractelement <2 x bfloat> %341, i32 0
  %349 = extractelement <2 x bfloat> %341, i32 1
  %350 = extractelement <2 x bfloat> %343, i32 0
  %351 = extractelement <2 x bfloat> %343, i32 1
  %352 = extractelement <2 x bfloat> %345, i32 0
  %353 = extractelement <2 x bfloat> %345, i32 1
  %354 = extractelement <2 x bfloat> %347, i32 0
  %355 = extractelement <2 x bfloat> %347, i32 1
  %356 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %164)
  %357 = extractvalue { i32, i32, i32, i32 } %356, 0
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %356, 1
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractvalue { i32, i32, i32, i32 } %356, 2
  %362 = bitcast i32 %361 to <2 x bfloat>
  %363 = extractvalue { i32, i32, i32, i32 } %356, 3
  %364 = bitcast i32 %363 to <2 x bfloat>
  %365 = extractelement <2 x bfloat> %358, i32 0
  %366 = extractelement <2 x bfloat> %358, i32 1
  %367 = extractelement <2 x bfloat> %360, i32 0
  %368 = extractelement <2 x bfloat> %360, i32 1
  %369 = extractelement <2 x bfloat> %362, i32 0
  %370 = extractelement <2 x bfloat> %362, i32 1
  %371 = extractelement <2 x bfloat> %364, i32 0
  %372 = extractelement <2 x bfloat> %364, i32 1
  %373 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %165)
  %374 = extractvalue { i32, i32, i32, i32 } %373, 0
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %373, 1
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractvalue { i32, i32, i32, i32 } %373, 2
  %379 = bitcast i32 %378 to <2 x bfloat>
  %380 = extractvalue { i32, i32, i32, i32 } %373, 3
  %381 = bitcast i32 %380 to <2 x bfloat>
  %382 = extractelement <2 x bfloat> %375, i32 0
  %383 = extractelement <2 x bfloat> %375, i32 1
  %384 = extractelement <2 x bfloat> %377, i32 0
  %385 = extractelement <2 x bfloat> %377, i32 1
  %386 = extractelement <2 x bfloat> %379, i32 0
  %387 = extractelement <2 x bfloat> %379, i32 1
  %388 = extractelement <2 x bfloat> %381, i32 0
  %389 = extractelement <2 x bfloat> %381, i32 1
  %390 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %166)
  %391 = extractvalue { i32, i32, i32, i32 } %390, 0
  %392 = bitcast i32 %391 to <2 x bfloat>
  %393 = extractvalue { i32, i32, i32, i32 } %390, 1
  %394 = bitcast i32 %393 to <2 x bfloat>
  %395 = extractvalue { i32, i32, i32, i32 } %390, 2
  %396 = bitcast i32 %395 to <2 x bfloat>
  %397 = extractvalue { i32, i32, i32, i32 } %390, 3
  %398 = bitcast i32 %397 to <2 x bfloat>
  %399 = extractelement <2 x bfloat> %392, i32 0
  %400 = extractelement <2 x bfloat> %392, i32 1
  %401 = extractelement <2 x bfloat> %394, i32 0
  %402 = extractelement <2 x bfloat> %394, i32 1
  %403 = extractelement <2 x bfloat> %396, i32 0
  %404 = extractelement <2 x bfloat> %396, i32 1
  %405 = extractelement <2 x bfloat> %398, i32 0
  %406 = extractelement <2 x bfloat> %398, i32 1
  %407 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %167)
  %408 = extractvalue { i32, i32, i32, i32 } %407, 0
  %409 = bitcast i32 %408 to <2 x bfloat>
  %410 = extractvalue { i32, i32, i32, i32 } %407, 1
  %411 = bitcast i32 %410 to <2 x bfloat>
  %412 = extractvalue { i32, i32, i32, i32 } %407, 2
  %413 = bitcast i32 %412 to <2 x bfloat>
  %414 = extractvalue { i32, i32, i32, i32 } %407, 3
  %415 = bitcast i32 %414 to <2 x bfloat>
  %416 = extractelement <2 x bfloat> %409, i32 0
  %417 = extractelement <2 x bfloat> %409, i32 1
  %418 = extractelement <2 x bfloat> %411, i32 0
  %419 = extractelement <2 x bfloat> %411, i32 1
  %420 = extractelement <2 x bfloat> %413, i32 0
  %421 = extractelement <2 x bfloat> %413, i32 1
  %422 = extractelement <2 x bfloat> %415, i32 0
  %423 = extractelement <2 x bfloat> %415, i32 1
  %424 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %168)
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
  call void @llvm.nvvm.barrier0()
  %441 = select i1 %19, i32 0, i32 520
  %442 = xor i32 %126, %441
  %443 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %442
  %444 = insertelement <8 x bfloat> undef, bfloat %178, i32 0
  %445 = insertelement <8 x bfloat> %444, bfloat %179, i32 1
  %446 = insertelement <8 x bfloat> %445, bfloat %180, i32 2
  %447 = insertelement <8 x bfloat> %446, bfloat %181, i32 3
  %448 = insertelement <8 x bfloat> %447, bfloat %182, i32 4
  %449 = insertelement <8 x bfloat> %448, bfloat %183, i32 5
  %450 = insertelement <8 x bfloat> %449, bfloat %184, i32 6
  %451 = insertelement <8 x bfloat> %450, bfloat %185, i32 7
  store <8 x bfloat> %451, ptr addrspace(3) %443, align 16
  %452 = xor i32 1040, %105
  %453 = xor i32 %452, %109
  %454 = xor i32 %453, %113
  %455 = xor i32 %454, %117
  %456 = xor i32 %455, %121
  %457 = xor i32 %456, %125
  %458 = xor i32 %457, %441
  %459 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %458
  %460 = insertelement <8 x bfloat> undef, bfloat %195, i32 0
  %461 = insertelement <8 x bfloat> %460, bfloat %196, i32 1
  %462 = insertelement <8 x bfloat> %461, bfloat %197, i32 2
  %463 = insertelement <8 x bfloat> %462, bfloat %198, i32 3
  %464 = insertelement <8 x bfloat> %463, bfloat %199, i32 4
  %465 = insertelement <8 x bfloat> %464, bfloat %200, i32 5
  %466 = insertelement <8 x bfloat> %465, bfloat %201, i32 6
  %467 = insertelement <8 x bfloat> %466, bfloat %202, i32 7
  store <8 x bfloat> %467, ptr addrspace(3) %459, align 16
  %468 = xor i32 2080, %105
  %469 = xor i32 %468, %109
  %470 = xor i32 %469, %113
  %471 = xor i32 %470, %117
  %472 = xor i32 %471, %121
  %473 = xor i32 %472, %125
  %474 = xor i32 %473, %441
  %475 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %474
  %476 = insertelement <8 x bfloat> undef, bfloat %212, i32 0
  %477 = insertelement <8 x bfloat> %476, bfloat %213, i32 1
  %478 = insertelement <8 x bfloat> %477, bfloat %214, i32 2
  %479 = insertelement <8 x bfloat> %478, bfloat %215, i32 3
  %480 = insertelement <8 x bfloat> %479, bfloat %216, i32 4
  %481 = insertelement <8 x bfloat> %480, bfloat %217, i32 5
  %482 = insertelement <8 x bfloat> %481, bfloat %218, i32 6
  %483 = insertelement <8 x bfloat> %482, bfloat %219, i32 7
  store <8 x bfloat> %483, ptr addrspace(3) %475, align 16
  %484 = xor i32 3120, %105
  %485 = xor i32 %484, %109
  %486 = xor i32 %485, %113
  %487 = xor i32 %486, %117
  %488 = xor i32 %487, %121
  %489 = xor i32 %488, %125
  %490 = xor i32 %489, %441
  %491 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %490
  %492 = insertelement <8 x bfloat> undef, bfloat %229, i32 0
  %493 = insertelement <8 x bfloat> %492, bfloat %230, i32 1
  %494 = insertelement <8 x bfloat> %493, bfloat %231, i32 2
  %495 = insertelement <8 x bfloat> %494, bfloat %232, i32 3
  %496 = insertelement <8 x bfloat> %495, bfloat %233, i32 4
  %497 = insertelement <8 x bfloat> %496, bfloat %234, i32 5
  %498 = insertelement <8 x bfloat> %497, bfloat %235, i32 6
  %499 = insertelement <8 x bfloat> %498, bfloat %236, i32 7
  store <8 x bfloat> %499, ptr addrspace(3) %491, align 16
  %500 = xor i32 4096, %105
  %501 = xor i32 %500, %109
  %502 = xor i32 %501, %113
  %503 = xor i32 %502, %117
  %504 = xor i32 %503, %121
  %505 = xor i32 %504, %125
  %506 = xor i32 %505, %441
  %507 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %506
  %508 = insertelement <8 x bfloat> undef, bfloat %246, i32 0
  %509 = insertelement <8 x bfloat> %508, bfloat %247, i32 1
  %510 = insertelement <8 x bfloat> %509, bfloat %248, i32 2
  %511 = insertelement <8 x bfloat> %510, bfloat %249, i32 3
  %512 = insertelement <8 x bfloat> %511, bfloat %250, i32 4
  %513 = insertelement <8 x bfloat> %512, bfloat %251, i32 5
  %514 = insertelement <8 x bfloat> %513, bfloat %252, i32 6
  %515 = insertelement <8 x bfloat> %514, bfloat %253, i32 7
  store <8 x bfloat> %515, ptr addrspace(3) %507, align 16
  %516 = xor i32 5136, %105
  %517 = xor i32 %516, %109
  %518 = xor i32 %517, %113
  %519 = xor i32 %518, %117
  %520 = xor i32 %519, %121
  %521 = xor i32 %520, %125
  %522 = xor i32 %521, %441
  %523 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %522
  %524 = insertelement <8 x bfloat> undef, bfloat %263, i32 0
  %525 = insertelement <8 x bfloat> %524, bfloat %264, i32 1
  %526 = insertelement <8 x bfloat> %525, bfloat %265, i32 2
  %527 = insertelement <8 x bfloat> %526, bfloat %266, i32 3
  %528 = insertelement <8 x bfloat> %527, bfloat %267, i32 4
  %529 = insertelement <8 x bfloat> %528, bfloat %268, i32 5
  %530 = insertelement <8 x bfloat> %529, bfloat %269, i32 6
  %531 = insertelement <8 x bfloat> %530, bfloat %270, i32 7
  store <8 x bfloat> %531, ptr addrspace(3) %523, align 16
  %532 = xor i32 6176, %105
  %533 = xor i32 %532, %109
  %534 = xor i32 %533, %113
  %535 = xor i32 %534, %117
  %536 = xor i32 %535, %121
  %537 = xor i32 %536, %125
  %538 = xor i32 %537, %441
  %539 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %538
  %540 = insertelement <8 x bfloat> undef, bfloat %280, i32 0
  %541 = insertelement <8 x bfloat> %540, bfloat %281, i32 1
  %542 = insertelement <8 x bfloat> %541, bfloat %282, i32 2
  %543 = insertelement <8 x bfloat> %542, bfloat %283, i32 3
  %544 = insertelement <8 x bfloat> %543, bfloat %284, i32 4
  %545 = insertelement <8 x bfloat> %544, bfloat %285, i32 5
  %546 = insertelement <8 x bfloat> %545, bfloat %286, i32 6
  %547 = insertelement <8 x bfloat> %546, bfloat %287, i32 7
  store <8 x bfloat> %547, ptr addrspace(3) %539, align 16
  %548 = xor i32 7216, %105
  %549 = xor i32 %548, %109
  %550 = xor i32 %549, %113
  %551 = xor i32 %550, %117
  %552 = xor i32 %551, %121
  %553 = xor i32 %552, %125
  %554 = xor i32 %553, %441
  %555 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %554
  %556 = insertelement <8 x bfloat> undef, bfloat %297, i32 0
  %557 = insertelement <8 x bfloat> %556, bfloat %298, i32 1
  %558 = insertelement <8 x bfloat> %557, bfloat %299, i32 2
  %559 = insertelement <8 x bfloat> %558, bfloat %300, i32 3
  %560 = insertelement <8 x bfloat> %559, bfloat %301, i32 4
  %561 = insertelement <8 x bfloat> %560, bfloat %302, i32 5
  %562 = insertelement <8 x bfloat> %561, bfloat %303, i32 6
  %563 = insertelement <8 x bfloat> %562, bfloat %304, i32 7
  store <8 x bfloat> %563, ptr addrspace(3) %555, align 16
  %564 = xor i32 8192, %105
  %565 = xor i32 %564, %109
  %566 = xor i32 %565, %113
  %567 = xor i32 %566, %117
  %568 = xor i32 %567, %121
  %569 = xor i32 %568, %125
  %570 = xor i32 %569, %441
  %571 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %570
  %572 = insertelement <8 x bfloat> undef, bfloat %314, i32 0
  %573 = insertelement <8 x bfloat> %572, bfloat %315, i32 1
  %574 = insertelement <8 x bfloat> %573, bfloat %316, i32 2
  %575 = insertelement <8 x bfloat> %574, bfloat %317, i32 3
  %576 = insertelement <8 x bfloat> %575, bfloat %318, i32 4
  %577 = insertelement <8 x bfloat> %576, bfloat %319, i32 5
  %578 = insertelement <8 x bfloat> %577, bfloat %320, i32 6
  %579 = insertelement <8 x bfloat> %578, bfloat %321, i32 7
  store <8 x bfloat> %579, ptr addrspace(3) %571, align 16
  %580 = xor i32 9232, %105
  %581 = xor i32 %580, %109
  %582 = xor i32 %581, %113
  %583 = xor i32 %582, %117
  %584 = xor i32 %583, %121
  %585 = xor i32 %584, %125
  %586 = xor i32 %585, %441
  %587 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %586
  %588 = insertelement <8 x bfloat> undef, bfloat %331, i32 0
  %589 = insertelement <8 x bfloat> %588, bfloat %332, i32 1
  %590 = insertelement <8 x bfloat> %589, bfloat %333, i32 2
  %591 = insertelement <8 x bfloat> %590, bfloat %334, i32 3
  %592 = insertelement <8 x bfloat> %591, bfloat %335, i32 4
  %593 = insertelement <8 x bfloat> %592, bfloat %336, i32 5
  %594 = insertelement <8 x bfloat> %593, bfloat %337, i32 6
  %595 = insertelement <8 x bfloat> %594, bfloat %338, i32 7
  store <8 x bfloat> %595, ptr addrspace(3) %587, align 16
  %596 = xor i32 10272, %105
  %597 = xor i32 %596, %109
  %598 = xor i32 %597, %113
  %599 = xor i32 %598, %117
  %600 = xor i32 %599, %121
  %601 = xor i32 %600, %125
  %602 = xor i32 %601, %441
  %603 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %602
  %604 = insertelement <8 x bfloat> undef, bfloat %348, i32 0
  %605 = insertelement <8 x bfloat> %604, bfloat %349, i32 1
  %606 = insertelement <8 x bfloat> %605, bfloat %350, i32 2
  %607 = insertelement <8 x bfloat> %606, bfloat %351, i32 3
  %608 = insertelement <8 x bfloat> %607, bfloat %352, i32 4
  %609 = insertelement <8 x bfloat> %608, bfloat %353, i32 5
  %610 = insertelement <8 x bfloat> %609, bfloat %354, i32 6
  %611 = insertelement <8 x bfloat> %610, bfloat %355, i32 7
  store <8 x bfloat> %611, ptr addrspace(3) %603, align 16
  %612 = xor i32 11312, %105
  %613 = xor i32 %612, %109
  %614 = xor i32 %613, %113
  %615 = xor i32 %614, %117
  %616 = xor i32 %615, %121
  %617 = xor i32 %616, %125
  %618 = xor i32 %617, %441
  %619 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %618
  %620 = insertelement <8 x bfloat> undef, bfloat %365, i32 0
  %621 = insertelement <8 x bfloat> %620, bfloat %366, i32 1
  %622 = insertelement <8 x bfloat> %621, bfloat %367, i32 2
  %623 = insertelement <8 x bfloat> %622, bfloat %368, i32 3
  %624 = insertelement <8 x bfloat> %623, bfloat %369, i32 4
  %625 = insertelement <8 x bfloat> %624, bfloat %370, i32 5
  %626 = insertelement <8 x bfloat> %625, bfloat %371, i32 6
  %627 = insertelement <8 x bfloat> %626, bfloat %372, i32 7
  store <8 x bfloat> %627, ptr addrspace(3) %619, align 16
  %628 = xor i32 12288, %105
  %629 = xor i32 %628, %109
  %630 = xor i32 %629, %113
  %631 = xor i32 %630, %117
  %632 = xor i32 %631, %121
  %633 = xor i32 %632, %125
  %634 = xor i32 %633, %441
  %635 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %634
  %636 = insertelement <8 x bfloat> undef, bfloat %382, i32 0
  %637 = insertelement <8 x bfloat> %636, bfloat %383, i32 1
  %638 = insertelement <8 x bfloat> %637, bfloat %384, i32 2
  %639 = insertelement <8 x bfloat> %638, bfloat %385, i32 3
  %640 = insertelement <8 x bfloat> %639, bfloat %386, i32 4
  %641 = insertelement <8 x bfloat> %640, bfloat %387, i32 5
  %642 = insertelement <8 x bfloat> %641, bfloat %388, i32 6
  %643 = insertelement <8 x bfloat> %642, bfloat %389, i32 7
  store <8 x bfloat> %643, ptr addrspace(3) %635, align 16
  %644 = xor i32 13328, %105
  %645 = xor i32 %644, %109
  %646 = xor i32 %645, %113
  %647 = xor i32 %646, %117
  %648 = xor i32 %647, %121
  %649 = xor i32 %648, %125
  %650 = xor i32 %649, %441
  %651 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %650
  %652 = insertelement <8 x bfloat> undef, bfloat %399, i32 0
  %653 = insertelement <8 x bfloat> %652, bfloat %400, i32 1
  %654 = insertelement <8 x bfloat> %653, bfloat %401, i32 2
  %655 = insertelement <8 x bfloat> %654, bfloat %402, i32 3
  %656 = insertelement <8 x bfloat> %655, bfloat %403, i32 4
  %657 = insertelement <8 x bfloat> %656, bfloat %404, i32 5
  %658 = insertelement <8 x bfloat> %657, bfloat %405, i32 6
  %659 = insertelement <8 x bfloat> %658, bfloat %406, i32 7
  store <8 x bfloat> %659, ptr addrspace(3) %651, align 16
  %660 = xor i32 14368, %105
  %661 = xor i32 %660, %109
  %662 = xor i32 %661, %113
  %663 = xor i32 %662, %117
  %664 = xor i32 %663, %121
  %665 = xor i32 %664, %125
  %666 = xor i32 %665, %441
  %667 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %666
  %668 = insertelement <8 x bfloat> undef, bfloat %416, i32 0
  %669 = insertelement <8 x bfloat> %668, bfloat %417, i32 1
  %670 = insertelement <8 x bfloat> %669, bfloat %418, i32 2
  %671 = insertelement <8 x bfloat> %670, bfloat %419, i32 3
  %672 = insertelement <8 x bfloat> %671, bfloat %420, i32 4
  %673 = insertelement <8 x bfloat> %672, bfloat %421, i32 5
  %674 = insertelement <8 x bfloat> %673, bfloat %422, i32 6
  %675 = insertelement <8 x bfloat> %674, bfloat %423, i32 7
  store <8 x bfloat> %675, ptr addrspace(3) %667, align 16
  %676 = xor i32 15408, %105
  %677 = xor i32 %676, %109
  %678 = xor i32 %677, %113
  %679 = xor i32 %678, %117
  %680 = xor i32 %679, %121
  %681 = xor i32 %680, %125
  %682 = xor i32 %681, %441
  %683 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %682
  %684 = insertelement <8 x bfloat> undef, bfloat %433, i32 0
  %685 = insertelement <8 x bfloat> %684, bfloat %434, i32 1
  %686 = insertelement <8 x bfloat> %685, bfloat %435, i32 2
  %687 = insertelement <8 x bfloat> %686, bfloat %436, i32 3
  %688 = insertelement <8 x bfloat> %687, bfloat %437, i32 4
  %689 = insertelement <8 x bfloat> %688, bfloat %438, i32 5
  %690 = insertelement <8 x bfloat> %689, bfloat %439, i32 6
  %691 = insertelement <8 x bfloat> %690, bfloat %440, i32 7
  store <8 x bfloat> %691, ptr addrspace(3) %683, align 16
  %692 = add i64 %132, 512
  call void @llvm.nvvm.barrier0()
  %693 = select i1 %104, i32 0, i32 520
  %694 = xor i32 0, %693
  %695 = select i1 %108, i32 0, i32 1040
  %696 = xor i32 %694, %695
  %697 = select i1 %112, i32 0, i32 2080
  %698 = xor i32 %696, %697
  %699 = select i1 %116, i32 0, i32 4096
  %700 = xor i32 %698, %699
  %701 = select i1 %120, i32 0, i32 8
  %702 = xor i32 %700, %701
  %703 = select i1 %19, i32 0, i32 8192
  %704 = xor i32 %702, %703
  %705 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %704
  %706 = ptrtoint ptr addrspace(3) %705 to i32
  %707 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %706)
  %708 = extractvalue { i32, i32, i32, i32 } %707, 0
  %709 = extractvalue { i32, i32, i32, i32 } %707, 1
  %710 = extractvalue { i32, i32, i32, i32 } %707, 2
  %711 = extractvalue { i32, i32, i32, i32 } %707, 3
  %712 = xor i32 16, %693
  %713 = xor i32 %712, %695
  %714 = xor i32 %713, %697
  %715 = xor i32 %714, %699
  %716 = xor i32 %715, %701
  %717 = xor i32 %716, %703
  %718 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %717
  %719 = ptrtoint ptr addrspace(3) %718 to i32
  %720 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %719)
  %721 = extractvalue { i32, i32, i32, i32 } %720, 0
  %722 = extractvalue { i32, i32, i32, i32 } %720, 1
  %723 = extractvalue { i32, i32, i32, i32 } %720, 2
  %724 = extractvalue { i32, i32, i32, i32 } %720, 3
  %725 = xor i32 32, %693
  %726 = xor i32 %725, %695
  %727 = xor i32 %726, %697
  %728 = xor i32 %727, %699
  %729 = xor i32 %728, %701
  %730 = xor i32 %729, %703
  %731 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %730
  %732 = ptrtoint ptr addrspace(3) %731 to i32
  %733 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %732)
  %734 = extractvalue { i32, i32, i32, i32 } %733, 0
  %735 = extractvalue { i32, i32, i32, i32 } %733, 1
  %736 = extractvalue { i32, i32, i32, i32 } %733, 2
  %737 = extractvalue { i32, i32, i32, i32 } %733, 3
  %738 = xor i32 48, %693
  %739 = xor i32 %738, %695
  %740 = xor i32 %739, %697
  %741 = xor i32 %740, %699
  %742 = xor i32 %741, %701
  %743 = xor i32 %742, %703
  %744 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %743
  %745 = ptrtoint ptr addrspace(3) %744 to i32
  %746 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %745)
  %747 = extractvalue { i32, i32, i32, i32 } %746, 0
  %748 = extractvalue { i32, i32, i32, i32 } %746, 1
  %749 = extractvalue { i32, i32, i32, i32 } %746, 2
  %750 = extractvalue { i32, i32, i32, i32 } %746, 3
  %751 = xor i32 64, %693
  %752 = xor i32 %751, %695
  %753 = xor i32 %752, %697
  %754 = xor i32 %753, %699
  %755 = xor i32 %754, %701
  %756 = xor i32 %755, %703
  %757 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %756
  %758 = ptrtoint ptr addrspace(3) %757 to i32
  %759 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %758)
  %760 = extractvalue { i32, i32, i32, i32 } %759, 0
  %761 = extractvalue { i32, i32, i32, i32 } %759, 1
  %762 = extractvalue { i32, i32, i32, i32 } %759, 2
  %763 = extractvalue { i32, i32, i32, i32 } %759, 3
  %764 = xor i32 80, %693
  %765 = xor i32 %764, %695
  %766 = xor i32 %765, %697
  %767 = xor i32 %766, %699
  %768 = xor i32 %767, %701
  %769 = xor i32 %768, %703
  %770 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %769
  %771 = ptrtoint ptr addrspace(3) %770 to i32
  %772 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %771)
  %773 = extractvalue { i32, i32, i32, i32 } %772, 0
  %774 = extractvalue { i32, i32, i32, i32 } %772, 1
  %775 = extractvalue { i32, i32, i32, i32 } %772, 2
  %776 = extractvalue { i32, i32, i32, i32 } %772, 3
  %777 = xor i32 96, %693
  %778 = xor i32 %777, %695
  %779 = xor i32 %778, %697
  %780 = xor i32 %779, %699
  %781 = xor i32 %780, %701
  %782 = xor i32 %781, %703
  %783 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %782
  %784 = ptrtoint ptr addrspace(3) %783 to i32
  %785 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %784)
  %786 = extractvalue { i32, i32, i32, i32 } %785, 0
  %787 = extractvalue { i32, i32, i32, i32 } %785, 1
  %788 = extractvalue { i32, i32, i32, i32 } %785, 2
  %789 = extractvalue { i32, i32, i32, i32 } %785, 3
  %790 = xor i32 112, %693
  %791 = xor i32 %790, %695
  %792 = xor i32 %791, %697
  %793 = xor i32 %792, %699
  %794 = xor i32 %793, %701
  %795 = xor i32 %794, %703
  %796 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %795
  %797 = ptrtoint ptr addrspace(3) %796 to i32
  %798 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %797)
  %799 = extractvalue { i32, i32, i32, i32 } %798, 0
  %800 = extractvalue { i32, i32, i32, i32 } %798, 1
  %801 = extractvalue { i32, i32, i32, i32 } %798, 2
  %802 = extractvalue { i32, i32, i32, i32 } %798, 3
  %803 = xor i32 128, %693
  %804 = xor i32 %803, %695
  %805 = xor i32 %804, %697
  %806 = xor i32 %805, %699
  %807 = xor i32 %806, %701
  %808 = xor i32 %807, %703
  %809 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %808
  %810 = ptrtoint ptr addrspace(3) %809 to i32
  %811 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %810)
  %812 = extractvalue { i32, i32, i32, i32 } %811, 0
  %813 = extractvalue { i32, i32, i32, i32 } %811, 1
  %814 = extractvalue { i32, i32, i32, i32 } %811, 2
  %815 = extractvalue { i32, i32, i32, i32 } %811, 3
  %816 = xor i32 144, %693
  %817 = xor i32 %816, %695
  %818 = xor i32 %817, %697
  %819 = xor i32 %818, %699
  %820 = xor i32 %819, %701
  %821 = xor i32 %820, %703
  %822 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %821
  %823 = ptrtoint ptr addrspace(3) %822 to i32
  %824 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %823)
  %825 = extractvalue { i32, i32, i32, i32 } %824, 0
  %826 = extractvalue { i32, i32, i32, i32 } %824, 1
  %827 = extractvalue { i32, i32, i32, i32 } %824, 2
  %828 = extractvalue { i32, i32, i32, i32 } %824, 3
  %829 = xor i32 160, %693
  %830 = xor i32 %829, %695
  %831 = xor i32 %830, %697
  %832 = xor i32 %831, %699
  %833 = xor i32 %832, %701
  %834 = xor i32 %833, %703
  %835 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %834
  %836 = ptrtoint ptr addrspace(3) %835 to i32
  %837 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %836)
  %838 = extractvalue { i32, i32, i32, i32 } %837, 0
  %839 = extractvalue { i32, i32, i32, i32 } %837, 1
  %840 = extractvalue { i32, i32, i32, i32 } %837, 2
  %841 = extractvalue { i32, i32, i32, i32 } %837, 3
  %842 = xor i32 176, %693
  %843 = xor i32 %842, %695
  %844 = xor i32 %843, %697
  %845 = xor i32 %844, %699
  %846 = xor i32 %845, %701
  %847 = xor i32 %846, %703
  %848 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %847
  %849 = ptrtoint ptr addrspace(3) %848 to i32
  %850 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %849)
  %851 = extractvalue { i32, i32, i32, i32 } %850, 0
  %852 = extractvalue { i32, i32, i32, i32 } %850, 1
  %853 = extractvalue { i32, i32, i32, i32 } %850, 2
  %854 = extractvalue { i32, i32, i32, i32 } %850, 3
  %855 = xor i32 192, %693
  %856 = xor i32 %855, %695
  %857 = xor i32 %856, %697
  %858 = xor i32 %857, %699
  %859 = xor i32 %858, %701
  %860 = xor i32 %859, %703
  %861 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %860
  %862 = ptrtoint ptr addrspace(3) %861 to i32
  %863 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %862)
  %864 = extractvalue { i32, i32, i32, i32 } %863, 0
  %865 = extractvalue { i32, i32, i32, i32 } %863, 1
  %866 = extractvalue { i32, i32, i32, i32 } %863, 2
  %867 = extractvalue { i32, i32, i32, i32 } %863, 3
  %868 = xor i32 208, %693
  %869 = xor i32 %868, %695
  %870 = xor i32 %869, %697
  %871 = xor i32 %870, %699
  %872 = xor i32 %871, %701
  %873 = xor i32 %872, %703
  %874 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %873
  %875 = ptrtoint ptr addrspace(3) %874 to i32
  %876 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %875)
  %877 = extractvalue { i32, i32, i32, i32 } %876, 0
  %878 = extractvalue { i32, i32, i32, i32 } %876, 1
  %879 = extractvalue { i32, i32, i32, i32 } %876, 2
  %880 = extractvalue { i32, i32, i32, i32 } %876, 3
  %881 = xor i32 224, %693
  %882 = xor i32 %881, %695
  %883 = xor i32 %882, %697
  %884 = xor i32 %883, %699
  %885 = xor i32 %884, %701
  %886 = xor i32 %885, %703
  %887 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %886
  %888 = ptrtoint ptr addrspace(3) %887 to i32
  %889 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %888)
  %890 = extractvalue { i32, i32, i32, i32 } %889, 0
  %891 = extractvalue { i32, i32, i32, i32 } %889, 1
  %892 = extractvalue { i32, i32, i32, i32 } %889, 2
  %893 = extractvalue { i32, i32, i32, i32 } %889, 3
  %894 = xor i32 240, %693
  %895 = xor i32 %894, %695
  %896 = xor i32 %895, %697
  %897 = xor i32 %896, %699
  %898 = xor i32 %897, %701
  %899 = xor i32 %898, %703
  %900 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %899
  %901 = ptrtoint ptr addrspace(3) %900 to i32
  %902 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %901)
  %903 = extractvalue { i32, i32, i32, i32 } %902, 0
  %904 = extractvalue { i32, i32, i32, i32 } %902, 1
  %905 = extractvalue { i32, i32, i32, i32 } %902, 2
  %906 = extractvalue { i32, i32, i32, i32 } %902, 3
  %907 = xor i32 256, %693
  %908 = xor i32 %907, %695
  %909 = xor i32 %908, %697
  %910 = xor i32 %909, %699
  %911 = xor i32 %910, %701
  %912 = xor i32 %911, %703
  %913 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %912
  %914 = ptrtoint ptr addrspace(3) %913 to i32
  %915 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %914)
  %916 = extractvalue { i32, i32, i32, i32 } %915, 0
  %917 = extractvalue { i32, i32, i32, i32 } %915, 1
  %918 = extractvalue { i32, i32, i32, i32 } %915, 2
  %919 = extractvalue { i32, i32, i32, i32 } %915, 3
  %920 = xor i32 272, %693
  %921 = xor i32 %920, %695
  %922 = xor i32 %921, %697
  %923 = xor i32 %922, %699
  %924 = xor i32 %923, %701
  %925 = xor i32 %924, %703
  %926 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %925
  %927 = ptrtoint ptr addrspace(3) %926 to i32
  %928 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %927)
  %929 = extractvalue { i32, i32, i32, i32 } %928, 0
  %930 = extractvalue { i32, i32, i32, i32 } %928, 1
  %931 = extractvalue { i32, i32, i32, i32 } %928, 2
  %932 = extractvalue { i32, i32, i32, i32 } %928, 3
  %933 = xor i32 288, %693
  %934 = xor i32 %933, %695
  %935 = xor i32 %934, %697
  %936 = xor i32 %935, %699
  %937 = xor i32 %936, %701
  %938 = xor i32 %937, %703
  %939 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %938
  %940 = ptrtoint ptr addrspace(3) %939 to i32
  %941 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %940)
  %942 = extractvalue { i32, i32, i32, i32 } %941, 0
  %943 = extractvalue { i32, i32, i32, i32 } %941, 1
  %944 = extractvalue { i32, i32, i32, i32 } %941, 2
  %945 = extractvalue { i32, i32, i32, i32 } %941, 3
  %946 = xor i32 304, %693
  %947 = xor i32 %946, %695
  %948 = xor i32 %947, %697
  %949 = xor i32 %948, %699
  %950 = xor i32 %949, %701
  %951 = xor i32 %950, %703
  %952 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %951
  %953 = ptrtoint ptr addrspace(3) %952 to i32
  %954 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %953)
  %955 = extractvalue { i32, i32, i32, i32 } %954, 0
  %956 = extractvalue { i32, i32, i32, i32 } %954, 1
  %957 = extractvalue { i32, i32, i32, i32 } %954, 2
  %958 = extractvalue { i32, i32, i32, i32 } %954, 3
  %959 = xor i32 320, %693
  %960 = xor i32 %959, %695
  %961 = xor i32 %960, %697
  %962 = xor i32 %961, %699
  %963 = xor i32 %962, %701
  %964 = xor i32 %963, %703
  %965 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %964
  %966 = ptrtoint ptr addrspace(3) %965 to i32
  %967 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %966)
  %968 = extractvalue { i32, i32, i32, i32 } %967, 0
  %969 = extractvalue { i32, i32, i32, i32 } %967, 1
  %970 = extractvalue { i32, i32, i32, i32 } %967, 2
  %971 = extractvalue { i32, i32, i32, i32 } %967, 3
  %972 = xor i32 336, %693
  %973 = xor i32 %972, %695
  %974 = xor i32 %973, %697
  %975 = xor i32 %974, %699
  %976 = xor i32 %975, %701
  %977 = xor i32 %976, %703
  %978 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %977
  %979 = ptrtoint ptr addrspace(3) %978 to i32
  %980 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %979)
  %981 = extractvalue { i32, i32, i32, i32 } %980, 0
  %982 = extractvalue { i32, i32, i32, i32 } %980, 1
  %983 = extractvalue { i32, i32, i32, i32 } %980, 2
  %984 = extractvalue { i32, i32, i32, i32 } %980, 3
  %985 = xor i32 352, %693
  %986 = xor i32 %985, %695
  %987 = xor i32 %986, %697
  %988 = xor i32 %987, %699
  %989 = xor i32 %988, %701
  %990 = xor i32 %989, %703
  %991 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %990
  %992 = ptrtoint ptr addrspace(3) %991 to i32
  %993 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %992)
  %994 = extractvalue { i32, i32, i32, i32 } %993, 0
  %995 = extractvalue { i32, i32, i32, i32 } %993, 1
  %996 = extractvalue { i32, i32, i32, i32 } %993, 2
  %997 = extractvalue { i32, i32, i32, i32 } %993, 3
  %998 = xor i32 368, %693
  %999 = xor i32 %998, %695
  %1000 = xor i32 %999, %697
  %1001 = xor i32 %1000, %699
  %1002 = xor i32 %1001, %701
  %1003 = xor i32 %1002, %703
  %1004 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1003
  %1005 = ptrtoint ptr addrspace(3) %1004 to i32
  %1006 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1005)
  %1007 = extractvalue { i32, i32, i32, i32 } %1006, 0
  %1008 = extractvalue { i32, i32, i32, i32 } %1006, 1
  %1009 = extractvalue { i32, i32, i32, i32 } %1006, 2
  %1010 = extractvalue { i32, i32, i32, i32 } %1006, 3
  %1011 = xor i32 384, %693
  %1012 = xor i32 %1011, %695
  %1013 = xor i32 %1012, %697
  %1014 = xor i32 %1013, %699
  %1015 = xor i32 %1014, %701
  %1016 = xor i32 %1015, %703
  %1017 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1016
  %1018 = ptrtoint ptr addrspace(3) %1017 to i32
  %1019 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1018)
  %1020 = extractvalue { i32, i32, i32, i32 } %1019, 0
  %1021 = extractvalue { i32, i32, i32, i32 } %1019, 1
  %1022 = extractvalue { i32, i32, i32, i32 } %1019, 2
  %1023 = extractvalue { i32, i32, i32, i32 } %1019, 3
  %1024 = xor i32 400, %693
  %1025 = xor i32 %1024, %695
  %1026 = xor i32 %1025, %697
  %1027 = xor i32 %1026, %699
  %1028 = xor i32 %1027, %701
  %1029 = xor i32 %1028, %703
  %1030 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1029
  %1031 = ptrtoint ptr addrspace(3) %1030 to i32
  %1032 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1031)
  %1033 = extractvalue { i32, i32, i32, i32 } %1032, 0
  %1034 = extractvalue { i32, i32, i32, i32 } %1032, 1
  %1035 = extractvalue { i32, i32, i32, i32 } %1032, 2
  %1036 = extractvalue { i32, i32, i32, i32 } %1032, 3
  %1037 = xor i32 416, %693
  %1038 = xor i32 %1037, %695
  %1039 = xor i32 %1038, %697
  %1040 = xor i32 %1039, %699
  %1041 = xor i32 %1040, %701
  %1042 = xor i32 %1041, %703
  %1043 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1042
  %1044 = ptrtoint ptr addrspace(3) %1043 to i32
  %1045 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1044)
  %1046 = extractvalue { i32, i32, i32, i32 } %1045, 0
  %1047 = extractvalue { i32, i32, i32, i32 } %1045, 1
  %1048 = extractvalue { i32, i32, i32, i32 } %1045, 2
  %1049 = extractvalue { i32, i32, i32, i32 } %1045, 3
  %1050 = xor i32 432, %693
  %1051 = xor i32 %1050, %695
  %1052 = xor i32 %1051, %697
  %1053 = xor i32 %1052, %699
  %1054 = xor i32 %1053, %701
  %1055 = xor i32 %1054, %703
  %1056 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1055
  %1057 = ptrtoint ptr addrspace(3) %1056 to i32
  %1058 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1057)
  %1059 = extractvalue { i32, i32, i32, i32 } %1058, 0
  %1060 = extractvalue { i32, i32, i32, i32 } %1058, 1
  %1061 = extractvalue { i32, i32, i32, i32 } %1058, 2
  %1062 = extractvalue { i32, i32, i32, i32 } %1058, 3
  %1063 = xor i32 448, %693
  %1064 = xor i32 %1063, %695
  %1065 = xor i32 %1064, %697
  %1066 = xor i32 %1065, %699
  %1067 = xor i32 %1066, %701
  %1068 = xor i32 %1067, %703
  %1069 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1068
  %1070 = ptrtoint ptr addrspace(3) %1069 to i32
  %1071 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1070)
  %1072 = extractvalue { i32, i32, i32, i32 } %1071, 0
  %1073 = extractvalue { i32, i32, i32, i32 } %1071, 1
  %1074 = extractvalue { i32, i32, i32, i32 } %1071, 2
  %1075 = extractvalue { i32, i32, i32, i32 } %1071, 3
  %1076 = xor i32 464, %693
  %1077 = xor i32 %1076, %695
  %1078 = xor i32 %1077, %697
  %1079 = xor i32 %1078, %699
  %1080 = xor i32 %1079, %701
  %1081 = xor i32 %1080, %703
  %1082 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1081
  %1083 = ptrtoint ptr addrspace(3) %1082 to i32
  %1084 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1083)
  %1085 = extractvalue { i32, i32, i32, i32 } %1084, 0
  %1086 = extractvalue { i32, i32, i32, i32 } %1084, 1
  %1087 = extractvalue { i32, i32, i32, i32 } %1084, 2
  %1088 = extractvalue { i32, i32, i32, i32 } %1084, 3
  %1089 = xor i32 480, %693
  %1090 = xor i32 %1089, %695
  %1091 = xor i32 %1090, %697
  %1092 = xor i32 %1091, %699
  %1093 = xor i32 %1092, %701
  %1094 = xor i32 %1093, %703
  %1095 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1094
  %1096 = ptrtoint ptr addrspace(3) %1095 to i32
  %1097 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1096)
  %1098 = extractvalue { i32, i32, i32, i32 } %1097, 0
  %1099 = extractvalue { i32, i32, i32, i32 } %1097, 1
  %1100 = extractvalue { i32, i32, i32, i32 } %1097, 2
  %1101 = extractvalue { i32, i32, i32, i32 } %1097, 3
  %1102 = xor i32 496, %693
  %1103 = xor i32 %1102, %695
  %1104 = xor i32 %1103, %697
  %1105 = xor i32 %1104, %699
  %1106 = xor i32 %1105, %701
  %1107 = xor i32 %1106, %703
  %1108 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1107
  %1109 = ptrtoint ptr addrspace(3) %1108 to i32
  %1110 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %1109)
  %1111 = extractvalue { i32, i32, i32, i32 } %1110, 0
  %1112 = extractvalue { i32, i32, i32, i32 } %1110, 1
  %1113 = extractvalue { i32, i32, i32, i32 } %1110, 2
  %1114 = extractvalue { i32, i32, i32, i32 } %1110, 3
  %1115 = bitcast i32 %708 to <2 x bfloat>
  %1116 = extractelement <2 x bfloat> %1115, i32 0
  %1117 = extractelement <2 x bfloat> %1115, i32 1
  %1118 = bitcast i32 %709 to <2 x bfloat>
  %1119 = extractelement <2 x bfloat> %1118, i32 0
  %1120 = extractelement <2 x bfloat> %1118, i32 1
  %1121 = bitcast i32 %710 to <2 x bfloat>
  %1122 = extractelement <2 x bfloat> %1121, i32 0
  %1123 = extractelement <2 x bfloat> %1121, i32 1
  %1124 = bitcast i32 %711 to <2 x bfloat>
  %1125 = extractelement <2 x bfloat> %1124, i32 0
  %1126 = extractelement <2 x bfloat> %1124, i32 1
  %1127 = bitcast i32 %721 to <2 x bfloat>
  %1128 = extractelement <2 x bfloat> %1127, i32 0
  %1129 = extractelement <2 x bfloat> %1127, i32 1
  %1130 = bitcast i32 %722 to <2 x bfloat>
  %1131 = extractelement <2 x bfloat> %1130, i32 0
  %1132 = extractelement <2 x bfloat> %1130, i32 1
  %1133 = bitcast i32 %723 to <2 x bfloat>
  %1134 = extractelement <2 x bfloat> %1133, i32 0
  %1135 = extractelement <2 x bfloat> %1133, i32 1
  %1136 = bitcast i32 %724 to <2 x bfloat>
  %1137 = extractelement <2 x bfloat> %1136, i32 0
  %1138 = extractelement <2 x bfloat> %1136, i32 1
  %1139 = bitcast i32 %734 to <2 x bfloat>
  %1140 = extractelement <2 x bfloat> %1139, i32 0
  %1141 = extractelement <2 x bfloat> %1139, i32 1
  %1142 = bitcast i32 %735 to <2 x bfloat>
  %1143 = extractelement <2 x bfloat> %1142, i32 0
  %1144 = extractelement <2 x bfloat> %1142, i32 1
  %1145 = bitcast i32 %736 to <2 x bfloat>
  %1146 = extractelement <2 x bfloat> %1145, i32 0
  %1147 = extractelement <2 x bfloat> %1145, i32 1
  %1148 = bitcast i32 %737 to <2 x bfloat>
  %1149 = extractelement <2 x bfloat> %1148, i32 0
  %1150 = extractelement <2 x bfloat> %1148, i32 1
  %1151 = bitcast i32 %747 to <2 x bfloat>
  %1152 = extractelement <2 x bfloat> %1151, i32 0
  %1153 = extractelement <2 x bfloat> %1151, i32 1
  %1154 = bitcast i32 %748 to <2 x bfloat>
  %1155 = extractelement <2 x bfloat> %1154, i32 0
  %1156 = extractelement <2 x bfloat> %1154, i32 1
  %1157 = bitcast i32 %749 to <2 x bfloat>
  %1158 = extractelement <2 x bfloat> %1157, i32 0
  %1159 = extractelement <2 x bfloat> %1157, i32 1
  %1160 = bitcast i32 %750 to <2 x bfloat>
  %1161 = extractelement <2 x bfloat> %1160, i32 0
  %1162 = extractelement <2 x bfloat> %1160, i32 1
  %1163 = bitcast i32 %760 to <2 x bfloat>
  %1164 = extractelement <2 x bfloat> %1163, i32 0
  %1165 = extractelement <2 x bfloat> %1163, i32 1
  %1166 = bitcast i32 %761 to <2 x bfloat>
  %1167 = extractelement <2 x bfloat> %1166, i32 0
  %1168 = extractelement <2 x bfloat> %1166, i32 1
  %1169 = bitcast i32 %762 to <2 x bfloat>
  %1170 = extractelement <2 x bfloat> %1169, i32 0
  %1171 = extractelement <2 x bfloat> %1169, i32 1
  %1172 = bitcast i32 %763 to <2 x bfloat>
  %1173 = extractelement <2 x bfloat> %1172, i32 0
  %1174 = extractelement <2 x bfloat> %1172, i32 1
  %1175 = bitcast i32 %773 to <2 x bfloat>
  %1176 = extractelement <2 x bfloat> %1175, i32 0
  %1177 = extractelement <2 x bfloat> %1175, i32 1
  %1178 = bitcast i32 %774 to <2 x bfloat>
  %1179 = extractelement <2 x bfloat> %1178, i32 0
  %1180 = extractelement <2 x bfloat> %1178, i32 1
  %1181 = bitcast i32 %775 to <2 x bfloat>
  %1182 = extractelement <2 x bfloat> %1181, i32 0
  %1183 = extractelement <2 x bfloat> %1181, i32 1
  %1184 = bitcast i32 %776 to <2 x bfloat>
  %1185 = extractelement <2 x bfloat> %1184, i32 0
  %1186 = extractelement <2 x bfloat> %1184, i32 1
  %1187 = bitcast i32 %786 to <2 x bfloat>
  %1188 = extractelement <2 x bfloat> %1187, i32 0
  %1189 = extractelement <2 x bfloat> %1187, i32 1
  %1190 = bitcast i32 %787 to <2 x bfloat>
  %1191 = extractelement <2 x bfloat> %1190, i32 0
  %1192 = extractelement <2 x bfloat> %1190, i32 1
  %1193 = bitcast i32 %788 to <2 x bfloat>
  %1194 = extractelement <2 x bfloat> %1193, i32 0
  %1195 = extractelement <2 x bfloat> %1193, i32 1
  %1196 = bitcast i32 %789 to <2 x bfloat>
  %1197 = extractelement <2 x bfloat> %1196, i32 0
  %1198 = extractelement <2 x bfloat> %1196, i32 1
  %1199 = bitcast i32 %799 to <2 x bfloat>
  %1200 = extractelement <2 x bfloat> %1199, i32 0
  %1201 = extractelement <2 x bfloat> %1199, i32 1
  %1202 = bitcast i32 %800 to <2 x bfloat>
  %1203 = extractelement <2 x bfloat> %1202, i32 0
  %1204 = extractelement <2 x bfloat> %1202, i32 1
  %1205 = bitcast i32 %801 to <2 x bfloat>
  %1206 = extractelement <2 x bfloat> %1205, i32 0
  %1207 = extractelement <2 x bfloat> %1205, i32 1
  %1208 = bitcast i32 %802 to <2 x bfloat>
  %1209 = extractelement <2 x bfloat> %1208, i32 0
  %1210 = extractelement <2 x bfloat> %1208, i32 1
  %1211 = bitcast i32 %812 to <2 x bfloat>
  %1212 = extractelement <2 x bfloat> %1211, i32 0
  %1213 = extractelement <2 x bfloat> %1211, i32 1
  %1214 = bitcast i32 %813 to <2 x bfloat>
  %1215 = extractelement <2 x bfloat> %1214, i32 0
  %1216 = extractelement <2 x bfloat> %1214, i32 1
  %1217 = bitcast i32 %814 to <2 x bfloat>
  %1218 = extractelement <2 x bfloat> %1217, i32 0
  %1219 = extractelement <2 x bfloat> %1217, i32 1
  %1220 = bitcast i32 %815 to <2 x bfloat>
  %1221 = extractelement <2 x bfloat> %1220, i32 0
  %1222 = extractelement <2 x bfloat> %1220, i32 1
  %1223 = bitcast i32 %825 to <2 x bfloat>
  %1224 = extractelement <2 x bfloat> %1223, i32 0
  %1225 = extractelement <2 x bfloat> %1223, i32 1
  %1226 = bitcast i32 %826 to <2 x bfloat>
  %1227 = extractelement <2 x bfloat> %1226, i32 0
  %1228 = extractelement <2 x bfloat> %1226, i32 1
  %1229 = bitcast i32 %827 to <2 x bfloat>
  %1230 = extractelement <2 x bfloat> %1229, i32 0
  %1231 = extractelement <2 x bfloat> %1229, i32 1
  %1232 = bitcast i32 %828 to <2 x bfloat>
  %1233 = extractelement <2 x bfloat> %1232, i32 0
  %1234 = extractelement <2 x bfloat> %1232, i32 1
  %1235 = bitcast i32 %838 to <2 x bfloat>
  %1236 = extractelement <2 x bfloat> %1235, i32 0
  %1237 = extractelement <2 x bfloat> %1235, i32 1
  %1238 = bitcast i32 %839 to <2 x bfloat>
  %1239 = extractelement <2 x bfloat> %1238, i32 0
  %1240 = extractelement <2 x bfloat> %1238, i32 1
  %1241 = bitcast i32 %840 to <2 x bfloat>
  %1242 = extractelement <2 x bfloat> %1241, i32 0
  %1243 = extractelement <2 x bfloat> %1241, i32 1
  %1244 = bitcast i32 %841 to <2 x bfloat>
  %1245 = extractelement <2 x bfloat> %1244, i32 0
  %1246 = extractelement <2 x bfloat> %1244, i32 1
  %1247 = bitcast i32 %851 to <2 x bfloat>
  %1248 = extractelement <2 x bfloat> %1247, i32 0
  %1249 = extractelement <2 x bfloat> %1247, i32 1
  %1250 = bitcast i32 %852 to <2 x bfloat>
  %1251 = extractelement <2 x bfloat> %1250, i32 0
  %1252 = extractelement <2 x bfloat> %1250, i32 1
  %1253 = bitcast i32 %853 to <2 x bfloat>
  %1254 = extractelement <2 x bfloat> %1253, i32 0
  %1255 = extractelement <2 x bfloat> %1253, i32 1
  %1256 = bitcast i32 %854 to <2 x bfloat>
  %1257 = extractelement <2 x bfloat> %1256, i32 0
  %1258 = extractelement <2 x bfloat> %1256, i32 1
  %1259 = bitcast i32 %864 to <2 x bfloat>
  %1260 = extractelement <2 x bfloat> %1259, i32 0
  %1261 = extractelement <2 x bfloat> %1259, i32 1
  %1262 = bitcast i32 %865 to <2 x bfloat>
  %1263 = extractelement <2 x bfloat> %1262, i32 0
  %1264 = extractelement <2 x bfloat> %1262, i32 1
  %1265 = bitcast i32 %866 to <2 x bfloat>
  %1266 = extractelement <2 x bfloat> %1265, i32 0
  %1267 = extractelement <2 x bfloat> %1265, i32 1
  %1268 = bitcast i32 %867 to <2 x bfloat>
  %1269 = extractelement <2 x bfloat> %1268, i32 0
  %1270 = extractelement <2 x bfloat> %1268, i32 1
  %1271 = bitcast i32 %877 to <2 x bfloat>
  %1272 = extractelement <2 x bfloat> %1271, i32 0
  %1273 = extractelement <2 x bfloat> %1271, i32 1
  %1274 = bitcast i32 %878 to <2 x bfloat>
  %1275 = extractelement <2 x bfloat> %1274, i32 0
  %1276 = extractelement <2 x bfloat> %1274, i32 1
  %1277 = bitcast i32 %879 to <2 x bfloat>
  %1278 = extractelement <2 x bfloat> %1277, i32 0
  %1279 = extractelement <2 x bfloat> %1277, i32 1
  %1280 = bitcast i32 %880 to <2 x bfloat>
  %1281 = extractelement <2 x bfloat> %1280, i32 0
  %1282 = extractelement <2 x bfloat> %1280, i32 1
  %1283 = bitcast i32 %890 to <2 x bfloat>
  %1284 = extractelement <2 x bfloat> %1283, i32 0
  %1285 = extractelement <2 x bfloat> %1283, i32 1
  %1286 = bitcast i32 %891 to <2 x bfloat>
  %1287 = extractelement <2 x bfloat> %1286, i32 0
  %1288 = extractelement <2 x bfloat> %1286, i32 1
  %1289 = bitcast i32 %892 to <2 x bfloat>
  %1290 = extractelement <2 x bfloat> %1289, i32 0
  %1291 = extractelement <2 x bfloat> %1289, i32 1
  %1292 = bitcast i32 %893 to <2 x bfloat>
  %1293 = extractelement <2 x bfloat> %1292, i32 0
  %1294 = extractelement <2 x bfloat> %1292, i32 1
  %1295 = bitcast i32 %903 to <2 x bfloat>
  %1296 = extractelement <2 x bfloat> %1295, i32 0
  %1297 = extractelement <2 x bfloat> %1295, i32 1
  %1298 = bitcast i32 %904 to <2 x bfloat>
  %1299 = extractelement <2 x bfloat> %1298, i32 0
  %1300 = extractelement <2 x bfloat> %1298, i32 1
  %1301 = bitcast i32 %905 to <2 x bfloat>
  %1302 = extractelement <2 x bfloat> %1301, i32 0
  %1303 = extractelement <2 x bfloat> %1301, i32 1
  %1304 = bitcast i32 %906 to <2 x bfloat>
  %1305 = extractelement <2 x bfloat> %1304, i32 0
  %1306 = extractelement <2 x bfloat> %1304, i32 1
  %1307 = bitcast i32 %916 to <2 x bfloat>
  %1308 = extractelement <2 x bfloat> %1307, i32 0
  %1309 = extractelement <2 x bfloat> %1307, i32 1
  %1310 = bitcast i32 %917 to <2 x bfloat>
  %1311 = extractelement <2 x bfloat> %1310, i32 0
  %1312 = extractelement <2 x bfloat> %1310, i32 1
  %1313 = bitcast i32 %918 to <2 x bfloat>
  %1314 = extractelement <2 x bfloat> %1313, i32 0
  %1315 = extractelement <2 x bfloat> %1313, i32 1
  %1316 = bitcast i32 %919 to <2 x bfloat>
  %1317 = extractelement <2 x bfloat> %1316, i32 0
  %1318 = extractelement <2 x bfloat> %1316, i32 1
  %1319 = bitcast i32 %929 to <2 x bfloat>
  %1320 = extractelement <2 x bfloat> %1319, i32 0
  %1321 = extractelement <2 x bfloat> %1319, i32 1
  %1322 = bitcast i32 %930 to <2 x bfloat>
  %1323 = extractelement <2 x bfloat> %1322, i32 0
  %1324 = extractelement <2 x bfloat> %1322, i32 1
  %1325 = bitcast i32 %931 to <2 x bfloat>
  %1326 = extractelement <2 x bfloat> %1325, i32 0
  %1327 = extractelement <2 x bfloat> %1325, i32 1
  %1328 = bitcast i32 %932 to <2 x bfloat>
  %1329 = extractelement <2 x bfloat> %1328, i32 0
  %1330 = extractelement <2 x bfloat> %1328, i32 1
  %1331 = bitcast i32 %942 to <2 x bfloat>
  %1332 = extractelement <2 x bfloat> %1331, i32 0
  %1333 = extractelement <2 x bfloat> %1331, i32 1
  %1334 = bitcast i32 %943 to <2 x bfloat>
  %1335 = extractelement <2 x bfloat> %1334, i32 0
  %1336 = extractelement <2 x bfloat> %1334, i32 1
  %1337 = bitcast i32 %944 to <2 x bfloat>
  %1338 = extractelement <2 x bfloat> %1337, i32 0
  %1339 = extractelement <2 x bfloat> %1337, i32 1
  %1340 = bitcast i32 %945 to <2 x bfloat>
  %1341 = extractelement <2 x bfloat> %1340, i32 0
  %1342 = extractelement <2 x bfloat> %1340, i32 1
  %1343 = bitcast i32 %955 to <2 x bfloat>
  %1344 = extractelement <2 x bfloat> %1343, i32 0
  %1345 = extractelement <2 x bfloat> %1343, i32 1
  %1346 = bitcast i32 %956 to <2 x bfloat>
  %1347 = extractelement <2 x bfloat> %1346, i32 0
  %1348 = extractelement <2 x bfloat> %1346, i32 1
  %1349 = bitcast i32 %957 to <2 x bfloat>
  %1350 = extractelement <2 x bfloat> %1349, i32 0
  %1351 = extractelement <2 x bfloat> %1349, i32 1
  %1352 = bitcast i32 %958 to <2 x bfloat>
  %1353 = extractelement <2 x bfloat> %1352, i32 0
  %1354 = extractelement <2 x bfloat> %1352, i32 1
  %1355 = bitcast i32 %968 to <2 x bfloat>
  %1356 = extractelement <2 x bfloat> %1355, i32 0
  %1357 = extractelement <2 x bfloat> %1355, i32 1
  %1358 = bitcast i32 %969 to <2 x bfloat>
  %1359 = extractelement <2 x bfloat> %1358, i32 0
  %1360 = extractelement <2 x bfloat> %1358, i32 1
  %1361 = bitcast i32 %970 to <2 x bfloat>
  %1362 = extractelement <2 x bfloat> %1361, i32 0
  %1363 = extractelement <2 x bfloat> %1361, i32 1
  %1364 = bitcast i32 %971 to <2 x bfloat>
  %1365 = extractelement <2 x bfloat> %1364, i32 0
  %1366 = extractelement <2 x bfloat> %1364, i32 1
  %1367 = bitcast i32 %981 to <2 x bfloat>
  %1368 = extractelement <2 x bfloat> %1367, i32 0
  %1369 = extractelement <2 x bfloat> %1367, i32 1
  %1370 = bitcast i32 %982 to <2 x bfloat>
  %1371 = extractelement <2 x bfloat> %1370, i32 0
  %1372 = extractelement <2 x bfloat> %1370, i32 1
  %1373 = bitcast i32 %983 to <2 x bfloat>
  %1374 = extractelement <2 x bfloat> %1373, i32 0
  %1375 = extractelement <2 x bfloat> %1373, i32 1
  %1376 = bitcast i32 %984 to <2 x bfloat>
  %1377 = extractelement <2 x bfloat> %1376, i32 0
  %1378 = extractelement <2 x bfloat> %1376, i32 1
  %1379 = bitcast i32 %994 to <2 x bfloat>
  %1380 = extractelement <2 x bfloat> %1379, i32 0
  %1381 = extractelement <2 x bfloat> %1379, i32 1
  %1382 = bitcast i32 %995 to <2 x bfloat>
  %1383 = extractelement <2 x bfloat> %1382, i32 0
  %1384 = extractelement <2 x bfloat> %1382, i32 1
  %1385 = bitcast i32 %996 to <2 x bfloat>
  %1386 = extractelement <2 x bfloat> %1385, i32 0
  %1387 = extractelement <2 x bfloat> %1385, i32 1
  %1388 = bitcast i32 %997 to <2 x bfloat>
  %1389 = extractelement <2 x bfloat> %1388, i32 0
  %1390 = extractelement <2 x bfloat> %1388, i32 1
  %1391 = bitcast i32 %1007 to <2 x bfloat>
  %1392 = extractelement <2 x bfloat> %1391, i32 0
  %1393 = extractelement <2 x bfloat> %1391, i32 1
  %1394 = bitcast i32 %1008 to <2 x bfloat>
  %1395 = extractelement <2 x bfloat> %1394, i32 0
  %1396 = extractelement <2 x bfloat> %1394, i32 1
  %1397 = bitcast i32 %1009 to <2 x bfloat>
  %1398 = extractelement <2 x bfloat> %1397, i32 0
  %1399 = extractelement <2 x bfloat> %1397, i32 1
  %1400 = bitcast i32 %1010 to <2 x bfloat>
  %1401 = extractelement <2 x bfloat> %1400, i32 0
  %1402 = extractelement <2 x bfloat> %1400, i32 1
  %1403 = bitcast i32 %1020 to <2 x bfloat>
  %1404 = extractelement <2 x bfloat> %1403, i32 0
  %1405 = extractelement <2 x bfloat> %1403, i32 1
  %1406 = bitcast i32 %1021 to <2 x bfloat>
  %1407 = extractelement <2 x bfloat> %1406, i32 0
  %1408 = extractelement <2 x bfloat> %1406, i32 1
  %1409 = bitcast i32 %1022 to <2 x bfloat>
  %1410 = extractelement <2 x bfloat> %1409, i32 0
  %1411 = extractelement <2 x bfloat> %1409, i32 1
  %1412 = bitcast i32 %1023 to <2 x bfloat>
  %1413 = extractelement <2 x bfloat> %1412, i32 0
  %1414 = extractelement <2 x bfloat> %1412, i32 1
  %1415 = bitcast i32 %1033 to <2 x bfloat>
  %1416 = extractelement <2 x bfloat> %1415, i32 0
  %1417 = extractelement <2 x bfloat> %1415, i32 1
  %1418 = bitcast i32 %1034 to <2 x bfloat>
  %1419 = extractelement <2 x bfloat> %1418, i32 0
  %1420 = extractelement <2 x bfloat> %1418, i32 1
  %1421 = bitcast i32 %1035 to <2 x bfloat>
  %1422 = extractelement <2 x bfloat> %1421, i32 0
  %1423 = extractelement <2 x bfloat> %1421, i32 1
  %1424 = bitcast i32 %1036 to <2 x bfloat>
  %1425 = extractelement <2 x bfloat> %1424, i32 0
  %1426 = extractelement <2 x bfloat> %1424, i32 1
  %1427 = bitcast i32 %1046 to <2 x bfloat>
  %1428 = extractelement <2 x bfloat> %1427, i32 0
  %1429 = extractelement <2 x bfloat> %1427, i32 1
  %1430 = bitcast i32 %1047 to <2 x bfloat>
  %1431 = extractelement <2 x bfloat> %1430, i32 0
  %1432 = extractelement <2 x bfloat> %1430, i32 1
  %1433 = bitcast i32 %1048 to <2 x bfloat>
  %1434 = extractelement <2 x bfloat> %1433, i32 0
  %1435 = extractelement <2 x bfloat> %1433, i32 1
  %1436 = bitcast i32 %1049 to <2 x bfloat>
  %1437 = extractelement <2 x bfloat> %1436, i32 0
  %1438 = extractelement <2 x bfloat> %1436, i32 1
  %1439 = bitcast i32 %1059 to <2 x bfloat>
  %1440 = extractelement <2 x bfloat> %1439, i32 0
  %1441 = extractelement <2 x bfloat> %1439, i32 1
  %1442 = bitcast i32 %1060 to <2 x bfloat>
  %1443 = extractelement <2 x bfloat> %1442, i32 0
  %1444 = extractelement <2 x bfloat> %1442, i32 1
  %1445 = bitcast i32 %1061 to <2 x bfloat>
  %1446 = extractelement <2 x bfloat> %1445, i32 0
  %1447 = extractelement <2 x bfloat> %1445, i32 1
  %1448 = bitcast i32 %1062 to <2 x bfloat>
  %1449 = extractelement <2 x bfloat> %1448, i32 0
  %1450 = extractelement <2 x bfloat> %1448, i32 1
  %1451 = bitcast i32 %1072 to <2 x bfloat>
  %1452 = extractelement <2 x bfloat> %1451, i32 0
  %1453 = extractelement <2 x bfloat> %1451, i32 1
  %1454 = bitcast i32 %1073 to <2 x bfloat>
  %1455 = extractelement <2 x bfloat> %1454, i32 0
  %1456 = extractelement <2 x bfloat> %1454, i32 1
  %1457 = bitcast i32 %1074 to <2 x bfloat>
  %1458 = extractelement <2 x bfloat> %1457, i32 0
  %1459 = extractelement <2 x bfloat> %1457, i32 1
  %1460 = bitcast i32 %1075 to <2 x bfloat>
  %1461 = extractelement <2 x bfloat> %1460, i32 0
  %1462 = extractelement <2 x bfloat> %1460, i32 1
  %1463 = bitcast i32 %1085 to <2 x bfloat>
  %1464 = extractelement <2 x bfloat> %1463, i32 0
  %1465 = extractelement <2 x bfloat> %1463, i32 1
  %1466 = bitcast i32 %1086 to <2 x bfloat>
  %1467 = extractelement <2 x bfloat> %1466, i32 0
  %1468 = extractelement <2 x bfloat> %1466, i32 1
  %1469 = bitcast i32 %1087 to <2 x bfloat>
  %1470 = extractelement <2 x bfloat> %1469, i32 0
  %1471 = extractelement <2 x bfloat> %1469, i32 1
  %1472 = bitcast i32 %1088 to <2 x bfloat>
  %1473 = extractelement <2 x bfloat> %1472, i32 0
  %1474 = extractelement <2 x bfloat> %1472, i32 1
  %1475 = bitcast i32 %1098 to <2 x bfloat>
  %1476 = extractelement <2 x bfloat> %1475, i32 0
  %1477 = extractelement <2 x bfloat> %1475, i32 1
  %1478 = bitcast i32 %1099 to <2 x bfloat>
  %1479 = extractelement <2 x bfloat> %1478, i32 0
  %1480 = extractelement <2 x bfloat> %1478, i32 1
  %1481 = bitcast i32 %1100 to <2 x bfloat>
  %1482 = extractelement <2 x bfloat> %1481, i32 0
  %1483 = extractelement <2 x bfloat> %1481, i32 1
  %1484 = bitcast i32 %1101 to <2 x bfloat>
  %1485 = extractelement <2 x bfloat> %1484, i32 0
  %1486 = extractelement <2 x bfloat> %1484, i32 1
  %1487 = bitcast i32 %1111 to <2 x bfloat>
  %1488 = extractelement <2 x bfloat> %1487, i32 0
  %1489 = extractelement <2 x bfloat> %1487, i32 1
  %1490 = bitcast i32 %1112 to <2 x bfloat>
  %1491 = extractelement <2 x bfloat> %1490, i32 0
  %1492 = extractelement <2 x bfloat> %1490, i32 1
  %1493 = bitcast i32 %1113 to <2 x bfloat>
  %1494 = extractelement <2 x bfloat> %1493, i32 0
  %1495 = extractelement <2 x bfloat> %1493, i32 1
  %1496 = bitcast i32 %1114 to <2 x bfloat>
  %1497 = extractelement <2 x bfloat> %1496, i32 0
  %1498 = extractelement <2 x bfloat> %1496, i32 1
  %1499 = insertelement <2 x bfloat> undef, bfloat %1116, i32 0
  %1500 = insertelement <2 x bfloat> %1499, bfloat %1117, i32 1
  %1501 = bitcast <2 x bfloat> %1500 to i32
  %1502 = insertelement <2 x bfloat> undef, bfloat %1119, i32 0
  %1503 = insertelement <2 x bfloat> %1502, bfloat %1120, i32 1
  %1504 = bitcast <2 x bfloat> %1503 to i32
  %1505 = insertelement <2 x bfloat> undef, bfloat %1122, i32 0
  %1506 = insertelement <2 x bfloat> %1505, bfloat %1123, i32 1
  %1507 = bitcast <2 x bfloat> %1506 to i32
  %1508 = insertelement <2 x bfloat> undef, bfloat %1125, i32 0
  %1509 = insertelement <2 x bfloat> %1508, bfloat %1126, i32 1
  %1510 = bitcast <2 x bfloat> %1509 to i32
  %1511 = insertelement <2 x bfloat> undef, bfloat %1128, i32 0
  %1512 = insertelement <2 x bfloat> %1511, bfloat %1129, i32 1
  %1513 = bitcast <2 x bfloat> %1512 to i32
  %1514 = insertelement <2 x bfloat> undef, bfloat %1131, i32 0
  %1515 = insertelement <2 x bfloat> %1514, bfloat %1132, i32 1
  %1516 = bitcast <2 x bfloat> %1515 to i32
  %1517 = insertelement <2 x bfloat> undef, bfloat %1134, i32 0
  %1518 = insertelement <2 x bfloat> %1517, bfloat %1135, i32 1
  %1519 = bitcast <2 x bfloat> %1518 to i32
  %1520 = insertelement <2 x bfloat> undef, bfloat %1137, i32 0
  %1521 = insertelement <2 x bfloat> %1520, bfloat %1138, i32 1
  %1522 = bitcast <2 x bfloat> %1521 to i32
  %1523 = insertelement <2 x bfloat> undef, bfloat %1140, i32 0
  %1524 = insertelement <2 x bfloat> %1523, bfloat %1141, i32 1
  %1525 = bitcast <2 x bfloat> %1524 to i32
  %1526 = insertelement <2 x bfloat> undef, bfloat %1143, i32 0
  %1527 = insertelement <2 x bfloat> %1526, bfloat %1144, i32 1
  %1528 = bitcast <2 x bfloat> %1527 to i32
  %1529 = insertelement <2 x bfloat> undef, bfloat %1146, i32 0
  %1530 = insertelement <2 x bfloat> %1529, bfloat %1147, i32 1
  %1531 = bitcast <2 x bfloat> %1530 to i32
  %1532 = insertelement <2 x bfloat> undef, bfloat %1149, i32 0
  %1533 = insertelement <2 x bfloat> %1532, bfloat %1150, i32 1
  %1534 = bitcast <2 x bfloat> %1533 to i32
  %1535 = insertelement <2 x bfloat> undef, bfloat %1152, i32 0
  %1536 = insertelement <2 x bfloat> %1535, bfloat %1153, i32 1
  %1537 = bitcast <2 x bfloat> %1536 to i32
  %1538 = insertelement <2 x bfloat> undef, bfloat %1155, i32 0
  %1539 = insertelement <2 x bfloat> %1538, bfloat %1156, i32 1
  %1540 = bitcast <2 x bfloat> %1539 to i32
  %1541 = insertelement <2 x bfloat> undef, bfloat %1158, i32 0
  %1542 = insertelement <2 x bfloat> %1541, bfloat %1159, i32 1
  %1543 = bitcast <2 x bfloat> %1542 to i32
  %1544 = insertelement <2 x bfloat> undef, bfloat %1161, i32 0
  %1545 = insertelement <2 x bfloat> %1544, bfloat %1162, i32 1
  %1546 = bitcast <2 x bfloat> %1545 to i32
  %1547 = insertelement <2 x bfloat> undef, bfloat %1164, i32 0
  %1548 = insertelement <2 x bfloat> %1547, bfloat %1165, i32 1
  %1549 = bitcast <2 x bfloat> %1548 to i32
  %1550 = insertelement <2 x bfloat> undef, bfloat %1167, i32 0
  %1551 = insertelement <2 x bfloat> %1550, bfloat %1168, i32 1
  %1552 = bitcast <2 x bfloat> %1551 to i32
  %1553 = insertelement <2 x bfloat> undef, bfloat %1170, i32 0
  %1554 = insertelement <2 x bfloat> %1553, bfloat %1171, i32 1
  %1555 = bitcast <2 x bfloat> %1554 to i32
  %1556 = insertelement <2 x bfloat> undef, bfloat %1173, i32 0
  %1557 = insertelement <2 x bfloat> %1556, bfloat %1174, i32 1
  %1558 = bitcast <2 x bfloat> %1557 to i32
  %1559 = insertelement <2 x bfloat> undef, bfloat %1176, i32 0
  %1560 = insertelement <2 x bfloat> %1559, bfloat %1177, i32 1
  %1561 = bitcast <2 x bfloat> %1560 to i32
  %1562 = insertelement <2 x bfloat> undef, bfloat %1179, i32 0
  %1563 = insertelement <2 x bfloat> %1562, bfloat %1180, i32 1
  %1564 = bitcast <2 x bfloat> %1563 to i32
  %1565 = insertelement <2 x bfloat> undef, bfloat %1182, i32 0
  %1566 = insertelement <2 x bfloat> %1565, bfloat %1183, i32 1
  %1567 = bitcast <2 x bfloat> %1566 to i32
  %1568 = insertelement <2 x bfloat> undef, bfloat %1185, i32 0
  %1569 = insertelement <2 x bfloat> %1568, bfloat %1186, i32 1
  %1570 = bitcast <2 x bfloat> %1569 to i32
  %1571 = insertelement <2 x bfloat> undef, bfloat %1188, i32 0
  %1572 = insertelement <2 x bfloat> %1571, bfloat %1189, i32 1
  %1573 = bitcast <2 x bfloat> %1572 to i32
  %1574 = insertelement <2 x bfloat> undef, bfloat %1191, i32 0
  %1575 = insertelement <2 x bfloat> %1574, bfloat %1192, i32 1
  %1576 = bitcast <2 x bfloat> %1575 to i32
  %1577 = insertelement <2 x bfloat> undef, bfloat %1194, i32 0
  %1578 = insertelement <2 x bfloat> %1577, bfloat %1195, i32 1
  %1579 = bitcast <2 x bfloat> %1578 to i32
  %1580 = insertelement <2 x bfloat> undef, bfloat %1197, i32 0
  %1581 = insertelement <2 x bfloat> %1580, bfloat %1198, i32 1
  %1582 = bitcast <2 x bfloat> %1581 to i32
  %1583 = insertelement <2 x bfloat> undef, bfloat %1200, i32 0
  %1584 = insertelement <2 x bfloat> %1583, bfloat %1201, i32 1
  %1585 = bitcast <2 x bfloat> %1584 to i32
  %1586 = insertelement <2 x bfloat> undef, bfloat %1203, i32 0
  %1587 = insertelement <2 x bfloat> %1586, bfloat %1204, i32 1
  %1588 = bitcast <2 x bfloat> %1587 to i32
  %1589 = insertelement <2 x bfloat> undef, bfloat %1206, i32 0
  %1590 = insertelement <2 x bfloat> %1589, bfloat %1207, i32 1
  %1591 = bitcast <2 x bfloat> %1590 to i32
  %1592 = insertelement <2 x bfloat> undef, bfloat %1209, i32 0
  %1593 = insertelement <2 x bfloat> %1592, bfloat %1210, i32 1
  %1594 = bitcast <2 x bfloat> %1593 to i32
  %1595 = insertelement <2 x bfloat> undef, bfloat %1212, i32 0
  %1596 = insertelement <2 x bfloat> %1595, bfloat %1213, i32 1
  %1597 = bitcast <2 x bfloat> %1596 to i32
  %1598 = insertelement <2 x bfloat> undef, bfloat %1215, i32 0
  %1599 = insertelement <2 x bfloat> %1598, bfloat %1216, i32 1
  %1600 = bitcast <2 x bfloat> %1599 to i32
  %1601 = insertelement <2 x bfloat> undef, bfloat %1218, i32 0
  %1602 = insertelement <2 x bfloat> %1601, bfloat %1219, i32 1
  %1603 = bitcast <2 x bfloat> %1602 to i32
  %1604 = insertelement <2 x bfloat> undef, bfloat %1221, i32 0
  %1605 = insertelement <2 x bfloat> %1604, bfloat %1222, i32 1
  %1606 = bitcast <2 x bfloat> %1605 to i32
  %1607 = insertelement <2 x bfloat> undef, bfloat %1224, i32 0
  %1608 = insertelement <2 x bfloat> %1607, bfloat %1225, i32 1
  %1609 = bitcast <2 x bfloat> %1608 to i32
  %1610 = insertelement <2 x bfloat> undef, bfloat %1227, i32 0
  %1611 = insertelement <2 x bfloat> %1610, bfloat %1228, i32 1
  %1612 = bitcast <2 x bfloat> %1611 to i32
  %1613 = insertelement <2 x bfloat> undef, bfloat %1230, i32 0
  %1614 = insertelement <2 x bfloat> %1613, bfloat %1231, i32 1
  %1615 = bitcast <2 x bfloat> %1614 to i32
  %1616 = insertelement <2 x bfloat> undef, bfloat %1233, i32 0
  %1617 = insertelement <2 x bfloat> %1616, bfloat %1234, i32 1
  %1618 = bitcast <2 x bfloat> %1617 to i32
  %1619 = insertelement <2 x bfloat> undef, bfloat %1236, i32 0
  %1620 = insertelement <2 x bfloat> %1619, bfloat %1237, i32 1
  %1621 = bitcast <2 x bfloat> %1620 to i32
  %1622 = insertelement <2 x bfloat> undef, bfloat %1239, i32 0
  %1623 = insertelement <2 x bfloat> %1622, bfloat %1240, i32 1
  %1624 = bitcast <2 x bfloat> %1623 to i32
  %1625 = insertelement <2 x bfloat> undef, bfloat %1242, i32 0
  %1626 = insertelement <2 x bfloat> %1625, bfloat %1243, i32 1
  %1627 = bitcast <2 x bfloat> %1626 to i32
  %1628 = insertelement <2 x bfloat> undef, bfloat %1245, i32 0
  %1629 = insertelement <2 x bfloat> %1628, bfloat %1246, i32 1
  %1630 = bitcast <2 x bfloat> %1629 to i32
  %1631 = insertelement <2 x bfloat> undef, bfloat %1248, i32 0
  %1632 = insertelement <2 x bfloat> %1631, bfloat %1249, i32 1
  %1633 = bitcast <2 x bfloat> %1632 to i32
  %1634 = insertelement <2 x bfloat> undef, bfloat %1251, i32 0
  %1635 = insertelement <2 x bfloat> %1634, bfloat %1252, i32 1
  %1636 = bitcast <2 x bfloat> %1635 to i32
  %1637 = insertelement <2 x bfloat> undef, bfloat %1254, i32 0
  %1638 = insertelement <2 x bfloat> %1637, bfloat %1255, i32 1
  %1639 = bitcast <2 x bfloat> %1638 to i32
  %1640 = insertelement <2 x bfloat> undef, bfloat %1257, i32 0
  %1641 = insertelement <2 x bfloat> %1640, bfloat %1258, i32 1
  %1642 = bitcast <2 x bfloat> %1641 to i32
  %1643 = insertelement <2 x bfloat> undef, bfloat %1260, i32 0
  %1644 = insertelement <2 x bfloat> %1643, bfloat %1261, i32 1
  %1645 = bitcast <2 x bfloat> %1644 to i32
  %1646 = insertelement <2 x bfloat> undef, bfloat %1263, i32 0
  %1647 = insertelement <2 x bfloat> %1646, bfloat %1264, i32 1
  %1648 = bitcast <2 x bfloat> %1647 to i32
  %1649 = insertelement <2 x bfloat> undef, bfloat %1266, i32 0
  %1650 = insertelement <2 x bfloat> %1649, bfloat %1267, i32 1
  %1651 = bitcast <2 x bfloat> %1650 to i32
  %1652 = insertelement <2 x bfloat> undef, bfloat %1269, i32 0
  %1653 = insertelement <2 x bfloat> %1652, bfloat %1270, i32 1
  %1654 = bitcast <2 x bfloat> %1653 to i32
  %1655 = insertelement <2 x bfloat> undef, bfloat %1272, i32 0
  %1656 = insertelement <2 x bfloat> %1655, bfloat %1273, i32 1
  %1657 = bitcast <2 x bfloat> %1656 to i32
  %1658 = insertelement <2 x bfloat> undef, bfloat %1275, i32 0
  %1659 = insertelement <2 x bfloat> %1658, bfloat %1276, i32 1
  %1660 = bitcast <2 x bfloat> %1659 to i32
  %1661 = insertelement <2 x bfloat> undef, bfloat %1278, i32 0
  %1662 = insertelement <2 x bfloat> %1661, bfloat %1279, i32 1
  %1663 = bitcast <2 x bfloat> %1662 to i32
  %1664 = insertelement <2 x bfloat> undef, bfloat %1281, i32 0
  %1665 = insertelement <2 x bfloat> %1664, bfloat %1282, i32 1
  %1666 = bitcast <2 x bfloat> %1665 to i32
  %1667 = insertelement <2 x bfloat> undef, bfloat %1284, i32 0
  %1668 = insertelement <2 x bfloat> %1667, bfloat %1285, i32 1
  %1669 = bitcast <2 x bfloat> %1668 to i32
  %1670 = insertelement <2 x bfloat> undef, bfloat %1287, i32 0
  %1671 = insertelement <2 x bfloat> %1670, bfloat %1288, i32 1
  %1672 = bitcast <2 x bfloat> %1671 to i32
  %1673 = insertelement <2 x bfloat> undef, bfloat %1290, i32 0
  %1674 = insertelement <2 x bfloat> %1673, bfloat %1291, i32 1
  %1675 = bitcast <2 x bfloat> %1674 to i32
  %1676 = insertelement <2 x bfloat> undef, bfloat %1293, i32 0
  %1677 = insertelement <2 x bfloat> %1676, bfloat %1294, i32 1
  %1678 = bitcast <2 x bfloat> %1677 to i32
  %1679 = insertelement <2 x bfloat> undef, bfloat %1296, i32 0
  %1680 = insertelement <2 x bfloat> %1679, bfloat %1297, i32 1
  %1681 = bitcast <2 x bfloat> %1680 to i32
  %1682 = insertelement <2 x bfloat> undef, bfloat %1299, i32 0
  %1683 = insertelement <2 x bfloat> %1682, bfloat %1300, i32 1
  %1684 = bitcast <2 x bfloat> %1683 to i32
  %1685 = insertelement <2 x bfloat> undef, bfloat %1302, i32 0
  %1686 = insertelement <2 x bfloat> %1685, bfloat %1303, i32 1
  %1687 = bitcast <2 x bfloat> %1686 to i32
  %1688 = insertelement <2 x bfloat> undef, bfloat %1305, i32 0
  %1689 = insertelement <2 x bfloat> %1688, bfloat %1306, i32 1
  %1690 = bitcast <2 x bfloat> %1689 to i32
  %1691 = insertelement <2 x bfloat> undef, bfloat %1308, i32 0
  %1692 = insertelement <2 x bfloat> %1691, bfloat %1309, i32 1
  %1693 = bitcast <2 x bfloat> %1692 to i32
  %1694 = insertelement <2 x bfloat> undef, bfloat %1311, i32 0
  %1695 = insertelement <2 x bfloat> %1694, bfloat %1312, i32 1
  %1696 = bitcast <2 x bfloat> %1695 to i32
  %1697 = insertelement <2 x bfloat> undef, bfloat %1314, i32 0
  %1698 = insertelement <2 x bfloat> %1697, bfloat %1315, i32 1
  %1699 = bitcast <2 x bfloat> %1698 to i32
  %1700 = insertelement <2 x bfloat> undef, bfloat %1317, i32 0
  %1701 = insertelement <2 x bfloat> %1700, bfloat %1318, i32 1
  %1702 = bitcast <2 x bfloat> %1701 to i32
  %1703 = insertelement <2 x bfloat> undef, bfloat %1320, i32 0
  %1704 = insertelement <2 x bfloat> %1703, bfloat %1321, i32 1
  %1705 = bitcast <2 x bfloat> %1704 to i32
  %1706 = insertelement <2 x bfloat> undef, bfloat %1323, i32 0
  %1707 = insertelement <2 x bfloat> %1706, bfloat %1324, i32 1
  %1708 = bitcast <2 x bfloat> %1707 to i32
  %1709 = insertelement <2 x bfloat> undef, bfloat %1326, i32 0
  %1710 = insertelement <2 x bfloat> %1709, bfloat %1327, i32 1
  %1711 = bitcast <2 x bfloat> %1710 to i32
  %1712 = insertelement <2 x bfloat> undef, bfloat %1329, i32 0
  %1713 = insertelement <2 x bfloat> %1712, bfloat %1330, i32 1
  %1714 = bitcast <2 x bfloat> %1713 to i32
  %1715 = insertelement <2 x bfloat> undef, bfloat %1332, i32 0
  %1716 = insertelement <2 x bfloat> %1715, bfloat %1333, i32 1
  %1717 = bitcast <2 x bfloat> %1716 to i32
  %1718 = insertelement <2 x bfloat> undef, bfloat %1335, i32 0
  %1719 = insertelement <2 x bfloat> %1718, bfloat %1336, i32 1
  %1720 = bitcast <2 x bfloat> %1719 to i32
  %1721 = insertelement <2 x bfloat> undef, bfloat %1338, i32 0
  %1722 = insertelement <2 x bfloat> %1721, bfloat %1339, i32 1
  %1723 = bitcast <2 x bfloat> %1722 to i32
  %1724 = insertelement <2 x bfloat> undef, bfloat %1341, i32 0
  %1725 = insertelement <2 x bfloat> %1724, bfloat %1342, i32 1
  %1726 = bitcast <2 x bfloat> %1725 to i32
  %1727 = insertelement <2 x bfloat> undef, bfloat %1344, i32 0
  %1728 = insertelement <2 x bfloat> %1727, bfloat %1345, i32 1
  %1729 = bitcast <2 x bfloat> %1728 to i32
  %1730 = insertelement <2 x bfloat> undef, bfloat %1347, i32 0
  %1731 = insertelement <2 x bfloat> %1730, bfloat %1348, i32 1
  %1732 = bitcast <2 x bfloat> %1731 to i32
  %1733 = insertelement <2 x bfloat> undef, bfloat %1350, i32 0
  %1734 = insertelement <2 x bfloat> %1733, bfloat %1351, i32 1
  %1735 = bitcast <2 x bfloat> %1734 to i32
  %1736 = insertelement <2 x bfloat> undef, bfloat %1353, i32 0
  %1737 = insertelement <2 x bfloat> %1736, bfloat %1354, i32 1
  %1738 = bitcast <2 x bfloat> %1737 to i32
  %1739 = insertelement <2 x bfloat> undef, bfloat %1356, i32 0
  %1740 = insertelement <2 x bfloat> %1739, bfloat %1357, i32 1
  %1741 = bitcast <2 x bfloat> %1740 to i32
  %1742 = insertelement <2 x bfloat> undef, bfloat %1359, i32 0
  %1743 = insertelement <2 x bfloat> %1742, bfloat %1360, i32 1
  %1744 = bitcast <2 x bfloat> %1743 to i32
  %1745 = insertelement <2 x bfloat> undef, bfloat %1362, i32 0
  %1746 = insertelement <2 x bfloat> %1745, bfloat %1363, i32 1
  %1747 = bitcast <2 x bfloat> %1746 to i32
  %1748 = insertelement <2 x bfloat> undef, bfloat %1365, i32 0
  %1749 = insertelement <2 x bfloat> %1748, bfloat %1366, i32 1
  %1750 = bitcast <2 x bfloat> %1749 to i32
  %1751 = insertelement <2 x bfloat> undef, bfloat %1368, i32 0
  %1752 = insertelement <2 x bfloat> %1751, bfloat %1369, i32 1
  %1753 = bitcast <2 x bfloat> %1752 to i32
  %1754 = insertelement <2 x bfloat> undef, bfloat %1371, i32 0
  %1755 = insertelement <2 x bfloat> %1754, bfloat %1372, i32 1
  %1756 = bitcast <2 x bfloat> %1755 to i32
  %1757 = insertelement <2 x bfloat> undef, bfloat %1374, i32 0
  %1758 = insertelement <2 x bfloat> %1757, bfloat %1375, i32 1
  %1759 = bitcast <2 x bfloat> %1758 to i32
  %1760 = insertelement <2 x bfloat> undef, bfloat %1377, i32 0
  %1761 = insertelement <2 x bfloat> %1760, bfloat %1378, i32 1
  %1762 = bitcast <2 x bfloat> %1761 to i32
  %1763 = insertelement <2 x bfloat> undef, bfloat %1380, i32 0
  %1764 = insertelement <2 x bfloat> %1763, bfloat %1381, i32 1
  %1765 = bitcast <2 x bfloat> %1764 to i32
  %1766 = insertelement <2 x bfloat> undef, bfloat %1383, i32 0
  %1767 = insertelement <2 x bfloat> %1766, bfloat %1384, i32 1
  %1768 = bitcast <2 x bfloat> %1767 to i32
  %1769 = insertelement <2 x bfloat> undef, bfloat %1386, i32 0
  %1770 = insertelement <2 x bfloat> %1769, bfloat %1387, i32 1
  %1771 = bitcast <2 x bfloat> %1770 to i32
  %1772 = insertelement <2 x bfloat> undef, bfloat %1389, i32 0
  %1773 = insertelement <2 x bfloat> %1772, bfloat %1390, i32 1
  %1774 = bitcast <2 x bfloat> %1773 to i32
  %1775 = insertelement <2 x bfloat> undef, bfloat %1392, i32 0
  %1776 = insertelement <2 x bfloat> %1775, bfloat %1393, i32 1
  %1777 = bitcast <2 x bfloat> %1776 to i32
  %1778 = insertelement <2 x bfloat> undef, bfloat %1395, i32 0
  %1779 = insertelement <2 x bfloat> %1778, bfloat %1396, i32 1
  %1780 = bitcast <2 x bfloat> %1779 to i32
  %1781 = insertelement <2 x bfloat> undef, bfloat %1398, i32 0
  %1782 = insertelement <2 x bfloat> %1781, bfloat %1399, i32 1
  %1783 = bitcast <2 x bfloat> %1782 to i32
  %1784 = insertelement <2 x bfloat> undef, bfloat %1401, i32 0
  %1785 = insertelement <2 x bfloat> %1784, bfloat %1402, i32 1
  %1786 = bitcast <2 x bfloat> %1785 to i32
  %1787 = insertelement <2 x bfloat> undef, bfloat %1404, i32 0
  %1788 = insertelement <2 x bfloat> %1787, bfloat %1405, i32 1
  %1789 = bitcast <2 x bfloat> %1788 to i32
  %1790 = insertelement <2 x bfloat> undef, bfloat %1407, i32 0
  %1791 = insertelement <2 x bfloat> %1790, bfloat %1408, i32 1
  %1792 = bitcast <2 x bfloat> %1791 to i32
  %1793 = insertelement <2 x bfloat> undef, bfloat %1410, i32 0
  %1794 = insertelement <2 x bfloat> %1793, bfloat %1411, i32 1
  %1795 = bitcast <2 x bfloat> %1794 to i32
  %1796 = insertelement <2 x bfloat> undef, bfloat %1413, i32 0
  %1797 = insertelement <2 x bfloat> %1796, bfloat %1414, i32 1
  %1798 = bitcast <2 x bfloat> %1797 to i32
  %1799 = insertelement <2 x bfloat> undef, bfloat %1416, i32 0
  %1800 = insertelement <2 x bfloat> %1799, bfloat %1417, i32 1
  %1801 = bitcast <2 x bfloat> %1800 to i32
  %1802 = insertelement <2 x bfloat> undef, bfloat %1419, i32 0
  %1803 = insertelement <2 x bfloat> %1802, bfloat %1420, i32 1
  %1804 = bitcast <2 x bfloat> %1803 to i32
  %1805 = insertelement <2 x bfloat> undef, bfloat %1422, i32 0
  %1806 = insertelement <2 x bfloat> %1805, bfloat %1423, i32 1
  %1807 = bitcast <2 x bfloat> %1806 to i32
  %1808 = insertelement <2 x bfloat> undef, bfloat %1425, i32 0
  %1809 = insertelement <2 x bfloat> %1808, bfloat %1426, i32 1
  %1810 = bitcast <2 x bfloat> %1809 to i32
  %1811 = insertelement <2 x bfloat> undef, bfloat %1428, i32 0
  %1812 = insertelement <2 x bfloat> %1811, bfloat %1429, i32 1
  %1813 = bitcast <2 x bfloat> %1812 to i32
  %1814 = insertelement <2 x bfloat> undef, bfloat %1431, i32 0
  %1815 = insertelement <2 x bfloat> %1814, bfloat %1432, i32 1
  %1816 = bitcast <2 x bfloat> %1815 to i32
  %1817 = insertelement <2 x bfloat> undef, bfloat %1434, i32 0
  %1818 = insertelement <2 x bfloat> %1817, bfloat %1435, i32 1
  %1819 = bitcast <2 x bfloat> %1818 to i32
  %1820 = insertelement <2 x bfloat> undef, bfloat %1437, i32 0
  %1821 = insertelement <2 x bfloat> %1820, bfloat %1438, i32 1
  %1822 = bitcast <2 x bfloat> %1821 to i32
  %1823 = insertelement <2 x bfloat> undef, bfloat %1440, i32 0
  %1824 = insertelement <2 x bfloat> %1823, bfloat %1441, i32 1
  %1825 = bitcast <2 x bfloat> %1824 to i32
  %1826 = insertelement <2 x bfloat> undef, bfloat %1443, i32 0
  %1827 = insertelement <2 x bfloat> %1826, bfloat %1444, i32 1
  %1828 = bitcast <2 x bfloat> %1827 to i32
  %1829 = insertelement <2 x bfloat> undef, bfloat %1446, i32 0
  %1830 = insertelement <2 x bfloat> %1829, bfloat %1447, i32 1
  %1831 = bitcast <2 x bfloat> %1830 to i32
  %1832 = insertelement <2 x bfloat> undef, bfloat %1449, i32 0
  %1833 = insertelement <2 x bfloat> %1832, bfloat %1450, i32 1
  %1834 = bitcast <2 x bfloat> %1833 to i32
  %1835 = insertelement <2 x bfloat> undef, bfloat %1452, i32 0
  %1836 = insertelement <2 x bfloat> %1835, bfloat %1453, i32 1
  %1837 = bitcast <2 x bfloat> %1836 to i32
  %1838 = insertelement <2 x bfloat> undef, bfloat %1455, i32 0
  %1839 = insertelement <2 x bfloat> %1838, bfloat %1456, i32 1
  %1840 = bitcast <2 x bfloat> %1839 to i32
  %1841 = insertelement <2 x bfloat> undef, bfloat %1458, i32 0
  %1842 = insertelement <2 x bfloat> %1841, bfloat %1459, i32 1
  %1843 = bitcast <2 x bfloat> %1842 to i32
  %1844 = insertelement <2 x bfloat> undef, bfloat %1461, i32 0
  %1845 = insertelement <2 x bfloat> %1844, bfloat %1462, i32 1
  %1846 = bitcast <2 x bfloat> %1845 to i32
  %1847 = insertelement <2 x bfloat> undef, bfloat %1464, i32 0
  %1848 = insertelement <2 x bfloat> %1847, bfloat %1465, i32 1
  %1849 = bitcast <2 x bfloat> %1848 to i32
  %1850 = insertelement <2 x bfloat> undef, bfloat %1467, i32 0
  %1851 = insertelement <2 x bfloat> %1850, bfloat %1468, i32 1
  %1852 = bitcast <2 x bfloat> %1851 to i32
  %1853 = insertelement <2 x bfloat> undef, bfloat %1470, i32 0
  %1854 = insertelement <2 x bfloat> %1853, bfloat %1471, i32 1
  %1855 = bitcast <2 x bfloat> %1854 to i32
  %1856 = insertelement <2 x bfloat> undef, bfloat %1473, i32 0
  %1857 = insertelement <2 x bfloat> %1856, bfloat %1474, i32 1
  %1858 = bitcast <2 x bfloat> %1857 to i32
  %1859 = insertelement <2 x bfloat> undef, bfloat %1476, i32 0
  %1860 = insertelement <2 x bfloat> %1859, bfloat %1477, i32 1
  %1861 = bitcast <2 x bfloat> %1860 to i32
  %1862 = insertelement <2 x bfloat> undef, bfloat %1479, i32 0
  %1863 = insertelement <2 x bfloat> %1862, bfloat %1480, i32 1
  %1864 = bitcast <2 x bfloat> %1863 to i32
  %1865 = insertelement <2 x bfloat> undef, bfloat %1482, i32 0
  %1866 = insertelement <2 x bfloat> %1865, bfloat %1483, i32 1
  %1867 = bitcast <2 x bfloat> %1866 to i32
  %1868 = insertelement <2 x bfloat> undef, bfloat %1485, i32 0
  %1869 = insertelement <2 x bfloat> %1868, bfloat %1486, i32 1
  %1870 = bitcast <2 x bfloat> %1869 to i32
  %1871 = insertelement <2 x bfloat> undef, bfloat %1488, i32 0
  %1872 = insertelement <2 x bfloat> %1871, bfloat %1489, i32 1
  %1873 = bitcast <2 x bfloat> %1872 to i32
  %1874 = insertelement <2 x bfloat> undef, bfloat %1491, i32 0
  %1875 = insertelement <2 x bfloat> %1874, bfloat %1492, i32 1
  %1876 = bitcast <2 x bfloat> %1875 to i32
  %1877 = insertelement <2 x bfloat> undef, bfloat %1494, i32 0
  %1878 = insertelement <2 x bfloat> %1877, bfloat %1495, i32 1
  %1879 = bitcast <2 x bfloat> %1878 to i32
  %1880 = insertelement <2 x bfloat> undef, bfloat %1497, i32 0
  %1881 = insertelement <2 x bfloat> %1880, bfloat %1498, i32 1
  %1882 = bitcast <2 x bfloat> %1881 to i32
  %1883 = extractvalue { float, float, float, float } %133, 0
  %1884 = extractvalue { float, float, float, float } %133, 1
  %1885 = extractvalue { float, float, float, float } %133, 2
  %1886 = extractvalue { float, float, float, float } %133, 3
  %1887 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1883, float %1884, float %1885, float %1886, i32 %1501, i32 %1504, i32 %1507, i32 %1510, i32 0, i32 0)
  %1888 = extractvalue { float, float, float, float } %1887, 0
  %1889 = extractvalue { float, float, float, float } %1887, 1
  %1890 = extractvalue { float, float, float, float } %1887, 2
  %1891 = extractvalue { float, float, float, float } %1887, 3
  %1892 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1888, float %1889, float %1890, float %1891, i32 %1513, i32 %1516, i32 %1519, i32 %1522, i32 0, i32 0)
  %1893 = extractvalue { float, float, float, float } %1892, 0
  %1894 = extractvalue { float, float, float, float } %1892, 1
  %1895 = extractvalue { float, float, float, float } %1892, 2
  %1896 = extractvalue { float, float, float, float } %1892, 3
  %1897 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1893, float %1894, float %1895, float %1896, i32 %1525, i32 %1528, i32 %1531, i32 %1534, i32 0, i32 0)
  %1898 = extractvalue { float, float, float, float } %1897, 0
  %1899 = extractvalue { float, float, float, float } %1897, 1
  %1900 = extractvalue { float, float, float, float } %1897, 2
  %1901 = extractvalue { float, float, float, float } %1897, 3
  %1902 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1898, float %1899, float %1900, float %1901, i32 %1537, i32 %1540, i32 %1543, i32 %1546, i32 0, i32 0)
  %1903 = extractvalue { float, float, float, float } %1902, 0
  %1904 = extractvalue { float, float, float, float } %1902, 1
  %1905 = extractvalue { float, float, float, float } %1902, 2
  %1906 = extractvalue { float, float, float, float } %1902, 3
  %1907 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1903, float %1904, float %1905, float %1906, i32 %1549, i32 %1552, i32 %1555, i32 %1558, i32 0, i32 0)
  %1908 = extractvalue { float, float, float, float } %1907, 0
  %1909 = extractvalue { float, float, float, float } %1907, 1
  %1910 = extractvalue { float, float, float, float } %1907, 2
  %1911 = extractvalue { float, float, float, float } %1907, 3
  %1912 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1908, float %1909, float %1910, float %1911, i32 %1561, i32 %1564, i32 %1567, i32 %1570, i32 0, i32 0)
  %1913 = extractvalue { float, float, float, float } %1912, 0
  %1914 = extractvalue { float, float, float, float } %1912, 1
  %1915 = extractvalue { float, float, float, float } %1912, 2
  %1916 = extractvalue { float, float, float, float } %1912, 3
  %1917 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1913, float %1914, float %1915, float %1916, i32 %1573, i32 %1576, i32 %1579, i32 %1582, i32 0, i32 0)
  %1918 = extractvalue { float, float, float, float } %1917, 0
  %1919 = extractvalue { float, float, float, float } %1917, 1
  %1920 = extractvalue { float, float, float, float } %1917, 2
  %1921 = extractvalue { float, float, float, float } %1917, 3
  %1922 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1918, float %1919, float %1920, float %1921, i32 %1585, i32 %1588, i32 %1591, i32 %1594, i32 0, i32 0)
  %1923 = extractvalue { float, float, float, float } %1922, 0
  %1924 = extractvalue { float, float, float, float } %1922, 1
  %1925 = extractvalue { float, float, float, float } %1922, 2
  %1926 = extractvalue { float, float, float, float } %1922, 3
  %1927 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1923, float %1924, float %1925, float %1926, i32 %1597, i32 %1600, i32 %1603, i32 %1606, i32 0, i32 0)
  %1928 = extractvalue { float, float, float, float } %1927, 0
  %1929 = extractvalue { float, float, float, float } %1927, 1
  %1930 = extractvalue { float, float, float, float } %1927, 2
  %1931 = extractvalue { float, float, float, float } %1927, 3
  %1932 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1928, float %1929, float %1930, float %1931, i32 %1609, i32 %1612, i32 %1615, i32 %1618, i32 0, i32 0)
  %1933 = extractvalue { float, float, float, float } %1932, 0
  %1934 = extractvalue { float, float, float, float } %1932, 1
  %1935 = extractvalue { float, float, float, float } %1932, 2
  %1936 = extractvalue { float, float, float, float } %1932, 3
  %1937 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1933, float %1934, float %1935, float %1936, i32 %1621, i32 %1624, i32 %1627, i32 %1630, i32 0, i32 0)
  %1938 = extractvalue { float, float, float, float } %1937, 0
  %1939 = extractvalue { float, float, float, float } %1937, 1
  %1940 = extractvalue { float, float, float, float } %1937, 2
  %1941 = extractvalue { float, float, float, float } %1937, 3
  %1942 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1938, float %1939, float %1940, float %1941, i32 %1633, i32 %1636, i32 %1639, i32 %1642, i32 0, i32 0)
  %1943 = extractvalue { float, float, float, float } %1942, 0
  %1944 = extractvalue { float, float, float, float } %1942, 1
  %1945 = extractvalue { float, float, float, float } %1942, 2
  %1946 = extractvalue { float, float, float, float } %1942, 3
  %1947 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1943, float %1944, float %1945, float %1946, i32 %1645, i32 %1648, i32 %1651, i32 %1654, i32 0, i32 0)
  %1948 = extractvalue { float, float, float, float } %1947, 0
  %1949 = extractvalue { float, float, float, float } %1947, 1
  %1950 = extractvalue { float, float, float, float } %1947, 2
  %1951 = extractvalue { float, float, float, float } %1947, 3
  %1952 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1948, float %1949, float %1950, float %1951, i32 %1657, i32 %1660, i32 %1663, i32 %1666, i32 0, i32 0)
  %1953 = extractvalue { float, float, float, float } %1952, 0
  %1954 = extractvalue { float, float, float, float } %1952, 1
  %1955 = extractvalue { float, float, float, float } %1952, 2
  %1956 = extractvalue { float, float, float, float } %1952, 3
  %1957 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1953, float %1954, float %1955, float %1956, i32 %1669, i32 %1672, i32 %1675, i32 %1678, i32 0, i32 0)
  %1958 = extractvalue { float, float, float, float } %1957, 0
  %1959 = extractvalue { float, float, float, float } %1957, 1
  %1960 = extractvalue { float, float, float, float } %1957, 2
  %1961 = extractvalue { float, float, float, float } %1957, 3
  %1962 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1958, float %1959, float %1960, float %1961, i32 %1681, i32 %1684, i32 %1687, i32 %1690, i32 0, i32 0)
  %1963 = extractvalue { float, float, float, float } %1962, 0
  %1964 = extractvalue { float, float, float, float } %1962, 1
  %1965 = extractvalue { float, float, float, float } %1962, 2
  %1966 = extractvalue { float, float, float, float } %1962, 3
  %1967 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1963, float %1964, float %1965, float %1966, i32 %1693, i32 %1696, i32 %1699, i32 %1702, i32 0, i32 0)
  %1968 = extractvalue { float, float, float, float } %1967, 0
  %1969 = extractvalue { float, float, float, float } %1967, 1
  %1970 = extractvalue { float, float, float, float } %1967, 2
  %1971 = extractvalue { float, float, float, float } %1967, 3
  %1972 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1968, float %1969, float %1970, float %1971, i32 %1705, i32 %1708, i32 %1711, i32 %1714, i32 0, i32 0)
  %1973 = extractvalue { float, float, float, float } %1972, 0
  %1974 = extractvalue { float, float, float, float } %1972, 1
  %1975 = extractvalue { float, float, float, float } %1972, 2
  %1976 = extractvalue { float, float, float, float } %1972, 3
  %1977 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1973, float %1974, float %1975, float %1976, i32 %1717, i32 %1720, i32 %1723, i32 %1726, i32 0, i32 0)
  %1978 = extractvalue { float, float, float, float } %1977, 0
  %1979 = extractvalue { float, float, float, float } %1977, 1
  %1980 = extractvalue { float, float, float, float } %1977, 2
  %1981 = extractvalue { float, float, float, float } %1977, 3
  %1982 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1978, float %1979, float %1980, float %1981, i32 %1729, i32 %1732, i32 %1735, i32 %1738, i32 0, i32 0)
  %1983 = extractvalue { float, float, float, float } %1982, 0
  %1984 = extractvalue { float, float, float, float } %1982, 1
  %1985 = extractvalue { float, float, float, float } %1982, 2
  %1986 = extractvalue { float, float, float, float } %1982, 3
  %1987 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1983, float %1984, float %1985, float %1986, i32 %1741, i32 %1744, i32 %1747, i32 %1750, i32 0, i32 0)
  %1988 = extractvalue { float, float, float, float } %1987, 0
  %1989 = extractvalue { float, float, float, float } %1987, 1
  %1990 = extractvalue { float, float, float, float } %1987, 2
  %1991 = extractvalue { float, float, float, float } %1987, 3
  %1992 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1988, float %1989, float %1990, float %1991, i32 %1753, i32 %1756, i32 %1759, i32 %1762, i32 0, i32 0)
  %1993 = extractvalue { float, float, float, float } %1992, 0
  %1994 = extractvalue { float, float, float, float } %1992, 1
  %1995 = extractvalue { float, float, float, float } %1992, 2
  %1996 = extractvalue { float, float, float, float } %1992, 3
  %1997 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1993, float %1994, float %1995, float %1996, i32 %1765, i32 %1768, i32 %1771, i32 %1774, i32 0, i32 0)
  %1998 = extractvalue { float, float, float, float } %1997, 0
  %1999 = extractvalue { float, float, float, float } %1997, 1
  %2000 = extractvalue { float, float, float, float } %1997, 2
  %2001 = extractvalue { float, float, float, float } %1997, 3
  %2002 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1998, float %1999, float %2000, float %2001, i32 %1777, i32 %1780, i32 %1783, i32 %1786, i32 0, i32 0)
  %2003 = extractvalue { float, float, float, float } %2002, 0
  %2004 = extractvalue { float, float, float, float } %2002, 1
  %2005 = extractvalue { float, float, float, float } %2002, 2
  %2006 = extractvalue { float, float, float, float } %2002, 3
  %2007 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2003, float %2004, float %2005, float %2006, i32 %1789, i32 %1792, i32 %1795, i32 %1798, i32 0, i32 0)
  %2008 = extractvalue { float, float, float, float } %2007, 0
  %2009 = extractvalue { float, float, float, float } %2007, 1
  %2010 = extractvalue { float, float, float, float } %2007, 2
  %2011 = extractvalue { float, float, float, float } %2007, 3
  %2012 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2008, float %2009, float %2010, float %2011, i32 %1801, i32 %1804, i32 %1807, i32 %1810, i32 0, i32 0)
  %2013 = extractvalue { float, float, float, float } %2012, 0
  %2014 = extractvalue { float, float, float, float } %2012, 1
  %2015 = extractvalue { float, float, float, float } %2012, 2
  %2016 = extractvalue { float, float, float, float } %2012, 3
  %2017 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2013, float %2014, float %2015, float %2016, i32 %1813, i32 %1816, i32 %1819, i32 %1822, i32 0, i32 0)
  %2018 = extractvalue { float, float, float, float } %2017, 0
  %2019 = extractvalue { float, float, float, float } %2017, 1
  %2020 = extractvalue { float, float, float, float } %2017, 2
  %2021 = extractvalue { float, float, float, float } %2017, 3
  %2022 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2018, float %2019, float %2020, float %2021, i32 %1825, i32 %1828, i32 %1831, i32 %1834, i32 0, i32 0)
  %2023 = extractvalue { float, float, float, float } %2022, 0
  %2024 = extractvalue { float, float, float, float } %2022, 1
  %2025 = extractvalue { float, float, float, float } %2022, 2
  %2026 = extractvalue { float, float, float, float } %2022, 3
  %2027 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2023, float %2024, float %2025, float %2026, i32 %1837, i32 %1840, i32 %1843, i32 %1846, i32 0, i32 0)
  %2028 = extractvalue { float, float, float, float } %2027, 0
  %2029 = extractvalue { float, float, float, float } %2027, 1
  %2030 = extractvalue { float, float, float, float } %2027, 2
  %2031 = extractvalue { float, float, float, float } %2027, 3
  %2032 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2028, float %2029, float %2030, float %2031, i32 %1849, i32 %1852, i32 %1855, i32 %1858, i32 0, i32 0)
  %2033 = extractvalue { float, float, float, float } %2032, 0
  %2034 = extractvalue { float, float, float, float } %2032, 1
  %2035 = extractvalue { float, float, float, float } %2032, 2
  %2036 = extractvalue { float, float, float, float } %2032, 3
  %2037 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2033, float %2034, float %2035, float %2036, i32 %1861, i32 %1864, i32 %1867, i32 %1870, i32 0, i32 0)
  %2038 = extractvalue { float, float, float, float } %2037, 0
  %2039 = extractvalue { float, float, float, float } %2037, 1
  %2040 = extractvalue { float, float, float, float } %2037, 2
  %2041 = extractvalue { float, float, float, float } %2037, 3
  %2042 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %2038, float %2039, float %2040, float %2041, i32 %1873, i32 %1876, i32 %1879, i32 %1882, i32 0, i32 0)
  %2043 = extractvalue { float, float, float, float } %2042, 0
  %2044 = extractvalue { float, float, float, float } %2042, 1
  %2045 = extractvalue { float, float, float, float } %2042, 2
  %2046 = extractvalue { float, float, float, float } %2042, 3
  %2047 = insertvalue { float, float, float, float } undef, float %2043, 0
  %2048 = insertvalue { float, float, float, float } %2047, float %2044, 1
  %2049 = insertvalue { float, float, float, float } %2048, float %2045, 2
  %2050 = insertvalue { float, float, float, float } %2049, float %2046, 3
  %2051 = add i32 %131, 512
  br label %130

2052:                                             ; preds = %130
  %2053 = extractvalue { float, float, float, float } %133, 0
  %2054 = extractvalue { float, float, float, float } %133, 1
  %2055 = extractvalue { float, float, float, float } %133, 2
  %2056 = extractvalue { float, float, float, float } %133, 3
  %2057 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %2053)
  %2058 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %2054)
  %2059 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %2055)
  %2060 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %2056)
  %2061 = mul i32 %13, 16
  %2062 = sext i32 %2061 to i64
  %2063 = select i1 %104, i32 0, i32 4
  %2064 = xor i32 0, %2063
  %2065 = select i1 %108, i32 0, i32 8
  %2066 = xor i32 %2064, %2065
  %2067 = select i1 %112, i32 0, i32 16
  %2068 = xor i32 %2066, %2067
  %2069 = xor i32 %2068, 0
  %2070 = add i32 %2069, 0
  %2071 = sext i32 %2070 to i64
  %2072 = add i64 %15, %2071
  %2073 = select i1 %116, i32 0, i32 1
  %2074 = xor i32 0, %2073
  %2075 = select i1 %120, i32 0, i32 2
  %2076 = xor i32 %2074, %2075
  %2077 = select i1 %124, i32 0, i32 4
  %2078 = xor i32 %2076, %2077
  %2079 = select i1 %19, i32 0, i32 8
  %2080 = xor i32 %2078, %2079
  %2081 = xor i32 %2080, 0
  %2082 = add i32 %2081, 0
  %2083 = sext i32 %2082 to i64
  %2084 = add i64 %2062, %2083
  %2085 = mul i64 %2084, 1024
  %2086 = add i64 %2072, %2085
  %2087 = getelementptr bfloat, ptr addrspace(1) %2, i64 %2086
  call void @llvm.nvvm.barrier0()
  %2088 = select i1 %104, i32 0, i32 64
  %2089 = xor i32 0, %2088
  %2090 = select i1 %108, i32 0, i32 128
  %2091 = xor i32 %2089, %2090
  %2092 = select i1 %112, i32 0, i32 1
  %2093 = xor i32 %2091, %2092
  %2094 = select i1 %116, i32 0, i32 2
  %2095 = xor i32 %2093, %2094
  %2096 = select i1 %120, i32 0, i32 4
  %2097 = xor i32 %2095, %2096
  %2098 = xor i32 %2097, %125
  %2099 = select i1 %19, i32 0, i32 16
  %2100 = xor i32 %2098, %2099
  %2101 = select i1 %116, i32 0, i32 32
  %2102 = xor i32 %2068, %2101
  %2103 = select i1 %120, i32 0, i32 64
  %2104 = xor i32 %2102, %2103
  %2105 = select i1 %124, i32 0, i32 128
  %2106 = xor i32 %2104, %2105
  %2107 = select i1 %19, i32 0, i32 256
  %2108 = xor i32 %2106, %2107
  %2109 = xor i32 %2100, 0
  %2110 = lshr i32 %2109, 5
  %2111 = shl i32 %2110, 2
  %2112 = add i32 %2111, %2109
  %2113 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2112
  %2114 = insertelement <1 x bfloat> undef, bfloat %2057, i32 0
  %2115 = extractelement <1 x bfloat> %2114, i32 0
  %2116 = bitcast bfloat %2115 to i16
  %2117 = insertelement <1 x i16> undef, i16 %2116, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %2113, <1 x i16> %2117, i1 true)
  %2118 = xor i32 %2100, 32
  %2119 = lshr i32 %2118, 5
  %2120 = shl i32 %2119, 2
  %2121 = add i32 %2120, %2118
  %2122 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2121
  %2123 = insertelement <1 x bfloat> undef, bfloat %2058, i32 0
  %2124 = extractelement <1 x bfloat> %2123, i32 0
  %2125 = bitcast bfloat %2124 to i16
  %2126 = insertelement <1 x i16> undef, i16 %2125, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %2122, <1 x i16> %2126, i1 true)
  %2127 = xor i32 %2100, 8
  %2128 = lshr i32 %2127, 5
  %2129 = shl i32 %2128, 2
  %2130 = add i32 %2129, %2127
  %2131 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2130
  %2132 = insertelement <1 x bfloat> undef, bfloat %2059, i32 0
  %2133 = extractelement <1 x bfloat> %2132, i32 0
  %2134 = bitcast bfloat %2133 to i16
  %2135 = insertelement <1 x i16> undef, i16 %2134, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %2131, <1 x i16> %2135, i1 true)
  %2136 = xor i32 %2100, 40
  %2137 = lshr i32 %2136, 5
  %2138 = shl i32 %2137, 2
  %2139 = add i32 %2138, %2136
  %2140 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2139
  %2141 = insertelement <1 x bfloat> undef, bfloat %2060, i32 0
  %2142 = extractelement <1 x bfloat> %2141, i32 0
  %2143 = bitcast bfloat %2142 to i16
  %2144 = insertelement <1 x i16> undef, i16 %2143, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %2140, <1 x i16> %2144, i1 true)
  call void @llvm.nvvm.barrier0()
  %2145 = xor i32 %2108, 0
  %2146 = lshr i32 %2145, 5
  %2147 = shl i32 %2146, 2
  %2148 = add i32 %2147, %2145
  %2149 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %2148
  %2150 = load <4 x i16>, ptr addrspace(3) %2149, align 8
  %2151 = extractelement <4 x i16> %2150, i32 0
  %2152 = extractelement <4 x i16> %2150, i32 1
  %2153 = extractelement <4 x i16> %2150, i32 2
  %2154 = extractelement <4 x i16> %2150, i32 3
  %2155 = insertelement <4 x i16> undef, i16 %2151, i32 0
  %2156 = insertelement <4 x i16> %2155, i16 %2152, i32 1
  %2157 = insertelement <4 x i16> %2156, i16 %2153, i32 2
  %2158 = insertelement <4 x i16> %2157, i16 %2154, i32 3
  %2159 = extractelement <4 x i16> %2158, i32 0
  %2160 = extractelement <4 x i16> %2158, i32 1
  %2161 = extractelement <4 x i16> %2158, i32 2
  %2162 = extractelement <4 x i16> %2158, i32 3
  %2163 = bitcast i16 %2159 to bfloat
  %2164 = bitcast i16 %2160 to bfloat
  %2165 = bitcast i16 %2161 to bfloat
  %2166 = bitcast i16 %2162 to bfloat
  %2167 = insertelement <4 x bfloat> undef, bfloat %2163, i32 0
  %2168 = insertelement <4 x bfloat> %2167, bfloat %2164, i32 1
  %2169 = insertelement <4 x bfloat> %2168, bfloat %2165, i32 2
  %2170 = insertelement <4 x bfloat> %2169, bfloat %2166, i32 3
  %2171 = extractelement <4 x bfloat> %2170, i32 0
  %2172 = extractelement <4 x bfloat> %2170, i32 1
  %2173 = extractelement <4 x bfloat> %2170, i32 2
  %2174 = extractelement <4 x bfloat> %2170, i32 3
  %2175 = insertelement <2 x bfloat> undef, bfloat %2171, i32 0
  %2176 = insertelement <2 x bfloat> %2175, bfloat %2172, i32 1
  %2177 = bitcast <2 x bfloat> %2176 to i32
  %2178 = insertelement <2 x bfloat> undef, bfloat %2173, i32 0
  %2179 = insertelement <2 x bfloat> %2178, bfloat %2174, i32 1
  %2180 = bitcast <2 x bfloat> %2179 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %2177, i32 %2180, ptr addrspace(1) %2087)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_24_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_24(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) #6 {
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
  %12 = mul i64 %8, 256
  %13 = getelementptr bfloat, ptr addrspace(1) %3, i64 %12
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %15 = urem i32 %14, 32
  %16 = udiv i32 %14, 32
  %17 = and i32 %15, 1
  %18 = icmp eq i32 %17, 0
  %19 = select i1 %18, i32 0, i32 4
  %20 = xor i32 0, %19
  %21 = and i32 %15, 2
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 0, i32 8
  %24 = xor i32 %20, %23
  %25 = and i32 %15, 4
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 0, i32 16
  %28 = xor i32 %24, %27
  %29 = and i32 %15, 8
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 32
  %32 = xor i32 %28, %31
  %33 = and i32 %15, 16
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 64
  %36 = xor i32 %32, %35
  %37 = and i32 %16, 1
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 0, i32 128
  %40 = xor i32 %36, %39
  %41 = xor i32 %40, 0
  %42 = add i32 %41, 0
  %43 = sext i32 %42 to i64
  %44 = getelementptr bfloat, ptr addrspace(1) %13, i64 %43
  %45 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %44)
  %46 = extractvalue { i32, i32 } %45, 0
  %47 = bitcast i32 %46 to <2 x bfloat>
  %48 = extractvalue { i32, i32 } %45, 1
  %49 = bitcast i32 %48 to <2 x bfloat>
  %50 = extractelement <2 x bfloat> %47, i32 0
  %51 = extractelement <2 x bfloat> %47, i32 1
  %52 = extractelement <2 x bfloat> %49, i32 0
  %53 = extractelement <2 x bfloat> %49, i32 1
  %54 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50)
  %55 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51)
  %56 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52)
  %57 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %53)
  %58 = getelementptr bfloat, ptr addrspace(1) %2, i64 %12
  %59 = getelementptr bfloat, ptr addrspace(1) %58, i64 %43
  %60 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %59)
  %61 = extractvalue { i32, i32 } %60, 0
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractvalue { i32, i32 } %60, 1
  %64 = bitcast i32 %63 to <2 x bfloat>
  %65 = extractelement <2 x bfloat> %62, i32 0
  %66 = extractelement <2 x bfloat> %62, i32 1
  %67 = extractelement <2 x bfloat> %64, i32 0
  %68 = extractelement <2 x bfloat> %64, i32 1
  %69 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %70 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %71 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %72 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %73 = fadd float %54, %69
  %74 = fadd float %55, %70
  %75 = fadd float %56, %71
  %76 = fadd float %57, %72
  %77 = mul i64 %9, 1024
  %78 = getelementptr bfloat, ptr addrspace(1) %3, i64 %77
  %79 = select i1 %18, i32 0, i32 8
  %80 = xor i32 0, %79
  %81 = select i1 %22, i32 0, i32 16
  %82 = xor i32 %80, %81
  %83 = select i1 %26, i32 0, i32 32
  %84 = xor i32 %82, %83
  %85 = select i1 %30, i32 0, i32 64
  %86 = xor i32 %84, %85
  %87 = select i1 %34, i32 0, i32 128
  %88 = xor i32 %86, %87
  %89 = select i1 %38, i32 0, i32 256
  %90 = xor i32 %88, %89
  %91 = xor i32 %90, 0
  %92 = xor i32 %90, 512
  %93 = add i32 %91, 0
  %94 = add i32 %92, 0
  %95 = sext i32 %93 to i64
  %96 = sext i32 %94 to i64
  %97 = getelementptr bfloat, ptr addrspace(1) %78, i64 %95
  %98 = getelementptr bfloat, ptr addrspace(1) %78, i64 %96
  %99 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %97)
  %100 = extractvalue { i32, i32, i32, i32 } %99, 0
  %101 = bitcast i32 %100 to <2 x bfloat>
  %102 = extractvalue { i32, i32, i32, i32 } %99, 1
  %103 = bitcast i32 %102 to <2 x bfloat>
  %104 = extractvalue { i32, i32, i32, i32 } %99, 2
  %105 = bitcast i32 %104 to <2 x bfloat>
  %106 = extractvalue { i32, i32, i32, i32 } %99, 3
  %107 = bitcast i32 %106 to <2 x bfloat>
  %108 = extractelement <2 x bfloat> %101, i32 0
  %109 = extractelement <2 x bfloat> %101, i32 1
  %110 = extractelement <2 x bfloat> %103, i32 0
  %111 = extractelement <2 x bfloat> %103, i32 1
  %112 = extractelement <2 x bfloat> %105, i32 0
  %113 = extractelement <2 x bfloat> %105, i32 1
  %114 = extractelement <2 x bfloat> %107, i32 0
  %115 = extractelement <2 x bfloat> %107, i32 1
  %116 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %98)
  %117 = extractvalue { i32, i32, i32, i32 } %116, 0
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractvalue { i32, i32, i32, i32 } %116, 1
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %116, 2
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %116, 3
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractelement <2 x bfloat> %118, i32 0
  %126 = extractelement <2 x bfloat> %118, i32 1
  %127 = extractelement <2 x bfloat> %120, i32 0
  %128 = extractelement <2 x bfloat> %120, i32 1
  %129 = extractelement <2 x bfloat> %122, i32 0
  %130 = extractelement <2 x bfloat> %122, i32 1
  %131 = extractelement <2 x bfloat> %124, i32 0
  %132 = extractelement <2 x bfloat> %124, i32 1
  %133 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %108)
  %134 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109)
  %135 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110)
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = getelementptr bfloat, ptr addrspace(1) %2, i64 %77
  %150 = getelementptr bfloat, ptr addrspace(1) %149, i64 %95
  %151 = getelementptr bfloat, ptr addrspace(1) %149, i64 %96
  %152 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %150)
  %153 = extractvalue { i32, i32, i32, i32 } %152, 0
  %154 = bitcast i32 %153 to <2 x bfloat>
  %155 = extractvalue { i32, i32, i32, i32 } %152, 1
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %152, 2
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractvalue { i32, i32, i32, i32 } %152, 3
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractelement <2 x bfloat> %154, i32 0
  %162 = extractelement <2 x bfloat> %154, i32 1
  %163 = extractelement <2 x bfloat> %156, i32 0
  %164 = extractelement <2 x bfloat> %156, i32 1
  %165 = extractelement <2 x bfloat> %158, i32 0
  %166 = extractelement <2 x bfloat> %158, i32 1
  %167 = extractelement <2 x bfloat> %160, i32 0
  %168 = extractelement <2 x bfloat> %160, i32 1
  %169 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %151)
  %170 = extractvalue { i32, i32, i32, i32 } %169, 0
  %171 = bitcast i32 %170 to <2 x bfloat>
  %172 = extractvalue { i32, i32, i32, i32 } %169, 1
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %169, 2
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %169, 3
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractelement <2 x bfloat> %171, i32 0
  %179 = extractelement <2 x bfloat> %171, i32 1
  %180 = extractelement <2 x bfloat> %173, i32 0
  %181 = extractelement <2 x bfloat> %173, i32 1
  %182 = extractelement <2 x bfloat> %175, i32 0
  %183 = extractelement <2 x bfloat> %175, i32 1
  %184 = extractelement <2 x bfloat> %177, i32 0
  %185 = extractelement <2 x bfloat> %177, i32 1
  %186 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %161)
  %187 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %162)
  %188 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163)
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = fadd float %133, %186
  %203 = fadd float %134, %187
  %204 = fadd float %135, %188
  %205 = fadd float %136, %189
  %206 = fadd float %137, %190
  %207 = fadd float %138, %191
  %208 = fadd float %139, %192
  %209 = fadd float %140, %193
  %210 = fadd float %141, %194
  %211 = fadd float %142, %195
  %212 = fadd float %143, %196
  %213 = fadd float %144, %197
  %214 = fadd float %145, %198
  %215 = fadd float %146, %199
  %216 = fadd float %147, %200
  %217 = fadd float %148, %201
  %218 = fmul float %202, %202
  %219 = fmul float %203, %203
  %220 = fmul float %204, %204
  %221 = fmul float %205, %205
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
  %234 = fadd float %218, %219
  %235 = fadd float %234, %220
  %236 = fadd float %235, %221
  %237 = fadd float %236, %222
  %238 = fadd float %237, %223
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
  %249 = bitcast float %248 to i32
  %250 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %249, i32 16, i32 31)
  %251 = bitcast i32 %250 to float
  %252 = fadd float %248, %251
  %253 = bitcast float %252 to i32
  %254 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 8, i32 31)
  %255 = bitcast i32 %254 to float
  %256 = fadd float %252, %255
  %257 = bitcast float %256 to i32
  %258 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %257, i32 4, i32 31)
  %259 = bitcast i32 %258 to float
  %260 = fadd float %256, %259
  %261 = bitcast float %260 to i32
  %262 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %261, i32 2, i32 31)
  %263 = bitcast i32 %262 to float
  %264 = fadd float %260, %263
  %265 = bitcast float %264 to i32
  %266 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %265, i32 1, i32 31)
  %267 = bitcast i32 %266 to float
  %268 = fadd float %264, %267
  %269 = urem i32 %15, 32
  %270 = urem i32 %16, 2
  %271 = icmp eq i32 %269, 0
  %272 = and i1 true, %271
  %273 = add i32 0, %270
  %274 = getelementptr float, ptr addrspace(3) @global_smem, i32 %273
  %275 = insertelement <1 x float> undef, float %268, i32 0
  %276 = extractelement <1 x float> %275, i32 0
  %277 = bitcast float %276 to i32
  %278 = insertelement <1 x i32> undef, i32 %277, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %274, <1 x i32> %278, i1 %272)
  call void @llvm.nvvm.barrier0()
  %279 = icmp slt i32 %14, 2
  %280 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %281 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %280, i1 %279)
  %282 = insertelement <1 x i32> undef, i32 %281, i32 0
  %283 = extractelement <1 x i32> %282, i32 0
  %284 = bitcast i32 %283 to float
  %285 = insertelement <1 x float> undef, float %284, i32 0
  %286 = extractelement <1 x float> %285, i32 0
  %287 = bitcast float %286 to i32
  %288 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %287, i32 1, i32 31)
  %289 = bitcast i32 %288 to float
  %290 = fadd float %286, %289
  %291 = urem i32 %15, 2
  %292 = icmp eq i32 %291, 0
  %293 = and i1 %279, %292
  %294 = insertelement <1 x float> undef, float %290, i32 0
  %295 = extractelement <1 x float> %294, i32 0
  %296 = bitcast float %295 to i32
  %297 = insertelement <1 x i32> undef, i32 %296, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %280, <1 x i32> %297, i1 %293)
  call void @llvm.nvvm.barrier0()
  %298 = load float, ptr addrspace(3) @global_smem, align 4
  %299 = fmul float %298, 0x3F50000000000000
  %300 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %301 = bitcast i32 %300 to <1 x float>
  %302 = extractelement <1 x float> %301, i32 0
  %303 = fadd float %299, %302
  %304 = call float @__nv_rsqrtf(float %303)
  %305 = fmul float %73, %304
  %306 = fmul float %74, %304
  %307 = fmul float %75, %304
  %308 = fmul float %76, %304
  %309 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
  %310 = getelementptr bfloat, ptr addrspace(1) %309, i64 %43
  %311 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %310)
  %312 = extractvalue { i32, i32 } %311, 0
  %313 = bitcast i32 %312 to <2 x bfloat>
  %314 = extractvalue { i32, i32 } %311, 1
  %315 = bitcast i32 %314 to <2 x bfloat>
  %316 = extractelement <2 x bfloat> %313, i32 0
  %317 = extractelement <2 x bfloat> %313, i32 1
  %318 = extractelement <2 x bfloat> %315, i32 0
  %319 = extractelement <2 x bfloat> %315, i32 1
  %320 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316)
  %321 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317)
  %322 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318)
  %323 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319)
  %324 = fmul float %305, %320
  %325 = fmul float %306, %321
  %326 = fmul float %307, %322
  %327 = fmul float %308, %323
  %328 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %324)
  %329 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %325)
  %330 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %326)
  %331 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %327)
  %332 = getelementptr bfloat, ptr addrspace(1) %5, i64 %12
  %333 = getelementptr bfloat, ptr addrspace(1) %332, i64 %43
  %334 = insertelement <2 x bfloat> undef, bfloat %328, i32 0
  %335 = insertelement <2 x bfloat> %334, bfloat %329, i32 1
  %336 = bitcast <2 x bfloat> %335 to i32
  %337 = insertelement <2 x bfloat> undef, bfloat %330, i32 0
  %338 = insertelement <2 x bfloat> %337, bfloat %331, i32 1
  %339 = bitcast <2 x bfloat> %338 to i32
  call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %336, i32 %339, ptr addrspace(1) %333)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_convert_fusion(ptr noalias align 128 dereferenceable(393216) %0, ptr noalias align 128 dereferenceable(196608) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_param_0_108(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_param_0_108(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_25_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_25(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 1024
  %11 = getelementptr bfloat, ptr addrspace(1) %4, i64 %10
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
  %97 = getelementptr bfloat, ptr addrspace(1) %3, i64 %10
  %98 = getelementptr bfloat, ptr addrspace(1) %97, i64 %43
  %99 = getelementptr bfloat, ptr addrspace(1) %97, i64 %44
  %100 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %98)
  %101 = extractvalue { i32, i32, i32, i32 } %100, 0
  %102 = bitcast i32 %101 to <2 x bfloat>
  %103 = extractvalue { i32, i32, i32, i32 } %100, 1
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractvalue { i32, i32, i32, i32 } %100, 2
  %106 = bitcast i32 %105 to <2 x bfloat>
  %107 = extractvalue { i32, i32, i32, i32 } %100, 3
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractelement <2 x bfloat> %102, i32 0
  %110 = extractelement <2 x bfloat> %102, i32 1
  %111 = extractelement <2 x bfloat> %104, i32 0
  %112 = extractelement <2 x bfloat> %104, i32 1
  %113 = extractelement <2 x bfloat> %106, i32 0
  %114 = extractelement <2 x bfloat> %106, i32 1
  %115 = extractelement <2 x bfloat> %108, i32 0
  %116 = extractelement <2 x bfloat> %108, i32 1
  %117 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %99)
  %118 = extractvalue { i32, i32, i32, i32 } %117, 0
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractvalue { i32, i32, i32, i32 } %117, 1
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractvalue { i32, i32, i32, i32 } %117, 2
  %123 = bitcast i32 %122 to <2 x bfloat>
  %124 = extractvalue { i32, i32, i32, i32 } %117, 3
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractelement <2 x bfloat> %119, i32 0
  %127 = extractelement <2 x bfloat> %119, i32 1
  %128 = extractelement <2 x bfloat> %121, i32 0
  %129 = extractelement <2 x bfloat> %121, i32 1
  %130 = extractelement <2 x bfloat> %123, i32 0
  %131 = extractelement <2 x bfloat> %123, i32 1
  %132 = extractelement <2 x bfloat> %125, i32 0
  %133 = extractelement <2 x bfloat> %125, i32 1
  %134 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109)
  %135 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110)
  %136 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111)
  %137 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112)
  %138 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113)
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = getelementptr bfloat, ptr addrspace(1) %2, i64 %10
  %151 = getelementptr bfloat, ptr addrspace(1) %150, i64 %43
  %152 = getelementptr bfloat, ptr addrspace(1) %150, i64 %44
  %153 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %151)
  %154 = extractvalue { i32, i32, i32, i32 } %153, 0
  %155 = bitcast i32 %154 to <2 x bfloat>
  %156 = extractvalue { i32, i32, i32, i32 } %153, 1
  %157 = bitcast i32 %156 to <2 x bfloat>
  %158 = extractvalue { i32, i32, i32, i32 } %153, 2
  %159 = bitcast i32 %158 to <2 x bfloat>
  %160 = extractvalue { i32, i32, i32, i32 } %153, 3
  %161 = bitcast i32 %160 to <2 x bfloat>
  %162 = extractelement <2 x bfloat> %155, i32 0
  %163 = extractelement <2 x bfloat> %155, i32 1
  %164 = extractelement <2 x bfloat> %157, i32 0
  %165 = extractelement <2 x bfloat> %157, i32 1
  %166 = extractelement <2 x bfloat> %159, i32 0
  %167 = extractelement <2 x bfloat> %159, i32 1
  %168 = extractelement <2 x bfloat> %161, i32 0
  %169 = extractelement <2 x bfloat> %161, i32 1
  %170 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %152)
  %171 = extractvalue { i32, i32, i32, i32 } %170, 0
  %172 = bitcast i32 %171 to <2 x bfloat>
  %173 = extractvalue { i32, i32, i32, i32 } %170, 1
  %174 = bitcast i32 %173 to <2 x bfloat>
  %175 = extractvalue { i32, i32, i32, i32 } %170, 2
  %176 = bitcast i32 %175 to <2 x bfloat>
  %177 = extractvalue { i32, i32, i32, i32 } %170, 3
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractelement <2 x bfloat> %172, i32 0
  %180 = extractelement <2 x bfloat> %172, i32 1
  %181 = extractelement <2 x bfloat> %174, i32 0
  %182 = extractelement <2 x bfloat> %174, i32 1
  %183 = extractelement <2 x bfloat> %176, i32 0
  %184 = extractelement <2 x bfloat> %176, i32 1
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %162)
  %188 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163)
  %189 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164)
  %190 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165)
  %191 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166)
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = fadd float %134, %187
  %204 = fadd float %135, %188
  %205 = fadd float %136, %189
  %206 = fadd float %137, %190
  %207 = fadd float %138, %191
  %208 = fadd float %139, %192
  %209 = fadd float %140, %193
  %210 = fadd float %141, %194
  %211 = fadd float %142, %195
  %212 = fadd float %143, %196
  %213 = fadd float %144, %197
  %214 = fadd float %145, %198
  %215 = fadd float %146, %199
  %216 = fadd float %147, %200
  %217 = fadd float %148, %201
  %218 = fadd float %149, %202
  %219 = fadd float %81, %203
  %220 = fadd float %82, %204
  %221 = fadd float %83, %205
  %222 = fadd float %84, %206
  %223 = fadd float %85, %207
  %224 = fadd float %86, %208
  %225 = fadd float %87, %209
  %226 = fadd float %88, %210
  %227 = fadd float %89, %211
  %228 = fadd float %90, %212
  %229 = fadd float %91, %213
  %230 = fadd float %92, %214
  %231 = fadd float %93, %215
  %232 = fadd float %94, %216
  %233 = fadd float %95, %217
  %234 = fadd float %96, %218
  %235 = fmul float %219, %219
  %236 = fmul float %220, %220
  %237 = fmul float %221, %221
  %238 = fmul float %222, %222
  %239 = fmul float %223, %223
  %240 = fmul float %224, %224
  %241 = fmul float %225, %225
  %242 = fmul float %226, %226
  %243 = fmul float %227, %227
  %244 = fmul float %228, %228
  %245 = fmul float %229, %229
  %246 = fmul float %230, %230
  %247 = fmul float %231, %231
  %248 = fmul float %232, %232
  %249 = fmul float %233, %233
  %250 = fmul float %234, %234
  %251 = fadd float %235, %236
  %252 = fadd float %251, %237
  %253 = fadd float %252, %238
  %254 = fadd float %253, %239
  %255 = fadd float %254, %240
  %256 = fadd float %255, %241
  %257 = fadd float %256, %242
  %258 = fadd float %257, %243
  %259 = fadd float %258, %244
  %260 = fadd float %259, %245
  %261 = fadd float %260, %246
  %262 = fadd float %261, %247
  %263 = fadd float %262, %248
  %264 = fadd float %263, %249
  %265 = fadd float %264, %250
  %266 = bitcast float %265 to i32
  %267 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %266, i32 16, i32 31)
  %268 = bitcast i32 %267 to float
  %269 = fadd float %265, %268
  %270 = bitcast float %269 to i32
  %271 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %270, i32 8, i32 31)
  %272 = bitcast i32 %271 to float
  %273 = fadd float %269, %272
  %274 = bitcast float %273 to i32
  %275 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %274, i32 4, i32 31)
  %276 = bitcast i32 %275 to float
  %277 = fadd float %273, %276
  %278 = bitcast float %277 to i32
  %279 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %278, i32 2, i32 31)
  %280 = bitcast i32 %279 to float
  %281 = fadd float %277, %280
  %282 = bitcast float %281 to i32
  %283 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %282, i32 1, i32 31)
  %284 = bitcast i32 %283 to float
  %285 = fadd float %281, %284
  %286 = urem i32 %13, 32
  %287 = urem i32 %14, 2
  %288 = icmp eq i32 %286, 0
  %289 = and i1 true, %288
  %290 = add i32 0, %287
  %291 = getelementptr float, ptr addrspace(3) @global_smem, i32 %290
  %292 = insertelement <1 x float> undef, float %285, i32 0
  %293 = extractelement <1 x float> %292, i32 0
  %294 = bitcast float %293 to i32
  %295 = insertelement <1 x i32> undef, i32 %294, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %291, <1 x i32> %295, i1 %289)
  call void @llvm.nvvm.barrier0()
  %296 = icmp slt i32 %12, 2
  %297 = getelementptr float, ptr addrspace(3) @global_smem, i32 %12
  %298 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %297, i1 %296)
  %299 = insertelement <1 x i32> undef, i32 %298, i32 0
  %300 = extractelement <1 x i32> %299, i32 0
  %301 = bitcast i32 %300 to float
  %302 = insertelement <1 x float> undef, float %301, i32 0
  %303 = extractelement <1 x float> %302, i32 0
  %304 = bitcast float %303 to i32
  %305 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %304, i32 1, i32 31)
  %306 = bitcast i32 %305 to float
  %307 = fadd float %303, %306
  %308 = urem i32 %13, 2
  %309 = icmp eq i32 %308, 0
  %310 = and i1 %296, %309
  %311 = insertelement <1 x float> undef, float %307, i32 0
  %312 = extractelement <1 x float> %311, i32 0
  %313 = bitcast float %312 to i32
  %314 = insertelement <1 x i32> undef, i32 %313, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %297, <1 x i32> %314, i1 %310)
  call void @llvm.nvvm.barrier0()
  %315 = load float, ptr addrspace(3) @global_smem, align 4
  %316 = fmul float %315, 0x3F50000000000000
  %317 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %318 = bitcast i32 %317 to <1 x float>
  %319 = extractelement <1 x float> %318, i32 0
  %320 = fadd float %316, %319
  %321 = call float @__nv_rsqrtf(float %320)
  %322 = fmul float %219, %321
  %323 = fmul float %220, %321
  %324 = fmul float %221, %321
  %325 = fmul float %222, %321
  %326 = fmul float %223, %321
  %327 = fmul float %224, %321
  %328 = fmul float %225, %321
  %329 = fmul float %226, %321
  %330 = fmul float %227, %321
  %331 = fmul float %228, %321
  %332 = fmul float %229, %321
  %333 = fmul float %230, %321
  %334 = fmul float %231, %321
  %335 = fmul float %232, %321
  %336 = fmul float %233, %321
  %337 = fmul float %234, %321
  %338 = getelementptr bfloat, ptr addrspace(1) %5, i64 %43
  %339 = getelementptr bfloat, ptr addrspace(1) %5, i64 %44
  %340 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338)
  %341 = extractvalue { i32, i32, i32, i32 } %340, 0
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %340, 1
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %340, 2
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractvalue { i32, i32, i32, i32 } %340, 3
  %348 = bitcast i32 %347 to <2 x bfloat>
  %349 = extractelement <2 x bfloat> %342, i32 0
  %350 = extractelement <2 x bfloat> %342, i32 1
  %351 = extractelement <2 x bfloat> %344, i32 0
  %352 = extractelement <2 x bfloat> %344, i32 1
  %353 = extractelement <2 x bfloat> %346, i32 0
  %354 = extractelement <2 x bfloat> %346, i32 1
  %355 = extractelement <2 x bfloat> %348, i32 0
  %356 = extractelement <2 x bfloat> %348, i32 1
  %357 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339)
  %358 = extractvalue { i32, i32, i32, i32 } %357, 0
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %357, 1
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %357, 2
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractvalue { i32, i32, i32, i32 } %357, 3
  %365 = bitcast i32 %364 to <2 x bfloat>
  %366 = extractelement <2 x bfloat> %359, i32 0
  %367 = extractelement <2 x bfloat> %359, i32 1
  %368 = extractelement <2 x bfloat> %361, i32 0
  %369 = extractelement <2 x bfloat> %361, i32 1
  %370 = extractelement <2 x bfloat> %363, i32 0
  %371 = extractelement <2 x bfloat> %363, i32 1
  %372 = extractelement <2 x bfloat> %365, i32 0
  %373 = extractelement <2 x bfloat> %365, i32 1
  %374 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %375 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %376 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %377 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %378 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %379 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %380 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %381 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %382 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366)
  %383 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367)
  %384 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368)
  %385 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369)
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373)
  %390 = fmul float %322, %374
  %391 = fmul float %323, %375
  %392 = fmul float %324, %376
  %393 = fmul float %325, %377
  %394 = fmul float %326, %378
  %395 = fmul float %327, %379
  %396 = fmul float %328, %380
  %397 = fmul float %329, %381
  %398 = fmul float %330, %382
  %399 = fmul float %331, %383
  %400 = fmul float %332, %384
  %401 = fmul float %333, %385
  %402 = fmul float %334, %386
  %403 = fmul float %335, %387
  %404 = fmul float %336, %388
  %405 = fmul float %337, %389
  %406 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %390)
  %407 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %391)
  %408 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %392)
  %409 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %393)
  %410 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %394)
  %411 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %395)
  %412 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %396)
  %413 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %397)
  %414 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %398)
  %415 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %399)
  %416 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %400)
  %417 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %401)
  %418 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %402)
  %419 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %403)
  %420 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %404)
  %421 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %405)
  %422 = getelementptr bfloat, ptr addrspace(1) %6, i64 %10
  %423 = getelementptr bfloat, ptr addrspace(1) %422, i64 %43
  %424 = getelementptr bfloat, ptr addrspace(1) %422, i64 %44
  %425 = insertelement <2 x bfloat> undef, bfloat %406, i32 0
  %426 = insertelement <2 x bfloat> %425, bfloat %407, i32 1
  %427 = bitcast <2 x bfloat> %426 to i32
  %428 = insertelement <2 x bfloat> undef, bfloat %408, i32 0
  %429 = insertelement <2 x bfloat> %428, bfloat %409, i32 1
  %430 = bitcast <2 x bfloat> %429 to i32
  %431 = insertelement <2 x bfloat> undef, bfloat %410, i32 0
  %432 = insertelement <2 x bfloat> %431, bfloat %411, i32 1
  %433 = bitcast <2 x bfloat> %432 to i32
  %434 = insertelement <2 x bfloat> undef, bfloat %412, i32 0
  %435 = insertelement <2 x bfloat> %434, bfloat %413, i32 1
  %436 = bitcast <2 x bfloat> %435 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %427, i32 %430, i32 %433, i32 %436, ptr addrspace(1) %423)
  %437 = insertelement <2 x bfloat> undef, bfloat %414, i32 0
  %438 = insertelement <2 x bfloat> %437, bfloat %415, i32 1
  %439 = bitcast <2 x bfloat> %438 to i32
  %440 = insertelement <2 x bfloat> undef, bfloat %416, i32 0
  %441 = insertelement <2 x bfloat> %440, bfloat %417, i32 1
  %442 = bitcast <2 x bfloat> %441 to i32
  %443 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %444 = insertelement <2 x bfloat> %443, bfloat %419, i32 1
  %445 = bitcast <2 x bfloat> %444 to i32
  %446 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %447 = insertelement <2 x bfloat> %446, bfloat %421, i32 1
  %448 = bitcast <2 x bfloat> %447 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %439, i32 %442, i32 %445, i32 %448, ptr addrspace(1) %424)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(262144) %0, ptr noalias align 128 dereferenceable(65536) %1) #0 {
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

declare ptx_kernel void @fusion_21_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_21(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = urem i64 %7, 2
  %9 = mul i64 %8, 512
  %10 = udiv i64 %7, 2
  %11 = mul i64 %10, 4096
  %12 = add i64 %9, %11
  %13 = add i64 %12, 2048
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
  %43 = add i32 %42, 0
  %44 = sext i32 %43 to i64
  %45 = getelementptr bfloat, ptr addrspace(1) %14, i64 %44
  %46 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %45)
  %47 = extractvalue { i32, i32, i32, i32 } %46, 0
  %48 = bitcast i32 %47 to <2 x bfloat>
  %49 = extractvalue { i32, i32, i32, i32 } %46, 1
  %50 = bitcast i32 %49 to <2 x bfloat>
  %51 = extractvalue { i32, i32, i32, i32 } %46, 2
  %52 = bitcast i32 %51 to <2 x bfloat>
  %53 = extractvalue { i32, i32, i32, i32 } %46, 3
  %54 = bitcast i32 %53 to <2 x bfloat>
  %55 = extractelement <2 x bfloat> %48, i32 0
  %56 = extractelement <2 x bfloat> %48, i32 1
  %57 = extractelement <2 x bfloat> %50, i32 0
  %58 = extractelement <2 x bfloat> %50, i32 1
  %59 = extractelement <2 x bfloat> %52, i32 0
  %60 = extractelement <2 x bfloat> %52, i32 1
  %61 = extractelement <2 x bfloat> %54, i32 0
  %62 = extractelement <2 x bfloat> %54, i32 1
  %63 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55)
  %64 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56)
  %65 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57)
  %66 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %58)
  %67 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %59)
  %68 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %69 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %70 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %71 = fmul float %63, %63
  %72 = fmul float %64, %64
  %73 = fmul float %65, %65
  %74 = fmul float %66, %66
  %75 = fmul float %67, %67
  %76 = fmul float %68, %68
  %77 = fmul float %69, %69
  %78 = fmul float %70, %70
  %79 = fadd float %71, %72
  %80 = fadd float %79, %73
  %81 = fadd float %80, %74
  %82 = fadd float %81, %75
  %83 = fadd float %82, %76
  %84 = fadd float %83, %77
  %85 = fadd float %84, %78
  %86 = bitcast float %85 to i32
  %87 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %86, i32 8, i32 31)
  %88 = bitcast i32 %87 to float
  %89 = fadd float %85, %88
  %90 = bitcast float %89 to i32
  %91 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %90, i32 4, i32 31)
  %92 = bitcast i32 %91 to float
  %93 = fadd float %89, %92
  %94 = bitcast float %93 to i32
  %95 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %94, i32 2, i32 31)
  %96 = bitcast i32 %95 to float
  %97 = fadd float %93, %96
  %98 = bitcast float %97 to i32
  %99 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %98, i32 1, i32 31)
  %100 = bitcast i32 %99 to float
  %101 = fadd float %97, %100
  %102 = fmul float %101, 7.812500e-03
  %103 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %104 = bitcast i32 %103 to <1 x float>
  %105 = extractelement <1 x float> %104, i32 0
  %106 = fadd float %102, %105
  %107 = call float @__nv_rsqrtf(float %106)
  %108 = fmul float %63, %107
  %109 = fmul float %64, %107
  %110 = fmul float %65, %107
  %111 = fmul float %66, %107
  %112 = fmul float %67, %107
  %113 = fmul float %68, %107
  %114 = fmul float %69, %107
  %115 = fmul float %70, %107
  %116 = select i1 %19, i32 0, i32 2
  %117 = xor i32 0, %116
  %118 = select i1 %23, i32 0, i32 4
  %119 = xor i32 %117, %118
  %120 = select i1 %27, i32 0, i32 8
  %121 = xor i32 %119, %120
  %122 = select i1 %31, i32 0, i32 16
  %123 = xor i32 %121, %122
  %124 = select i1 %35, i32 0, i32 32
  %125 = xor i32 %123, %124
  %126 = select i1 %39, i32 0, i32 64
  %127 = xor i32 %125, %126
  %128 = xor i32 %127, 0
  %129 = add i32 %128, 0
  %130 = select i1 %19, i32 0, i32 4
  %131 = xor i32 0, %130
  %132 = select i1 %23, i32 0, i32 8
  %133 = xor i32 %131, %132
  %134 = select i1 %27, i32 0, i32 16
  %135 = xor i32 %133, %134
  %136 = select i1 %31, i32 0, i32 32
  %137 = xor i32 %135, %136
  %138 = select i1 %35, i32 0, i32 64
  %139 = xor i32 %137, %138
  %140 = xor i32 %139, 0
  %141 = add i32 %140, 0
  %142 = sext i32 %129 to i64
  %143 = sext i32 %141 to i64
  %144 = getelementptr bfloat, ptr addrspace(1) %3, i64 %142
  %145 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %144)
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractelement <2 x bfloat> %146, i32 0
  %148 = extractelement <2 x bfloat> %146, i32 1
  %149 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %128
  %150 = insertelement <2 x bfloat> undef, bfloat %147, i32 0
  %151 = insertelement <2 x bfloat> %150, bfloat %148, i32 1
  %152 = extractelement <2 x bfloat> %151, i32 0
  %153 = extractelement <2 x bfloat> %151, i32 1
  %154 = bitcast bfloat %152 to i16
  %155 = bitcast bfloat %153 to i16
  %156 = insertelement <2 x i16> undef, i16 %154, i32 0
  %157 = insertelement <2 x i16> %156, i16 %155, i32 1
  %158 = extractelement <2 x i16> %157, i32 0
  %159 = extractelement <2 x i16> %157, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %149, i16 %158, i16 %159, i1 true)
  call void @llvm.nvvm.barrier0()
  %160 = xor i32 %33, 0
  %161 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %160
  %162 = load <4 x i32>, ptr addrspace(3) %161, align 16
  %163 = extractelement <4 x i32> %162, i32 0
  %164 = extractelement <4 x i32> %162, i32 1
  %165 = extractelement <4 x i32> %162, i32 2
  %166 = extractelement <4 x i32> %162, i32 3
  %167 = insertelement <4 x i32> undef, i32 %163, i32 0
  %168 = insertelement <4 x i32> %167, i32 %164, i32 1
  %169 = insertelement <4 x i32> %168, i32 %165, i32 2
  %170 = insertelement <4 x i32> %169, i32 %166, i32 3
  %171 = extractelement <4 x i32> %170, i32 0
  %172 = extractelement <4 x i32> %170, i32 1
  %173 = extractelement <4 x i32> %170, i32 2
  %174 = extractelement <4 x i32> %170, i32 3
  %175 = bitcast i32 %171 to <2 x i16>
  %176 = extractelement <2 x i16> %175, i32 0
  %177 = extractelement <2 x i16> %175, i32 1
  %178 = bitcast i32 %172 to <2 x i16>
  %179 = extractelement <2 x i16> %178, i32 0
  %180 = extractelement <2 x i16> %178, i32 1
  %181 = bitcast i32 %173 to <2 x i16>
  %182 = extractelement <2 x i16> %181, i32 0
  %183 = extractelement <2 x i16> %181, i32 1
  %184 = bitcast i32 %174 to <2 x i16>
  %185 = extractelement <2 x i16> %184, i32 0
  %186 = extractelement <2 x i16> %184, i32 1
  %187 = insertelement <8 x i16> undef, i16 %176, i32 0
  %188 = insertelement <8 x i16> %187, i16 %177, i32 1
  %189 = insertelement <8 x i16> %188, i16 %179, i32 2
  %190 = insertelement <8 x i16> %189, i16 %180, i32 3
  %191 = insertelement <8 x i16> %190, i16 %182, i32 4
  %192 = insertelement <8 x i16> %191, i16 %183, i32 5
  %193 = insertelement <8 x i16> %192, i16 %185, i32 6
  %194 = insertelement <8 x i16> %193, i16 %186, i32 7
  %195 = extractelement <8 x i16> %194, i32 0
  %196 = extractelement <8 x i16> %194, i32 1
  %197 = extractelement <8 x i16> %194, i32 2
  %198 = extractelement <8 x i16> %194, i32 3
  %199 = extractelement <8 x i16> %194, i32 4
  %200 = extractelement <8 x i16> %194, i32 5
  %201 = extractelement <8 x i16> %194, i32 6
  %202 = extractelement <8 x i16> %194, i32 7
  %203 = bitcast i16 %195 to bfloat
  %204 = bitcast i16 %196 to bfloat
  %205 = bitcast i16 %197 to bfloat
  %206 = bitcast i16 %198 to bfloat
  %207 = bitcast i16 %199 to bfloat
  %208 = bitcast i16 %200 to bfloat
  %209 = bitcast i16 %201 to bfloat
  %210 = bitcast i16 %202 to bfloat
  %211 = insertelement <8 x bfloat> undef, bfloat %203, i32 0
  %212 = insertelement <8 x bfloat> %211, bfloat %204, i32 1
  %213 = insertelement <8 x bfloat> %212, bfloat %205, i32 2
  %214 = insertelement <8 x bfloat> %213, bfloat %206, i32 3
  %215 = insertelement <8 x bfloat> %214, bfloat %207, i32 4
  %216 = insertelement <8 x bfloat> %215, bfloat %208, i32 5
  %217 = insertelement <8 x bfloat> %216, bfloat %209, i32 6
  %218 = insertelement <8 x bfloat> %217, bfloat %210, i32 7
  %219 = extractelement <8 x bfloat> %218, i32 0
  %220 = extractelement <8 x bfloat> %218, i32 1
  %221 = extractelement <8 x bfloat> %218, i32 2
  %222 = extractelement <8 x bfloat> %218, i32 3
  %223 = extractelement <8 x bfloat> %218, i32 4
  %224 = extractelement <8 x bfloat> %218, i32 5
  %225 = extractelement <8 x bfloat> %218, i32 6
  %226 = extractelement <8 x bfloat> %218, i32 7
  %227 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219)
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %230 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %231 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %232 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %233 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %234 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %235 = fmul float %108, %227
  %236 = fmul float %109, %228
  %237 = fmul float %110, %229
  %238 = fmul float %111, %230
  %239 = fmul float %112, %231
  %240 = fmul float %113, %232
  %241 = fmul float %114, %233
  %242 = fmul float %115, %234
  %243 = mul i64 %7, 512
  %244 = getelementptr float, ptr addrspace(1) %4, i64 %243
  %245 = select i1 %39, i32 0, i32 1
  %246 = xor i32 0, %245
  %247 = xor i32 %246, 0
  %248 = xor i32 %246, 2
  %249 = add i32 %247, 0
  %250 = add i32 %248, 0
  %251 = sext i32 %249 to i64
  %252 = sext i32 %250 to i64
  %253 = mul i64 %251, 128
  %254 = mul i64 %252, 128
  %255 = add i64 %253, %143
  %256 = add i64 %254, %143
  %257 = getelementptr float, ptr addrspace(1) %244, i64 %255
  %258 = getelementptr float, ptr addrspace(1) %244, i64 %256
  call void @llvm.nvvm.barrier0()
  %259 = select i1 %39, i32 0, i32 128
  %260 = xor i32 %139, %259
  %261 = lshr i32 %42, 7
  %262 = shl i32 %261, 3
  %263 = add i32 %262, %42
  %264 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %263
  %265 = insertelement <8 x float> undef, float %235, i32 0
  %266 = insertelement <8 x float> %265, float %236, i32 1
  %267 = insertelement <8 x float> %266, float %237, i32 2
  %268 = insertelement <8 x float> %267, float %238, i32 3
  %269 = insertelement <8 x float> %268, float %239, i32 4
  %270 = insertelement <8 x float> %269, float %240, i32 5
  %271 = insertelement <8 x float> %270, float %241, i32 6
  %272 = insertelement <8 x float> %271, float %242, i32 7
  %273 = extractelement <8 x float> %272, i32 0
  %274 = extractelement <8 x float> %272, i32 1
  %275 = extractelement <8 x float> %272, i32 2
  %276 = extractelement <8 x float> %272, i32 3
  %277 = extractelement <8 x float> %272, i32 4
  %278 = extractelement <8 x float> %272, i32 5
  %279 = extractelement <8 x float> %272, i32 6
  %280 = extractelement <8 x float> %272, i32 7
  %281 = bitcast float %273 to i32
  %282 = bitcast float %274 to i32
  %283 = bitcast float %275 to i32
  %284 = bitcast float %276 to i32
  %285 = bitcast float %277 to i32
  %286 = bitcast float %278 to i32
  %287 = bitcast float %279 to i32
  %288 = bitcast float %280 to i32
  %289 = insertelement <8 x i32> undef, i32 %281, i32 0
  %290 = insertelement <8 x i32> %289, i32 %282, i32 1
  %291 = insertelement <8 x i32> %290, i32 %283, i32 2
  %292 = insertelement <8 x i32> %291, i32 %284, i32 3
  %293 = insertelement <8 x i32> %292, i32 %285, i32 4
  %294 = insertelement <8 x i32> %293, i32 %286, i32 5
  %295 = insertelement <8 x i32> %294, i32 %287, i32 6
  %296 = insertelement <8 x i32> %295, i32 %288, i32 7
  %297 = extractelement <8 x i32> %296, i32 0
  %298 = extractelement <8 x i32> %296, i32 1
  %299 = extractelement <8 x i32> %296, i32 2
  %300 = extractelement <8 x i32> %296, i32 3
  %301 = extractelement <8 x i32> %296, i32 4
  %302 = extractelement <8 x i32> %296, i32 5
  %303 = extractelement <8 x i32> %296, i32 6
  %304 = extractelement <8 x i32> %296, i32 7
  %305 = insertelement <4 x i32> undef, i32 %297, i32 0
  %306 = insertelement <4 x i32> %305, i32 %298, i32 1
  %307 = insertelement <4 x i32> %306, i32 %299, i32 2
  %308 = insertelement <4 x i32> %307, i32 %300, i32 3
  %309 = extractelement <4 x i32> %308, i32 0
  %310 = extractelement <4 x i32> %308, i32 1
  %311 = extractelement <4 x i32> %308, i32 2
  %312 = extractelement <4 x i32> %308, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %264, i32 %309, i32 %310, i32 %311, i32 %312, i1 true)
  %313 = getelementptr inbounds i32, ptr addrspace(3) %264, i32 4
  %314 = insertelement <4 x i32> undef, i32 %301, i32 0
  %315 = insertelement <4 x i32> %314, i32 %302, i32 1
  %316 = insertelement <4 x i32> %315, i32 %303, i32 2
  %317 = insertelement <4 x i32> %316, i32 %304, i32 3
  %318 = extractelement <4 x i32> %317, i32 0
  %319 = extractelement <4 x i32> %317, i32 1
  %320 = extractelement <4 x i32> %317, i32 2
  %321 = extractelement <4 x i32> %317, i32 3
  call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %313, i32 %318, i32 %319, i32 %320, i32 %321, i1 true)
  call void @llvm.nvvm.barrier0()
  %322 = xor i32 %260, 0
  %323 = lshr i32 %322, 7
  %324 = shl i32 %323, 3
  %325 = add i32 %324, %322
  %326 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %325
  %327 = load <4 x i32>, ptr addrspace(3) %326, align 16
  %328 = extractelement <4 x i32> %327, i32 0
  %329 = extractelement <4 x i32> %327, i32 1
  %330 = extractelement <4 x i32> %327, i32 2
  %331 = extractelement <4 x i32> %327, i32 3
  %332 = insertelement <4 x i32> undef, i32 %328, i32 0
  %333 = insertelement <4 x i32> %332, i32 %329, i32 1
  %334 = insertelement <4 x i32> %333, i32 %330, i32 2
  %335 = insertelement <4 x i32> %334, i32 %331, i32 3
  %336 = extractelement <4 x i32> %335, i32 0
  %337 = extractelement <4 x i32> %335, i32 1
  %338 = extractelement <4 x i32> %335, i32 2
  %339 = extractelement <4 x i32> %335, i32 3
  %340 = bitcast i32 %336 to float
  %341 = bitcast i32 %337 to float
  %342 = bitcast i32 %338 to float
  %343 = bitcast i32 %339 to float
  %344 = insertelement <4 x float> undef, float %340, i32 0
  %345 = insertelement <4 x float> %344, float %341, i32 1
  %346 = insertelement <4 x float> %345, float %342, i32 2
  %347 = insertelement <4 x float> %346, float %343, i32 3
  %348 = extractelement <4 x float> %347, i32 0
  %349 = extractelement <4 x float> %347, i32 1
  %350 = extractelement <4 x float> %347, i32 2
  %351 = extractelement <4 x float> %347, i32 3
  %352 = xor i32 %260, 256
  %353 = lshr i32 %352, 7
  %354 = shl i32 %353, 3
  %355 = add i32 %354, %352
  %356 = getelementptr inbounds float, ptr addrspace(3) @global_smem, i32 %355
  %357 = load <4 x i32>, ptr addrspace(3) %356, align 16
  %358 = extractelement <4 x i32> %357, i32 0
  %359 = extractelement <4 x i32> %357, i32 1
  %360 = extractelement <4 x i32> %357, i32 2
  %361 = extractelement <4 x i32> %357, i32 3
  %362 = insertelement <4 x i32> undef, i32 %358, i32 0
  %363 = insertelement <4 x i32> %362, i32 %359, i32 1
  %364 = insertelement <4 x i32> %363, i32 %360, i32 2
  %365 = insertelement <4 x i32> %364, i32 %361, i32 3
  %366 = extractelement <4 x i32> %365, i32 0
  %367 = extractelement <4 x i32> %365, i32 1
  %368 = extractelement <4 x i32> %365, i32 2
  %369 = extractelement <4 x i32> %365, i32 3
  %370 = bitcast i32 %366 to float
  %371 = bitcast i32 %367 to float
  %372 = bitcast i32 %368 to float
  %373 = bitcast i32 %369 to float
  %374 = insertelement <4 x float> undef, float %370, i32 0
  %375 = insertelement <4 x float> %374, float %371, i32 1
  %376 = insertelement <4 x float> %375, float %372, i32 2
  %377 = insertelement <4 x float> %376, float %373, i32 3
  %378 = extractelement <4 x float> %377, i32 0
  %379 = extractelement <4 x float> %377, i32 1
  %380 = extractelement <4 x float> %377, i32 2
  %381 = extractelement <4 x float> %377, i32 3
  %382 = insertelement <1 x float> undef, float %348, i32 0
  %383 = bitcast <1 x float> %382 to i32
  %384 = insertelement <1 x float> undef, float %349, i32 0
  %385 = bitcast <1 x float> %384 to i32
  %386 = insertelement <1 x float> undef, float %350, i32 0
  %387 = bitcast <1 x float> %386 to i32
  %388 = insertelement <1 x float> undef, float %351, i32 0
  %389 = bitcast <1 x float> %388 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %385, i32 %387, i32 %389, ptr addrspace(1) %257)
  %390 = insertelement <1 x float> undef, float %378, i32 0
  %391 = bitcast <1 x float> %390 to i32
  %392 = insertelement <1 x float> undef, float %379, i32 0
  %393 = bitcast <1 x float> %392 to i32
  %394 = insertelement <1 x float> undef, float %380, i32 0
  %395 = bitcast <1 x float> %394 to i32
  %396 = insertelement <1 x float> undef, float %381, i32 0
  %397 = bitcast <1 x float> %396 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %391, i32 %393, i32 %395, i32 %397, ptr addrspace(1) %258)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(131072) %0, ptr noalias align 16 dereferenceable(10485760) %1, ptr noalias align 16 dereferenceable(128) %2, ptr noalias align 128 dereferenceable(65536) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %7 = udiv i32 %6, 4
  %8 = urem i32 %5, 64
  %9 = udiv i32 %5, 64
  %10 = mul i32 %9, 128
  %11 = mul i32 %6, 256
  %12 = add i32 %10, %11
  %13 = add i32 %12, %8
  %14 = getelementptr inbounds float, ptr %0, i32 %13
  %15 = load float, ptr %14, align 4, !invariant.load !3
  %16 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %17 = fmul float %15, %16
  %18 = add i32 %8, 64
  %19 = add i32 %13, 64
  %20 = getelementptr inbounds float, ptr %0, i32 %19
  %21 = load float, ptr %20, align 4, !invariant.load !3
  %22 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %23 = fmul float %21, %22
  %24 = fsub float %17, %23
  %25 = fptrunc float %24 to bfloat
  %26 = getelementptr inbounds bfloat, ptr %3, i32 %13
  store bfloat %25, ptr %26, align 2
  %27 = load float, ptr %20, align 4, !invariant.load !3
  %28 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %8)
  %29 = fmul float %27, %28
  %30 = load float, ptr %14, align 4, !invariant.load !3
  %31 = call float @fused_concatenate_convert_136_7(ptr %0, ptr %1, ptr %2, i32 %7, i32 %18)
  %32 = fmul float %30, %31
  %33 = fadd float %29, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %3, i32 %19
  store bfloat %34, ptr %35, align 2
  ret void
}

define internal float @fused_concatenate_convert_136_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = getelementptr inbounds i32, ptr %2, i32 %3
  %7 = load i32, ptr %6, align 4, !invariant.load !3
  %8 = call i32 @llvm.smin.i32(i32 %7, i32 40959)
  %9 = call i32 @llvm.smax.i32(i32 %8, i32 0)
  %10 = mul i32 %9, 128
  %11 = add i32 %10, %4
  %12 = getelementptr inbounds bfloat, ptr %1, i32 %11
  %13 = load bfloat, ptr %12, align 2, !invariant.load !3
  %14 = fpext bfloat %13 to float
  ret float %14
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
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
!2 = !{i32 0, i32 256}
!3 = !{}
!4 = !{i32 0, i32 768}
!5 = !{i32 0, i32 135456}

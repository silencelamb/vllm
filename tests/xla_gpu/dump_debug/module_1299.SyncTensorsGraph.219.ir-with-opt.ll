; ModuleID = 'SyncTensorsGraph.219'
source_filename = "SyncTensorsGraph.219"
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

define ptx_kernel void @gemm_fusion_dot_29_0(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1) local_unnamed_addr #3 {
  %arg142 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg040 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 16
  %3 = shl nsw i32 %2, 3
  %4 = sub nsw i32 32, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 5
  %9 = sext i32 %8 to i64
  %10 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = icmp samesign ugt i32 %10, 63
  %12 = zext i1 %11 to i64
  %13 = and i32 %10, 1
  %14 = icmp eq i32 %13, 0
  %15 = shl i32 %13, 3
  %16 = and i32 %10, 2
  %17 = icmp eq i32 %16, 0
  %18 = shl i32 %16, 3
  %19 = or disjoint i32 %15, %18
  %20 = and i32 %10, 4
  %.not2 = icmp eq i32 %20, 0
  %21 = shl i32 %20, 3
  %22 = and i32 %10, 8
  %23 = shl i32 %22, 3
  %24 = or disjoint i32 %23, %21
  %25 = or disjoint i32 %24, %19
  %26 = and i32 %10, 16
  %27 = shl i32 %26, 3
  %28 = or disjoint i32 %25, %27
  %29 = shl i32 %10, 3
  %30 = and i32 %29, 256
  %31 = or disjoint i32 %28, %30
  %32 = select i1 %11, i32 520, i32 0
  %33 = xor i32 %31, %32
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %34
  %36 = or disjoint i32 %15, 1040
  %37 = xor i32 %36, %18
  %38 = or disjoint i32 %21, %37
  %39 = or disjoint i32 %38, %23
  %40 = or disjoint i32 %30, %27
  %41 = or disjoint i32 %40, %32
  %42 = xor i32 %41, %39
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %43
  %45 = or disjoint i32 %19, 2080
  %46 = xor i32 %45, %21
  %47 = or disjoint i32 %46, %23
  %48 = xor i32 %41, %47
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %49
  %51 = or disjoint i32 %15, 3120
  %52 = or disjoint i32 %21, %18
  %53 = xor i32 %52, %51
  %54 = or disjoint i32 %53, %23
  %55 = xor i32 %41, %54
  %56 = zext nneg i32 %55 to i64
  %57 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %56
  %58 = or disjoint i32 %25, 4096
  %59 = xor i32 %41, %58
  %60 = zext nneg i32 %59 to i64
  %61 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %60
  %62 = or disjoint i32 %15, 5136
  %63 = xor i32 %62, %18
  %64 = or disjoint i32 %21, %63
  %65 = or disjoint i32 %64, %23
  %66 = xor i32 %41, %65
  %67 = zext nneg i32 %66 to i64
  %68 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %67
  %69 = or disjoint i32 %19, 6176
  %70 = xor i32 %69, %21
  %71 = or disjoint i32 %70, %23
  %72 = xor i32 %41, %71
  %73 = zext nneg i32 %72 to i64
  %74 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %73
  %75 = or disjoint i32 %15, 7216
  %76 = xor i32 %52, %75
  %77 = or disjoint i32 %76, %23
  %78 = xor i32 %41, %77
  %79 = zext nneg i32 %78 to i64
  %80 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %79
  %81 = or disjoint i32 %25, 8192
  %82 = xor i32 %41, %81
  %83 = zext nneg i32 %82 to i64
  %84 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %83
  %85 = or disjoint i32 %15, 9232
  %86 = xor i32 %85, %18
  %87 = or disjoint i32 %21, %86
  %88 = or disjoint i32 %87, %23
  %89 = xor i32 %41, %88
  %90 = zext nneg i32 %89 to i64
  %91 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %90
  %92 = or disjoint i32 %19, 10272
  %93 = xor i32 %92, %21
  %94 = or disjoint i32 %93, %23
  %95 = xor i32 %41, %94
  %96 = zext nneg i32 %95 to i64
  %97 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %96
  %98 = or disjoint i32 %15, 11312
  %99 = xor i32 %52, %98
  %100 = or disjoint i32 %99, %23
  %101 = xor i32 %41, %100
  %102 = zext nneg i32 %101 to i64
  %103 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %102
  %104 = or disjoint i32 %25, 12288
  %105 = xor i32 %41, %104
  %106 = zext nneg i32 %105 to i64
  %107 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %106
  %108 = or disjoint i32 %15, 13328
  %109 = xor i32 %108, %18
  %110 = or disjoint i32 %21, %109
  %111 = or disjoint i32 %110, %23
  %112 = xor i32 %41, %111
  %113 = zext nneg i32 %112 to i64
  %114 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %113
  %115 = or disjoint i32 %19, 14368
  %116 = xor i32 %115, %21
  %117 = or disjoint i32 %116, %23
  %118 = xor i32 %41, %117
  %119 = zext nneg i32 %118 to i64
  %120 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %119
  %121 = or disjoint i32 %15, 15408
  %122 = xor i32 %52, %121
  %123 = or disjoint i32 %122, %23
  %124 = xor i32 %41, %123
  %125 = zext nneg i32 %124 to i64
  %126 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %125
  %127 = select i1 %14, i32 0, i32 520
  %128 = select i1 %17, i32 0, i32 1040
  %129 = or disjoint i32 %127, %128
  %130 = select i1 %.not2, i32 0, i32 2080
  %131 = shl nuw nsw i32 %22, 9
  %132 = or disjoint i32 %130, %131
  %133 = or disjoint i32 %132, %129
  %134 = lshr exact i32 %26, 1
  %135 = xor i32 %133, %134
  %136 = select i1 %11, i32 8192, i32 0
  %137 = or disjoint i32 %135, %136
  %138 = zext nneg i32 %137 to i64
  %139 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %138
  %140 = ptrtoint ptr addrspace(3) %139 to i64
  %141 = trunc i64 %140 to i32
  %142 = or disjoint i32 %127, 16
  %143 = xor i32 %142, %128
  %144 = or disjoint i32 %131, %143
  %145 = or disjoint i32 %144, %130
  %146 = or disjoint i32 %136, %134
  %147 = xor i32 %146, %145
  %148 = zext nneg i32 %147 to i64
  %149 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %148
  %150 = ptrtoint ptr addrspace(3) %149 to i64
  %151 = trunc i64 %150 to i32
  %152 = or disjoint i32 %129, 32
  %153 = xor i32 %152, %130
  %154 = or disjoint i32 %153, %131
  %155 = xor i32 %146, %154
  %156 = zext nneg i32 %155 to i64
  %157 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %156
  %158 = ptrtoint ptr addrspace(3) %157 to i64
  %159 = trunc i64 %158 to i32
  %160 = or disjoint i32 %127, 48
  %161 = or disjoint i32 %130, %128
  %162 = xor i32 %161, %160
  %163 = or disjoint i32 %162, %131
  %164 = xor i32 %146, %163
  %165 = zext nneg i32 %164 to i64
  %166 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %165
  %167 = ptrtoint ptr addrspace(3) %166 to i64
  %168 = trunc i64 %167 to i32
  %169 = or disjoint i32 %133, 64
  %170 = xor i32 %146, %169
  %171 = zext nneg i32 %170 to i64
  %172 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %171
  %173 = ptrtoint ptr addrspace(3) %172 to i64
  %174 = trunc i64 %173 to i32
  %175 = or disjoint i32 %127, 80
  %176 = xor i32 %175, %128
  %177 = or disjoint i32 %131, %176
  %178 = or disjoint i32 %177, %130
  %179 = xor i32 %146, %178
  %180 = zext nneg i32 %179 to i64
  %181 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %180
  %182 = ptrtoint ptr addrspace(3) %181 to i64
  %183 = trunc i64 %182 to i32
  %184 = or disjoint i32 %129, 96
  %185 = xor i32 %184, %130
  %186 = or disjoint i32 %185, %131
  %187 = xor i32 %146, %186
  %188 = zext nneg i32 %187 to i64
  %189 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %188
  %190 = ptrtoint ptr addrspace(3) %189 to i64
  %191 = trunc i64 %190 to i32
  %192 = or disjoint i32 %127, 112
  %193 = xor i32 %161, %192
  %194 = or disjoint i32 %193, %131
  %195 = xor i32 %146, %194
  %196 = zext nneg i32 %195 to i64
  %197 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %196
  %198 = ptrtoint ptr addrspace(3) %197 to i64
  %199 = trunc i64 %198 to i32
  %200 = or disjoint i32 %133, 128
  %201 = xor i32 %146, %200
  %202 = zext nneg i32 %201 to i64
  %203 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %202
  %204 = ptrtoint ptr addrspace(3) %203 to i64
  %205 = trunc i64 %204 to i32
  %206 = or disjoint i32 %127, 144
  %207 = xor i32 %206, %128
  %208 = or disjoint i32 %131, %207
  %209 = or disjoint i32 %208, %130
  %210 = xor i32 %146, %209
  %211 = zext nneg i32 %210 to i64
  %212 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %211
  %213 = ptrtoint ptr addrspace(3) %212 to i64
  %214 = trunc i64 %213 to i32
  %215 = or disjoint i32 %129, 160
  %216 = xor i32 %215, %130
  %217 = or disjoint i32 %216, %131
  %218 = xor i32 %146, %217
  %219 = zext nneg i32 %218 to i64
  %220 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %219
  %221 = ptrtoint ptr addrspace(3) %220 to i64
  %222 = trunc i64 %221 to i32
  %223 = or disjoint i32 %127, 176
  %224 = xor i32 %161, %223
  %225 = or disjoint i32 %224, %131
  %226 = xor i32 %146, %225
  %227 = zext nneg i32 %226 to i64
  %228 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %227
  %229 = ptrtoint ptr addrspace(3) %228 to i64
  %230 = trunc i64 %229 to i32
  %231 = or disjoint i32 %133, 192
  %232 = xor i32 %146, %231
  %233 = zext nneg i32 %232 to i64
  %234 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %233
  %235 = ptrtoint ptr addrspace(3) %234 to i64
  %236 = trunc i64 %235 to i32
  %237 = or disjoint i32 %127, 208
  %238 = xor i32 %237, %128
  %239 = or disjoint i32 %131, %238
  %240 = or disjoint i32 %239, %130
  %241 = xor i32 %146, %240
  %242 = zext nneg i32 %241 to i64
  %243 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %242
  %244 = ptrtoint ptr addrspace(3) %243 to i64
  %245 = trunc i64 %244 to i32
  %246 = or disjoint i32 %129, 224
  %247 = xor i32 %246, %130
  %248 = or disjoint i32 %247, %131
  %249 = xor i32 %146, %248
  %250 = zext nneg i32 %249 to i64
  %251 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %250
  %252 = ptrtoint ptr addrspace(3) %251 to i64
  %253 = trunc i64 %252 to i32
  %254 = or disjoint i32 %127, 240
  %255 = xor i32 %161, %254
  %256 = or disjoint i32 %255, %131
  %257 = xor i32 %146, %256
  %258 = zext nneg i32 %257 to i64
  %259 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %258
  %260 = ptrtoint ptr addrspace(3) %259 to i64
  %261 = trunc i64 %260 to i32
  %262 = or disjoint i32 %133, 256
  %263 = xor i32 %146, %262
  %264 = zext nneg i32 %263 to i64
  %265 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %264
  %266 = ptrtoint ptr addrspace(3) %265 to i64
  %267 = trunc i64 %266 to i32
  %268 = or disjoint i32 %127, 272
  %269 = xor i32 %268, %128
  %270 = or disjoint i32 %131, %269
  %271 = or disjoint i32 %270, %130
  %272 = xor i32 %146, %271
  %273 = zext nneg i32 %272 to i64
  %274 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %273
  %275 = ptrtoint ptr addrspace(3) %274 to i64
  %276 = trunc i64 %275 to i32
  %277 = or disjoint i32 %129, 288
  %278 = xor i32 %277, %130
  %279 = or disjoint i32 %278, %131
  %280 = xor i32 %146, %279
  %281 = zext nneg i32 %280 to i64
  %282 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %281
  %283 = ptrtoint ptr addrspace(3) %282 to i64
  %284 = trunc i64 %283 to i32
  %285 = or disjoint i32 %127, 304
  %286 = xor i32 %161, %285
  %287 = or disjoint i32 %286, %131
  %288 = xor i32 %146, %287
  %289 = zext nneg i32 %288 to i64
  %290 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %289
  %291 = ptrtoint ptr addrspace(3) %290 to i64
  %292 = trunc i64 %291 to i32
  %293 = or disjoint i32 %133, 320
  %294 = xor i32 %146, %293
  %295 = zext nneg i32 %294 to i64
  %296 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %295
  %297 = ptrtoint ptr addrspace(3) %296 to i64
  %298 = trunc i64 %297 to i32
  %299 = or disjoint i32 %127, 336
  %300 = xor i32 %299, %128
  %301 = or disjoint i32 %131, %300
  %302 = or disjoint i32 %301, %130
  %303 = xor i32 %146, %302
  %304 = zext nneg i32 %303 to i64
  %305 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %304
  %306 = ptrtoint ptr addrspace(3) %305 to i64
  %307 = trunc i64 %306 to i32
  %308 = or disjoint i32 %129, 352
  %309 = xor i32 %308, %130
  %310 = or disjoint i32 %309, %131
  %311 = xor i32 %146, %310
  %312 = zext nneg i32 %311 to i64
  %313 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %312
  %314 = ptrtoint ptr addrspace(3) %313 to i64
  %315 = trunc i64 %314 to i32
  %316 = or disjoint i32 %127, 368
  %317 = xor i32 %161, %316
  %318 = or disjoint i32 %317, %131
  %319 = xor i32 %146, %318
  %320 = zext nneg i32 %319 to i64
  %321 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %320
  %322 = ptrtoint ptr addrspace(3) %321 to i64
  %323 = trunc i64 %322 to i32
  %324 = or disjoint i32 %133, 384
  %325 = xor i32 %146, %324
  %326 = zext nneg i32 %325 to i64
  %327 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %326
  %328 = ptrtoint ptr addrspace(3) %327 to i64
  %329 = trunc i64 %328 to i32
  %330 = or disjoint i32 %127, 400
  %331 = xor i32 %330, %128
  %332 = or disjoint i32 %131, %331
  %333 = or disjoint i32 %332, %130
  %334 = xor i32 %146, %333
  %335 = zext nneg i32 %334 to i64
  %336 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %335
  %337 = ptrtoint ptr addrspace(3) %336 to i64
  %338 = trunc i64 %337 to i32
  %339 = or disjoint i32 %129, 416
  %340 = xor i32 %339, %130
  %341 = or disjoint i32 %340, %131
  %342 = xor i32 %146, %341
  %343 = zext nneg i32 %342 to i64
  %344 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %343
  %345 = ptrtoint ptr addrspace(3) %344 to i64
  %346 = trunc i64 %345 to i32
  %347 = or disjoint i32 %127, 432
  %348 = xor i32 %161, %347
  %349 = or disjoint i32 %348, %131
  %350 = xor i32 %146, %349
  %351 = zext nneg i32 %350 to i64
  %352 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %351
  %353 = ptrtoint ptr addrspace(3) %352 to i64
  %354 = trunc i64 %353 to i32
  %355 = or disjoint i32 %133, 448
  %356 = xor i32 %146, %355
  %357 = zext nneg i32 %356 to i64
  %358 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %357
  %359 = ptrtoint ptr addrspace(3) %358 to i64
  %360 = trunc i64 %359 to i32
  %361 = or disjoint i32 %127, 464
  %362 = xor i32 %361, %128
  %363 = or disjoint i32 %131, %362
  %364 = or disjoint i32 %363, %130
  %365 = xor i32 %146, %364
  %366 = zext nneg i32 %365 to i64
  %367 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %366
  %368 = ptrtoint ptr addrspace(3) %367 to i64
  %369 = trunc i64 %368 to i32
  %370 = or disjoint i32 %129, 480
  %371 = xor i32 %370, %130
  %372 = or disjoint i32 %371, %131
  %373 = xor i32 %146, %372
  %374 = zext nneg i32 %373 to i64
  %375 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %374
  %376 = ptrtoint ptr addrspace(3) %375 to i64
  %377 = trunc i64 %376 to i32
  %378 = or disjoint i32 %127, 496
  %379 = xor i32 %161, %378
  %380 = or disjoint i32 %379, %131
  %381 = xor i32 %146, %380
  %382 = zext nneg i32 %381 to i64
  %383 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %382
  %384 = ptrtoint ptr addrspace(3) %383 to i64
  %385 = trunc i64 %384 to i32
  %386 = add i64 %9, %12
  %387 = shl nsw i64 %386, 12
  %388 = add i32 %30, %27
  %389 = add i32 %388, %23
  %390 = add i32 %389, %21
  %391 = add i32 %390, %18
  %392 = add i32 %391, %15
  %393 = zext nneg i32 %392 to i64
  %394 = shl nuw nsw i64 %393, 1
  %395 = add i64 %387, %394
  %396 = add i64 %395, 122880
  %scevgep = getelementptr i8, ptr addrspace(1) %arg040, i64 %396
  br label %397

397:                                              ; preds = %0, %397
  %lsr.iv44 = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep45, %397 ]
  %lsr.iv = phi i32 [ -512, %0 ], [ %lsr.iv.next, %397 ]
  %398 = phi { float, float, float, float } [ zeroinitializer, %0 ], [ %950, %397 ]
  %scevgep60 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -122880
  %scevgep59 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -114688
  %scevgep58 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -106496
  %scevgep57 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -98304
  %scevgep56 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -90112
  %scevgep55 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -81920
  %scevgep54 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -73728
  %scevgep53 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -65536
  %scevgep52 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -57344
  %scevgep51 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -49152
  %scevgep50 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -40960
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -32768
  %scevgep48 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -24576
  %scevgep47 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -16384
  %scevgep46 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 -8192
  %399 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep60) #9
  %400 = extractvalue { i32, i32, i32, i32 } %399, 0
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractvalue { i32, i32, i32, i32 } %399, 1
  %403 = bitcast i32 %402 to <2 x bfloat>
  %404 = extractvalue { i32, i32, i32, i32 } %399, 2
  %405 = bitcast i32 %404 to <2 x bfloat>
  %406 = shufflevector <2 x bfloat> %405, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %407 = extractvalue { i32, i32, i32, i32 } %399, 3
  %408 = bitcast i32 %407 to <2 x bfloat>
  %409 = shufflevector <2 x bfloat> %408, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep59) #9
  %411 = extractvalue { i32, i32, i32, i32 } %410, 0
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %410, 1
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %410, 2
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = shufflevector <2 x bfloat> %416, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %418 = extractvalue { i32, i32, i32, i32 } %410, 3
  %419 = bitcast i32 %418 to <2 x bfloat>
  %420 = shufflevector <2 x bfloat> %419, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %421 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep58) #9
  %422 = extractvalue { i32, i32, i32, i32 } %421, 0
  %423 = bitcast i32 %422 to <2 x bfloat>
  %424 = extractvalue { i32, i32, i32, i32 } %421, 1
  %425 = bitcast i32 %424 to <2 x bfloat>
  %426 = extractvalue { i32, i32, i32, i32 } %421, 2
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = shufflevector <2 x bfloat> %427, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %429 = extractvalue { i32, i32, i32, i32 } %421, 3
  %430 = bitcast i32 %429 to <2 x bfloat>
  %431 = shufflevector <2 x bfloat> %430, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %432 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep57) #9
  %433 = extractvalue { i32, i32, i32, i32 } %432, 0
  %434 = bitcast i32 %433 to <2 x bfloat>
  %435 = extractvalue { i32, i32, i32, i32 } %432, 1
  %436 = bitcast i32 %435 to <2 x bfloat>
  %437 = extractvalue { i32, i32, i32, i32 } %432, 2
  %438 = bitcast i32 %437 to <2 x bfloat>
  %439 = shufflevector <2 x bfloat> %438, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %440 = extractvalue { i32, i32, i32, i32 } %432, 3
  %441 = bitcast i32 %440 to <2 x bfloat>
  %442 = shufflevector <2 x bfloat> %441, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %443 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep56) #9
  %444 = extractvalue { i32, i32, i32, i32 } %443, 0
  %445 = bitcast i32 %444 to <2 x bfloat>
  %446 = extractvalue { i32, i32, i32, i32 } %443, 1
  %447 = bitcast i32 %446 to <2 x bfloat>
  %448 = extractvalue { i32, i32, i32, i32 } %443, 2
  %449 = bitcast i32 %448 to <2 x bfloat>
  %450 = shufflevector <2 x bfloat> %449, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %451 = extractvalue { i32, i32, i32, i32 } %443, 3
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = shufflevector <2 x bfloat> %452, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %454 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep55) #9
  %455 = extractvalue { i32, i32, i32, i32 } %454, 0
  %456 = bitcast i32 %455 to <2 x bfloat>
  %457 = extractvalue { i32, i32, i32, i32 } %454, 1
  %458 = bitcast i32 %457 to <2 x bfloat>
  %459 = extractvalue { i32, i32, i32, i32 } %454, 2
  %460 = bitcast i32 %459 to <2 x bfloat>
  %461 = shufflevector <2 x bfloat> %460, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %462 = extractvalue { i32, i32, i32, i32 } %454, 3
  %463 = bitcast i32 %462 to <2 x bfloat>
  %464 = shufflevector <2 x bfloat> %463, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %465 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep54) #9
  %466 = extractvalue { i32, i32, i32, i32 } %465, 0
  %467 = bitcast i32 %466 to <2 x bfloat>
  %468 = extractvalue { i32, i32, i32, i32 } %465, 1
  %469 = bitcast i32 %468 to <2 x bfloat>
  %470 = extractvalue { i32, i32, i32, i32 } %465, 2
  %471 = bitcast i32 %470 to <2 x bfloat>
  %472 = shufflevector <2 x bfloat> %471, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %473 = extractvalue { i32, i32, i32, i32 } %465, 3
  %474 = bitcast i32 %473 to <2 x bfloat>
  %475 = shufflevector <2 x bfloat> %474, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %476 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep53) #9
  %477 = extractvalue { i32, i32, i32, i32 } %476, 0
  %478 = bitcast i32 %477 to <2 x bfloat>
  %479 = extractvalue { i32, i32, i32, i32 } %476, 1
  %480 = bitcast i32 %479 to <2 x bfloat>
  %481 = extractvalue { i32, i32, i32, i32 } %476, 2
  %482 = bitcast i32 %481 to <2 x bfloat>
  %483 = shufflevector <2 x bfloat> %482, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %484 = extractvalue { i32, i32, i32, i32 } %476, 3
  %485 = bitcast i32 %484 to <2 x bfloat>
  %486 = shufflevector <2 x bfloat> %485, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %487 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep52) #9
  %488 = extractvalue { i32, i32, i32, i32 } %487, 0
  %489 = bitcast i32 %488 to <2 x bfloat>
  %490 = extractvalue { i32, i32, i32, i32 } %487, 1
  %491 = bitcast i32 %490 to <2 x bfloat>
  %492 = extractvalue { i32, i32, i32, i32 } %487, 2
  %493 = bitcast i32 %492 to <2 x bfloat>
  %494 = shufflevector <2 x bfloat> %493, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %495 = extractvalue { i32, i32, i32, i32 } %487, 3
  %496 = bitcast i32 %495 to <2 x bfloat>
  %497 = shufflevector <2 x bfloat> %496, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %498 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep51) #9
  %499 = extractvalue { i32, i32, i32, i32 } %498, 0
  %500 = bitcast i32 %499 to <2 x bfloat>
  %501 = extractvalue { i32, i32, i32, i32 } %498, 1
  %502 = bitcast i32 %501 to <2 x bfloat>
  %503 = extractvalue { i32, i32, i32, i32 } %498, 2
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = shufflevector <2 x bfloat> %504, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %506 = extractvalue { i32, i32, i32, i32 } %498, 3
  %507 = bitcast i32 %506 to <2 x bfloat>
  %508 = shufflevector <2 x bfloat> %507, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %509 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep50) #9
  %510 = extractvalue { i32, i32, i32, i32 } %509, 0
  %511 = bitcast i32 %510 to <2 x bfloat>
  %512 = extractvalue { i32, i32, i32, i32 } %509, 1
  %513 = bitcast i32 %512 to <2 x bfloat>
  %514 = extractvalue { i32, i32, i32, i32 } %509, 2
  %515 = bitcast i32 %514 to <2 x bfloat>
  %516 = shufflevector <2 x bfloat> %515, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %517 = extractvalue { i32, i32, i32, i32 } %509, 3
  %518 = bitcast i32 %517 to <2 x bfloat>
  %519 = shufflevector <2 x bfloat> %518, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %520 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep49) #9
  %521 = extractvalue { i32, i32, i32, i32 } %520, 0
  %522 = bitcast i32 %521 to <2 x bfloat>
  %523 = extractvalue { i32, i32, i32, i32 } %520, 1
  %524 = bitcast i32 %523 to <2 x bfloat>
  %525 = extractvalue { i32, i32, i32, i32 } %520, 2
  %526 = bitcast i32 %525 to <2 x bfloat>
  %527 = shufflevector <2 x bfloat> %526, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %528 = extractvalue { i32, i32, i32, i32 } %520, 3
  %529 = bitcast i32 %528 to <2 x bfloat>
  %530 = shufflevector <2 x bfloat> %529, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %531 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep48) #9
  %532 = extractvalue { i32, i32, i32, i32 } %531, 0
  %533 = bitcast i32 %532 to <2 x bfloat>
  %534 = extractvalue { i32, i32, i32, i32 } %531, 1
  %535 = bitcast i32 %534 to <2 x bfloat>
  %536 = extractvalue { i32, i32, i32, i32 } %531, 2
  %537 = bitcast i32 %536 to <2 x bfloat>
  %538 = shufflevector <2 x bfloat> %537, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %539 = extractvalue { i32, i32, i32, i32 } %531, 3
  %540 = bitcast i32 %539 to <2 x bfloat>
  %541 = shufflevector <2 x bfloat> %540, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %542 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep47) #9
  %543 = extractvalue { i32, i32, i32, i32 } %542, 0
  %544 = bitcast i32 %543 to <2 x bfloat>
  %545 = extractvalue { i32, i32, i32, i32 } %542, 1
  %546 = bitcast i32 %545 to <2 x bfloat>
  %547 = extractvalue { i32, i32, i32, i32 } %542, 2
  %548 = bitcast i32 %547 to <2 x bfloat>
  %549 = shufflevector <2 x bfloat> %548, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %550 = extractvalue { i32, i32, i32, i32 } %542, 3
  %551 = bitcast i32 %550 to <2 x bfloat>
  %552 = shufflevector <2 x bfloat> %551, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %553 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %scevgep46) #9
  %554 = extractvalue { i32, i32, i32, i32 } %553, 0
  %555 = bitcast i32 %554 to <2 x bfloat>
  %556 = extractvalue { i32, i32, i32, i32 } %553, 1
  %557 = bitcast i32 %556 to <2 x bfloat>
  %558 = extractvalue { i32, i32, i32, i32 } %553, 2
  %559 = bitcast i32 %558 to <2 x bfloat>
  %560 = shufflevector <2 x bfloat> %559, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %561 = extractvalue { i32, i32, i32, i32 } %553, 3
  %562 = bitcast i32 %561 to <2 x bfloat>
  %563 = shufflevector <2 x bfloat> %562, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %564 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %lsr.iv44) #9
  %565 = extractvalue { i32, i32, i32, i32 } %564, 0
  %566 = bitcast i32 %565 to <2 x bfloat>
  %567 = extractvalue { i32, i32, i32, i32 } %564, 1
  %568 = bitcast i32 %567 to <2 x bfloat>
  %569 = extractvalue { i32, i32, i32, i32 } %564, 2
  %570 = bitcast i32 %569 to <2 x bfloat>
  %571 = shufflevector <2 x bfloat> %570, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %572 = extractvalue { i32, i32, i32, i32 } %564, 3
  %573 = bitcast i32 %572 to <2 x bfloat>
  %574 = shufflevector <2 x bfloat> %573, <2 x bfloat> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  tail call void @llvm.nvvm.barrier0()
  %575 = shufflevector <2 x bfloat> %401, <2 x bfloat> %403, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %576 = shufflevector <8 x bfloat> %575, <8 x bfloat> %406, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %577 = shufflevector <8 x bfloat> %576, <8 x bfloat> %409, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %577, ptr addrspace(3) %35, align 16
  %578 = shufflevector <2 x bfloat> %412, <2 x bfloat> %414, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %579 = shufflevector <8 x bfloat> %578, <8 x bfloat> %417, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %580 = shufflevector <8 x bfloat> %579, <8 x bfloat> %420, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %580, ptr addrspace(3) %44, align 16
  %581 = shufflevector <2 x bfloat> %423, <2 x bfloat> %425, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %582 = shufflevector <8 x bfloat> %581, <8 x bfloat> %428, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %583 = shufflevector <8 x bfloat> %582, <8 x bfloat> %431, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %583, ptr addrspace(3) %50, align 16
  %584 = shufflevector <2 x bfloat> %434, <2 x bfloat> %436, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %585 = shufflevector <8 x bfloat> %584, <8 x bfloat> %439, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %586 = shufflevector <8 x bfloat> %585, <8 x bfloat> %442, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %586, ptr addrspace(3) %57, align 16
  %587 = shufflevector <2 x bfloat> %445, <2 x bfloat> %447, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %588 = shufflevector <8 x bfloat> %587, <8 x bfloat> %450, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %589 = shufflevector <8 x bfloat> %588, <8 x bfloat> %453, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %589, ptr addrspace(3) %61, align 16
  %590 = shufflevector <2 x bfloat> %456, <2 x bfloat> %458, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %591 = shufflevector <8 x bfloat> %590, <8 x bfloat> %461, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %592 = shufflevector <8 x bfloat> %591, <8 x bfloat> %464, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %592, ptr addrspace(3) %68, align 16
  %593 = shufflevector <2 x bfloat> %467, <2 x bfloat> %469, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %594 = shufflevector <8 x bfloat> %593, <8 x bfloat> %472, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %595 = shufflevector <8 x bfloat> %594, <8 x bfloat> %475, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %595, ptr addrspace(3) %74, align 16
  %596 = shufflevector <2 x bfloat> %478, <2 x bfloat> %480, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %597 = shufflevector <8 x bfloat> %596, <8 x bfloat> %483, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %598 = shufflevector <8 x bfloat> %597, <8 x bfloat> %486, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %598, ptr addrspace(3) %80, align 16
  %599 = shufflevector <2 x bfloat> %489, <2 x bfloat> %491, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %600 = shufflevector <8 x bfloat> %599, <8 x bfloat> %494, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %601 = shufflevector <8 x bfloat> %600, <8 x bfloat> %497, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %601, ptr addrspace(3) %84, align 16
  %602 = shufflevector <2 x bfloat> %500, <2 x bfloat> %502, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %603 = shufflevector <8 x bfloat> %602, <8 x bfloat> %505, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %604 = shufflevector <8 x bfloat> %603, <8 x bfloat> %508, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %604, ptr addrspace(3) %91, align 16
  %605 = shufflevector <2 x bfloat> %511, <2 x bfloat> %513, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %606 = shufflevector <8 x bfloat> %605, <8 x bfloat> %516, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %607 = shufflevector <8 x bfloat> %606, <8 x bfloat> %519, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %607, ptr addrspace(3) %97, align 16
  %608 = shufflevector <2 x bfloat> %522, <2 x bfloat> %524, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %609 = shufflevector <8 x bfloat> %608, <8 x bfloat> %527, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %610 = shufflevector <8 x bfloat> %609, <8 x bfloat> %530, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %610, ptr addrspace(3) %103, align 16
  %611 = shufflevector <2 x bfloat> %533, <2 x bfloat> %535, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %612 = shufflevector <8 x bfloat> %611, <8 x bfloat> %538, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %613 = shufflevector <8 x bfloat> %612, <8 x bfloat> %541, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %613, ptr addrspace(3) %107, align 16
  %614 = shufflevector <2 x bfloat> %544, <2 x bfloat> %546, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %615 = shufflevector <8 x bfloat> %614, <8 x bfloat> %549, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %616 = shufflevector <8 x bfloat> %615, <8 x bfloat> %552, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %616, ptr addrspace(3) %114, align 16
  %617 = shufflevector <2 x bfloat> %555, <2 x bfloat> %557, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %618 = shufflevector <8 x bfloat> %617, <8 x bfloat> %560, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %619 = shufflevector <8 x bfloat> %618, <8 x bfloat> %563, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %619, ptr addrspace(3) %120, align 16
  %620 = shufflevector <2 x bfloat> %566, <2 x bfloat> %568, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison>
  %621 = shufflevector <8 x bfloat> %620, <8 x bfloat> %571, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 poison, i32 poison>
  %622 = shufflevector <8 x bfloat> %621, <8 x bfloat> %574, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 8, i32 9>
  store <8 x bfloat> %622, ptr addrspace(3) %126, align 16
  tail call void @llvm.nvvm.barrier0()
  %623 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %141) #9
  %624 = extractvalue { i32, i32, i32, i32 } %623, 0
  %625 = extractvalue { i32, i32, i32, i32 } %623, 1
  %626 = extractvalue { i32, i32, i32, i32 } %623, 2
  %627 = extractvalue { i32, i32, i32, i32 } %623, 3
  %628 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %151) #9
  %629 = extractvalue { i32, i32, i32, i32 } %628, 0
  %630 = extractvalue { i32, i32, i32, i32 } %628, 1
  %631 = extractvalue { i32, i32, i32, i32 } %628, 2
  %632 = extractvalue { i32, i32, i32, i32 } %628, 3
  %633 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %159) #9
  %634 = extractvalue { i32, i32, i32, i32 } %633, 0
  %635 = extractvalue { i32, i32, i32, i32 } %633, 1
  %636 = extractvalue { i32, i32, i32, i32 } %633, 2
  %637 = extractvalue { i32, i32, i32, i32 } %633, 3
  %638 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %168) #9
  %639 = extractvalue { i32, i32, i32, i32 } %638, 0
  %640 = extractvalue { i32, i32, i32, i32 } %638, 1
  %641 = extractvalue { i32, i32, i32, i32 } %638, 2
  %642 = extractvalue { i32, i32, i32, i32 } %638, 3
  %643 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %174) #9
  %644 = extractvalue { i32, i32, i32, i32 } %643, 0
  %645 = extractvalue { i32, i32, i32, i32 } %643, 1
  %646 = extractvalue { i32, i32, i32, i32 } %643, 2
  %647 = extractvalue { i32, i32, i32, i32 } %643, 3
  %648 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %183) #9
  %649 = extractvalue { i32, i32, i32, i32 } %648, 0
  %650 = extractvalue { i32, i32, i32, i32 } %648, 1
  %651 = extractvalue { i32, i32, i32, i32 } %648, 2
  %652 = extractvalue { i32, i32, i32, i32 } %648, 3
  %653 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %191) #9
  %654 = extractvalue { i32, i32, i32, i32 } %653, 0
  %655 = extractvalue { i32, i32, i32, i32 } %653, 1
  %656 = extractvalue { i32, i32, i32, i32 } %653, 2
  %657 = extractvalue { i32, i32, i32, i32 } %653, 3
  %658 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %199) #9
  %659 = extractvalue { i32, i32, i32, i32 } %658, 0
  %660 = extractvalue { i32, i32, i32, i32 } %658, 1
  %661 = extractvalue { i32, i32, i32, i32 } %658, 2
  %662 = extractvalue { i32, i32, i32, i32 } %658, 3
  %663 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %205) #9
  %664 = extractvalue { i32, i32, i32, i32 } %663, 0
  %665 = extractvalue { i32, i32, i32, i32 } %663, 1
  %666 = extractvalue { i32, i32, i32, i32 } %663, 2
  %667 = extractvalue { i32, i32, i32, i32 } %663, 3
  %668 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %214) #9
  %669 = extractvalue { i32, i32, i32, i32 } %668, 0
  %670 = extractvalue { i32, i32, i32, i32 } %668, 1
  %671 = extractvalue { i32, i32, i32, i32 } %668, 2
  %672 = extractvalue { i32, i32, i32, i32 } %668, 3
  %673 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %222) #9
  %674 = extractvalue { i32, i32, i32, i32 } %673, 0
  %675 = extractvalue { i32, i32, i32, i32 } %673, 1
  %676 = extractvalue { i32, i32, i32, i32 } %673, 2
  %677 = extractvalue { i32, i32, i32, i32 } %673, 3
  %678 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %230) #9
  %679 = extractvalue { i32, i32, i32, i32 } %678, 0
  %680 = extractvalue { i32, i32, i32, i32 } %678, 1
  %681 = extractvalue { i32, i32, i32, i32 } %678, 2
  %682 = extractvalue { i32, i32, i32, i32 } %678, 3
  %683 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %236) #9
  %684 = extractvalue { i32, i32, i32, i32 } %683, 0
  %685 = extractvalue { i32, i32, i32, i32 } %683, 1
  %686 = extractvalue { i32, i32, i32, i32 } %683, 2
  %687 = extractvalue { i32, i32, i32, i32 } %683, 3
  %688 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %245) #9
  %689 = extractvalue { i32, i32, i32, i32 } %688, 0
  %690 = extractvalue { i32, i32, i32, i32 } %688, 1
  %691 = extractvalue { i32, i32, i32, i32 } %688, 2
  %692 = extractvalue { i32, i32, i32, i32 } %688, 3
  %693 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %253) #9
  %694 = extractvalue { i32, i32, i32, i32 } %693, 0
  %695 = extractvalue { i32, i32, i32, i32 } %693, 1
  %696 = extractvalue { i32, i32, i32, i32 } %693, 2
  %697 = extractvalue { i32, i32, i32, i32 } %693, 3
  %698 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %261) #9
  %699 = extractvalue { i32, i32, i32, i32 } %698, 0
  %700 = extractvalue { i32, i32, i32, i32 } %698, 1
  %701 = extractvalue { i32, i32, i32, i32 } %698, 2
  %702 = extractvalue { i32, i32, i32, i32 } %698, 3
  %703 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %267) #9
  %704 = extractvalue { i32, i32, i32, i32 } %703, 0
  %705 = extractvalue { i32, i32, i32, i32 } %703, 1
  %706 = extractvalue { i32, i32, i32, i32 } %703, 2
  %707 = extractvalue { i32, i32, i32, i32 } %703, 3
  %708 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %276) #9
  %709 = extractvalue { i32, i32, i32, i32 } %708, 0
  %710 = extractvalue { i32, i32, i32, i32 } %708, 1
  %711 = extractvalue { i32, i32, i32, i32 } %708, 2
  %712 = extractvalue { i32, i32, i32, i32 } %708, 3
  %713 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %284) #9
  %714 = extractvalue { i32, i32, i32, i32 } %713, 0
  %715 = extractvalue { i32, i32, i32, i32 } %713, 1
  %716 = extractvalue { i32, i32, i32, i32 } %713, 2
  %717 = extractvalue { i32, i32, i32, i32 } %713, 3
  %718 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %292) #9
  %719 = extractvalue { i32, i32, i32, i32 } %718, 0
  %720 = extractvalue { i32, i32, i32, i32 } %718, 1
  %721 = extractvalue { i32, i32, i32, i32 } %718, 2
  %722 = extractvalue { i32, i32, i32, i32 } %718, 3
  %723 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %298) #9
  %724 = extractvalue { i32, i32, i32, i32 } %723, 0
  %725 = extractvalue { i32, i32, i32, i32 } %723, 1
  %726 = extractvalue { i32, i32, i32, i32 } %723, 2
  %727 = extractvalue { i32, i32, i32, i32 } %723, 3
  %728 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %307) #9
  %729 = extractvalue { i32, i32, i32, i32 } %728, 0
  %730 = extractvalue { i32, i32, i32, i32 } %728, 1
  %731 = extractvalue { i32, i32, i32, i32 } %728, 2
  %732 = extractvalue { i32, i32, i32, i32 } %728, 3
  %733 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %315) #9
  %734 = extractvalue { i32, i32, i32, i32 } %733, 0
  %735 = extractvalue { i32, i32, i32, i32 } %733, 1
  %736 = extractvalue { i32, i32, i32, i32 } %733, 2
  %737 = extractvalue { i32, i32, i32, i32 } %733, 3
  %738 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %323) #9
  %739 = extractvalue { i32, i32, i32, i32 } %738, 0
  %740 = extractvalue { i32, i32, i32, i32 } %738, 1
  %741 = extractvalue { i32, i32, i32, i32 } %738, 2
  %742 = extractvalue { i32, i32, i32, i32 } %738, 3
  %743 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %329) #9
  %744 = extractvalue { i32, i32, i32, i32 } %743, 0
  %745 = extractvalue { i32, i32, i32, i32 } %743, 1
  %746 = extractvalue { i32, i32, i32, i32 } %743, 2
  %747 = extractvalue { i32, i32, i32, i32 } %743, 3
  %748 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %338) #9
  %749 = extractvalue { i32, i32, i32, i32 } %748, 0
  %750 = extractvalue { i32, i32, i32, i32 } %748, 1
  %751 = extractvalue { i32, i32, i32, i32 } %748, 2
  %752 = extractvalue { i32, i32, i32, i32 } %748, 3
  %753 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %346) #9
  %754 = extractvalue { i32, i32, i32, i32 } %753, 0
  %755 = extractvalue { i32, i32, i32, i32 } %753, 1
  %756 = extractvalue { i32, i32, i32, i32 } %753, 2
  %757 = extractvalue { i32, i32, i32, i32 } %753, 3
  %758 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %354) #9
  %759 = extractvalue { i32, i32, i32, i32 } %758, 0
  %760 = extractvalue { i32, i32, i32, i32 } %758, 1
  %761 = extractvalue { i32, i32, i32, i32 } %758, 2
  %762 = extractvalue { i32, i32, i32, i32 } %758, 3
  %763 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %360) #9
  %764 = extractvalue { i32, i32, i32, i32 } %763, 0
  %765 = extractvalue { i32, i32, i32, i32 } %763, 1
  %766 = extractvalue { i32, i32, i32, i32 } %763, 2
  %767 = extractvalue { i32, i32, i32, i32 } %763, 3
  %768 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %369) #9
  %769 = extractvalue { i32, i32, i32, i32 } %768, 0
  %770 = extractvalue { i32, i32, i32, i32 } %768, 1
  %771 = extractvalue { i32, i32, i32, i32 } %768, 2
  %772 = extractvalue { i32, i32, i32, i32 } %768, 3
  %773 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %377) #9
  %774 = extractvalue { i32, i32, i32, i32 } %773, 0
  %775 = extractvalue { i32, i32, i32, i32 } %773, 1
  %776 = extractvalue { i32, i32, i32, i32 } %773, 2
  %777 = extractvalue { i32, i32, i32, i32 } %773, 3
  %778 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %385) #9
  %779 = extractvalue { i32, i32, i32, i32 } %778, 0
  %780 = extractvalue { i32, i32, i32, i32 } %778, 1
  %781 = extractvalue { i32, i32, i32, i32 } %778, 2
  %782 = extractvalue { i32, i32, i32, i32 } %778, 3
  %783 = extractvalue { float, float, float, float } %398, 0
  %784 = extractvalue { float, float, float, float } %398, 1
  %785 = extractvalue { float, float, float, float } %398, 2
  %786 = extractvalue { float, float, float, float } %398, 3
  %787 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %783, float %784, float %785, float %786, i32 %624, i32 %625, i32 %626, i32 %627, i32 0, i32 0) #9
  %788 = extractvalue { float, float, float, float } %787, 0
  %789 = extractvalue { float, float, float, float } %787, 1
  %790 = extractvalue { float, float, float, float } %787, 2
  %791 = extractvalue { float, float, float, float } %787, 3
  %792 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %788, float %789, float %790, float %791, i32 %629, i32 %630, i32 %631, i32 %632, i32 0, i32 0) #9
  %793 = extractvalue { float, float, float, float } %792, 0
  %794 = extractvalue { float, float, float, float } %792, 1
  %795 = extractvalue { float, float, float, float } %792, 2
  %796 = extractvalue { float, float, float, float } %792, 3
  %797 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %793, float %794, float %795, float %796, i32 %634, i32 %635, i32 %636, i32 %637, i32 0, i32 0) #9
  %798 = extractvalue { float, float, float, float } %797, 0
  %799 = extractvalue { float, float, float, float } %797, 1
  %800 = extractvalue { float, float, float, float } %797, 2
  %801 = extractvalue { float, float, float, float } %797, 3
  %802 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %798, float %799, float %800, float %801, i32 %639, i32 %640, i32 %641, i32 %642, i32 0, i32 0) #9
  %803 = extractvalue { float, float, float, float } %802, 0
  %804 = extractvalue { float, float, float, float } %802, 1
  %805 = extractvalue { float, float, float, float } %802, 2
  %806 = extractvalue { float, float, float, float } %802, 3
  %807 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %803, float %804, float %805, float %806, i32 %644, i32 %645, i32 %646, i32 %647, i32 0, i32 0) #9
  %808 = extractvalue { float, float, float, float } %807, 0
  %809 = extractvalue { float, float, float, float } %807, 1
  %810 = extractvalue { float, float, float, float } %807, 2
  %811 = extractvalue { float, float, float, float } %807, 3
  %812 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %808, float %809, float %810, float %811, i32 %649, i32 %650, i32 %651, i32 %652, i32 0, i32 0) #9
  %813 = extractvalue { float, float, float, float } %812, 0
  %814 = extractvalue { float, float, float, float } %812, 1
  %815 = extractvalue { float, float, float, float } %812, 2
  %816 = extractvalue { float, float, float, float } %812, 3
  %817 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %813, float %814, float %815, float %816, i32 %654, i32 %655, i32 %656, i32 %657, i32 0, i32 0) #9
  %818 = extractvalue { float, float, float, float } %817, 0
  %819 = extractvalue { float, float, float, float } %817, 1
  %820 = extractvalue { float, float, float, float } %817, 2
  %821 = extractvalue { float, float, float, float } %817, 3
  %822 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %818, float %819, float %820, float %821, i32 %659, i32 %660, i32 %661, i32 %662, i32 0, i32 0) #9
  %823 = extractvalue { float, float, float, float } %822, 0
  %824 = extractvalue { float, float, float, float } %822, 1
  %825 = extractvalue { float, float, float, float } %822, 2
  %826 = extractvalue { float, float, float, float } %822, 3
  %827 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %823, float %824, float %825, float %826, i32 %664, i32 %665, i32 %666, i32 %667, i32 0, i32 0) #9
  %828 = extractvalue { float, float, float, float } %827, 0
  %829 = extractvalue { float, float, float, float } %827, 1
  %830 = extractvalue { float, float, float, float } %827, 2
  %831 = extractvalue { float, float, float, float } %827, 3
  %832 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %828, float %829, float %830, float %831, i32 %669, i32 %670, i32 %671, i32 %672, i32 0, i32 0) #9
  %833 = extractvalue { float, float, float, float } %832, 0
  %834 = extractvalue { float, float, float, float } %832, 1
  %835 = extractvalue { float, float, float, float } %832, 2
  %836 = extractvalue { float, float, float, float } %832, 3
  %837 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %833, float %834, float %835, float %836, i32 %674, i32 %675, i32 %676, i32 %677, i32 0, i32 0) #9
  %838 = extractvalue { float, float, float, float } %837, 0
  %839 = extractvalue { float, float, float, float } %837, 1
  %840 = extractvalue { float, float, float, float } %837, 2
  %841 = extractvalue { float, float, float, float } %837, 3
  %842 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %838, float %839, float %840, float %841, i32 %679, i32 %680, i32 %681, i32 %682, i32 0, i32 0) #9
  %843 = extractvalue { float, float, float, float } %842, 0
  %844 = extractvalue { float, float, float, float } %842, 1
  %845 = extractvalue { float, float, float, float } %842, 2
  %846 = extractvalue { float, float, float, float } %842, 3
  %847 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %843, float %844, float %845, float %846, i32 %684, i32 %685, i32 %686, i32 %687, i32 0, i32 0) #9
  %848 = extractvalue { float, float, float, float } %847, 0
  %849 = extractvalue { float, float, float, float } %847, 1
  %850 = extractvalue { float, float, float, float } %847, 2
  %851 = extractvalue { float, float, float, float } %847, 3
  %852 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %848, float %849, float %850, float %851, i32 %689, i32 %690, i32 %691, i32 %692, i32 0, i32 0) #9
  %853 = extractvalue { float, float, float, float } %852, 0
  %854 = extractvalue { float, float, float, float } %852, 1
  %855 = extractvalue { float, float, float, float } %852, 2
  %856 = extractvalue { float, float, float, float } %852, 3
  %857 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %853, float %854, float %855, float %856, i32 %694, i32 %695, i32 %696, i32 %697, i32 0, i32 0) #9
  %858 = extractvalue { float, float, float, float } %857, 0
  %859 = extractvalue { float, float, float, float } %857, 1
  %860 = extractvalue { float, float, float, float } %857, 2
  %861 = extractvalue { float, float, float, float } %857, 3
  %862 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %858, float %859, float %860, float %861, i32 %699, i32 %700, i32 %701, i32 %702, i32 0, i32 0) #9
  %863 = extractvalue { float, float, float, float } %862, 0
  %864 = extractvalue { float, float, float, float } %862, 1
  %865 = extractvalue { float, float, float, float } %862, 2
  %866 = extractvalue { float, float, float, float } %862, 3
  %867 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %863, float %864, float %865, float %866, i32 %704, i32 %705, i32 %706, i32 %707, i32 0, i32 0) #9
  %868 = extractvalue { float, float, float, float } %867, 0
  %869 = extractvalue { float, float, float, float } %867, 1
  %870 = extractvalue { float, float, float, float } %867, 2
  %871 = extractvalue { float, float, float, float } %867, 3
  %872 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %868, float %869, float %870, float %871, i32 %709, i32 %710, i32 %711, i32 %712, i32 0, i32 0) #9
  %873 = extractvalue { float, float, float, float } %872, 0
  %874 = extractvalue { float, float, float, float } %872, 1
  %875 = extractvalue { float, float, float, float } %872, 2
  %876 = extractvalue { float, float, float, float } %872, 3
  %877 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %873, float %874, float %875, float %876, i32 %714, i32 %715, i32 %716, i32 %717, i32 0, i32 0) #9
  %878 = extractvalue { float, float, float, float } %877, 0
  %879 = extractvalue { float, float, float, float } %877, 1
  %880 = extractvalue { float, float, float, float } %877, 2
  %881 = extractvalue { float, float, float, float } %877, 3
  %882 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %878, float %879, float %880, float %881, i32 %719, i32 %720, i32 %721, i32 %722, i32 0, i32 0) #9
  %883 = extractvalue { float, float, float, float } %882, 0
  %884 = extractvalue { float, float, float, float } %882, 1
  %885 = extractvalue { float, float, float, float } %882, 2
  %886 = extractvalue { float, float, float, float } %882, 3
  %887 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %883, float %884, float %885, float %886, i32 %724, i32 %725, i32 %726, i32 %727, i32 0, i32 0) #9
  %888 = extractvalue { float, float, float, float } %887, 0
  %889 = extractvalue { float, float, float, float } %887, 1
  %890 = extractvalue { float, float, float, float } %887, 2
  %891 = extractvalue { float, float, float, float } %887, 3
  %892 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %888, float %889, float %890, float %891, i32 %729, i32 %730, i32 %731, i32 %732, i32 0, i32 0) #9
  %893 = extractvalue { float, float, float, float } %892, 0
  %894 = extractvalue { float, float, float, float } %892, 1
  %895 = extractvalue { float, float, float, float } %892, 2
  %896 = extractvalue { float, float, float, float } %892, 3
  %897 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %893, float %894, float %895, float %896, i32 %734, i32 %735, i32 %736, i32 %737, i32 0, i32 0) #9
  %898 = extractvalue { float, float, float, float } %897, 0
  %899 = extractvalue { float, float, float, float } %897, 1
  %900 = extractvalue { float, float, float, float } %897, 2
  %901 = extractvalue { float, float, float, float } %897, 3
  %902 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %898, float %899, float %900, float %901, i32 %739, i32 %740, i32 %741, i32 %742, i32 0, i32 0) #9
  %903 = extractvalue { float, float, float, float } %902, 0
  %904 = extractvalue { float, float, float, float } %902, 1
  %905 = extractvalue { float, float, float, float } %902, 2
  %906 = extractvalue { float, float, float, float } %902, 3
  %907 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %903, float %904, float %905, float %906, i32 %744, i32 %745, i32 %746, i32 %747, i32 0, i32 0) #9
  %908 = extractvalue { float, float, float, float } %907, 0
  %909 = extractvalue { float, float, float, float } %907, 1
  %910 = extractvalue { float, float, float, float } %907, 2
  %911 = extractvalue { float, float, float, float } %907, 3
  %912 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %908, float %909, float %910, float %911, i32 %749, i32 %750, i32 %751, i32 %752, i32 0, i32 0) #9
  %913 = extractvalue { float, float, float, float } %912, 0
  %914 = extractvalue { float, float, float, float } %912, 1
  %915 = extractvalue { float, float, float, float } %912, 2
  %916 = extractvalue { float, float, float, float } %912, 3
  %917 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %913, float %914, float %915, float %916, i32 %754, i32 %755, i32 %756, i32 %757, i32 0, i32 0) #9
  %918 = extractvalue { float, float, float, float } %917, 0
  %919 = extractvalue { float, float, float, float } %917, 1
  %920 = extractvalue { float, float, float, float } %917, 2
  %921 = extractvalue { float, float, float, float } %917, 3
  %922 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %918, float %919, float %920, float %921, i32 %759, i32 %760, i32 %761, i32 %762, i32 0, i32 0) #9
  %923 = extractvalue { float, float, float, float } %922, 0
  %924 = extractvalue { float, float, float, float } %922, 1
  %925 = extractvalue { float, float, float, float } %922, 2
  %926 = extractvalue { float, float, float, float } %922, 3
  %927 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %923, float %924, float %925, float %926, i32 %764, i32 %765, i32 %766, i32 %767, i32 0, i32 0) #9
  %928 = extractvalue { float, float, float, float } %927, 0
  %929 = extractvalue { float, float, float, float } %927, 1
  %930 = extractvalue { float, float, float, float } %927, 2
  %931 = extractvalue { float, float, float, float } %927, 3
  %932 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %928, float %929, float %930, float %931, i32 %769, i32 %770, i32 %771, i32 %772, i32 0, i32 0) #9
  %933 = extractvalue { float, float, float, float } %932, 0
  %934 = extractvalue { float, float, float, float } %932, 1
  %935 = extractvalue { float, float, float, float } %932, 2
  %936 = extractvalue { float, float, float, float } %932, 3
  %937 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %933, float %934, float %935, float %936, i32 %774, i32 %775, i32 %776, i32 %777, i32 0, i32 0) #9
  %938 = extractvalue { float, float, float, float } %937, 0
  %939 = extractvalue { float, float, float, float } %937, 1
  %940 = extractvalue { float, float, float, float } %937, 2
  %941 = extractvalue { float, float, float, float } %937, 3
  %942 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %938, float %939, float %940, float %941, i32 %779, i32 %780, i32 %781, i32 %782, i32 0, i32 0) #9
  %943 = extractvalue { float, float, float, float } %942, 0
  %944 = extractvalue { float, float, float, float } %942, 1
  %945 = extractvalue { float, float, float, float } %942, 2
  %946 = extractvalue { float, float, float, float } %942, 3
  %947 = insertvalue { float, float, float, float } undef, float %943, 0
  %948 = insertvalue { float, float, float, float } %947, float %944, 1
  %949 = insertvalue { float, float, float, float } %948, float %945, 2
  %950 = insertvalue { float, float, float, float } %949, float %946, 3
  %lsr.iv.next = add nsw i32 %lsr.iv, 512
  %scevgep45 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 1024
  %951 = icmp samesign ult i32 %lsr.iv.next, 1536
  br i1 %951, label %397, label %952

952:                                              ; preds = %397
  %953 = icmp ugt i32 %10, 63
  %954 = mul i32 %2, 16
  %.decomposed = sub i32 %.frozen, %954
  %955 = sdiv i32 %.decomposed, %5
  %956 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %943) #9
  %957 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %944) #9
  %958 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %945) #9
  %959 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %946) #9
  %960 = shl nsw i32 %955, 4
  %961 = sext i32 %960 to i64
  %962 = shl nuw nsw i32 %10, 2
  %963 = and i32 %962, 28
  %964 = zext nneg i32 %963 to i64
  %965 = or disjoint i64 %9, %964
  %966 = lshr i32 %10, 3
  %967 = and i32 %966, 7
  %968 = select i1 %953, i32 8, i32 0
  %969 = or disjoint i32 %967, %968
  %970 = zext nneg i32 %969 to i64
  %971 = or disjoint i64 %961, %970
  %972 = getelementptr bfloat, ptr addrspace(1) %arg142, i64 %965
  %.idx = shl nsw i64 %971, 11
  %973 = getelementptr i8, ptr addrspace(1) %972, i64 %.idx
  tail call void @llvm.nvvm.barrier0()
  %974 = shl nuw nsw i32 %10, 6
  %975 = and i32 %974, 192
  %976 = lshr i32 %10, 2
  %977 = and i32 %976, 3
  %978 = or disjoint i32 %977, %975
  %979 = lshr exact i32 %26, 2
  %980 = or disjoint i32 %978, %979
  %981 = select i1 %953, i32 16, i32 0
  %982 = or disjoint i32 %980, %981
  %983 = or disjoint i32 %982, %30
  %984 = and i32 %962, 252
  %985 = select i1 %953, i32 256, i32 0
  %986 = or disjoint i32 %984, %985
  %987 = lshr i32 %983, 3
  %988 = and i32 %987, 536870908
  %989 = add nuw nsw i32 %988, %983
  %990 = zext nneg i32 %989 to i64
  %991 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %990
  %992 = bitcast bfloat %956 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %991, <1 x i16> %992, i1 true) #9
  %993 = or disjoint i32 %983, 32
  %994 = lshr i32 %993, 3
  %995 = and i32 %994, 536870908
  %996 = zext nneg i32 %995 to i64
  %997 = zext nneg i32 %983 to i64
  %998 = add i64 %996, %997
  %999 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %998
  %1000 = getelementptr inbounds i8, ptr addrspace(3) %999, i64 64
  %1001 = bitcast bfloat %957 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1000, <1 x i16> %1001, i1 true) #9
  %1002 = zext nneg i32 %988 to i64
  %1003 = add i64 %997, %1002
  %1004 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1003
  %1005 = getelementptr inbounds i8, ptr addrspace(3) %1004, i64 16
  %1006 = bitcast bfloat %958 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1005, <1 x i16> %1006, i1 true) #9
  %1007 = or disjoint i32 %983, 40
  %1008 = lshr i32 %1007, 3
  %1009 = and i32 %1008, 536870908
  %1010 = zext nneg i32 %1009 to i64
  %1011 = add i64 %1010, %997
  %1012 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %1011
  %1013 = getelementptr inbounds i8, ptr addrspace(3) %1012, i64 80
  %1014 = bitcast bfloat %959 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %1013, <1 x i16> %1014, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %1015 = lshr i32 %986, 3
  %1016 = and i32 %1015, 60
  %1017 = add nuw nsw i32 %1016, %986
  %1018 = zext nneg i32 %1017 to i64
  %1019 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %1018
  %1020 = load <2 x i32>, ptr addrspace(3) %1019, align 8
  %.uncasted.extract61 = extractelement <2 x i32> %1020, i32 0
  %.uncasted.extract762 = extractelement <2 x i32> %1020, i32 1
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %.uncasted.extract61, i32 %.uncasted.extract762, ptr addrspace(1) %973) #9
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #4

define ptx_kernel void @fusion_24(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) local_unnamed_addr #5 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 8
  %4 = and i64 %3, 768
  %5 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
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
  %29 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
  %30 = getelementptr bfloat, ptr addrspace(1) %29, i64 %14
  %31 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %30) #9
  %32 = extractvalue { i32, i32 } %31, 0
  %33 = bitcast i32 %32 to <2 x bfloat>
  %34 = extractvalue { i32, i32 } %31, 1
  %35 = bitcast i32 %34 to <2 x bfloat>
  %36 = extractelement <2 x bfloat> %33, i64 0
  %37 = extractelement <2 x bfloat> %33, i64 1
  %38 = extractelement <2 x bfloat> %35, i64 0
  %39 = extractelement <2 x bfloat> %35, i64 1
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %36) #9
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %37) #9
  %42 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %38) #9
  %43 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %39) #9
  %44 = fadd float %25, %40
  %45 = fadd float %26, %41
  %46 = fadd float %27, %42
  %47 = fadd float %28, %43
  %48 = and i64 %3, -1024
  %49 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %48
  %50 = shl nuw nsw i32 %6, 3
  %51 = and i32 %50, 248
  %52 = select i1 %11, i32 0, i32 256
  %53 = or disjoint i32 %51, %52
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr bfloat, ptr addrspace(1) %49, i64 %54
  %56 = getelementptr i8, ptr addrspace(1) %55, i64 1024
  %57 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %55) #9
  %58 = extractvalue { i32, i32, i32, i32 } %57, 0
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractvalue { i32, i32, i32, i32 } %57, 1
  %61 = bitcast i32 %60 to <2 x bfloat>
  %62 = extractvalue { i32, i32, i32, i32 } %57, 2
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractvalue { i32, i32, i32, i32 } %57, 3
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractelement <2 x bfloat> %59, i64 0
  %67 = extractelement <2 x bfloat> %59, i64 1
  %68 = extractelement <2 x bfloat> %61, i64 0
  %69 = extractelement <2 x bfloat> %61, i64 1
  %70 = extractelement <2 x bfloat> %63, i64 0
  %71 = extractelement <2 x bfloat> %63, i64 1
  %72 = extractelement <2 x bfloat> %65, i64 0
  %73 = extractelement <2 x bfloat> %65, i64 1
  %74 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %56) #9
  %75 = extractvalue { i32, i32, i32, i32 } %74, 0
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %74, 1
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %74, 2
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractvalue { i32, i32, i32, i32 } %74, 3
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = extractelement <2 x bfloat> %82, i64 0
  %90 = extractelement <2 x bfloat> %82, i64 1
  %91 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66) #9
  %92 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67) #9
  %93 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68) #9
  %94 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #9
  %95 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #9
  %96 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #9
  %97 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #9
  %98 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73) #9
  %99 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %100 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %101 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90) #9
  %107 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %48
  %108 = getelementptr bfloat, ptr addrspace(1) %107, i64 %54
  %109 = getelementptr i8, ptr addrspace(1) %108, i64 1024
  %110 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108) #9
  %111 = extractvalue { i32, i32, i32, i32 } %110, 0
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %110, 1
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %110, 2
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractvalue { i32, i32, i32, i32 } %110, 3
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractelement <2 x bfloat> %112, i64 0
  %120 = extractelement <2 x bfloat> %112, i64 1
  %121 = extractelement <2 x bfloat> %114, i64 0
  %122 = extractelement <2 x bfloat> %114, i64 1
  %123 = extractelement <2 x bfloat> %116, i64 0
  %124 = extractelement <2 x bfloat> %116, i64 1
  %125 = extractelement <2 x bfloat> %118, i64 0
  %126 = extractelement <2 x bfloat> %118, i64 1
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %109) #9
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
  %144 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119) #9
  %145 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120) #9
  %146 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121) #9
  %147 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122) #9
  %148 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123) #9
  %149 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124) #9
  %150 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #9
  %151 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #9
  %152 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %153 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %154 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %155 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #9
  %160 = fadd float %91, %144
  %161 = fadd float %92, %145
  %162 = fadd float %93, %146
  %163 = fadd float %94, %147
  %164 = fadd float %95, %148
  %165 = fadd float %96, %149
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
  %176 = fmul float %160, %160
  %177 = fmul float %161, %161
  %178 = fmul float %162, %162
  %179 = fmul float %163, %163
  %180 = fmul float %164, %164
  %181 = fmul float %165, %165
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
  %192 = fadd float %176, %177
  %193 = fadd float %192, %178
  %194 = fadd float %193, %179
  %195 = fadd float %194, %180
  %196 = fadd float %195, %181
  %197 = fadd float %196, %182
  %198 = fadd float %197, %183
  %199 = fadd float %198, %184
  %200 = fadd float %199, %185
  %201 = fadd float %200, %186
  %202 = fadd float %201, %187
  %203 = fadd float %202, %188
  %204 = fadd float %203, %189
  %205 = fadd float %204, %190
  %206 = fadd float %205, %191
  %207 = bitcast float %206 to i32
  %208 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %207, i32 16, i32 31)
  %209 = bitcast i32 %208 to float
  %210 = fadd float %206, %209
  %211 = bitcast float %210 to i32
  %212 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %211, i32 8, i32 31)
  %213 = bitcast i32 %212 to float
  %214 = fadd float %210, %213
  %215 = bitcast float %214 to i32
  %216 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %215, i32 4, i32 31)
  %217 = bitcast i32 %216 to float
  %218 = fadd float %214, %217
  %219 = bitcast float %218 to i32
  %220 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %219, i32 2, i32 31)
  %221 = bitcast i32 %220 to float
  %222 = fadd float %218, %221
  %223 = bitcast float %222 to i32
  %224 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %223, i32 1, i32 31)
  %225 = bitcast i32 %224 to float
  %226 = fadd float %222, %225
  %227 = icmp eq i32 %7, 0
  %228 = zext nneg i32 %8 to i64
  %229 = getelementptr float, ptr addrspace(3) @global_smem, i64 %228
  %230 = bitcast float %226 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %229, <1 x i32> %230, i1 %227) #9
  tail call void @llvm.nvvm.barrier0()
  %231 = icmp samesign ult i32 %6, 2
  %232 = zext nneg i32 %6 to i64
  %233 = getelementptr float, ptr addrspace(3) @global_smem, i64 %232
  %234 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %233, i1 %231) #9
  %235 = bitcast i32 %234 to float
  %236 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %234, i32 1, i32 31)
  %237 = bitcast i32 %236 to float
  %238 = fadd float %235, %237
  %239 = icmp eq i32 %6, 0
  %240 = bitcast float %238 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %233, <1 x i32> %240, i1 %239) #9
  tail call void @llvm.nvvm.barrier0()
  %241 = load float, ptr addrspace(3) @global_smem, align 16
  %242 = fmul float %241, 0x3F50000000000000
  %243 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %244 = bitcast i32 %243 to float
  %245 = fadd float %242, %244
  %246 = tail call float @llvm.nvvm.rsqrt.approx.f(float %245)
  %247 = fmul float %44, %246
  %248 = fmul float %45, %246
  %249 = fmul float %46, %246
  %250 = fmul float %47, %246
  %251 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %4
  %252 = getelementptr bfloat, ptr addrspace(1) %251, i64 %14
  %253 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %252) #9
  %254 = extractvalue { i32, i32 } %253, 0
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractvalue { i32, i32 } %253, 1
  %257 = bitcast i32 %256 to <2 x bfloat>
  %258 = extractelement <2 x bfloat> %255, i64 0
  %259 = extractelement <2 x bfloat> %255, i64 1
  %260 = extractelement <2 x bfloat> %257, i64 0
  %261 = extractelement <2 x bfloat> %257, i64 1
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %266 = fmul float %247, %262
  %267 = fmul float %248, %263
  %268 = fmul float %249, %264
  %269 = fmul float %250, %265
  %270 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %266) #9
  %271 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %267) #9
  %272 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %268) #9
  %273 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %269) #9
  %274 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %275 = getelementptr bfloat, ptr addrspace(1) %274, i64 %14
  %276 = insertelement <2 x bfloat> poison, bfloat %270, i64 0
  %277 = insertelement <2 x bfloat> %276, bfloat %271, i64 1
  %278 = bitcast <2 x bfloat> %277 to i32
  %279 = insertelement <2 x bfloat> poison, bfloat %272, i64 0
  %280 = insertelement <2 x bfloat> %279, bfloat %273, i64 1
  %281 = bitcast <2 x bfloat> %280 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %278, i32 %281, ptr addrspace(1) %275) #9
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

define ptx_kernel void @fusion_25(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) local_unnamed_addr #5 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 10
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
  %66 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
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
  %119 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %3
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
  %182 = fadd float %113, %166
  %183 = fadd float %114, %167
  %184 = fadd float %115, %168
  %185 = fadd float %116, %169
  %186 = fadd float %117, %170
  %187 = fadd float %118, %171
  %188 = fadd float %50, %172
  %189 = fadd float %51, %173
  %190 = fadd float %52, %174
  %191 = fadd float %53, %175
  %192 = fadd float %54, %176
  %193 = fadd float %55, %177
  %194 = fadd float %56, %178
  %195 = fadd float %57, %179
  %196 = fadd float %58, %180
  %197 = fadd float %59, %181
  %198 = fadd float %60, %182
  %199 = fadd float %61, %183
  %200 = fadd float %62, %184
  %201 = fadd float %63, %185
  %202 = fadd float %64, %186
  %203 = fadd float %65, %187
  %204 = fmul float %188, %188
  %205 = fmul float %189, %189
  %206 = fmul float %190, %190
  %207 = fmul float %191, %191
  %208 = fmul float %192, %192
  %209 = fmul float %193, %193
  %210 = fmul float %194, %194
  %211 = fmul float %195, %195
  %212 = fmul float %196, %196
  %213 = fmul float %197, %197
  %214 = fmul float %198, %198
  %215 = fmul float %199, %199
  %216 = fmul float %200, %200
  %217 = fmul float %201, %201
  %218 = fmul float %202, %202
  %219 = fmul float %203, %203
  %220 = fadd float %204, %205
  %221 = fadd float %220, %206
  %222 = fadd float %221, %207
  %223 = fadd float %222, %208
  %224 = fadd float %223, %209
  %225 = fadd float %224, %210
  %226 = fadd float %225, %211
  %227 = fadd float %226, %212
  %228 = fadd float %227, %213
  %229 = fadd float %228, %214
  %230 = fadd float %229, %215
  %231 = fadd float %230, %216
  %232 = fadd float %231, %217
  %233 = fadd float %232, %218
  %234 = fadd float %233, %219
  %235 = bitcast float %234 to i32
  %236 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %235, i32 16, i32 31)
  %237 = bitcast i32 %236 to float
  %238 = fadd float %234, %237
  %239 = bitcast float %238 to i32
  %240 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %239, i32 8, i32 31)
  %241 = bitcast i32 %240 to float
  %242 = fadd float %238, %241
  %243 = bitcast float %242 to i32
  %244 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %243, i32 4, i32 31)
  %245 = bitcast i32 %244 to float
  %246 = fadd float %242, %245
  %247 = bitcast float %246 to i32
  %248 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %247, i32 2, i32 31)
  %249 = bitcast i32 %248 to float
  %250 = fadd float %246, %249
  %251 = bitcast float %250 to i32
  %252 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %251, i32 1, i32 31)
  %253 = bitcast i32 %252 to float
  %254 = fadd float %250, %253
  %255 = icmp eq i32 %6, 0
  %256 = zext nneg i32 %7 to i64
  %257 = getelementptr float, ptr addrspace(3) @global_smem, i64 %256
  %258 = bitcast float %254 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %257, <1 x i32> %258, i1 %255) #9
  tail call void @llvm.nvvm.barrier0()
  %259 = icmp samesign ult i32 %5, 2
  %260 = zext nneg i32 %5 to i64
  %261 = getelementptr float, ptr addrspace(3) @global_smem, i64 %260
  %262 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %261, i1 %259) #9
  %263 = bitcast i32 %262 to float
  %264 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %262, i32 1, i32 31)
  %265 = bitcast i32 %264 to float
  %266 = fadd float %263, %265
  %267 = icmp eq i32 %5, 0
  %268 = bitcast float %266 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %261, <1 x i32> %268, i1 %267) #9
  tail call void @llvm.nvvm.barrier0()
  %269 = load float, ptr addrspace(3) @global_smem, align 16
  %270 = fmul float %269, 0x3F50000000000000
  %271 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %272 = bitcast i32 %271 to float
  %273 = fadd float %270, %272
  %274 = tail call float @llvm.nvvm.rsqrt.approx.f(float %273)
  %275 = fmul float %188, %274
  %276 = fmul float %189, %274
  %277 = fmul float %190, %274
  %278 = fmul float %191, %274
  %279 = fmul float %192, %274
  %280 = fmul float %193, %274
  %281 = fmul float %194, %274
  %282 = fmul float %195, %274
  %283 = fmul float %196, %274
  %284 = fmul float %197, %274
  %285 = fmul float %198, %274
  %286 = fmul float %199, %274
  %287 = fmul float %200, %274
  %288 = fmul float %201, %274
  %289 = fmul float %202, %274
  %290 = fmul float %203, %274
  %291 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %13
  %292 = getelementptr i8, ptr addrspace(1) %291, i64 1024
  %293 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %291) #9
  %294 = extractvalue { i32, i32, i32, i32 } %293, 0
  %295 = bitcast i32 %294 to <2 x bfloat>
  %296 = extractvalue { i32, i32, i32, i32 } %293, 1
  %297 = bitcast i32 %296 to <2 x bfloat>
  %298 = extractvalue { i32, i32, i32, i32 } %293, 2
  %299 = bitcast i32 %298 to <2 x bfloat>
  %300 = extractvalue { i32, i32, i32, i32 } %293, 3
  %301 = bitcast i32 %300 to <2 x bfloat>
  %302 = extractelement <2 x bfloat> %295, i64 0
  %303 = extractelement <2 x bfloat> %295, i64 1
  %304 = extractelement <2 x bfloat> %297, i64 0
  %305 = extractelement <2 x bfloat> %297, i64 1
  %306 = extractelement <2 x bfloat> %299, i64 0
  %307 = extractelement <2 x bfloat> %299, i64 1
  %308 = extractelement <2 x bfloat> %301, i64 0
  %309 = extractelement <2 x bfloat> %301, i64 1
  %310 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %292) #9
  %311 = extractvalue { i32, i32, i32, i32 } %310, 0
  %312 = bitcast i32 %311 to <2 x bfloat>
  %313 = extractvalue { i32, i32, i32, i32 } %310, 1
  %314 = bitcast i32 %313 to <2 x bfloat>
  %315 = extractvalue { i32, i32, i32, i32 } %310, 2
  %316 = bitcast i32 %315 to <2 x bfloat>
  %317 = extractvalue { i32, i32, i32, i32 } %310, 3
  %318 = bitcast i32 %317 to <2 x bfloat>
  %319 = extractelement <2 x bfloat> %312, i64 0
  %320 = extractelement <2 x bfloat> %312, i64 1
  %321 = extractelement <2 x bfloat> %314, i64 0
  %322 = extractelement <2 x bfloat> %314, i64 1
  %323 = extractelement <2 x bfloat> %316, i64 0
  %324 = extractelement <2 x bfloat> %316, i64 1
  %325 = extractelement <2 x bfloat> %318, i64 0
  %326 = extractelement <2 x bfloat> %318, i64 1
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %305) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %306) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %307) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %308) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %309) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #9
  %337 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %321) #9
  %338 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %322) #9
  %339 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %323) #9
  %340 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %324) #9
  %341 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %325) #9
  %342 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %326) #9
  %343 = fmul float %275, %327
  %344 = fmul float %276, %328
  %345 = fmul float %277, %329
  %346 = fmul float %278, %330
  %347 = fmul float %279, %331
  %348 = fmul float %280, %332
  %349 = fmul float %281, %333
  %350 = fmul float %282, %334
  %351 = fmul float %283, %335
  %352 = fmul float %284, %336
  %353 = fmul float %285, %337
  %354 = fmul float %286, %338
  %355 = fmul float %287, %339
  %356 = fmul float %288, %340
  %357 = fmul float %289, %341
  %358 = fmul float %290, %342
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
  %366 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %350) #9
  %367 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %351) #9
  %368 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %352) #9
  %369 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %353) #9
  %370 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %354) #9
  %371 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %355) #9
  %372 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %356) #9
  %373 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %357) #9
  %374 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %358) #9
  %375 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %376 = getelementptr bfloat, ptr addrspace(1) %375, i64 %13
  %377 = getelementptr i8, ptr addrspace(1) %376, i64 1024
  %378 = insertelement <2 x bfloat> poison, bfloat %359, i64 0
  %379 = insertelement <2 x bfloat> %378, bfloat %360, i64 1
  %380 = bitcast <2 x bfloat> %379 to i32
  %381 = insertelement <2 x bfloat> poison, bfloat %361, i64 0
  %382 = insertelement <2 x bfloat> %381, bfloat %362, i64 1
  %383 = bitcast <2 x bfloat> %382 to i32
  %384 = insertelement <2 x bfloat> poison, bfloat %363, i64 0
  %385 = insertelement <2 x bfloat> %384, bfloat %364, i64 1
  %386 = bitcast <2 x bfloat> %385 to i32
  %387 = insertelement <2 x bfloat> poison, bfloat %365, i64 0
  %388 = insertelement <2 x bfloat> %387, bfloat %366, i64 1
  %389 = bitcast <2 x bfloat> %388 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %380, i32 %383, i32 %386, i32 %389, ptr addrspace(1) %376) #9
  %390 = insertelement <2 x bfloat> poison, bfloat %367, i64 0
  %391 = insertelement <2 x bfloat> %390, bfloat %368, i64 1
  %392 = bitcast <2 x bfloat> %391 to i32
  %393 = insertelement <2 x bfloat> poison, bfloat %369, i64 0
  %394 = insertelement <2 x bfloat> %393, bfloat %370, i64 1
  %395 = bitcast <2 x bfloat> %394 to i32
  %396 = insertelement <2 x bfloat> poison, bfloat %371, i64 0
  %397 = insertelement <2 x bfloat> %396, bfloat %372, i64 1
  %398 = bitcast <2 x bfloat> %397 to i32
  %399 = insertelement <2 x bfloat> poison, bfloat %373, i64 0
  %400 = insertelement <2 x bfloat> %399, bfloat %374, i64 1
  %401 = bitcast <2 x bfloat> %400 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %392, i32 %395, i32 %398, i32 %401, ptr addrspace(1) %377) #9
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

define ptx_kernel void @fusion_21(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) local_unnamed_addr #5 {
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
!9 = distinct !{!9, !10, !"fused_convert_param_0_108: argument 0"}
!10 = distinct !{!10, !"fused_convert_param_0_108"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_param_0_108: argument 0"}
!13 = distinct !{!13, !"fused_convert_param_0_108"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_concatenate_convert_136_7: argument 0"}
!16 = distinct !{!16, !"fused_concatenate_convert_136_7"}
!17 = !{!18}
!18 = distinct !{!18, !16, !"fused_concatenate_convert_136_7: argument 1"}
!19 = !{!20}
!20 = distinct !{!20, !21, !"fused_concatenate_convert_136_7: argument 0"}
!21 = distinct !{!21, !"fused_concatenate_convert_136_7"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"fused_concatenate_convert_136_7: argument 1"}
!24 = !{i32 0, i32 135456}

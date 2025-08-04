; ModuleID = 'SyncTensorsGraph.811'
source_filename = "SyncTensorsGraph.811"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

define ptx_kernel void @loop_gather_fusion(ptr noalias align 16 dereferenceable(311164928) %0, ptr noalias align 16 dereferenceable(256) %1, ptr noalias align 128 dereferenceable(131072) %2) #0 {
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 16 dereferenceable(4194304) %5, ptr noalias align 16 dereferenceable(4194304) %6, ptr noalias align 16 dereferenceable(4194304) %7, ptr noalias align 16 dereferenceable(4194304) %8, ptr noalias align 128 dereferenceable(37748736) %9) #0 {
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %13 = udiv i32 %12, 4
  %14 = icmp ult i32 %13, 4096
  %15 = mul i32 %11, 4
  %16 = mul i32 %12, 512
  %17 = add i32 %15, %16
  br i1 %14, label %18, label %63

18:                                               ; preds = %10
  %19 = icmp ult i32 %13, 2048
  br i1 %19, label %20, label %37

20:                                               ; preds = %18
  %21 = icmp ult i32 %13, 1024
  br i1 %21, label %22, label %25

22:                                               ; preds = %20
  %23 = getelementptr inbounds bfloat, ptr %0, i32 %17
  %24 = load bfloat, ptr %23, align 2, !invariant.load !3
  br label %34

25:                                               ; preds = %20
  %26 = sub i32 %13, 1024
  %27 = urem i32 %12, 4
  %28 = mul i32 %27, 512
  %29 = add i32 %28, %15
  %30 = mul i32 %26, 2048
  %31 = add i32 %29, %30
  %32 = getelementptr inbounds bfloat, ptr %1, i32 %31
  %33 = load bfloat, ptr %32, align 2, !invariant.load !3
  br label %34

34:                                               ; preds = %22, %25
  %35 = phi bfloat [ %33, %25 ], [ %24, %22 ]
  br label %36

36:                                               ; preds = %34
  br label %60

37:                                               ; preds = %18
  %38 = icmp ult i32 %13, 3072
  br i1 %38, label %39, label %48

39:                                               ; preds = %37
  %40 = sub i32 %13, 2048
  %41 = urem i32 %12, 4
  %42 = mul i32 %41, 512
  %43 = add i32 %42, %15
  %44 = mul i32 %40, 2048
  %45 = add i32 %43, %44
  %46 = getelementptr inbounds bfloat, ptr %2, i32 %45
  %47 = load bfloat, ptr %46, align 2, !invariant.load !3
  br label %57

48:                                               ; preds = %37
  %49 = sub i32 %13, 3072
  %50 = urem i32 %12, 4
  %51 = mul i32 %50, 512
  %52 = add i32 %51, %15
  %53 = mul i32 %49, 2048
  %54 = add i32 %52, %53
  %55 = getelementptr inbounds bfloat, ptr %3, i32 %54
  %56 = load bfloat, ptr %55, align 2, !invariant.load !3
  br label %57

57:                                               ; preds = %39, %48
  %58 = phi bfloat [ %56, %48 ], [ %47, %39 ]
  br label %59

59:                                               ; preds = %57
  br label %60

60:                                               ; preds = %36, %59
  %61 = phi bfloat [ %58, %59 ], [ %35, %36 ]
  br label %62

62:                                               ; preds = %60
  br label %128

63:                                               ; preds = %10
  %64 = icmp ult i32 %13, 6144
  br i1 %64, label %65, label %88

65:                                               ; preds = %63
  %66 = icmp ult i32 %13, 5120
  br i1 %66, label %67, label %76

67:                                               ; preds = %65
  %68 = sub i32 %13, 4096
  %69 = urem i32 %12, 4
  %70 = mul i32 %69, 512
  %71 = add i32 %70, %15
  %72 = mul i32 %68, 2048
  %73 = add i32 %71, %72
  %74 = getelementptr inbounds bfloat, ptr %4, i32 %73
  %75 = load bfloat, ptr %74, align 2, !invariant.load !3
  br label %85

76:                                               ; preds = %65
  %77 = sub i32 %13, 5120
  %78 = urem i32 %12, 4
  %79 = mul i32 %78, 512
  %80 = add i32 %79, %15
  %81 = mul i32 %77, 2048
  %82 = add i32 %80, %81
  %83 = getelementptr inbounds bfloat, ptr %5, i32 %82
  %84 = load bfloat, ptr %83, align 2, !invariant.load !3
  br label %85

85:                                               ; preds = %67, %76
  %86 = phi bfloat [ %84, %76 ], [ %75, %67 ]
  br label %87

87:                                               ; preds = %85
  br label %125

88:                                               ; preds = %63
  %89 = icmp ult i32 %13, 7168
  br i1 %89, label %90, label %99

90:                                               ; preds = %88
  %91 = sub i32 %13, 6144
  %92 = urem i32 %12, 4
  %93 = mul i32 %92, 512
  %94 = add i32 %93, %15
  %95 = mul i32 %91, 2048
  %96 = add i32 %94, %95
  %97 = getelementptr inbounds bfloat, ptr %6, i32 %96
  %98 = load bfloat, ptr %97, align 2, !invariant.load !3
  br label %122

99:                                               ; preds = %88
  %100 = icmp ult i32 %13, 8192
  br i1 %100, label %101, label %110

101:                                              ; preds = %99
  %102 = sub i32 %13, 7168
  %103 = urem i32 %12, 4
  %104 = mul i32 %103, 512
  %105 = add i32 %104, %15
  %106 = mul i32 %102, 2048
  %107 = add i32 %105, %106
  %108 = getelementptr inbounds bfloat, ptr %7, i32 %107
  %109 = load bfloat, ptr %108, align 2, !invariant.load !3
  br label %119

110:                                              ; preds = %99
  %111 = sub i32 %13, 8192
  %112 = urem i32 %12, 4
  %113 = mul i32 %112, 512
  %114 = add i32 %113, %15
  %115 = mul i32 %111, 2048
  %116 = add i32 %114, %115
  %117 = getelementptr inbounds bfloat, ptr %8, i32 %116
  %118 = load bfloat, ptr %117, align 2, !invariant.load !3
  br label %119

119:                                              ; preds = %101, %110
  %120 = phi bfloat [ %118, %110 ], [ %109, %101 ]
  br label %121

121:                                              ; preds = %119
  br label %122

122:                                              ; preds = %90, %121
  %123 = phi bfloat [ %120, %121 ], [ %98, %90 ]
  br label %124

124:                                              ; preds = %122
  br label %125

125:                                              ; preds = %87, %124
  %126 = phi bfloat [ %123, %124 ], [ %86, %87 ]
  br label %127

127:                                              ; preds = %125
  br label %128

128:                                              ; preds = %62, %127
  %129 = phi bfloat [ %126, %127 ], [ %61, %62 ]
  br label %130

130:                                              ; preds = %128
  %131 = insertelement <4 x bfloat> zeroinitializer, bfloat %129, i64 0
  br i1 %14, label %132, label %181

132:                                              ; preds = %130
  %133 = icmp ult i32 %13, 2048
  br i1 %133, label %134, label %153

134:                                              ; preds = %132
  %135 = icmp ult i32 %13, 1024
  br i1 %135, label %136, label %140

136:                                              ; preds = %134
  %137 = add i32 %17, 1
  %138 = getelementptr inbounds bfloat, ptr %0, i32 %137
  %139 = load bfloat, ptr %138, align 2, !invariant.load !3
  br label %150

140:                                              ; preds = %134
  %141 = sub i32 %13, 1024
  %142 = urem i32 %12, 4
  %143 = mul i32 %142, 512
  %144 = add i32 %143, %15
  %145 = mul i32 %141, 2048
  %146 = add i32 %144, %145
  %147 = add i32 %146, 1
  %148 = getelementptr inbounds bfloat, ptr %1, i32 %147
  %149 = load bfloat, ptr %148, align 2, !invariant.load !3
  br label %150

150:                                              ; preds = %136, %140
  %151 = phi bfloat [ %149, %140 ], [ %139, %136 ]
  br label %152

152:                                              ; preds = %150
  br label %178

153:                                              ; preds = %132
  %154 = icmp ult i32 %13, 3072
  br i1 %154, label %155, label %165

155:                                              ; preds = %153
  %156 = sub i32 %13, 2048
  %157 = urem i32 %12, 4
  %158 = mul i32 %157, 512
  %159 = add i32 %158, %15
  %160 = mul i32 %156, 2048
  %161 = add i32 %159, %160
  %162 = add i32 %161, 1
  %163 = getelementptr inbounds bfloat, ptr %2, i32 %162
  %164 = load bfloat, ptr %163, align 2, !invariant.load !3
  br label %175

165:                                              ; preds = %153
  %166 = sub i32 %13, 3072
  %167 = urem i32 %12, 4
  %168 = mul i32 %167, 512
  %169 = add i32 %168, %15
  %170 = mul i32 %166, 2048
  %171 = add i32 %169, %170
  %172 = add i32 %171, 1
  %173 = getelementptr inbounds bfloat, ptr %3, i32 %172
  %174 = load bfloat, ptr %173, align 2, !invariant.load !3
  br label %175

175:                                              ; preds = %155, %165
  %176 = phi bfloat [ %174, %165 ], [ %164, %155 ]
  br label %177

177:                                              ; preds = %175
  br label %178

178:                                              ; preds = %152, %177
  %179 = phi bfloat [ %176, %177 ], [ %151, %152 ]
  br label %180

180:                                              ; preds = %178
  br label %251

181:                                              ; preds = %130
  %182 = icmp ult i32 %13, 6144
  br i1 %182, label %183, label %208

183:                                              ; preds = %181
  %184 = icmp ult i32 %13, 5120
  br i1 %184, label %185, label %195

185:                                              ; preds = %183
  %186 = sub i32 %13, 4096
  %187 = urem i32 %12, 4
  %188 = mul i32 %187, 512
  %189 = add i32 %188, %15
  %190 = mul i32 %186, 2048
  %191 = add i32 %189, %190
  %192 = add i32 %191, 1
  %193 = getelementptr inbounds bfloat, ptr %4, i32 %192
  %194 = load bfloat, ptr %193, align 2, !invariant.load !3
  br label %205

195:                                              ; preds = %183
  %196 = sub i32 %13, 5120
  %197 = urem i32 %12, 4
  %198 = mul i32 %197, 512
  %199 = add i32 %198, %15
  %200 = mul i32 %196, 2048
  %201 = add i32 %199, %200
  %202 = add i32 %201, 1
  %203 = getelementptr inbounds bfloat, ptr %5, i32 %202
  %204 = load bfloat, ptr %203, align 2, !invariant.load !3
  br label %205

205:                                              ; preds = %185, %195
  %206 = phi bfloat [ %204, %195 ], [ %194, %185 ]
  br label %207

207:                                              ; preds = %205
  br label %248

208:                                              ; preds = %181
  %209 = icmp ult i32 %13, 7168
  br i1 %209, label %210, label %220

210:                                              ; preds = %208
  %211 = sub i32 %13, 6144
  %212 = urem i32 %12, 4
  %213 = mul i32 %212, 512
  %214 = add i32 %213, %15
  %215 = mul i32 %211, 2048
  %216 = add i32 %214, %215
  %217 = add i32 %216, 1
  %218 = getelementptr inbounds bfloat, ptr %6, i32 %217
  %219 = load bfloat, ptr %218, align 2, !invariant.load !3
  br label %245

220:                                              ; preds = %208
  %221 = icmp ult i32 %13, 8192
  br i1 %221, label %222, label %232

222:                                              ; preds = %220
  %223 = sub i32 %13, 7168
  %224 = urem i32 %12, 4
  %225 = mul i32 %224, 512
  %226 = add i32 %225, %15
  %227 = mul i32 %223, 2048
  %228 = add i32 %226, %227
  %229 = add i32 %228, 1
  %230 = getelementptr inbounds bfloat, ptr %7, i32 %229
  %231 = load bfloat, ptr %230, align 2, !invariant.load !3
  br label %242

232:                                              ; preds = %220
  %233 = sub i32 %13, 8192
  %234 = urem i32 %12, 4
  %235 = mul i32 %234, 512
  %236 = add i32 %235, %15
  %237 = mul i32 %233, 2048
  %238 = add i32 %236, %237
  %239 = add i32 %238, 1
  %240 = getelementptr inbounds bfloat, ptr %8, i32 %239
  %241 = load bfloat, ptr %240, align 2, !invariant.load !3
  br label %242

242:                                              ; preds = %222, %232
  %243 = phi bfloat [ %241, %232 ], [ %231, %222 ]
  br label %244

244:                                              ; preds = %242
  br label %245

245:                                              ; preds = %210, %244
  %246 = phi bfloat [ %243, %244 ], [ %219, %210 ]
  br label %247

247:                                              ; preds = %245
  br label %248

248:                                              ; preds = %207, %247
  %249 = phi bfloat [ %246, %247 ], [ %206, %207 ]
  br label %250

250:                                              ; preds = %248
  br label %251

251:                                              ; preds = %180, %250
  %252 = phi bfloat [ %249, %250 ], [ %179, %180 ]
  br label %253

253:                                              ; preds = %251
  %254 = insertelement <4 x bfloat> %131, bfloat %252, i64 1
  br i1 %14, label %255, label %304

255:                                              ; preds = %253
  %256 = icmp ult i32 %13, 2048
  br i1 %256, label %257, label %276

257:                                              ; preds = %255
  %258 = icmp ult i32 %13, 1024
  br i1 %258, label %259, label %263

259:                                              ; preds = %257
  %260 = add i32 %17, 2
  %261 = getelementptr inbounds bfloat, ptr %0, i32 %260
  %262 = load bfloat, ptr %261, align 2, !invariant.load !3
  br label %273

263:                                              ; preds = %257
  %264 = sub i32 %13, 1024
  %265 = urem i32 %12, 4
  %266 = mul i32 %265, 512
  %267 = add i32 %266, %15
  %268 = mul i32 %264, 2048
  %269 = add i32 %267, %268
  %270 = add i32 %269, 2
  %271 = getelementptr inbounds bfloat, ptr %1, i32 %270
  %272 = load bfloat, ptr %271, align 2, !invariant.load !3
  br label %273

273:                                              ; preds = %259, %263
  %274 = phi bfloat [ %272, %263 ], [ %262, %259 ]
  br label %275

275:                                              ; preds = %273
  br label %301

276:                                              ; preds = %255
  %277 = icmp ult i32 %13, 3072
  br i1 %277, label %278, label %288

278:                                              ; preds = %276
  %279 = sub i32 %13, 2048
  %280 = urem i32 %12, 4
  %281 = mul i32 %280, 512
  %282 = add i32 %281, %15
  %283 = mul i32 %279, 2048
  %284 = add i32 %282, %283
  %285 = add i32 %284, 2
  %286 = getelementptr inbounds bfloat, ptr %2, i32 %285
  %287 = load bfloat, ptr %286, align 2, !invariant.load !3
  br label %298

288:                                              ; preds = %276
  %289 = sub i32 %13, 3072
  %290 = urem i32 %12, 4
  %291 = mul i32 %290, 512
  %292 = add i32 %291, %15
  %293 = mul i32 %289, 2048
  %294 = add i32 %292, %293
  %295 = add i32 %294, 2
  %296 = getelementptr inbounds bfloat, ptr %3, i32 %295
  %297 = load bfloat, ptr %296, align 2, !invariant.load !3
  br label %298

298:                                              ; preds = %278, %288
  %299 = phi bfloat [ %297, %288 ], [ %287, %278 ]
  br label %300

300:                                              ; preds = %298
  br label %301

301:                                              ; preds = %275, %300
  %302 = phi bfloat [ %299, %300 ], [ %274, %275 ]
  br label %303

303:                                              ; preds = %301
  br label %374

304:                                              ; preds = %253
  %305 = icmp ult i32 %13, 6144
  br i1 %305, label %306, label %331

306:                                              ; preds = %304
  %307 = icmp ult i32 %13, 5120
  br i1 %307, label %308, label %318

308:                                              ; preds = %306
  %309 = sub i32 %13, 4096
  %310 = urem i32 %12, 4
  %311 = mul i32 %310, 512
  %312 = add i32 %311, %15
  %313 = mul i32 %309, 2048
  %314 = add i32 %312, %313
  %315 = add i32 %314, 2
  %316 = getelementptr inbounds bfloat, ptr %4, i32 %315
  %317 = load bfloat, ptr %316, align 2, !invariant.load !3
  br label %328

318:                                              ; preds = %306
  %319 = sub i32 %13, 5120
  %320 = urem i32 %12, 4
  %321 = mul i32 %320, 512
  %322 = add i32 %321, %15
  %323 = mul i32 %319, 2048
  %324 = add i32 %322, %323
  %325 = add i32 %324, 2
  %326 = getelementptr inbounds bfloat, ptr %5, i32 %325
  %327 = load bfloat, ptr %326, align 2, !invariant.load !3
  br label %328

328:                                              ; preds = %308, %318
  %329 = phi bfloat [ %327, %318 ], [ %317, %308 ]
  br label %330

330:                                              ; preds = %328
  br label %371

331:                                              ; preds = %304
  %332 = icmp ult i32 %13, 7168
  br i1 %332, label %333, label %343

333:                                              ; preds = %331
  %334 = sub i32 %13, 6144
  %335 = urem i32 %12, 4
  %336 = mul i32 %335, 512
  %337 = add i32 %336, %15
  %338 = mul i32 %334, 2048
  %339 = add i32 %337, %338
  %340 = add i32 %339, 2
  %341 = getelementptr inbounds bfloat, ptr %6, i32 %340
  %342 = load bfloat, ptr %341, align 2, !invariant.load !3
  br label %368

343:                                              ; preds = %331
  %344 = icmp ult i32 %13, 8192
  br i1 %344, label %345, label %355

345:                                              ; preds = %343
  %346 = sub i32 %13, 7168
  %347 = urem i32 %12, 4
  %348 = mul i32 %347, 512
  %349 = add i32 %348, %15
  %350 = mul i32 %346, 2048
  %351 = add i32 %349, %350
  %352 = add i32 %351, 2
  %353 = getelementptr inbounds bfloat, ptr %7, i32 %352
  %354 = load bfloat, ptr %353, align 2, !invariant.load !3
  br label %365

355:                                              ; preds = %343
  %356 = sub i32 %13, 8192
  %357 = urem i32 %12, 4
  %358 = mul i32 %357, 512
  %359 = add i32 %358, %15
  %360 = mul i32 %356, 2048
  %361 = add i32 %359, %360
  %362 = add i32 %361, 2
  %363 = getelementptr inbounds bfloat, ptr %8, i32 %362
  %364 = load bfloat, ptr %363, align 2, !invariant.load !3
  br label %365

365:                                              ; preds = %345, %355
  %366 = phi bfloat [ %364, %355 ], [ %354, %345 ]
  br label %367

367:                                              ; preds = %365
  br label %368

368:                                              ; preds = %333, %367
  %369 = phi bfloat [ %366, %367 ], [ %342, %333 ]
  br label %370

370:                                              ; preds = %368
  br label %371

371:                                              ; preds = %330, %370
  %372 = phi bfloat [ %369, %370 ], [ %329, %330 ]
  br label %373

373:                                              ; preds = %371
  br label %374

374:                                              ; preds = %303, %373
  %375 = phi bfloat [ %372, %373 ], [ %302, %303 ]
  br label %376

376:                                              ; preds = %374
  %377 = insertelement <4 x bfloat> %254, bfloat %375, i64 2
  br i1 %14, label %378, label %427

378:                                              ; preds = %376
  %379 = icmp ult i32 %13, 2048
  br i1 %379, label %380, label %399

380:                                              ; preds = %378
  %381 = icmp ult i32 %13, 1024
  br i1 %381, label %382, label %386

382:                                              ; preds = %380
  %383 = add i32 %17, 3
  %384 = getelementptr inbounds bfloat, ptr %0, i32 %383
  %385 = load bfloat, ptr %384, align 2, !invariant.load !3
  br label %396

386:                                              ; preds = %380
  %387 = sub i32 %13, 1024
  %388 = urem i32 %12, 4
  %389 = mul i32 %388, 512
  %390 = add i32 %389, %15
  %391 = mul i32 %387, 2048
  %392 = add i32 %390, %391
  %393 = add i32 %392, 3
  %394 = getelementptr inbounds bfloat, ptr %1, i32 %393
  %395 = load bfloat, ptr %394, align 2, !invariant.load !3
  br label %396

396:                                              ; preds = %382, %386
  %397 = phi bfloat [ %395, %386 ], [ %385, %382 ]
  br label %398

398:                                              ; preds = %396
  br label %424

399:                                              ; preds = %378
  %400 = icmp ult i32 %13, 3072
  br i1 %400, label %401, label %411

401:                                              ; preds = %399
  %402 = sub i32 %13, 2048
  %403 = urem i32 %12, 4
  %404 = mul i32 %403, 512
  %405 = add i32 %404, %15
  %406 = mul i32 %402, 2048
  %407 = add i32 %405, %406
  %408 = add i32 %407, 3
  %409 = getelementptr inbounds bfloat, ptr %2, i32 %408
  %410 = load bfloat, ptr %409, align 2, !invariant.load !3
  br label %421

411:                                              ; preds = %399
  %412 = sub i32 %13, 3072
  %413 = urem i32 %12, 4
  %414 = mul i32 %413, 512
  %415 = add i32 %414, %15
  %416 = mul i32 %412, 2048
  %417 = add i32 %415, %416
  %418 = add i32 %417, 3
  %419 = getelementptr inbounds bfloat, ptr %3, i32 %418
  %420 = load bfloat, ptr %419, align 2, !invariant.load !3
  br label %421

421:                                              ; preds = %401, %411
  %422 = phi bfloat [ %420, %411 ], [ %410, %401 ]
  br label %423

423:                                              ; preds = %421
  br label %424

424:                                              ; preds = %398, %423
  %425 = phi bfloat [ %422, %423 ], [ %397, %398 ]
  br label %426

426:                                              ; preds = %424
  br label %497

427:                                              ; preds = %376
  %428 = icmp ult i32 %13, 6144
  br i1 %428, label %429, label %454

429:                                              ; preds = %427
  %430 = icmp ult i32 %13, 5120
  br i1 %430, label %431, label %441

431:                                              ; preds = %429
  %432 = sub i32 %13, 4096
  %433 = urem i32 %12, 4
  %434 = mul i32 %433, 512
  %435 = add i32 %434, %15
  %436 = mul i32 %432, 2048
  %437 = add i32 %435, %436
  %438 = add i32 %437, 3
  %439 = getelementptr inbounds bfloat, ptr %4, i32 %438
  %440 = load bfloat, ptr %439, align 2, !invariant.load !3
  br label %451

441:                                              ; preds = %429
  %442 = sub i32 %13, 5120
  %443 = urem i32 %12, 4
  %444 = mul i32 %443, 512
  %445 = add i32 %444, %15
  %446 = mul i32 %442, 2048
  %447 = add i32 %445, %446
  %448 = add i32 %447, 3
  %449 = getelementptr inbounds bfloat, ptr %5, i32 %448
  %450 = load bfloat, ptr %449, align 2, !invariant.load !3
  br label %451

451:                                              ; preds = %431, %441
  %452 = phi bfloat [ %450, %441 ], [ %440, %431 ]
  br label %453

453:                                              ; preds = %451
  br label %494

454:                                              ; preds = %427
  %455 = icmp ult i32 %13, 7168
  br i1 %455, label %456, label %466

456:                                              ; preds = %454
  %457 = sub i32 %13, 6144
  %458 = urem i32 %12, 4
  %459 = mul i32 %458, 512
  %460 = add i32 %459, %15
  %461 = mul i32 %457, 2048
  %462 = add i32 %460, %461
  %463 = add i32 %462, 3
  %464 = getelementptr inbounds bfloat, ptr %6, i32 %463
  %465 = load bfloat, ptr %464, align 2, !invariant.load !3
  br label %491

466:                                              ; preds = %454
  %467 = icmp ult i32 %13, 8192
  br i1 %467, label %468, label %478

468:                                              ; preds = %466
  %469 = sub i32 %13, 7168
  %470 = urem i32 %12, 4
  %471 = mul i32 %470, 512
  %472 = add i32 %471, %15
  %473 = mul i32 %469, 2048
  %474 = add i32 %472, %473
  %475 = add i32 %474, 3
  %476 = getelementptr inbounds bfloat, ptr %7, i32 %475
  %477 = load bfloat, ptr %476, align 2, !invariant.load !3
  br label %488

478:                                              ; preds = %466
  %479 = sub i32 %13, 8192
  %480 = urem i32 %12, 4
  %481 = mul i32 %480, 512
  %482 = add i32 %481, %15
  %483 = mul i32 %479, 2048
  %484 = add i32 %482, %483
  %485 = add i32 %484, 3
  %486 = getelementptr inbounds bfloat, ptr %8, i32 %485
  %487 = load bfloat, ptr %486, align 2, !invariant.load !3
  br label %488

488:                                              ; preds = %468, %478
  %489 = phi bfloat [ %487, %478 ], [ %477, %468 ]
  br label %490

490:                                              ; preds = %488
  br label %491

491:                                              ; preds = %456, %490
  %492 = phi bfloat [ %489, %490 ], [ %465, %456 ]
  br label %493

493:                                              ; preds = %491
  br label %494

494:                                              ; preds = %453, %493
  %495 = phi bfloat [ %492, %493 ], [ %452, %453 ]
  br label %496

496:                                              ; preds = %494
  br label %497

497:                                              ; preds = %426, %496
  %498 = phi bfloat [ %495, %496 ], [ %425, %426 ]
  br label %499

499:                                              ; preds = %497
  %500 = insertelement <4 x bfloat> %377, bfloat %498, i64 3
  %501 = getelementptr inbounds bfloat, ptr %9, i32 %17
  store <4 x bfloat> %500, ptr %501, align 8
  ret void
}

declare ptx_kernel void @gemm_fusion_dot_35_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_35_0(ptr noalias align 128 dereferenceable(37748736) %arg0, ptr noalias align 128 dereferenceable(1179648) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 1152
  %6 = mul i32 %5, 8
  %7 = sub i32 1, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 1152
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %13, 64
  %15 = sext i32 %14 to i64
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = urem i32 %16, 32
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 0, i32 8
  %21 = xor i32 0, %20
  %22 = and i32 %17, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 0, i32 16
  %25 = xor i32 %21, %24
  %26 = and i32 %17, 4
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 0, i32 32
  %29 = xor i32 %25, %28
  %30 = and i32 %17, 8
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, i32 0, i32 64
  %33 = xor i32 %29, %32
  %34 = xor i32 %33, 0
  %35 = add i32 %34, 0
  %36 = sext i32 %35 to i64
  %37 = udiv i32 %16, 32
  %38 = and i32 %17, 16
  %39 = icmp eq i32 %38, 0
  %40 = select i1 %39, i32 0, i32 1
  %41 = xor i32 0, %40
  %42 = and i32 %37, 1
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, i32 0, i32 2
  %45 = xor i32 %41, %44
  %46 = and i32 %37, 2
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %47, i32 0, i32 4
  %49 = xor i32 %45, %48
  %50 = xor i32 %49, 0
  %51 = xor i32 %49, 8
  %52 = xor i32 %49, 16
  %53 = xor i32 %49, 24
  %54 = xor i32 %49, 32
  %55 = xor i32 %49, 40
  %56 = xor i32 %49, 48
  %57 = xor i32 %49, 56
  %58 = add i32 %50, 0
  %59 = add i32 %51, 0
  %60 = add i32 %52, 0
  %61 = add i32 %53, 0
  %62 = add i32 %54, 0
  %63 = add i32 %55, 0
  %64 = add i32 %56, 0
  %65 = add i32 %57, 0
  %66 = sext i32 %58 to i64
  %67 = sext i32 %59 to i64
  %68 = sext i32 %60 to i64
  %69 = sext i32 %61 to i64
  %70 = sext i32 %62 to i64
  %71 = sext i32 %63 to i64
  %72 = sext i32 %64 to i64
  %73 = sext i32 %65 to i64
  %74 = add i64 %15, %66
  %75 = add i64 %15, %67
  %76 = add i64 %15, %68
  %77 = add i64 %15, %69
  %78 = add i64 %15, %70
  %79 = add i64 %15, %71
  %80 = add i64 %15, %72
  %81 = add i64 %15, %73
  %82 = mul i64 %74, 2048
  %83 = mul i64 %75, 2048
  %84 = mul i64 %76, 2048
  %85 = mul i64 %77, 2048
  %86 = mul i64 %78, 2048
  %87 = mul i64 %79, 2048
  %88 = mul i64 %80, 2048
  %89 = mul i64 %81, 2048
  %90 = add i64 %36, %82
  %91 = add i64 %36, %83
  %92 = add i64 %36, %84
  %93 = add i64 %36, %85
  %94 = add i64 %36, %86
  %95 = add i64 %36, %87
  %96 = add i64 %36, %88
  %97 = add i64 %36, %89
  %98 = getelementptr bfloat, ptr addrspace(1) %1, i64 %90
  %99 = getelementptr bfloat, ptr addrspace(1) %1, i64 %91
  %100 = getelementptr bfloat, ptr addrspace(1) %1, i64 %92
  %101 = getelementptr bfloat, ptr addrspace(1) %1, i64 %93
  %102 = getelementptr bfloat, ptr addrspace(1) %1, i64 %94
  %103 = getelementptr bfloat, ptr addrspace(1) %1, i64 %95
  %104 = getelementptr bfloat, ptr addrspace(1) %1, i64 %96
  %105 = getelementptr bfloat, ptr addrspace(1) %1, i64 %97
  %106 = select i1 %39, i32 0, i32 136
  %107 = xor i32 %33, %106
  %108 = select i1 %43, i32 0, i32 272
  %109 = xor i32 %107, %108
  %110 = select i1 %47, i32 0, i32 544
  %111 = xor i32 %109, %110
  %112 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %111
  %113 = xor i32 1024, %20
  %114 = xor i32 %113, %24
  %115 = xor i32 %114, %28
  %116 = xor i32 %115, %32
  %117 = xor i32 %116, %106
  %118 = xor i32 %117, %108
  %119 = xor i32 %118, %110
  %120 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %119
  %121 = xor i32 2048, %20
  %122 = xor i32 %121, %24
  %123 = xor i32 %122, %28
  %124 = xor i32 %123, %32
  %125 = xor i32 %124, %106
  %126 = xor i32 %125, %108
  %127 = xor i32 %126, %110
  %128 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %127
  %129 = xor i32 3072, %20
  %130 = xor i32 %129, %24
  %131 = xor i32 %130, %28
  %132 = xor i32 %131, %32
  %133 = xor i32 %132, %106
  %134 = xor i32 %133, %108
  %135 = xor i32 %134, %110
  %136 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %135
  %137 = xor i32 4096, %20
  %138 = xor i32 %137, %24
  %139 = xor i32 %138, %28
  %140 = xor i32 %139, %32
  %141 = xor i32 %140, %106
  %142 = xor i32 %141, %108
  %143 = xor i32 %142, %110
  %144 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %143
  %145 = xor i32 5120, %20
  %146 = xor i32 %145, %24
  %147 = xor i32 %146, %28
  %148 = xor i32 %147, %32
  %149 = xor i32 %148, %106
  %150 = xor i32 %149, %108
  %151 = xor i32 %150, %110
  %152 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %151
  %153 = xor i32 6144, %20
  %154 = xor i32 %153, %24
  %155 = xor i32 %154, %28
  %156 = xor i32 %155, %32
  %157 = xor i32 %156, %106
  %158 = xor i32 %157, %108
  %159 = xor i32 %158, %110
  %160 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %159
  %161 = xor i32 7168, %20
  %162 = xor i32 %161, %24
  %163 = xor i32 %162, %28
  %164 = xor i32 %163, %32
  %165 = xor i32 %164, %106
  %166 = xor i32 %165, %108
  %167 = xor i32 %166, %110
  %168 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %112, ptr addrspace(1) %98, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %120, ptr addrspace(1) %99, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %128, ptr addrspace(1) %100, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %136, ptr addrspace(1) %101, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %102, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %103, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %160, ptr addrspace(1) %104, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %105, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %169 = add i64 %36, 128
  %170 = add i64 %169, %82
  %171 = add i64 %169, %83
  %172 = add i64 %169, %84
  %173 = add i64 %169, %85
  %174 = add i64 %169, %86
  %175 = add i64 %169, %87
  %176 = add i64 %169, %88
  %177 = add i64 %169, %89
  %178 = getelementptr bfloat, ptr addrspace(1) %1, i64 %170
  %179 = getelementptr bfloat, ptr addrspace(1) %1, i64 %171
  %180 = getelementptr bfloat, ptr addrspace(1) %1, i64 %172
  %181 = getelementptr bfloat, ptr addrspace(1) %1, i64 %173
  %182 = getelementptr bfloat, ptr addrspace(1) %1, i64 %174
  %183 = getelementptr bfloat, ptr addrspace(1) %1, i64 %175
  %184 = getelementptr bfloat, ptr addrspace(1) %1, i64 %176
  %185 = getelementptr bfloat, ptr addrspace(1) %1, i64 %177
  call void @llvm.nvvm.barrier0()
  %186 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %111
  %187 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %119
  %188 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %127
  %189 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %135
  %190 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %143
  %191 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %151
  %192 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %159
  %193 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %186, ptr addrspace(1) %178, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %187, ptr addrspace(1) %179, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %188, ptr addrspace(1) %180, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %189, ptr addrspace(1) %181, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %190, ptr addrspace(1) %182, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %191, ptr addrspace(1) %183, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %184, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %193, ptr addrspace(1) %185, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %194 = add i64 %36, 256
  %195 = add i64 %194, %82
  %196 = add i64 %194, %83
  %197 = add i64 %194, %84
  %198 = add i64 %194, %85
  %199 = add i64 %194, %86
  %200 = add i64 %194, %87
  %201 = add i64 %194, %88
  %202 = add i64 %194, %89
  %203 = getelementptr bfloat, ptr addrspace(1) %1, i64 %195
  %204 = getelementptr bfloat, ptr addrspace(1) %1, i64 %196
  %205 = getelementptr bfloat, ptr addrspace(1) %1, i64 %197
  %206 = getelementptr bfloat, ptr addrspace(1) %1, i64 %198
  %207 = getelementptr bfloat, ptr addrspace(1) %1, i64 %199
  %208 = getelementptr bfloat, ptr addrspace(1) %1, i64 %200
  %209 = getelementptr bfloat, ptr addrspace(1) %1, i64 %201
  %210 = getelementptr bfloat, ptr addrspace(1) %1, i64 %202
  call void @llvm.nvvm.barrier0()
  %211 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %111
  %212 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %119
  %213 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %127
  %214 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %135
  %215 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %143
  %216 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %151
  %217 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %159
  %218 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %167
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %211, ptr addrspace(1) %203, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %212, ptr addrspace(1) %204, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %213, ptr addrspace(1) %205, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %214, ptr addrspace(1) %206, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %215, ptr addrspace(1) %207, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %216, ptr addrspace(1) %208, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %217, ptr addrspace(1) %209, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %218, ptr addrspace(1) %210, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %219

219:                                              ; preds = %227, %0
  %220 = phi i32 [ %1258, %227 ], [ 0, %0 ]
  %221 = phi i64 [ %1212, %227 ], [ 256, %0 ]
  %222 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %1211, %227 ], [ zeroinitializer, %0 ]
  %223 = phi i32 [ %1215, %227 ], [ 2, %0 ]
  %224 = phi i32 [ %1249, %227 ], [ 0, %0 ]
  %225 = phi { ptr addrspace(3), i32, i32 } [ %1257, %227 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %226 = icmp slt i32 %220, 2048
  br i1 %226, label %227, label %1259

227:                                              ; preds = %219
  %228 = icmp slt i32 %220, 1664
  %229 = extractvalue { ptr addrspace(3), i32, i32 } %225, 0
  %230 = select i1 %19, i32 0, i32 136
  %231 = xor i32 0, %230
  %232 = select i1 %23, i32 0, i32 272
  %233 = xor i32 %231, %232
  %234 = select i1 %27, i32 0, i32 544
  %235 = xor i32 %233, %234
  %236 = select i1 %31, i32 0, i32 8
  %237 = xor i32 %235, %236
  %238 = select i1 %39, i32 0, i32 16
  %239 = xor i32 %237, %238
  %240 = select i1 %43, i32 0, i32 1024
  %241 = xor i32 %239, %240
  %242 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %241
  %243 = ptrtoint ptr addrspace(3) %242 to i32
  %244 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %243)
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = extractvalue { i32, i32, i32, i32 } %244, 1
  %247 = extractvalue { i32, i32, i32, i32 } %244, 2
  %248 = extractvalue { i32, i32, i32, i32 } %244, 3
  %249 = xor i32 32, %230
  %250 = xor i32 %249, %232
  %251 = xor i32 %250, %234
  %252 = xor i32 %251, %236
  %253 = xor i32 %252, %238
  %254 = xor i32 %253, %240
  %255 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %254
  %256 = ptrtoint ptr addrspace(3) %255 to i32
  %257 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %256)
  %258 = extractvalue { i32, i32, i32, i32 } %257, 0
  %259 = extractvalue { i32, i32, i32, i32 } %257, 1
  %260 = extractvalue { i32, i32, i32, i32 } %257, 2
  %261 = extractvalue { i32, i32, i32, i32 } %257, 3
  %262 = xor i32 64, %230
  %263 = xor i32 %262, %232
  %264 = xor i32 %263, %234
  %265 = xor i32 %264, %236
  %266 = xor i32 %265, %238
  %267 = xor i32 %266, %240
  %268 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %267
  %269 = ptrtoint ptr addrspace(3) %268 to i32
  %270 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %269)
  %271 = extractvalue { i32, i32, i32, i32 } %270, 0
  %272 = extractvalue { i32, i32, i32, i32 } %270, 1
  %273 = extractvalue { i32, i32, i32, i32 } %270, 2
  %274 = extractvalue { i32, i32, i32, i32 } %270, 3
  %275 = xor i32 96, %230
  %276 = xor i32 %275, %232
  %277 = xor i32 %276, %234
  %278 = xor i32 %277, %236
  %279 = xor i32 %278, %238
  %280 = xor i32 %279, %240
  %281 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %280
  %282 = ptrtoint ptr addrspace(3) %281 to i32
  %283 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %282)
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = extractvalue { i32, i32, i32, i32 } %283, 1
  %286 = extractvalue { i32, i32, i32, i32 } %283, 2
  %287 = extractvalue { i32, i32, i32, i32 } %283, 3
  %288 = xor i32 2048, %230
  %289 = xor i32 %288, %232
  %290 = xor i32 %289, %234
  %291 = xor i32 %290, %236
  %292 = xor i32 %291, %238
  %293 = xor i32 %292, %240
  %294 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %293
  %295 = ptrtoint ptr addrspace(3) %294 to i32
  %296 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %295)
  %297 = extractvalue { i32, i32, i32, i32 } %296, 0
  %298 = extractvalue { i32, i32, i32, i32 } %296, 1
  %299 = extractvalue { i32, i32, i32, i32 } %296, 2
  %300 = extractvalue { i32, i32, i32, i32 } %296, 3
  %301 = xor i32 2080, %230
  %302 = xor i32 %301, %232
  %303 = xor i32 %302, %234
  %304 = xor i32 %303, %236
  %305 = xor i32 %304, %238
  %306 = xor i32 %305, %240
  %307 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %306
  %308 = ptrtoint ptr addrspace(3) %307 to i32
  %309 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %308)
  %310 = extractvalue { i32, i32, i32, i32 } %309, 0
  %311 = extractvalue { i32, i32, i32, i32 } %309, 1
  %312 = extractvalue { i32, i32, i32, i32 } %309, 2
  %313 = extractvalue { i32, i32, i32, i32 } %309, 3
  %314 = xor i32 2112, %230
  %315 = xor i32 %314, %232
  %316 = xor i32 %315, %234
  %317 = xor i32 %316, %236
  %318 = xor i32 %317, %238
  %319 = xor i32 %318, %240
  %320 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %319
  %321 = ptrtoint ptr addrspace(3) %320 to i32
  %322 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %321)
  %323 = extractvalue { i32, i32, i32, i32 } %322, 0
  %324 = extractvalue { i32, i32, i32, i32 } %322, 1
  %325 = extractvalue { i32, i32, i32, i32 } %322, 2
  %326 = extractvalue { i32, i32, i32, i32 } %322, 3
  %327 = xor i32 2144, %230
  %328 = xor i32 %327, %232
  %329 = xor i32 %328, %234
  %330 = xor i32 %329, %236
  %331 = xor i32 %330, %238
  %332 = xor i32 %331, %240
  %333 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %332
  %334 = ptrtoint ptr addrspace(3) %333 to i32
  %335 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %334)
  %336 = extractvalue { i32, i32, i32, i32 } %335, 0
  %337 = extractvalue { i32, i32, i32, i32 } %335, 1
  %338 = extractvalue { i32, i32, i32, i32 } %335, 2
  %339 = extractvalue { i32, i32, i32, i32 } %335, 3
  %340 = xor i32 4096, %230
  %341 = xor i32 %340, %232
  %342 = xor i32 %341, %234
  %343 = xor i32 %342, %236
  %344 = xor i32 %343, %238
  %345 = xor i32 %344, %240
  %346 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %345
  %347 = ptrtoint ptr addrspace(3) %346 to i32
  %348 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %347)
  %349 = extractvalue { i32, i32, i32, i32 } %348, 0
  %350 = extractvalue { i32, i32, i32, i32 } %348, 1
  %351 = extractvalue { i32, i32, i32, i32 } %348, 2
  %352 = extractvalue { i32, i32, i32, i32 } %348, 3
  %353 = xor i32 4128, %230
  %354 = xor i32 %353, %232
  %355 = xor i32 %354, %234
  %356 = xor i32 %355, %236
  %357 = xor i32 %356, %238
  %358 = xor i32 %357, %240
  %359 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %358
  %360 = ptrtoint ptr addrspace(3) %359 to i32
  %361 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %360)
  %362 = extractvalue { i32, i32, i32, i32 } %361, 0
  %363 = extractvalue { i32, i32, i32, i32 } %361, 1
  %364 = extractvalue { i32, i32, i32, i32 } %361, 2
  %365 = extractvalue { i32, i32, i32, i32 } %361, 3
  %366 = xor i32 4160, %230
  %367 = xor i32 %366, %232
  %368 = xor i32 %367, %234
  %369 = xor i32 %368, %236
  %370 = xor i32 %369, %238
  %371 = xor i32 %370, %240
  %372 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %371
  %373 = ptrtoint ptr addrspace(3) %372 to i32
  %374 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %373)
  %375 = extractvalue { i32, i32, i32, i32 } %374, 0
  %376 = extractvalue { i32, i32, i32, i32 } %374, 1
  %377 = extractvalue { i32, i32, i32, i32 } %374, 2
  %378 = extractvalue { i32, i32, i32, i32 } %374, 3
  %379 = xor i32 4192, %230
  %380 = xor i32 %379, %232
  %381 = xor i32 %380, %234
  %382 = xor i32 %381, %236
  %383 = xor i32 %382, %238
  %384 = xor i32 %383, %240
  %385 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %384
  %386 = ptrtoint ptr addrspace(3) %385 to i32
  %387 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %386)
  %388 = extractvalue { i32, i32, i32, i32 } %387, 0
  %389 = extractvalue { i32, i32, i32, i32 } %387, 1
  %390 = extractvalue { i32, i32, i32, i32 } %387, 2
  %391 = extractvalue { i32, i32, i32, i32 } %387, 3
  %392 = xor i32 6144, %230
  %393 = xor i32 %392, %232
  %394 = xor i32 %393, %234
  %395 = xor i32 %394, %236
  %396 = xor i32 %395, %238
  %397 = xor i32 %396, %240
  %398 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %397
  %399 = ptrtoint ptr addrspace(3) %398 to i32
  %400 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %399)
  %401 = extractvalue { i32, i32, i32, i32 } %400, 0
  %402 = extractvalue { i32, i32, i32, i32 } %400, 1
  %403 = extractvalue { i32, i32, i32, i32 } %400, 2
  %404 = extractvalue { i32, i32, i32, i32 } %400, 3
  %405 = xor i32 6176, %230
  %406 = xor i32 %405, %232
  %407 = xor i32 %406, %234
  %408 = xor i32 %407, %236
  %409 = xor i32 %408, %238
  %410 = xor i32 %409, %240
  %411 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %410
  %412 = ptrtoint ptr addrspace(3) %411 to i32
  %413 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %412)
  %414 = extractvalue { i32, i32, i32, i32 } %413, 0
  %415 = extractvalue { i32, i32, i32, i32 } %413, 1
  %416 = extractvalue { i32, i32, i32, i32 } %413, 2
  %417 = extractvalue { i32, i32, i32, i32 } %413, 3
  %418 = xor i32 6208, %230
  %419 = xor i32 %418, %232
  %420 = xor i32 %419, %234
  %421 = xor i32 %420, %236
  %422 = xor i32 %421, %238
  %423 = xor i32 %422, %240
  %424 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %423
  %425 = ptrtoint ptr addrspace(3) %424 to i32
  %426 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %425)
  %427 = extractvalue { i32, i32, i32, i32 } %426, 0
  %428 = extractvalue { i32, i32, i32, i32 } %426, 1
  %429 = extractvalue { i32, i32, i32, i32 } %426, 2
  %430 = extractvalue { i32, i32, i32, i32 } %426, 3
  %431 = xor i32 6240, %230
  %432 = xor i32 %431, %232
  %433 = xor i32 %432, %234
  %434 = xor i32 %433, %236
  %435 = xor i32 %434, %238
  %436 = xor i32 %435, %240
  %437 = getelementptr inbounds bfloat, ptr addrspace(3) %229, i32 %436
  %438 = ptrtoint ptr addrspace(3) %437 to i32
  %439 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %438)
  %440 = extractvalue { i32, i32, i32, i32 } %439, 0
  %441 = extractvalue { i32, i32, i32, i32 } %439, 1
  %442 = extractvalue { i32, i32, i32, i32 } %439, 2
  %443 = extractvalue { i32, i32, i32, i32 } %439, 3
  %444 = bitcast i32 %245 to <2 x bfloat>
  %445 = extractelement <2 x bfloat> %444, i32 0
  %446 = extractelement <2 x bfloat> %444, i32 1
  %447 = bitcast i32 %246 to <2 x bfloat>
  %448 = extractelement <2 x bfloat> %447, i32 0
  %449 = extractelement <2 x bfloat> %447, i32 1
  %450 = bitcast i32 %247 to <2 x bfloat>
  %451 = extractelement <2 x bfloat> %450, i32 0
  %452 = extractelement <2 x bfloat> %450, i32 1
  %453 = bitcast i32 %248 to <2 x bfloat>
  %454 = extractelement <2 x bfloat> %453, i32 0
  %455 = extractelement <2 x bfloat> %453, i32 1
  %456 = bitcast i32 %258 to <2 x bfloat>
  %457 = extractelement <2 x bfloat> %456, i32 0
  %458 = extractelement <2 x bfloat> %456, i32 1
  %459 = bitcast i32 %259 to <2 x bfloat>
  %460 = extractelement <2 x bfloat> %459, i32 0
  %461 = extractelement <2 x bfloat> %459, i32 1
  %462 = bitcast i32 %260 to <2 x bfloat>
  %463 = extractelement <2 x bfloat> %462, i32 0
  %464 = extractelement <2 x bfloat> %462, i32 1
  %465 = bitcast i32 %261 to <2 x bfloat>
  %466 = extractelement <2 x bfloat> %465, i32 0
  %467 = extractelement <2 x bfloat> %465, i32 1
  %468 = bitcast i32 %271 to <2 x bfloat>
  %469 = extractelement <2 x bfloat> %468, i32 0
  %470 = extractelement <2 x bfloat> %468, i32 1
  %471 = bitcast i32 %272 to <2 x bfloat>
  %472 = extractelement <2 x bfloat> %471, i32 0
  %473 = extractelement <2 x bfloat> %471, i32 1
  %474 = bitcast i32 %273 to <2 x bfloat>
  %475 = extractelement <2 x bfloat> %474, i32 0
  %476 = extractelement <2 x bfloat> %474, i32 1
  %477 = bitcast i32 %274 to <2 x bfloat>
  %478 = extractelement <2 x bfloat> %477, i32 0
  %479 = extractelement <2 x bfloat> %477, i32 1
  %480 = bitcast i32 %284 to <2 x bfloat>
  %481 = extractelement <2 x bfloat> %480, i32 0
  %482 = extractelement <2 x bfloat> %480, i32 1
  %483 = bitcast i32 %285 to <2 x bfloat>
  %484 = extractelement <2 x bfloat> %483, i32 0
  %485 = extractelement <2 x bfloat> %483, i32 1
  %486 = bitcast i32 %286 to <2 x bfloat>
  %487 = extractelement <2 x bfloat> %486, i32 0
  %488 = extractelement <2 x bfloat> %486, i32 1
  %489 = bitcast i32 %287 to <2 x bfloat>
  %490 = extractelement <2 x bfloat> %489, i32 0
  %491 = extractelement <2 x bfloat> %489, i32 1
  %492 = bitcast i32 %297 to <2 x bfloat>
  %493 = extractelement <2 x bfloat> %492, i32 0
  %494 = extractelement <2 x bfloat> %492, i32 1
  %495 = bitcast i32 %298 to <2 x bfloat>
  %496 = extractelement <2 x bfloat> %495, i32 0
  %497 = extractelement <2 x bfloat> %495, i32 1
  %498 = bitcast i32 %299 to <2 x bfloat>
  %499 = extractelement <2 x bfloat> %498, i32 0
  %500 = extractelement <2 x bfloat> %498, i32 1
  %501 = bitcast i32 %300 to <2 x bfloat>
  %502 = extractelement <2 x bfloat> %501, i32 0
  %503 = extractelement <2 x bfloat> %501, i32 1
  %504 = bitcast i32 %310 to <2 x bfloat>
  %505 = extractelement <2 x bfloat> %504, i32 0
  %506 = extractelement <2 x bfloat> %504, i32 1
  %507 = bitcast i32 %311 to <2 x bfloat>
  %508 = extractelement <2 x bfloat> %507, i32 0
  %509 = extractelement <2 x bfloat> %507, i32 1
  %510 = bitcast i32 %312 to <2 x bfloat>
  %511 = extractelement <2 x bfloat> %510, i32 0
  %512 = extractelement <2 x bfloat> %510, i32 1
  %513 = bitcast i32 %313 to <2 x bfloat>
  %514 = extractelement <2 x bfloat> %513, i32 0
  %515 = extractelement <2 x bfloat> %513, i32 1
  %516 = bitcast i32 %323 to <2 x bfloat>
  %517 = extractelement <2 x bfloat> %516, i32 0
  %518 = extractelement <2 x bfloat> %516, i32 1
  %519 = bitcast i32 %324 to <2 x bfloat>
  %520 = extractelement <2 x bfloat> %519, i32 0
  %521 = extractelement <2 x bfloat> %519, i32 1
  %522 = bitcast i32 %325 to <2 x bfloat>
  %523 = extractelement <2 x bfloat> %522, i32 0
  %524 = extractelement <2 x bfloat> %522, i32 1
  %525 = bitcast i32 %326 to <2 x bfloat>
  %526 = extractelement <2 x bfloat> %525, i32 0
  %527 = extractelement <2 x bfloat> %525, i32 1
  %528 = bitcast i32 %336 to <2 x bfloat>
  %529 = extractelement <2 x bfloat> %528, i32 0
  %530 = extractelement <2 x bfloat> %528, i32 1
  %531 = bitcast i32 %337 to <2 x bfloat>
  %532 = extractelement <2 x bfloat> %531, i32 0
  %533 = extractelement <2 x bfloat> %531, i32 1
  %534 = bitcast i32 %338 to <2 x bfloat>
  %535 = extractelement <2 x bfloat> %534, i32 0
  %536 = extractelement <2 x bfloat> %534, i32 1
  %537 = bitcast i32 %339 to <2 x bfloat>
  %538 = extractelement <2 x bfloat> %537, i32 0
  %539 = extractelement <2 x bfloat> %537, i32 1
  %540 = bitcast i32 %349 to <2 x bfloat>
  %541 = extractelement <2 x bfloat> %540, i32 0
  %542 = extractelement <2 x bfloat> %540, i32 1
  %543 = bitcast i32 %350 to <2 x bfloat>
  %544 = extractelement <2 x bfloat> %543, i32 0
  %545 = extractelement <2 x bfloat> %543, i32 1
  %546 = bitcast i32 %351 to <2 x bfloat>
  %547 = extractelement <2 x bfloat> %546, i32 0
  %548 = extractelement <2 x bfloat> %546, i32 1
  %549 = bitcast i32 %352 to <2 x bfloat>
  %550 = extractelement <2 x bfloat> %549, i32 0
  %551 = extractelement <2 x bfloat> %549, i32 1
  %552 = bitcast i32 %362 to <2 x bfloat>
  %553 = extractelement <2 x bfloat> %552, i32 0
  %554 = extractelement <2 x bfloat> %552, i32 1
  %555 = bitcast i32 %363 to <2 x bfloat>
  %556 = extractelement <2 x bfloat> %555, i32 0
  %557 = extractelement <2 x bfloat> %555, i32 1
  %558 = bitcast i32 %364 to <2 x bfloat>
  %559 = extractelement <2 x bfloat> %558, i32 0
  %560 = extractelement <2 x bfloat> %558, i32 1
  %561 = bitcast i32 %365 to <2 x bfloat>
  %562 = extractelement <2 x bfloat> %561, i32 0
  %563 = extractelement <2 x bfloat> %561, i32 1
  %564 = bitcast i32 %375 to <2 x bfloat>
  %565 = extractelement <2 x bfloat> %564, i32 0
  %566 = extractelement <2 x bfloat> %564, i32 1
  %567 = bitcast i32 %376 to <2 x bfloat>
  %568 = extractelement <2 x bfloat> %567, i32 0
  %569 = extractelement <2 x bfloat> %567, i32 1
  %570 = bitcast i32 %377 to <2 x bfloat>
  %571 = extractelement <2 x bfloat> %570, i32 0
  %572 = extractelement <2 x bfloat> %570, i32 1
  %573 = bitcast i32 %378 to <2 x bfloat>
  %574 = extractelement <2 x bfloat> %573, i32 0
  %575 = extractelement <2 x bfloat> %573, i32 1
  %576 = bitcast i32 %388 to <2 x bfloat>
  %577 = extractelement <2 x bfloat> %576, i32 0
  %578 = extractelement <2 x bfloat> %576, i32 1
  %579 = bitcast i32 %389 to <2 x bfloat>
  %580 = extractelement <2 x bfloat> %579, i32 0
  %581 = extractelement <2 x bfloat> %579, i32 1
  %582 = bitcast i32 %390 to <2 x bfloat>
  %583 = extractelement <2 x bfloat> %582, i32 0
  %584 = extractelement <2 x bfloat> %582, i32 1
  %585 = bitcast i32 %391 to <2 x bfloat>
  %586 = extractelement <2 x bfloat> %585, i32 0
  %587 = extractelement <2 x bfloat> %585, i32 1
  %588 = bitcast i32 %401 to <2 x bfloat>
  %589 = extractelement <2 x bfloat> %588, i32 0
  %590 = extractelement <2 x bfloat> %588, i32 1
  %591 = bitcast i32 %402 to <2 x bfloat>
  %592 = extractelement <2 x bfloat> %591, i32 0
  %593 = extractelement <2 x bfloat> %591, i32 1
  %594 = bitcast i32 %403 to <2 x bfloat>
  %595 = extractelement <2 x bfloat> %594, i32 0
  %596 = extractelement <2 x bfloat> %594, i32 1
  %597 = bitcast i32 %404 to <2 x bfloat>
  %598 = extractelement <2 x bfloat> %597, i32 0
  %599 = extractelement <2 x bfloat> %597, i32 1
  %600 = bitcast i32 %414 to <2 x bfloat>
  %601 = extractelement <2 x bfloat> %600, i32 0
  %602 = extractelement <2 x bfloat> %600, i32 1
  %603 = bitcast i32 %415 to <2 x bfloat>
  %604 = extractelement <2 x bfloat> %603, i32 0
  %605 = extractelement <2 x bfloat> %603, i32 1
  %606 = bitcast i32 %416 to <2 x bfloat>
  %607 = extractelement <2 x bfloat> %606, i32 0
  %608 = extractelement <2 x bfloat> %606, i32 1
  %609 = bitcast i32 %417 to <2 x bfloat>
  %610 = extractelement <2 x bfloat> %609, i32 0
  %611 = extractelement <2 x bfloat> %609, i32 1
  %612 = bitcast i32 %427 to <2 x bfloat>
  %613 = extractelement <2 x bfloat> %612, i32 0
  %614 = extractelement <2 x bfloat> %612, i32 1
  %615 = bitcast i32 %428 to <2 x bfloat>
  %616 = extractelement <2 x bfloat> %615, i32 0
  %617 = extractelement <2 x bfloat> %615, i32 1
  %618 = bitcast i32 %429 to <2 x bfloat>
  %619 = extractelement <2 x bfloat> %618, i32 0
  %620 = extractelement <2 x bfloat> %618, i32 1
  %621 = bitcast i32 %430 to <2 x bfloat>
  %622 = extractelement <2 x bfloat> %621, i32 0
  %623 = extractelement <2 x bfloat> %621, i32 1
  %624 = bitcast i32 %440 to <2 x bfloat>
  %625 = extractelement <2 x bfloat> %624, i32 0
  %626 = extractelement <2 x bfloat> %624, i32 1
  %627 = bitcast i32 %441 to <2 x bfloat>
  %628 = extractelement <2 x bfloat> %627, i32 0
  %629 = extractelement <2 x bfloat> %627, i32 1
  %630 = bitcast i32 %442 to <2 x bfloat>
  %631 = extractelement <2 x bfloat> %630, i32 0
  %632 = extractelement <2 x bfloat> %630, i32 1
  %633 = bitcast i32 %443 to <2 x bfloat>
  %634 = extractelement <2 x bfloat> %633, i32 0
  %635 = extractelement <2 x bfloat> %633, i32 1
  %636 = insertelement <2 x bfloat> undef, bfloat %445, i32 0
  %637 = insertelement <2 x bfloat> %636, bfloat %446, i32 1
  %638 = bitcast <2 x bfloat> %637 to i32
  %639 = insertelement <2 x bfloat> undef, bfloat %448, i32 0
  %640 = insertelement <2 x bfloat> %639, bfloat %449, i32 1
  %641 = bitcast <2 x bfloat> %640 to i32
  %642 = insertelement <2 x bfloat> undef, bfloat %451, i32 0
  %643 = insertelement <2 x bfloat> %642, bfloat %452, i32 1
  %644 = bitcast <2 x bfloat> %643 to i32
  %645 = insertelement <2 x bfloat> undef, bfloat %454, i32 0
  %646 = insertelement <2 x bfloat> %645, bfloat %455, i32 1
  %647 = bitcast <2 x bfloat> %646 to i32
  %648 = insertelement <2 x bfloat> undef, bfloat %457, i32 0
  %649 = insertelement <2 x bfloat> %648, bfloat %458, i32 1
  %650 = bitcast <2 x bfloat> %649 to i32
  %651 = insertelement <2 x bfloat> undef, bfloat %460, i32 0
  %652 = insertelement <2 x bfloat> %651, bfloat %461, i32 1
  %653 = bitcast <2 x bfloat> %652 to i32
  %654 = insertelement <2 x bfloat> undef, bfloat %463, i32 0
  %655 = insertelement <2 x bfloat> %654, bfloat %464, i32 1
  %656 = bitcast <2 x bfloat> %655 to i32
  %657 = insertelement <2 x bfloat> undef, bfloat %466, i32 0
  %658 = insertelement <2 x bfloat> %657, bfloat %467, i32 1
  %659 = bitcast <2 x bfloat> %658 to i32
  %660 = insertelement <2 x bfloat> undef, bfloat %469, i32 0
  %661 = insertelement <2 x bfloat> %660, bfloat %470, i32 1
  %662 = bitcast <2 x bfloat> %661 to i32
  %663 = insertelement <2 x bfloat> undef, bfloat %472, i32 0
  %664 = insertelement <2 x bfloat> %663, bfloat %473, i32 1
  %665 = bitcast <2 x bfloat> %664 to i32
  %666 = insertelement <2 x bfloat> undef, bfloat %475, i32 0
  %667 = insertelement <2 x bfloat> %666, bfloat %476, i32 1
  %668 = bitcast <2 x bfloat> %667 to i32
  %669 = insertelement <2 x bfloat> undef, bfloat %478, i32 0
  %670 = insertelement <2 x bfloat> %669, bfloat %479, i32 1
  %671 = bitcast <2 x bfloat> %670 to i32
  %672 = insertelement <2 x bfloat> undef, bfloat %481, i32 0
  %673 = insertelement <2 x bfloat> %672, bfloat %482, i32 1
  %674 = bitcast <2 x bfloat> %673 to i32
  %675 = insertelement <2 x bfloat> undef, bfloat %484, i32 0
  %676 = insertelement <2 x bfloat> %675, bfloat %485, i32 1
  %677 = bitcast <2 x bfloat> %676 to i32
  %678 = insertelement <2 x bfloat> undef, bfloat %487, i32 0
  %679 = insertelement <2 x bfloat> %678, bfloat %488, i32 1
  %680 = bitcast <2 x bfloat> %679 to i32
  %681 = insertelement <2 x bfloat> undef, bfloat %490, i32 0
  %682 = insertelement <2 x bfloat> %681, bfloat %491, i32 1
  %683 = bitcast <2 x bfloat> %682 to i32
  %684 = insertelement <2 x bfloat> undef, bfloat %493, i32 0
  %685 = insertelement <2 x bfloat> %684, bfloat %494, i32 1
  %686 = bitcast <2 x bfloat> %685 to i32
  %687 = insertelement <2 x bfloat> undef, bfloat %496, i32 0
  %688 = insertelement <2 x bfloat> %687, bfloat %497, i32 1
  %689 = bitcast <2 x bfloat> %688 to i32
  %690 = insertelement <2 x bfloat> undef, bfloat %499, i32 0
  %691 = insertelement <2 x bfloat> %690, bfloat %500, i32 1
  %692 = bitcast <2 x bfloat> %691 to i32
  %693 = insertelement <2 x bfloat> undef, bfloat %502, i32 0
  %694 = insertelement <2 x bfloat> %693, bfloat %503, i32 1
  %695 = bitcast <2 x bfloat> %694 to i32
  %696 = insertelement <2 x bfloat> undef, bfloat %505, i32 0
  %697 = insertelement <2 x bfloat> %696, bfloat %506, i32 1
  %698 = bitcast <2 x bfloat> %697 to i32
  %699 = insertelement <2 x bfloat> undef, bfloat %508, i32 0
  %700 = insertelement <2 x bfloat> %699, bfloat %509, i32 1
  %701 = bitcast <2 x bfloat> %700 to i32
  %702 = insertelement <2 x bfloat> undef, bfloat %511, i32 0
  %703 = insertelement <2 x bfloat> %702, bfloat %512, i32 1
  %704 = bitcast <2 x bfloat> %703 to i32
  %705 = insertelement <2 x bfloat> undef, bfloat %514, i32 0
  %706 = insertelement <2 x bfloat> %705, bfloat %515, i32 1
  %707 = bitcast <2 x bfloat> %706 to i32
  %708 = insertelement <2 x bfloat> undef, bfloat %517, i32 0
  %709 = insertelement <2 x bfloat> %708, bfloat %518, i32 1
  %710 = bitcast <2 x bfloat> %709 to i32
  %711 = insertelement <2 x bfloat> undef, bfloat %520, i32 0
  %712 = insertelement <2 x bfloat> %711, bfloat %521, i32 1
  %713 = bitcast <2 x bfloat> %712 to i32
  %714 = insertelement <2 x bfloat> undef, bfloat %523, i32 0
  %715 = insertelement <2 x bfloat> %714, bfloat %524, i32 1
  %716 = bitcast <2 x bfloat> %715 to i32
  %717 = insertelement <2 x bfloat> undef, bfloat %526, i32 0
  %718 = insertelement <2 x bfloat> %717, bfloat %527, i32 1
  %719 = bitcast <2 x bfloat> %718 to i32
  %720 = insertelement <2 x bfloat> undef, bfloat %529, i32 0
  %721 = insertelement <2 x bfloat> %720, bfloat %530, i32 1
  %722 = bitcast <2 x bfloat> %721 to i32
  %723 = insertelement <2 x bfloat> undef, bfloat %532, i32 0
  %724 = insertelement <2 x bfloat> %723, bfloat %533, i32 1
  %725 = bitcast <2 x bfloat> %724 to i32
  %726 = insertelement <2 x bfloat> undef, bfloat %535, i32 0
  %727 = insertelement <2 x bfloat> %726, bfloat %536, i32 1
  %728 = bitcast <2 x bfloat> %727 to i32
  %729 = insertelement <2 x bfloat> undef, bfloat %538, i32 0
  %730 = insertelement <2 x bfloat> %729, bfloat %539, i32 1
  %731 = bitcast <2 x bfloat> %730 to i32
  %732 = insertelement <2 x bfloat> undef, bfloat %541, i32 0
  %733 = insertelement <2 x bfloat> %732, bfloat %542, i32 1
  %734 = bitcast <2 x bfloat> %733 to i32
  %735 = insertelement <2 x bfloat> undef, bfloat %544, i32 0
  %736 = insertelement <2 x bfloat> %735, bfloat %545, i32 1
  %737 = bitcast <2 x bfloat> %736 to i32
  %738 = insertelement <2 x bfloat> undef, bfloat %547, i32 0
  %739 = insertelement <2 x bfloat> %738, bfloat %548, i32 1
  %740 = bitcast <2 x bfloat> %739 to i32
  %741 = insertelement <2 x bfloat> undef, bfloat %550, i32 0
  %742 = insertelement <2 x bfloat> %741, bfloat %551, i32 1
  %743 = bitcast <2 x bfloat> %742 to i32
  %744 = insertelement <2 x bfloat> undef, bfloat %553, i32 0
  %745 = insertelement <2 x bfloat> %744, bfloat %554, i32 1
  %746 = bitcast <2 x bfloat> %745 to i32
  %747 = insertelement <2 x bfloat> undef, bfloat %556, i32 0
  %748 = insertelement <2 x bfloat> %747, bfloat %557, i32 1
  %749 = bitcast <2 x bfloat> %748 to i32
  %750 = insertelement <2 x bfloat> undef, bfloat %559, i32 0
  %751 = insertelement <2 x bfloat> %750, bfloat %560, i32 1
  %752 = bitcast <2 x bfloat> %751 to i32
  %753 = insertelement <2 x bfloat> undef, bfloat %562, i32 0
  %754 = insertelement <2 x bfloat> %753, bfloat %563, i32 1
  %755 = bitcast <2 x bfloat> %754 to i32
  %756 = insertelement <2 x bfloat> undef, bfloat %565, i32 0
  %757 = insertelement <2 x bfloat> %756, bfloat %566, i32 1
  %758 = bitcast <2 x bfloat> %757 to i32
  %759 = insertelement <2 x bfloat> undef, bfloat %568, i32 0
  %760 = insertelement <2 x bfloat> %759, bfloat %569, i32 1
  %761 = bitcast <2 x bfloat> %760 to i32
  %762 = insertelement <2 x bfloat> undef, bfloat %571, i32 0
  %763 = insertelement <2 x bfloat> %762, bfloat %572, i32 1
  %764 = bitcast <2 x bfloat> %763 to i32
  %765 = insertelement <2 x bfloat> undef, bfloat %574, i32 0
  %766 = insertelement <2 x bfloat> %765, bfloat %575, i32 1
  %767 = bitcast <2 x bfloat> %766 to i32
  %768 = insertelement <2 x bfloat> undef, bfloat %577, i32 0
  %769 = insertelement <2 x bfloat> %768, bfloat %578, i32 1
  %770 = bitcast <2 x bfloat> %769 to i32
  %771 = insertelement <2 x bfloat> undef, bfloat %580, i32 0
  %772 = insertelement <2 x bfloat> %771, bfloat %581, i32 1
  %773 = bitcast <2 x bfloat> %772 to i32
  %774 = insertelement <2 x bfloat> undef, bfloat %583, i32 0
  %775 = insertelement <2 x bfloat> %774, bfloat %584, i32 1
  %776 = bitcast <2 x bfloat> %775 to i32
  %777 = insertelement <2 x bfloat> undef, bfloat %586, i32 0
  %778 = insertelement <2 x bfloat> %777, bfloat %587, i32 1
  %779 = bitcast <2 x bfloat> %778 to i32
  %780 = insertelement <2 x bfloat> undef, bfloat %589, i32 0
  %781 = insertelement <2 x bfloat> %780, bfloat %590, i32 1
  %782 = bitcast <2 x bfloat> %781 to i32
  %783 = insertelement <2 x bfloat> undef, bfloat %592, i32 0
  %784 = insertelement <2 x bfloat> %783, bfloat %593, i32 1
  %785 = bitcast <2 x bfloat> %784 to i32
  %786 = insertelement <2 x bfloat> undef, bfloat %595, i32 0
  %787 = insertelement <2 x bfloat> %786, bfloat %596, i32 1
  %788 = bitcast <2 x bfloat> %787 to i32
  %789 = insertelement <2 x bfloat> undef, bfloat %598, i32 0
  %790 = insertelement <2 x bfloat> %789, bfloat %599, i32 1
  %791 = bitcast <2 x bfloat> %790 to i32
  %792 = insertelement <2 x bfloat> undef, bfloat %601, i32 0
  %793 = insertelement <2 x bfloat> %792, bfloat %602, i32 1
  %794 = bitcast <2 x bfloat> %793 to i32
  %795 = insertelement <2 x bfloat> undef, bfloat %604, i32 0
  %796 = insertelement <2 x bfloat> %795, bfloat %605, i32 1
  %797 = bitcast <2 x bfloat> %796 to i32
  %798 = insertelement <2 x bfloat> undef, bfloat %607, i32 0
  %799 = insertelement <2 x bfloat> %798, bfloat %608, i32 1
  %800 = bitcast <2 x bfloat> %799 to i32
  %801 = insertelement <2 x bfloat> undef, bfloat %610, i32 0
  %802 = insertelement <2 x bfloat> %801, bfloat %611, i32 1
  %803 = bitcast <2 x bfloat> %802 to i32
  %804 = insertelement <2 x bfloat> undef, bfloat %613, i32 0
  %805 = insertelement <2 x bfloat> %804, bfloat %614, i32 1
  %806 = bitcast <2 x bfloat> %805 to i32
  %807 = insertelement <2 x bfloat> undef, bfloat %616, i32 0
  %808 = insertelement <2 x bfloat> %807, bfloat %617, i32 1
  %809 = bitcast <2 x bfloat> %808 to i32
  %810 = insertelement <2 x bfloat> undef, bfloat %619, i32 0
  %811 = insertelement <2 x bfloat> %810, bfloat %620, i32 1
  %812 = bitcast <2 x bfloat> %811 to i32
  %813 = insertelement <2 x bfloat> undef, bfloat %622, i32 0
  %814 = insertelement <2 x bfloat> %813, bfloat %623, i32 1
  %815 = bitcast <2 x bfloat> %814 to i32
  %816 = insertelement <2 x bfloat> undef, bfloat %625, i32 0
  %817 = insertelement <2 x bfloat> %816, bfloat %626, i32 1
  %818 = bitcast <2 x bfloat> %817 to i32
  %819 = insertelement <2 x bfloat> undef, bfloat %628, i32 0
  %820 = insertelement <2 x bfloat> %819, bfloat %629, i32 1
  %821 = bitcast <2 x bfloat> %820 to i32
  %822 = insertelement <2 x bfloat> undef, bfloat %631, i32 0
  %823 = insertelement <2 x bfloat> %822, bfloat %632, i32 1
  %824 = bitcast <2 x bfloat> %823 to i32
  %825 = insertelement <2 x bfloat> undef, bfloat %634, i32 0
  %826 = insertelement <2 x bfloat> %825, bfloat %635, i32 1
  %827 = bitcast <2 x bfloat> %826 to i32
  %828 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 0
  %829 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 1
  %830 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 2
  %831 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 3
  %832 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 4
  %833 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 5
  %834 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 6
  %835 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 7
  %836 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 8
  %837 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 9
  %838 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 10
  %839 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 11
  %840 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 12
  %841 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 13
  %842 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 14
  %843 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 15
  %844 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 16
  %845 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 17
  %846 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 18
  %847 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 19
  %848 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 20
  %849 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 21
  %850 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 22
  %851 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 23
  %852 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 24
  %853 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 25
  %854 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 26
  %855 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 27
  %856 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 28
  %857 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 29
  %858 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 30
  %859 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 31
  %860 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %828, float %829, float %830, float %831, i32 0, i32 0, i32 0, i32 0, i32 %638, i32 %641)
  %861 = extractvalue { float, float, float, float } %860, 0
  %862 = extractvalue { float, float, float, float } %860, 1
  %863 = extractvalue { float, float, float, float } %860, 2
  %864 = extractvalue { float, float, float, float } %860, 3
  %865 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %832, float %833, float %834, float %835, i32 0, i32 0, i32 0, i32 0, i32 %686, i32 %689)
  %866 = extractvalue { float, float, float, float } %865, 0
  %867 = extractvalue { float, float, float, float } %865, 1
  %868 = extractvalue { float, float, float, float } %865, 2
  %869 = extractvalue { float, float, float, float } %865, 3
  %870 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %836, float %837, float %838, float %839, i32 0, i32 0, i32 0, i32 0, i32 %734, i32 %737)
  %871 = extractvalue { float, float, float, float } %870, 0
  %872 = extractvalue { float, float, float, float } %870, 1
  %873 = extractvalue { float, float, float, float } %870, 2
  %874 = extractvalue { float, float, float, float } %870, 3
  %875 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %840, float %841, float %842, float %843, i32 0, i32 0, i32 0, i32 0, i32 %782, i32 %785)
  %876 = extractvalue { float, float, float, float } %875, 0
  %877 = extractvalue { float, float, float, float } %875, 1
  %878 = extractvalue { float, float, float, float } %875, 2
  %879 = extractvalue { float, float, float, float } %875, 3
  %880 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %844, float %845, float %846, float %847, i32 0, i32 0, i32 0, i32 0, i32 %638, i32 %641)
  %881 = extractvalue { float, float, float, float } %880, 0
  %882 = extractvalue { float, float, float, float } %880, 1
  %883 = extractvalue { float, float, float, float } %880, 2
  %884 = extractvalue { float, float, float, float } %880, 3
  %885 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %848, float %849, float %850, float %851, i32 0, i32 0, i32 0, i32 0, i32 %686, i32 %689)
  %886 = extractvalue { float, float, float, float } %885, 0
  %887 = extractvalue { float, float, float, float } %885, 1
  %888 = extractvalue { float, float, float, float } %885, 2
  %889 = extractvalue { float, float, float, float } %885, 3
  %890 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %852, float %853, float %854, float %855, i32 0, i32 0, i32 0, i32 0, i32 %734, i32 %737)
  %891 = extractvalue { float, float, float, float } %890, 0
  %892 = extractvalue { float, float, float, float } %890, 1
  %893 = extractvalue { float, float, float, float } %890, 2
  %894 = extractvalue { float, float, float, float } %890, 3
  %895 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %856, float %857, float %858, float %859, i32 0, i32 0, i32 0, i32 0, i32 %782, i32 %785)
  %896 = extractvalue { float, float, float, float } %895, 0
  %897 = extractvalue { float, float, float, float } %895, 1
  %898 = extractvalue { float, float, float, float } %895, 2
  %899 = extractvalue { float, float, float, float } %895, 3
  %900 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %861, float %862, float %863, float %864, i32 0, i32 0, i32 0, i32 0, i32 %644, i32 %647)
  %901 = extractvalue { float, float, float, float } %900, 0
  %902 = extractvalue { float, float, float, float } %900, 1
  %903 = extractvalue { float, float, float, float } %900, 2
  %904 = extractvalue { float, float, float, float } %900, 3
  %905 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %866, float %867, float %868, float %869, i32 0, i32 0, i32 0, i32 0, i32 %692, i32 %695)
  %906 = extractvalue { float, float, float, float } %905, 0
  %907 = extractvalue { float, float, float, float } %905, 1
  %908 = extractvalue { float, float, float, float } %905, 2
  %909 = extractvalue { float, float, float, float } %905, 3
  %910 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %871, float %872, float %873, float %874, i32 0, i32 0, i32 0, i32 0, i32 %740, i32 %743)
  %911 = extractvalue { float, float, float, float } %910, 0
  %912 = extractvalue { float, float, float, float } %910, 1
  %913 = extractvalue { float, float, float, float } %910, 2
  %914 = extractvalue { float, float, float, float } %910, 3
  %915 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %876, float %877, float %878, float %879, i32 0, i32 0, i32 0, i32 0, i32 %788, i32 %791)
  %916 = extractvalue { float, float, float, float } %915, 0
  %917 = extractvalue { float, float, float, float } %915, 1
  %918 = extractvalue { float, float, float, float } %915, 2
  %919 = extractvalue { float, float, float, float } %915, 3
  %920 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %881, float %882, float %883, float %884, i32 0, i32 0, i32 0, i32 0, i32 %644, i32 %647)
  %921 = extractvalue { float, float, float, float } %920, 0
  %922 = extractvalue { float, float, float, float } %920, 1
  %923 = extractvalue { float, float, float, float } %920, 2
  %924 = extractvalue { float, float, float, float } %920, 3
  %925 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %886, float %887, float %888, float %889, i32 0, i32 0, i32 0, i32 0, i32 %692, i32 %695)
  %926 = extractvalue { float, float, float, float } %925, 0
  %927 = extractvalue { float, float, float, float } %925, 1
  %928 = extractvalue { float, float, float, float } %925, 2
  %929 = extractvalue { float, float, float, float } %925, 3
  %930 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %891, float %892, float %893, float %894, i32 0, i32 0, i32 0, i32 0, i32 %740, i32 %743)
  %931 = extractvalue { float, float, float, float } %930, 0
  %932 = extractvalue { float, float, float, float } %930, 1
  %933 = extractvalue { float, float, float, float } %930, 2
  %934 = extractvalue { float, float, float, float } %930, 3
  %935 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %896, float %897, float %898, float %899, i32 0, i32 0, i32 0, i32 0, i32 %788, i32 %791)
  %936 = extractvalue { float, float, float, float } %935, 0
  %937 = extractvalue { float, float, float, float } %935, 1
  %938 = extractvalue { float, float, float, float } %935, 2
  %939 = extractvalue { float, float, float, float } %935, 3
  %940 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %901, float %902, float %903, float %904, i32 0, i32 0, i32 0, i32 0, i32 %650, i32 %653)
  %941 = extractvalue { float, float, float, float } %940, 0
  %942 = extractvalue { float, float, float, float } %940, 1
  %943 = extractvalue { float, float, float, float } %940, 2
  %944 = extractvalue { float, float, float, float } %940, 3
  %945 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %906, float %907, float %908, float %909, i32 0, i32 0, i32 0, i32 0, i32 %698, i32 %701)
  %946 = extractvalue { float, float, float, float } %945, 0
  %947 = extractvalue { float, float, float, float } %945, 1
  %948 = extractvalue { float, float, float, float } %945, 2
  %949 = extractvalue { float, float, float, float } %945, 3
  %950 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %911, float %912, float %913, float %914, i32 0, i32 0, i32 0, i32 0, i32 %746, i32 %749)
  %951 = extractvalue { float, float, float, float } %950, 0
  %952 = extractvalue { float, float, float, float } %950, 1
  %953 = extractvalue { float, float, float, float } %950, 2
  %954 = extractvalue { float, float, float, float } %950, 3
  %955 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %916, float %917, float %918, float %919, i32 0, i32 0, i32 0, i32 0, i32 %794, i32 %797)
  %956 = extractvalue { float, float, float, float } %955, 0
  %957 = extractvalue { float, float, float, float } %955, 1
  %958 = extractvalue { float, float, float, float } %955, 2
  %959 = extractvalue { float, float, float, float } %955, 3
  %960 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %921, float %922, float %923, float %924, i32 0, i32 0, i32 0, i32 0, i32 %650, i32 %653)
  %961 = extractvalue { float, float, float, float } %960, 0
  %962 = extractvalue { float, float, float, float } %960, 1
  %963 = extractvalue { float, float, float, float } %960, 2
  %964 = extractvalue { float, float, float, float } %960, 3
  %965 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %926, float %927, float %928, float %929, i32 0, i32 0, i32 0, i32 0, i32 %698, i32 %701)
  %966 = extractvalue { float, float, float, float } %965, 0
  %967 = extractvalue { float, float, float, float } %965, 1
  %968 = extractvalue { float, float, float, float } %965, 2
  %969 = extractvalue { float, float, float, float } %965, 3
  %970 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %931, float %932, float %933, float %934, i32 0, i32 0, i32 0, i32 0, i32 %746, i32 %749)
  %971 = extractvalue { float, float, float, float } %970, 0
  %972 = extractvalue { float, float, float, float } %970, 1
  %973 = extractvalue { float, float, float, float } %970, 2
  %974 = extractvalue { float, float, float, float } %970, 3
  %975 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %936, float %937, float %938, float %939, i32 0, i32 0, i32 0, i32 0, i32 %794, i32 %797)
  %976 = extractvalue { float, float, float, float } %975, 0
  %977 = extractvalue { float, float, float, float } %975, 1
  %978 = extractvalue { float, float, float, float } %975, 2
  %979 = extractvalue { float, float, float, float } %975, 3
  %980 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %941, float %942, float %943, float %944, i32 0, i32 0, i32 0, i32 0, i32 %656, i32 %659)
  %981 = extractvalue { float, float, float, float } %980, 0
  %982 = extractvalue { float, float, float, float } %980, 1
  %983 = extractvalue { float, float, float, float } %980, 2
  %984 = extractvalue { float, float, float, float } %980, 3
  %985 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %946, float %947, float %948, float %949, i32 0, i32 0, i32 0, i32 0, i32 %704, i32 %707)
  %986 = extractvalue { float, float, float, float } %985, 0
  %987 = extractvalue { float, float, float, float } %985, 1
  %988 = extractvalue { float, float, float, float } %985, 2
  %989 = extractvalue { float, float, float, float } %985, 3
  %990 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %951, float %952, float %953, float %954, i32 0, i32 0, i32 0, i32 0, i32 %752, i32 %755)
  %991 = extractvalue { float, float, float, float } %990, 0
  %992 = extractvalue { float, float, float, float } %990, 1
  %993 = extractvalue { float, float, float, float } %990, 2
  %994 = extractvalue { float, float, float, float } %990, 3
  %995 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %956, float %957, float %958, float %959, i32 0, i32 0, i32 0, i32 0, i32 %800, i32 %803)
  %996 = extractvalue { float, float, float, float } %995, 0
  %997 = extractvalue { float, float, float, float } %995, 1
  %998 = extractvalue { float, float, float, float } %995, 2
  %999 = extractvalue { float, float, float, float } %995, 3
  %1000 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %961, float %962, float %963, float %964, i32 0, i32 0, i32 0, i32 0, i32 %656, i32 %659)
  %1001 = extractvalue { float, float, float, float } %1000, 0
  %1002 = extractvalue { float, float, float, float } %1000, 1
  %1003 = extractvalue { float, float, float, float } %1000, 2
  %1004 = extractvalue { float, float, float, float } %1000, 3
  %1005 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %966, float %967, float %968, float %969, i32 0, i32 0, i32 0, i32 0, i32 %704, i32 %707)
  %1006 = extractvalue { float, float, float, float } %1005, 0
  %1007 = extractvalue { float, float, float, float } %1005, 1
  %1008 = extractvalue { float, float, float, float } %1005, 2
  %1009 = extractvalue { float, float, float, float } %1005, 3
  %1010 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %971, float %972, float %973, float %974, i32 0, i32 0, i32 0, i32 0, i32 %752, i32 %755)
  %1011 = extractvalue { float, float, float, float } %1010, 0
  %1012 = extractvalue { float, float, float, float } %1010, 1
  %1013 = extractvalue { float, float, float, float } %1010, 2
  %1014 = extractvalue { float, float, float, float } %1010, 3
  %1015 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %976, float %977, float %978, float %979, i32 0, i32 0, i32 0, i32 0, i32 %800, i32 %803)
  %1016 = extractvalue { float, float, float, float } %1015, 0
  %1017 = extractvalue { float, float, float, float } %1015, 1
  %1018 = extractvalue { float, float, float, float } %1015, 2
  %1019 = extractvalue { float, float, float, float } %1015, 3
  %1020 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %981, float %982, float %983, float %984, i32 0, i32 0, i32 0, i32 0, i32 %662, i32 %665)
  %1021 = extractvalue { float, float, float, float } %1020, 0
  %1022 = extractvalue { float, float, float, float } %1020, 1
  %1023 = extractvalue { float, float, float, float } %1020, 2
  %1024 = extractvalue { float, float, float, float } %1020, 3
  %1025 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %986, float %987, float %988, float %989, i32 0, i32 0, i32 0, i32 0, i32 %710, i32 %713)
  %1026 = extractvalue { float, float, float, float } %1025, 0
  %1027 = extractvalue { float, float, float, float } %1025, 1
  %1028 = extractvalue { float, float, float, float } %1025, 2
  %1029 = extractvalue { float, float, float, float } %1025, 3
  %1030 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %991, float %992, float %993, float %994, i32 0, i32 0, i32 0, i32 0, i32 %758, i32 %761)
  %1031 = extractvalue { float, float, float, float } %1030, 0
  %1032 = extractvalue { float, float, float, float } %1030, 1
  %1033 = extractvalue { float, float, float, float } %1030, 2
  %1034 = extractvalue { float, float, float, float } %1030, 3
  %1035 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %996, float %997, float %998, float %999, i32 0, i32 0, i32 0, i32 0, i32 %806, i32 %809)
  %1036 = extractvalue { float, float, float, float } %1035, 0
  %1037 = extractvalue { float, float, float, float } %1035, 1
  %1038 = extractvalue { float, float, float, float } %1035, 2
  %1039 = extractvalue { float, float, float, float } %1035, 3
  %1040 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1001, float %1002, float %1003, float %1004, i32 0, i32 0, i32 0, i32 0, i32 %662, i32 %665)
  %1041 = extractvalue { float, float, float, float } %1040, 0
  %1042 = extractvalue { float, float, float, float } %1040, 1
  %1043 = extractvalue { float, float, float, float } %1040, 2
  %1044 = extractvalue { float, float, float, float } %1040, 3
  %1045 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1006, float %1007, float %1008, float %1009, i32 0, i32 0, i32 0, i32 0, i32 %710, i32 %713)
  %1046 = extractvalue { float, float, float, float } %1045, 0
  %1047 = extractvalue { float, float, float, float } %1045, 1
  %1048 = extractvalue { float, float, float, float } %1045, 2
  %1049 = extractvalue { float, float, float, float } %1045, 3
  %1050 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1011, float %1012, float %1013, float %1014, i32 0, i32 0, i32 0, i32 0, i32 %758, i32 %761)
  %1051 = extractvalue { float, float, float, float } %1050, 0
  %1052 = extractvalue { float, float, float, float } %1050, 1
  %1053 = extractvalue { float, float, float, float } %1050, 2
  %1054 = extractvalue { float, float, float, float } %1050, 3
  %1055 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1016, float %1017, float %1018, float %1019, i32 0, i32 0, i32 0, i32 0, i32 %806, i32 %809)
  %1056 = extractvalue { float, float, float, float } %1055, 0
  %1057 = extractvalue { float, float, float, float } %1055, 1
  %1058 = extractvalue { float, float, float, float } %1055, 2
  %1059 = extractvalue { float, float, float, float } %1055, 3
  %1060 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1021, float %1022, float %1023, float %1024, i32 0, i32 0, i32 0, i32 0, i32 %668, i32 %671)
  %1061 = extractvalue { float, float, float, float } %1060, 0
  %1062 = extractvalue { float, float, float, float } %1060, 1
  %1063 = extractvalue { float, float, float, float } %1060, 2
  %1064 = extractvalue { float, float, float, float } %1060, 3
  %1065 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1026, float %1027, float %1028, float %1029, i32 0, i32 0, i32 0, i32 0, i32 %716, i32 %719)
  %1066 = extractvalue { float, float, float, float } %1065, 0
  %1067 = extractvalue { float, float, float, float } %1065, 1
  %1068 = extractvalue { float, float, float, float } %1065, 2
  %1069 = extractvalue { float, float, float, float } %1065, 3
  %1070 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1031, float %1032, float %1033, float %1034, i32 0, i32 0, i32 0, i32 0, i32 %764, i32 %767)
  %1071 = extractvalue { float, float, float, float } %1070, 0
  %1072 = extractvalue { float, float, float, float } %1070, 1
  %1073 = extractvalue { float, float, float, float } %1070, 2
  %1074 = extractvalue { float, float, float, float } %1070, 3
  %1075 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1036, float %1037, float %1038, float %1039, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1076 = extractvalue { float, float, float, float } %1075, 0
  %1077 = extractvalue { float, float, float, float } %1075, 1
  %1078 = extractvalue { float, float, float, float } %1075, 2
  %1079 = extractvalue { float, float, float, float } %1075, 3
  %1080 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1041, float %1042, float %1043, float %1044, i32 0, i32 0, i32 0, i32 0, i32 %668, i32 %671)
  %1081 = extractvalue { float, float, float, float } %1080, 0
  %1082 = extractvalue { float, float, float, float } %1080, 1
  %1083 = extractvalue { float, float, float, float } %1080, 2
  %1084 = extractvalue { float, float, float, float } %1080, 3
  %1085 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1046, float %1047, float %1048, float %1049, i32 0, i32 0, i32 0, i32 0, i32 %716, i32 %719)
  %1086 = extractvalue { float, float, float, float } %1085, 0
  %1087 = extractvalue { float, float, float, float } %1085, 1
  %1088 = extractvalue { float, float, float, float } %1085, 2
  %1089 = extractvalue { float, float, float, float } %1085, 3
  %1090 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1051, float %1052, float %1053, float %1054, i32 0, i32 0, i32 0, i32 0, i32 %764, i32 %767)
  %1091 = extractvalue { float, float, float, float } %1090, 0
  %1092 = extractvalue { float, float, float, float } %1090, 1
  %1093 = extractvalue { float, float, float, float } %1090, 2
  %1094 = extractvalue { float, float, float, float } %1090, 3
  %1095 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1056, float %1057, float %1058, float %1059, i32 0, i32 0, i32 0, i32 0, i32 %812, i32 %815)
  %1096 = extractvalue { float, float, float, float } %1095, 0
  %1097 = extractvalue { float, float, float, float } %1095, 1
  %1098 = extractvalue { float, float, float, float } %1095, 2
  %1099 = extractvalue { float, float, float, float } %1095, 3
  %1100 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1061, float %1062, float %1063, float %1064, i32 0, i32 0, i32 0, i32 0, i32 %674, i32 %677)
  %1101 = extractvalue { float, float, float, float } %1100, 0
  %1102 = extractvalue { float, float, float, float } %1100, 1
  %1103 = extractvalue { float, float, float, float } %1100, 2
  %1104 = extractvalue { float, float, float, float } %1100, 3
  %1105 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1066, float %1067, float %1068, float %1069, i32 0, i32 0, i32 0, i32 0, i32 %722, i32 %725)
  %1106 = extractvalue { float, float, float, float } %1105, 0
  %1107 = extractvalue { float, float, float, float } %1105, 1
  %1108 = extractvalue { float, float, float, float } %1105, 2
  %1109 = extractvalue { float, float, float, float } %1105, 3
  %1110 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1071, float %1072, float %1073, float %1074, i32 0, i32 0, i32 0, i32 0, i32 %770, i32 %773)
  %1111 = extractvalue { float, float, float, float } %1110, 0
  %1112 = extractvalue { float, float, float, float } %1110, 1
  %1113 = extractvalue { float, float, float, float } %1110, 2
  %1114 = extractvalue { float, float, float, float } %1110, 3
  %1115 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1076, float %1077, float %1078, float %1079, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1116 = extractvalue { float, float, float, float } %1115, 0
  %1117 = extractvalue { float, float, float, float } %1115, 1
  %1118 = extractvalue { float, float, float, float } %1115, 2
  %1119 = extractvalue { float, float, float, float } %1115, 3
  %1120 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1081, float %1082, float %1083, float %1084, i32 0, i32 0, i32 0, i32 0, i32 %674, i32 %677)
  %1121 = extractvalue { float, float, float, float } %1120, 0
  %1122 = extractvalue { float, float, float, float } %1120, 1
  %1123 = extractvalue { float, float, float, float } %1120, 2
  %1124 = extractvalue { float, float, float, float } %1120, 3
  %1125 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1086, float %1087, float %1088, float %1089, i32 0, i32 0, i32 0, i32 0, i32 %722, i32 %725)
  %1126 = extractvalue { float, float, float, float } %1125, 0
  %1127 = extractvalue { float, float, float, float } %1125, 1
  %1128 = extractvalue { float, float, float, float } %1125, 2
  %1129 = extractvalue { float, float, float, float } %1125, 3
  %1130 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1091, float %1092, float %1093, float %1094, i32 0, i32 0, i32 0, i32 0, i32 %770, i32 %773)
  %1131 = extractvalue { float, float, float, float } %1130, 0
  %1132 = extractvalue { float, float, float, float } %1130, 1
  %1133 = extractvalue { float, float, float, float } %1130, 2
  %1134 = extractvalue { float, float, float, float } %1130, 3
  %1135 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1096, float %1097, float %1098, float %1099, i32 0, i32 0, i32 0, i32 0, i32 %818, i32 %821)
  %1136 = extractvalue { float, float, float, float } %1135, 0
  %1137 = extractvalue { float, float, float, float } %1135, 1
  %1138 = extractvalue { float, float, float, float } %1135, 2
  %1139 = extractvalue { float, float, float, float } %1135, 3
  %1140 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1101, float %1102, float %1103, float %1104, i32 0, i32 0, i32 0, i32 0, i32 %680, i32 %683)
  %1141 = extractvalue { float, float, float, float } %1140, 0
  %1142 = extractvalue { float, float, float, float } %1140, 1
  %1143 = extractvalue { float, float, float, float } %1140, 2
  %1144 = extractvalue { float, float, float, float } %1140, 3
  %1145 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1106, float %1107, float %1108, float %1109, i32 0, i32 0, i32 0, i32 0, i32 %728, i32 %731)
  %1146 = extractvalue { float, float, float, float } %1145, 0
  %1147 = extractvalue { float, float, float, float } %1145, 1
  %1148 = extractvalue { float, float, float, float } %1145, 2
  %1149 = extractvalue { float, float, float, float } %1145, 3
  %1150 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1111, float %1112, float %1113, float %1114, i32 0, i32 0, i32 0, i32 0, i32 %776, i32 %779)
  %1151 = extractvalue { float, float, float, float } %1150, 0
  %1152 = extractvalue { float, float, float, float } %1150, 1
  %1153 = extractvalue { float, float, float, float } %1150, 2
  %1154 = extractvalue { float, float, float, float } %1150, 3
  %1155 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1116, float %1117, float %1118, float %1119, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1156 = extractvalue { float, float, float, float } %1155, 0
  %1157 = extractvalue { float, float, float, float } %1155, 1
  %1158 = extractvalue { float, float, float, float } %1155, 2
  %1159 = extractvalue { float, float, float, float } %1155, 3
  %1160 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1121, float %1122, float %1123, float %1124, i32 0, i32 0, i32 0, i32 0, i32 %680, i32 %683)
  %1161 = extractvalue { float, float, float, float } %1160, 0
  %1162 = extractvalue { float, float, float, float } %1160, 1
  %1163 = extractvalue { float, float, float, float } %1160, 2
  %1164 = extractvalue { float, float, float, float } %1160, 3
  %1165 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1126, float %1127, float %1128, float %1129, i32 0, i32 0, i32 0, i32 0, i32 %728, i32 %731)
  %1166 = extractvalue { float, float, float, float } %1165, 0
  %1167 = extractvalue { float, float, float, float } %1165, 1
  %1168 = extractvalue { float, float, float, float } %1165, 2
  %1169 = extractvalue { float, float, float, float } %1165, 3
  %1170 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1131, float %1132, float %1133, float %1134, i32 0, i32 0, i32 0, i32 0, i32 %776, i32 %779)
  %1171 = extractvalue { float, float, float, float } %1170, 0
  %1172 = extractvalue { float, float, float, float } %1170, 1
  %1173 = extractvalue { float, float, float, float } %1170, 2
  %1174 = extractvalue { float, float, float, float } %1170, 3
  %1175 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1136, float %1137, float %1138, float %1139, i32 0, i32 0, i32 0, i32 0, i32 %824, i32 %827)
  %1176 = extractvalue { float, float, float, float } %1175, 0
  %1177 = extractvalue { float, float, float, float } %1175, 1
  %1178 = extractvalue { float, float, float, float } %1175, 2
  %1179 = extractvalue { float, float, float, float } %1175, 3
  %1180 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %1141, 0
  %1181 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1180, float %1142, 1
  %1182 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1181, float %1143, 2
  %1183 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1182, float %1144, 3
  %1184 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1183, float %1146, 4
  %1185 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1184, float %1147, 5
  %1186 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1185, float %1148, 6
  %1187 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1186, float %1149, 7
  %1188 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1187, float %1151, 8
  %1189 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1188, float %1152, 9
  %1190 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1189, float %1153, 10
  %1191 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1190, float %1154, 11
  %1192 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1191, float %1156, 12
  %1193 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1192, float %1157, 13
  %1194 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1193, float %1158, 14
  %1195 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1194, float %1159, 15
  %1196 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1195, float %1161, 16
  %1197 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1196, float %1162, 17
  %1198 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1197, float %1163, 18
  %1199 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1198, float %1164, 19
  %1200 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1199, float %1166, 20
  %1201 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1200, float %1167, 21
  %1202 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1201, float %1168, 22
  %1203 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1202, float %1169, 23
  %1204 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1203, float %1171, 24
  %1205 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1204, float %1172, 25
  %1206 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1205, float %1173, 26
  %1207 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1206, float %1174, 27
  %1208 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1207, float %1176, 28
  %1209 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1208, float %1177, 29
  %1210 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1209, float %1178, 30
  %1211 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1210, float %1179, 31
  %1212 = add i64 %221, 128
  %1213 = add i32 %223, 1
  %1214 = icmp slt i32 %1213, 3
  %1215 = select i1 %1214, i32 %1213, i32 0
  %1216 = add i64 %1212, %36
  %1217 = add i64 %1216, %82
  %1218 = add i64 %1216, %83
  %1219 = add i64 %1216, %84
  %1220 = add i64 %1216, %85
  %1221 = add i64 %1216, %86
  %1222 = add i64 %1216, %87
  %1223 = add i64 %1216, %88
  %1224 = add i64 %1216, %89
  %1225 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1217
  %1226 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1218
  %1227 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1219
  %1228 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1220
  %1229 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1221
  %1230 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1222
  %1231 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1223
  %1232 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1224
  %1233 = mul i32 %1215, 8192
  %1234 = add i32 %1233, 0
  %1235 = add i32 %1234, 0
  %1236 = add i32 %1235, 0
  %1237 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1236
  call void @llvm.nvvm.barrier0()
  %1238 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %111
  %1239 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %119
  %1240 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %127
  %1241 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %135
  %1242 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %143
  %1243 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %151
  %1244 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %159
  %1245 = getelementptr inbounds bfloat, ptr addrspace(3) %1237, i32 %167
  %1246 = select i1 %228, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1238, ptr addrspace(1) %1225, i32 %1246)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1239, ptr addrspace(1) %1226, i32 %1246)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1240, ptr addrspace(1) %1227, i32 %1246)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1241, ptr addrspace(1) %1228, i32 %1246)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1242, ptr addrspace(1) %1229, i32 %1246)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1243, ptr addrspace(1) %1230, i32 %1246)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1244, ptr addrspace(1) %1231, i32 %1246)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1245, ptr addrspace(1) %1232, i32 %1246)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %1247 = add i32 %224, 1
  %1248 = icmp slt i32 %1247, 3
  %1249 = select i1 %1248, i32 %1247, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %1250 = mul i32 %1249, 8192
  %1251 = add i32 %1250, 0
  %1252 = add i32 %1251, 0
  %1253 = add i32 %1252, 0
  %1254 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1253
  %1255 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %1254, 0
  %1256 = insertvalue { ptr addrspace(3), i32, i32 } %1255, i32 0, 1
  %1257 = insertvalue { ptr addrspace(3), i32, i32 } %1256, i32 0, 2
  %1258 = add i32 %220, 128
  br label %219

1259:                                             ; preds = %219
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %1260 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 0
  %1261 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 1
  %1262 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 2
  %1263 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 3
  %1264 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 4
  %1265 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 5
  %1266 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 6
  %1267 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 7
  %1268 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 8
  %1269 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 9
  %1270 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 10
  %1271 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 11
  %1272 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 12
  %1273 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 13
  %1274 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 14
  %1275 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 15
  %1276 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 16
  %1277 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 17
  %1278 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 18
  %1279 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 19
  %1280 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 20
  %1281 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 21
  %1282 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 22
  %1283 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 23
  %1284 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 24
  %1285 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 25
  %1286 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 26
  %1287 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 27
  %1288 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 28
  %1289 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 29
  %1290 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 30
  %1291 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %222, 31
  %1292 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1260)
  %1293 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1261)
  %1294 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1262)
  %1295 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1263)
  %1296 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1264)
  %1297 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1265)
  %1298 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1266)
  %1299 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1267)
  %1300 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1268)
  %1301 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1269)
  %1302 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1270)
  %1303 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1271)
  %1304 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1272)
  %1305 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1273)
  %1306 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1274)
  %1307 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1275)
  %1308 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1276)
  %1309 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1277)
  %1310 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1278)
  %1311 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1279)
  %1312 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1280)
  %1313 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1281)
  %1314 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1282)
  %1315 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1283)
  %1316 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1284)
  %1317 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1285)
  %1318 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1286)
  %1319 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1287)
  %1320 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1288)
  %1321 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1289)
  %1322 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1290)
  %1323 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1291)
  %1324 = mul i32 %11, 64
  %1325 = sext i32 %1324 to i64
  %1326 = select i1 %31, i32 0, i32 1
  %1327 = xor i32 0, %1326
  %1328 = select i1 %39, i32 0, i32 2
  %1329 = xor i32 %1327, %1328
  %1330 = select i1 %43, i32 0, i32 4
  %1331 = xor i32 %1329, %1330
  %1332 = select i1 %47, i32 0, i32 8
  %1333 = xor i32 %1331, %1332
  %1334 = xor i32 %1333, 0
  %1335 = xor i32 %1333, 16
  %1336 = xor i32 %1333, 32
  %1337 = xor i32 %1333, 48
  %1338 = add i32 %1334, 0
  %1339 = add i32 %1335, 0
  %1340 = add i32 %1336, 0
  %1341 = add i32 %1337, 0
  %1342 = xor i32 %29, 0
  %1343 = add i32 %1342, 0
  %1344 = sext i32 %1338 to i64
  %1345 = sext i32 %1339 to i64
  %1346 = sext i32 %1340 to i64
  %1347 = sext i32 %1341 to i64
  %1348 = sext i32 %1343 to i64
  %1349 = add i64 %1325, %1344
  %1350 = add i64 %1325, %1345
  %1351 = add i64 %1325, %1346
  %1352 = add i64 %1325, %1347
  %1353 = mul i64 %1349, 9216
  %1354 = mul i64 %1350, 9216
  %1355 = mul i64 %1351, 9216
  %1356 = mul i64 %1352, 9216
  %1357 = add i64 %15, %1348
  %1358 = add i64 %1353, %1357
  %1359 = add i64 %1354, %1357
  %1360 = add i64 %1355, %1357
  %1361 = add i64 %1356, %1357
  %1362 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1358
  %1363 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1359
  %1364 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1360
  %1365 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1361
  %1366 = select i1 %19, i32 0, i32 2
  %1367 = xor i32 0, %1366
  %1368 = select i1 %23, i32 0, i32 4
  %1369 = xor i32 %1367, %1368
  %1370 = select i1 %27, i32 0, i32 64
  %1371 = xor i32 %1369, %1370
  %1372 = select i1 %31, i32 0, i32 128
  %1373 = xor i32 %1371, %1372
  %1374 = select i1 %39, i32 0, i32 256
  %1375 = xor i32 %1373, %1374
  %1376 = select i1 %43, i32 0, i32 8
  %1377 = xor i32 %1375, %1376
  %1378 = select i1 %47, i32 0, i32 1024
  %1379 = xor i32 %1377, %1378
  %1380 = select i1 %39, i32 0, i32 128
  %1381 = xor i32 %33, %1380
  %1382 = select i1 %43, i32 0, i32 256
  %1383 = xor i32 %1381, %1382
  %1384 = select i1 %47, i32 0, i32 512
  %1385 = xor i32 %1383, %1384
  %1386 = xor i32 %1379, 0
  %1387 = lshr i32 %1386, 6
  %1388 = shl i32 %1387, 3
  %1389 = add i32 %1388, %1386
  %1390 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1389
  %1391 = insertelement <2 x bfloat> undef, bfloat %1292, i32 0
  %1392 = insertelement <2 x bfloat> %1391, bfloat %1293, i32 1
  %1393 = extractelement <2 x bfloat> %1392, i32 0
  %1394 = extractelement <2 x bfloat> %1392, i32 1
  %1395 = bitcast bfloat %1393 to i16
  %1396 = bitcast bfloat %1394 to i16
  %1397 = insertelement <2 x i16> undef, i16 %1395, i32 0
  %1398 = insertelement <2 x i16> %1397, i16 %1396, i32 1
  %1399 = extractelement <2 x i16> %1398, i32 0
  %1400 = extractelement <2 x i16> %1398, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1390, i16 %1399, i16 %1400, i1 true)
  %1401 = xor i32 %1379, 512
  %1402 = lshr i32 %1401, 6
  %1403 = shl i32 %1402, 3
  %1404 = add i32 %1403, %1401
  %1405 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1404
  %1406 = insertelement <2 x bfloat> undef, bfloat %1294, i32 0
  %1407 = insertelement <2 x bfloat> %1406, bfloat %1295, i32 1
  %1408 = extractelement <2 x bfloat> %1407, i32 0
  %1409 = extractelement <2 x bfloat> %1407, i32 1
  %1410 = bitcast bfloat %1408 to i16
  %1411 = bitcast bfloat %1409 to i16
  %1412 = insertelement <2 x i16> undef, i16 %1410, i32 0
  %1413 = insertelement <2 x i16> %1412, i16 %1411, i32 1
  %1414 = extractelement <2 x i16> %1413, i32 0
  %1415 = extractelement <2 x i16> %1413, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1405, i16 %1414, i16 %1415, i1 true)
  %1416 = xor i32 %1379, 16
  %1417 = lshr i32 %1416, 6
  %1418 = shl i32 %1417, 3
  %1419 = add i32 %1418, %1416
  %1420 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1419
  %1421 = insertelement <2 x bfloat> undef, bfloat %1296, i32 0
  %1422 = insertelement <2 x bfloat> %1421, bfloat %1297, i32 1
  %1423 = extractelement <2 x bfloat> %1422, i32 0
  %1424 = extractelement <2 x bfloat> %1422, i32 1
  %1425 = bitcast bfloat %1423 to i16
  %1426 = bitcast bfloat %1424 to i16
  %1427 = insertelement <2 x i16> undef, i16 %1425, i32 0
  %1428 = insertelement <2 x i16> %1427, i16 %1426, i32 1
  %1429 = extractelement <2 x i16> %1428, i32 0
  %1430 = extractelement <2 x i16> %1428, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1420, i16 %1429, i16 %1430, i1 true)
  %1431 = xor i32 %1379, 528
  %1432 = lshr i32 %1431, 6
  %1433 = shl i32 %1432, 3
  %1434 = add i32 %1433, %1431
  %1435 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1434
  %1436 = insertelement <2 x bfloat> undef, bfloat %1298, i32 0
  %1437 = insertelement <2 x bfloat> %1436, bfloat %1299, i32 1
  %1438 = extractelement <2 x bfloat> %1437, i32 0
  %1439 = extractelement <2 x bfloat> %1437, i32 1
  %1440 = bitcast bfloat %1438 to i16
  %1441 = bitcast bfloat %1439 to i16
  %1442 = insertelement <2 x i16> undef, i16 %1440, i32 0
  %1443 = insertelement <2 x i16> %1442, i16 %1441, i32 1
  %1444 = extractelement <2 x i16> %1443, i32 0
  %1445 = extractelement <2 x i16> %1443, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1435, i16 %1444, i16 %1445, i1 true)
  %1446 = xor i32 %1379, 32
  %1447 = lshr i32 %1446, 6
  %1448 = shl i32 %1447, 3
  %1449 = add i32 %1448, %1446
  %1450 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1449
  %1451 = insertelement <2 x bfloat> undef, bfloat %1300, i32 0
  %1452 = insertelement <2 x bfloat> %1451, bfloat %1301, i32 1
  %1453 = extractelement <2 x bfloat> %1452, i32 0
  %1454 = extractelement <2 x bfloat> %1452, i32 1
  %1455 = bitcast bfloat %1453 to i16
  %1456 = bitcast bfloat %1454 to i16
  %1457 = insertelement <2 x i16> undef, i16 %1455, i32 0
  %1458 = insertelement <2 x i16> %1457, i16 %1456, i32 1
  %1459 = extractelement <2 x i16> %1458, i32 0
  %1460 = extractelement <2 x i16> %1458, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1450, i16 %1459, i16 %1460, i1 true)
  %1461 = xor i32 %1379, 544
  %1462 = lshr i32 %1461, 6
  %1463 = shl i32 %1462, 3
  %1464 = add i32 %1463, %1461
  %1465 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1464
  %1466 = insertelement <2 x bfloat> undef, bfloat %1302, i32 0
  %1467 = insertelement <2 x bfloat> %1466, bfloat %1303, i32 1
  %1468 = extractelement <2 x bfloat> %1467, i32 0
  %1469 = extractelement <2 x bfloat> %1467, i32 1
  %1470 = bitcast bfloat %1468 to i16
  %1471 = bitcast bfloat %1469 to i16
  %1472 = insertelement <2 x i16> undef, i16 %1470, i32 0
  %1473 = insertelement <2 x i16> %1472, i16 %1471, i32 1
  %1474 = extractelement <2 x i16> %1473, i32 0
  %1475 = extractelement <2 x i16> %1473, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1465, i16 %1474, i16 %1475, i1 true)
  %1476 = xor i32 %1379, 48
  %1477 = lshr i32 %1476, 6
  %1478 = shl i32 %1477, 3
  %1479 = add i32 %1478, %1476
  %1480 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1479
  %1481 = insertelement <2 x bfloat> undef, bfloat %1304, i32 0
  %1482 = insertelement <2 x bfloat> %1481, bfloat %1305, i32 1
  %1483 = extractelement <2 x bfloat> %1482, i32 0
  %1484 = extractelement <2 x bfloat> %1482, i32 1
  %1485 = bitcast bfloat %1483 to i16
  %1486 = bitcast bfloat %1484 to i16
  %1487 = insertelement <2 x i16> undef, i16 %1485, i32 0
  %1488 = insertelement <2 x i16> %1487, i16 %1486, i32 1
  %1489 = extractelement <2 x i16> %1488, i32 0
  %1490 = extractelement <2 x i16> %1488, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1480, i16 %1489, i16 %1490, i1 true)
  %1491 = xor i32 %1379, 560
  %1492 = lshr i32 %1491, 6
  %1493 = shl i32 %1492, 3
  %1494 = add i32 %1493, %1491
  %1495 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1494
  %1496 = insertelement <2 x bfloat> undef, bfloat %1306, i32 0
  %1497 = insertelement <2 x bfloat> %1496, bfloat %1307, i32 1
  %1498 = extractelement <2 x bfloat> %1497, i32 0
  %1499 = extractelement <2 x bfloat> %1497, i32 1
  %1500 = bitcast bfloat %1498 to i16
  %1501 = bitcast bfloat %1499 to i16
  %1502 = insertelement <2 x i16> undef, i16 %1500, i32 0
  %1503 = insertelement <2 x i16> %1502, i16 %1501, i32 1
  %1504 = extractelement <2 x i16> %1503, i32 0
  %1505 = extractelement <2 x i16> %1503, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1495, i16 %1504, i16 %1505, i1 true)
  call void @llvm.nvvm.barrier0()
  %1506 = xor i32 %1385, 0
  %1507 = lshr i32 %1506, 6
  %1508 = shl i32 %1507, 3
  %1509 = add i32 %1508, %1506
  %1510 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1509
  %1511 = load <4 x i32>, ptr addrspace(3) %1510, align 16
  %1512 = extractelement <4 x i32> %1511, i32 0
  %1513 = extractelement <4 x i32> %1511, i32 1
  %1514 = extractelement <4 x i32> %1511, i32 2
  %1515 = extractelement <4 x i32> %1511, i32 3
  %1516 = insertelement <4 x i32> undef, i32 %1512, i32 0
  %1517 = insertelement <4 x i32> %1516, i32 %1513, i32 1
  %1518 = insertelement <4 x i32> %1517, i32 %1514, i32 2
  %1519 = insertelement <4 x i32> %1518, i32 %1515, i32 3
  %1520 = extractelement <4 x i32> %1519, i32 0
  %1521 = extractelement <4 x i32> %1519, i32 1
  %1522 = extractelement <4 x i32> %1519, i32 2
  %1523 = extractelement <4 x i32> %1519, i32 3
  %1524 = bitcast i32 %1520 to <2 x i16>
  %1525 = extractelement <2 x i16> %1524, i32 0
  %1526 = extractelement <2 x i16> %1524, i32 1
  %1527 = bitcast i32 %1521 to <2 x i16>
  %1528 = extractelement <2 x i16> %1527, i32 0
  %1529 = extractelement <2 x i16> %1527, i32 1
  %1530 = bitcast i32 %1522 to <2 x i16>
  %1531 = extractelement <2 x i16> %1530, i32 0
  %1532 = extractelement <2 x i16> %1530, i32 1
  %1533 = bitcast i32 %1523 to <2 x i16>
  %1534 = extractelement <2 x i16> %1533, i32 0
  %1535 = extractelement <2 x i16> %1533, i32 1
  %1536 = insertelement <8 x i16> undef, i16 %1525, i32 0
  %1537 = insertelement <8 x i16> %1536, i16 %1526, i32 1
  %1538 = insertelement <8 x i16> %1537, i16 %1528, i32 2
  %1539 = insertelement <8 x i16> %1538, i16 %1529, i32 3
  %1540 = insertelement <8 x i16> %1539, i16 %1531, i32 4
  %1541 = insertelement <8 x i16> %1540, i16 %1532, i32 5
  %1542 = insertelement <8 x i16> %1541, i16 %1534, i32 6
  %1543 = insertelement <8 x i16> %1542, i16 %1535, i32 7
  %1544 = extractelement <8 x i16> %1543, i32 0
  %1545 = extractelement <8 x i16> %1543, i32 1
  %1546 = extractelement <8 x i16> %1543, i32 2
  %1547 = extractelement <8 x i16> %1543, i32 3
  %1548 = extractelement <8 x i16> %1543, i32 4
  %1549 = extractelement <8 x i16> %1543, i32 5
  %1550 = extractelement <8 x i16> %1543, i32 6
  %1551 = extractelement <8 x i16> %1543, i32 7
  %1552 = bitcast i16 %1544 to bfloat
  %1553 = bitcast i16 %1545 to bfloat
  %1554 = bitcast i16 %1546 to bfloat
  %1555 = bitcast i16 %1547 to bfloat
  %1556 = bitcast i16 %1548 to bfloat
  %1557 = bitcast i16 %1549 to bfloat
  %1558 = bitcast i16 %1550 to bfloat
  %1559 = bitcast i16 %1551 to bfloat
  %1560 = insertelement <8 x bfloat> undef, bfloat %1552, i32 0
  %1561 = insertelement <8 x bfloat> %1560, bfloat %1553, i32 1
  %1562 = insertelement <8 x bfloat> %1561, bfloat %1554, i32 2
  %1563 = insertelement <8 x bfloat> %1562, bfloat %1555, i32 3
  %1564 = insertelement <8 x bfloat> %1563, bfloat %1556, i32 4
  %1565 = insertelement <8 x bfloat> %1564, bfloat %1557, i32 5
  %1566 = insertelement <8 x bfloat> %1565, bfloat %1558, i32 6
  %1567 = insertelement <8 x bfloat> %1566, bfloat %1559, i32 7
  %1568 = extractelement <8 x bfloat> %1567, i32 0
  %1569 = extractelement <8 x bfloat> %1567, i32 1
  %1570 = extractelement <8 x bfloat> %1567, i32 2
  %1571 = extractelement <8 x bfloat> %1567, i32 3
  %1572 = extractelement <8 x bfloat> %1567, i32 4
  %1573 = extractelement <8 x bfloat> %1567, i32 5
  %1574 = extractelement <8 x bfloat> %1567, i32 6
  %1575 = extractelement <8 x bfloat> %1567, i32 7
  %1576 = xor i32 %1385, 1024
  %1577 = lshr i32 %1576, 6
  %1578 = shl i32 %1577, 3
  %1579 = add i32 %1578, %1576
  %1580 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1579
  %1581 = load <4 x i32>, ptr addrspace(3) %1580, align 16
  %1582 = extractelement <4 x i32> %1581, i32 0
  %1583 = extractelement <4 x i32> %1581, i32 1
  %1584 = extractelement <4 x i32> %1581, i32 2
  %1585 = extractelement <4 x i32> %1581, i32 3
  %1586 = insertelement <4 x i32> undef, i32 %1582, i32 0
  %1587 = insertelement <4 x i32> %1586, i32 %1583, i32 1
  %1588 = insertelement <4 x i32> %1587, i32 %1584, i32 2
  %1589 = insertelement <4 x i32> %1588, i32 %1585, i32 3
  %1590 = extractelement <4 x i32> %1589, i32 0
  %1591 = extractelement <4 x i32> %1589, i32 1
  %1592 = extractelement <4 x i32> %1589, i32 2
  %1593 = extractelement <4 x i32> %1589, i32 3
  %1594 = bitcast i32 %1590 to <2 x i16>
  %1595 = extractelement <2 x i16> %1594, i32 0
  %1596 = extractelement <2 x i16> %1594, i32 1
  %1597 = bitcast i32 %1591 to <2 x i16>
  %1598 = extractelement <2 x i16> %1597, i32 0
  %1599 = extractelement <2 x i16> %1597, i32 1
  %1600 = bitcast i32 %1592 to <2 x i16>
  %1601 = extractelement <2 x i16> %1600, i32 0
  %1602 = extractelement <2 x i16> %1600, i32 1
  %1603 = bitcast i32 %1593 to <2 x i16>
  %1604 = extractelement <2 x i16> %1603, i32 0
  %1605 = extractelement <2 x i16> %1603, i32 1
  %1606 = insertelement <8 x i16> undef, i16 %1595, i32 0
  %1607 = insertelement <8 x i16> %1606, i16 %1596, i32 1
  %1608 = insertelement <8 x i16> %1607, i16 %1598, i32 2
  %1609 = insertelement <8 x i16> %1608, i16 %1599, i32 3
  %1610 = insertelement <8 x i16> %1609, i16 %1601, i32 4
  %1611 = insertelement <8 x i16> %1610, i16 %1602, i32 5
  %1612 = insertelement <8 x i16> %1611, i16 %1604, i32 6
  %1613 = insertelement <8 x i16> %1612, i16 %1605, i32 7
  %1614 = extractelement <8 x i16> %1613, i32 0
  %1615 = extractelement <8 x i16> %1613, i32 1
  %1616 = extractelement <8 x i16> %1613, i32 2
  %1617 = extractelement <8 x i16> %1613, i32 3
  %1618 = extractelement <8 x i16> %1613, i32 4
  %1619 = extractelement <8 x i16> %1613, i32 5
  %1620 = extractelement <8 x i16> %1613, i32 6
  %1621 = extractelement <8 x i16> %1613, i32 7
  %1622 = bitcast i16 %1614 to bfloat
  %1623 = bitcast i16 %1615 to bfloat
  %1624 = bitcast i16 %1616 to bfloat
  %1625 = bitcast i16 %1617 to bfloat
  %1626 = bitcast i16 %1618 to bfloat
  %1627 = bitcast i16 %1619 to bfloat
  %1628 = bitcast i16 %1620 to bfloat
  %1629 = bitcast i16 %1621 to bfloat
  %1630 = insertelement <8 x bfloat> undef, bfloat %1622, i32 0
  %1631 = insertelement <8 x bfloat> %1630, bfloat %1623, i32 1
  %1632 = insertelement <8 x bfloat> %1631, bfloat %1624, i32 2
  %1633 = insertelement <8 x bfloat> %1632, bfloat %1625, i32 3
  %1634 = insertelement <8 x bfloat> %1633, bfloat %1626, i32 4
  %1635 = insertelement <8 x bfloat> %1634, bfloat %1627, i32 5
  %1636 = insertelement <8 x bfloat> %1635, bfloat %1628, i32 6
  %1637 = insertelement <8 x bfloat> %1636, bfloat %1629, i32 7
  %1638 = extractelement <8 x bfloat> %1637, i32 0
  %1639 = extractelement <8 x bfloat> %1637, i32 1
  %1640 = extractelement <8 x bfloat> %1637, i32 2
  %1641 = extractelement <8 x bfloat> %1637, i32 3
  %1642 = extractelement <8 x bfloat> %1637, i32 4
  %1643 = extractelement <8 x bfloat> %1637, i32 5
  %1644 = extractelement <8 x bfloat> %1637, i32 6
  %1645 = extractelement <8 x bfloat> %1637, i32 7
  call void @llvm.nvvm.barrier0()
  %1646 = insertelement <2 x bfloat> undef, bfloat %1308, i32 0
  %1647 = insertelement <2 x bfloat> %1646, bfloat %1309, i32 1
  %1648 = extractelement <2 x bfloat> %1647, i32 0
  %1649 = extractelement <2 x bfloat> %1647, i32 1
  %1650 = bitcast bfloat %1648 to i16
  %1651 = bitcast bfloat %1649 to i16
  %1652 = insertelement <2 x i16> undef, i16 %1650, i32 0
  %1653 = insertelement <2 x i16> %1652, i16 %1651, i32 1
  %1654 = extractelement <2 x i16> %1653, i32 0
  %1655 = extractelement <2 x i16> %1653, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1390, i16 %1654, i16 %1655, i1 true)
  %1656 = insertelement <2 x bfloat> undef, bfloat %1310, i32 0
  %1657 = insertelement <2 x bfloat> %1656, bfloat %1311, i32 1
  %1658 = extractelement <2 x bfloat> %1657, i32 0
  %1659 = extractelement <2 x bfloat> %1657, i32 1
  %1660 = bitcast bfloat %1658 to i16
  %1661 = bitcast bfloat %1659 to i16
  %1662 = insertelement <2 x i16> undef, i16 %1660, i32 0
  %1663 = insertelement <2 x i16> %1662, i16 %1661, i32 1
  %1664 = extractelement <2 x i16> %1663, i32 0
  %1665 = extractelement <2 x i16> %1663, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1405, i16 %1664, i16 %1665, i1 true)
  %1666 = insertelement <2 x bfloat> undef, bfloat %1312, i32 0
  %1667 = insertelement <2 x bfloat> %1666, bfloat %1313, i32 1
  %1668 = extractelement <2 x bfloat> %1667, i32 0
  %1669 = extractelement <2 x bfloat> %1667, i32 1
  %1670 = bitcast bfloat %1668 to i16
  %1671 = bitcast bfloat %1669 to i16
  %1672 = insertelement <2 x i16> undef, i16 %1670, i32 0
  %1673 = insertelement <2 x i16> %1672, i16 %1671, i32 1
  %1674 = extractelement <2 x i16> %1673, i32 0
  %1675 = extractelement <2 x i16> %1673, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1420, i16 %1674, i16 %1675, i1 true)
  %1676 = insertelement <2 x bfloat> undef, bfloat %1314, i32 0
  %1677 = insertelement <2 x bfloat> %1676, bfloat %1315, i32 1
  %1678 = extractelement <2 x bfloat> %1677, i32 0
  %1679 = extractelement <2 x bfloat> %1677, i32 1
  %1680 = bitcast bfloat %1678 to i16
  %1681 = bitcast bfloat %1679 to i16
  %1682 = insertelement <2 x i16> undef, i16 %1680, i32 0
  %1683 = insertelement <2 x i16> %1682, i16 %1681, i32 1
  %1684 = extractelement <2 x i16> %1683, i32 0
  %1685 = extractelement <2 x i16> %1683, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1435, i16 %1684, i16 %1685, i1 true)
  %1686 = insertelement <2 x bfloat> undef, bfloat %1316, i32 0
  %1687 = insertelement <2 x bfloat> %1686, bfloat %1317, i32 1
  %1688 = extractelement <2 x bfloat> %1687, i32 0
  %1689 = extractelement <2 x bfloat> %1687, i32 1
  %1690 = bitcast bfloat %1688 to i16
  %1691 = bitcast bfloat %1689 to i16
  %1692 = insertelement <2 x i16> undef, i16 %1690, i32 0
  %1693 = insertelement <2 x i16> %1692, i16 %1691, i32 1
  %1694 = extractelement <2 x i16> %1693, i32 0
  %1695 = extractelement <2 x i16> %1693, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1450, i16 %1694, i16 %1695, i1 true)
  %1696 = insertelement <2 x bfloat> undef, bfloat %1318, i32 0
  %1697 = insertelement <2 x bfloat> %1696, bfloat %1319, i32 1
  %1698 = extractelement <2 x bfloat> %1697, i32 0
  %1699 = extractelement <2 x bfloat> %1697, i32 1
  %1700 = bitcast bfloat %1698 to i16
  %1701 = bitcast bfloat %1699 to i16
  %1702 = insertelement <2 x i16> undef, i16 %1700, i32 0
  %1703 = insertelement <2 x i16> %1702, i16 %1701, i32 1
  %1704 = extractelement <2 x i16> %1703, i32 0
  %1705 = extractelement <2 x i16> %1703, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1465, i16 %1704, i16 %1705, i1 true)
  %1706 = insertelement <2 x bfloat> undef, bfloat %1320, i32 0
  %1707 = insertelement <2 x bfloat> %1706, bfloat %1321, i32 1
  %1708 = extractelement <2 x bfloat> %1707, i32 0
  %1709 = extractelement <2 x bfloat> %1707, i32 1
  %1710 = bitcast bfloat %1708 to i16
  %1711 = bitcast bfloat %1709 to i16
  %1712 = insertelement <2 x i16> undef, i16 %1710, i32 0
  %1713 = insertelement <2 x i16> %1712, i16 %1711, i32 1
  %1714 = extractelement <2 x i16> %1713, i32 0
  %1715 = extractelement <2 x i16> %1713, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1480, i16 %1714, i16 %1715, i1 true)
  %1716 = insertelement <2 x bfloat> undef, bfloat %1322, i32 0
  %1717 = insertelement <2 x bfloat> %1716, bfloat %1323, i32 1
  %1718 = extractelement <2 x bfloat> %1717, i32 0
  %1719 = extractelement <2 x bfloat> %1717, i32 1
  %1720 = bitcast bfloat %1718 to i16
  %1721 = bitcast bfloat %1719 to i16
  %1722 = insertelement <2 x i16> undef, i16 %1720, i32 0
  %1723 = insertelement <2 x i16> %1722, i16 %1721, i32 1
  %1724 = extractelement <2 x i16> %1723, i32 0
  %1725 = extractelement <2 x i16> %1723, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %1495, i16 %1724, i16 %1725, i1 true)
  call void @llvm.nvvm.barrier0()
  %1726 = load <4 x i32>, ptr addrspace(3) %1510, align 16
  %1727 = extractelement <4 x i32> %1726, i32 0
  %1728 = extractelement <4 x i32> %1726, i32 1
  %1729 = extractelement <4 x i32> %1726, i32 2
  %1730 = extractelement <4 x i32> %1726, i32 3
  %1731 = insertelement <4 x i32> undef, i32 %1727, i32 0
  %1732 = insertelement <4 x i32> %1731, i32 %1728, i32 1
  %1733 = insertelement <4 x i32> %1732, i32 %1729, i32 2
  %1734 = insertelement <4 x i32> %1733, i32 %1730, i32 3
  %1735 = extractelement <4 x i32> %1734, i32 0
  %1736 = extractelement <4 x i32> %1734, i32 1
  %1737 = extractelement <4 x i32> %1734, i32 2
  %1738 = extractelement <4 x i32> %1734, i32 3
  %1739 = bitcast i32 %1735 to <2 x i16>
  %1740 = extractelement <2 x i16> %1739, i32 0
  %1741 = extractelement <2 x i16> %1739, i32 1
  %1742 = bitcast i32 %1736 to <2 x i16>
  %1743 = extractelement <2 x i16> %1742, i32 0
  %1744 = extractelement <2 x i16> %1742, i32 1
  %1745 = bitcast i32 %1737 to <2 x i16>
  %1746 = extractelement <2 x i16> %1745, i32 0
  %1747 = extractelement <2 x i16> %1745, i32 1
  %1748 = bitcast i32 %1738 to <2 x i16>
  %1749 = extractelement <2 x i16> %1748, i32 0
  %1750 = extractelement <2 x i16> %1748, i32 1
  %1751 = insertelement <8 x i16> undef, i16 %1740, i32 0
  %1752 = insertelement <8 x i16> %1751, i16 %1741, i32 1
  %1753 = insertelement <8 x i16> %1752, i16 %1743, i32 2
  %1754 = insertelement <8 x i16> %1753, i16 %1744, i32 3
  %1755 = insertelement <8 x i16> %1754, i16 %1746, i32 4
  %1756 = insertelement <8 x i16> %1755, i16 %1747, i32 5
  %1757 = insertelement <8 x i16> %1756, i16 %1749, i32 6
  %1758 = insertelement <8 x i16> %1757, i16 %1750, i32 7
  %1759 = extractelement <8 x i16> %1758, i32 0
  %1760 = extractelement <8 x i16> %1758, i32 1
  %1761 = extractelement <8 x i16> %1758, i32 2
  %1762 = extractelement <8 x i16> %1758, i32 3
  %1763 = extractelement <8 x i16> %1758, i32 4
  %1764 = extractelement <8 x i16> %1758, i32 5
  %1765 = extractelement <8 x i16> %1758, i32 6
  %1766 = extractelement <8 x i16> %1758, i32 7
  %1767 = bitcast i16 %1759 to bfloat
  %1768 = bitcast i16 %1760 to bfloat
  %1769 = bitcast i16 %1761 to bfloat
  %1770 = bitcast i16 %1762 to bfloat
  %1771 = bitcast i16 %1763 to bfloat
  %1772 = bitcast i16 %1764 to bfloat
  %1773 = bitcast i16 %1765 to bfloat
  %1774 = bitcast i16 %1766 to bfloat
  %1775 = insertelement <8 x bfloat> undef, bfloat %1767, i32 0
  %1776 = insertelement <8 x bfloat> %1775, bfloat %1768, i32 1
  %1777 = insertelement <8 x bfloat> %1776, bfloat %1769, i32 2
  %1778 = insertelement <8 x bfloat> %1777, bfloat %1770, i32 3
  %1779 = insertelement <8 x bfloat> %1778, bfloat %1771, i32 4
  %1780 = insertelement <8 x bfloat> %1779, bfloat %1772, i32 5
  %1781 = insertelement <8 x bfloat> %1780, bfloat %1773, i32 6
  %1782 = insertelement <8 x bfloat> %1781, bfloat %1774, i32 7
  %1783 = extractelement <8 x bfloat> %1782, i32 0
  %1784 = extractelement <8 x bfloat> %1782, i32 1
  %1785 = extractelement <8 x bfloat> %1782, i32 2
  %1786 = extractelement <8 x bfloat> %1782, i32 3
  %1787 = extractelement <8 x bfloat> %1782, i32 4
  %1788 = extractelement <8 x bfloat> %1782, i32 5
  %1789 = extractelement <8 x bfloat> %1782, i32 6
  %1790 = extractelement <8 x bfloat> %1782, i32 7
  %1791 = load <4 x i32>, ptr addrspace(3) %1580, align 16
  %1792 = extractelement <4 x i32> %1791, i32 0
  %1793 = extractelement <4 x i32> %1791, i32 1
  %1794 = extractelement <4 x i32> %1791, i32 2
  %1795 = extractelement <4 x i32> %1791, i32 3
  %1796 = insertelement <4 x i32> undef, i32 %1792, i32 0
  %1797 = insertelement <4 x i32> %1796, i32 %1793, i32 1
  %1798 = insertelement <4 x i32> %1797, i32 %1794, i32 2
  %1799 = insertelement <4 x i32> %1798, i32 %1795, i32 3
  %1800 = extractelement <4 x i32> %1799, i32 0
  %1801 = extractelement <4 x i32> %1799, i32 1
  %1802 = extractelement <4 x i32> %1799, i32 2
  %1803 = extractelement <4 x i32> %1799, i32 3
  %1804 = bitcast i32 %1800 to <2 x i16>
  %1805 = extractelement <2 x i16> %1804, i32 0
  %1806 = extractelement <2 x i16> %1804, i32 1
  %1807 = bitcast i32 %1801 to <2 x i16>
  %1808 = extractelement <2 x i16> %1807, i32 0
  %1809 = extractelement <2 x i16> %1807, i32 1
  %1810 = bitcast i32 %1802 to <2 x i16>
  %1811 = extractelement <2 x i16> %1810, i32 0
  %1812 = extractelement <2 x i16> %1810, i32 1
  %1813 = bitcast i32 %1803 to <2 x i16>
  %1814 = extractelement <2 x i16> %1813, i32 0
  %1815 = extractelement <2 x i16> %1813, i32 1
  %1816 = insertelement <8 x i16> undef, i16 %1805, i32 0
  %1817 = insertelement <8 x i16> %1816, i16 %1806, i32 1
  %1818 = insertelement <8 x i16> %1817, i16 %1808, i32 2
  %1819 = insertelement <8 x i16> %1818, i16 %1809, i32 3
  %1820 = insertelement <8 x i16> %1819, i16 %1811, i32 4
  %1821 = insertelement <8 x i16> %1820, i16 %1812, i32 5
  %1822 = insertelement <8 x i16> %1821, i16 %1814, i32 6
  %1823 = insertelement <8 x i16> %1822, i16 %1815, i32 7
  %1824 = extractelement <8 x i16> %1823, i32 0
  %1825 = extractelement <8 x i16> %1823, i32 1
  %1826 = extractelement <8 x i16> %1823, i32 2
  %1827 = extractelement <8 x i16> %1823, i32 3
  %1828 = extractelement <8 x i16> %1823, i32 4
  %1829 = extractelement <8 x i16> %1823, i32 5
  %1830 = extractelement <8 x i16> %1823, i32 6
  %1831 = extractelement <8 x i16> %1823, i32 7
  %1832 = bitcast i16 %1824 to bfloat
  %1833 = bitcast i16 %1825 to bfloat
  %1834 = bitcast i16 %1826 to bfloat
  %1835 = bitcast i16 %1827 to bfloat
  %1836 = bitcast i16 %1828 to bfloat
  %1837 = bitcast i16 %1829 to bfloat
  %1838 = bitcast i16 %1830 to bfloat
  %1839 = bitcast i16 %1831 to bfloat
  %1840 = insertelement <8 x bfloat> undef, bfloat %1832, i32 0
  %1841 = insertelement <8 x bfloat> %1840, bfloat %1833, i32 1
  %1842 = insertelement <8 x bfloat> %1841, bfloat %1834, i32 2
  %1843 = insertelement <8 x bfloat> %1842, bfloat %1835, i32 3
  %1844 = insertelement <8 x bfloat> %1843, bfloat %1836, i32 4
  %1845 = insertelement <8 x bfloat> %1844, bfloat %1837, i32 5
  %1846 = insertelement <8 x bfloat> %1845, bfloat %1838, i32 6
  %1847 = insertelement <8 x bfloat> %1846, bfloat %1839, i32 7
  %1848 = extractelement <8 x bfloat> %1847, i32 0
  %1849 = extractelement <8 x bfloat> %1847, i32 1
  %1850 = extractelement <8 x bfloat> %1847, i32 2
  %1851 = extractelement <8 x bfloat> %1847, i32 3
  %1852 = extractelement <8 x bfloat> %1847, i32 4
  %1853 = extractelement <8 x bfloat> %1847, i32 5
  %1854 = extractelement <8 x bfloat> %1847, i32 6
  %1855 = extractelement <8 x bfloat> %1847, i32 7
  %1856 = insertelement <2 x bfloat> undef, bfloat %1568, i32 0
  %1857 = insertelement <2 x bfloat> %1856, bfloat %1569, i32 1
  %1858 = bitcast <2 x bfloat> %1857 to i32
  %1859 = insertelement <2 x bfloat> undef, bfloat %1570, i32 0
  %1860 = insertelement <2 x bfloat> %1859, bfloat %1571, i32 1
  %1861 = bitcast <2 x bfloat> %1860 to i32
  %1862 = insertelement <2 x bfloat> undef, bfloat %1572, i32 0
  %1863 = insertelement <2 x bfloat> %1862, bfloat %1573, i32 1
  %1864 = bitcast <2 x bfloat> %1863 to i32
  %1865 = insertelement <2 x bfloat> undef, bfloat %1574, i32 0
  %1866 = insertelement <2 x bfloat> %1865, bfloat %1575, i32 1
  %1867 = bitcast <2 x bfloat> %1866 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1858, i32 %1861, i32 %1864, i32 %1867, ptr addrspace(1) %1362)
  %1868 = insertelement <2 x bfloat> undef, bfloat %1638, i32 0
  %1869 = insertelement <2 x bfloat> %1868, bfloat %1639, i32 1
  %1870 = bitcast <2 x bfloat> %1869 to i32
  %1871 = insertelement <2 x bfloat> undef, bfloat %1640, i32 0
  %1872 = insertelement <2 x bfloat> %1871, bfloat %1641, i32 1
  %1873 = bitcast <2 x bfloat> %1872 to i32
  %1874 = insertelement <2 x bfloat> undef, bfloat %1642, i32 0
  %1875 = insertelement <2 x bfloat> %1874, bfloat %1643, i32 1
  %1876 = bitcast <2 x bfloat> %1875 to i32
  %1877 = insertelement <2 x bfloat> undef, bfloat %1644, i32 0
  %1878 = insertelement <2 x bfloat> %1877, bfloat %1645, i32 1
  %1879 = bitcast <2 x bfloat> %1878 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1870, i32 %1873, i32 %1876, i32 %1879, ptr addrspace(1) %1363)
  %1880 = insertelement <2 x bfloat> undef, bfloat %1783, i32 0
  %1881 = insertelement <2 x bfloat> %1880, bfloat %1784, i32 1
  %1882 = bitcast <2 x bfloat> %1881 to i32
  %1883 = insertelement <2 x bfloat> undef, bfloat %1785, i32 0
  %1884 = insertelement <2 x bfloat> %1883, bfloat %1786, i32 1
  %1885 = bitcast <2 x bfloat> %1884 to i32
  %1886 = insertelement <2 x bfloat> undef, bfloat %1787, i32 0
  %1887 = insertelement <2 x bfloat> %1886, bfloat %1788, i32 1
  %1888 = bitcast <2 x bfloat> %1887 to i32
  %1889 = insertelement <2 x bfloat> undef, bfloat %1789, i32 0
  %1890 = insertelement <2 x bfloat> %1889, bfloat %1790, i32 1
  %1891 = bitcast <2 x bfloat> %1890 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1882, i32 %1885, i32 %1888, i32 %1891, ptr addrspace(1) %1364)
  %1892 = insertelement <2 x bfloat> undef, bfloat %1848, i32 0
  %1893 = insertelement <2 x bfloat> %1892, bfloat %1849, i32 1
  %1894 = bitcast <2 x bfloat> %1893 to i32
  %1895 = insertelement <2 x bfloat> undef, bfloat %1850, i32 0
  %1896 = insertelement <2 x bfloat> %1895, bfloat %1851, i32 1
  %1897 = bitcast <2 x bfloat> %1896 to i32
  %1898 = insertelement <2 x bfloat> undef, bfloat %1852, i32 0
  %1899 = insertelement <2 x bfloat> %1898, bfloat %1853, i32 1
  %1900 = bitcast <2 x bfloat> %1899 to i32
  %1901 = insertelement <2 x bfloat> undef, bfloat %1854, i32 0
  %1902 = insertelement <2 x bfloat> %1901, bfloat %1855, i32 1
  %1903 = bitcast <2 x bfloat> %1902 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1894, i32 %1897, i32 %1900, i32 %1903, ptr addrspace(1) %1365)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_123_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_123(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 9216
  %10 = add i64 %9, 8192
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

define ptx_kernel void @loop_convert_fusion_8(ptr noalias align 128 dereferenceable(786432) %0, ptr noalias align 128 dereferenceable(393216) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_8_param_0_360(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_8_param_0_360(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_8_param_0_360(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_122_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_122(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 9216
  %11 = add i64 %10, 7168
  %12 = getelementptr bfloat, ptr addrspace(1) %3, i64 %11
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
  %98 = mul i64 %9, 1024
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
  %152 = add i64 %10, 8192
  %153 = getelementptr bfloat, ptr addrspace(1) %3, i64 %152
  %154 = getelementptr bfloat, ptr addrspace(1) %153, i64 %44
  %155 = getelementptr bfloat, ptr addrspace(1) %153, i64 %45
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
  %206 = getelementptr bfloat, ptr addrspace(1) %2, i64 %98
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
  %274 = fadd float %205, %258
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
  %290 = fadd float %151, %274
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
  %306 = fadd float %97, %290
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
  %322 = fmul float %306, %306
  %323 = fadd float %307, %308
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
  %337 = fadd float %336, %322
  %338 = bitcast float %337 to i32
  %339 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %338, i32 16, i32 31)
  %340 = bitcast i32 %339 to float
  %341 = fadd float %337, %340
  %342 = bitcast float %341 to i32
  %343 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %342, i32 8, i32 31)
  %344 = bitcast i32 %343 to float
  %345 = fadd float %341, %344
  %346 = bitcast float %345 to i32
  %347 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %346, i32 4, i32 31)
  %348 = bitcast i32 %347 to float
  %349 = fadd float %345, %348
  %350 = bitcast float %349 to i32
  %351 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %350, i32 2, i32 31)
  %352 = bitcast i32 %351 to float
  %353 = fadd float %349, %352
  %354 = bitcast float %353 to i32
  %355 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %354, i32 1, i32 31)
  %356 = bitcast i32 %355 to float
  %357 = fadd float %353, %356
  %358 = urem i32 %14, 32
  %359 = urem i32 %15, 2
  %360 = icmp eq i32 %358, 0
  %361 = and i1 true, %360
  %362 = add i32 0, %359
  %363 = getelementptr float, ptr addrspace(3) @global_smem, i32 %362
  %364 = insertelement <1 x float> undef, float %357, i32 0
  %365 = extractelement <1 x float> %364, i32 0
  %366 = bitcast float %365 to i32
  %367 = insertelement <1 x i32> undef, i32 %366, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %363, <1 x i32> %367, i1 %361)
  call void @llvm.nvvm.barrier0()
  %368 = icmp slt i32 %13, 2
  %369 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %370 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %369, i1 %368)
  %371 = insertelement <1 x i32> undef, i32 %370, i32 0
  %372 = extractelement <1 x i32> %371, i32 0
  %373 = bitcast i32 %372 to float
  %374 = insertelement <1 x float> undef, float %373, i32 0
  %375 = extractelement <1 x float> %374, i32 0
  %376 = bitcast float %375 to i32
  %377 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %376, i32 1, i32 31)
  %378 = bitcast i32 %377 to float
  %379 = fadd float %375, %378
  %380 = urem i32 %14, 2
  %381 = icmp eq i32 %380, 0
  %382 = and i1 %368, %381
  %383 = insertelement <1 x float> undef, float %379, i32 0
  %384 = extractelement <1 x float> %383, i32 0
  %385 = bitcast float %384 to i32
  %386 = insertelement <1 x i32> undef, i32 %385, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %369, <1 x i32> %386, i1 %382)
  call void @llvm.nvvm.barrier0()
  %387 = load float, ptr addrspace(3) @global_smem, align 4
  %388 = fmul float %387, 0x3F50000000000000
  %389 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %390 = bitcast i32 %389 to <1 x float>
  %391 = extractelement <1 x float> %390, i32 0
  %392 = fadd float %388, %391
  %393 = call float @__nv_rsqrtf(float %392)
  %394 = fmul float %291, %393
  %395 = fmul float %292, %393
  %396 = fmul float %293, %393
  %397 = fmul float %294, %393
  %398 = fmul float %295, %393
  %399 = fmul float %296, %393
  %400 = fmul float %297, %393
  %401 = fmul float %298, %393
  %402 = fmul float %299, %393
  %403 = fmul float %300, %393
  %404 = fmul float %301, %393
  %405 = fmul float %302, %393
  %406 = fmul float %303, %393
  %407 = fmul float %304, %393
  %408 = fmul float %305, %393
  %409 = fmul float %306, %393
  %410 = getelementptr bfloat, ptr addrspace(1) %5, i64 %44
  %411 = getelementptr bfloat, ptr addrspace(1) %5, i64 %45
  %412 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %410)
  %413 = extractvalue { i32, i32, i32, i32 } %412, 0
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %412, 1
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractvalue { i32, i32, i32, i32 } %412, 2
  %418 = bitcast i32 %417 to <2 x bfloat>
  %419 = extractvalue { i32, i32, i32, i32 } %412, 3
  %420 = bitcast i32 %419 to <2 x bfloat>
  %421 = extractelement <2 x bfloat> %414, i32 0
  %422 = extractelement <2 x bfloat> %414, i32 1
  %423 = extractelement <2 x bfloat> %416, i32 0
  %424 = extractelement <2 x bfloat> %416, i32 1
  %425 = extractelement <2 x bfloat> %418, i32 0
  %426 = extractelement <2 x bfloat> %418, i32 1
  %427 = extractelement <2 x bfloat> %420, i32 0
  %428 = extractelement <2 x bfloat> %420, i32 1
  %429 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %411)
  %430 = extractvalue { i32, i32, i32, i32 } %429, 0
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractvalue { i32, i32, i32, i32 } %429, 1
  %433 = bitcast i32 %432 to <2 x bfloat>
  %434 = extractvalue { i32, i32, i32, i32 } %429, 2
  %435 = bitcast i32 %434 to <2 x bfloat>
  %436 = extractvalue { i32, i32, i32, i32 } %429, 3
  %437 = bitcast i32 %436 to <2 x bfloat>
  %438 = extractelement <2 x bfloat> %431, i32 0
  %439 = extractelement <2 x bfloat> %431, i32 1
  %440 = extractelement <2 x bfloat> %433, i32 0
  %441 = extractelement <2 x bfloat> %433, i32 1
  %442 = extractelement <2 x bfloat> %435, i32 0
  %443 = extractelement <2 x bfloat> %435, i32 1
  %444 = extractelement <2 x bfloat> %437, i32 0
  %445 = extractelement <2 x bfloat> %437, i32 1
  %446 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421)
  %447 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422)
  %448 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423)
  %449 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424)
  %450 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425)
  %451 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426)
  %452 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %427)
  %453 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %428)
  %454 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438)
  %455 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439)
  %456 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %457 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %458 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442)
  %459 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443)
  %460 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444)
  %461 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %445)
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
  %477 = fmul float %409, %461
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
  %493 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477)
  %494 = getelementptr bfloat, ptr addrspace(1) %6, i64 %98
  %495 = getelementptr bfloat, ptr addrspace(1) %494, i64 %44
  %496 = getelementptr bfloat, ptr addrspace(1) %494, i64 %45
  %497 = insertelement <2 x bfloat> undef, bfloat %478, i32 0
  %498 = insertelement <2 x bfloat> %497, bfloat %479, i32 1
  %499 = bitcast <2 x bfloat> %498 to i32
  %500 = insertelement <2 x bfloat> undef, bfloat %480, i32 0
  %501 = insertelement <2 x bfloat> %500, bfloat %481, i32 1
  %502 = bitcast <2 x bfloat> %501 to i32
  %503 = insertelement <2 x bfloat> undef, bfloat %482, i32 0
  %504 = insertelement <2 x bfloat> %503, bfloat %483, i32 1
  %505 = bitcast <2 x bfloat> %504 to i32
  %506 = insertelement <2 x bfloat> undef, bfloat %484, i32 0
  %507 = insertelement <2 x bfloat> %506, bfloat %485, i32 1
  %508 = bitcast <2 x bfloat> %507 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %499, i32 %502, i32 %505, i32 %508, ptr addrspace(1) %495)
  %509 = insertelement <2 x bfloat> undef, bfloat %486, i32 0
  %510 = insertelement <2 x bfloat> %509, bfloat %487, i32 1
  %511 = bitcast <2 x bfloat> %510 to i32
  %512 = insertelement <2 x bfloat> undef, bfloat %488, i32 0
  %513 = insertelement <2 x bfloat> %512, bfloat %489, i32 1
  %514 = bitcast <2 x bfloat> %513 to i32
  %515 = insertelement <2 x bfloat> undef, bfloat %490, i32 0
  %516 = insertelement <2 x bfloat> %515, bfloat %491, i32 1
  %517 = bitcast <2 x bfloat> %516 to i32
  %518 = insertelement <2 x bfloat> undef, bfloat %492, i32 0
  %519 = insertelement <2 x bfloat> %518, bfloat %493, i32 1
  %520 = bitcast <2 x bfloat> %519 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %511, i32 %514, i32 %517, i32 %520, ptr addrspace(1) %496)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_121_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_121(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #6 {
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
  %11 = mul i64 %10, 9216
  %12 = add i64 %11, 6144
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
  %99 = mul i64 %10, 1024
  %100 = getelementptr bfloat, ptr addrspace(1) %6, i64 %99
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
  %153 = add i64 %11, 7168
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
  %207 = getelementptr bfloat, ptr addrspace(1) %5, i64 %99
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
  %260 = add i64 %11, 8192
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
  %314 = getelementptr bfloat, ptr addrspace(1) %3, i64 %99
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
  %367 = fadd float %298, %351
  %368 = fadd float %299, %352
  %369 = fadd float %300, %353
  %370 = fadd float %301, %354
  %371 = fadd float %302, %355
  %372 = fadd float %303, %356
  %373 = fadd float %304, %357
  %374 = fadd float %305, %358
  %375 = fadd float %306, %359
  %376 = fadd float %307, %360
  %377 = fadd float %308, %361
  %378 = fadd float %309, %362
  %379 = fadd float %310, %363
  %380 = fadd float %311, %364
  %381 = fadd float %312, %365
  %382 = fadd float %313, %366
  %383 = fadd float %244, %367
  %384 = fadd float %245, %368
  %385 = fadd float %246, %369
  %386 = fadd float %247, %370
  %387 = fadd float %248, %371
  %388 = fadd float %249, %372
  %389 = fadd float %250, %373
  %390 = fadd float %251, %374
  %391 = fadd float %252, %375
  %392 = fadd float %253, %376
  %393 = fadd float %254, %377
  %394 = fadd float %255, %378
  %395 = fadd float %256, %379
  %396 = fadd float %257, %380
  %397 = fadd float %258, %381
  %398 = fadd float %259, %382
  %399 = fadd float %191, %383
  %400 = fadd float %192, %384
  %401 = fadd float %193, %385
  %402 = fadd float %194, %386
  %403 = fadd float %195, %387
  %404 = fadd float %196, %388
  %405 = fadd float %197, %389
  %406 = fadd float %198, %390
  %407 = fadd float %199, %391
  %408 = fadd float %200, %392
  %409 = fadd float %201, %393
  %410 = fadd float %202, %394
  %411 = fadd float %203, %395
  %412 = fadd float %204, %396
  %413 = fadd float %205, %397
  %414 = fadd float %206, %398
  %415 = fadd float %137, %399
  %416 = fadd float %138, %400
  %417 = fadd float %139, %401
  %418 = fadd float %140, %402
  %419 = fadd float %141, %403
  %420 = fadd float %142, %404
  %421 = fadd float %143, %405
  %422 = fadd float %144, %406
  %423 = fadd float %145, %407
  %424 = fadd float %146, %408
  %425 = fadd float %147, %409
  %426 = fadd float %148, %410
  %427 = fadd float %149, %411
  %428 = fadd float %150, %412
  %429 = fadd float %151, %413
  %430 = fadd float %152, %414
  %431 = fadd float %83, %415
  %432 = fadd float %84, %416
  %433 = fadd float %85, %417
  %434 = fadd float %86, %418
  %435 = fadd float %87, %419
  %436 = fadd float %88, %420
  %437 = fadd float %89, %421
  %438 = fadd float %90, %422
  %439 = fadd float %91, %423
  %440 = fadd float %92, %424
  %441 = fadd float %93, %425
  %442 = fadd float %94, %426
  %443 = fadd float %95, %427
  %444 = fadd float %96, %428
  %445 = fadd float %97, %429
  %446 = fadd float %98, %430
  %447 = fmul float %431, %431
  %448 = fmul float %432, %432
  %449 = fmul float %433, %433
  %450 = fmul float %434, %434
  %451 = fmul float %435, %435
  %452 = fmul float %436, %436
  %453 = fmul float %437, %437
  %454 = fmul float %438, %438
  %455 = fmul float %439, %439
  %456 = fmul float %440, %440
  %457 = fmul float %441, %441
  %458 = fmul float %442, %442
  %459 = fmul float %443, %443
  %460 = fmul float %444, %444
  %461 = fmul float %445, %445
  %462 = fmul float %446, %446
  %463 = fadd float %447, %448
  %464 = fadd float %463, %449
  %465 = fadd float %464, %450
  %466 = fadd float %465, %451
  %467 = fadd float %466, %452
  %468 = fadd float %467, %453
  %469 = fadd float %468, %454
  %470 = fadd float %469, %455
  %471 = fadd float %470, %456
  %472 = fadd float %471, %457
  %473 = fadd float %472, %458
  %474 = fadd float %473, %459
  %475 = fadd float %474, %460
  %476 = fadd float %475, %461
  %477 = fadd float %476, %462
  %478 = bitcast float %477 to i32
  %479 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %478, i32 16, i32 31)
  %480 = bitcast i32 %479 to float
  %481 = fadd float %477, %480
  %482 = bitcast float %481 to i32
  %483 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %482, i32 8, i32 31)
  %484 = bitcast i32 %483 to float
  %485 = fadd float %481, %484
  %486 = bitcast float %485 to i32
  %487 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %486, i32 4, i32 31)
  %488 = bitcast i32 %487 to float
  %489 = fadd float %485, %488
  %490 = bitcast float %489 to i32
  %491 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %490, i32 2, i32 31)
  %492 = bitcast i32 %491 to float
  %493 = fadd float %489, %492
  %494 = bitcast float %493 to i32
  %495 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %494, i32 1, i32 31)
  %496 = bitcast i32 %495 to float
  %497 = fadd float %493, %496
  %498 = urem i32 %15, 32
  %499 = urem i32 %16, 2
  %500 = icmp eq i32 %498, 0
  %501 = and i1 true, %500
  %502 = add i32 0, %499
  %503 = getelementptr float, ptr addrspace(3) @global_smem, i32 %502
  %504 = insertelement <1 x float> undef, float %497, i32 0
  %505 = extractelement <1 x float> %504, i32 0
  %506 = bitcast float %505 to i32
  %507 = insertelement <1 x i32> undef, i32 %506, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %503, <1 x i32> %507, i1 %501)
  call void @llvm.nvvm.barrier0()
  %508 = icmp slt i32 %14, 2
  %509 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %510 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %509, i1 %508)
  %511 = insertelement <1 x i32> undef, i32 %510, i32 0
  %512 = extractelement <1 x i32> %511, i32 0
  %513 = bitcast i32 %512 to float
  %514 = insertelement <1 x float> undef, float %513, i32 0
  %515 = extractelement <1 x float> %514, i32 0
  %516 = bitcast float %515 to i32
  %517 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %516, i32 1, i32 31)
  %518 = bitcast i32 %517 to float
  %519 = fadd float %515, %518
  %520 = urem i32 %15, 2
  %521 = icmp eq i32 %520, 0
  %522 = and i1 %508, %521
  %523 = insertelement <1 x float> undef, float %519, i32 0
  %524 = extractelement <1 x float> %523, i32 0
  %525 = bitcast float %524 to i32
  %526 = insertelement <1 x i32> undef, i32 %525, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %509, <1 x i32> %526, i1 %522)
  call void @llvm.nvvm.barrier0()
  %527 = load float, ptr addrspace(3) @global_smem, align 4
  %528 = fmul float %527, 0x3F50000000000000
  %529 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %530 = bitcast i32 %529 to <1 x float>
  %531 = extractelement <1 x float> %530, i32 0
  %532 = fadd float %528, %531
  %533 = call float @__nv_rsqrtf(float %532)
  %534 = fmul float %431, %533
  %535 = fmul float %432, %533
  %536 = fmul float %433, %533
  %537 = fmul float %434, %533
  %538 = fmul float %435, %533
  %539 = fmul float %436, %533
  %540 = fmul float %437, %533
  %541 = fmul float %438, %533
  %542 = fmul float %439, %533
  %543 = fmul float %440, %533
  %544 = fmul float %441, %533
  %545 = fmul float %442, %533
  %546 = fmul float %443, %533
  %547 = fmul float %444, %533
  %548 = fmul float %445, %533
  %549 = fmul float %446, %533
  %550 = getelementptr bfloat, ptr addrspace(1) %2, i64 %45
  %551 = getelementptr bfloat, ptr addrspace(1) %2, i64 %46
  %552 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %550)
  %553 = extractvalue { i32, i32, i32, i32 } %552, 0
  %554 = bitcast i32 %553 to <2 x bfloat>
  %555 = extractvalue { i32, i32, i32, i32 } %552, 1
  %556 = bitcast i32 %555 to <2 x bfloat>
  %557 = extractvalue { i32, i32, i32, i32 } %552, 2
  %558 = bitcast i32 %557 to <2 x bfloat>
  %559 = extractvalue { i32, i32, i32, i32 } %552, 3
  %560 = bitcast i32 %559 to <2 x bfloat>
  %561 = extractelement <2 x bfloat> %554, i32 0
  %562 = extractelement <2 x bfloat> %554, i32 1
  %563 = extractelement <2 x bfloat> %556, i32 0
  %564 = extractelement <2 x bfloat> %556, i32 1
  %565 = extractelement <2 x bfloat> %558, i32 0
  %566 = extractelement <2 x bfloat> %558, i32 1
  %567 = extractelement <2 x bfloat> %560, i32 0
  %568 = extractelement <2 x bfloat> %560, i32 1
  %569 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %551)
  %570 = extractvalue { i32, i32, i32, i32 } %569, 0
  %571 = bitcast i32 %570 to <2 x bfloat>
  %572 = extractvalue { i32, i32, i32, i32 } %569, 1
  %573 = bitcast i32 %572 to <2 x bfloat>
  %574 = extractvalue { i32, i32, i32, i32 } %569, 2
  %575 = bitcast i32 %574 to <2 x bfloat>
  %576 = extractvalue { i32, i32, i32, i32 } %569, 3
  %577 = bitcast i32 %576 to <2 x bfloat>
  %578 = extractelement <2 x bfloat> %571, i32 0
  %579 = extractelement <2 x bfloat> %571, i32 1
  %580 = extractelement <2 x bfloat> %573, i32 0
  %581 = extractelement <2 x bfloat> %573, i32 1
  %582 = extractelement <2 x bfloat> %575, i32 0
  %583 = extractelement <2 x bfloat> %575, i32 1
  %584 = extractelement <2 x bfloat> %577, i32 0
  %585 = extractelement <2 x bfloat> %577, i32 1
  %586 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %561)
  %587 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %562)
  %588 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %563)
  %589 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %564)
  %590 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %565)
  %591 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %566)
  %592 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %567)
  %593 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %568)
  %594 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578)
  %595 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %579)
  %596 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %580)
  %597 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %581)
  %598 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %582)
  %599 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %583)
  %600 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %584)
  %601 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %585)
  %602 = fmul float %534, %586
  %603 = fmul float %535, %587
  %604 = fmul float %536, %588
  %605 = fmul float %537, %589
  %606 = fmul float %538, %590
  %607 = fmul float %539, %591
  %608 = fmul float %540, %592
  %609 = fmul float %541, %593
  %610 = fmul float %542, %594
  %611 = fmul float %543, %595
  %612 = fmul float %544, %596
  %613 = fmul float %545, %597
  %614 = fmul float %546, %598
  %615 = fmul float %547, %599
  %616 = fmul float %548, %600
  %617 = fmul float %549, %601
  %618 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %602)
  %619 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %603)
  %620 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %604)
  %621 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %605)
  %622 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %606)
  %623 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %607)
  %624 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %608)
  %625 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %609)
  %626 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %610)
  %627 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %611)
  %628 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612)
  %629 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613)
  %630 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614)
  %631 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615)
  %632 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616)
  %633 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617)
  %634 = getelementptr bfloat, ptr addrspace(1) %7, i64 %99
  %635 = getelementptr bfloat, ptr addrspace(1) %634, i64 %45
  %636 = getelementptr bfloat, ptr addrspace(1) %634, i64 %46
  %637 = insertelement <2 x bfloat> undef, bfloat %618, i32 0
  %638 = insertelement <2 x bfloat> %637, bfloat %619, i32 1
  %639 = bitcast <2 x bfloat> %638 to i32
  %640 = insertelement <2 x bfloat> undef, bfloat %620, i32 0
  %641 = insertelement <2 x bfloat> %640, bfloat %621, i32 1
  %642 = bitcast <2 x bfloat> %641 to i32
  %643 = insertelement <2 x bfloat> undef, bfloat %622, i32 0
  %644 = insertelement <2 x bfloat> %643, bfloat %623, i32 1
  %645 = bitcast <2 x bfloat> %644 to i32
  %646 = insertelement <2 x bfloat> undef, bfloat %624, i32 0
  %647 = insertelement <2 x bfloat> %646, bfloat %625, i32 1
  %648 = bitcast <2 x bfloat> %647 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %639, i32 %642, i32 %645, i32 %648, ptr addrspace(1) %635)
  %649 = insertelement <2 x bfloat> undef, bfloat %626, i32 0
  %650 = insertelement <2 x bfloat> %649, bfloat %627, i32 1
  %651 = bitcast <2 x bfloat> %650 to i32
  %652 = insertelement <2 x bfloat> undef, bfloat %628, i32 0
  %653 = insertelement <2 x bfloat> %652, bfloat %629, i32 1
  %654 = bitcast <2 x bfloat> %653 to i32
  %655 = insertelement <2 x bfloat> undef, bfloat %630, i32 0
  %656 = insertelement <2 x bfloat> %655, bfloat %631, i32 1
  %657 = bitcast <2 x bfloat> %656 to i32
  %658 = insertelement <2 x bfloat> undef, bfloat %632, i32 0
  %659 = insertelement <2 x bfloat> %658, bfloat %633, i32 1
  %660 = bitcast <2 x bfloat> %659 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %651, i32 %654, i32 %657, i32 %660, ptr addrspace(1) %636)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_120_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_120(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #6 {
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
  %12 = mul i64 %11, 9216
  %13 = add i64 %12, 5120
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
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
  %100 = mul i64 %11, 1024
  %101 = getelementptr bfloat, ptr addrspace(1) %2, i64 %100
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
  %154 = add i64 %12, 6144
  %155 = getelementptr bfloat, ptr addrspace(1) %3, i64 %154
  %156 = getelementptr bfloat, ptr addrspace(1) %155, i64 %46
  %157 = getelementptr bfloat, ptr addrspace(1) %155, i64 %47
  %158 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %156)
  %159 = extractvalue { i32, i32, i32, i32 } %158, 0
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractvalue { i32, i32, i32, i32 } %158, 1
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractvalue { i32, i32, i32, i32 } %158, 2
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractvalue { i32, i32, i32, i32 } %158, 3
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractelement <2 x bfloat> %160, i32 0
  %168 = extractelement <2 x bfloat> %160, i32 1
  %169 = extractelement <2 x bfloat> %162, i32 0
  %170 = extractelement <2 x bfloat> %162, i32 1
  %171 = extractelement <2 x bfloat> %164, i32 0
  %172 = extractelement <2 x bfloat> %164, i32 1
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %157)
  %176 = extractvalue { i32, i32, i32, i32 } %175, 0
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractvalue { i32, i32, i32, i32 } %175, 1
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractvalue { i32, i32, i32, i32 } %175, 2
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %175, 3
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractelement <2 x bfloat> %177, i32 0
  %185 = extractelement <2 x bfloat> %177, i32 1
  %186 = extractelement <2 x bfloat> %179, i32 0
  %187 = extractelement <2 x bfloat> %179, i32 1
  %188 = extractelement <2 x bfloat> %181, i32 0
  %189 = extractelement <2 x bfloat> %181, i32 1
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167)
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = getelementptr bfloat, ptr addrspace(1) %7, i64 %100
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
  %261 = add i64 %12, 7168
  %262 = getelementptr bfloat, ptr addrspace(1) %3, i64 %261
  %263 = getelementptr bfloat, ptr addrspace(1) %262, i64 %46
  %264 = getelementptr bfloat, ptr addrspace(1) %262, i64 %47
  %265 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %263)
  %266 = extractvalue { i32, i32, i32, i32 } %265, 0
  %267 = bitcast i32 %266 to <2 x bfloat>
  %268 = extractvalue { i32, i32, i32, i32 } %265, 1
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = extractvalue { i32, i32, i32, i32 } %265, 2
  %271 = bitcast i32 %270 to <2 x bfloat>
  %272 = extractvalue { i32, i32, i32, i32 } %265, 3
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = extractelement <2 x bfloat> %267, i32 0
  %275 = extractelement <2 x bfloat> %267, i32 1
  %276 = extractelement <2 x bfloat> %269, i32 0
  %277 = extractelement <2 x bfloat> %269, i32 1
  %278 = extractelement <2 x bfloat> %271, i32 0
  %279 = extractelement <2 x bfloat> %271, i32 1
  %280 = extractelement <2 x bfloat> %273, i32 0
  %281 = extractelement <2 x bfloat> %273, i32 1
  %282 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %264)
  %283 = extractvalue { i32, i32, i32, i32 } %282, 0
  %284 = bitcast i32 %283 to <2 x bfloat>
  %285 = extractvalue { i32, i32, i32, i32 } %282, 1
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractvalue { i32, i32, i32, i32 } %282, 2
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %282, 3
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractelement <2 x bfloat> %284, i32 0
  %292 = extractelement <2 x bfloat> %284, i32 1
  %293 = extractelement <2 x bfloat> %286, i32 0
  %294 = extractelement <2 x bfloat> %286, i32 1
  %295 = extractelement <2 x bfloat> %288, i32 0
  %296 = extractelement <2 x bfloat> %288, i32 1
  %297 = extractelement <2 x bfloat> %290, i32 0
  %298 = extractelement <2 x bfloat> %290, i32 1
  %299 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274)
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = getelementptr bfloat, ptr addrspace(1) %6, i64 %100
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
  %368 = add i64 %12, 8192
  %369 = getelementptr bfloat, ptr addrspace(1) %3, i64 %368
  %370 = getelementptr bfloat, ptr addrspace(1) %369, i64 %46
  %371 = getelementptr bfloat, ptr addrspace(1) %369, i64 %47
  %372 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %370)
  %373 = extractvalue { i32, i32, i32, i32 } %372, 0
  %374 = bitcast i32 %373 to <2 x bfloat>
  %375 = extractvalue { i32, i32, i32, i32 } %372, 1
  %376 = bitcast i32 %375 to <2 x bfloat>
  %377 = extractvalue { i32, i32, i32, i32 } %372, 2
  %378 = bitcast i32 %377 to <2 x bfloat>
  %379 = extractvalue { i32, i32, i32, i32 } %372, 3
  %380 = bitcast i32 %379 to <2 x bfloat>
  %381 = extractelement <2 x bfloat> %374, i32 0
  %382 = extractelement <2 x bfloat> %374, i32 1
  %383 = extractelement <2 x bfloat> %376, i32 0
  %384 = extractelement <2 x bfloat> %376, i32 1
  %385 = extractelement <2 x bfloat> %378, i32 0
  %386 = extractelement <2 x bfloat> %378, i32 1
  %387 = extractelement <2 x bfloat> %380, i32 0
  %388 = extractelement <2 x bfloat> %380, i32 1
  %389 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %371)
  %390 = extractvalue { i32, i32, i32, i32 } %389, 0
  %391 = bitcast i32 %390 to <2 x bfloat>
  %392 = extractvalue { i32, i32, i32, i32 } %389, 1
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %389, 2
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %389, 3
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractelement <2 x bfloat> %391, i32 0
  %399 = extractelement <2 x bfloat> %391, i32 1
  %400 = extractelement <2 x bfloat> %393, i32 0
  %401 = extractelement <2 x bfloat> %393, i32 1
  %402 = extractelement <2 x bfloat> %395, i32 0
  %403 = extractelement <2 x bfloat> %395, i32 1
  %404 = extractelement <2 x bfloat> %397, i32 0
  %405 = extractelement <2 x bfloat> %397, i32 1
  %406 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %407 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %408 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %386)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %388)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %422 = getelementptr bfloat, ptr addrspace(1) %5, i64 %100
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
  %490 = fadd float %421, %474
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
  %506 = fadd float %367, %490
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
  %522 = fadd float %314, %506
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
  %538 = fadd float %260, %522
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
  %554 = fadd float %207, %538
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
  %570 = fadd float %153, %554
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
  %586 = fadd float %99, %570
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
  %602 = fmul float %586, %586
  %603 = fadd float %587, %588
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
  %617 = fadd float %616, %602
  %618 = bitcast float %617 to i32
  %619 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %618, i32 16, i32 31)
  %620 = bitcast i32 %619 to float
  %621 = fadd float %617, %620
  %622 = bitcast float %621 to i32
  %623 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %622, i32 8, i32 31)
  %624 = bitcast i32 %623 to float
  %625 = fadd float %621, %624
  %626 = bitcast float %625 to i32
  %627 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %626, i32 4, i32 31)
  %628 = bitcast i32 %627 to float
  %629 = fadd float %625, %628
  %630 = bitcast float %629 to i32
  %631 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %630, i32 2, i32 31)
  %632 = bitcast i32 %631 to float
  %633 = fadd float %629, %632
  %634 = bitcast float %633 to i32
  %635 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %634, i32 1, i32 31)
  %636 = bitcast i32 %635 to float
  %637 = fadd float %633, %636
  %638 = urem i32 %16, 32
  %639 = urem i32 %17, 2
  %640 = icmp eq i32 %638, 0
  %641 = and i1 true, %640
  %642 = add i32 0, %639
  %643 = getelementptr float, ptr addrspace(3) @global_smem, i32 %642
  %644 = insertelement <1 x float> undef, float %637, i32 0
  %645 = extractelement <1 x float> %644, i32 0
  %646 = bitcast float %645 to i32
  %647 = insertelement <1 x i32> undef, i32 %646, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %643, <1 x i32> %647, i1 %641)
  call void @llvm.nvvm.barrier0()
  %648 = icmp slt i32 %15, 2
  %649 = getelementptr float, ptr addrspace(3) @global_smem, i32 %15
  %650 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %649, i1 %648)
  %651 = insertelement <1 x i32> undef, i32 %650, i32 0
  %652 = extractelement <1 x i32> %651, i32 0
  %653 = bitcast i32 %652 to float
  %654 = insertelement <1 x float> undef, float %653, i32 0
  %655 = extractelement <1 x float> %654, i32 0
  %656 = bitcast float %655 to i32
  %657 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %656, i32 1, i32 31)
  %658 = bitcast i32 %657 to float
  %659 = fadd float %655, %658
  %660 = urem i32 %16, 2
  %661 = icmp eq i32 %660, 0
  %662 = and i1 %648, %661
  %663 = insertelement <1 x float> undef, float %659, i32 0
  %664 = extractelement <1 x float> %663, i32 0
  %665 = bitcast float %664 to i32
  %666 = insertelement <1 x i32> undef, i32 %665, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %649, <1 x i32> %666, i1 %662)
  call void @llvm.nvvm.barrier0()
  %667 = load float, ptr addrspace(3) @global_smem, align 4
  %668 = fmul float %667, 0x3F50000000000000
  %669 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %670 = bitcast i32 %669 to <1 x float>
  %671 = extractelement <1 x float> %670, i32 0
  %672 = fadd float %668, %671
  %673 = call float @__nv_rsqrtf(float %672)
  %674 = fmul float %571, %673
  %675 = fmul float %572, %673
  %676 = fmul float %573, %673
  %677 = fmul float %574, %673
  %678 = fmul float %575, %673
  %679 = fmul float %576, %673
  %680 = fmul float %577, %673
  %681 = fmul float %578, %673
  %682 = fmul float %579, %673
  %683 = fmul float %580, %673
  %684 = fmul float %581, %673
  %685 = fmul float %582, %673
  %686 = fmul float %583, %673
  %687 = fmul float %584, %673
  %688 = fmul float %585, %673
  %689 = fmul float %586, %673
  %690 = getelementptr bfloat, ptr addrspace(1) %4, i64 %46
  %691 = getelementptr bfloat, ptr addrspace(1) %4, i64 %47
  %692 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %690)
  %693 = extractvalue { i32, i32, i32, i32 } %692, 0
  %694 = bitcast i32 %693 to <2 x bfloat>
  %695 = extractvalue { i32, i32, i32, i32 } %692, 1
  %696 = bitcast i32 %695 to <2 x bfloat>
  %697 = extractvalue { i32, i32, i32, i32 } %692, 2
  %698 = bitcast i32 %697 to <2 x bfloat>
  %699 = extractvalue { i32, i32, i32, i32 } %692, 3
  %700 = bitcast i32 %699 to <2 x bfloat>
  %701 = extractelement <2 x bfloat> %694, i32 0
  %702 = extractelement <2 x bfloat> %694, i32 1
  %703 = extractelement <2 x bfloat> %696, i32 0
  %704 = extractelement <2 x bfloat> %696, i32 1
  %705 = extractelement <2 x bfloat> %698, i32 0
  %706 = extractelement <2 x bfloat> %698, i32 1
  %707 = extractelement <2 x bfloat> %700, i32 0
  %708 = extractelement <2 x bfloat> %700, i32 1
  %709 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %691)
  %710 = extractvalue { i32, i32, i32, i32 } %709, 0
  %711 = bitcast i32 %710 to <2 x bfloat>
  %712 = extractvalue { i32, i32, i32, i32 } %709, 1
  %713 = bitcast i32 %712 to <2 x bfloat>
  %714 = extractvalue { i32, i32, i32, i32 } %709, 2
  %715 = bitcast i32 %714 to <2 x bfloat>
  %716 = extractvalue { i32, i32, i32, i32 } %709, 3
  %717 = bitcast i32 %716 to <2 x bfloat>
  %718 = extractelement <2 x bfloat> %711, i32 0
  %719 = extractelement <2 x bfloat> %711, i32 1
  %720 = extractelement <2 x bfloat> %713, i32 0
  %721 = extractelement <2 x bfloat> %713, i32 1
  %722 = extractelement <2 x bfloat> %715, i32 0
  %723 = extractelement <2 x bfloat> %715, i32 1
  %724 = extractelement <2 x bfloat> %717, i32 0
  %725 = extractelement <2 x bfloat> %717, i32 1
  %726 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %701)
  %727 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %702)
  %728 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %703)
  %729 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %704)
  %730 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %705)
  %731 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %706)
  %732 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %707)
  %733 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %708)
  %734 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %718)
  %735 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %719)
  %736 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %720)
  %737 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %721)
  %738 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %722)
  %739 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %723)
  %740 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %724)
  %741 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %725)
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
  %757 = fmul float %689, %741
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
  %773 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %757)
  %774 = getelementptr bfloat, ptr addrspace(1) %8, i64 %100
  %775 = getelementptr bfloat, ptr addrspace(1) %774, i64 %46
  %776 = getelementptr bfloat, ptr addrspace(1) %774, i64 %47
  %777 = insertelement <2 x bfloat> undef, bfloat %758, i32 0
  %778 = insertelement <2 x bfloat> %777, bfloat %759, i32 1
  %779 = bitcast <2 x bfloat> %778 to i32
  %780 = insertelement <2 x bfloat> undef, bfloat %760, i32 0
  %781 = insertelement <2 x bfloat> %780, bfloat %761, i32 1
  %782 = bitcast <2 x bfloat> %781 to i32
  %783 = insertelement <2 x bfloat> undef, bfloat %762, i32 0
  %784 = insertelement <2 x bfloat> %783, bfloat %763, i32 1
  %785 = bitcast <2 x bfloat> %784 to i32
  %786 = insertelement <2 x bfloat> undef, bfloat %764, i32 0
  %787 = insertelement <2 x bfloat> %786, bfloat %765, i32 1
  %788 = bitcast <2 x bfloat> %787 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %779, i32 %782, i32 %785, i32 %788, ptr addrspace(1) %775)
  %789 = insertelement <2 x bfloat> undef, bfloat %766, i32 0
  %790 = insertelement <2 x bfloat> %789, bfloat %767, i32 1
  %791 = bitcast <2 x bfloat> %790 to i32
  %792 = insertelement <2 x bfloat> undef, bfloat %768, i32 0
  %793 = insertelement <2 x bfloat> %792, bfloat %769, i32 1
  %794 = bitcast <2 x bfloat> %793 to i32
  %795 = insertelement <2 x bfloat> undef, bfloat %770, i32 0
  %796 = insertelement <2 x bfloat> %795, bfloat %771, i32 1
  %797 = bitcast <2 x bfloat> %796 to i32
  %798 = insertelement <2 x bfloat> undef, bfloat %772, i32 0
  %799 = insertelement <2 x bfloat> %798, bfloat %773, i32 1
  %800 = bitcast <2 x bfloat> %799 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %791, i32 %794, i32 %797, i32 %800, ptr addrspace(1) %776)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_119_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_119(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8) #6 {
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
  %13 = mul i64 %12, 9216
  %14 = add i64 %13, 4096
  %15 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = urem i32 %16, 32
  %18 = udiv i32 %16, 32
  %19 = and i32 %17, 1
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 0, i32 8
  %22 = xor i32 0, %21
  %23 = and i32 %17, 2
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 0, i32 16
  %26 = xor i32 %22, %25
  %27 = and i32 %17, 4
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 0, i32 32
  %30 = xor i32 %26, %29
  %31 = and i32 %17, 8
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %32, i32 0, i32 64
  %34 = xor i32 %30, %33
  %35 = and i32 %17, 16
  %36 = icmp eq i32 %35, 0
  %37 = select i1 %36, i32 0, i32 128
  %38 = xor i32 %34, %37
  %39 = and i32 %18, 1
  %40 = icmp eq i32 %39, 0
  %41 = select i1 %40, i32 0, i32 256
  %42 = xor i32 %38, %41
  %43 = xor i32 %42, 0
  %44 = xor i32 %42, 512
  %45 = add i32 %43, 0
  %46 = add i32 %44, 0
  %47 = sext i32 %45 to i64
  %48 = sext i32 %46 to i64
  %49 = getelementptr bfloat, ptr addrspace(1) %15, i64 %47
  %50 = getelementptr bfloat, ptr addrspace(1) %15, i64 %48
  %51 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %49)
  %52 = extractvalue { i32, i32, i32, i32 } %51, 0
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractvalue { i32, i32, i32, i32 } %51, 1
  %55 = bitcast i32 %54 to <2 x bfloat>
  %56 = extractvalue { i32, i32, i32, i32 } %51, 2
  %57 = bitcast i32 %56 to <2 x bfloat>
  %58 = extractvalue { i32, i32, i32, i32 } %51, 3
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractelement <2 x bfloat> %53, i32 0
  %61 = extractelement <2 x bfloat> %53, i32 1
  %62 = extractelement <2 x bfloat> %55, i32 0
  %63 = extractelement <2 x bfloat> %55, i32 1
  %64 = extractelement <2 x bfloat> %57, i32 0
  %65 = extractelement <2 x bfloat> %57, i32 1
  %66 = extractelement <2 x bfloat> %59, i32 0
  %67 = extractelement <2 x bfloat> %59, i32 1
  %68 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %50)
  %69 = extractvalue { i32, i32, i32, i32 } %68, 0
  %70 = bitcast i32 %69 to <2 x bfloat>
  %71 = extractvalue { i32, i32, i32, i32 } %68, 1
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractvalue { i32, i32, i32, i32 } %68, 2
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %68, 3
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractelement <2 x bfloat> %70, i32 0
  %78 = extractelement <2 x bfloat> %70, i32 1
  %79 = extractelement <2 x bfloat> %72, i32 0
  %80 = extractelement <2 x bfloat> %72, i32 1
  %81 = extractelement <2 x bfloat> %74, i32 0
  %82 = extractelement <2 x bfloat> %74, i32 1
  %83 = extractelement <2 x bfloat> %76, i32 0
  %84 = extractelement <2 x bfloat> %76, i32 1
  %85 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %60)
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = mul i64 %12, 1024
  %102 = getelementptr bfloat, ptr addrspace(1) %5, i64 %101
  %103 = getelementptr bfloat, ptr addrspace(1) %102, i64 %47
  %104 = getelementptr bfloat, ptr addrspace(1) %102, i64 %48
  %105 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %103)
  %106 = extractvalue { i32, i32, i32, i32 } %105, 0
  %107 = bitcast i32 %106 to <2 x bfloat>
  %108 = extractvalue { i32, i32, i32, i32 } %105, 1
  %109 = bitcast i32 %108 to <2 x bfloat>
  %110 = extractvalue { i32, i32, i32, i32 } %105, 2
  %111 = bitcast i32 %110 to <2 x bfloat>
  %112 = extractvalue { i32, i32, i32, i32 } %105, 3
  %113 = bitcast i32 %112 to <2 x bfloat>
  %114 = extractelement <2 x bfloat> %107, i32 0
  %115 = extractelement <2 x bfloat> %107, i32 1
  %116 = extractelement <2 x bfloat> %109, i32 0
  %117 = extractelement <2 x bfloat> %109, i32 1
  %118 = extractelement <2 x bfloat> %111, i32 0
  %119 = extractelement <2 x bfloat> %111, i32 1
  %120 = extractelement <2 x bfloat> %113, i32 0
  %121 = extractelement <2 x bfloat> %113, i32 1
  %122 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %104)
  %123 = extractvalue { i32, i32, i32, i32 } %122, 0
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractvalue { i32, i32, i32, i32 } %122, 1
  %126 = bitcast i32 %125 to <2 x bfloat>
  %127 = extractvalue { i32, i32, i32, i32 } %122, 2
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %122, 3
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractelement <2 x bfloat> %124, i32 0
  %132 = extractelement <2 x bfloat> %124, i32 1
  %133 = extractelement <2 x bfloat> %126, i32 0
  %134 = extractelement <2 x bfloat> %126, i32 1
  %135 = extractelement <2 x bfloat> %128, i32 0
  %136 = extractelement <2 x bfloat> %128, i32 1
  %137 = extractelement <2 x bfloat> %130, i32 0
  %138 = extractelement <2 x bfloat> %130, i32 1
  %139 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114)
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = add i64 %13, 5120
  %156 = getelementptr bfloat, ptr addrspace(1) %4, i64 %155
  %157 = getelementptr bfloat, ptr addrspace(1) %156, i64 %47
  %158 = getelementptr bfloat, ptr addrspace(1) %156, i64 %48
  %159 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %157)
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
  %176 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %158)
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractelement <2 x bfloat> %178, i32 0
  %186 = extractelement <2 x bfloat> %178, i32 1
  %187 = extractelement <2 x bfloat> %180, i32 0
  %188 = extractelement <2 x bfloat> %180, i32 1
  %189 = extractelement <2 x bfloat> %182, i32 0
  %190 = extractelement <2 x bfloat> %182, i32 1
  %191 = extractelement <2 x bfloat> %184, i32 0
  %192 = extractelement <2 x bfloat> %184, i32 1
  %193 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168)
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = getelementptr bfloat, ptr addrspace(1) %3, i64 %101
  %210 = getelementptr bfloat, ptr addrspace(1) %209, i64 %47
  %211 = getelementptr bfloat, ptr addrspace(1) %209, i64 %48
  %212 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %210)
  %213 = extractvalue { i32, i32, i32, i32 } %212, 0
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %212, 1
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractvalue { i32, i32, i32, i32 } %212, 2
  %218 = bitcast i32 %217 to <2 x bfloat>
  %219 = extractvalue { i32, i32, i32, i32 } %212, 3
  %220 = bitcast i32 %219 to <2 x bfloat>
  %221 = extractelement <2 x bfloat> %214, i32 0
  %222 = extractelement <2 x bfloat> %214, i32 1
  %223 = extractelement <2 x bfloat> %216, i32 0
  %224 = extractelement <2 x bfloat> %216, i32 1
  %225 = extractelement <2 x bfloat> %218, i32 0
  %226 = extractelement <2 x bfloat> %218, i32 1
  %227 = extractelement <2 x bfloat> %220, i32 0
  %228 = extractelement <2 x bfloat> %220, i32 1
  %229 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %211)
  %230 = extractvalue { i32, i32, i32, i32 } %229, 0
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %229, 1
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %229, 2
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %229, 3
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractelement <2 x bfloat> %231, i32 0
  %239 = extractelement <2 x bfloat> %231, i32 1
  %240 = extractelement <2 x bfloat> %233, i32 0
  %241 = extractelement <2 x bfloat> %233, i32 1
  %242 = extractelement <2 x bfloat> %235, i32 0
  %243 = extractelement <2 x bfloat> %235, i32 1
  %244 = extractelement <2 x bfloat> %237, i32 0
  %245 = extractelement <2 x bfloat> %237, i32 1
  %246 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221)
  %247 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = add i64 %13, 6144
  %263 = getelementptr bfloat, ptr addrspace(1) %4, i64 %262
  %264 = getelementptr bfloat, ptr addrspace(1) %263, i64 %47
  %265 = getelementptr bfloat, ptr addrspace(1) %263, i64 %48
  %266 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %264)
  %267 = extractvalue { i32, i32, i32, i32 } %266, 0
  %268 = bitcast i32 %267 to <2 x bfloat>
  %269 = extractvalue { i32, i32, i32, i32 } %266, 1
  %270 = bitcast i32 %269 to <2 x bfloat>
  %271 = extractvalue { i32, i32, i32, i32 } %266, 2
  %272 = bitcast i32 %271 to <2 x bfloat>
  %273 = extractvalue { i32, i32, i32, i32 } %266, 3
  %274 = bitcast i32 %273 to <2 x bfloat>
  %275 = extractelement <2 x bfloat> %268, i32 0
  %276 = extractelement <2 x bfloat> %268, i32 1
  %277 = extractelement <2 x bfloat> %270, i32 0
  %278 = extractelement <2 x bfloat> %270, i32 1
  %279 = extractelement <2 x bfloat> %272, i32 0
  %280 = extractelement <2 x bfloat> %272, i32 1
  %281 = extractelement <2 x bfloat> %274, i32 0
  %282 = extractelement <2 x bfloat> %274, i32 1
  %283 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %265)
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = bitcast i32 %284 to <2 x bfloat>
  %286 = extractvalue { i32, i32, i32, i32 } %283, 1
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %283, 2
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %283, 3
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractelement <2 x bfloat> %285, i32 0
  %293 = extractelement <2 x bfloat> %285, i32 1
  %294 = extractelement <2 x bfloat> %287, i32 0
  %295 = extractelement <2 x bfloat> %287, i32 1
  %296 = extractelement <2 x bfloat> %289, i32 0
  %297 = extractelement <2 x bfloat> %289, i32 1
  %298 = extractelement <2 x bfloat> %291, i32 0
  %299 = extractelement <2 x bfloat> %291, i32 1
  %300 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275)
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = getelementptr bfloat, ptr addrspace(1) %8, i64 %101
  %317 = getelementptr bfloat, ptr addrspace(1) %316, i64 %47
  %318 = getelementptr bfloat, ptr addrspace(1) %316, i64 %48
  %319 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %317)
  %320 = extractvalue { i32, i32, i32, i32 } %319, 0
  %321 = bitcast i32 %320 to <2 x bfloat>
  %322 = extractvalue { i32, i32, i32, i32 } %319, 1
  %323 = bitcast i32 %322 to <2 x bfloat>
  %324 = extractvalue { i32, i32, i32, i32 } %319, 2
  %325 = bitcast i32 %324 to <2 x bfloat>
  %326 = extractvalue { i32, i32, i32, i32 } %319, 3
  %327 = bitcast i32 %326 to <2 x bfloat>
  %328 = extractelement <2 x bfloat> %321, i32 0
  %329 = extractelement <2 x bfloat> %321, i32 1
  %330 = extractelement <2 x bfloat> %323, i32 0
  %331 = extractelement <2 x bfloat> %323, i32 1
  %332 = extractelement <2 x bfloat> %325, i32 0
  %333 = extractelement <2 x bfloat> %325, i32 1
  %334 = extractelement <2 x bfloat> %327, i32 0
  %335 = extractelement <2 x bfloat> %327, i32 1
  %336 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %318)
  %337 = extractvalue { i32, i32, i32, i32 } %336, 0
  %338 = bitcast i32 %337 to <2 x bfloat>
  %339 = extractvalue { i32, i32, i32, i32 } %336, 1
  %340 = bitcast i32 %339 to <2 x bfloat>
  %341 = extractvalue { i32, i32, i32, i32 } %336, 2
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %336, 3
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractelement <2 x bfloat> %338, i32 0
  %346 = extractelement <2 x bfloat> %338, i32 1
  %347 = extractelement <2 x bfloat> %340, i32 0
  %348 = extractelement <2 x bfloat> %340, i32 1
  %349 = extractelement <2 x bfloat> %342, i32 0
  %350 = extractelement <2 x bfloat> %342, i32 1
  %351 = extractelement <2 x bfloat> %344, i32 0
  %352 = extractelement <2 x bfloat> %344, i32 1
  %353 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %328)
  %354 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329)
  %355 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %356 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %357 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %345)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %369 = add i64 %13, 7168
  %370 = getelementptr bfloat, ptr addrspace(1) %4, i64 %369
  %371 = getelementptr bfloat, ptr addrspace(1) %370, i64 %47
  %372 = getelementptr bfloat, ptr addrspace(1) %370, i64 %48
  %373 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %371)
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
  %390 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %372)
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
  %407 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %408 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %386)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %388)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %389)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %422 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %423 = getelementptr bfloat, ptr addrspace(1) %7, i64 %101
  %424 = getelementptr bfloat, ptr addrspace(1) %423, i64 %47
  %425 = getelementptr bfloat, ptr addrspace(1) %423, i64 %48
  %426 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %424)
  %427 = extractvalue { i32, i32, i32, i32 } %426, 0
  %428 = bitcast i32 %427 to <2 x bfloat>
  %429 = extractvalue { i32, i32, i32, i32 } %426, 1
  %430 = bitcast i32 %429 to <2 x bfloat>
  %431 = extractvalue { i32, i32, i32, i32 } %426, 2
  %432 = bitcast i32 %431 to <2 x bfloat>
  %433 = extractvalue { i32, i32, i32, i32 } %426, 3
  %434 = bitcast i32 %433 to <2 x bfloat>
  %435 = extractelement <2 x bfloat> %428, i32 0
  %436 = extractelement <2 x bfloat> %428, i32 1
  %437 = extractelement <2 x bfloat> %430, i32 0
  %438 = extractelement <2 x bfloat> %430, i32 1
  %439 = extractelement <2 x bfloat> %432, i32 0
  %440 = extractelement <2 x bfloat> %432, i32 1
  %441 = extractelement <2 x bfloat> %434, i32 0
  %442 = extractelement <2 x bfloat> %434, i32 1
  %443 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %425)
  %444 = extractvalue { i32, i32, i32, i32 } %443, 0
  %445 = bitcast i32 %444 to <2 x bfloat>
  %446 = extractvalue { i32, i32, i32, i32 } %443, 1
  %447 = bitcast i32 %446 to <2 x bfloat>
  %448 = extractvalue { i32, i32, i32, i32 } %443, 2
  %449 = bitcast i32 %448 to <2 x bfloat>
  %450 = extractvalue { i32, i32, i32, i32 } %443, 3
  %451 = bitcast i32 %450 to <2 x bfloat>
  %452 = extractelement <2 x bfloat> %445, i32 0
  %453 = extractelement <2 x bfloat> %445, i32 1
  %454 = extractelement <2 x bfloat> %447, i32 0
  %455 = extractelement <2 x bfloat> %447, i32 1
  %456 = extractelement <2 x bfloat> %449, i32 0
  %457 = extractelement <2 x bfloat> %449, i32 1
  %458 = extractelement <2 x bfloat> %451, i32 0
  %459 = extractelement <2 x bfloat> %451, i32 1
  %460 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435)
  %461 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436)
  %462 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437)
  %463 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438)
  %464 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439)
  %465 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %466 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %467 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442)
  %468 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452)
  %469 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453)
  %470 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454)
  %471 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455)
  %472 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456)
  %473 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457)
  %474 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458)
  %475 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459)
  %476 = add i64 %13, 8192
  %477 = getelementptr bfloat, ptr addrspace(1) %4, i64 %476
  %478 = getelementptr bfloat, ptr addrspace(1) %477, i64 %47
  %479 = getelementptr bfloat, ptr addrspace(1) %477, i64 %48
  %480 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %478)
  %481 = extractvalue { i32, i32, i32, i32 } %480, 0
  %482 = bitcast i32 %481 to <2 x bfloat>
  %483 = extractvalue { i32, i32, i32, i32 } %480, 1
  %484 = bitcast i32 %483 to <2 x bfloat>
  %485 = extractvalue { i32, i32, i32, i32 } %480, 2
  %486 = bitcast i32 %485 to <2 x bfloat>
  %487 = extractvalue { i32, i32, i32, i32 } %480, 3
  %488 = bitcast i32 %487 to <2 x bfloat>
  %489 = extractelement <2 x bfloat> %482, i32 0
  %490 = extractelement <2 x bfloat> %482, i32 1
  %491 = extractelement <2 x bfloat> %484, i32 0
  %492 = extractelement <2 x bfloat> %484, i32 1
  %493 = extractelement <2 x bfloat> %486, i32 0
  %494 = extractelement <2 x bfloat> %486, i32 1
  %495 = extractelement <2 x bfloat> %488, i32 0
  %496 = extractelement <2 x bfloat> %488, i32 1
  %497 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %479)
  %498 = extractvalue { i32, i32, i32, i32 } %497, 0
  %499 = bitcast i32 %498 to <2 x bfloat>
  %500 = extractvalue { i32, i32, i32, i32 } %497, 1
  %501 = bitcast i32 %500 to <2 x bfloat>
  %502 = extractvalue { i32, i32, i32, i32 } %497, 2
  %503 = bitcast i32 %502 to <2 x bfloat>
  %504 = extractvalue { i32, i32, i32, i32 } %497, 3
  %505 = bitcast i32 %504 to <2 x bfloat>
  %506 = extractelement <2 x bfloat> %499, i32 0
  %507 = extractelement <2 x bfloat> %499, i32 1
  %508 = extractelement <2 x bfloat> %501, i32 0
  %509 = extractelement <2 x bfloat> %501, i32 1
  %510 = extractelement <2 x bfloat> %503, i32 0
  %511 = extractelement <2 x bfloat> %503, i32 1
  %512 = extractelement <2 x bfloat> %505, i32 0
  %513 = extractelement <2 x bfloat> %505, i32 1
  %514 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %489)
  %515 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %490)
  %516 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %491)
  %517 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %492)
  %518 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %493)
  %519 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %494)
  %520 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %495)
  %521 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %496)
  %522 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %523 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %524 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513)
  %530 = getelementptr bfloat, ptr addrspace(1) %6, i64 %101
  %531 = getelementptr bfloat, ptr addrspace(1) %530, i64 %47
  %532 = getelementptr bfloat, ptr addrspace(1) %530, i64 %48
  %533 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %531)
  %534 = extractvalue { i32, i32, i32, i32 } %533, 0
  %535 = bitcast i32 %534 to <2 x bfloat>
  %536 = extractvalue { i32, i32, i32, i32 } %533, 1
  %537 = bitcast i32 %536 to <2 x bfloat>
  %538 = extractvalue { i32, i32, i32, i32 } %533, 2
  %539 = bitcast i32 %538 to <2 x bfloat>
  %540 = extractvalue { i32, i32, i32, i32 } %533, 3
  %541 = bitcast i32 %540 to <2 x bfloat>
  %542 = extractelement <2 x bfloat> %535, i32 0
  %543 = extractelement <2 x bfloat> %535, i32 1
  %544 = extractelement <2 x bfloat> %537, i32 0
  %545 = extractelement <2 x bfloat> %537, i32 1
  %546 = extractelement <2 x bfloat> %539, i32 0
  %547 = extractelement <2 x bfloat> %539, i32 1
  %548 = extractelement <2 x bfloat> %541, i32 0
  %549 = extractelement <2 x bfloat> %541, i32 1
  %550 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %532)
  %551 = extractvalue { i32, i32, i32, i32 } %550, 0
  %552 = bitcast i32 %551 to <2 x bfloat>
  %553 = extractvalue { i32, i32, i32, i32 } %550, 1
  %554 = bitcast i32 %553 to <2 x bfloat>
  %555 = extractvalue { i32, i32, i32, i32 } %550, 2
  %556 = bitcast i32 %555 to <2 x bfloat>
  %557 = extractvalue { i32, i32, i32, i32 } %550, 3
  %558 = bitcast i32 %557 to <2 x bfloat>
  %559 = extractelement <2 x bfloat> %552, i32 0
  %560 = extractelement <2 x bfloat> %552, i32 1
  %561 = extractelement <2 x bfloat> %554, i32 0
  %562 = extractelement <2 x bfloat> %554, i32 1
  %563 = extractelement <2 x bfloat> %556, i32 0
  %564 = extractelement <2 x bfloat> %556, i32 1
  %565 = extractelement <2 x bfloat> %558, i32 0
  %566 = extractelement <2 x bfloat> %558, i32 1
  %567 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %542)
  %568 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %543)
  %569 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %544)
  %570 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %545)
  %571 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %546)
  %572 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %547)
  %573 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %548)
  %574 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %549)
  %575 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %559)
  %576 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %560)
  %577 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %561)
  %578 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %562)
  %579 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %563)
  %580 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %564)
  %581 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %565)
  %582 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %566)
  %583 = fadd float %514, %567
  %584 = fadd float %515, %568
  %585 = fadd float %516, %569
  %586 = fadd float %517, %570
  %587 = fadd float %518, %571
  %588 = fadd float %519, %572
  %589 = fadd float %520, %573
  %590 = fadd float %521, %574
  %591 = fadd float %522, %575
  %592 = fadd float %523, %576
  %593 = fadd float %524, %577
  %594 = fadd float %525, %578
  %595 = fadd float %526, %579
  %596 = fadd float %527, %580
  %597 = fadd float %528, %581
  %598 = fadd float %529, %582
  %599 = fadd float %460, %583
  %600 = fadd float %461, %584
  %601 = fadd float %462, %585
  %602 = fadd float %463, %586
  %603 = fadd float %464, %587
  %604 = fadd float %465, %588
  %605 = fadd float %466, %589
  %606 = fadd float %467, %590
  %607 = fadd float %468, %591
  %608 = fadd float %469, %592
  %609 = fadd float %470, %593
  %610 = fadd float %471, %594
  %611 = fadd float %472, %595
  %612 = fadd float %473, %596
  %613 = fadd float %474, %597
  %614 = fadd float %475, %598
  %615 = fadd float %407, %599
  %616 = fadd float %408, %600
  %617 = fadd float %409, %601
  %618 = fadd float %410, %602
  %619 = fadd float %411, %603
  %620 = fadd float %412, %604
  %621 = fadd float %413, %605
  %622 = fadd float %414, %606
  %623 = fadd float %415, %607
  %624 = fadd float %416, %608
  %625 = fadd float %417, %609
  %626 = fadd float %418, %610
  %627 = fadd float %419, %611
  %628 = fadd float %420, %612
  %629 = fadd float %421, %613
  %630 = fadd float %422, %614
  %631 = fadd float %353, %615
  %632 = fadd float %354, %616
  %633 = fadd float %355, %617
  %634 = fadd float %356, %618
  %635 = fadd float %357, %619
  %636 = fadd float %358, %620
  %637 = fadd float %359, %621
  %638 = fadd float %360, %622
  %639 = fadd float %361, %623
  %640 = fadd float %362, %624
  %641 = fadd float %363, %625
  %642 = fadd float %364, %626
  %643 = fadd float %365, %627
  %644 = fadd float %366, %628
  %645 = fadd float %367, %629
  %646 = fadd float %368, %630
  %647 = fadd float %300, %631
  %648 = fadd float %301, %632
  %649 = fadd float %302, %633
  %650 = fadd float %303, %634
  %651 = fadd float %304, %635
  %652 = fadd float %305, %636
  %653 = fadd float %306, %637
  %654 = fadd float %307, %638
  %655 = fadd float %308, %639
  %656 = fadd float %309, %640
  %657 = fadd float %310, %641
  %658 = fadd float %311, %642
  %659 = fadd float %312, %643
  %660 = fadd float %313, %644
  %661 = fadd float %314, %645
  %662 = fadd float %315, %646
  %663 = fadd float %246, %647
  %664 = fadd float %247, %648
  %665 = fadd float %248, %649
  %666 = fadd float %249, %650
  %667 = fadd float %250, %651
  %668 = fadd float %251, %652
  %669 = fadd float %252, %653
  %670 = fadd float %253, %654
  %671 = fadd float %254, %655
  %672 = fadd float %255, %656
  %673 = fadd float %256, %657
  %674 = fadd float %257, %658
  %675 = fadd float %258, %659
  %676 = fadd float %259, %660
  %677 = fadd float %260, %661
  %678 = fadd float %261, %662
  %679 = fadd float %193, %663
  %680 = fadd float %194, %664
  %681 = fadd float %195, %665
  %682 = fadd float %196, %666
  %683 = fadd float %197, %667
  %684 = fadd float %198, %668
  %685 = fadd float %199, %669
  %686 = fadd float %200, %670
  %687 = fadd float %201, %671
  %688 = fadd float %202, %672
  %689 = fadd float %203, %673
  %690 = fadd float %204, %674
  %691 = fadd float %205, %675
  %692 = fadd float %206, %676
  %693 = fadd float %207, %677
  %694 = fadd float %208, %678
  %695 = fadd float %139, %679
  %696 = fadd float %140, %680
  %697 = fadd float %141, %681
  %698 = fadd float %142, %682
  %699 = fadd float %143, %683
  %700 = fadd float %144, %684
  %701 = fadd float %145, %685
  %702 = fadd float %146, %686
  %703 = fadd float %147, %687
  %704 = fadd float %148, %688
  %705 = fadd float %149, %689
  %706 = fadd float %150, %690
  %707 = fadd float %151, %691
  %708 = fadd float %152, %692
  %709 = fadd float %153, %693
  %710 = fadd float %154, %694
  %711 = fadd float %85, %695
  %712 = fadd float %86, %696
  %713 = fadd float %87, %697
  %714 = fadd float %88, %698
  %715 = fadd float %89, %699
  %716 = fadd float %90, %700
  %717 = fadd float %91, %701
  %718 = fadd float %92, %702
  %719 = fadd float %93, %703
  %720 = fadd float %94, %704
  %721 = fadd float %95, %705
  %722 = fadd float %96, %706
  %723 = fadd float %97, %707
  %724 = fadd float %98, %708
  %725 = fadd float %99, %709
  %726 = fadd float %100, %710
  %727 = fmul float %711, %711
  %728 = fmul float %712, %712
  %729 = fmul float %713, %713
  %730 = fmul float %714, %714
  %731 = fmul float %715, %715
  %732 = fmul float %716, %716
  %733 = fmul float %717, %717
  %734 = fmul float %718, %718
  %735 = fmul float %719, %719
  %736 = fmul float %720, %720
  %737 = fmul float %721, %721
  %738 = fmul float %722, %722
  %739 = fmul float %723, %723
  %740 = fmul float %724, %724
  %741 = fmul float %725, %725
  %742 = fmul float %726, %726
  %743 = fadd float %727, %728
  %744 = fadd float %743, %729
  %745 = fadd float %744, %730
  %746 = fadd float %745, %731
  %747 = fadd float %746, %732
  %748 = fadd float %747, %733
  %749 = fadd float %748, %734
  %750 = fadd float %749, %735
  %751 = fadd float %750, %736
  %752 = fadd float %751, %737
  %753 = fadd float %752, %738
  %754 = fadd float %753, %739
  %755 = fadd float %754, %740
  %756 = fadd float %755, %741
  %757 = fadd float %756, %742
  %758 = bitcast float %757 to i32
  %759 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %758, i32 16, i32 31)
  %760 = bitcast i32 %759 to float
  %761 = fadd float %757, %760
  %762 = bitcast float %761 to i32
  %763 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %762, i32 8, i32 31)
  %764 = bitcast i32 %763 to float
  %765 = fadd float %761, %764
  %766 = bitcast float %765 to i32
  %767 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %766, i32 4, i32 31)
  %768 = bitcast i32 %767 to float
  %769 = fadd float %765, %768
  %770 = bitcast float %769 to i32
  %771 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %770, i32 2, i32 31)
  %772 = bitcast i32 %771 to float
  %773 = fadd float %769, %772
  %774 = bitcast float %773 to i32
  %775 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %774, i32 1, i32 31)
  %776 = bitcast i32 %775 to float
  %777 = fadd float %773, %776
  %778 = urem i32 %17, 32
  %779 = urem i32 %18, 2
  %780 = icmp eq i32 %778, 0
  %781 = and i1 true, %780
  %782 = add i32 0, %779
  %783 = getelementptr float, ptr addrspace(3) @global_smem, i32 %782
  %784 = insertelement <1 x float> undef, float %777, i32 0
  %785 = extractelement <1 x float> %784, i32 0
  %786 = bitcast float %785 to i32
  %787 = insertelement <1 x i32> undef, i32 %786, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %783, <1 x i32> %787, i1 %781)
  call void @llvm.nvvm.barrier0()
  %788 = icmp slt i32 %16, 2
  %789 = getelementptr float, ptr addrspace(3) @global_smem, i32 %16
  %790 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %789, i1 %788)
  %791 = insertelement <1 x i32> undef, i32 %790, i32 0
  %792 = extractelement <1 x i32> %791, i32 0
  %793 = bitcast i32 %792 to float
  %794 = insertelement <1 x float> undef, float %793, i32 0
  %795 = extractelement <1 x float> %794, i32 0
  %796 = bitcast float %795 to i32
  %797 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %796, i32 1, i32 31)
  %798 = bitcast i32 %797 to float
  %799 = fadd float %795, %798
  %800 = urem i32 %17, 2
  %801 = icmp eq i32 %800, 0
  %802 = and i1 %788, %801
  %803 = insertelement <1 x float> undef, float %799, i32 0
  %804 = extractelement <1 x float> %803, i32 0
  %805 = bitcast float %804 to i32
  %806 = insertelement <1 x i32> undef, i32 %805, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %789, <1 x i32> %806, i1 %802)
  call void @llvm.nvvm.barrier0()
  %807 = load float, ptr addrspace(3) @global_smem, align 4
  %808 = fmul float %807, 0x3F50000000000000
  %809 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %810 = bitcast i32 %809 to <1 x float>
  %811 = extractelement <1 x float> %810, i32 0
  %812 = fadd float %808, %811
  %813 = call float @__nv_rsqrtf(float %812)
  %814 = fmul float %711, %813
  %815 = fmul float %712, %813
  %816 = fmul float %713, %813
  %817 = fmul float %714, %813
  %818 = fmul float %715, %813
  %819 = fmul float %716, %813
  %820 = fmul float %717, %813
  %821 = fmul float %718, %813
  %822 = fmul float %719, %813
  %823 = fmul float %720, %813
  %824 = fmul float %721, %813
  %825 = fmul float %722, %813
  %826 = fmul float %723, %813
  %827 = fmul float %724, %813
  %828 = fmul float %725, %813
  %829 = fmul float %726, %813
  %830 = getelementptr bfloat, ptr addrspace(1) %2, i64 %47
  %831 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %832 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %830)
  %833 = extractvalue { i32, i32, i32, i32 } %832, 0
  %834 = bitcast i32 %833 to <2 x bfloat>
  %835 = extractvalue { i32, i32, i32, i32 } %832, 1
  %836 = bitcast i32 %835 to <2 x bfloat>
  %837 = extractvalue { i32, i32, i32, i32 } %832, 2
  %838 = bitcast i32 %837 to <2 x bfloat>
  %839 = extractvalue { i32, i32, i32, i32 } %832, 3
  %840 = bitcast i32 %839 to <2 x bfloat>
  %841 = extractelement <2 x bfloat> %834, i32 0
  %842 = extractelement <2 x bfloat> %834, i32 1
  %843 = extractelement <2 x bfloat> %836, i32 0
  %844 = extractelement <2 x bfloat> %836, i32 1
  %845 = extractelement <2 x bfloat> %838, i32 0
  %846 = extractelement <2 x bfloat> %838, i32 1
  %847 = extractelement <2 x bfloat> %840, i32 0
  %848 = extractelement <2 x bfloat> %840, i32 1
  %849 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %831)
  %850 = extractvalue { i32, i32, i32, i32 } %849, 0
  %851 = bitcast i32 %850 to <2 x bfloat>
  %852 = extractvalue { i32, i32, i32, i32 } %849, 1
  %853 = bitcast i32 %852 to <2 x bfloat>
  %854 = extractvalue { i32, i32, i32, i32 } %849, 2
  %855 = bitcast i32 %854 to <2 x bfloat>
  %856 = extractvalue { i32, i32, i32, i32 } %849, 3
  %857 = bitcast i32 %856 to <2 x bfloat>
  %858 = extractelement <2 x bfloat> %851, i32 0
  %859 = extractelement <2 x bfloat> %851, i32 1
  %860 = extractelement <2 x bfloat> %853, i32 0
  %861 = extractelement <2 x bfloat> %853, i32 1
  %862 = extractelement <2 x bfloat> %855, i32 0
  %863 = extractelement <2 x bfloat> %855, i32 1
  %864 = extractelement <2 x bfloat> %857, i32 0
  %865 = extractelement <2 x bfloat> %857, i32 1
  %866 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %841)
  %867 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %842)
  %868 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %843)
  %869 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %844)
  %870 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %845)
  %871 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %846)
  %872 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %847)
  %873 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %848)
  %874 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %858)
  %875 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %859)
  %876 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %860)
  %877 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %861)
  %878 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %862)
  %879 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %863)
  %880 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %864)
  %881 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %865)
  %882 = fmul float %814, %866
  %883 = fmul float %815, %867
  %884 = fmul float %816, %868
  %885 = fmul float %817, %869
  %886 = fmul float %818, %870
  %887 = fmul float %819, %871
  %888 = fmul float %820, %872
  %889 = fmul float %821, %873
  %890 = fmul float %822, %874
  %891 = fmul float %823, %875
  %892 = fmul float %824, %876
  %893 = fmul float %825, %877
  %894 = fmul float %826, %878
  %895 = fmul float %827, %879
  %896 = fmul float %828, %880
  %897 = fmul float %829, %881
  %898 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %882)
  %899 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %883)
  %900 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %884)
  %901 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %885)
  %902 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %886)
  %903 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %887)
  %904 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %888)
  %905 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %889)
  %906 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %890)
  %907 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %891)
  %908 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %892)
  %909 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %893)
  %910 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %894)
  %911 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %895)
  %912 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %896)
  %913 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %897)
  %914 = getelementptr bfloat, ptr addrspace(1) %9, i64 %101
  %915 = getelementptr bfloat, ptr addrspace(1) %914, i64 %47
  %916 = getelementptr bfloat, ptr addrspace(1) %914, i64 %48
  %917 = insertelement <2 x bfloat> undef, bfloat %898, i32 0
  %918 = insertelement <2 x bfloat> %917, bfloat %899, i32 1
  %919 = bitcast <2 x bfloat> %918 to i32
  %920 = insertelement <2 x bfloat> undef, bfloat %900, i32 0
  %921 = insertelement <2 x bfloat> %920, bfloat %901, i32 1
  %922 = bitcast <2 x bfloat> %921 to i32
  %923 = insertelement <2 x bfloat> undef, bfloat %902, i32 0
  %924 = insertelement <2 x bfloat> %923, bfloat %903, i32 1
  %925 = bitcast <2 x bfloat> %924 to i32
  %926 = insertelement <2 x bfloat> undef, bfloat %904, i32 0
  %927 = insertelement <2 x bfloat> %926, bfloat %905, i32 1
  %928 = bitcast <2 x bfloat> %927 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %919, i32 %922, i32 %925, i32 %928, ptr addrspace(1) %915)
  %929 = insertelement <2 x bfloat> undef, bfloat %906, i32 0
  %930 = insertelement <2 x bfloat> %929, bfloat %907, i32 1
  %931 = bitcast <2 x bfloat> %930 to i32
  %932 = insertelement <2 x bfloat> undef, bfloat %908, i32 0
  %933 = insertelement <2 x bfloat> %932, bfloat %909, i32 1
  %934 = bitcast <2 x bfloat> %933 to i32
  %935 = insertelement <2 x bfloat> undef, bfloat %910, i32 0
  %936 = insertelement <2 x bfloat> %935, bfloat %911, i32 1
  %937 = bitcast <2 x bfloat> %936 to i32
  %938 = insertelement <2 x bfloat> undef, bfloat %912, i32 0
  %939 = insertelement <2 x bfloat> %938, bfloat %913, i32 1
  %940 = bitcast <2 x bfloat> %939 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %931, i32 %934, i32 %937, i32 %940, ptr addrspace(1) %916)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_118_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_118(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %8 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %9 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %10 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %11 = addrspacecast ptr null to ptr addrspace(1)
  %12 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %13 = sext i32 %12 to i64
  %14 = mul i64 %13, 9216
  %15 = add i64 %14, 3072
  %16 = getelementptr bfloat, ptr addrspace(1) %3, i64 %15
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %18 = urem i32 %17, 32
  %19 = udiv i32 %17, 32
  %20 = and i32 %18, 1
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 8
  %23 = xor i32 0, %22
  %24 = and i32 %18, 2
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 16
  %27 = xor i32 %23, %26
  %28 = and i32 %18, 4
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 32
  %31 = xor i32 %27, %30
  %32 = and i32 %18, 8
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 64
  %35 = xor i32 %31, %34
  %36 = and i32 %18, 16
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 0, i32 128
  %39 = xor i32 %35, %38
  %40 = and i32 %19, 1
  %41 = icmp eq i32 %40, 0
  %42 = select i1 %41, i32 0, i32 256
  %43 = xor i32 %39, %42
  %44 = xor i32 %43, 0
  %45 = xor i32 %43, 512
  %46 = add i32 %44, 0
  %47 = add i32 %45, 0
  %48 = sext i32 %46 to i64
  %49 = sext i32 %47 to i64
  %50 = getelementptr bfloat, ptr addrspace(1) %16, i64 %48
  %51 = getelementptr bfloat, ptr addrspace(1) %16, i64 %49
  %52 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %50)
  %53 = extractvalue { i32, i32, i32, i32 } %52, 0
  %54 = bitcast i32 %53 to <2 x bfloat>
  %55 = extractvalue { i32, i32, i32, i32 } %52, 1
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %52, 2
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %52, 3
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractelement <2 x bfloat> %54, i32 0
  %62 = extractelement <2 x bfloat> %54, i32 1
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %51)
  %70 = extractvalue { i32, i32, i32, i32 } %69, 0
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractvalue { i32, i32, i32, i32 } %69, 1
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %69, 2
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %69, 3
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractelement <2 x bfloat> %71, i32 0
  %79 = extractelement <2 x bfloat> %71, i32 1
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %61)
  %87 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %62)
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = mul i64 %13, 1024
  %103 = getelementptr bfloat, ptr addrspace(1) %2, i64 %102
  %104 = getelementptr bfloat, ptr addrspace(1) %103, i64 %48
  %105 = getelementptr bfloat, ptr addrspace(1) %103, i64 %49
  %106 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %104)
  %107 = extractvalue { i32, i32, i32, i32 } %106, 0
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractvalue { i32, i32, i32, i32 } %106, 1
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %106, 2
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %106, 3
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractelement <2 x bfloat> %108, i32 0
  %116 = extractelement <2 x bfloat> %108, i32 1
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %105)
  %124 = extractvalue { i32, i32, i32, i32 } %123, 0
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractvalue { i32, i32, i32, i32 } %123, 1
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %123, 2
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %123, 3
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractelement <2 x bfloat> %125, i32 0
  %133 = extractelement <2 x bfloat> %125, i32 1
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115)
  %141 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116)
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = add i64 %14, 4096
  %157 = getelementptr bfloat, ptr addrspace(1) %3, i64 %156
  %158 = getelementptr bfloat, ptr addrspace(1) %157, i64 %48
  %159 = getelementptr bfloat, ptr addrspace(1) %157, i64 %49
  %160 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %158)
  %161 = extractvalue { i32, i32, i32, i32 } %160, 0
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractvalue { i32, i32, i32, i32 } %160, 1
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractvalue { i32, i32, i32, i32 } %160, 2
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %160, 3
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractelement <2 x bfloat> %162, i32 0
  %170 = extractelement <2 x bfloat> %162, i32 1
  %171 = extractelement <2 x bfloat> %164, i32 0
  %172 = extractelement <2 x bfloat> %164, i32 1
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %159)
  %178 = extractvalue { i32, i32, i32, i32 } %177, 0
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractvalue { i32, i32, i32, i32 } %177, 1
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %177, 2
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %177, 3
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractelement <2 x bfloat> %179, i32 0
  %187 = extractelement <2 x bfloat> %179, i32 1
  %188 = extractelement <2 x bfloat> %181, i32 0
  %189 = extractelement <2 x bfloat> %181, i32 1
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169)
  %195 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170)
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = getelementptr bfloat, ptr addrspace(1) %6, i64 %102
  %211 = getelementptr bfloat, ptr addrspace(1) %210, i64 %48
  %212 = getelementptr bfloat, ptr addrspace(1) %210, i64 %49
  %213 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %211)
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
  %230 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %212)
  %231 = extractvalue { i32, i32, i32, i32 } %230, 0
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %230, 1
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %230, 2
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %230, 3
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractelement <2 x bfloat> %232, i32 0
  %240 = extractelement <2 x bfloat> %232, i32 1
  %241 = extractelement <2 x bfloat> %234, i32 0
  %242 = extractelement <2 x bfloat> %234, i32 1
  %243 = extractelement <2 x bfloat> %236, i32 0
  %244 = extractelement <2 x bfloat> %236, i32 1
  %245 = extractelement <2 x bfloat> %238, i32 0
  %246 = extractelement <2 x bfloat> %238, i32 1
  %247 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222)
  %248 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223)
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = add i64 %14, 5120
  %264 = getelementptr bfloat, ptr addrspace(1) %3, i64 %263
  %265 = getelementptr bfloat, ptr addrspace(1) %264, i64 %48
  %266 = getelementptr bfloat, ptr addrspace(1) %264, i64 %49
  %267 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %265)
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
  %284 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %266)
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractvalue { i32, i32, i32, i32 } %284, 1
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %284, 2
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %284, 3
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractelement <2 x bfloat> %286, i32 0
  %294 = extractelement <2 x bfloat> %286, i32 1
  %295 = extractelement <2 x bfloat> %288, i32 0
  %296 = extractelement <2 x bfloat> %288, i32 1
  %297 = extractelement <2 x bfloat> %290, i32 0
  %298 = extractelement <2 x bfloat> %290, i32 1
  %299 = extractelement <2 x bfloat> %292, i32 0
  %300 = extractelement <2 x bfloat> %292, i32 1
  %301 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276)
  %302 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277)
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = getelementptr bfloat, ptr addrspace(1) %5, i64 %102
  %318 = getelementptr bfloat, ptr addrspace(1) %317, i64 %48
  %319 = getelementptr bfloat, ptr addrspace(1) %317, i64 %49
  %320 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %318)
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
  %337 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %319)
  %338 = extractvalue { i32, i32, i32, i32 } %337, 0
  %339 = bitcast i32 %338 to <2 x bfloat>
  %340 = extractvalue { i32, i32, i32, i32 } %337, 1
  %341 = bitcast i32 %340 to <2 x bfloat>
  %342 = extractvalue { i32, i32, i32, i32 } %337, 2
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32, i32, i32 } %337, 3
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractelement <2 x bfloat> %339, i32 0
  %347 = extractelement <2 x bfloat> %339, i32 1
  %348 = extractelement <2 x bfloat> %341, i32 0
  %349 = extractelement <2 x bfloat> %341, i32 1
  %350 = extractelement <2 x bfloat> %343, i32 0
  %351 = extractelement <2 x bfloat> %343, i32 1
  %352 = extractelement <2 x bfloat> %345, i32 0
  %353 = extractelement <2 x bfloat> %345, i32 1
  %354 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %329)
  %355 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %330)
  %356 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %331)
  %357 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %332)
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %336)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %369 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %370 = add i64 %14, 6144
  %371 = getelementptr bfloat, ptr addrspace(1) %3, i64 %370
  %372 = getelementptr bfloat, ptr addrspace(1) %371, i64 %48
  %373 = getelementptr bfloat, ptr addrspace(1) %371, i64 %49
  %374 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %372)
  %375 = extractvalue { i32, i32, i32, i32 } %374, 0
  %376 = bitcast i32 %375 to <2 x bfloat>
  %377 = extractvalue { i32, i32, i32, i32 } %374, 1
  %378 = bitcast i32 %377 to <2 x bfloat>
  %379 = extractvalue { i32, i32, i32, i32 } %374, 2
  %380 = bitcast i32 %379 to <2 x bfloat>
  %381 = extractvalue { i32, i32, i32, i32 } %374, 3
  %382 = bitcast i32 %381 to <2 x bfloat>
  %383 = extractelement <2 x bfloat> %376, i32 0
  %384 = extractelement <2 x bfloat> %376, i32 1
  %385 = extractelement <2 x bfloat> %378, i32 0
  %386 = extractelement <2 x bfloat> %378, i32 1
  %387 = extractelement <2 x bfloat> %380, i32 0
  %388 = extractelement <2 x bfloat> %380, i32 1
  %389 = extractelement <2 x bfloat> %382, i32 0
  %390 = extractelement <2 x bfloat> %382, i32 1
  %391 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %373)
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i32 0
  %401 = extractelement <2 x bfloat> %393, i32 1
  %402 = extractelement <2 x bfloat> %395, i32 0
  %403 = extractelement <2 x bfloat> %395, i32 1
  %404 = extractelement <2 x bfloat> %397, i32 0
  %405 = extractelement <2 x bfloat> %397, i32 1
  %406 = extractelement <2 x bfloat> %399, i32 0
  %407 = extractelement <2 x bfloat> %399, i32 1
  %408 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %409 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %410 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %411 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %386)
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %388)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %389)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %390)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %422 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %423 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407)
  %424 = getelementptr bfloat, ptr addrspace(1) %9, i64 %102
  %425 = getelementptr bfloat, ptr addrspace(1) %424, i64 %48
  %426 = getelementptr bfloat, ptr addrspace(1) %424, i64 %49
  %427 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %425)
  %428 = extractvalue { i32, i32, i32, i32 } %427, 0
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractvalue { i32, i32, i32, i32 } %427, 1
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractvalue { i32, i32, i32, i32 } %427, 2
  %433 = bitcast i32 %432 to <2 x bfloat>
  %434 = extractvalue { i32, i32, i32, i32 } %427, 3
  %435 = bitcast i32 %434 to <2 x bfloat>
  %436 = extractelement <2 x bfloat> %429, i32 0
  %437 = extractelement <2 x bfloat> %429, i32 1
  %438 = extractelement <2 x bfloat> %431, i32 0
  %439 = extractelement <2 x bfloat> %431, i32 1
  %440 = extractelement <2 x bfloat> %433, i32 0
  %441 = extractelement <2 x bfloat> %433, i32 1
  %442 = extractelement <2 x bfloat> %435, i32 0
  %443 = extractelement <2 x bfloat> %435, i32 1
  %444 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %426)
  %445 = extractvalue { i32, i32, i32, i32 } %444, 0
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %444, 1
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractvalue { i32, i32, i32, i32 } %444, 2
  %450 = bitcast i32 %449 to <2 x bfloat>
  %451 = extractvalue { i32, i32, i32, i32 } %444, 3
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractelement <2 x bfloat> %446, i32 0
  %454 = extractelement <2 x bfloat> %446, i32 1
  %455 = extractelement <2 x bfloat> %448, i32 0
  %456 = extractelement <2 x bfloat> %448, i32 1
  %457 = extractelement <2 x bfloat> %450, i32 0
  %458 = extractelement <2 x bfloat> %450, i32 1
  %459 = extractelement <2 x bfloat> %452, i32 0
  %460 = extractelement <2 x bfloat> %452, i32 1
  %461 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436)
  %462 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437)
  %463 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438)
  %464 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439)
  %465 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %466 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %467 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442)
  %468 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443)
  %469 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453)
  %470 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454)
  %471 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455)
  %472 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456)
  %473 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457)
  %474 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458)
  %475 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459)
  %476 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460)
  %477 = add i64 %14, 7168
  %478 = getelementptr bfloat, ptr addrspace(1) %3, i64 %477
  %479 = getelementptr bfloat, ptr addrspace(1) %478, i64 %48
  %480 = getelementptr bfloat, ptr addrspace(1) %478, i64 %49
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
  %531 = getelementptr bfloat, ptr addrspace(1) %8, i64 %102
  %532 = getelementptr bfloat, ptr addrspace(1) %531, i64 %48
  %533 = getelementptr bfloat, ptr addrspace(1) %531, i64 %49
  %534 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %532)
  %535 = extractvalue { i32, i32, i32, i32 } %534, 0
  %536 = bitcast i32 %535 to <2 x bfloat>
  %537 = extractvalue { i32, i32, i32, i32 } %534, 1
  %538 = bitcast i32 %537 to <2 x bfloat>
  %539 = extractvalue { i32, i32, i32, i32 } %534, 2
  %540 = bitcast i32 %539 to <2 x bfloat>
  %541 = extractvalue { i32, i32, i32, i32 } %534, 3
  %542 = bitcast i32 %541 to <2 x bfloat>
  %543 = extractelement <2 x bfloat> %536, i32 0
  %544 = extractelement <2 x bfloat> %536, i32 1
  %545 = extractelement <2 x bfloat> %538, i32 0
  %546 = extractelement <2 x bfloat> %538, i32 1
  %547 = extractelement <2 x bfloat> %540, i32 0
  %548 = extractelement <2 x bfloat> %540, i32 1
  %549 = extractelement <2 x bfloat> %542, i32 0
  %550 = extractelement <2 x bfloat> %542, i32 1
  %551 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %533)
  %552 = extractvalue { i32, i32, i32, i32 } %551, 0
  %553 = bitcast i32 %552 to <2 x bfloat>
  %554 = extractvalue { i32, i32, i32, i32 } %551, 1
  %555 = bitcast i32 %554 to <2 x bfloat>
  %556 = extractvalue { i32, i32, i32, i32 } %551, 2
  %557 = bitcast i32 %556 to <2 x bfloat>
  %558 = extractvalue { i32, i32, i32, i32 } %551, 3
  %559 = bitcast i32 %558 to <2 x bfloat>
  %560 = extractelement <2 x bfloat> %553, i32 0
  %561 = extractelement <2 x bfloat> %553, i32 1
  %562 = extractelement <2 x bfloat> %555, i32 0
  %563 = extractelement <2 x bfloat> %555, i32 1
  %564 = extractelement <2 x bfloat> %557, i32 0
  %565 = extractelement <2 x bfloat> %557, i32 1
  %566 = extractelement <2 x bfloat> %559, i32 0
  %567 = extractelement <2 x bfloat> %559, i32 1
  %568 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %543)
  %569 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %544)
  %570 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %545)
  %571 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %546)
  %572 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %547)
  %573 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %548)
  %574 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %549)
  %575 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %550)
  %576 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %560)
  %577 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %561)
  %578 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %562)
  %579 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %563)
  %580 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %564)
  %581 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %565)
  %582 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %566)
  %583 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %567)
  %584 = add i64 %14, 8192
  %585 = getelementptr bfloat, ptr addrspace(1) %3, i64 %584
  %586 = getelementptr bfloat, ptr addrspace(1) %585, i64 %48
  %587 = getelementptr bfloat, ptr addrspace(1) %585, i64 %49
  %588 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %586)
  %589 = extractvalue { i32, i32, i32, i32 } %588, 0
  %590 = bitcast i32 %589 to <2 x bfloat>
  %591 = extractvalue { i32, i32, i32, i32 } %588, 1
  %592 = bitcast i32 %591 to <2 x bfloat>
  %593 = extractvalue { i32, i32, i32, i32 } %588, 2
  %594 = bitcast i32 %593 to <2 x bfloat>
  %595 = extractvalue { i32, i32, i32, i32 } %588, 3
  %596 = bitcast i32 %595 to <2 x bfloat>
  %597 = extractelement <2 x bfloat> %590, i32 0
  %598 = extractelement <2 x bfloat> %590, i32 1
  %599 = extractelement <2 x bfloat> %592, i32 0
  %600 = extractelement <2 x bfloat> %592, i32 1
  %601 = extractelement <2 x bfloat> %594, i32 0
  %602 = extractelement <2 x bfloat> %594, i32 1
  %603 = extractelement <2 x bfloat> %596, i32 0
  %604 = extractelement <2 x bfloat> %596, i32 1
  %605 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %587)
  %606 = extractvalue { i32, i32, i32, i32 } %605, 0
  %607 = bitcast i32 %606 to <2 x bfloat>
  %608 = extractvalue { i32, i32, i32, i32 } %605, 1
  %609 = bitcast i32 %608 to <2 x bfloat>
  %610 = extractvalue { i32, i32, i32, i32 } %605, 2
  %611 = bitcast i32 %610 to <2 x bfloat>
  %612 = extractvalue { i32, i32, i32, i32 } %605, 3
  %613 = bitcast i32 %612 to <2 x bfloat>
  %614 = extractelement <2 x bfloat> %607, i32 0
  %615 = extractelement <2 x bfloat> %607, i32 1
  %616 = extractelement <2 x bfloat> %609, i32 0
  %617 = extractelement <2 x bfloat> %609, i32 1
  %618 = extractelement <2 x bfloat> %611, i32 0
  %619 = extractelement <2 x bfloat> %611, i32 1
  %620 = extractelement <2 x bfloat> %613, i32 0
  %621 = extractelement <2 x bfloat> %613, i32 1
  %622 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %597)
  %623 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %598)
  %624 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %599)
  %625 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %600)
  %626 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %601)
  %627 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %602)
  %628 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %603)
  %629 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %604)
  %630 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %614)
  %631 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %615)
  %632 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %616)
  %633 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %617)
  %634 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %618)
  %635 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %619)
  %636 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %620)
  %637 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %621)
  %638 = getelementptr bfloat, ptr addrspace(1) %7, i64 %102
  %639 = getelementptr bfloat, ptr addrspace(1) %638, i64 %48
  %640 = getelementptr bfloat, ptr addrspace(1) %638, i64 %49
  %641 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %639)
  %642 = extractvalue { i32, i32, i32, i32 } %641, 0
  %643 = bitcast i32 %642 to <2 x bfloat>
  %644 = extractvalue { i32, i32, i32, i32 } %641, 1
  %645 = bitcast i32 %644 to <2 x bfloat>
  %646 = extractvalue { i32, i32, i32, i32 } %641, 2
  %647 = bitcast i32 %646 to <2 x bfloat>
  %648 = extractvalue { i32, i32, i32, i32 } %641, 3
  %649 = bitcast i32 %648 to <2 x bfloat>
  %650 = extractelement <2 x bfloat> %643, i32 0
  %651 = extractelement <2 x bfloat> %643, i32 1
  %652 = extractelement <2 x bfloat> %645, i32 0
  %653 = extractelement <2 x bfloat> %645, i32 1
  %654 = extractelement <2 x bfloat> %647, i32 0
  %655 = extractelement <2 x bfloat> %647, i32 1
  %656 = extractelement <2 x bfloat> %649, i32 0
  %657 = extractelement <2 x bfloat> %649, i32 1
  %658 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %640)
  %659 = extractvalue { i32, i32, i32, i32 } %658, 0
  %660 = bitcast i32 %659 to <2 x bfloat>
  %661 = extractvalue { i32, i32, i32, i32 } %658, 1
  %662 = bitcast i32 %661 to <2 x bfloat>
  %663 = extractvalue { i32, i32, i32, i32 } %658, 2
  %664 = bitcast i32 %663 to <2 x bfloat>
  %665 = extractvalue { i32, i32, i32, i32 } %658, 3
  %666 = bitcast i32 %665 to <2 x bfloat>
  %667 = extractelement <2 x bfloat> %660, i32 0
  %668 = extractelement <2 x bfloat> %660, i32 1
  %669 = extractelement <2 x bfloat> %662, i32 0
  %670 = extractelement <2 x bfloat> %662, i32 1
  %671 = extractelement <2 x bfloat> %664, i32 0
  %672 = extractelement <2 x bfloat> %664, i32 1
  %673 = extractelement <2 x bfloat> %666, i32 0
  %674 = extractelement <2 x bfloat> %666, i32 1
  %675 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %650)
  %676 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %651)
  %677 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %652)
  %678 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653)
  %679 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654)
  %680 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655)
  %681 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656)
  %682 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %657)
  %683 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %667)
  %684 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %668)
  %685 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %669)
  %686 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670)
  %687 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671)
  %688 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672)
  %689 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673)
  %690 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %674)
  %691 = fadd float %622, %675
  %692 = fadd float %623, %676
  %693 = fadd float %624, %677
  %694 = fadd float %625, %678
  %695 = fadd float %626, %679
  %696 = fadd float %627, %680
  %697 = fadd float %628, %681
  %698 = fadd float %629, %682
  %699 = fadd float %630, %683
  %700 = fadd float %631, %684
  %701 = fadd float %632, %685
  %702 = fadd float %633, %686
  %703 = fadd float %634, %687
  %704 = fadd float %635, %688
  %705 = fadd float %636, %689
  %706 = fadd float %637, %690
  %707 = fadd float %568, %691
  %708 = fadd float %569, %692
  %709 = fadd float %570, %693
  %710 = fadd float %571, %694
  %711 = fadd float %572, %695
  %712 = fadd float %573, %696
  %713 = fadd float %574, %697
  %714 = fadd float %575, %698
  %715 = fadd float %576, %699
  %716 = fadd float %577, %700
  %717 = fadd float %578, %701
  %718 = fadd float %579, %702
  %719 = fadd float %580, %703
  %720 = fadd float %581, %704
  %721 = fadd float %582, %705
  %722 = fadd float %583, %706
  %723 = fadd float %515, %707
  %724 = fadd float %516, %708
  %725 = fadd float %517, %709
  %726 = fadd float %518, %710
  %727 = fadd float %519, %711
  %728 = fadd float %520, %712
  %729 = fadd float %521, %713
  %730 = fadd float %522, %714
  %731 = fadd float %523, %715
  %732 = fadd float %524, %716
  %733 = fadd float %525, %717
  %734 = fadd float %526, %718
  %735 = fadd float %527, %719
  %736 = fadd float %528, %720
  %737 = fadd float %529, %721
  %738 = fadd float %530, %722
  %739 = fadd float %461, %723
  %740 = fadd float %462, %724
  %741 = fadd float %463, %725
  %742 = fadd float %464, %726
  %743 = fadd float %465, %727
  %744 = fadd float %466, %728
  %745 = fadd float %467, %729
  %746 = fadd float %468, %730
  %747 = fadd float %469, %731
  %748 = fadd float %470, %732
  %749 = fadd float %471, %733
  %750 = fadd float %472, %734
  %751 = fadd float %473, %735
  %752 = fadd float %474, %736
  %753 = fadd float %475, %737
  %754 = fadd float %476, %738
  %755 = fadd float %408, %739
  %756 = fadd float %409, %740
  %757 = fadd float %410, %741
  %758 = fadd float %411, %742
  %759 = fadd float %412, %743
  %760 = fadd float %413, %744
  %761 = fadd float %414, %745
  %762 = fadd float %415, %746
  %763 = fadd float %416, %747
  %764 = fadd float %417, %748
  %765 = fadd float %418, %749
  %766 = fadd float %419, %750
  %767 = fadd float %420, %751
  %768 = fadd float %421, %752
  %769 = fadd float %422, %753
  %770 = fadd float %423, %754
  %771 = fadd float %354, %755
  %772 = fadd float %355, %756
  %773 = fadd float %356, %757
  %774 = fadd float %357, %758
  %775 = fadd float %358, %759
  %776 = fadd float %359, %760
  %777 = fadd float %360, %761
  %778 = fadd float %361, %762
  %779 = fadd float %362, %763
  %780 = fadd float %363, %764
  %781 = fadd float %364, %765
  %782 = fadd float %365, %766
  %783 = fadd float %366, %767
  %784 = fadd float %367, %768
  %785 = fadd float %368, %769
  %786 = fadd float %369, %770
  %787 = fadd float %301, %771
  %788 = fadd float %302, %772
  %789 = fadd float %303, %773
  %790 = fadd float %304, %774
  %791 = fadd float %305, %775
  %792 = fadd float %306, %776
  %793 = fadd float %307, %777
  %794 = fadd float %308, %778
  %795 = fadd float %309, %779
  %796 = fadd float %310, %780
  %797 = fadd float %311, %781
  %798 = fadd float %312, %782
  %799 = fadd float %313, %783
  %800 = fadd float %314, %784
  %801 = fadd float %315, %785
  %802 = fadd float %316, %786
  %803 = fadd float %247, %787
  %804 = fadd float %248, %788
  %805 = fadd float %249, %789
  %806 = fadd float %250, %790
  %807 = fadd float %251, %791
  %808 = fadd float %252, %792
  %809 = fadd float %253, %793
  %810 = fadd float %254, %794
  %811 = fadd float %255, %795
  %812 = fadd float %256, %796
  %813 = fadd float %257, %797
  %814 = fadd float %258, %798
  %815 = fadd float %259, %799
  %816 = fadd float %260, %800
  %817 = fadd float %261, %801
  %818 = fadd float %262, %802
  %819 = fadd float %194, %803
  %820 = fadd float %195, %804
  %821 = fadd float %196, %805
  %822 = fadd float %197, %806
  %823 = fadd float %198, %807
  %824 = fadd float %199, %808
  %825 = fadd float %200, %809
  %826 = fadd float %201, %810
  %827 = fadd float %202, %811
  %828 = fadd float %203, %812
  %829 = fadd float %204, %813
  %830 = fadd float %205, %814
  %831 = fadd float %206, %815
  %832 = fadd float %207, %816
  %833 = fadd float %208, %817
  %834 = fadd float %209, %818
  %835 = fadd float %140, %819
  %836 = fadd float %141, %820
  %837 = fadd float %142, %821
  %838 = fadd float %143, %822
  %839 = fadd float %144, %823
  %840 = fadd float %145, %824
  %841 = fadd float %146, %825
  %842 = fadd float %147, %826
  %843 = fadd float %148, %827
  %844 = fadd float %149, %828
  %845 = fadd float %150, %829
  %846 = fadd float %151, %830
  %847 = fadd float %152, %831
  %848 = fadd float %153, %832
  %849 = fadd float %154, %833
  %850 = fadd float %155, %834
  %851 = fadd float %86, %835
  %852 = fadd float %87, %836
  %853 = fadd float %88, %837
  %854 = fadd float %89, %838
  %855 = fadd float %90, %839
  %856 = fadd float %91, %840
  %857 = fadd float %92, %841
  %858 = fadd float %93, %842
  %859 = fadd float %94, %843
  %860 = fadd float %95, %844
  %861 = fadd float %96, %845
  %862 = fadd float %97, %846
  %863 = fadd float %98, %847
  %864 = fadd float %99, %848
  %865 = fadd float %100, %849
  %866 = fadd float %101, %850
  %867 = fmul float %851, %851
  %868 = fmul float %852, %852
  %869 = fmul float %853, %853
  %870 = fmul float %854, %854
  %871 = fmul float %855, %855
  %872 = fmul float %856, %856
  %873 = fmul float %857, %857
  %874 = fmul float %858, %858
  %875 = fmul float %859, %859
  %876 = fmul float %860, %860
  %877 = fmul float %861, %861
  %878 = fmul float %862, %862
  %879 = fmul float %863, %863
  %880 = fmul float %864, %864
  %881 = fmul float %865, %865
  %882 = fmul float %866, %866
  %883 = fadd float %867, %868
  %884 = fadd float %883, %869
  %885 = fadd float %884, %870
  %886 = fadd float %885, %871
  %887 = fadd float %886, %872
  %888 = fadd float %887, %873
  %889 = fadd float %888, %874
  %890 = fadd float %889, %875
  %891 = fadd float %890, %876
  %892 = fadd float %891, %877
  %893 = fadd float %892, %878
  %894 = fadd float %893, %879
  %895 = fadd float %894, %880
  %896 = fadd float %895, %881
  %897 = fadd float %896, %882
  %898 = bitcast float %897 to i32
  %899 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %898, i32 16, i32 31)
  %900 = bitcast i32 %899 to float
  %901 = fadd float %897, %900
  %902 = bitcast float %901 to i32
  %903 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %902, i32 8, i32 31)
  %904 = bitcast i32 %903 to float
  %905 = fadd float %901, %904
  %906 = bitcast float %905 to i32
  %907 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %906, i32 4, i32 31)
  %908 = bitcast i32 %907 to float
  %909 = fadd float %905, %908
  %910 = bitcast float %909 to i32
  %911 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %910, i32 2, i32 31)
  %912 = bitcast i32 %911 to float
  %913 = fadd float %909, %912
  %914 = bitcast float %913 to i32
  %915 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %914, i32 1, i32 31)
  %916 = bitcast i32 %915 to float
  %917 = fadd float %913, %916
  %918 = urem i32 %18, 32
  %919 = urem i32 %19, 2
  %920 = icmp eq i32 %918, 0
  %921 = and i1 true, %920
  %922 = add i32 0, %919
  %923 = getelementptr float, ptr addrspace(3) @global_smem, i32 %922
  %924 = insertelement <1 x float> undef, float %917, i32 0
  %925 = extractelement <1 x float> %924, i32 0
  %926 = bitcast float %925 to i32
  %927 = insertelement <1 x i32> undef, i32 %926, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %923, <1 x i32> %927, i1 %921)
  call void @llvm.nvvm.barrier0()
  %928 = icmp slt i32 %17, 2
  %929 = getelementptr float, ptr addrspace(3) @global_smem, i32 %17
  %930 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %929, i1 %928)
  %931 = insertelement <1 x i32> undef, i32 %930, i32 0
  %932 = extractelement <1 x i32> %931, i32 0
  %933 = bitcast i32 %932 to float
  %934 = insertelement <1 x float> undef, float %933, i32 0
  %935 = extractelement <1 x float> %934, i32 0
  %936 = bitcast float %935 to i32
  %937 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %936, i32 1, i32 31)
  %938 = bitcast i32 %937 to float
  %939 = fadd float %935, %938
  %940 = urem i32 %18, 2
  %941 = icmp eq i32 %940, 0
  %942 = and i1 %928, %941
  %943 = insertelement <1 x float> undef, float %939, i32 0
  %944 = extractelement <1 x float> %943, i32 0
  %945 = bitcast float %944 to i32
  %946 = insertelement <1 x i32> undef, i32 %945, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %929, <1 x i32> %946, i1 %942)
  call void @llvm.nvvm.barrier0()
  %947 = load float, ptr addrspace(3) @global_smem, align 4
  %948 = fmul float %947, 0x3F50000000000000
  %949 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %950 = bitcast i32 %949 to <1 x float>
  %951 = extractelement <1 x float> %950, i32 0
  %952 = fadd float %948, %951
  %953 = call float @__nv_rsqrtf(float %952)
  %954 = fmul float %851, %953
  %955 = fmul float %852, %953
  %956 = fmul float %853, %953
  %957 = fmul float %854, %953
  %958 = fmul float %855, %953
  %959 = fmul float %856, %953
  %960 = fmul float %857, %953
  %961 = fmul float %858, %953
  %962 = fmul float %859, %953
  %963 = fmul float %860, %953
  %964 = fmul float %861, %953
  %965 = fmul float %862, %953
  %966 = fmul float %863, %953
  %967 = fmul float %864, %953
  %968 = fmul float %865, %953
  %969 = fmul float %866, %953
  %970 = getelementptr bfloat, ptr addrspace(1) %4, i64 %48
  %971 = getelementptr bfloat, ptr addrspace(1) %4, i64 %49
  %972 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %970)
  %973 = extractvalue { i32, i32, i32, i32 } %972, 0
  %974 = bitcast i32 %973 to <2 x bfloat>
  %975 = extractvalue { i32, i32, i32, i32 } %972, 1
  %976 = bitcast i32 %975 to <2 x bfloat>
  %977 = extractvalue { i32, i32, i32, i32 } %972, 2
  %978 = bitcast i32 %977 to <2 x bfloat>
  %979 = extractvalue { i32, i32, i32, i32 } %972, 3
  %980 = bitcast i32 %979 to <2 x bfloat>
  %981 = extractelement <2 x bfloat> %974, i32 0
  %982 = extractelement <2 x bfloat> %974, i32 1
  %983 = extractelement <2 x bfloat> %976, i32 0
  %984 = extractelement <2 x bfloat> %976, i32 1
  %985 = extractelement <2 x bfloat> %978, i32 0
  %986 = extractelement <2 x bfloat> %978, i32 1
  %987 = extractelement <2 x bfloat> %980, i32 0
  %988 = extractelement <2 x bfloat> %980, i32 1
  %989 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %971)
  %990 = extractvalue { i32, i32, i32, i32 } %989, 0
  %991 = bitcast i32 %990 to <2 x bfloat>
  %992 = extractvalue { i32, i32, i32, i32 } %989, 1
  %993 = bitcast i32 %992 to <2 x bfloat>
  %994 = extractvalue { i32, i32, i32, i32 } %989, 2
  %995 = bitcast i32 %994 to <2 x bfloat>
  %996 = extractvalue { i32, i32, i32, i32 } %989, 3
  %997 = bitcast i32 %996 to <2 x bfloat>
  %998 = extractelement <2 x bfloat> %991, i32 0
  %999 = extractelement <2 x bfloat> %991, i32 1
  %1000 = extractelement <2 x bfloat> %993, i32 0
  %1001 = extractelement <2 x bfloat> %993, i32 1
  %1002 = extractelement <2 x bfloat> %995, i32 0
  %1003 = extractelement <2 x bfloat> %995, i32 1
  %1004 = extractelement <2 x bfloat> %997, i32 0
  %1005 = extractelement <2 x bfloat> %997, i32 1
  %1006 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %981)
  %1007 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %982)
  %1008 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %983)
  %1009 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %984)
  %1010 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %985)
  %1011 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %986)
  %1012 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %987)
  %1013 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %988)
  %1014 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %998)
  %1015 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %999)
  %1016 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1000)
  %1017 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1001)
  %1018 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1002)
  %1019 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1003)
  %1020 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1004)
  %1021 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1005)
  %1022 = fmul float %954, %1006
  %1023 = fmul float %955, %1007
  %1024 = fmul float %956, %1008
  %1025 = fmul float %957, %1009
  %1026 = fmul float %958, %1010
  %1027 = fmul float %959, %1011
  %1028 = fmul float %960, %1012
  %1029 = fmul float %961, %1013
  %1030 = fmul float %962, %1014
  %1031 = fmul float %963, %1015
  %1032 = fmul float %964, %1016
  %1033 = fmul float %965, %1017
  %1034 = fmul float %966, %1018
  %1035 = fmul float %967, %1019
  %1036 = fmul float %968, %1020
  %1037 = fmul float %969, %1021
  %1038 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1022)
  %1039 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1023)
  %1040 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1024)
  %1041 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1025)
  %1042 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1026)
  %1043 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1027)
  %1044 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1028)
  %1045 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1029)
  %1046 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1030)
  %1047 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1031)
  %1048 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1032)
  %1049 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1033)
  %1050 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1034)
  %1051 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1035)
  %1052 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1036)
  %1053 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1037)
  %1054 = getelementptr bfloat, ptr addrspace(1) %10, i64 %102
  %1055 = getelementptr bfloat, ptr addrspace(1) %1054, i64 %48
  %1056 = getelementptr bfloat, ptr addrspace(1) %1054, i64 %49
  %1057 = insertelement <2 x bfloat> undef, bfloat %1038, i32 0
  %1058 = insertelement <2 x bfloat> %1057, bfloat %1039, i32 1
  %1059 = bitcast <2 x bfloat> %1058 to i32
  %1060 = insertelement <2 x bfloat> undef, bfloat %1040, i32 0
  %1061 = insertelement <2 x bfloat> %1060, bfloat %1041, i32 1
  %1062 = bitcast <2 x bfloat> %1061 to i32
  %1063 = insertelement <2 x bfloat> undef, bfloat %1042, i32 0
  %1064 = insertelement <2 x bfloat> %1063, bfloat %1043, i32 1
  %1065 = bitcast <2 x bfloat> %1064 to i32
  %1066 = insertelement <2 x bfloat> undef, bfloat %1044, i32 0
  %1067 = insertelement <2 x bfloat> %1066, bfloat %1045, i32 1
  %1068 = bitcast <2 x bfloat> %1067 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1059, i32 %1062, i32 %1065, i32 %1068, ptr addrspace(1) %1055)
  %1069 = insertelement <2 x bfloat> undef, bfloat %1046, i32 0
  %1070 = insertelement <2 x bfloat> %1069, bfloat %1047, i32 1
  %1071 = bitcast <2 x bfloat> %1070 to i32
  %1072 = insertelement <2 x bfloat> undef, bfloat %1048, i32 0
  %1073 = insertelement <2 x bfloat> %1072, bfloat %1049, i32 1
  %1074 = bitcast <2 x bfloat> %1073 to i32
  %1075 = insertelement <2 x bfloat> undef, bfloat %1050, i32 0
  %1076 = insertelement <2 x bfloat> %1075, bfloat %1051, i32 1
  %1077 = bitcast <2 x bfloat> %1076 to i32
  %1078 = insertelement <2 x bfloat> undef, bfloat %1052, i32 0
  %1079 = insertelement <2 x bfloat> %1078, bfloat %1053, i32 1
  %1080 = bitcast <2 x bfloat> %1079 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1071, i32 %1074, i32 %1077, i32 %1080, ptr addrspace(1) %1056)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @loop_add_fusion(ptr noalias align 128 dereferenceable(1179648) %0, ptr noalias align 128 dereferenceable(131072) %1, ptr noalias align 128 dereferenceable(131072) %2, ptr noalias align 128 dereferenceable(131072) %3, ptr noalias align 128 dereferenceable(131072) %4, ptr noalias align 128 dereferenceable(131072) %5, ptr noalias align 128 dereferenceable(131072) %6, ptr noalias align 128 dereferenceable(131072) %7, ptr noalias align 128 dereferenceable(262144) %8) #0 {
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %12 = udiv i32 %11, 8
  %13 = urem i32 %11, 8
  %14 = mul i32 %13, 128
  %15 = add i32 %14, %10
  %16 = mul i32 %11, 128
  %17 = add i32 %16, %10
  %18 = getelementptr inbounds bfloat, ptr %5, i32 %17
  %19 = load bfloat, ptr %18, align 2, !invariant.load !3
  %20 = getelementptr inbounds bfloat, ptr %6, i32 %17
  %21 = load bfloat, ptr %20, align 2, !invariant.load !3
  %22 = add i32 %15, 8192
  %23 = call float @fused_add_convert_476_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 %22)
  %24 = fpext bfloat %19 to float
  %25 = fpext bfloat %21 to float
  %26 = fadd float %23, %24
  %27 = getelementptr inbounds bfloat, ptr %7, i32 %17
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = add i32 %15, 7168
  %30 = call float @fused_add_convert_476_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 %29)
  %31 = fadd float %25, %26
  %32 = fpext bfloat %28 to float
  %33 = fadd float %30, %31
  %34 = getelementptr inbounds bfloat, ptr %3, i32 %17
  %35 = load bfloat, ptr %34, align 2, !invariant.load !3
  %36 = add i32 %15, 6144
  %37 = call float @fused_add_convert_476_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 %36)
  %38 = fadd float %32, %33
  %39 = fpext bfloat %35 to float
  %40 = fadd float %37, %38
  %41 = getelementptr inbounds bfloat, ptr %4, i32 %17
  %42 = load bfloat, ptr %41, align 2, !invariant.load !3
  %43 = add i32 %15, 5120
  %44 = call float @fused_add_convert_476_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 %43)
  %45 = fadd float %39, %40
  %46 = fpext bfloat %42 to float
  %47 = fadd float %44, %45
  %48 = getelementptr inbounds bfloat, ptr %2, i32 %17
  %49 = load bfloat, ptr %48, align 2, !invariant.load !3
  %50 = add i32 %15, 4096
  %51 = call float @fused_add_convert_476_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 %50)
  %52 = fadd float %46, %47
  %53 = fpext bfloat %49 to float
  %54 = fadd float %51, %52
  %55 = getelementptr inbounds bfloat, ptr %1, i32 %17
  %56 = load bfloat, ptr %55, align 2, !invariant.load !3
  %57 = add i32 %15, 3072
  %58 = call float @fused_add_convert_476_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 %57)
  %59 = fadd float %53, %54
  %60 = fpext bfloat %56 to float
  %61 = fadd float %58, %59
  %62 = add i32 %15, 2048
  %63 = call float @fused_add_convert_476_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 %62)
  %64 = fadd float %60, %61
  %65 = fadd float %63, %64
  %66 = getelementptr inbounds float, ptr %8, i32 %17
  store float %65, ptr %66, align 4
  ret void
}

define internal float @fused_add_convert_476_23(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, i32 %8, i32 %9) {
  %11 = mul i32 %8, 9216
  %12 = add i32 %11, %9
  %13 = getelementptr inbounds bfloat, ptr %0, i32 %12
  %14 = load bfloat, ptr %13, align 2, !invariant.load !3
  %15 = fpext bfloat %14 to float
  ret float %15
}

declare ptx_kernel void @fusion_117_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_117(ptr noalias align 128 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 1024
  %9 = getelementptr float, ptr addrspace(1) %1, i64 %8
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = urem i32 %10, 32
  %12 = udiv i32 %10, 32
  %13 = and i32 %11, 1
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i32 0, i32 8
  %16 = xor i32 0, %15
  %17 = and i32 %11, 2
  %18 = icmp eq i32 %17, 0
  %19 = select i1 %18, i32 0, i32 16
  %20 = xor i32 %16, %19
  %21 = and i32 %11, 4
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 0, i32 32
  %24 = xor i32 %20, %23
  %25 = and i32 %11, 8
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 0, i32 64
  %28 = xor i32 %24, %27
  %29 = and i32 %11, 16
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 0, i32 128
  %32 = xor i32 %28, %31
  %33 = and i32 %12, 1
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 0, i32 256
  %36 = xor i32 %32, %35
  %37 = xor i32 %36, 0
  %38 = xor i32 %36, 4
  %39 = xor i32 %36, 512
  %40 = xor i32 %36, 516
  %41 = add i32 %37, 0
  %42 = add i32 %38, 0
  %43 = add i32 %39, 0
  %44 = add i32 %40, 0
  %45 = sext i32 %41 to i64
  %46 = sext i32 %42 to i64
  %47 = sext i32 %43 to i64
  %48 = sext i32 %44 to i64
  %49 = getelementptr float, ptr addrspace(1) %9, i64 %45
  %50 = getelementptr float, ptr addrspace(1) %9, i64 %46
  %51 = getelementptr float, ptr addrspace(1) %9, i64 %47
  %52 = getelementptr float, ptr addrspace(1) %9, i64 %48
  %53 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %49)
  %54 = extractvalue { i32, i32, i32, i32 } %53, 0
  %55 = bitcast i32 %54 to <1 x float>
  %56 = extractvalue { i32, i32, i32, i32 } %53, 1
  %57 = bitcast i32 %56 to <1 x float>
  %58 = extractvalue { i32, i32, i32, i32 } %53, 2
  %59 = bitcast i32 %58 to <1 x float>
  %60 = extractvalue { i32, i32, i32, i32 } %53, 3
  %61 = bitcast i32 %60 to <1 x float>
  %62 = extractelement <1 x float> %55, i32 0
  %63 = extractelement <1 x float> %57, i32 0
  %64 = extractelement <1 x float> %59, i32 0
  %65 = extractelement <1 x float> %61, i32 0
  %66 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %50)
  %67 = extractvalue { i32, i32, i32, i32 } %66, 0
  %68 = bitcast i32 %67 to <1 x float>
  %69 = extractvalue { i32, i32, i32, i32 } %66, 1
  %70 = bitcast i32 %69 to <1 x float>
  %71 = extractvalue { i32, i32, i32, i32 } %66, 2
  %72 = bitcast i32 %71 to <1 x float>
  %73 = extractvalue { i32, i32, i32, i32 } %66, 3
  %74 = bitcast i32 %73 to <1 x float>
  %75 = extractelement <1 x float> %68, i32 0
  %76 = extractelement <1 x float> %70, i32 0
  %77 = extractelement <1 x float> %72, i32 0
  %78 = extractelement <1 x float> %74, i32 0
  %79 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %51)
  %80 = extractvalue { i32, i32, i32, i32 } %79, 0
  %81 = bitcast i32 %80 to <1 x float>
  %82 = extractvalue { i32, i32, i32, i32 } %79, 1
  %83 = bitcast i32 %82 to <1 x float>
  %84 = extractvalue { i32, i32, i32, i32 } %79, 2
  %85 = bitcast i32 %84 to <1 x float>
  %86 = extractvalue { i32, i32, i32, i32 } %79, 3
  %87 = bitcast i32 %86 to <1 x float>
  %88 = extractelement <1 x float> %81, i32 0
  %89 = extractelement <1 x float> %83, i32 0
  %90 = extractelement <1 x float> %85, i32 0
  %91 = extractelement <1 x float> %87, i32 0
  %92 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %93 = extractvalue { i32, i32, i32, i32 } %92, 0
  %94 = bitcast i32 %93 to <1 x float>
  %95 = extractvalue { i32, i32, i32, i32 } %92, 1
  %96 = bitcast i32 %95 to <1 x float>
  %97 = extractvalue { i32, i32, i32, i32 } %92, 2
  %98 = bitcast i32 %97 to <1 x float>
  %99 = extractvalue { i32, i32, i32, i32 } %92, 3
  %100 = bitcast i32 %99 to <1 x float>
  %101 = extractelement <1 x float> %94, i32 0
  %102 = extractelement <1 x float> %96, i32 0
  %103 = extractelement <1 x float> %98, i32 0
  %104 = extractelement <1 x float> %100, i32 0
  %105 = fmul float %62, %62
  %106 = fmul float %63, %63
  %107 = fmul float %64, %64
  %108 = fmul float %65, %65
  %109 = fmul float %75, %75
  %110 = fmul float %76, %76
  %111 = fmul float %77, %77
  %112 = fmul float %78, %78
  %113 = fmul float %88, %88
  %114 = fmul float %89, %89
  %115 = fmul float %90, %90
  %116 = fmul float %91, %91
  %117 = fmul float %101, %101
  %118 = fmul float %102, %102
  %119 = fmul float %103, %103
  %120 = fmul float %104, %104
  %121 = fadd float %105, %106
  %122 = fadd float %121, %107
  %123 = fadd float %122, %108
  %124 = fadd float %123, %109
  %125 = fadd float %124, %110
  %126 = fadd float %125, %111
  %127 = fadd float %126, %112
  %128 = fadd float %127, %113
  %129 = fadd float %128, %114
  %130 = fadd float %129, %115
  %131 = fadd float %130, %116
  %132 = fadd float %131, %117
  %133 = fadd float %132, %118
  %134 = fadd float %133, %119
  %135 = fadd float %134, %120
  %136 = bitcast float %135 to i32
  %137 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %136, i32 16, i32 31)
  %138 = bitcast i32 %137 to float
  %139 = fadd float %135, %138
  %140 = bitcast float %139 to i32
  %141 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %140, i32 8, i32 31)
  %142 = bitcast i32 %141 to float
  %143 = fadd float %139, %142
  %144 = bitcast float %143 to i32
  %145 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %144, i32 4, i32 31)
  %146 = bitcast i32 %145 to float
  %147 = fadd float %143, %146
  %148 = bitcast float %147 to i32
  %149 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %148, i32 2, i32 31)
  %150 = bitcast i32 %149 to float
  %151 = fadd float %147, %150
  %152 = bitcast float %151 to i32
  %153 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %152, i32 1, i32 31)
  %154 = bitcast i32 %153 to float
  %155 = fadd float %151, %154
  %156 = urem i32 %11, 32
  %157 = urem i32 %12, 2
  %158 = icmp eq i32 %156, 0
  %159 = and i1 true, %158
  %160 = add i32 0, %157
  %161 = getelementptr float, ptr addrspace(3) @global_smem, i32 %160
  %162 = insertelement <1 x float> undef, float %155, i32 0
  %163 = extractelement <1 x float> %162, i32 0
  %164 = bitcast float %163 to i32
  %165 = insertelement <1 x i32> undef, i32 %164, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %161, <1 x i32> %165, i1 %159)
  call void @llvm.nvvm.barrier0()
  %166 = icmp slt i32 %10, 2
  %167 = getelementptr float, ptr addrspace(3) @global_smem, i32 %10
  %168 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %167, i1 %166)
  %169 = insertelement <1 x i32> undef, i32 %168, i32 0
  %170 = extractelement <1 x i32> %169, i32 0
  %171 = bitcast i32 %170 to float
  %172 = insertelement <1 x float> undef, float %171, i32 0
  %173 = extractelement <1 x float> %172, i32 0
  %174 = bitcast float %173 to i32
  %175 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %174, i32 1, i32 31)
  %176 = bitcast i32 %175 to float
  %177 = fadd float %173, %176
  %178 = urem i32 %11, 2
  %179 = icmp eq i32 %178, 0
  %180 = and i1 %166, %179
  %181 = insertelement <1 x float> undef, float %177, i32 0
  %182 = extractelement <1 x float> %181, i32 0
  %183 = bitcast float %182 to i32
  %184 = insertelement <1 x i32> undef, i32 %183, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %167, <1 x i32> %184, i1 %180)
  call void @llvm.nvvm.barrier0()
  %185 = load float, ptr addrspace(3) @global_smem, align 4
  %186 = fmul float %185, 0x3F50000000000000
  %187 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %2)
  %188 = bitcast i32 %187 to <1 x float>
  %189 = extractelement <1 x float> %188, i32 0
  %190 = fadd float %186, %189
  %191 = call float @__nv_rsqrtf(float %190)
  %192 = fmul float %62, %191
  %193 = fmul float %63, %191
  %194 = fmul float %64, %191
  %195 = fmul float %65, %191
  %196 = fmul float %75, %191
  %197 = fmul float %76, %191
  %198 = fmul float %77, %191
  %199 = fmul float %78, %191
  %200 = fmul float %88, %191
  %201 = fmul float %89, %191
  %202 = fmul float %90, %191
  %203 = fmul float %91, %191
  %204 = fmul float %101, %191
  %205 = fmul float %102, %191
  %206 = fmul float %103, %191
  %207 = fmul float %104, %191
  %208 = getelementptr bfloat, ptr addrspace(1) %3, i64 %45
  %209 = getelementptr bfloat, ptr addrspace(1) %3, i64 %47
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
  %260 = fmul float %192, %244
  %261 = fmul float %193, %245
  %262 = fmul float %194, %246
  %263 = fmul float %195, %247
  %264 = fmul float %196, %248
  %265 = fmul float %197, %249
  %266 = fmul float %198, %250
  %267 = fmul float %199, %251
  %268 = fmul float %200, %252
  %269 = fmul float %201, %253
  %270 = fmul float %202, %254
  %271 = fmul float %203, %255
  %272 = fmul float %204, %256
  %273 = fmul float %205, %257
  %274 = fmul float %206, %258
  %275 = fmul float %207, %259
  %276 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %260)
  %277 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %261)
  %278 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %262)
  %279 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %263)
  %280 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %264)
  %281 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %265)
  %282 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %266)
  %283 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %267)
  %284 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %268)
  %285 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %269)
  %286 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %270)
  %287 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %271)
  %288 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %272)
  %289 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %273)
  %290 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %274)
  %291 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %275)
  %292 = getelementptr bfloat, ptr addrspace(1) %4, i64 %8
  %293 = getelementptr bfloat, ptr addrspace(1) %292, i64 %45
  %294 = getelementptr bfloat, ptr addrspace(1) %292, i64 %47
  %295 = insertelement <2 x bfloat> undef, bfloat %276, i32 0
  %296 = insertelement <2 x bfloat> %295, bfloat %277, i32 1
  %297 = bitcast <2 x bfloat> %296 to i32
  %298 = insertelement <2 x bfloat> undef, bfloat %278, i32 0
  %299 = insertelement <2 x bfloat> %298, bfloat %279, i32 1
  %300 = bitcast <2 x bfloat> %299 to i32
  %301 = insertelement <2 x bfloat> undef, bfloat %280, i32 0
  %302 = insertelement <2 x bfloat> %301, bfloat %281, i32 1
  %303 = bitcast <2 x bfloat> %302 to i32
  %304 = insertelement <2 x bfloat> undef, bfloat %282, i32 0
  %305 = insertelement <2 x bfloat> %304, bfloat %283, i32 1
  %306 = bitcast <2 x bfloat> %305 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %297, i32 %300, i32 %303, i32 %306, ptr addrspace(1) %293)
  %307 = insertelement <2 x bfloat> undef, bfloat %284, i32 0
  %308 = insertelement <2 x bfloat> %307, bfloat %285, i32 1
  %309 = bitcast <2 x bfloat> %308 to i32
  %310 = insertelement <2 x bfloat> undef, bfloat %286, i32 0
  %311 = insertelement <2 x bfloat> %310, bfloat %287, i32 1
  %312 = bitcast <2 x bfloat> %311 to i32
  %313 = insertelement <2 x bfloat> undef, bfloat %288, i32 0
  %314 = insertelement <2 x bfloat> %313, bfloat %289, i32 1
  %315 = bitcast <2 x bfloat> %314 to i32
  %316 = insertelement <2 x bfloat> undef, bfloat %290, i32 0
  %317 = insertelement <2 x bfloat> %316, bfloat %291, i32 1
  %318 = bitcast <2 x bfloat> %317 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %309, i32 %312, i32 %315, i32 %318, ptr addrspace(1) %294)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_116_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_116(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 9216
  %11 = add i64 %10, 1024
  %12 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
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
  %41 = xor i32 %39, 4
  %42 = xor i32 %39, 512
  %43 = xor i32 %39, 516
  %44 = add i32 %40, 0
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = sext i32 %44 to i64
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = getelementptr bfloat, ptr addrspace(1) %12, i64 %48
  %53 = getelementptr bfloat, ptr addrspace(1) %12, i64 %50
  %54 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %55 = extractvalue { i32, i32, i32, i32 } %54, 0
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %54, 1
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %54, 2
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %54, 3
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %72 = extractvalue { i32, i32, i32, i32 } %71, 0
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %71, 1
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %71, 2
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %71, 3
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %3, i64 %104
  %106 = getelementptr bfloat, ptr addrspace(1) %105, i64 %48
  %107 = getelementptr bfloat, ptr addrspace(1) %105, i64 %50
  %108 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %106)
  %109 = extractvalue { i32, i32, i32, i32 } %108, 0
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %108, 1
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %108, 2
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %108, 3
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %126 = extractvalue { i32, i32, i32, i32 } %125, 0
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %125, 1
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %125, 2
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %125, 3
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = getelementptr float, ptr addrspace(1) %2, i64 %104
  %159 = getelementptr float, ptr addrspace(1) %158, i64 %48
  %160 = getelementptr float, ptr addrspace(1) %158, i64 %49
  %161 = getelementptr float, ptr addrspace(1) %158, i64 %50
  %162 = getelementptr float, ptr addrspace(1) %158, i64 %51
  %163 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %159)
  %164 = extractvalue { i32, i32, i32, i32 } %163, 0
  %165 = bitcast i32 %164 to <1 x float>
  %166 = extractvalue { i32, i32, i32, i32 } %163, 1
  %167 = bitcast i32 %166 to <1 x float>
  %168 = extractvalue { i32, i32, i32, i32 } %163, 2
  %169 = bitcast i32 %168 to <1 x float>
  %170 = extractvalue { i32, i32, i32, i32 } %163, 3
  %171 = bitcast i32 %170 to <1 x float>
  %172 = extractelement <1 x float> %165, i32 0
  %173 = extractelement <1 x float> %167, i32 0
  %174 = extractelement <1 x float> %169, i32 0
  %175 = extractelement <1 x float> %171, i32 0
  %176 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <1 x float>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <1 x float>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <1 x float>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <1 x float>
  %185 = extractelement <1 x float> %178, i32 0
  %186 = extractelement <1 x float> %180, i32 0
  %187 = extractelement <1 x float> %182, i32 0
  %188 = extractelement <1 x float> %184, i32 0
  %189 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %190 = extractvalue { i32, i32, i32, i32 } %189, 0
  %191 = bitcast i32 %190 to <1 x float>
  %192 = extractvalue { i32, i32, i32, i32 } %189, 1
  %193 = bitcast i32 %192 to <1 x float>
  %194 = extractvalue { i32, i32, i32, i32 } %189, 2
  %195 = bitcast i32 %194 to <1 x float>
  %196 = extractvalue { i32, i32, i32, i32 } %189, 3
  %197 = bitcast i32 %196 to <1 x float>
  %198 = extractelement <1 x float> %191, i32 0
  %199 = extractelement <1 x float> %193, i32 0
  %200 = extractelement <1 x float> %195, i32 0
  %201 = extractelement <1 x float> %197, i32 0
  %202 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %203 = extractvalue { i32, i32, i32, i32 } %202, 0
  %204 = bitcast i32 %203 to <1 x float>
  %205 = extractvalue { i32, i32, i32, i32 } %202, 1
  %206 = bitcast i32 %205 to <1 x float>
  %207 = extractvalue { i32, i32, i32, i32 } %202, 2
  %208 = bitcast i32 %207 to <1 x float>
  %209 = extractvalue { i32, i32, i32, i32 } %202, 3
  %210 = bitcast i32 %209 to <1 x float>
  %211 = extractelement <1 x float> %204, i32 0
  %212 = extractelement <1 x float> %206, i32 0
  %213 = extractelement <1 x float> %208, i32 0
  %214 = extractelement <1 x float> %210, i32 0
  %215 = fadd float %142, %172
  %216 = fadd float %143, %173
  %217 = fadd float %144, %174
  %218 = fadd float %145, %175
  %219 = fadd float %146, %185
  %220 = fadd float %147, %186
  %221 = fadd float %148, %187
  %222 = fadd float %149, %188
  %223 = fadd float %150, %198
  %224 = fadd float %151, %199
  %225 = fadd float %152, %200
  %226 = fadd float %153, %201
  %227 = fadd float %154, %211
  %228 = fadd float %155, %212
  %229 = fadd float %156, %213
  %230 = fadd float %157, %214
  %231 = fadd float %88, %215
  %232 = fadd float %89, %216
  %233 = fadd float %90, %217
  %234 = fadd float %91, %218
  %235 = fadd float %92, %219
  %236 = fadd float %93, %220
  %237 = fadd float %94, %221
  %238 = fadd float %95, %222
  %239 = fadd float %96, %223
  %240 = fadd float %97, %224
  %241 = fadd float %98, %225
  %242 = fadd float %99, %226
  %243 = fadd float %100, %227
  %244 = fadd float %101, %228
  %245 = fadd float %102, %229
  %246 = fadd float %103, %230
  %247 = fmul float %231, %231
  %248 = fmul float %232, %232
  %249 = fmul float %233, %233
  %250 = fmul float %234, %234
  %251 = fmul float %235, %235
  %252 = fmul float %236, %236
  %253 = fmul float %237, %237
  %254 = fmul float %238, %238
  %255 = fmul float %239, %239
  %256 = fmul float %240, %240
  %257 = fmul float %241, %241
  %258 = fmul float %242, %242
  %259 = fmul float %243, %243
  %260 = fmul float %244, %244
  %261 = fmul float %245, %245
  %262 = fmul float %246, %246
  %263 = fadd float %247, %248
  %264 = fadd float %263, %249
  %265 = fadd float %264, %250
  %266 = fadd float %265, %251
  %267 = fadd float %266, %252
  %268 = fadd float %267, %253
  %269 = fadd float %268, %254
  %270 = fadd float %269, %255
  %271 = fadd float %270, %256
  %272 = fadd float %271, %257
  %273 = fadd float %272, %258
  %274 = fadd float %273, %259
  %275 = fadd float %274, %260
  %276 = fadd float %275, %261
  %277 = fadd float %276, %262
  %278 = bitcast float %277 to i32
  %279 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %278, i32 16, i32 31)
  %280 = bitcast i32 %279 to float
  %281 = fadd float %277, %280
  %282 = bitcast float %281 to i32
  %283 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %282, i32 8, i32 31)
  %284 = bitcast i32 %283 to float
  %285 = fadd float %281, %284
  %286 = bitcast float %285 to i32
  %287 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %286, i32 4, i32 31)
  %288 = bitcast i32 %287 to float
  %289 = fadd float %285, %288
  %290 = bitcast float %289 to i32
  %291 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %290, i32 2, i32 31)
  %292 = bitcast i32 %291 to float
  %293 = fadd float %289, %292
  %294 = bitcast float %293 to i32
  %295 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %294, i32 1, i32 31)
  %296 = bitcast i32 %295 to float
  %297 = fadd float %293, %296
  %298 = urem i32 %14, 32
  %299 = urem i32 %15, 2
  %300 = icmp eq i32 %298, 0
  %301 = and i1 true, %300
  %302 = add i32 0, %299
  %303 = getelementptr float, ptr addrspace(3) @global_smem, i32 %302
  %304 = insertelement <1 x float> undef, float %297, i32 0
  %305 = extractelement <1 x float> %304, i32 0
  %306 = bitcast float %305 to i32
  %307 = insertelement <1 x i32> undef, i32 %306, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %303, <1 x i32> %307, i1 %301)
  call void @llvm.nvvm.barrier0()
  %308 = icmp slt i32 %13, 2
  %309 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %310 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %309, i1 %308)
  %311 = insertelement <1 x i32> undef, i32 %310, i32 0
  %312 = extractelement <1 x i32> %311, i32 0
  %313 = bitcast i32 %312 to float
  %314 = insertelement <1 x float> undef, float %313, i32 0
  %315 = extractelement <1 x float> %314, i32 0
  %316 = bitcast float %315 to i32
  %317 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %316, i32 1, i32 31)
  %318 = bitcast i32 %317 to float
  %319 = fadd float %315, %318
  %320 = urem i32 %14, 2
  %321 = icmp eq i32 %320, 0
  %322 = and i1 %308, %321
  %323 = insertelement <1 x float> undef, float %319, i32 0
  %324 = extractelement <1 x float> %323, i32 0
  %325 = bitcast float %324 to i32
  %326 = insertelement <1 x i32> undef, i32 %325, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %309, <1 x i32> %326, i1 %322)
  call void @llvm.nvvm.barrier0()
  %327 = load float, ptr addrspace(3) @global_smem, align 4
  %328 = fmul float %327, 0x3F50000000000000
  %329 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %330 = bitcast i32 %329 to <1 x float>
  %331 = extractelement <1 x float> %330, i32 0
  %332 = fadd float %328, %331
  %333 = call float @__nv_rsqrtf(float %332)
  %334 = fmul float %231, %333
  %335 = fmul float %232, %333
  %336 = fmul float %233, %333
  %337 = fmul float %234, %333
  %338 = fmul float %235, %333
  %339 = fmul float %236, %333
  %340 = fmul float %237, %333
  %341 = fmul float %238, %333
  %342 = fmul float %239, %333
  %343 = fmul float %240, %333
  %344 = fmul float %241, %333
  %345 = fmul float %242, %333
  %346 = fmul float %243, %333
  %347 = fmul float %244, %333
  %348 = fmul float %245, %333
  %349 = fmul float %246, %333
  %350 = getelementptr bfloat, ptr addrspace(1) %5, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %5, i64 %50
  %352 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %350)
  %353 = extractvalue { i32, i32, i32, i32 } %352, 0
  %354 = bitcast i32 %353 to <2 x bfloat>
  %355 = extractvalue { i32, i32, i32, i32 } %352, 1
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %352, 2
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %352, 3
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractelement <2 x bfloat> %354, i32 0
  %362 = extractelement <2 x bfloat> %354, i32 1
  %363 = extractelement <2 x bfloat> %356, i32 0
  %364 = extractelement <2 x bfloat> %356, i32 1
  %365 = extractelement <2 x bfloat> %358, i32 0
  %366 = extractelement <2 x bfloat> %358, i32 1
  %367 = extractelement <2 x bfloat> %360, i32 0
  %368 = extractelement <2 x bfloat> %360, i32 1
  %369 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %351)
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %369, 1
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %369, 2
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractvalue { i32, i32, i32, i32 } %369, 3
  %377 = bitcast i32 %376 to <2 x bfloat>
  %378 = extractelement <2 x bfloat> %371, i32 0
  %379 = extractelement <2 x bfloat> %371, i32 1
  %380 = extractelement <2 x bfloat> %373, i32 0
  %381 = extractelement <2 x bfloat> %373, i32 1
  %382 = extractelement <2 x bfloat> %375, i32 0
  %383 = extractelement <2 x bfloat> %375, i32 1
  %384 = extractelement <2 x bfloat> %377, i32 0
  %385 = extractelement <2 x bfloat> %377, i32 1
  %386 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %361)
  %387 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %362)
  %388 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363)
  %389 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364)
  %390 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365)
  %391 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366)
  %392 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367)
  %393 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368)
  %394 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378)
  %395 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379)
  %396 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380)
  %397 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381)
  %398 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382)
  %399 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383)
  %400 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %384)
  %401 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %385)
  %402 = fmul float %334, %386
  %403 = fmul float %335, %387
  %404 = fmul float %336, %388
  %405 = fmul float %337, %389
  %406 = fmul float %338, %390
  %407 = fmul float %339, %391
  %408 = fmul float %340, %392
  %409 = fmul float %341, %393
  %410 = fmul float %342, %394
  %411 = fmul float %343, %395
  %412 = fmul float %344, %396
  %413 = fmul float %345, %397
  %414 = fmul float %346, %398
  %415 = fmul float %347, %399
  %416 = fmul float %348, %400
  %417 = fmul float %349, %401
  %418 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %402)
  %419 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %403)
  %420 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %404)
  %421 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %405)
  %422 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %406)
  %423 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %407)
  %424 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %408)
  %425 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %409)
  %426 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %410)
  %427 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %411)
  %428 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %412)
  %429 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %413)
  %430 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %414)
  %431 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %415)
  %432 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416)
  %433 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417)
  %434 = getelementptr bfloat, ptr addrspace(1) %6, i64 %104
  %435 = getelementptr bfloat, ptr addrspace(1) %434, i64 %48
  %436 = getelementptr bfloat, ptr addrspace(1) %434, i64 %50
  %437 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %438 = insertelement <2 x bfloat> %437, bfloat %419, i32 1
  %439 = bitcast <2 x bfloat> %438 to i32
  %440 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %441 = insertelement <2 x bfloat> %440, bfloat %421, i32 1
  %442 = bitcast <2 x bfloat> %441 to i32
  %443 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %444 = insertelement <2 x bfloat> %443, bfloat %423, i32 1
  %445 = bitcast <2 x bfloat> %444 to i32
  %446 = insertelement <2 x bfloat> undef, bfloat %424, i32 0
  %447 = insertelement <2 x bfloat> %446, bfloat %425, i32 1
  %448 = bitcast <2 x bfloat> %447 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %439, i32 %442, i32 %445, i32 %448, ptr addrspace(1) %435)
  %449 = insertelement <2 x bfloat> undef, bfloat %426, i32 0
  %450 = insertelement <2 x bfloat> %449, bfloat %427, i32 1
  %451 = bitcast <2 x bfloat> %450 to i32
  %452 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %453 = insertelement <2 x bfloat> %452, bfloat %429, i32 1
  %454 = bitcast <2 x bfloat> %453 to i32
  %455 = insertelement <2 x bfloat> undef, bfloat %430, i32 0
  %456 = insertelement <2 x bfloat> %455, bfloat %431, i32 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> undef, bfloat %432, i32 0
  %459 = insertelement <2 x bfloat> %458, bfloat %433, i32 1
  %460 = bitcast <2 x bfloat> %459 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %451, i32 %454, i32 %457, i32 %460, ptr addrspace(1) %436)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_115_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_115(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #6 {
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
  %11 = mul i64 %10, 9216
  %12 = getelementptr bfloat, ptr addrspace(1) %5, i64 %11
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
  %41 = xor i32 %39, 4
  %42 = xor i32 %39, 512
  %43 = xor i32 %39, 516
  %44 = add i32 %40, 0
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = sext i32 %44 to i64
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = getelementptr bfloat, ptr addrspace(1) %12, i64 %48
  %53 = getelementptr bfloat, ptr addrspace(1) %12, i64 %50
  %54 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %52)
  %55 = extractvalue { i32, i32, i32, i32 } %54, 0
  %56 = bitcast i32 %55 to <2 x bfloat>
  %57 = extractvalue { i32, i32, i32, i32 } %54, 1
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %54, 2
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %54, 3
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractelement <2 x bfloat> %56, i32 0
  %64 = extractelement <2 x bfloat> %56, i32 1
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %72 = extractvalue { i32, i32, i32, i32 } %71, 0
  %73 = bitcast i32 %72 to <2 x bfloat>
  %74 = extractvalue { i32, i32, i32, i32 } %71, 1
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %71, 2
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %71, 3
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractelement <2 x bfloat> %73, i32 0
  %81 = extractelement <2 x bfloat> %73, i32 1
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %63)
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = mul i64 %10, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %6, i64 %104
  %106 = getelementptr bfloat, ptr addrspace(1) %105, i64 %48
  %107 = getelementptr bfloat, ptr addrspace(1) %105, i64 %50
  %108 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %106)
  %109 = extractvalue { i32, i32, i32, i32 } %108, 0
  %110 = bitcast i32 %109 to <2 x bfloat>
  %111 = extractvalue { i32, i32, i32, i32 } %108, 1
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %108, 2
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %108, 3
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractelement <2 x bfloat> %110, i32 0
  %118 = extractelement <2 x bfloat> %110, i32 1
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %126 = extractvalue { i32, i32, i32, i32 } %125, 0
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %125, 1
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %125, 2
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %125, 3
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractelement <2 x bfloat> %127, i32 0
  %135 = extractelement <2 x bfloat> %127, i32 1
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %117)
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = add i64 %11, 1024
  %159 = getelementptr bfloat, ptr addrspace(1) %5, i64 %158
  %160 = getelementptr bfloat, ptr addrspace(1) %159, i64 %48
  %161 = getelementptr bfloat, ptr addrspace(1) %159, i64 %50
  %162 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %163 = extractvalue { i32, i32, i32, i32 } %162, 0
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractvalue { i32, i32, i32, i32 } %162, 1
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %162, 2
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %162, 3
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractelement <2 x bfloat> %164, i32 0
  %172 = extractelement <2 x bfloat> %164, i32 1
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i32 0
  %189 = extractelement <2 x bfloat> %181, i32 1
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = getelementptr bfloat, ptr addrspace(1) %4, i64 %104
  %213 = getelementptr bfloat, ptr addrspace(1) %212, i64 %48
  %214 = getelementptr bfloat, ptr addrspace(1) %212, i64 %50
  %215 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %213)
  %216 = extractvalue { i32, i32, i32, i32 } %215, 0
  %217 = bitcast i32 %216 to <2 x bfloat>
  %218 = extractvalue { i32, i32, i32, i32 } %215, 1
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractvalue { i32, i32, i32, i32 } %215, 2
  %221 = bitcast i32 %220 to <2 x bfloat>
  %222 = extractvalue { i32, i32, i32, i32 } %215, 3
  %223 = bitcast i32 %222 to <2 x bfloat>
  %224 = extractelement <2 x bfloat> %217, i32 0
  %225 = extractelement <2 x bfloat> %217, i32 1
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = extractelement <2 x bfloat> %221, i32 0
  %229 = extractelement <2 x bfloat> %221, i32 1
  %230 = extractelement <2 x bfloat> %223, i32 0
  %231 = extractelement <2 x bfloat> %223, i32 1
  %232 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %214)
  %233 = extractvalue { i32, i32, i32, i32 } %232, 0
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %232, 1
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %232, 2
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractvalue { i32, i32, i32, i32 } %232, 3
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = extractelement <2 x bfloat> %234, i32 0
  %242 = extractelement <2 x bfloat> %234, i32 1
  %243 = extractelement <2 x bfloat> %236, i32 0
  %244 = extractelement <2 x bfloat> %236, i32 1
  %245 = extractelement <2 x bfloat> %238, i32 0
  %246 = extractelement <2 x bfloat> %238, i32 1
  %247 = extractelement <2 x bfloat> %240, i32 0
  %248 = extractelement <2 x bfloat> %240, i32 1
  %249 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224)
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = getelementptr float, ptr addrspace(1) %3, i64 %104
  %266 = getelementptr float, ptr addrspace(1) %265, i64 %48
  %267 = getelementptr float, ptr addrspace(1) %265, i64 %49
  %268 = getelementptr float, ptr addrspace(1) %265, i64 %50
  %269 = getelementptr float, ptr addrspace(1) %265, i64 %51
  %270 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %266)
  %271 = extractvalue { i32, i32, i32, i32 } %270, 0
  %272 = bitcast i32 %271 to <1 x float>
  %273 = extractvalue { i32, i32, i32, i32 } %270, 1
  %274 = bitcast i32 %273 to <1 x float>
  %275 = extractvalue { i32, i32, i32, i32 } %270, 2
  %276 = bitcast i32 %275 to <1 x float>
  %277 = extractvalue { i32, i32, i32, i32 } %270, 3
  %278 = bitcast i32 %277 to <1 x float>
  %279 = extractelement <1 x float> %272, i32 0
  %280 = extractelement <1 x float> %274, i32 0
  %281 = extractelement <1 x float> %276, i32 0
  %282 = extractelement <1 x float> %278, i32 0
  %283 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %267)
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = bitcast i32 %284 to <1 x float>
  %286 = extractvalue { i32, i32, i32, i32 } %283, 1
  %287 = bitcast i32 %286 to <1 x float>
  %288 = extractvalue { i32, i32, i32, i32 } %283, 2
  %289 = bitcast i32 %288 to <1 x float>
  %290 = extractvalue { i32, i32, i32, i32 } %283, 3
  %291 = bitcast i32 %290 to <1 x float>
  %292 = extractelement <1 x float> %285, i32 0
  %293 = extractelement <1 x float> %287, i32 0
  %294 = extractelement <1 x float> %289, i32 0
  %295 = extractelement <1 x float> %291, i32 0
  %296 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %268)
  %297 = extractvalue { i32, i32, i32, i32 } %296, 0
  %298 = bitcast i32 %297 to <1 x float>
  %299 = extractvalue { i32, i32, i32, i32 } %296, 1
  %300 = bitcast i32 %299 to <1 x float>
  %301 = extractvalue { i32, i32, i32, i32 } %296, 2
  %302 = bitcast i32 %301 to <1 x float>
  %303 = extractvalue { i32, i32, i32, i32 } %296, 3
  %304 = bitcast i32 %303 to <1 x float>
  %305 = extractelement <1 x float> %298, i32 0
  %306 = extractelement <1 x float> %300, i32 0
  %307 = extractelement <1 x float> %302, i32 0
  %308 = extractelement <1 x float> %304, i32 0
  %309 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
  %310 = extractvalue { i32, i32, i32, i32 } %309, 0
  %311 = bitcast i32 %310 to <1 x float>
  %312 = extractvalue { i32, i32, i32, i32 } %309, 1
  %313 = bitcast i32 %312 to <1 x float>
  %314 = extractvalue { i32, i32, i32, i32 } %309, 2
  %315 = bitcast i32 %314 to <1 x float>
  %316 = extractvalue { i32, i32, i32, i32 } %309, 3
  %317 = bitcast i32 %316 to <1 x float>
  %318 = extractelement <1 x float> %311, i32 0
  %319 = extractelement <1 x float> %313, i32 0
  %320 = extractelement <1 x float> %315, i32 0
  %321 = extractelement <1 x float> %317, i32 0
  %322 = fadd float %249, %279
  %323 = fadd float %250, %280
  %324 = fadd float %251, %281
  %325 = fadd float %252, %282
  %326 = fadd float %253, %292
  %327 = fadd float %254, %293
  %328 = fadd float %255, %294
  %329 = fadd float %256, %295
  %330 = fadd float %257, %305
  %331 = fadd float %258, %306
  %332 = fadd float %259, %307
  %333 = fadd float %260, %308
  %334 = fadd float %261, %318
  %335 = fadd float %262, %319
  %336 = fadd float %263, %320
  %337 = fadd float %264, %321
  %338 = fadd float %196, %322
  %339 = fadd float %197, %323
  %340 = fadd float %198, %324
  %341 = fadd float %199, %325
  %342 = fadd float %200, %326
  %343 = fadd float %201, %327
  %344 = fadd float %202, %328
  %345 = fadd float %203, %329
  %346 = fadd float %204, %330
  %347 = fadd float %205, %331
  %348 = fadd float %206, %332
  %349 = fadd float %207, %333
  %350 = fadd float %208, %334
  %351 = fadd float %209, %335
  %352 = fadd float %210, %336
  %353 = fadd float %211, %337
  %354 = fadd float %142, %338
  %355 = fadd float %143, %339
  %356 = fadd float %144, %340
  %357 = fadd float %145, %341
  %358 = fadd float %146, %342
  %359 = fadd float %147, %343
  %360 = fadd float %148, %344
  %361 = fadd float %149, %345
  %362 = fadd float %150, %346
  %363 = fadd float %151, %347
  %364 = fadd float %152, %348
  %365 = fadd float %153, %349
  %366 = fadd float %154, %350
  %367 = fadd float %155, %351
  %368 = fadd float %156, %352
  %369 = fadd float %157, %353
  %370 = fadd float %88, %354
  %371 = fadd float %89, %355
  %372 = fadd float %90, %356
  %373 = fadd float %91, %357
  %374 = fadd float %92, %358
  %375 = fadd float %93, %359
  %376 = fadd float %94, %360
  %377 = fadd float %95, %361
  %378 = fadd float %96, %362
  %379 = fadd float %97, %363
  %380 = fadd float %98, %364
  %381 = fadd float %99, %365
  %382 = fadd float %100, %366
  %383 = fadd float %101, %367
  %384 = fadd float %102, %368
  %385 = fadd float %103, %369
  %386 = fmul float %370, %370
  %387 = fmul float %371, %371
  %388 = fmul float %372, %372
  %389 = fmul float %373, %373
  %390 = fmul float %374, %374
  %391 = fmul float %375, %375
  %392 = fmul float %376, %376
  %393 = fmul float %377, %377
  %394 = fmul float %378, %378
  %395 = fmul float %379, %379
  %396 = fmul float %380, %380
  %397 = fmul float %381, %381
  %398 = fmul float %382, %382
  %399 = fmul float %383, %383
  %400 = fmul float %384, %384
  %401 = fmul float %385, %385
  %402 = fadd float %386, %387
  %403 = fadd float %402, %388
  %404 = fadd float %403, %389
  %405 = fadd float %404, %390
  %406 = fadd float %405, %391
  %407 = fadd float %406, %392
  %408 = fadd float %407, %393
  %409 = fadd float %408, %394
  %410 = fadd float %409, %395
  %411 = fadd float %410, %396
  %412 = fadd float %411, %397
  %413 = fadd float %412, %398
  %414 = fadd float %413, %399
  %415 = fadd float %414, %400
  %416 = fadd float %415, %401
  %417 = bitcast float %416 to i32
  %418 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %417, i32 16, i32 31)
  %419 = bitcast i32 %418 to float
  %420 = fadd float %416, %419
  %421 = bitcast float %420 to i32
  %422 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %421, i32 8, i32 31)
  %423 = bitcast i32 %422 to float
  %424 = fadd float %420, %423
  %425 = bitcast float %424 to i32
  %426 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %425, i32 4, i32 31)
  %427 = bitcast i32 %426 to float
  %428 = fadd float %424, %427
  %429 = bitcast float %428 to i32
  %430 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %429, i32 2, i32 31)
  %431 = bitcast i32 %430 to float
  %432 = fadd float %428, %431
  %433 = bitcast float %432 to i32
  %434 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %433, i32 1, i32 31)
  %435 = bitcast i32 %434 to float
  %436 = fadd float %432, %435
  %437 = urem i32 %14, 32
  %438 = urem i32 %15, 2
  %439 = icmp eq i32 %437, 0
  %440 = and i1 true, %439
  %441 = add i32 0, %438
  %442 = getelementptr float, ptr addrspace(3) @global_smem, i32 %441
  %443 = insertelement <1 x float> undef, float %436, i32 0
  %444 = extractelement <1 x float> %443, i32 0
  %445 = bitcast float %444 to i32
  %446 = insertelement <1 x i32> undef, i32 %445, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %442, <1 x i32> %446, i1 %440)
  call void @llvm.nvvm.barrier0()
  %447 = icmp slt i32 %13, 2
  %448 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %449 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %448, i1 %447)
  %450 = insertelement <1 x i32> undef, i32 %449, i32 0
  %451 = extractelement <1 x i32> %450, i32 0
  %452 = bitcast i32 %451 to float
  %453 = insertelement <1 x float> undef, float %452, i32 0
  %454 = extractelement <1 x float> %453, i32 0
  %455 = bitcast float %454 to i32
  %456 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %455, i32 1, i32 31)
  %457 = bitcast i32 %456 to float
  %458 = fadd float %454, %457
  %459 = urem i32 %14, 2
  %460 = icmp eq i32 %459, 0
  %461 = and i1 %447, %460
  %462 = insertelement <1 x float> undef, float %458, i32 0
  %463 = extractelement <1 x float> %462, i32 0
  %464 = bitcast float %463 to i32
  %465 = insertelement <1 x i32> undef, i32 %464, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %448, <1 x i32> %465, i1 %461)
  call void @llvm.nvvm.barrier0()
  %466 = load float, ptr addrspace(3) @global_smem, align 4
  %467 = fmul float %466, 0x3F50000000000000
  %468 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %469 = bitcast i32 %468 to <1 x float>
  %470 = extractelement <1 x float> %469, i32 0
  %471 = fadd float %467, %470
  %472 = call float @__nv_rsqrtf(float %471)
  %473 = fmul float %370, %472
  %474 = fmul float %371, %472
  %475 = fmul float %372, %472
  %476 = fmul float %373, %472
  %477 = fmul float %374, %472
  %478 = fmul float %375, %472
  %479 = fmul float %376, %472
  %480 = fmul float %377, %472
  %481 = fmul float %378, %472
  %482 = fmul float %379, %472
  %483 = fmul float %380, %472
  %484 = fmul float %381, %472
  %485 = fmul float %382, %472
  %486 = fmul float %383, %472
  %487 = fmul float %384, %472
  %488 = fmul float %385, %472
  %489 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %490 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
  %491 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %489)
  %492 = extractvalue { i32, i32, i32, i32 } %491, 0
  %493 = bitcast i32 %492 to <2 x bfloat>
  %494 = extractvalue { i32, i32, i32, i32 } %491, 1
  %495 = bitcast i32 %494 to <2 x bfloat>
  %496 = extractvalue { i32, i32, i32, i32 } %491, 2
  %497 = bitcast i32 %496 to <2 x bfloat>
  %498 = extractvalue { i32, i32, i32, i32 } %491, 3
  %499 = bitcast i32 %498 to <2 x bfloat>
  %500 = extractelement <2 x bfloat> %493, i32 0
  %501 = extractelement <2 x bfloat> %493, i32 1
  %502 = extractelement <2 x bfloat> %495, i32 0
  %503 = extractelement <2 x bfloat> %495, i32 1
  %504 = extractelement <2 x bfloat> %497, i32 0
  %505 = extractelement <2 x bfloat> %497, i32 1
  %506 = extractelement <2 x bfloat> %499, i32 0
  %507 = extractelement <2 x bfloat> %499, i32 1
  %508 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %490)
  %509 = extractvalue { i32, i32, i32, i32 } %508, 0
  %510 = bitcast i32 %509 to <2 x bfloat>
  %511 = extractvalue { i32, i32, i32, i32 } %508, 1
  %512 = bitcast i32 %511 to <2 x bfloat>
  %513 = extractvalue { i32, i32, i32, i32 } %508, 2
  %514 = bitcast i32 %513 to <2 x bfloat>
  %515 = extractvalue { i32, i32, i32, i32 } %508, 3
  %516 = bitcast i32 %515 to <2 x bfloat>
  %517 = extractelement <2 x bfloat> %510, i32 0
  %518 = extractelement <2 x bfloat> %510, i32 1
  %519 = extractelement <2 x bfloat> %512, i32 0
  %520 = extractelement <2 x bfloat> %512, i32 1
  %521 = extractelement <2 x bfloat> %514, i32 0
  %522 = extractelement <2 x bfloat> %514, i32 1
  %523 = extractelement <2 x bfloat> %516, i32 0
  %524 = extractelement <2 x bfloat> %516, i32 1
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504)
  %530 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505)
  %531 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %532 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %533 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517)
  %534 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518)
  %535 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519)
  %536 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520)
  %537 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521)
  %538 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522)
  %539 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %523)
  %540 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %524)
  %541 = fmul float %473, %525
  %542 = fmul float %474, %526
  %543 = fmul float %475, %527
  %544 = fmul float %476, %528
  %545 = fmul float %477, %529
  %546 = fmul float %478, %530
  %547 = fmul float %479, %531
  %548 = fmul float %480, %532
  %549 = fmul float %481, %533
  %550 = fmul float %482, %534
  %551 = fmul float %483, %535
  %552 = fmul float %484, %536
  %553 = fmul float %485, %537
  %554 = fmul float %486, %538
  %555 = fmul float %487, %539
  %556 = fmul float %488, %540
  %557 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541)
  %558 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542)
  %559 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543)
  %560 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544)
  %561 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545)
  %562 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546)
  %563 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %547)
  %564 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %548)
  %565 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %549)
  %566 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550)
  %567 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551)
  %568 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552)
  %569 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553)
  %570 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554)
  %571 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555)
  %572 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %556)
  %573 = getelementptr bfloat, ptr addrspace(1) %7, i64 %104
  %574 = getelementptr bfloat, ptr addrspace(1) %573, i64 %48
  %575 = getelementptr bfloat, ptr addrspace(1) %573, i64 %50
  %576 = insertelement <2 x bfloat> undef, bfloat %557, i32 0
  %577 = insertelement <2 x bfloat> %576, bfloat %558, i32 1
  %578 = bitcast <2 x bfloat> %577 to i32
  %579 = insertelement <2 x bfloat> undef, bfloat %559, i32 0
  %580 = insertelement <2 x bfloat> %579, bfloat %560, i32 1
  %581 = bitcast <2 x bfloat> %580 to i32
  %582 = insertelement <2 x bfloat> undef, bfloat %561, i32 0
  %583 = insertelement <2 x bfloat> %582, bfloat %562, i32 1
  %584 = bitcast <2 x bfloat> %583 to i32
  %585 = insertelement <2 x bfloat> undef, bfloat %563, i32 0
  %586 = insertelement <2 x bfloat> %585, bfloat %564, i32 1
  %587 = bitcast <2 x bfloat> %586 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %578, i32 %581, i32 %584, i32 %587, ptr addrspace(1) %574)
  %588 = insertelement <2 x bfloat> undef, bfloat %565, i32 0
  %589 = insertelement <2 x bfloat> %588, bfloat %566, i32 1
  %590 = bitcast <2 x bfloat> %589 to i32
  %591 = insertelement <2 x bfloat> undef, bfloat %567, i32 0
  %592 = insertelement <2 x bfloat> %591, bfloat %568, i32 1
  %593 = bitcast <2 x bfloat> %592 to i32
  %594 = insertelement <2 x bfloat> undef, bfloat %569, i32 0
  %595 = insertelement <2 x bfloat> %594, bfloat %570, i32 1
  %596 = bitcast <2 x bfloat> %595 to i32
  %597 = insertelement <2 x bfloat> undef, bfloat %571, i32 0
  %598 = insertelement <2 x bfloat> %597, bfloat %572, i32 1
  %599 = bitcast <2 x bfloat> %598 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %590, i32 %593, i32 %596, i32 %599, ptr addrspace(1) %575)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_113_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_113(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(1179648) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #6 {
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
  %12 = mul i64 %11, 1024
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
  %42 = xor i32 %40, 4
  %43 = xor i32 %40, 512
  %44 = xor i32 %40, 516
  %45 = add i32 %41, 0
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = add i32 %44, 0
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = getelementptr bfloat, ptr addrspace(1) %13, i64 %49
  %54 = getelementptr bfloat, ptr addrspace(1) %13, i64 %51
  %55 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %53)
  %56 = extractvalue { i32, i32, i32, i32 } %55, 0
  %57 = bitcast i32 %56 to <2 x bfloat>
  %58 = extractvalue { i32, i32, i32, i32 } %55, 1
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractvalue { i32, i32, i32, i32 } %55, 2
  %61 = bitcast i32 %60 to <2 x bfloat>
  %62 = extractvalue { i32, i32, i32, i32 } %55, 3
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractelement <2 x bfloat> %57, i32 0
  %65 = extractelement <2 x bfloat> %57, i32 1
  %66 = extractelement <2 x bfloat> %59, i32 0
  %67 = extractelement <2 x bfloat> %59, i32 1
  %68 = extractelement <2 x bfloat> %61, i32 0
  %69 = extractelement <2 x bfloat> %61, i32 1
  %70 = extractelement <2 x bfloat> %63, i32 0
  %71 = extractelement <2 x bfloat> %63, i32 1
  %72 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %54)
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i32 0
  %82 = extractelement <2 x bfloat> %74, i32 1
  %83 = extractelement <2 x bfloat> %76, i32 0
  %84 = extractelement <2 x bfloat> %76, i32 1
  %85 = extractelement <2 x bfloat> %78, i32 0
  %86 = extractelement <2 x bfloat> %78, i32 1
  %87 = extractelement <2 x bfloat> %80, i32 0
  %88 = extractelement <2 x bfloat> %80, i32 1
  %89 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %64)
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %105 = mul i64 %11, 9216
  %106 = getelementptr bfloat, ptr addrspace(1) %6, i64 %105
  %107 = getelementptr bfloat, ptr addrspace(1) %106, i64 %49
  %108 = getelementptr bfloat, ptr addrspace(1) %106, i64 %51
  %109 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %107)
  %110 = extractvalue { i32, i32, i32, i32 } %109, 0
  %111 = bitcast i32 %110 to <2 x bfloat>
  %112 = extractvalue { i32, i32, i32, i32 } %109, 1
  %113 = bitcast i32 %112 to <2 x bfloat>
  %114 = extractvalue { i32, i32, i32, i32 } %109, 2
  %115 = bitcast i32 %114 to <2 x bfloat>
  %116 = extractvalue { i32, i32, i32, i32 } %109, 3
  %117 = bitcast i32 %116 to <2 x bfloat>
  %118 = extractelement <2 x bfloat> %111, i32 0
  %119 = extractelement <2 x bfloat> %111, i32 1
  %120 = extractelement <2 x bfloat> %113, i32 0
  %121 = extractelement <2 x bfloat> %113, i32 1
  %122 = extractelement <2 x bfloat> %115, i32 0
  %123 = extractelement <2 x bfloat> %115, i32 1
  %124 = extractelement <2 x bfloat> %117, i32 0
  %125 = extractelement <2 x bfloat> %117, i32 1
  %126 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108)
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i32 0
  %136 = extractelement <2 x bfloat> %128, i32 1
  %137 = extractelement <2 x bfloat> %130, i32 0
  %138 = extractelement <2 x bfloat> %130, i32 1
  %139 = extractelement <2 x bfloat> %132, i32 0
  %140 = extractelement <2 x bfloat> %132, i32 1
  %141 = extractelement <2 x bfloat> %134, i32 0
  %142 = extractelement <2 x bfloat> %134, i32 1
  %143 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %118)
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142)
  %159 = getelementptr bfloat, ptr addrspace(1) %7, i64 %12
  %160 = getelementptr bfloat, ptr addrspace(1) %159, i64 %49
  %161 = getelementptr bfloat, ptr addrspace(1) %159, i64 %51
  %162 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %160)
  %163 = extractvalue { i32, i32, i32, i32 } %162, 0
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractvalue { i32, i32, i32, i32 } %162, 1
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %162, 2
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %162, 3
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractelement <2 x bfloat> %164, i32 0
  %172 = extractelement <2 x bfloat> %164, i32 1
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i32 0
  %189 = extractelement <2 x bfloat> %181, i32 1
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171)
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = add i64 %105, 1024
  %213 = getelementptr bfloat, ptr addrspace(1) %6, i64 %212
  %214 = getelementptr bfloat, ptr addrspace(1) %213, i64 %49
  %215 = getelementptr bfloat, ptr addrspace(1) %213, i64 %51
  %216 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %214)
  %217 = extractvalue { i32, i32, i32, i32 } %216, 0
  %218 = bitcast i32 %217 to <2 x bfloat>
  %219 = extractvalue { i32, i32, i32, i32 } %216, 1
  %220 = bitcast i32 %219 to <2 x bfloat>
  %221 = extractvalue { i32, i32, i32, i32 } %216, 2
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractvalue { i32, i32, i32, i32 } %216, 3
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractelement <2 x bfloat> %218, i32 0
  %226 = extractelement <2 x bfloat> %218, i32 1
  %227 = extractelement <2 x bfloat> %220, i32 0
  %228 = extractelement <2 x bfloat> %220, i32 1
  %229 = extractelement <2 x bfloat> %222, i32 0
  %230 = extractelement <2 x bfloat> %222, i32 1
  %231 = extractelement <2 x bfloat> %224, i32 0
  %232 = extractelement <2 x bfloat> %224, i32 1
  %233 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %215)
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %233, 1
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %233, 2
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %233, 3
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractelement <2 x bfloat> %235, i32 0
  %243 = extractelement <2 x bfloat> %235, i32 1
  %244 = extractelement <2 x bfloat> %237, i32 0
  %245 = extractelement <2 x bfloat> %237, i32 1
  %246 = extractelement <2 x bfloat> %239, i32 0
  %247 = extractelement <2 x bfloat> %239, i32 1
  %248 = extractelement <2 x bfloat> %241, i32 0
  %249 = extractelement <2 x bfloat> %241, i32 1
  %250 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %225)
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %266 = getelementptr bfloat, ptr addrspace(1) %5, i64 %12
  %267 = getelementptr bfloat, ptr addrspace(1) %266, i64 %49
  %268 = getelementptr bfloat, ptr addrspace(1) %266, i64 %51
  %269 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %267)
  %270 = extractvalue { i32, i32, i32, i32 } %269, 0
  %271 = bitcast i32 %270 to <2 x bfloat>
  %272 = extractvalue { i32, i32, i32, i32 } %269, 1
  %273 = bitcast i32 %272 to <2 x bfloat>
  %274 = extractvalue { i32, i32, i32, i32 } %269, 2
  %275 = bitcast i32 %274 to <2 x bfloat>
  %276 = extractvalue { i32, i32, i32, i32 } %269, 3
  %277 = bitcast i32 %276 to <2 x bfloat>
  %278 = extractelement <2 x bfloat> %271, i32 0
  %279 = extractelement <2 x bfloat> %271, i32 1
  %280 = extractelement <2 x bfloat> %273, i32 0
  %281 = extractelement <2 x bfloat> %273, i32 1
  %282 = extractelement <2 x bfloat> %275, i32 0
  %283 = extractelement <2 x bfloat> %275, i32 1
  %284 = extractelement <2 x bfloat> %277, i32 0
  %285 = extractelement <2 x bfloat> %277, i32 1
  %286 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %268)
  %287 = extractvalue { i32, i32, i32, i32 } %286, 0
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %286, 1
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %286, 2
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %286, 3
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractelement <2 x bfloat> %288, i32 0
  %296 = extractelement <2 x bfloat> %288, i32 1
  %297 = extractelement <2 x bfloat> %290, i32 0
  %298 = extractelement <2 x bfloat> %290, i32 1
  %299 = extractelement <2 x bfloat> %292, i32 0
  %300 = extractelement <2 x bfloat> %292, i32 1
  %301 = extractelement <2 x bfloat> %294, i32 0
  %302 = extractelement <2 x bfloat> %294, i32 1
  %303 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %278)
  %304 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %279)
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = getelementptr float, ptr addrspace(1) %4, i64 %12
  %320 = getelementptr float, ptr addrspace(1) %319, i64 %49
  %321 = getelementptr float, ptr addrspace(1) %319, i64 %50
  %322 = getelementptr float, ptr addrspace(1) %319, i64 %51
  %323 = getelementptr float, ptr addrspace(1) %319, i64 %52
  %324 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %320)
  %325 = extractvalue { i32, i32, i32, i32 } %324, 0
  %326 = bitcast i32 %325 to <1 x float>
  %327 = extractvalue { i32, i32, i32, i32 } %324, 1
  %328 = bitcast i32 %327 to <1 x float>
  %329 = extractvalue { i32, i32, i32, i32 } %324, 2
  %330 = bitcast i32 %329 to <1 x float>
  %331 = extractvalue { i32, i32, i32, i32 } %324, 3
  %332 = bitcast i32 %331 to <1 x float>
  %333 = extractelement <1 x float> %326, i32 0
  %334 = extractelement <1 x float> %328, i32 0
  %335 = extractelement <1 x float> %330, i32 0
  %336 = extractelement <1 x float> %332, i32 0
  %337 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %321)
  %338 = extractvalue { i32, i32, i32, i32 } %337, 0
  %339 = bitcast i32 %338 to <1 x float>
  %340 = extractvalue { i32, i32, i32, i32 } %337, 1
  %341 = bitcast i32 %340 to <1 x float>
  %342 = extractvalue { i32, i32, i32, i32 } %337, 2
  %343 = bitcast i32 %342 to <1 x float>
  %344 = extractvalue { i32, i32, i32, i32 } %337, 3
  %345 = bitcast i32 %344 to <1 x float>
  %346 = extractelement <1 x float> %339, i32 0
  %347 = extractelement <1 x float> %341, i32 0
  %348 = extractelement <1 x float> %343, i32 0
  %349 = extractelement <1 x float> %345, i32 0
  %350 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %322)
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = bitcast i32 %351 to <1 x float>
  %353 = extractvalue { i32, i32, i32, i32 } %350, 1
  %354 = bitcast i32 %353 to <1 x float>
  %355 = extractvalue { i32, i32, i32, i32 } %350, 2
  %356 = bitcast i32 %355 to <1 x float>
  %357 = extractvalue { i32, i32, i32, i32 } %350, 3
  %358 = bitcast i32 %357 to <1 x float>
  %359 = extractelement <1 x float> %352, i32 0
  %360 = extractelement <1 x float> %354, i32 0
  %361 = extractelement <1 x float> %356, i32 0
  %362 = extractelement <1 x float> %358, i32 0
  %363 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %323)
  %364 = extractvalue { i32, i32, i32, i32 } %363, 0
  %365 = bitcast i32 %364 to <1 x float>
  %366 = extractvalue { i32, i32, i32, i32 } %363, 1
  %367 = bitcast i32 %366 to <1 x float>
  %368 = extractvalue { i32, i32, i32, i32 } %363, 2
  %369 = bitcast i32 %368 to <1 x float>
  %370 = extractvalue { i32, i32, i32, i32 } %363, 3
  %371 = bitcast i32 %370 to <1 x float>
  %372 = extractelement <1 x float> %365, i32 0
  %373 = extractelement <1 x float> %367, i32 0
  %374 = extractelement <1 x float> %369, i32 0
  %375 = extractelement <1 x float> %371, i32 0
  %376 = fadd float %303, %333
  %377 = fadd float %304, %334
  %378 = fadd float %305, %335
  %379 = fadd float %306, %336
  %380 = fadd float %307, %346
  %381 = fadd float %308, %347
  %382 = fadd float %309, %348
  %383 = fadd float %310, %349
  %384 = fadd float %311, %359
  %385 = fadd float %312, %360
  %386 = fadd float %313, %361
  %387 = fadd float %314, %362
  %388 = fadd float %315, %372
  %389 = fadd float %316, %373
  %390 = fadd float %317, %374
  %391 = fadd float %318, %375
  %392 = fadd float %250, %376
  %393 = fadd float %251, %377
  %394 = fadd float %252, %378
  %395 = fadd float %253, %379
  %396 = fadd float %254, %380
  %397 = fadd float %255, %381
  %398 = fadd float %256, %382
  %399 = fadd float %257, %383
  %400 = fadd float %258, %384
  %401 = fadd float %259, %385
  %402 = fadd float %260, %386
  %403 = fadd float %261, %387
  %404 = fadd float %262, %388
  %405 = fadd float %263, %389
  %406 = fadd float %264, %390
  %407 = fadd float %265, %391
  %408 = fadd float %196, %392
  %409 = fadd float %197, %393
  %410 = fadd float %198, %394
  %411 = fadd float %199, %395
  %412 = fadd float %200, %396
  %413 = fadd float %201, %397
  %414 = fadd float %202, %398
  %415 = fadd float %203, %399
  %416 = fadd float %204, %400
  %417 = fadd float %205, %401
  %418 = fadd float %206, %402
  %419 = fadd float %207, %403
  %420 = fadd float %208, %404
  %421 = fadd float %209, %405
  %422 = fadd float %210, %406
  %423 = fadd float %211, %407
  %424 = fadd float %143, %408
  %425 = fadd float %144, %409
  %426 = fadd float %145, %410
  %427 = fadd float %146, %411
  %428 = fadd float %147, %412
  %429 = fadd float %148, %413
  %430 = fadd float %149, %414
  %431 = fadd float %150, %415
  %432 = fadd float %151, %416
  %433 = fadd float %152, %417
  %434 = fadd float %153, %418
  %435 = fadd float %154, %419
  %436 = fadd float %155, %420
  %437 = fadd float %156, %421
  %438 = fadd float %157, %422
  %439 = fadd float %158, %423
  %440 = fadd float %89, %424
  %441 = fadd float %90, %425
  %442 = fadd float %91, %426
  %443 = fadd float %92, %427
  %444 = fadd float %93, %428
  %445 = fadd float %94, %429
  %446 = fadd float %95, %430
  %447 = fadd float %96, %431
  %448 = fadd float %97, %432
  %449 = fadd float %98, %433
  %450 = fadd float %99, %434
  %451 = fadd float %100, %435
  %452 = fadd float %101, %436
  %453 = fadd float %102, %437
  %454 = fadd float %103, %438
  %455 = fadd float %104, %439
  %456 = fmul float %440, %440
  %457 = fmul float %441, %441
  %458 = fmul float %442, %442
  %459 = fmul float %443, %443
  %460 = fmul float %444, %444
  %461 = fmul float %445, %445
  %462 = fmul float %446, %446
  %463 = fmul float %447, %447
  %464 = fmul float %448, %448
  %465 = fmul float %449, %449
  %466 = fmul float %450, %450
  %467 = fmul float %451, %451
  %468 = fmul float %452, %452
  %469 = fmul float %453, %453
  %470 = fmul float %454, %454
  %471 = fmul float %455, %455
  %472 = fadd float %456, %457
  %473 = fadd float %472, %458
  %474 = fadd float %473, %459
  %475 = fadd float %474, %460
  %476 = fadd float %475, %461
  %477 = fadd float %476, %462
  %478 = fadd float %477, %463
  %479 = fadd float %478, %464
  %480 = fadd float %479, %465
  %481 = fadd float %480, %466
  %482 = fadd float %481, %467
  %483 = fadd float %482, %468
  %484 = fadd float %483, %469
  %485 = fadd float %484, %470
  %486 = fadd float %485, %471
  %487 = bitcast float %486 to i32
  %488 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %487, i32 16, i32 31)
  %489 = bitcast i32 %488 to float
  %490 = fadd float %486, %489
  %491 = bitcast float %490 to i32
  %492 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %491, i32 8, i32 31)
  %493 = bitcast i32 %492 to float
  %494 = fadd float %490, %493
  %495 = bitcast float %494 to i32
  %496 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %495, i32 4, i32 31)
  %497 = bitcast i32 %496 to float
  %498 = fadd float %494, %497
  %499 = bitcast float %498 to i32
  %500 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %499, i32 2, i32 31)
  %501 = bitcast i32 %500 to float
  %502 = fadd float %498, %501
  %503 = bitcast float %502 to i32
  %504 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %503, i32 1, i32 31)
  %505 = bitcast i32 %504 to float
  %506 = fadd float %502, %505
  %507 = urem i32 %15, 32
  %508 = urem i32 %16, 2
  %509 = icmp eq i32 %507, 0
  %510 = and i1 true, %509
  %511 = add i32 0, %508
  %512 = getelementptr float, ptr addrspace(3) @global_smem, i32 %511
  %513 = insertelement <1 x float> undef, float %506, i32 0
  %514 = extractelement <1 x float> %513, i32 0
  %515 = bitcast float %514 to i32
  %516 = insertelement <1 x i32> undef, i32 %515, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %512, <1 x i32> %516, i1 %510)
  call void @llvm.nvvm.barrier0()
  %517 = icmp slt i32 %14, 2
  %518 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %519 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %518, i1 %517)
  %520 = insertelement <1 x i32> undef, i32 %519, i32 0
  %521 = extractelement <1 x i32> %520, i32 0
  %522 = bitcast i32 %521 to float
  %523 = insertelement <1 x float> undef, float %522, i32 0
  %524 = extractelement <1 x float> %523, i32 0
  %525 = bitcast float %524 to i32
  %526 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %525, i32 1, i32 31)
  %527 = bitcast i32 %526 to float
  %528 = fadd float %524, %527
  %529 = urem i32 %15, 2
  %530 = icmp eq i32 %529, 0
  %531 = and i1 %517, %530
  %532 = insertelement <1 x float> undef, float %528, i32 0
  %533 = extractelement <1 x float> %532, i32 0
  %534 = bitcast float %533 to i32
  %535 = insertelement <1 x i32> undef, i32 %534, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %518, <1 x i32> %535, i1 %531)
  call void @llvm.nvvm.barrier0()
  %536 = load float, ptr addrspace(3) @global_smem, align 4
  %537 = fmul float %536, 0x3F50000000000000
  %538 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %539 = bitcast i32 %538 to <1 x float>
  %540 = extractelement <1 x float> %539, i32 0
  %541 = fadd float %537, %540
  %542 = call float @__nv_rsqrtf(float %541)
  %543 = fmul float %440, %542
  %544 = fmul float %441, %542
  %545 = fmul float %442, %542
  %546 = fmul float %443, %542
  %547 = fmul float %444, %542
  %548 = fmul float %445, %542
  %549 = fmul float %446, %542
  %550 = fmul float %447, %542
  %551 = fmul float %448, %542
  %552 = fmul float %449, %542
  %553 = fmul float %450, %542
  %554 = fmul float %451, %542
  %555 = fmul float %452, %542
  %556 = fmul float %453, %542
  %557 = fmul float %454, %542
  %558 = fmul float %455, %542
  %559 = getelementptr bfloat, ptr addrspace(1) %3, i64 %49
  %560 = getelementptr bfloat, ptr addrspace(1) %3, i64 %51
  %561 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %559)
  %562 = extractvalue { i32, i32, i32, i32 } %561, 0
  %563 = bitcast i32 %562 to <2 x bfloat>
  %564 = extractvalue { i32, i32, i32, i32 } %561, 1
  %565 = bitcast i32 %564 to <2 x bfloat>
  %566 = extractvalue { i32, i32, i32, i32 } %561, 2
  %567 = bitcast i32 %566 to <2 x bfloat>
  %568 = extractvalue { i32, i32, i32, i32 } %561, 3
  %569 = bitcast i32 %568 to <2 x bfloat>
  %570 = extractelement <2 x bfloat> %563, i32 0
  %571 = extractelement <2 x bfloat> %563, i32 1
  %572 = extractelement <2 x bfloat> %565, i32 0
  %573 = extractelement <2 x bfloat> %565, i32 1
  %574 = extractelement <2 x bfloat> %567, i32 0
  %575 = extractelement <2 x bfloat> %567, i32 1
  %576 = extractelement <2 x bfloat> %569, i32 0
  %577 = extractelement <2 x bfloat> %569, i32 1
  %578 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560)
  %579 = extractvalue { i32, i32, i32, i32 } %578, 0
  %580 = bitcast i32 %579 to <2 x bfloat>
  %581 = extractvalue { i32, i32, i32, i32 } %578, 1
  %582 = bitcast i32 %581 to <2 x bfloat>
  %583 = extractvalue { i32, i32, i32, i32 } %578, 2
  %584 = bitcast i32 %583 to <2 x bfloat>
  %585 = extractvalue { i32, i32, i32, i32 } %578, 3
  %586 = bitcast i32 %585 to <2 x bfloat>
  %587 = extractelement <2 x bfloat> %580, i32 0
  %588 = extractelement <2 x bfloat> %580, i32 1
  %589 = extractelement <2 x bfloat> %582, i32 0
  %590 = extractelement <2 x bfloat> %582, i32 1
  %591 = extractelement <2 x bfloat> %584, i32 0
  %592 = extractelement <2 x bfloat> %584, i32 1
  %593 = extractelement <2 x bfloat> %586, i32 0
  %594 = extractelement <2 x bfloat> %586, i32 1
  %595 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %570)
  %596 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571)
  %597 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572)
  %598 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573)
  %599 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574)
  %600 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575)
  %601 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576)
  %602 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577)
  %603 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %587)
  %604 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588)
  %605 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589)
  %606 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590)
  %607 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591)
  %608 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592)
  %609 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593)
  %610 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594)
  %611 = fmul float %543, %595
  %612 = fmul float %544, %596
  %613 = fmul float %545, %597
  %614 = fmul float %546, %598
  %615 = fmul float %547, %599
  %616 = fmul float %548, %600
  %617 = fmul float %549, %601
  %618 = fmul float %550, %602
  %619 = fmul float %551, %603
  %620 = fmul float %552, %604
  %621 = fmul float %553, %605
  %622 = fmul float %554, %606
  %623 = fmul float %555, %607
  %624 = fmul float %556, %608
  %625 = fmul float %557, %609
  %626 = fmul float %558, %610
  %627 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %611)
  %628 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612)
  %629 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613)
  %630 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614)
  %631 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615)
  %632 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616)
  %633 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617)
  %634 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618)
  %635 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619)
  %636 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620)
  %637 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621)
  %638 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622)
  %639 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623)
  %640 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624)
  %641 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625)
  %642 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626)
  %643 = getelementptr bfloat, ptr addrspace(1) %8, i64 %12
  %644 = getelementptr bfloat, ptr addrspace(1) %643, i64 %49
  %645 = getelementptr bfloat, ptr addrspace(1) %643, i64 %51
  %646 = insertelement <2 x bfloat> undef, bfloat %627, i32 0
  %647 = insertelement <2 x bfloat> %646, bfloat %628, i32 1
  %648 = bitcast <2 x bfloat> %647 to i32
  %649 = insertelement <2 x bfloat> undef, bfloat %629, i32 0
  %650 = insertelement <2 x bfloat> %649, bfloat %630, i32 1
  %651 = bitcast <2 x bfloat> %650 to i32
  %652 = insertelement <2 x bfloat> undef, bfloat %631, i32 0
  %653 = insertelement <2 x bfloat> %652, bfloat %632, i32 1
  %654 = bitcast <2 x bfloat> %653 to i32
  %655 = insertelement <2 x bfloat> undef, bfloat %633, i32 0
  %656 = insertelement <2 x bfloat> %655, bfloat %634, i32 1
  %657 = bitcast <2 x bfloat> %656 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %648, i32 %651, i32 %654, i32 %657, ptr addrspace(1) %644)
  %658 = insertelement <2 x bfloat> undef, bfloat %635, i32 0
  %659 = insertelement <2 x bfloat> %658, bfloat %636, i32 1
  %660 = bitcast <2 x bfloat> %659 to i32
  %661 = insertelement <2 x bfloat> undef, bfloat %637, i32 0
  %662 = insertelement <2 x bfloat> %661, bfloat %638, i32 1
  %663 = bitcast <2 x bfloat> %662 to i32
  %664 = insertelement <2 x bfloat> undef, bfloat %639, i32 0
  %665 = insertelement <2 x bfloat> %664, bfloat %640, i32 1
  %666 = bitcast <2 x bfloat> %665 to i32
  %667 = insertelement <2 x bfloat> undef, bfloat %641, i32 0
  %668 = insertelement <2 x bfloat> %667, bfloat %642, i32 1
  %669 = bitcast <2 x bfloat> %668 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %660, i32 %663, i32 %666, i32 %669, ptr addrspace(1) %645)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @wrapped_slice(ptr noalias align 128 dereferenceable(524288) %0, ptr noalias align 128 dereferenceable(131072) %1) #0 {
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

declare ptx_kernel void @triton_softmax_11_0_impl(ptr, ptr, ptr, ptr) #4

define ptx_kernel void @triton_softmax_11_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2) #6 {
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

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 128 dereferenceable(262144) %0, ptr noalias align 16 dereferenceable(256) %1, ptr noalias align 16 dereferenceable(10485760) %2, ptr noalias align 16 dereferenceable(256) %3, ptr noalias align 128 dereferenceable(131072) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %21 = call float @fused_concatenate_convert_613_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_613_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_613_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_613_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_613_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
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
!2 = !{i32 0, i32 512}
!3 = !{}
!4 = !{i32 0, i32 36864}
!5 = !{i32 0, i32 1536}
!6 = !{i32 0, i32 256}
!7 = !{i32 0, i32 135456}

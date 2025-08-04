; ModuleID = 'SyncTensorsGraph.737'
source_filename = "SyncTensorsGraph.737"
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 16 dereferenceable(4194304) %5, ptr noalias align 16 dereferenceable(4194304) %6, ptr noalias align 16 dereferenceable(4194304) %7, ptr noalias align 128 dereferenceable(33554432) %8) #0 {
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %12 = udiv i32 %11, 4
  %13 = icmp ult i32 %12, 4096
  %14 = mul i32 %10, 4
  %15 = mul i32 %11, 512
  %16 = add i32 %14, %15
  br i1 %13, label %17, label %62

17:                                               ; preds = %9
  %18 = icmp ult i32 %12, 2048
  br i1 %18, label %19, label %36

19:                                               ; preds = %17
  %20 = icmp ult i32 %12, 1024
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = getelementptr inbounds bfloat, ptr %0, i32 %16
  %23 = load bfloat, ptr %22, align 2, !invariant.load !2
  br label %33

24:                                               ; preds = %19
  %25 = sub i32 %12, 1024
  %26 = urem i32 %11, 4
  %27 = mul i32 %26, 512
  %28 = add i32 %27, %14
  %29 = mul i32 %25, 2048
  %30 = add i32 %28, %29
  %31 = getelementptr inbounds bfloat, ptr %1, i32 %30
  %32 = load bfloat, ptr %31, align 2, !invariant.load !2
  br label %33

33:                                               ; preds = %21, %24
  %34 = phi bfloat [ %32, %24 ], [ %23, %21 ]
  br label %35

35:                                               ; preds = %33
  br label %59

36:                                               ; preds = %17
  %37 = icmp ult i32 %12, 3072
  br i1 %37, label %38, label %47

38:                                               ; preds = %36
  %39 = sub i32 %12, 2048
  %40 = urem i32 %11, 4
  %41 = mul i32 %40, 512
  %42 = add i32 %41, %14
  %43 = mul i32 %39, 2048
  %44 = add i32 %42, %43
  %45 = getelementptr inbounds bfloat, ptr %2, i32 %44
  %46 = load bfloat, ptr %45, align 2, !invariant.load !2
  br label %56

47:                                               ; preds = %36
  %48 = sub i32 %12, 3072
  %49 = urem i32 %11, 4
  %50 = mul i32 %49, 512
  %51 = add i32 %50, %14
  %52 = mul i32 %48, 2048
  %53 = add i32 %51, %52
  %54 = getelementptr inbounds bfloat, ptr %3, i32 %53
  %55 = load bfloat, ptr %54, align 2, !invariant.load !2
  br label %56

56:                                               ; preds = %38, %47
  %57 = phi bfloat [ %55, %47 ], [ %46, %38 ]
  br label %58

58:                                               ; preds = %56
  br label %59

59:                                               ; preds = %35, %58
  %60 = phi bfloat [ %57, %58 ], [ %34, %35 ]
  br label %61

61:                                               ; preds = %59
  br label %113

62:                                               ; preds = %9
  %63 = icmp ult i32 %12, 6144
  br i1 %63, label %64, label %87

64:                                               ; preds = %62
  %65 = icmp ult i32 %12, 5120
  br i1 %65, label %66, label %75

66:                                               ; preds = %64
  %67 = sub i32 %12, 4096
  %68 = urem i32 %11, 4
  %69 = mul i32 %68, 512
  %70 = add i32 %69, %14
  %71 = mul i32 %67, 2048
  %72 = add i32 %70, %71
  %73 = getelementptr inbounds bfloat, ptr %4, i32 %72
  %74 = load bfloat, ptr %73, align 2, !invariant.load !2
  br label %84

75:                                               ; preds = %64
  %76 = sub i32 %12, 5120
  %77 = urem i32 %11, 4
  %78 = mul i32 %77, 512
  %79 = add i32 %78, %14
  %80 = mul i32 %76, 2048
  %81 = add i32 %79, %80
  %82 = getelementptr inbounds bfloat, ptr %5, i32 %81
  %83 = load bfloat, ptr %82, align 2, !invariant.load !2
  br label %84

84:                                               ; preds = %66, %75
  %85 = phi bfloat [ %83, %75 ], [ %74, %66 ]
  br label %86

86:                                               ; preds = %84
  br label %110

87:                                               ; preds = %62
  %88 = icmp ult i32 %12, 7168
  br i1 %88, label %89, label %98

89:                                               ; preds = %87
  %90 = sub i32 %12, 6144
  %91 = urem i32 %11, 4
  %92 = mul i32 %91, 512
  %93 = add i32 %92, %14
  %94 = mul i32 %90, 2048
  %95 = add i32 %93, %94
  %96 = getelementptr inbounds bfloat, ptr %6, i32 %95
  %97 = load bfloat, ptr %96, align 2, !invariant.load !2
  br label %107

98:                                               ; preds = %87
  %99 = sub i32 %12, 7168
  %100 = urem i32 %11, 4
  %101 = mul i32 %100, 512
  %102 = add i32 %101, %14
  %103 = mul i32 %99, 2048
  %104 = add i32 %102, %103
  %105 = getelementptr inbounds bfloat, ptr %7, i32 %104
  %106 = load bfloat, ptr %105, align 2, !invariant.load !2
  br label %107

107:                                              ; preds = %89, %98
  %108 = phi bfloat [ %106, %98 ], [ %97, %89 ]
  br label %109

109:                                              ; preds = %107
  br label %110

110:                                              ; preds = %86, %109
  %111 = phi bfloat [ %108, %109 ], [ %85, %86 ]
  br label %112

112:                                              ; preds = %110
  br label %113

113:                                              ; preds = %61, %112
  %114 = phi bfloat [ %111, %112 ], [ %60, %61 ]
  br label %115

115:                                              ; preds = %113
  %116 = insertelement <4 x bfloat> zeroinitializer, bfloat %114, i64 0
  br i1 %13, label %117, label %166

117:                                              ; preds = %115
  %118 = icmp ult i32 %12, 2048
  br i1 %118, label %119, label %138

119:                                              ; preds = %117
  %120 = icmp ult i32 %12, 1024
  br i1 %120, label %121, label %125

121:                                              ; preds = %119
  %122 = add i32 %16, 1
  %123 = getelementptr inbounds bfloat, ptr %0, i32 %122
  %124 = load bfloat, ptr %123, align 2, !invariant.load !2
  br label %135

125:                                              ; preds = %119
  %126 = sub i32 %12, 1024
  %127 = urem i32 %11, 4
  %128 = mul i32 %127, 512
  %129 = add i32 %128, %14
  %130 = mul i32 %126, 2048
  %131 = add i32 %129, %130
  %132 = add i32 %131, 1
  %133 = getelementptr inbounds bfloat, ptr %1, i32 %132
  %134 = load bfloat, ptr %133, align 2, !invariant.load !2
  br label %135

135:                                              ; preds = %121, %125
  %136 = phi bfloat [ %134, %125 ], [ %124, %121 ]
  br label %137

137:                                              ; preds = %135
  br label %163

138:                                              ; preds = %117
  %139 = icmp ult i32 %12, 3072
  br i1 %139, label %140, label %150

140:                                              ; preds = %138
  %141 = sub i32 %12, 2048
  %142 = urem i32 %11, 4
  %143 = mul i32 %142, 512
  %144 = add i32 %143, %14
  %145 = mul i32 %141, 2048
  %146 = add i32 %144, %145
  %147 = add i32 %146, 1
  %148 = getelementptr inbounds bfloat, ptr %2, i32 %147
  %149 = load bfloat, ptr %148, align 2, !invariant.load !2
  br label %160

150:                                              ; preds = %138
  %151 = sub i32 %12, 3072
  %152 = urem i32 %11, 4
  %153 = mul i32 %152, 512
  %154 = add i32 %153, %14
  %155 = mul i32 %151, 2048
  %156 = add i32 %154, %155
  %157 = add i32 %156, 1
  %158 = getelementptr inbounds bfloat, ptr %3, i32 %157
  %159 = load bfloat, ptr %158, align 2, !invariant.load !2
  br label %160

160:                                              ; preds = %140, %150
  %161 = phi bfloat [ %159, %150 ], [ %149, %140 ]
  br label %162

162:                                              ; preds = %160
  br label %163

163:                                              ; preds = %137, %162
  %164 = phi bfloat [ %161, %162 ], [ %136, %137 ]
  br label %165

165:                                              ; preds = %163
  br label %221

166:                                              ; preds = %115
  %167 = icmp ult i32 %12, 6144
  br i1 %167, label %168, label %193

168:                                              ; preds = %166
  %169 = icmp ult i32 %12, 5120
  br i1 %169, label %170, label %180

170:                                              ; preds = %168
  %171 = sub i32 %12, 4096
  %172 = urem i32 %11, 4
  %173 = mul i32 %172, 512
  %174 = add i32 %173, %14
  %175 = mul i32 %171, 2048
  %176 = add i32 %174, %175
  %177 = add i32 %176, 1
  %178 = getelementptr inbounds bfloat, ptr %4, i32 %177
  %179 = load bfloat, ptr %178, align 2, !invariant.load !2
  br label %190

180:                                              ; preds = %168
  %181 = sub i32 %12, 5120
  %182 = urem i32 %11, 4
  %183 = mul i32 %182, 512
  %184 = add i32 %183, %14
  %185 = mul i32 %181, 2048
  %186 = add i32 %184, %185
  %187 = add i32 %186, 1
  %188 = getelementptr inbounds bfloat, ptr %5, i32 %187
  %189 = load bfloat, ptr %188, align 2, !invariant.load !2
  br label %190

190:                                              ; preds = %170, %180
  %191 = phi bfloat [ %189, %180 ], [ %179, %170 ]
  br label %192

192:                                              ; preds = %190
  br label %218

193:                                              ; preds = %166
  %194 = icmp ult i32 %12, 7168
  br i1 %194, label %195, label %205

195:                                              ; preds = %193
  %196 = sub i32 %12, 6144
  %197 = urem i32 %11, 4
  %198 = mul i32 %197, 512
  %199 = add i32 %198, %14
  %200 = mul i32 %196, 2048
  %201 = add i32 %199, %200
  %202 = add i32 %201, 1
  %203 = getelementptr inbounds bfloat, ptr %6, i32 %202
  %204 = load bfloat, ptr %203, align 2, !invariant.load !2
  br label %215

205:                                              ; preds = %193
  %206 = sub i32 %12, 7168
  %207 = urem i32 %11, 4
  %208 = mul i32 %207, 512
  %209 = add i32 %208, %14
  %210 = mul i32 %206, 2048
  %211 = add i32 %209, %210
  %212 = add i32 %211, 1
  %213 = getelementptr inbounds bfloat, ptr %7, i32 %212
  %214 = load bfloat, ptr %213, align 2, !invariant.load !2
  br label %215

215:                                              ; preds = %195, %205
  %216 = phi bfloat [ %214, %205 ], [ %204, %195 ]
  br label %217

217:                                              ; preds = %215
  br label %218

218:                                              ; preds = %192, %217
  %219 = phi bfloat [ %216, %217 ], [ %191, %192 ]
  br label %220

220:                                              ; preds = %218
  br label %221

221:                                              ; preds = %165, %220
  %222 = phi bfloat [ %219, %220 ], [ %164, %165 ]
  br label %223

223:                                              ; preds = %221
  %224 = insertelement <4 x bfloat> %116, bfloat %222, i64 1
  br i1 %13, label %225, label %274

225:                                              ; preds = %223
  %226 = icmp ult i32 %12, 2048
  br i1 %226, label %227, label %246

227:                                              ; preds = %225
  %228 = icmp ult i32 %12, 1024
  br i1 %228, label %229, label %233

229:                                              ; preds = %227
  %230 = add i32 %16, 2
  %231 = getelementptr inbounds bfloat, ptr %0, i32 %230
  %232 = load bfloat, ptr %231, align 2, !invariant.load !2
  br label %243

233:                                              ; preds = %227
  %234 = sub i32 %12, 1024
  %235 = urem i32 %11, 4
  %236 = mul i32 %235, 512
  %237 = add i32 %236, %14
  %238 = mul i32 %234, 2048
  %239 = add i32 %237, %238
  %240 = add i32 %239, 2
  %241 = getelementptr inbounds bfloat, ptr %1, i32 %240
  %242 = load bfloat, ptr %241, align 2, !invariant.load !2
  br label %243

243:                                              ; preds = %229, %233
  %244 = phi bfloat [ %242, %233 ], [ %232, %229 ]
  br label %245

245:                                              ; preds = %243
  br label %271

246:                                              ; preds = %225
  %247 = icmp ult i32 %12, 3072
  br i1 %247, label %248, label %258

248:                                              ; preds = %246
  %249 = sub i32 %12, 2048
  %250 = urem i32 %11, 4
  %251 = mul i32 %250, 512
  %252 = add i32 %251, %14
  %253 = mul i32 %249, 2048
  %254 = add i32 %252, %253
  %255 = add i32 %254, 2
  %256 = getelementptr inbounds bfloat, ptr %2, i32 %255
  %257 = load bfloat, ptr %256, align 2, !invariant.load !2
  br label %268

258:                                              ; preds = %246
  %259 = sub i32 %12, 3072
  %260 = urem i32 %11, 4
  %261 = mul i32 %260, 512
  %262 = add i32 %261, %14
  %263 = mul i32 %259, 2048
  %264 = add i32 %262, %263
  %265 = add i32 %264, 2
  %266 = getelementptr inbounds bfloat, ptr %3, i32 %265
  %267 = load bfloat, ptr %266, align 2, !invariant.load !2
  br label %268

268:                                              ; preds = %248, %258
  %269 = phi bfloat [ %267, %258 ], [ %257, %248 ]
  br label %270

270:                                              ; preds = %268
  br label %271

271:                                              ; preds = %245, %270
  %272 = phi bfloat [ %269, %270 ], [ %244, %245 ]
  br label %273

273:                                              ; preds = %271
  br label %329

274:                                              ; preds = %223
  %275 = icmp ult i32 %12, 6144
  br i1 %275, label %276, label %301

276:                                              ; preds = %274
  %277 = icmp ult i32 %12, 5120
  br i1 %277, label %278, label %288

278:                                              ; preds = %276
  %279 = sub i32 %12, 4096
  %280 = urem i32 %11, 4
  %281 = mul i32 %280, 512
  %282 = add i32 %281, %14
  %283 = mul i32 %279, 2048
  %284 = add i32 %282, %283
  %285 = add i32 %284, 2
  %286 = getelementptr inbounds bfloat, ptr %4, i32 %285
  %287 = load bfloat, ptr %286, align 2, !invariant.load !2
  br label %298

288:                                              ; preds = %276
  %289 = sub i32 %12, 5120
  %290 = urem i32 %11, 4
  %291 = mul i32 %290, 512
  %292 = add i32 %291, %14
  %293 = mul i32 %289, 2048
  %294 = add i32 %292, %293
  %295 = add i32 %294, 2
  %296 = getelementptr inbounds bfloat, ptr %5, i32 %295
  %297 = load bfloat, ptr %296, align 2, !invariant.load !2
  br label %298

298:                                              ; preds = %278, %288
  %299 = phi bfloat [ %297, %288 ], [ %287, %278 ]
  br label %300

300:                                              ; preds = %298
  br label %326

301:                                              ; preds = %274
  %302 = icmp ult i32 %12, 7168
  br i1 %302, label %303, label %313

303:                                              ; preds = %301
  %304 = sub i32 %12, 6144
  %305 = urem i32 %11, 4
  %306 = mul i32 %305, 512
  %307 = add i32 %306, %14
  %308 = mul i32 %304, 2048
  %309 = add i32 %307, %308
  %310 = add i32 %309, 2
  %311 = getelementptr inbounds bfloat, ptr %6, i32 %310
  %312 = load bfloat, ptr %311, align 2, !invariant.load !2
  br label %323

313:                                              ; preds = %301
  %314 = sub i32 %12, 7168
  %315 = urem i32 %11, 4
  %316 = mul i32 %315, 512
  %317 = add i32 %316, %14
  %318 = mul i32 %314, 2048
  %319 = add i32 %317, %318
  %320 = add i32 %319, 2
  %321 = getelementptr inbounds bfloat, ptr %7, i32 %320
  %322 = load bfloat, ptr %321, align 2, !invariant.load !2
  br label %323

323:                                              ; preds = %303, %313
  %324 = phi bfloat [ %322, %313 ], [ %312, %303 ]
  br label %325

325:                                              ; preds = %323
  br label %326

326:                                              ; preds = %300, %325
  %327 = phi bfloat [ %324, %325 ], [ %299, %300 ]
  br label %328

328:                                              ; preds = %326
  br label %329

329:                                              ; preds = %273, %328
  %330 = phi bfloat [ %327, %328 ], [ %272, %273 ]
  br label %331

331:                                              ; preds = %329
  %332 = insertelement <4 x bfloat> %224, bfloat %330, i64 2
  br i1 %13, label %333, label %382

333:                                              ; preds = %331
  %334 = icmp ult i32 %12, 2048
  br i1 %334, label %335, label %354

335:                                              ; preds = %333
  %336 = icmp ult i32 %12, 1024
  br i1 %336, label %337, label %341

337:                                              ; preds = %335
  %338 = add i32 %16, 3
  %339 = getelementptr inbounds bfloat, ptr %0, i32 %338
  %340 = load bfloat, ptr %339, align 2, !invariant.load !2
  br label %351

341:                                              ; preds = %335
  %342 = sub i32 %12, 1024
  %343 = urem i32 %11, 4
  %344 = mul i32 %343, 512
  %345 = add i32 %344, %14
  %346 = mul i32 %342, 2048
  %347 = add i32 %345, %346
  %348 = add i32 %347, 3
  %349 = getelementptr inbounds bfloat, ptr %1, i32 %348
  %350 = load bfloat, ptr %349, align 2, !invariant.load !2
  br label %351

351:                                              ; preds = %337, %341
  %352 = phi bfloat [ %350, %341 ], [ %340, %337 ]
  br label %353

353:                                              ; preds = %351
  br label %379

354:                                              ; preds = %333
  %355 = icmp ult i32 %12, 3072
  br i1 %355, label %356, label %366

356:                                              ; preds = %354
  %357 = sub i32 %12, 2048
  %358 = urem i32 %11, 4
  %359 = mul i32 %358, 512
  %360 = add i32 %359, %14
  %361 = mul i32 %357, 2048
  %362 = add i32 %360, %361
  %363 = add i32 %362, 3
  %364 = getelementptr inbounds bfloat, ptr %2, i32 %363
  %365 = load bfloat, ptr %364, align 2, !invariant.load !2
  br label %376

366:                                              ; preds = %354
  %367 = sub i32 %12, 3072
  %368 = urem i32 %11, 4
  %369 = mul i32 %368, 512
  %370 = add i32 %369, %14
  %371 = mul i32 %367, 2048
  %372 = add i32 %370, %371
  %373 = add i32 %372, 3
  %374 = getelementptr inbounds bfloat, ptr %3, i32 %373
  %375 = load bfloat, ptr %374, align 2, !invariant.load !2
  br label %376

376:                                              ; preds = %356, %366
  %377 = phi bfloat [ %375, %366 ], [ %365, %356 ]
  br label %378

378:                                              ; preds = %376
  br label %379

379:                                              ; preds = %353, %378
  %380 = phi bfloat [ %377, %378 ], [ %352, %353 ]
  br label %381

381:                                              ; preds = %379
  br label %437

382:                                              ; preds = %331
  %383 = icmp ult i32 %12, 6144
  br i1 %383, label %384, label %409

384:                                              ; preds = %382
  %385 = icmp ult i32 %12, 5120
  br i1 %385, label %386, label %396

386:                                              ; preds = %384
  %387 = sub i32 %12, 4096
  %388 = urem i32 %11, 4
  %389 = mul i32 %388, 512
  %390 = add i32 %389, %14
  %391 = mul i32 %387, 2048
  %392 = add i32 %390, %391
  %393 = add i32 %392, 3
  %394 = getelementptr inbounds bfloat, ptr %4, i32 %393
  %395 = load bfloat, ptr %394, align 2, !invariant.load !2
  br label %406

396:                                              ; preds = %384
  %397 = sub i32 %12, 5120
  %398 = urem i32 %11, 4
  %399 = mul i32 %398, 512
  %400 = add i32 %399, %14
  %401 = mul i32 %397, 2048
  %402 = add i32 %400, %401
  %403 = add i32 %402, 3
  %404 = getelementptr inbounds bfloat, ptr %5, i32 %403
  %405 = load bfloat, ptr %404, align 2, !invariant.load !2
  br label %406

406:                                              ; preds = %386, %396
  %407 = phi bfloat [ %405, %396 ], [ %395, %386 ]
  br label %408

408:                                              ; preds = %406
  br label %434

409:                                              ; preds = %382
  %410 = icmp ult i32 %12, 7168
  br i1 %410, label %411, label %421

411:                                              ; preds = %409
  %412 = sub i32 %12, 6144
  %413 = urem i32 %11, 4
  %414 = mul i32 %413, 512
  %415 = add i32 %414, %14
  %416 = mul i32 %412, 2048
  %417 = add i32 %415, %416
  %418 = add i32 %417, 3
  %419 = getelementptr inbounds bfloat, ptr %6, i32 %418
  %420 = load bfloat, ptr %419, align 2, !invariant.load !2
  br label %431

421:                                              ; preds = %409
  %422 = sub i32 %12, 7168
  %423 = urem i32 %11, 4
  %424 = mul i32 %423, 512
  %425 = add i32 %424, %14
  %426 = mul i32 %422, 2048
  %427 = add i32 %425, %426
  %428 = add i32 %427, 3
  %429 = getelementptr inbounds bfloat, ptr %7, i32 %428
  %430 = load bfloat, ptr %429, align 2, !invariant.load !2
  br label %431

431:                                              ; preds = %411, %421
  %432 = phi bfloat [ %430, %421 ], [ %420, %411 ]
  br label %433

433:                                              ; preds = %431
  br label %434

434:                                              ; preds = %408, %433
  %435 = phi bfloat [ %432, %433 ], [ %407, %408 ]
  br label %436

436:                                              ; preds = %434
  br label %437

437:                                              ; preds = %381, %436
  %438 = phi bfloat [ %435, %436 ], [ %380, %381 ]
  br label %439

439:                                              ; preds = %437
  %440 = insertelement <4 x bfloat> %332, bfloat %438, i64 3
  %441 = getelementptr inbounds bfloat, ptr %8, i32 %16
  store <4 x bfloat> %440, ptr %441, align 8
  ret void
}

declare ptx_kernel void @gemm_fusion_dot_31_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_31_0(ptr noalias align 128 dereferenceable(33554432) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 8
  %6 = mul i32 %5, 8
  %7 = sub i32 64, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 8
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %11, 128
  %15 = sext i32 %14 to i64
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %17 = urem i32 %16, 32
  %18 = udiv i32 %16, 32
  %19 = and i32 %17, 16
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 0, i32 1
  %22 = xor i32 0, %21
  %23 = and i32 %18, 1
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 0, i32 2
  %26 = xor i32 %22, %25
  %27 = and i32 %18, 2
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 0, i32 4
  %30 = xor i32 %26, %29
  %31 = xor i32 %30, 0
  %32 = xor i32 %30, 8
  %33 = xor i32 %30, 16
  %34 = xor i32 %30, 24
  %35 = xor i32 %30, 32
  %36 = xor i32 %30, 40
  %37 = xor i32 %30, 48
  %38 = xor i32 %30, 56
  %39 = xor i32 %30, 64
  %40 = xor i32 %30, 72
  %41 = xor i32 %30, 80
  %42 = xor i32 %30, 88
  %43 = xor i32 %30, 96
  %44 = xor i32 %30, 104
  %45 = xor i32 %30, 112
  %46 = xor i32 %30, 120
  %47 = add i32 %31, 0
  %48 = add i32 %32, 0
  %49 = add i32 %33, 0
  %50 = add i32 %34, 0
  %51 = add i32 %35, 0
  %52 = add i32 %36, 0
  %53 = add i32 %37, 0
  %54 = add i32 %38, 0
  %55 = add i32 %39, 0
  %56 = add i32 %40, 0
  %57 = add i32 %41, 0
  %58 = add i32 %42, 0
  %59 = add i32 %43, 0
  %60 = add i32 %44, 0
  %61 = add i32 %45, 0
  %62 = add i32 %46, 0
  %63 = and i32 %17, 1
  %64 = icmp eq i32 %63, 0
  %65 = select i1 %64, i32 0, i32 8
  %66 = xor i32 0, %65
  %67 = and i32 %17, 2
  %68 = icmp eq i32 %67, 0
  %69 = select i1 %68, i32 0, i32 16
  %70 = xor i32 %66, %69
  %71 = and i32 %17, 4
  %72 = icmp eq i32 %71, 0
  %73 = select i1 %72, i32 0, i32 32
  %74 = xor i32 %70, %73
  %75 = and i32 %17, 8
  %76 = icmp eq i32 %75, 0
  %77 = select i1 %76, i32 0, i32 64
  %78 = xor i32 %74, %77
  %79 = xor i32 %78, 0
  %80 = add i32 %79, 0
  %81 = sext i32 %47 to i64
  %82 = sext i32 %48 to i64
  %83 = sext i32 %49 to i64
  %84 = sext i32 %50 to i64
  %85 = sext i32 %51 to i64
  %86 = sext i32 %52 to i64
  %87 = sext i32 %53 to i64
  %88 = sext i32 %54 to i64
  %89 = sext i32 %55 to i64
  %90 = sext i32 %56 to i64
  %91 = sext i32 %57 to i64
  %92 = sext i32 %58 to i64
  %93 = sext i32 %59 to i64
  %94 = sext i32 %60 to i64
  %95 = sext i32 %61 to i64
  %96 = sext i32 %62 to i64
  %97 = sext i32 %80 to i64
  %98 = add i64 %15, %81
  %99 = add i64 %15, %82
  %100 = add i64 %15, %83
  %101 = add i64 %15, %84
  %102 = add i64 %15, %85
  %103 = add i64 %15, %86
  %104 = add i64 %15, %87
  %105 = add i64 %15, %88
  %106 = add i64 %15, %89
  %107 = add i64 %15, %90
  %108 = add i64 %15, %91
  %109 = add i64 %15, %92
  %110 = add i64 %15, %93
  %111 = add i64 %15, %94
  %112 = add i64 %15, %95
  %113 = add i64 %15, %96
  %114 = mul i64 %98, 2048
  %115 = mul i64 %99, 2048
  %116 = mul i64 %100, 2048
  %117 = mul i64 %101, 2048
  %118 = mul i64 %102, 2048
  %119 = mul i64 %103, 2048
  %120 = mul i64 %104, 2048
  %121 = mul i64 %105, 2048
  %122 = mul i64 %106, 2048
  %123 = mul i64 %107, 2048
  %124 = mul i64 %108, 2048
  %125 = mul i64 %109, 2048
  %126 = mul i64 %110, 2048
  %127 = mul i64 %111, 2048
  %128 = mul i64 %112, 2048
  %129 = mul i64 %113, 2048
  %130 = add i64 %114, %97
  %131 = add i64 %115, %97
  %132 = add i64 %116, %97
  %133 = add i64 %117, %97
  %134 = add i64 %118, %97
  %135 = add i64 %119, %97
  %136 = add i64 %120, %97
  %137 = add i64 %121, %97
  %138 = add i64 %122, %97
  %139 = add i64 %123, %97
  %140 = add i64 %124, %97
  %141 = add i64 %125, %97
  %142 = add i64 %126, %97
  %143 = add i64 %127, %97
  %144 = add i64 %128, %97
  %145 = add i64 %129, %97
  %146 = getelementptr bfloat, ptr addrspace(1) %1, i64 %130
  %147 = getelementptr bfloat, ptr addrspace(1) %1, i64 %131
  %148 = getelementptr bfloat, ptr addrspace(1) %1, i64 %132
  %149 = getelementptr bfloat, ptr addrspace(1) %1, i64 %133
  %150 = getelementptr bfloat, ptr addrspace(1) %1, i64 %134
  %151 = getelementptr bfloat, ptr addrspace(1) %1, i64 %135
  %152 = getelementptr bfloat, ptr addrspace(1) %1, i64 %136
  %153 = getelementptr bfloat, ptr addrspace(1) %1, i64 %137
  %154 = getelementptr bfloat, ptr addrspace(1) %1, i64 %138
  %155 = getelementptr bfloat, ptr addrspace(1) %1, i64 %139
  %156 = getelementptr bfloat, ptr addrspace(1) %1, i64 %140
  %157 = getelementptr bfloat, ptr addrspace(1) %1, i64 %141
  %158 = getelementptr bfloat, ptr addrspace(1) %1, i64 %142
  %159 = getelementptr bfloat, ptr addrspace(1) %1, i64 %143
  %160 = getelementptr bfloat, ptr addrspace(1) %1, i64 %144
  %161 = getelementptr bfloat, ptr addrspace(1) %1, i64 %145
  %162 = select i1 %20, i32 0, i32 136
  %163 = xor i32 %78, %162
  %164 = select i1 %24, i32 0, i32 272
  %165 = xor i32 %163, %164
  %166 = select i1 %28, i32 0, i32 544
  %167 = xor i32 %165, %166
  %168 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %167
  %169 = xor i32 1024, %65
  %170 = xor i32 %169, %69
  %171 = xor i32 %170, %73
  %172 = xor i32 %171, %77
  %173 = xor i32 %172, %162
  %174 = xor i32 %173, %164
  %175 = xor i32 %174, %166
  %176 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %175
  %177 = xor i32 2048, %65
  %178 = xor i32 %177, %69
  %179 = xor i32 %178, %73
  %180 = xor i32 %179, %77
  %181 = xor i32 %180, %162
  %182 = xor i32 %181, %164
  %183 = xor i32 %182, %166
  %184 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %183
  %185 = xor i32 3072, %65
  %186 = xor i32 %185, %69
  %187 = xor i32 %186, %73
  %188 = xor i32 %187, %77
  %189 = xor i32 %188, %162
  %190 = xor i32 %189, %164
  %191 = xor i32 %190, %166
  %192 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %191
  %193 = xor i32 4096, %65
  %194 = xor i32 %193, %69
  %195 = xor i32 %194, %73
  %196 = xor i32 %195, %77
  %197 = xor i32 %196, %162
  %198 = xor i32 %197, %164
  %199 = xor i32 %198, %166
  %200 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %199
  %201 = xor i32 5120, %65
  %202 = xor i32 %201, %69
  %203 = xor i32 %202, %73
  %204 = xor i32 %203, %77
  %205 = xor i32 %204, %162
  %206 = xor i32 %205, %164
  %207 = xor i32 %206, %166
  %208 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %207
  %209 = xor i32 6144, %65
  %210 = xor i32 %209, %69
  %211 = xor i32 %210, %73
  %212 = xor i32 %211, %77
  %213 = xor i32 %212, %162
  %214 = xor i32 %213, %164
  %215 = xor i32 %214, %166
  %216 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %215
  %217 = xor i32 7168, %65
  %218 = xor i32 %217, %69
  %219 = xor i32 %218, %73
  %220 = xor i32 %219, %77
  %221 = xor i32 %220, %162
  %222 = xor i32 %221, %164
  %223 = xor i32 %222, %166
  %224 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %223
  %225 = xor i32 8192, %65
  %226 = xor i32 %225, %69
  %227 = xor i32 %226, %73
  %228 = xor i32 %227, %77
  %229 = xor i32 %228, %162
  %230 = xor i32 %229, %164
  %231 = xor i32 %230, %166
  %232 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %231
  %233 = xor i32 9216, %65
  %234 = xor i32 %233, %69
  %235 = xor i32 %234, %73
  %236 = xor i32 %235, %77
  %237 = xor i32 %236, %162
  %238 = xor i32 %237, %164
  %239 = xor i32 %238, %166
  %240 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %239
  %241 = xor i32 10240, %65
  %242 = xor i32 %241, %69
  %243 = xor i32 %242, %73
  %244 = xor i32 %243, %77
  %245 = xor i32 %244, %162
  %246 = xor i32 %245, %164
  %247 = xor i32 %246, %166
  %248 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %247
  %249 = xor i32 11264, %65
  %250 = xor i32 %249, %69
  %251 = xor i32 %250, %73
  %252 = xor i32 %251, %77
  %253 = xor i32 %252, %162
  %254 = xor i32 %253, %164
  %255 = xor i32 %254, %166
  %256 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %255
  %257 = xor i32 12288, %65
  %258 = xor i32 %257, %69
  %259 = xor i32 %258, %73
  %260 = xor i32 %259, %77
  %261 = xor i32 %260, %162
  %262 = xor i32 %261, %164
  %263 = xor i32 %262, %166
  %264 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %263
  %265 = xor i32 13312, %65
  %266 = xor i32 %265, %69
  %267 = xor i32 %266, %73
  %268 = xor i32 %267, %77
  %269 = xor i32 %268, %162
  %270 = xor i32 %269, %164
  %271 = xor i32 %270, %166
  %272 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %271
  %273 = xor i32 14336, %65
  %274 = xor i32 %273, %69
  %275 = xor i32 %274, %73
  %276 = xor i32 %275, %77
  %277 = xor i32 %276, %162
  %278 = xor i32 %277, %164
  %279 = xor i32 %278, %166
  %280 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %279
  %281 = xor i32 15360, %65
  %282 = xor i32 %281, %69
  %283 = xor i32 %282, %73
  %284 = xor i32 %283, %77
  %285 = xor i32 %284, %162
  %286 = xor i32 %285, %164
  %287 = xor i32 %286, %166
  %288 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %287
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %146, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %176, ptr addrspace(1) %147, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %184, ptr addrspace(1) %148, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %149, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %200, ptr addrspace(1) %150, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %208, ptr addrspace(1) %151, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %216, ptr addrspace(1) %152, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %224, ptr addrspace(1) %153, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %232, ptr addrspace(1) %154, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %240, ptr addrspace(1) %155, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %248, ptr addrspace(1) %156, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %256, ptr addrspace(1) %157, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %264, ptr addrspace(1) %158, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %272, ptr addrspace(1) %159, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %280, ptr addrspace(1) %160, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %288, ptr addrspace(1) %161, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %289 = add i64 %97, 128
  %290 = add i64 %114, %289
  %291 = add i64 %115, %289
  %292 = add i64 %116, %289
  %293 = add i64 %117, %289
  %294 = add i64 %118, %289
  %295 = add i64 %119, %289
  %296 = add i64 %120, %289
  %297 = add i64 %121, %289
  %298 = add i64 %122, %289
  %299 = add i64 %123, %289
  %300 = add i64 %124, %289
  %301 = add i64 %125, %289
  %302 = add i64 %126, %289
  %303 = add i64 %127, %289
  %304 = add i64 %128, %289
  %305 = add i64 %129, %289
  %306 = getelementptr bfloat, ptr addrspace(1) %1, i64 %290
  %307 = getelementptr bfloat, ptr addrspace(1) %1, i64 %291
  %308 = getelementptr bfloat, ptr addrspace(1) %1, i64 %292
  %309 = getelementptr bfloat, ptr addrspace(1) %1, i64 %293
  %310 = getelementptr bfloat, ptr addrspace(1) %1, i64 %294
  %311 = getelementptr bfloat, ptr addrspace(1) %1, i64 %295
  %312 = getelementptr bfloat, ptr addrspace(1) %1, i64 %296
  %313 = getelementptr bfloat, ptr addrspace(1) %1, i64 %297
  %314 = getelementptr bfloat, ptr addrspace(1) %1, i64 %298
  %315 = getelementptr bfloat, ptr addrspace(1) %1, i64 %299
  %316 = getelementptr bfloat, ptr addrspace(1) %1, i64 %300
  %317 = getelementptr bfloat, ptr addrspace(1) %1, i64 %301
  %318 = getelementptr bfloat, ptr addrspace(1) %1, i64 %302
  %319 = getelementptr bfloat, ptr addrspace(1) %1, i64 %303
  %320 = getelementptr bfloat, ptr addrspace(1) %1, i64 %304
  %321 = getelementptr bfloat, ptr addrspace(1) %1, i64 %305
  call void @llvm.nvvm.barrier0()
  %322 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %167
  %323 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %175
  %324 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %183
  %325 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %191
  %326 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %199
  %327 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %207
  %328 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %215
  %329 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %223
  %330 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %231
  %331 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %239
  %332 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %247
  %333 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %255
  %334 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %263
  %335 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %271
  %336 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %279
  %337 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i32 %287
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %322, ptr addrspace(1) %306, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %323, ptr addrspace(1) %307, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %324, ptr addrspace(1) %308, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %325, ptr addrspace(1) %309, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %326, ptr addrspace(1) %310, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %327, ptr addrspace(1) %311, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %328, ptr addrspace(1) %312, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %329, ptr addrspace(1) %313, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %330, ptr addrspace(1) %314, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %331, ptr addrspace(1) %315, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %332, ptr addrspace(1) %316, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %333, ptr addrspace(1) %317, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %334, ptr addrspace(1) %318, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %335, ptr addrspace(1) %319, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %336, ptr addrspace(1) %320, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %337, ptr addrspace(1) %321, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %338 = add i64 %97, 256
  %339 = add i64 %114, %338
  %340 = add i64 %115, %338
  %341 = add i64 %116, %338
  %342 = add i64 %117, %338
  %343 = add i64 %118, %338
  %344 = add i64 %119, %338
  %345 = add i64 %120, %338
  %346 = add i64 %121, %338
  %347 = add i64 %122, %338
  %348 = add i64 %123, %338
  %349 = add i64 %124, %338
  %350 = add i64 %125, %338
  %351 = add i64 %126, %338
  %352 = add i64 %127, %338
  %353 = add i64 %128, %338
  %354 = add i64 %129, %338
  %355 = getelementptr bfloat, ptr addrspace(1) %1, i64 %339
  %356 = getelementptr bfloat, ptr addrspace(1) %1, i64 %340
  %357 = getelementptr bfloat, ptr addrspace(1) %1, i64 %341
  %358 = getelementptr bfloat, ptr addrspace(1) %1, i64 %342
  %359 = getelementptr bfloat, ptr addrspace(1) %1, i64 %343
  %360 = getelementptr bfloat, ptr addrspace(1) %1, i64 %344
  %361 = getelementptr bfloat, ptr addrspace(1) %1, i64 %345
  %362 = getelementptr bfloat, ptr addrspace(1) %1, i64 %346
  %363 = getelementptr bfloat, ptr addrspace(1) %1, i64 %347
  %364 = getelementptr bfloat, ptr addrspace(1) %1, i64 %348
  %365 = getelementptr bfloat, ptr addrspace(1) %1, i64 %349
  %366 = getelementptr bfloat, ptr addrspace(1) %1, i64 %350
  %367 = getelementptr bfloat, ptr addrspace(1) %1, i64 %351
  %368 = getelementptr bfloat, ptr addrspace(1) %1, i64 %352
  %369 = getelementptr bfloat, ptr addrspace(1) %1, i64 %353
  %370 = getelementptr bfloat, ptr addrspace(1) %1, i64 %354
  call void @llvm.nvvm.barrier0()
  %371 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %167
  %372 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %175
  %373 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %183
  %374 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %191
  %375 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %199
  %376 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %207
  %377 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %215
  %378 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %223
  %379 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %231
  %380 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %239
  %381 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %247
  %382 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %255
  %383 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %263
  %384 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %271
  %385 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %279
  %386 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i32 %287
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %371, ptr addrspace(1) %355, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %372, ptr addrspace(1) %356, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %373, ptr addrspace(1) %357, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %374, ptr addrspace(1) %358, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %375, ptr addrspace(1) %359, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %376, ptr addrspace(1) %360, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %377, ptr addrspace(1) %361, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %378, ptr addrspace(1) %362, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %379, ptr addrspace(1) %363, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %380, ptr addrspace(1) %364, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %381, ptr addrspace(1) %365, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %382, ptr addrspace(1) %366, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %383, ptr addrspace(1) %367, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %384, ptr addrspace(1) %368, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %385, ptr addrspace(1) %369, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %386, ptr addrspace(1) %370, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %387

387:                                              ; preds = %395, %0
  %388 = phi i32 [ %1275, %395 ], [ 0, %0 ]
  %389 = phi i64 [ %1205, %395 ], [ 256, %0 ]
  %390 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %1204, %395 ], [ zeroinitializer, %0 ]
  %391 = phi i32 [ %1208, %395 ], [ 2, %0 ]
  %392 = phi i32 [ %1266, %395 ], [ 0, %0 ]
  %393 = phi { ptr addrspace(3), i32, i32 } [ %1274, %395 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %394 = icmp slt i32 %388, 2048
  br i1 %394, label %395, label %1276

395:                                              ; preds = %387
  %396 = icmp slt i32 %388, 1664
  %397 = extractvalue { ptr addrspace(3), i32, i32 } %393, 0
  %398 = select i1 %64, i32 0, i32 136
  %399 = xor i32 0, %398
  %400 = select i1 %68, i32 0, i32 272
  %401 = xor i32 %399, %400
  %402 = select i1 %72, i32 0, i32 544
  %403 = xor i32 %401, %402
  %404 = select i1 %76, i32 0, i32 1024
  %405 = xor i32 %403, %404
  %406 = select i1 %20, i32 0, i32 8
  %407 = xor i32 %405, %406
  %408 = select i1 %24, i32 0, i32 2048
  %409 = xor i32 %407, %408
  %410 = select i1 %28, i32 0, i32 4096
  %411 = xor i32 %409, %410
  %412 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %411
  %413 = ptrtoint ptr addrspace(3) %412 to i32
  %414 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %413)
  %415 = extractvalue { i32, i32, i32, i32 } %414, 0
  %416 = extractvalue { i32, i32, i32, i32 } %414, 1
  %417 = extractvalue { i32, i32, i32, i32 } %414, 2
  %418 = extractvalue { i32, i32, i32, i32 } %414, 3
  %419 = xor i32 16, %398
  %420 = xor i32 %419, %400
  %421 = xor i32 %420, %402
  %422 = xor i32 %421, %404
  %423 = xor i32 %422, %406
  %424 = xor i32 %423, %408
  %425 = xor i32 %424, %410
  %426 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %425
  %427 = ptrtoint ptr addrspace(3) %426 to i32
  %428 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %427)
  %429 = extractvalue { i32, i32, i32, i32 } %428, 0
  %430 = extractvalue { i32, i32, i32, i32 } %428, 1
  %431 = extractvalue { i32, i32, i32, i32 } %428, 2
  %432 = extractvalue { i32, i32, i32, i32 } %428, 3
  %433 = xor i32 32, %398
  %434 = xor i32 %433, %400
  %435 = xor i32 %434, %402
  %436 = xor i32 %435, %404
  %437 = xor i32 %436, %406
  %438 = xor i32 %437, %408
  %439 = xor i32 %438, %410
  %440 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %439
  %441 = ptrtoint ptr addrspace(3) %440 to i32
  %442 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %441)
  %443 = extractvalue { i32, i32, i32, i32 } %442, 0
  %444 = extractvalue { i32, i32, i32, i32 } %442, 1
  %445 = extractvalue { i32, i32, i32, i32 } %442, 2
  %446 = extractvalue { i32, i32, i32, i32 } %442, 3
  %447 = xor i32 48, %398
  %448 = xor i32 %447, %400
  %449 = xor i32 %448, %402
  %450 = xor i32 %449, %404
  %451 = xor i32 %450, %406
  %452 = xor i32 %451, %408
  %453 = xor i32 %452, %410
  %454 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %453
  %455 = ptrtoint ptr addrspace(3) %454 to i32
  %456 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %455)
  %457 = extractvalue { i32, i32, i32, i32 } %456, 0
  %458 = extractvalue { i32, i32, i32, i32 } %456, 1
  %459 = extractvalue { i32, i32, i32, i32 } %456, 2
  %460 = extractvalue { i32, i32, i32, i32 } %456, 3
  %461 = xor i32 64, %398
  %462 = xor i32 %461, %400
  %463 = xor i32 %462, %402
  %464 = xor i32 %463, %404
  %465 = xor i32 %464, %406
  %466 = xor i32 %465, %408
  %467 = xor i32 %466, %410
  %468 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %467
  %469 = ptrtoint ptr addrspace(3) %468 to i32
  %470 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %469)
  %471 = extractvalue { i32, i32, i32, i32 } %470, 0
  %472 = extractvalue { i32, i32, i32, i32 } %470, 1
  %473 = extractvalue { i32, i32, i32, i32 } %470, 2
  %474 = extractvalue { i32, i32, i32, i32 } %470, 3
  %475 = xor i32 80, %398
  %476 = xor i32 %475, %400
  %477 = xor i32 %476, %402
  %478 = xor i32 %477, %404
  %479 = xor i32 %478, %406
  %480 = xor i32 %479, %408
  %481 = xor i32 %480, %410
  %482 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %481
  %483 = ptrtoint ptr addrspace(3) %482 to i32
  %484 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %483)
  %485 = extractvalue { i32, i32, i32, i32 } %484, 0
  %486 = extractvalue { i32, i32, i32, i32 } %484, 1
  %487 = extractvalue { i32, i32, i32, i32 } %484, 2
  %488 = extractvalue { i32, i32, i32, i32 } %484, 3
  %489 = xor i32 96, %398
  %490 = xor i32 %489, %400
  %491 = xor i32 %490, %402
  %492 = xor i32 %491, %404
  %493 = xor i32 %492, %406
  %494 = xor i32 %493, %408
  %495 = xor i32 %494, %410
  %496 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %495
  %497 = ptrtoint ptr addrspace(3) %496 to i32
  %498 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %497)
  %499 = extractvalue { i32, i32, i32, i32 } %498, 0
  %500 = extractvalue { i32, i32, i32, i32 } %498, 1
  %501 = extractvalue { i32, i32, i32, i32 } %498, 2
  %502 = extractvalue { i32, i32, i32, i32 } %498, 3
  %503 = xor i32 112, %398
  %504 = xor i32 %503, %400
  %505 = xor i32 %504, %402
  %506 = xor i32 %505, %404
  %507 = xor i32 %506, %406
  %508 = xor i32 %507, %408
  %509 = xor i32 %508, %410
  %510 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %509
  %511 = ptrtoint ptr addrspace(3) %510 to i32
  %512 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %511)
  %513 = extractvalue { i32, i32, i32, i32 } %512, 0
  %514 = extractvalue { i32, i32, i32, i32 } %512, 1
  %515 = extractvalue { i32, i32, i32, i32 } %512, 2
  %516 = extractvalue { i32, i32, i32, i32 } %512, 3
  %517 = xor i32 8192, %398
  %518 = xor i32 %517, %400
  %519 = xor i32 %518, %402
  %520 = xor i32 %519, %404
  %521 = xor i32 %520, %406
  %522 = xor i32 %521, %408
  %523 = xor i32 %522, %410
  %524 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %523
  %525 = ptrtoint ptr addrspace(3) %524 to i32
  %526 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %525)
  %527 = extractvalue { i32, i32, i32, i32 } %526, 0
  %528 = extractvalue { i32, i32, i32, i32 } %526, 1
  %529 = extractvalue { i32, i32, i32, i32 } %526, 2
  %530 = extractvalue { i32, i32, i32, i32 } %526, 3
  %531 = xor i32 8208, %398
  %532 = xor i32 %531, %400
  %533 = xor i32 %532, %402
  %534 = xor i32 %533, %404
  %535 = xor i32 %534, %406
  %536 = xor i32 %535, %408
  %537 = xor i32 %536, %410
  %538 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %537
  %539 = ptrtoint ptr addrspace(3) %538 to i32
  %540 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %539)
  %541 = extractvalue { i32, i32, i32, i32 } %540, 0
  %542 = extractvalue { i32, i32, i32, i32 } %540, 1
  %543 = extractvalue { i32, i32, i32, i32 } %540, 2
  %544 = extractvalue { i32, i32, i32, i32 } %540, 3
  %545 = xor i32 8224, %398
  %546 = xor i32 %545, %400
  %547 = xor i32 %546, %402
  %548 = xor i32 %547, %404
  %549 = xor i32 %548, %406
  %550 = xor i32 %549, %408
  %551 = xor i32 %550, %410
  %552 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %551
  %553 = ptrtoint ptr addrspace(3) %552 to i32
  %554 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %553)
  %555 = extractvalue { i32, i32, i32, i32 } %554, 0
  %556 = extractvalue { i32, i32, i32, i32 } %554, 1
  %557 = extractvalue { i32, i32, i32, i32 } %554, 2
  %558 = extractvalue { i32, i32, i32, i32 } %554, 3
  %559 = xor i32 8240, %398
  %560 = xor i32 %559, %400
  %561 = xor i32 %560, %402
  %562 = xor i32 %561, %404
  %563 = xor i32 %562, %406
  %564 = xor i32 %563, %408
  %565 = xor i32 %564, %410
  %566 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %565
  %567 = ptrtoint ptr addrspace(3) %566 to i32
  %568 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %567)
  %569 = extractvalue { i32, i32, i32, i32 } %568, 0
  %570 = extractvalue { i32, i32, i32, i32 } %568, 1
  %571 = extractvalue { i32, i32, i32, i32 } %568, 2
  %572 = extractvalue { i32, i32, i32, i32 } %568, 3
  %573 = xor i32 8256, %398
  %574 = xor i32 %573, %400
  %575 = xor i32 %574, %402
  %576 = xor i32 %575, %404
  %577 = xor i32 %576, %406
  %578 = xor i32 %577, %408
  %579 = xor i32 %578, %410
  %580 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %579
  %581 = ptrtoint ptr addrspace(3) %580 to i32
  %582 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %581)
  %583 = extractvalue { i32, i32, i32, i32 } %582, 0
  %584 = extractvalue { i32, i32, i32, i32 } %582, 1
  %585 = extractvalue { i32, i32, i32, i32 } %582, 2
  %586 = extractvalue { i32, i32, i32, i32 } %582, 3
  %587 = xor i32 8272, %398
  %588 = xor i32 %587, %400
  %589 = xor i32 %588, %402
  %590 = xor i32 %589, %404
  %591 = xor i32 %590, %406
  %592 = xor i32 %591, %408
  %593 = xor i32 %592, %410
  %594 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %593
  %595 = ptrtoint ptr addrspace(3) %594 to i32
  %596 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %595)
  %597 = extractvalue { i32, i32, i32, i32 } %596, 0
  %598 = extractvalue { i32, i32, i32, i32 } %596, 1
  %599 = extractvalue { i32, i32, i32, i32 } %596, 2
  %600 = extractvalue { i32, i32, i32, i32 } %596, 3
  %601 = xor i32 8288, %398
  %602 = xor i32 %601, %400
  %603 = xor i32 %602, %402
  %604 = xor i32 %603, %404
  %605 = xor i32 %604, %406
  %606 = xor i32 %605, %408
  %607 = xor i32 %606, %410
  %608 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %607
  %609 = ptrtoint ptr addrspace(3) %608 to i32
  %610 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %609)
  %611 = extractvalue { i32, i32, i32, i32 } %610, 0
  %612 = extractvalue { i32, i32, i32, i32 } %610, 1
  %613 = extractvalue { i32, i32, i32, i32 } %610, 2
  %614 = extractvalue { i32, i32, i32, i32 } %610, 3
  %615 = xor i32 8304, %398
  %616 = xor i32 %615, %400
  %617 = xor i32 %616, %402
  %618 = xor i32 %617, %404
  %619 = xor i32 %618, %406
  %620 = xor i32 %619, %408
  %621 = xor i32 %620, %410
  %622 = getelementptr inbounds bfloat, ptr addrspace(3) %397, i32 %621
  %623 = ptrtoint ptr addrspace(3) %622 to i32
  %624 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %623)
  %625 = extractvalue { i32, i32, i32, i32 } %624, 0
  %626 = extractvalue { i32, i32, i32, i32 } %624, 1
  %627 = extractvalue { i32, i32, i32, i32 } %624, 2
  %628 = extractvalue { i32, i32, i32, i32 } %624, 3
  %629 = bitcast i32 %415 to <2 x bfloat>
  %630 = extractelement <2 x bfloat> %629, i32 0
  %631 = extractelement <2 x bfloat> %629, i32 1
  %632 = bitcast i32 %416 to <2 x bfloat>
  %633 = extractelement <2 x bfloat> %632, i32 0
  %634 = extractelement <2 x bfloat> %632, i32 1
  %635 = bitcast i32 %417 to <2 x bfloat>
  %636 = extractelement <2 x bfloat> %635, i32 0
  %637 = extractelement <2 x bfloat> %635, i32 1
  %638 = bitcast i32 %418 to <2 x bfloat>
  %639 = extractelement <2 x bfloat> %638, i32 0
  %640 = extractelement <2 x bfloat> %638, i32 1
  %641 = bitcast i32 %429 to <2 x bfloat>
  %642 = extractelement <2 x bfloat> %641, i32 0
  %643 = extractelement <2 x bfloat> %641, i32 1
  %644 = bitcast i32 %430 to <2 x bfloat>
  %645 = extractelement <2 x bfloat> %644, i32 0
  %646 = extractelement <2 x bfloat> %644, i32 1
  %647 = bitcast i32 %431 to <2 x bfloat>
  %648 = extractelement <2 x bfloat> %647, i32 0
  %649 = extractelement <2 x bfloat> %647, i32 1
  %650 = bitcast i32 %432 to <2 x bfloat>
  %651 = extractelement <2 x bfloat> %650, i32 0
  %652 = extractelement <2 x bfloat> %650, i32 1
  %653 = bitcast i32 %443 to <2 x bfloat>
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
  %665 = bitcast i32 %457 to <2 x bfloat>
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
  %677 = bitcast i32 %471 to <2 x bfloat>
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
  %689 = bitcast i32 %485 to <2 x bfloat>
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
  %701 = bitcast i32 %499 to <2 x bfloat>
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
  %713 = bitcast i32 %513 to <2 x bfloat>
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
  %725 = bitcast i32 %527 to <2 x bfloat>
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
  %737 = bitcast i32 %541 to <2 x bfloat>
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
  %749 = bitcast i32 %555 to <2 x bfloat>
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
  %761 = bitcast i32 %569 to <2 x bfloat>
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
  %773 = bitcast i32 %583 to <2 x bfloat>
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
  %785 = bitcast i32 %597 to <2 x bfloat>
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
  %797 = bitcast i32 %611 to <2 x bfloat>
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
  %809 = bitcast i32 %625 to <2 x bfloat>
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
  %821 = insertelement <2 x bfloat> undef, bfloat %630, i32 0
  %822 = insertelement <2 x bfloat> %821, bfloat %631, i32 1
  %823 = bitcast <2 x bfloat> %822 to i32
  %824 = insertelement <2 x bfloat> undef, bfloat %633, i32 0
  %825 = insertelement <2 x bfloat> %824, bfloat %634, i32 1
  %826 = bitcast <2 x bfloat> %825 to i32
  %827 = insertelement <2 x bfloat> undef, bfloat %636, i32 0
  %828 = insertelement <2 x bfloat> %827, bfloat %637, i32 1
  %829 = bitcast <2 x bfloat> %828 to i32
  %830 = insertelement <2 x bfloat> undef, bfloat %639, i32 0
  %831 = insertelement <2 x bfloat> %830, bfloat %640, i32 1
  %832 = bitcast <2 x bfloat> %831 to i32
  %833 = insertelement <2 x bfloat> undef, bfloat %642, i32 0
  %834 = insertelement <2 x bfloat> %833, bfloat %643, i32 1
  %835 = bitcast <2 x bfloat> %834 to i32
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
  %1013 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 0
  %1014 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 1
  %1015 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 2
  %1016 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 3
  %1017 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 4
  %1018 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 5
  %1019 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 6
  %1020 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 7
  %1021 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 8
  %1022 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 9
  %1023 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 10
  %1024 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 11
  %1025 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 12
  %1026 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 13
  %1027 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 14
  %1028 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 15
  %1029 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1013, float %1014, float %1015, float %1016, i32 %823, i32 %826, i32 %829, i32 %832, i32 0, i32 0)
  %1030 = extractvalue { float, float, float, float } %1029, 0
  %1031 = extractvalue { float, float, float, float } %1029, 1
  %1032 = extractvalue { float, float, float, float } %1029, 2
  %1033 = extractvalue { float, float, float, float } %1029, 3
  %1034 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1017, float %1018, float %1019, float %1020, i32 %823, i32 %826, i32 %829, i32 %832, i32 0, i32 0)
  %1035 = extractvalue { float, float, float, float } %1034, 0
  %1036 = extractvalue { float, float, float, float } %1034, 1
  %1037 = extractvalue { float, float, float, float } %1034, 2
  %1038 = extractvalue { float, float, float, float } %1034, 3
  %1039 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1021, float %1022, float %1023, float %1024, i32 %919, i32 %922, i32 %925, i32 %928, i32 0, i32 0)
  %1040 = extractvalue { float, float, float, float } %1039, 0
  %1041 = extractvalue { float, float, float, float } %1039, 1
  %1042 = extractvalue { float, float, float, float } %1039, 2
  %1043 = extractvalue { float, float, float, float } %1039, 3
  %1044 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1025, float %1026, float %1027, float %1028, i32 %919, i32 %922, i32 %925, i32 %928, i32 0, i32 0)
  %1045 = extractvalue { float, float, float, float } %1044, 0
  %1046 = extractvalue { float, float, float, float } %1044, 1
  %1047 = extractvalue { float, float, float, float } %1044, 2
  %1048 = extractvalue { float, float, float, float } %1044, 3
  %1049 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1030, float %1031, float %1032, float %1033, i32 %835, i32 %838, i32 %841, i32 %844, i32 0, i32 0)
  %1050 = extractvalue { float, float, float, float } %1049, 0
  %1051 = extractvalue { float, float, float, float } %1049, 1
  %1052 = extractvalue { float, float, float, float } %1049, 2
  %1053 = extractvalue { float, float, float, float } %1049, 3
  %1054 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1035, float %1036, float %1037, float %1038, i32 %835, i32 %838, i32 %841, i32 %844, i32 0, i32 0)
  %1055 = extractvalue { float, float, float, float } %1054, 0
  %1056 = extractvalue { float, float, float, float } %1054, 1
  %1057 = extractvalue { float, float, float, float } %1054, 2
  %1058 = extractvalue { float, float, float, float } %1054, 3
  %1059 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1040, float %1041, float %1042, float %1043, i32 %931, i32 %934, i32 %937, i32 %940, i32 0, i32 0)
  %1060 = extractvalue { float, float, float, float } %1059, 0
  %1061 = extractvalue { float, float, float, float } %1059, 1
  %1062 = extractvalue { float, float, float, float } %1059, 2
  %1063 = extractvalue { float, float, float, float } %1059, 3
  %1064 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1045, float %1046, float %1047, float %1048, i32 %931, i32 %934, i32 %937, i32 %940, i32 0, i32 0)
  %1065 = extractvalue { float, float, float, float } %1064, 0
  %1066 = extractvalue { float, float, float, float } %1064, 1
  %1067 = extractvalue { float, float, float, float } %1064, 2
  %1068 = extractvalue { float, float, float, float } %1064, 3
  %1069 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1050, float %1051, float %1052, float %1053, i32 %847, i32 %850, i32 %853, i32 %856, i32 0, i32 0)
  %1070 = extractvalue { float, float, float, float } %1069, 0
  %1071 = extractvalue { float, float, float, float } %1069, 1
  %1072 = extractvalue { float, float, float, float } %1069, 2
  %1073 = extractvalue { float, float, float, float } %1069, 3
  %1074 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1055, float %1056, float %1057, float %1058, i32 %847, i32 %850, i32 %853, i32 %856, i32 0, i32 0)
  %1075 = extractvalue { float, float, float, float } %1074, 0
  %1076 = extractvalue { float, float, float, float } %1074, 1
  %1077 = extractvalue { float, float, float, float } %1074, 2
  %1078 = extractvalue { float, float, float, float } %1074, 3
  %1079 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1060, float %1061, float %1062, float %1063, i32 %943, i32 %946, i32 %949, i32 %952, i32 0, i32 0)
  %1080 = extractvalue { float, float, float, float } %1079, 0
  %1081 = extractvalue { float, float, float, float } %1079, 1
  %1082 = extractvalue { float, float, float, float } %1079, 2
  %1083 = extractvalue { float, float, float, float } %1079, 3
  %1084 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1065, float %1066, float %1067, float %1068, i32 %943, i32 %946, i32 %949, i32 %952, i32 0, i32 0)
  %1085 = extractvalue { float, float, float, float } %1084, 0
  %1086 = extractvalue { float, float, float, float } %1084, 1
  %1087 = extractvalue { float, float, float, float } %1084, 2
  %1088 = extractvalue { float, float, float, float } %1084, 3
  %1089 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1070, float %1071, float %1072, float %1073, i32 %859, i32 %862, i32 %865, i32 %868, i32 0, i32 0)
  %1090 = extractvalue { float, float, float, float } %1089, 0
  %1091 = extractvalue { float, float, float, float } %1089, 1
  %1092 = extractvalue { float, float, float, float } %1089, 2
  %1093 = extractvalue { float, float, float, float } %1089, 3
  %1094 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1075, float %1076, float %1077, float %1078, i32 %859, i32 %862, i32 %865, i32 %868, i32 0, i32 0)
  %1095 = extractvalue { float, float, float, float } %1094, 0
  %1096 = extractvalue { float, float, float, float } %1094, 1
  %1097 = extractvalue { float, float, float, float } %1094, 2
  %1098 = extractvalue { float, float, float, float } %1094, 3
  %1099 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1080, float %1081, float %1082, float %1083, i32 %955, i32 %958, i32 %961, i32 %964, i32 0, i32 0)
  %1100 = extractvalue { float, float, float, float } %1099, 0
  %1101 = extractvalue { float, float, float, float } %1099, 1
  %1102 = extractvalue { float, float, float, float } %1099, 2
  %1103 = extractvalue { float, float, float, float } %1099, 3
  %1104 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1085, float %1086, float %1087, float %1088, i32 %955, i32 %958, i32 %961, i32 %964, i32 0, i32 0)
  %1105 = extractvalue { float, float, float, float } %1104, 0
  %1106 = extractvalue { float, float, float, float } %1104, 1
  %1107 = extractvalue { float, float, float, float } %1104, 2
  %1108 = extractvalue { float, float, float, float } %1104, 3
  %1109 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1090, float %1091, float %1092, float %1093, i32 %871, i32 %874, i32 %877, i32 %880, i32 0, i32 0)
  %1110 = extractvalue { float, float, float, float } %1109, 0
  %1111 = extractvalue { float, float, float, float } %1109, 1
  %1112 = extractvalue { float, float, float, float } %1109, 2
  %1113 = extractvalue { float, float, float, float } %1109, 3
  %1114 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1095, float %1096, float %1097, float %1098, i32 %871, i32 %874, i32 %877, i32 %880, i32 0, i32 0)
  %1115 = extractvalue { float, float, float, float } %1114, 0
  %1116 = extractvalue { float, float, float, float } %1114, 1
  %1117 = extractvalue { float, float, float, float } %1114, 2
  %1118 = extractvalue { float, float, float, float } %1114, 3
  %1119 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1100, float %1101, float %1102, float %1103, i32 %967, i32 %970, i32 %973, i32 %976, i32 0, i32 0)
  %1120 = extractvalue { float, float, float, float } %1119, 0
  %1121 = extractvalue { float, float, float, float } %1119, 1
  %1122 = extractvalue { float, float, float, float } %1119, 2
  %1123 = extractvalue { float, float, float, float } %1119, 3
  %1124 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1105, float %1106, float %1107, float %1108, i32 %967, i32 %970, i32 %973, i32 %976, i32 0, i32 0)
  %1125 = extractvalue { float, float, float, float } %1124, 0
  %1126 = extractvalue { float, float, float, float } %1124, 1
  %1127 = extractvalue { float, float, float, float } %1124, 2
  %1128 = extractvalue { float, float, float, float } %1124, 3
  %1129 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1110, float %1111, float %1112, float %1113, i32 %883, i32 %886, i32 %889, i32 %892, i32 0, i32 0)
  %1130 = extractvalue { float, float, float, float } %1129, 0
  %1131 = extractvalue { float, float, float, float } %1129, 1
  %1132 = extractvalue { float, float, float, float } %1129, 2
  %1133 = extractvalue { float, float, float, float } %1129, 3
  %1134 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1115, float %1116, float %1117, float %1118, i32 %883, i32 %886, i32 %889, i32 %892, i32 0, i32 0)
  %1135 = extractvalue { float, float, float, float } %1134, 0
  %1136 = extractvalue { float, float, float, float } %1134, 1
  %1137 = extractvalue { float, float, float, float } %1134, 2
  %1138 = extractvalue { float, float, float, float } %1134, 3
  %1139 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1120, float %1121, float %1122, float %1123, i32 %979, i32 %982, i32 %985, i32 %988, i32 0, i32 0)
  %1140 = extractvalue { float, float, float, float } %1139, 0
  %1141 = extractvalue { float, float, float, float } %1139, 1
  %1142 = extractvalue { float, float, float, float } %1139, 2
  %1143 = extractvalue { float, float, float, float } %1139, 3
  %1144 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1125, float %1126, float %1127, float %1128, i32 %979, i32 %982, i32 %985, i32 %988, i32 0, i32 0)
  %1145 = extractvalue { float, float, float, float } %1144, 0
  %1146 = extractvalue { float, float, float, float } %1144, 1
  %1147 = extractvalue { float, float, float, float } %1144, 2
  %1148 = extractvalue { float, float, float, float } %1144, 3
  %1149 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1130, float %1131, float %1132, float %1133, i32 %895, i32 %898, i32 %901, i32 %904, i32 0, i32 0)
  %1150 = extractvalue { float, float, float, float } %1149, 0
  %1151 = extractvalue { float, float, float, float } %1149, 1
  %1152 = extractvalue { float, float, float, float } %1149, 2
  %1153 = extractvalue { float, float, float, float } %1149, 3
  %1154 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1135, float %1136, float %1137, float %1138, i32 %895, i32 %898, i32 %901, i32 %904, i32 0, i32 0)
  %1155 = extractvalue { float, float, float, float } %1154, 0
  %1156 = extractvalue { float, float, float, float } %1154, 1
  %1157 = extractvalue { float, float, float, float } %1154, 2
  %1158 = extractvalue { float, float, float, float } %1154, 3
  %1159 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1140, float %1141, float %1142, float %1143, i32 %991, i32 %994, i32 %997, i32 %1000, i32 0, i32 0)
  %1160 = extractvalue { float, float, float, float } %1159, 0
  %1161 = extractvalue { float, float, float, float } %1159, 1
  %1162 = extractvalue { float, float, float, float } %1159, 2
  %1163 = extractvalue { float, float, float, float } %1159, 3
  %1164 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1145, float %1146, float %1147, float %1148, i32 %991, i32 %994, i32 %997, i32 %1000, i32 0, i32 0)
  %1165 = extractvalue { float, float, float, float } %1164, 0
  %1166 = extractvalue { float, float, float, float } %1164, 1
  %1167 = extractvalue { float, float, float, float } %1164, 2
  %1168 = extractvalue { float, float, float, float } %1164, 3
  %1169 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1150, float %1151, float %1152, float %1153, i32 %907, i32 %910, i32 %913, i32 %916, i32 0, i32 0)
  %1170 = extractvalue { float, float, float, float } %1169, 0
  %1171 = extractvalue { float, float, float, float } %1169, 1
  %1172 = extractvalue { float, float, float, float } %1169, 2
  %1173 = extractvalue { float, float, float, float } %1169, 3
  %1174 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1155, float %1156, float %1157, float %1158, i32 %907, i32 %910, i32 %913, i32 %916, i32 0, i32 0)
  %1175 = extractvalue { float, float, float, float } %1174, 0
  %1176 = extractvalue { float, float, float, float } %1174, 1
  %1177 = extractvalue { float, float, float, float } %1174, 2
  %1178 = extractvalue { float, float, float, float } %1174, 3
  %1179 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1160, float %1161, float %1162, float %1163, i32 %1003, i32 %1006, i32 %1009, i32 %1012, i32 0, i32 0)
  %1180 = extractvalue { float, float, float, float } %1179, 0
  %1181 = extractvalue { float, float, float, float } %1179, 1
  %1182 = extractvalue { float, float, float, float } %1179, 2
  %1183 = extractvalue { float, float, float, float } %1179, 3
  %1184 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %1165, float %1166, float %1167, float %1168, i32 %1003, i32 %1006, i32 %1009, i32 %1012, i32 0, i32 0)
  %1185 = extractvalue { float, float, float, float } %1184, 0
  %1186 = extractvalue { float, float, float, float } %1184, 1
  %1187 = extractvalue { float, float, float, float } %1184, 2
  %1188 = extractvalue { float, float, float, float } %1184, 3
  %1189 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %1170, 0
  %1190 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1189, float %1171, 1
  %1191 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1190, float %1172, 2
  %1192 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1191, float %1173, 3
  %1193 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1192, float %1175, 4
  %1194 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1193, float %1176, 5
  %1195 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1194, float %1177, 6
  %1196 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1195, float %1178, 7
  %1197 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1196, float %1180, 8
  %1198 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1197, float %1181, 9
  %1199 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1198, float %1182, 10
  %1200 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1199, float %1183, 11
  %1201 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1200, float %1185, 12
  %1202 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1201, float %1186, 13
  %1203 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1202, float %1187, 14
  %1204 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %1203, float %1188, 15
  %1205 = add i64 %389, 128
  %1206 = add i32 %391, 1
  %1207 = icmp slt i32 %1206, 3
  %1208 = select i1 %1207, i32 %1206, i32 0
  %1209 = add i64 %1205, %97
  %1210 = add i64 %114, %1209
  %1211 = add i64 %115, %1209
  %1212 = add i64 %116, %1209
  %1213 = add i64 %117, %1209
  %1214 = add i64 %118, %1209
  %1215 = add i64 %119, %1209
  %1216 = add i64 %120, %1209
  %1217 = add i64 %121, %1209
  %1218 = add i64 %122, %1209
  %1219 = add i64 %123, %1209
  %1220 = add i64 %124, %1209
  %1221 = add i64 %125, %1209
  %1222 = add i64 %126, %1209
  %1223 = add i64 %127, %1209
  %1224 = add i64 %128, %1209
  %1225 = add i64 %129, %1209
  %1226 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1210
  %1227 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1211
  %1228 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1212
  %1229 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1213
  %1230 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1214
  %1231 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1215
  %1232 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1216
  %1233 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1217
  %1234 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1218
  %1235 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1219
  %1236 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1220
  %1237 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1221
  %1238 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1222
  %1239 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1223
  %1240 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1224
  %1241 = getelementptr bfloat, ptr addrspace(1) %1, i64 %1225
  %1242 = mul i32 %1208, 16384
  %1243 = add i32 %1242, 0
  %1244 = add i32 %1243, 0
  %1245 = add i32 %1244, 0
  %1246 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1245
  call void @llvm.nvvm.barrier0()
  %1247 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %167
  %1248 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %175
  %1249 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %183
  %1250 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %191
  %1251 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %199
  %1252 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %207
  %1253 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %215
  %1254 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %223
  %1255 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %231
  %1256 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %239
  %1257 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %247
  %1258 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %255
  %1259 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %263
  %1260 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %271
  %1261 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %279
  %1262 = getelementptr inbounds bfloat, ptr addrspace(3) %1246, i32 %287
  %1263 = select i1 %396, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1247, ptr addrspace(1) %1226, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1248, ptr addrspace(1) %1227, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1249, ptr addrspace(1) %1228, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1250, ptr addrspace(1) %1229, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1251, ptr addrspace(1) %1230, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1252, ptr addrspace(1) %1231, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1253, ptr addrspace(1) %1232, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1254, ptr addrspace(1) %1233, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1255, ptr addrspace(1) %1234, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1256, ptr addrspace(1) %1235, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1257, ptr addrspace(1) %1236, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1258, ptr addrspace(1) %1237, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1259, ptr addrspace(1) %1238, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1260, ptr addrspace(1) %1239, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1261, ptr addrspace(1) %1240, i32 %1263)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %1262, ptr addrspace(1) %1241, i32 %1263)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %1264 = add i32 %392, 1
  %1265 = icmp slt i32 %1264, 3
  %1266 = select i1 %1265, i32 %1264, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %1267 = mul i32 %1266, 16384
  %1268 = add i32 %1267, 0
  %1269 = add i32 %1268, 0
  %1270 = add i32 %1269, 0
  %1271 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %1270
  %1272 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %1271, 0
  %1273 = insertvalue { ptr addrspace(3), i32, i32 } %1272, i32 0, 1
  %1274 = insertvalue { ptr addrspace(3), i32, i32 } %1273, i32 0, 2
  %1275 = add i32 %388, 128
  br label %387

1276:                                             ; preds = %387
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %1277 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 0
  %1278 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 1
  %1279 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 2
  %1280 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 3
  %1281 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 4
  %1282 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 5
  %1283 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 6
  %1284 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 7
  %1285 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 8
  %1286 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 9
  %1287 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 10
  %1288 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 11
  %1289 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 12
  %1290 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 13
  %1291 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 14
  %1292 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %390, 15
  %1293 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1277)
  %1294 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1278)
  %1295 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1279)
  %1296 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1280)
  %1297 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1281)
  %1298 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1282)
  %1299 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1283)
  %1300 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1284)
  %1301 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1285)
  %1302 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1286)
  %1303 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1287)
  %1304 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1288)
  %1305 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1289)
  %1306 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1290)
  %1307 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1291)
  %1308 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1292)
  %1309 = mul i32 %13, 16
  %1310 = sext i32 %1309 to i64
  %1311 = add i64 %15, %97
  %1312 = add i64 %1310, %81
  %1313 = add i64 %1310, %82
  %1314 = mul i64 %1312, 8192
  %1315 = mul i64 %1313, 8192
  %1316 = add i64 %1311, %1314
  %1317 = add i64 %1311, %1315
  %1318 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1316
  %1319 = getelementptr bfloat, ptr addrspace(1) %2, i64 %1317
  %1320 = select i1 %64, i32 0, i32 256
  %1321 = xor i32 0, %1320
  %1322 = select i1 %68, i32 0, i32 512
  %1323 = xor i32 %1321, %1322
  %1324 = select i1 %72, i32 0, i32 1
  %1325 = xor i32 %1323, %1324
  %1326 = select i1 %76, i32 0, i32 2
  %1327 = xor i32 %1325, %1326
  %1328 = select i1 %20, i32 0, i32 4
  %1329 = xor i32 %1327, %1328
  %1330 = select i1 %24, i32 0, i32 16
  %1331 = xor i32 %1329, %1330
  %1332 = select i1 %28, i32 0, i32 32
  %1333 = xor i32 %1331, %1332
  %1334 = select i1 %20, i32 0, i32 128
  %1335 = xor i32 %78, %1334
  %1336 = select i1 %24, i32 0, i32 256
  %1337 = xor i32 %1335, %1336
  %1338 = select i1 %28, i32 0, i32 512
  %1339 = xor i32 %1337, %1338
  %1340 = xor i32 %1333, 0
  %1341 = lshr i32 %1340, 7
  %1342 = shl i32 %1341, 3
  %1343 = add i32 %1342, %1340
  %1344 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1343
  %1345 = insertelement <1 x bfloat> undef, bfloat %1293, i32 0
  %1346 = extractelement <1 x bfloat> %1345, i32 0
  %1347 = bitcast bfloat %1346 to i16
  %1348 = insertelement <1 x i16> undef, i16 %1347, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1344, <1 x i16> %1348, i1 true)
  %1349 = xor i32 %1333, 128
  %1350 = lshr i32 %1349, 7
  %1351 = shl i32 %1350, 3
  %1352 = add i32 %1351, %1349
  %1353 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1352
  %1354 = insertelement <1 x bfloat> undef, bfloat %1294, i32 0
  %1355 = extractelement <1 x bfloat> %1354, i32 0
  %1356 = bitcast bfloat %1355 to i16
  %1357 = insertelement <1 x i16> undef, i16 %1356, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1353, <1 x i16> %1357, i1 true)
  %1358 = xor i32 %1333, 8
  %1359 = lshr i32 %1358, 7
  %1360 = shl i32 %1359, 3
  %1361 = add i32 %1360, %1358
  %1362 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1361
  %1363 = insertelement <1 x bfloat> undef, bfloat %1295, i32 0
  %1364 = extractelement <1 x bfloat> %1363, i32 0
  %1365 = bitcast bfloat %1364 to i16
  %1366 = insertelement <1 x i16> undef, i16 %1365, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1362, <1 x i16> %1366, i1 true)
  %1367 = xor i32 %1333, 136
  %1368 = lshr i32 %1367, 7
  %1369 = shl i32 %1368, 3
  %1370 = add i32 %1369, %1367
  %1371 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1370
  %1372 = insertelement <1 x bfloat> undef, bfloat %1296, i32 0
  %1373 = extractelement <1 x bfloat> %1372, i32 0
  %1374 = bitcast bfloat %1373 to i16
  %1375 = insertelement <1 x i16> undef, i16 %1374, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1371, <1 x i16> %1375, i1 true)
  %1376 = xor i32 %1333, 64
  %1377 = lshr i32 %1376, 7
  %1378 = shl i32 %1377, 3
  %1379 = add i32 %1378, %1376
  %1380 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1379
  %1381 = insertelement <1 x bfloat> undef, bfloat %1301, i32 0
  %1382 = extractelement <1 x bfloat> %1381, i32 0
  %1383 = bitcast bfloat %1382 to i16
  %1384 = insertelement <1 x i16> undef, i16 %1383, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1380, <1 x i16> %1384, i1 true)
  %1385 = xor i32 %1333, 192
  %1386 = lshr i32 %1385, 7
  %1387 = shl i32 %1386, 3
  %1388 = add i32 %1387, %1385
  %1389 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1388
  %1390 = insertelement <1 x bfloat> undef, bfloat %1302, i32 0
  %1391 = extractelement <1 x bfloat> %1390, i32 0
  %1392 = bitcast bfloat %1391 to i16
  %1393 = insertelement <1 x i16> undef, i16 %1392, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1389, <1 x i16> %1393, i1 true)
  %1394 = xor i32 %1333, 72
  %1395 = lshr i32 %1394, 7
  %1396 = shl i32 %1395, 3
  %1397 = add i32 %1396, %1394
  %1398 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1397
  %1399 = insertelement <1 x bfloat> undef, bfloat %1303, i32 0
  %1400 = extractelement <1 x bfloat> %1399, i32 0
  %1401 = bitcast bfloat %1400 to i16
  %1402 = insertelement <1 x i16> undef, i16 %1401, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1398, <1 x i16> %1402, i1 true)
  %1403 = xor i32 %1333, 200
  %1404 = lshr i32 %1403, 7
  %1405 = shl i32 %1404, 3
  %1406 = add i32 %1405, %1403
  %1407 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1406
  %1408 = insertelement <1 x bfloat> undef, bfloat %1304, i32 0
  %1409 = extractelement <1 x bfloat> %1408, i32 0
  %1410 = bitcast bfloat %1409 to i16
  %1411 = insertelement <1 x i16> undef, i16 %1410, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1407, <1 x i16> %1411, i1 true)
  call void @llvm.nvvm.barrier0()
  %1412 = xor i32 %1339, 0
  %1413 = lshr i32 %1412, 7
  %1414 = shl i32 %1413, 3
  %1415 = add i32 %1414, %1412
  %1416 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %1415
  %1417 = load <4 x i32>, ptr addrspace(3) %1416, align 16
  %1418 = extractelement <4 x i32> %1417, i32 0
  %1419 = extractelement <4 x i32> %1417, i32 1
  %1420 = extractelement <4 x i32> %1417, i32 2
  %1421 = extractelement <4 x i32> %1417, i32 3
  %1422 = insertelement <4 x i32> undef, i32 %1418, i32 0
  %1423 = insertelement <4 x i32> %1422, i32 %1419, i32 1
  %1424 = insertelement <4 x i32> %1423, i32 %1420, i32 2
  %1425 = insertelement <4 x i32> %1424, i32 %1421, i32 3
  %1426 = extractelement <4 x i32> %1425, i32 0
  %1427 = extractelement <4 x i32> %1425, i32 1
  %1428 = extractelement <4 x i32> %1425, i32 2
  %1429 = extractelement <4 x i32> %1425, i32 3
  %1430 = bitcast i32 %1426 to <2 x i16>
  %1431 = extractelement <2 x i16> %1430, i32 0
  %1432 = extractelement <2 x i16> %1430, i32 1
  %1433 = bitcast i32 %1427 to <2 x i16>
  %1434 = extractelement <2 x i16> %1433, i32 0
  %1435 = extractelement <2 x i16> %1433, i32 1
  %1436 = bitcast i32 %1428 to <2 x i16>
  %1437 = extractelement <2 x i16> %1436, i32 0
  %1438 = extractelement <2 x i16> %1436, i32 1
  %1439 = bitcast i32 %1429 to <2 x i16>
  %1440 = extractelement <2 x i16> %1439, i32 0
  %1441 = extractelement <2 x i16> %1439, i32 1
  %1442 = insertelement <8 x i16> undef, i16 %1431, i32 0
  %1443 = insertelement <8 x i16> %1442, i16 %1432, i32 1
  %1444 = insertelement <8 x i16> %1443, i16 %1434, i32 2
  %1445 = insertelement <8 x i16> %1444, i16 %1435, i32 3
  %1446 = insertelement <8 x i16> %1445, i16 %1437, i32 4
  %1447 = insertelement <8 x i16> %1446, i16 %1438, i32 5
  %1448 = insertelement <8 x i16> %1447, i16 %1440, i32 6
  %1449 = insertelement <8 x i16> %1448, i16 %1441, i32 7
  %1450 = extractelement <8 x i16> %1449, i32 0
  %1451 = extractelement <8 x i16> %1449, i32 1
  %1452 = extractelement <8 x i16> %1449, i32 2
  %1453 = extractelement <8 x i16> %1449, i32 3
  %1454 = extractelement <8 x i16> %1449, i32 4
  %1455 = extractelement <8 x i16> %1449, i32 5
  %1456 = extractelement <8 x i16> %1449, i32 6
  %1457 = extractelement <8 x i16> %1449, i32 7
  %1458 = bitcast i16 %1450 to bfloat
  %1459 = bitcast i16 %1451 to bfloat
  %1460 = bitcast i16 %1452 to bfloat
  %1461 = bitcast i16 %1453 to bfloat
  %1462 = bitcast i16 %1454 to bfloat
  %1463 = bitcast i16 %1455 to bfloat
  %1464 = bitcast i16 %1456 to bfloat
  %1465 = bitcast i16 %1457 to bfloat
  %1466 = insertelement <8 x bfloat> undef, bfloat %1458, i32 0
  %1467 = insertelement <8 x bfloat> %1466, bfloat %1459, i32 1
  %1468 = insertelement <8 x bfloat> %1467, bfloat %1460, i32 2
  %1469 = insertelement <8 x bfloat> %1468, bfloat %1461, i32 3
  %1470 = insertelement <8 x bfloat> %1469, bfloat %1462, i32 4
  %1471 = insertelement <8 x bfloat> %1470, bfloat %1463, i32 5
  %1472 = insertelement <8 x bfloat> %1471, bfloat %1464, i32 6
  %1473 = insertelement <8 x bfloat> %1472, bfloat %1465, i32 7
  %1474 = extractelement <8 x bfloat> %1473, i32 0
  %1475 = extractelement <8 x bfloat> %1473, i32 1
  %1476 = extractelement <8 x bfloat> %1473, i32 2
  %1477 = extractelement <8 x bfloat> %1473, i32 3
  %1478 = extractelement <8 x bfloat> %1473, i32 4
  %1479 = extractelement <8 x bfloat> %1473, i32 5
  %1480 = extractelement <8 x bfloat> %1473, i32 6
  %1481 = extractelement <8 x bfloat> %1473, i32 7
  call void @llvm.nvvm.barrier0()
  %1482 = insertelement <1 x bfloat> undef, bfloat %1297, i32 0
  %1483 = extractelement <1 x bfloat> %1482, i32 0
  %1484 = bitcast bfloat %1483 to i16
  %1485 = insertelement <1 x i16> undef, i16 %1484, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1344, <1 x i16> %1485, i1 true)
  %1486 = insertelement <1 x bfloat> undef, bfloat %1298, i32 0
  %1487 = extractelement <1 x bfloat> %1486, i32 0
  %1488 = bitcast bfloat %1487 to i16
  %1489 = insertelement <1 x i16> undef, i16 %1488, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1353, <1 x i16> %1489, i1 true)
  %1490 = insertelement <1 x bfloat> undef, bfloat %1299, i32 0
  %1491 = extractelement <1 x bfloat> %1490, i32 0
  %1492 = bitcast bfloat %1491 to i16
  %1493 = insertelement <1 x i16> undef, i16 %1492, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1362, <1 x i16> %1493, i1 true)
  %1494 = insertelement <1 x bfloat> undef, bfloat %1300, i32 0
  %1495 = extractelement <1 x bfloat> %1494, i32 0
  %1496 = bitcast bfloat %1495 to i16
  %1497 = insertelement <1 x i16> undef, i16 %1496, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1371, <1 x i16> %1497, i1 true)
  %1498 = insertelement <1 x bfloat> undef, bfloat %1305, i32 0
  %1499 = extractelement <1 x bfloat> %1498, i32 0
  %1500 = bitcast bfloat %1499 to i16
  %1501 = insertelement <1 x i16> undef, i16 %1500, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1380, <1 x i16> %1501, i1 true)
  %1502 = insertelement <1 x bfloat> undef, bfloat %1306, i32 0
  %1503 = extractelement <1 x bfloat> %1502, i32 0
  %1504 = bitcast bfloat %1503 to i16
  %1505 = insertelement <1 x i16> undef, i16 %1504, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1389, <1 x i16> %1505, i1 true)
  %1506 = insertelement <1 x bfloat> undef, bfloat %1307, i32 0
  %1507 = extractelement <1 x bfloat> %1506, i32 0
  %1508 = bitcast bfloat %1507 to i16
  %1509 = insertelement <1 x i16> undef, i16 %1508, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1398, <1 x i16> %1509, i1 true)
  %1510 = insertelement <1 x bfloat> undef, bfloat %1308, i32 0
  %1511 = extractelement <1 x bfloat> %1510, i32 0
  %1512 = bitcast bfloat %1511 to i16
  %1513 = insertelement <1 x i16> undef, i16 %1512, i32 0
  call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %1407, <1 x i16> %1513, i1 true)
  call void @llvm.nvvm.barrier0()
  %1514 = load <4 x i32>, ptr addrspace(3) %1416, align 16
  %1515 = extractelement <4 x i32> %1514, i32 0
  %1516 = extractelement <4 x i32> %1514, i32 1
  %1517 = extractelement <4 x i32> %1514, i32 2
  %1518 = extractelement <4 x i32> %1514, i32 3
  %1519 = insertelement <4 x i32> undef, i32 %1515, i32 0
  %1520 = insertelement <4 x i32> %1519, i32 %1516, i32 1
  %1521 = insertelement <4 x i32> %1520, i32 %1517, i32 2
  %1522 = insertelement <4 x i32> %1521, i32 %1518, i32 3
  %1523 = extractelement <4 x i32> %1522, i32 0
  %1524 = extractelement <4 x i32> %1522, i32 1
  %1525 = extractelement <4 x i32> %1522, i32 2
  %1526 = extractelement <4 x i32> %1522, i32 3
  %1527 = bitcast i32 %1523 to <2 x i16>
  %1528 = extractelement <2 x i16> %1527, i32 0
  %1529 = extractelement <2 x i16> %1527, i32 1
  %1530 = bitcast i32 %1524 to <2 x i16>
  %1531 = extractelement <2 x i16> %1530, i32 0
  %1532 = extractelement <2 x i16> %1530, i32 1
  %1533 = bitcast i32 %1525 to <2 x i16>
  %1534 = extractelement <2 x i16> %1533, i32 0
  %1535 = extractelement <2 x i16> %1533, i32 1
  %1536 = bitcast i32 %1526 to <2 x i16>
  %1537 = extractelement <2 x i16> %1536, i32 0
  %1538 = extractelement <2 x i16> %1536, i32 1
  %1539 = insertelement <8 x i16> undef, i16 %1528, i32 0
  %1540 = insertelement <8 x i16> %1539, i16 %1529, i32 1
  %1541 = insertelement <8 x i16> %1540, i16 %1531, i32 2
  %1542 = insertelement <8 x i16> %1541, i16 %1532, i32 3
  %1543 = insertelement <8 x i16> %1542, i16 %1534, i32 4
  %1544 = insertelement <8 x i16> %1543, i16 %1535, i32 5
  %1545 = insertelement <8 x i16> %1544, i16 %1537, i32 6
  %1546 = insertelement <8 x i16> %1545, i16 %1538, i32 7
  %1547 = extractelement <8 x i16> %1546, i32 0
  %1548 = extractelement <8 x i16> %1546, i32 1
  %1549 = extractelement <8 x i16> %1546, i32 2
  %1550 = extractelement <8 x i16> %1546, i32 3
  %1551 = extractelement <8 x i16> %1546, i32 4
  %1552 = extractelement <8 x i16> %1546, i32 5
  %1553 = extractelement <8 x i16> %1546, i32 6
  %1554 = extractelement <8 x i16> %1546, i32 7
  %1555 = bitcast i16 %1547 to bfloat
  %1556 = bitcast i16 %1548 to bfloat
  %1557 = bitcast i16 %1549 to bfloat
  %1558 = bitcast i16 %1550 to bfloat
  %1559 = bitcast i16 %1551 to bfloat
  %1560 = bitcast i16 %1552 to bfloat
  %1561 = bitcast i16 %1553 to bfloat
  %1562 = bitcast i16 %1554 to bfloat
  %1563 = insertelement <8 x bfloat> undef, bfloat %1555, i32 0
  %1564 = insertelement <8 x bfloat> %1563, bfloat %1556, i32 1
  %1565 = insertelement <8 x bfloat> %1564, bfloat %1557, i32 2
  %1566 = insertelement <8 x bfloat> %1565, bfloat %1558, i32 3
  %1567 = insertelement <8 x bfloat> %1566, bfloat %1559, i32 4
  %1568 = insertelement <8 x bfloat> %1567, bfloat %1560, i32 5
  %1569 = insertelement <8 x bfloat> %1568, bfloat %1561, i32 6
  %1570 = insertelement <8 x bfloat> %1569, bfloat %1562, i32 7
  %1571 = extractelement <8 x bfloat> %1570, i32 0
  %1572 = extractelement <8 x bfloat> %1570, i32 1
  %1573 = extractelement <8 x bfloat> %1570, i32 2
  %1574 = extractelement <8 x bfloat> %1570, i32 3
  %1575 = extractelement <8 x bfloat> %1570, i32 4
  %1576 = extractelement <8 x bfloat> %1570, i32 5
  %1577 = extractelement <8 x bfloat> %1570, i32 6
  %1578 = extractelement <8 x bfloat> %1570, i32 7
  %1579 = insertelement <2 x bfloat> undef, bfloat %1474, i32 0
  %1580 = insertelement <2 x bfloat> %1579, bfloat %1475, i32 1
  %1581 = bitcast <2 x bfloat> %1580 to i32
  %1582 = insertelement <2 x bfloat> undef, bfloat %1476, i32 0
  %1583 = insertelement <2 x bfloat> %1582, bfloat %1477, i32 1
  %1584 = bitcast <2 x bfloat> %1583 to i32
  %1585 = insertelement <2 x bfloat> undef, bfloat %1478, i32 0
  %1586 = insertelement <2 x bfloat> %1585, bfloat %1479, i32 1
  %1587 = bitcast <2 x bfloat> %1586 to i32
  %1588 = insertelement <2 x bfloat> undef, bfloat %1480, i32 0
  %1589 = insertelement <2 x bfloat> %1588, bfloat %1481, i32 1
  %1590 = bitcast <2 x bfloat> %1589 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1581, i32 %1584, i32 %1587, i32 %1590, ptr addrspace(1) %1318)
  %1591 = insertelement <2 x bfloat> undef, bfloat %1571, i32 0
  %1592 = insertelement <2 x bfloat> %1591, bfloat %1572, i32 1
  %1593 = bitcast <2 x bfloat> %1592 to i32
  %1594 = insertelement <2 x bfloat> undef, bfloat %1573, i32 0
  %1595 = insertelement <2 x bfloat> %1594, bfloat %1574, i32 1
  %1596 = bitcast <2 x bfloat> %1595 to i32
  %1597 = insertelement <2 x bfloat> undef, bfloat %1575, i32 0
  %1598 = insertelement <2 x bfloat> %1597, bfloat %1576, i32 1
  %1599 = bitcast <2 x bfloat> %1598 to i32
  %1600 = insertelement <2 x bfloat> undef, bfloat %1577, i32 0
  %1601 = insertelement <2 x bfloat> %1600, bfloat %1578, i32 1
  %1602 = bitcast <2 x bfloat> %1601 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1593, i32 %1596, i32 %1599, i32 %1602, ptr addrspace(1) %1319)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_116_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_116(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) #6 {
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
  %12 = mul i64 %9, 8192
  %13 = add i64 %11, %12
  %14 = add i64 %13, 7168
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
  %80 = add i64 %12, 7168
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

define ptx_kernel void @loop_convert_fusion_7(ptr noalias align 128 dereferenceable(196608) %0, ptr noalias align 128 dereferenceable(98304) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_7_param_0_229(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_7_param_0_229(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_7_param_0_229(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !2
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_114_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_114(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
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
  %13 = mul i64 %10, 8192
  %14 = add i64 %12, %13
  %15 = add i64 %14, 6144
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
  %77 = add i64 %14, 7168
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
  %120 = add i64 %13, 6144
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
  %246 = add i64 %13, 7168
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

declare ptx_kernel void @fusion_112_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_112(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %11 = mul i64 %10, 8192
  %12 = add i64 %11, 5120
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
  %100 = getelementptr bfloat, ptr addrspace(1) %3, i64 %99
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
  %153 = add i64 %11, 6144
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
  %260 = add i64 %11, 7168
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

define ptx_kernel void @loop_add_fusion(ptr noalias align 128 dereferenceable(262144) %0, ptr noalias align 128 dereferenceable(32768) %1, ptr noalias align 128 dereferenceable(32768) %2, ptr noalias align 128 dereferenceable(32768) %3, ptr noalias align 128 dereferenceable(32768) %4, ptr noalias align 128 dereferenceable(65536) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %9 = udiv i32 %8, 8
  %10 = urem i32 %8, 8
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %7
  %13 = mul i32 %8, 128
  %14 = add i32 %13, %7
  %15 = getelementptr inbounds bfloat, ptr %3, i32 %14
  %16 = load bfloat, ptr %15, align 2, !invariant.load !2
  %17 = getelementptr inbounds bfloat, ptr %4, i32 %14
  %18 = load bfloat, ptr %17, align 2, !invariant.load !2
  %19 = add i32 %12, 7168
  %20 = call float @fused_add_convert_429_16(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %19)
  %21 = fpext bfloat %16 to float
  %22 = fpext bfloat %18 to float
  %23 = fadd float %20, %21
  %24 = getelementptr inbounds bfloat, ptr %2, i32 %14
  %25 = load bfloat, ptr %24, align 2, !invariant.load !2
  %26 = add i32 %12, 6144
  %27 = call float @fused_add_convert_429_16(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %26)
  %28 = fadd float %22, %23
  %29 = fpext bfloat %25 to float
  %30 = fadd float %27, %28
  %31 = getelementptr inbounds bfloat, ptr %1, i32 %14
  %32 = load bfloat, ptr %31, align 2, !invariant.load !2
  %33 = add i32 %12, 5120
  %34 = call float @fused_add_convert_429_16(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %33)
  %35 = fadd float %29, %30
  %36 = fpext bfloat %32 to float
  %37 = fadd float %34, %35
  %38 = add i32 %12, 4096
  %39 = call float @fused_add_convert_429_16(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %9, i32 %38)
  %40 = fadd float %36, %37
  %41 = fadd float %39, %40
  %42 = getelementptr inbounds float, ptr %5, i32 %14
  store float %41, ptr %42, align 4
  ret void
}

define internal float @fused_add_convert_429_16(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, i32 %5, i32 %6) {
  %8 = mul i32 %5, 8192
  %9 = add i32 %8, %6
  %10 = getelementptr inbounds bfloat, ptr %0, i32 %9
  %11 = load bfloat, ptr %10, align 2, !invariant.load !2
  %12 = fpext bfloat %11 to float
  ret float %12
}

declare ptx_kernel void @fusion_110_impl(ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_110(ptr noalias align 128 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr null to ptr addrspace(1)
  %6 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %7 = sext i32 %6 to i64
  %8 = udiv i64 %7, 8
  %9 = urem i64 %7, 8
  %10 = mul i64 %9, 128
  %11 = mul i64 %7, 128
  %12 = getelementptr float, ptr addrspace(1) %1, i64 %11
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = urem i32 %13, 32
  %15 = udiv i32 %13, 32
  %16 = and i32 %14, 1
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 0, i32 2
  %19 = xor i32 0, %18
  %20 = and i32 %14, 2
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 4
  %23 = xor i32 %19, %22
  %24 = and i32 %14, 4
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 0, i32 8
  %27 = xor i32 %23, %26
  %28 = and i32 %14, 8
  %29 = icmp eq i32 %28, 0
  %30 = select i1 %29, i32 0, i32 16
  %31 = xor i32 %27, %30
  %32 = and i32 %14, 16
  %33 = icmp eq i32 %32, 0
  %34 = select i1 %33, i32 0, i32 32
  %35 = xor i32 %31, %34
  %36 = and i32 %15, 1
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 0, i32 64
  %39 = xor i32 %35, %38
  %40 = xor i32 %39, 0
  %41 = add i32 %40, 0
  %42 = sext i32 %41 to i64
  %43 = getelementptr float, ptr addrspace(1) %12, i64 %42
  %44 = call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %43)
  %45 = extractvalue { i32, i32 } %44, 0
  %46 = bitcast i32 %45 to <1 x float>
  %47 = extractvalue { i32, i32 } %44, 1
  %48 = bitcast i32 %47 to <1 x float>
  %49 = extractelement <1 x float> %46, i32 0
  %50 = extractelement <1 x float> %48, i32 0
  %51 = mul i64 %8, 1024
  %52 = getelementptr float, ptr addrspace(1) %1, i64 %51
  %53 = select i1 %17, i32 0, i32 4
  %54 = xor i32 0, %53
  %55 = select i1 %21, i32 0, i32 8
  %56 = xor i32 %54, %55
  %57 = select i1 %25, i32 0, i32 16
  %58 = xor i32 %56, %57
  %59 = select i1 %29, i32 0, i32 32
  %60 = xor i32 %58, %59
  %61 = select i1 %33, i32 0, i32 64
  %62 = xor i32 %60, %61
  %63 = select i1 %37, i32 0, i32 128
  %64 = xor i32 %62, %63
  %65 = xor i32 %64, 0
  %66 = xor i32 %64, 256
  %67 = xor i32 %64, 512
  %68 = xor i32 %64, 768
  %69 = add i32 %65, 0
  %70 = add i32 %66, 0
  %71 = add i32 %67, 0
  %72 = add i32 %68, 0
  %73 = sext i32 %69 to i64
  %74 = sext i32 %70 to i64
  %75 = sext i32 %71 to i64
  %76 = sext i32 %72 to i64
  %77 = getelementptr float, ptr addrspace(1) %52, i64 %73
  %78 = getelementptr float, ptr addrspace(1) %52, i64 %74
  %79 = getelementptr float, ptr addrspace(1) %52, i64 %75
  %80 = getelementptr float, ptr addrspace(1) %52, i64 %76
  %81 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %77)
  %82 = extractvalue { i32, i32, i32, i32 } %81, 0
  %83 = bitcast i32 %82 to <1 x float>
  %84 = extractvalue { i32, i32, i32, i32 } %81, 1
  %85 = bitcast i32 %84 to <1 x float>
  %86 = extractvalue { i32, i32, i32, i32 } %81, 2
  %87 = bitcast i32 %86 to <1 x float>
  %88 = extractvalue { i32, i32, i32, i32 } %81, 3
  %89 = bitcast i32 %88 to <1 x float>
  %90 = extractelement <1 x float> %83, i32 0
  %91 = extractelement <1 x float> %85, i32 0
  %92 = extractelement <1 x float> %87, i32 0
  %93 = extractelement <1 x float> %89, i32 0
  %94 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %78)
  %95 = extractvalue { i32, i32, i32, i32 } %94, 0
  %96 = bitcast i32 %95 to <1 x float>
  %97 = extractvalue { i32, i32, i32, i32 } %94, 1
  %98 = bitcast i32 %97 to <1 x float>
  %99 = extractvalue { i32, i32, i32, i32 } %94, 2
  %100 = bitcast i32 %99 to <1 x float>
  %101 = extractvalue { i32, i32, i32, i32 } %94, 3
  %102 = bitcast i32 %101 to <1 x float>
  %103 = extractelement <1 x float> %96, i32 0
  %104 = extractelement <1 x float> %98, i32 0
  %105 = extractelement <1 x float> %100, i32 0
  %106 = extractelement <1 x float> %102, i32 0
  %107 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %79)
  %108 = extractvalue { i32, i32, i32, i32 } %107, 0
  %109 = bitcast i32 %108 to <1 x float>
  %110 = extractvalue { i32, i32, i32, i32 } %107, 1
  %111 = bitcast i32 %110 to <1 x float>
  %112 = extractvalue { i32, i32, i32, i32 } %107, 2
  %113 = bitcast i32 %112 to <1 x float>
  %114 = extractvalue { i32, i32, i32, i32 } %107, 3
  %115 = bitcast i32 %114 to <1 x float>
  %116 = extractelement <1 x float> %109, i32 0
  %117 = extractelement <1 x float> %111, i32 0
  %118 = extractelement <1 x float> %113, i32 0
  %119 = extractelement <1 x float> %115, i32 0
  %120 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %80)
  %121 = extractvalue { i32, i32, i32, i32 } %120, 0
  %122 = bitcast i32 %121 to <1 x float>
  %123 = extractvalue { i32, i32, i32, i32 } %120, 1
  %124 = bitcast i32 %123 to <1 x float>
  %125 = extractvalue { i32, i32, i32, i32 } %120, 2
  %126 = bitcast i32 %125 to <1 x float>
  %127 = extractvalue { i32, i32, i32, i32 } %120, 3
  %128 = bitcast i32 %127 to <1 x float>
  %129 = extractelement <1 x float> %122, i32 0
  %130 = extractelement <1 x float> %124, i32 0
  %131 = extractelement <1 x float> %126, i32 0
  %132 = extractelement <1 x float> %128, i32 0
  %133 = fmul float %90, %90
  %134 = fmul float %91, %91
  %135 = fmul float %92, %92
  %136 = fmul float %93, %93
  %137 = fmul float %103, %103
  %138 = fmul float %104, %104
  %139 = fmul float %105, %105
  %140 = fmul float %106, %106
  %141 = fmul float %116, %116
  %142 = fmul float %117, %117
  %143 = fmul float %118, %118
  %144 = fmul float %119, %119
  %145 = fmul float %129, %129
  %146 = fmul float %130, %130
  %147 = fmul float %131, %131
  %148 = fmul float %132, %132
  %149 = fadd float %133, %134
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
  %160 = fadd float %159, %145
  %161 = fadd float %160, %146
  %162 = fadd float %161, %147
  %163 = fadd float %162, %148
  %164 = bitcast float %163 to i32
  %165 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %164, i32 16, i32 31)
  %166 = bitcast i32 %165 to float
  %167 = fadd float %163, %166
  %168 = bitcast float %167 to i32
  %169 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %168, i32 8, i32 31)
  %170 = bitcast i32 %169 to float
  %171 = fadd float %167, %170
  %172 = bitcast float %171 to i32
  %173 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %172, i32 4, i32 31)
  %174 = bitcast i32 %173 to float
  %175 = fadd float %171, %174
  %176 = bitcast float %175 to i32
  %177 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %176, i32 2, i32 31)
  %178 = bitcast i32 %177 to float
  %179 = fadd float %175, %178
  %180 = bitcast float %179 to i32
  %181 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %180, i32 1, i32 31)
  %182 = bitcast i32 %181 to float
  %183 = fadd float %179, %182
  %184 = urem i32 %14, 32
  %185 = urem i32 %15, 2
  %186 = icmp eq i32 %184, 0
  %187 = and i1 true, %186
  %188 = add i32 0, %185
  %189 = getelementptr float, ptr addrspace(3) @global_smem, i32 %188
  %190 = insertelement <1 x float> undef, float %183, i32 0
  %191 = extractelement <1 x float> %190, i32 0
  %192 = bitcast float %191 to i32
  %193 = insertelement <1 x i32> undef, i32 %192, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %189, <1 x i32> %193, i1 %187)
  call void @llvm.nvvm.barrier0()
  %194 = icmp slt i32 %13, 2
  %195 = getelementptr float, ptr addrspace(3) @global_smem, i32 %13
  %196 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %195, i1 %194)
  %197 = insertelement <1 x i32> undef, i32 %196, i32 0
  %198 = extractelement <1 x i32> %197, i32 0
  %199 = bitcast i32 %198 to float
  %200 = insertelement <1 x float> undef, float %199, i32 0
  %201 = extractelement <1 x float> %200, i32 0
  %202 = bitcast float %201 to i32
  %203 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %202, i32 1, i32 31)
  %204 = bitcast i32 %203 to float
  %205 = fadd float %201, %204
  %206 = urem i32 %14, 2
  %207 = icmp eq i32 %206, 0
  %208 = and i1 %194, %207
  %209 = insertelement <1 x float> undef, float %205, i32 0
  %210 = extractelement <1 x float> %209, i32 0
  %211 = bitcast float %210 to i32
  %212 = insertelement <1 x i32> undef, i32 %211, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %195, <1 x i32> %212, i1 %208)
  call void @llvm.nvvm.barrier0()
  %213 = load float, ptr addrspace(3) @global_smem, align 4
  %214 = fmul float %213, 0x3F50000000000000
  %215 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %2)
  %216 = bitcast i32 %215 to <1 x float>
  %217 = extractelement <1 x float> %216, i32 0
  %218 = fadd float %214, %217
  %219 = call float @__nv_rsqrtf(float %218)
  %220 = fmul float %49, %219
  %221 = fmul float %50, %219
  %222 = getelementptr bfloat, ptr addrspace(1) %3, i64 %10
  %223 = getelementptr bfloat, ptr addrspace(1) %222, i64 %42
  %224 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %223)
  %225 = bitcast i32 %224 to <2 x bfloat>
  %226 = extractelement <2 x bfloat> %225, i32 0
  %227 = extractelement <2 x bfloat> %225, i32 1
  %228 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %229 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %230 = fmul float %220, %228
  %231 = fmul float %221, %229
  %232 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %230)
  %233 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %231)
  %234 = getelementptr bfloat, ptr addrspace(1) %4, i64 %11
  %235 = getelementptr bfloat, ptr addrspace(1) %234, i64 %42
  %236 = insertelement <2 x bfloat> undef, bfloat %232, i32 0
  %237 = insertelement <2 x bfloat> %236, bfloat %233, i32 1
  %238 = bitcast <2 x bfloat> %237 to i32
  call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %238, ptr addrspace(1) %235)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_108_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_108(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 8192
  %11 = add i64 %10, 3072
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
  %104 = mul i64 %9, 1024
  %105 = getelementptr bfloat, ptr addrspace(1) %4, i64 %104
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
  %158 = getelementptr float, ptr addrspace(1) %3, i64 %104
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
  %350 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %351 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
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

declare ptx_kernel void @fusion_106_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_106(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) #6 {
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
  %11 = mul i64 %10, 8192
  %12 = add i64 %11, 2048
  %13 = getelementptr bfloat, ptr addrspace(1) %5, i64 %12
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
  %105 = mul i64 %10, 1024
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
  %159 = add i64 %11, 3072
  %160 = getelementptr bfloat, ptr addrspace(1) %5, i64 %159
  %161 = getelementptr bfloat, ptr addrspace(1) %160, i64 %49
  %162 = getelementptr bfloat, ptr addrspace(1) %160, i64 %51
  %163 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %161)
  %164 = extractvalue { i32, i32, i32, i32 } %163, 0
  %165 = bitcast i32 %164 to <2 x bfloat>
  %166 = extractvalue { i32, i32, i32, i32 } %163, 1
  %167 = bitcast i32 %166 to <2 x bfloat>
  %168 = extractvalue { i32, i32, i32, i32 } %163, 2
  %169 = bitcast i32 %168 to <2 x bfloat>
  %170 = extractvalue { i32, i32, i32, i32 } %163, 3
  %171 = bitcast i32 %170 to <2 x bfloat>
  %172 = extractelement <2 x bfloat> %165, i32 0
  %173 = extractelement <2 x bfloat> %165, i32 1
  %174 = extractelement <2 x bfloat> %167, i32 0
  %175 = extractelement <2 x bfloat> %167, i32 1
  %176 = extractelement <2 x bfloat> %169, i32 0
  %177 = extractelement <2 x bfloat> %169, i32 1
  %178 = extractelement <2 x bfloat> %171, i32 0
  %179 = extractelement <2 x bfloat> %171, i32 1
  %180 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %181 = extractvalue { i32, i32, i32, i32 } %180, 0
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %180, 1
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractvalue { i32, i32, i32, i32 } %180, 2
  %186 = bitcast i32 %185 to <2 x bfloat>
  %187 = extractvalue { i32, i32, i32, i32 } %180, 3
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractelement <2 x bfloat> %182, i32 0
  %190 = extractelement <2 x bfloat> %182, i32 1
  %191 = extractelement <2 x bfloat> %184, i32 0
  %192 = extractelement <2 x bfloat> %184, i32 1
  %193 = extractelement <2 x bfloat> %186, i32 0
  %194 = extractelement <2 x bfloat> %186, i32 1
  %195 = extractelement <2 x bfloat> %188, i32 0
  %196 = extractelement <2 x bfloat> %188, i32 1
  %197 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172)
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %213 = getelementptr bfloat, ptr addrspace(1) %4, i64 %105
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
  %266 = getelementptr float, ptr addrspace(1) %3, i64 %105
  %267 = getelementptr float, ptr addrspace(1) %266, i64 %49
  %268 = getelementptr float, ptr addrspace(1) %266, i64 %50
  %269 = getelementptr float, ptr addrspace(1) %266, i64 %51
  %270 = getelementptr float, ptr addrspace(1) %266, i64 %52
  %271 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %267)
  %272 = extractvalue { i32, i32, i32, i32 } %271, 0
  %273 = bitcast i32 %272 to <1 x float>
  %274 = extractvalue { i32, i32, i32, i32 } %271, 1
  %275 = bitcast i32 %274 to <1 x float>
  %276 = extractvalue { i32, i32, i32, i32 } %271, 2
  %277 = bitcast i32 %276 to <1 x float>
  %278 = extractvalue { i32, i32, i32, i32 } %271, 3
  %279 = bitcast i32 %278 to <1 x float>
  %280 = extractelement <1 x float> %273, i32 0
  %281 = extractelement <1 x float> %275, i32 0
  %282 = extractelement <1 x float> %277, i32 0
  %283 = extractelement <1 x float> %279, i32 0
  %284 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %268)
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = bitcast i32 %285 to <1 x float>
  %287 = extractvalue { i32, i32, i32, i32 } %284, 1
  %288 = bitcast i32 %287 to <1 x float>
  %289 = extractvalue { i32, i32, i32, i32 } %284, 2
  %290 = bitcast i32 %289 to <1 x float>
  %291 = extractvalue { i32, i32, i32, i32 } %284, 3
  %292 = bitcast i32 %291 to <1 x float>
  %293 = extractelement <1 x float> %286, i32 0
  %294 = extractelement <1 x float> %288, i32 0
  %295 = extractelement <1 x float> %290, i32 0
  %296 = extractelement <1 x float> %292, i32 0
  %297 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
  %298 = extractvalue { i32, i32, i32, i32 } %297, 0
  %299 = bitcast i32 %298 to <1 x float>
  %300 = extractvalue { i32, i32, i32, i32 } %297, 1
  %301 = bitcast i32 %300 to <1 x float>
  %302 = extractvalue { i32, i32, i32, i32 } %297, 2
  %303 = bitcast i32 %302 to <1 x float>
  %304 = extractvalue { i32, i32, i32, i32 } %297, 3
  %305 = bitcast i32 %304 to <1 x float>
  %306 = extractelement <1 x float> %299, i32 0
  %307 = extractelement <1 x float> %301, i32 0
  %308 = extractelement <1 x float> %303, i32 0
  %309 = extractelement <1 x float> %305, i32 0
  %310 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %270)
  %311 = extractvalue { i32, i32, i32, i32 } %310, 0
  %312 = bitcast i32 %311 to <1 x float>
  %313 = extractvalue { i32, i32, i32, i32 } %310, 1
  %314 = bitcast i32 %313 to <1 x float>
  %315 = extractvalue { i32, i32, i32, i32 } %310, 2
  %316 = bitcast i32 %315 to <1 x float>
  %317 = extractvalue { i32, i32, i32, i32 } %310, 3
  %318 = bitcast i32 %317 to <1 x float>
  %319 = extractelement <1 x float> %312, i32 0
  %320 = extractelement <1 x float> %314, i32 0
  %321 = extractelement <1 x float> %316, i32 0
  %322 = extractelement <1 x float> %318, i32 0
  %323 = fadd float %250, %280
  %324 = fadd float %251, %281
  %325 = fadd float %252, %282
  %326 = fadd float %253, %283
  %327 = fadd float %254, %293
  %328 = fadd float %255, %294
  %329 = fadd float %256, %295
  %330 = fadd float %257, %296
  %331 = fadd float %258, %306
  %332 = fadd float %259, %307
  %333 = fadd float %260, %308
  %334 = fadd float %261, %309
  %335 = fadd float %262, %319
  %336 = fadd float %263, %320
  %337 = fadd float %264, %321
  %338 = fadd float %265, %322
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
  %354 = fadd float %212, %338
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
  %370 = fadd float %158, %354
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
  %386 = fadd float %104, %370
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
  %402 = fmul float %386, %386
  %403 = fadd float %387, %388
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
  %417 = fadd float %416, %402
  %418 = bitcast float %417 to i32
  %419 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %418, i32 16, i32 31)
  %420 = bitcast i32 %419 to float
  %421 = fadd float %417, %420
  %422 = bitcast float %421 to i32
  %423 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %422, i32 8, i32 31)
  %424 = bitcast i32 %423 to float
  %425 = fadd float %421, %424
  %426 = bitcast float %425 to i32
  %427 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %426, i32 4, i32 31)
  %428 = bitcast i32 %427 to float
  %429 = fadd float %425, %428
  %430 = bitcast float %429 to i32
  %431 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %430, i32 2, i32 31)
  %432 = bitcast i32 %431 to float
  %433 = fadd float %429, %432
  %434 = bitcast float %433 to i32
  %435 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %434, i32 1, i32 31)
  %436 = bitcast i32 %435 to float
  %437 = fadd float %433, %436
  %438 = urem i32 %15, 32
  %439 = urem i32 %16, 2
  %440 = icmp eq i32 %438, 0
  %441 = and i1 true, %440
  %442 = add i32 0, %439
  %443 = getelementptr float, ptr addrspace(3) @global_smem, i32 %442
  %444 = insertelement <1 x float> undef, float %437, i32 0
  %445 = extractelement <1 x float> %444, i32 0
  %446 = bitcast float %445 to i32
  %447 = insertelement <1 x i32> undef, i32 %446, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %443, <1 x i32> %447, i1 %441)
  call void @llvm.nvvm.barrier0()
  %448 = icmp slt i32 %14, 2
  %449 = getelementptr float, ptr addrspace(3) @global_smem, i32 %14
  %450 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %449, i1 %448)
  %451 = insertelement <1 x i32> undef, i32 %450, i32 0
  %452 = extractelement <1 x i32> %451, i32 0
  %453 = bitcast i32 %452 to float
  %454 = insertelement <1 x float> undef, float %453, i32 0
  %455 = extractelement <1 x float> %454, i32 0
  %456 = bitcast float %455 to i32
  %457 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %456, i32 1, i32 31)
  %458 = bitcast i32 %457 to float
  %459 = fadd float %455, %458
  %460 = urem i32 %15, 2
  %461 = icmp eq i32 %460, 0
  %462 = and i1 %448, %461
  %463 = insertelement <1 x float> undef, float %459, i32 0
  %464 = extractelement <1 x float> %463, i32 0
  %465 = bitcast float %464 to i32
  %466 = insertelement <1 x i32> undef, i32 %465, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %449, <1 x i32> %466, i1 %462)
  call void @llvm.nvvm.barrier0()
  %467 = load float, ptr addrspace(3) @global_smem, align 4
  %468 = fmul float %467, 0x3F50000000000000
  %469 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %470 = bitcast i32 %469 to <1 x float>
  %471 = extractelement <1 x float> %470, i32 0
  %472 = fadd float %468, %471
  %473 = call float @__nv_rsqrtf(float %472)
  %474 = fmul float %371, %473
  %475 = fmul float %372, %473
  %476 = fmul float %373, %473
  %477 = fmul float %374, %473
  %478 = fmul float %375, %473
  %479 = fmul float %376, %473
  %480 = fmul float %377, %473
  %481 = fmul float %378, %473
  %482 = fmul float %379, %473
  %483 = fmul float %380, %473
  %484 = fmul float %381, %473
  %485 = fmul float %382, %473
  %486 = fmul float %383, %473
  %487 = fmul float %384, %473
  %488 = fmul float %385, %473
  %489 = fmul float %386, %473
  %490 = getelementptr bfloat, ptr addrspace(1) %2, i64 %49
  %491 = getelementptr bfloat, ptr addrspace(1) %2, i64 %51
  %492 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %490)
  %493 = extractvalue { i32, i32, i32, i32 } %492, 0
  %494 = bitcast i32 %493 to <2 x bfloat>
  %495 = extractvalue { i32, i32, i32, i32 } %492, 1
  %496 = bitcast i32 %495 to <2 x bfloat>
  %497 = extractvalue { i32, i32, i32, i32 } %492, 2
  %498 = bitcast i32 %497 to <2 x bfloat>
  %499 = extractvalue { i32, i32, i32, i32 } %492, 3
  %500 = bitcast i32 %499 to <2 x bfloat>
  %501 = extractelement <2 x bfloat> %494, i32 0
  %502 = extractelement <2 x bfloat> %494, i32 1
  %503 = extractelement <2 x bfloat> %496, i32 0
  %504 = extractelement <2 x bfloat> %496, i32 1
  %505 = extractelement <2 x bfloat> %498, i32 0
  %506 = extractelement <2 x bfloat> %498, i32 1
  %507 = extractelement <2 x bfloat> %500, i32 0
  %508 = extractelement <2 x bfloat> %500, i32 1
  %509 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %491)
  %510 = extractvalue { i32, i32, i32, i32 } %509, 0
  %511 = bitcast i32 %510 to <2 x bfloat>
  %512 = extractvalue { i32, i32, i32, i32 } %509, 1
  %513 = bitcast i32 %512 to <2 x bfloat>
  %514 = extractvalue { i32, i32, i32, i32 } %509, 2
  %515 = bitcast i32 %514 to <2 x bfloat>
  %516 = extractvalue { i32, i32, i32, i32 } %509, 3
  %517 = bitcast i32 %516 to <2 x bfloat>
  %518 = extractelement <2 x bfloat> %511, i32 0
  %519 = extractelement <2 x bfloat> %511, i32 1
  %520 = extractelement <2 x bfloat> %513, i32 0
  %521 = extractelement <2 x bfloat> %513, i32 1
  %522 = extractelement <2 x bfloat> %515, i32 0
  %523 = extractelement <2 x bfloat> %515, i32 1
  %524 = extractelement <2 x bfloat> %517, i32 0
  %525 = extractelement <2 x bfloat> %517, i32 1
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504)
  %530 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505)
  %531 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506)
  %532 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %507)
  %533 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %508)
  %534 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518)
  %535 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519)
  %536 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520)
  %537 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521)
  %538 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522)
  %539 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %523)
  %540 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %524)
  %541 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %525)
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
  %557 = fmul float %489, %541
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
  %573 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %557)
  %574 = getelementptr bfloat, ptr addrspace(1) %7, i64 %105
  %575 = getelementptr bfloat, ptr addrspace(1) %574, i64 %49
  %576 = getelementptr bfloat, ptr addrspace(1) %574, i64 %51
  %577 = insertelement <2 x bfloat> undef, bfloat %558, i32 0
  %578 = insertelement <2 x bfloat> %577, bfloat %559, i32 1
  %579 = bitcast <2 x bfloat> %578 to i32
  %580 = insertelement <2 x bfloat> undef, bfloat %560, i32 0
  %581 = insertelement <2 x bfloat> %580, bfloat %561, i32 1
  %582 = bitcast <2 x bfloat> %581 to i32
  %583 = insertelement <2 x bfloat> undef, bfloat %562, i32 0
  %584 = insertelement <2 x bfloat> %583, bfloat %563, i32 1
  %585 = bitcast <2 x bfloat> %584 to i32
  %586 = insertelement <2 x bfloat> undef, bfloat %564, i32 0
  %587 = insertelement <2 x bfloat> %586, bfloat %565, i32 1
  %588 = bitcast <2 x bfloat> %587 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %579, i32 %582, i32 %585, i32 %588, ptr addrspace(1) %575)
  %589 = insertelement <2 x bfloat> undef, bfloat %566, i32 0
  %590 = insertelement <2 x bfloat> %589, bfloat %567, i32 1
  %591 = bitcast <2 x bfloat> %590 to i32
  %592 = insertelement <2 x bfloat> undef, bfloat %568, i32 0
  %593 = insertelement <2 x bfloat> %592, bfloat %569, i32 1
  %594 = bitcast <2 x bfloat> %593 to i32
  %595 = insertelement <2 x bfloat> undef, bfloat %570, i32 0
  %596 = insertelement <2 x bfloat> %595, bfloat %571, i32 1
  %597 = bitcast <2 x bfloat> %596 to i32
  %598 = insertelement <2 x bfloat> undef, bfloat %572, i32 0
  %599 = insertelement <2 x bfloat> %598, bfloat %573, i32 1
  %600 = bitcast <2 x bfloat> %599 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %591, i32 %594, i32 %597, i32 %600, ptr addrspace(1) %576)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_104_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_104(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) #6 {
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
  %12 = mul i64 %11, 8192
  %13 = add i64 %12, 1024
  %14 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
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
  %43 = xor i32 %41, 4
  %44 = xor i32 %41, 512
  %45 = xor i32 %41, 516
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = add i32 %44, 0
  %49 = add i32 %45, 0
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = sext i32 %49 to i64
  %54 = getelementptr bfloat, ptr addrspace(1) %14, i64 %50
  %55 = getelementptr bfloat, ptr addrspace(1) %14, i64 %52
  %56 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %54)
  %57 = extractvalue { i32, i32, i32, i32 } %56, 0
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %56, 1
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %56, 2
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractvalue { i32, i32, i32, i32 } %56, 3
  %64 = bitcast i32 %63 to <2 x bfloat>
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = extractelement <2 x bfloat> %64, i32 0
  %72 = extractelement <2 x bfloat> %64, i32 1
  %73 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %55)
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = extractelement <2 x bfloat> %81, i32 0
  %89 = extractelement <2 x bfloat> %81, i32 1
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %105 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89)
  %106 = mul i64 %11, 1024
  %107 = getelementptr bfloat, ptr addrspace(1) %3, i64 %106
  %108 = getelementptr bfloat, ptr addrspace(1) %107, i64 %50
  %109 = getelementptr bfloat, ptr addrspace(1) %107, i64 %52
  %110 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108)
  %111 = extractvalue { i32, i32, i32, i32 } %110, 0
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %110, 1
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %110, 2
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractvalue { i32, i32, i32, i32 } %110, 3
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = extractelement <2 x bfloat> %118, i32 0
  %126 = extractelement <2 x bfloat> %118, i32 1
  %127 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %109)
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %127, 1
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %127, 2
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractvalue { i32, i32, i32, i32 } %127, 3
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = extractelement <2 x bfloat> %135, i32 0
  %143 = extractelement <2 x bfloat> %135, i32 1
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142)
  %159 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143)
  %160 = add i64 %12, 2048
  %161 = getelementptr bfloat, ptr addrspace(1) %4, i64 %160
  %162 = getelementptr bfloat, ptr addrspace(1) %161, i64 %50
  %163 = getelementptr bfloat, ptr addrspace(1) %161, i64 %52
  %164 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %165 = extractvalue { i32, i32, i32, i32 } %164, 0
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %164, 1
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %164, 2
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractvalue { i32, i32, i32, i32 } %164, 3
  %172 = bitcast i32 %171 to <2 x bfloat>
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = extractelement <2 x bfloat> %172, i32 0
  %180 = extractelement <2 x bfloat> %172, i32 1
  %181 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %163)
  %182 = extractvalue { i32, i32, i32, i32 } %181, 0
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %181, 1
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %181, 2
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractvalue { i32, i32, i32, i32 } %181, 3
  %189 = bitcast i32 %188 to <2 x bfloat>
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = extractelement <2 x bfloat> %189, i32 0
  %197 = extractelement <2 x bfloat> %189, i32 1
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %213 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197)
  %214 = getelementptr bfloat, ptr addrspace(1) %7, i64 %106
  %215 = getelementptr bfloat, ptr addrspace(1) %214, i64 %50
  %216 = getelementptr bfloat, ptr addrspace(1) %214, i64 %52
  %217 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %215)
  %218 = extractvalue { i32, i32, i32, i32 } %217, 0
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractvalue { i32, i32, i32, i32 } %217, 1
  %221 = bitcast i32 %220 to <2 x bfloat>
  %222 = extractvalue { i32, i32, i32, i32 } %217, 2
  %223 = bitcast i32 %222 to <2 x bfloat>
  %224 = extractvalue { i32, i32, i32, i32 } %217, 3
  %225 = bitcast i32 %224 to <2 x bfloat>
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = extractelement <2 x bfloat> %221, i32 0
  %229 = extractelement <2 x bfloat> %221, i32 1
  %230 = extractelement <2 x bfloat> %223, i32 0
  %231 = extractelement <2 x bfloat> %223, i32 1
  %232 = extractelement <2 x bfloat> %225, i32 0
  %233 = extractelement <2 x bfloat> %225, i32 1
  %234 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %216)
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %234, 1
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractvalue { i32, i32, i32, i32 } %234, 2
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = extractvalue { i32, i32, i32, i32 } %234, 3
  %242 = bitcast i32 %241 to <2 x bfloat>
  %243 = extractelement <2 x bfloat> %236, i32 0
  %244 = extractelement <2 x bfloat> %236, i32 1
  %245 = extractelement <2 x bfloat> %238, i32 0
  %246 = extractelement <2 x bfloat> %238, i32 1
  %247 = extractelement <2 x bfloat> %240, i32 0
  %248 = extractelement <2 x bfloat> %240, i32 1
  %249 = extractelement <2 x bfloat> %242, i32 0
  %250 = extractelement <2 x bfloat> %242, i32 1
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %233)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %266 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250)
  %267 = add i64 %12, 3072
  %268 = getelementptr bfloat, ptr addrspace(1) %4, i64 %267
  %269 = getelementptr bfloat, ptr addrspace(1) %268, i64 %50
  %270 = getelementptr bfloat, ptr addrspace(1) %268, i64 %52
  %271 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
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
  %288 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %270)
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
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %320 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304)
  %321 = getelementptr bfloat, ptr addrspace(1) %6, i64 %106
  %322 = getelementptr bfloat, ptr addrspace(1) %321, i64 %50
  %323 = getelementptr bfloat, ptr addrspace(1) %321, i64 %52
  %324 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %322)
  %325 = extractvalue { i32, i32, i32, i32 } %324, 0
  %326 = bitcast i32 %325 to <2 x bfloat>
  %327 = extractvalue { i32, i32, i32, i32 } %324, 1
  %328 = bitcast i32 %327 to <2 x bfloat>
  %329 = extractvalue { i32, i32, i32, i32 } %324, 2
  %330 = bitcast i32 %329 to <2 x bfloat>
  %331 = extractvalue { i32, i32, i32, i32 } %324, 3
  %332 = bitcast i32 %331 to <2 x bfloat>
  %333 = extractelement <2 x bfloat> %326, i32 0
  %334 = extractelement <2 x bfloat> %326, i32 1
  %335 = extractelement <2 x bfloat> %328, i32 0
  %336 = extractelement <2 x bfloat> %328, i32 1
  %337 = extractelement <2 x bfloat> %330, i32 0
  %338 = extractelement <2 x bfloat> %330, i32 1
  %339 = extractelement <2 x bfloat> %332, i32 0
  %340 = extractelement <2 x bfloat> %332, i32 1
  %341 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %323)
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32, i32, i32 } %341, 1
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractvalue { i32, i32, i32, i32 } %341, 2
  %347 = bitcast i32 %346 to <2 x bfloat>
  %348 = extractvalue { i32, i32, i32, i32 } %341, 3
  %349 = bitcast i32 %348 to <2 x bfloat>
  %350 = extractelement <2 x bfloat> %343, i32 0
  %351 = extractelement <2 x bfloat> %343, i32 1
  %352 = extractelement <2 x bfloat> %345, i32 0
  %353 = extractelement <2 x bfloat> %345, i32 1
  %354 = extractelement <2 x bfloat> %347, i32 0
  %355 = extractelement <2 x bfloat> %347, i32 1
  %356 = extractelement <2 x bfloat> %349, i32 0
  %357 = extractelement <2 x bfloat> %349, i32 1
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %336)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %337)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %338)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %339)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %340)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %369 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %370 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %371 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %372 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %373 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357)
  %374 = getelementptr float, ptr addrspace(1) %5, i64 %106
  %375 = getelementptr float, ptr addrspace(1) %374, i64 %50
  %376 = getelementptr float, ptr addrspace(1) %374, i64 %51
  %377 = getelementptr float, ptr addrspace(1) %374, i64 %52
  %378 = getelementptr float, ptr addrspace(1) %374, i64 %53
  %379 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %375)
  %380 = extractvalue { i32, i32, i32, i32 } %379, 0
  %381 = bitcast i32 %380 to <1 x float>
  %382 = extractvalue { i32, i32, i32, i32 } %379, 1
  %383 = bitcast i32 %382 to <1 x float>
  %384 = extractvalue { i32, i32, i32, i32 } %379, 2
  %385 = bitcast i32 %384 to <1 x float>
  %386 = extractvalue { i32, i32, i32, i32 } %379, 3
  %387 = bitcast i32 %386 to <1 x float>
  %388 = extractelement <1 x float> %381, i32 0
  %389 = extractelement <1 x float> %383, i32 0
  %390 = extractelement <1 x float> %385, i32 0
  %391 = extractelement <1 x float> %387, i32 0
  %392 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %376)
  %393 = extractvalue { i32, i32, i32, i32 } %392, 0
  %394 = bitcast i32 %393 to <1 x float>
  %395 = extractvalue { i32, i32, i32, i32 } %392, 1
  %396 = bitcast i32 %395 to <1 x float>
  %397 = extractvalue { i32, i32, i32, i32 } %392, 2
  %398 = bitcast i32 %397 to <1 x float>
  %399 = extractvalue { i32, i32, i32, i32 } %392, 3
  %400 = bitcast i32 %399 to <1 x float>
  %401 = extractelement <1 x float> %394, i32 0
  %402 = extractelement <1 x float> %396, i32 0
  %403 = extractelement <1 x float> %398, i32 0
  %404 = extractelement <1 x float> %400, i32 0
  %405 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %377)
  %406 = extractvalue { i32, i32, i32, i32 } %405, 0
  %407 = bitcast i32 %406 to <1 x float>
  %408 = extractvalue { i32, i32, i32, i32 } %405, 1
  %409 = bitcast i32 %408 to <1 x float>
  %410 = extractvalue { i32, i32, i32, i32 } %405, 2
  %411 = bitcast i32 %410 to <1 x float>
  %412 = extractvalue { i32, i32, i32, i32 } %405, 3
  %413 = bitcast i32 %412 to <1 x float>
  %414 = extractelement <1 x float> %407, i32 0
  %415 = extractelement <1 x float> %409, i32 0
  %416 = extractelement <1 x float> %411, i32 0
  %417 = extractelement <1 x float> %413, i32 0
  %418 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %378)
  %419 = extractvalue { i32, i32, i32, i32 } %418, 0
  %420 = bitcast i32 %419 to <1 x float>
  %421 = extractvalue { i32, i32, i32, i32 } %418, 1
  %422 = bitcast i32 %421 to <1 x float>
  %423 = extractvalue { i32, i32, i32, i32 } %418, 2
  %424 = bitcast i32 %423 to <1 x float>
  %425 = extractvalue { i32, i32, i32, i32 } %418, 3
  %426 = bitcast i32 %425 to <1 x float>
  %427 = extractelement <1 x float> %420, i32 0
  %428 = extractelement <1 x float> %422, i32 0
  %429 = extractelement <1 x float> %424, i32 0
  %430 = extractelement <1 x float> %426, i32 0
  %431 = fadd float %358, %388
  %432 = fadd float %359, %389
  %433 = fadd float %360, %390
  %434 = fadd float %361, %391
  %435 = fadd float %362, %401
  %436 = fadd float %363, %402
  %437 = fadd float %364, %403
  %438 = fadd float %365, %404
  %439 = fadd float %366, %414
  %440 = fadd float %367, %415
  %441 = fadd float %368, %416
  %442 = fadd float %369, %417
  %443 = fadd float %370, %427
  %444 = fadd float %371, %428
  %445 = fadd float %372, %429
  %446 = fadd float %373, %430
  %447 = fadd float %305, %431
  %448 = fadd float %306, %432
  %449 = fadd float %307, %433
  %450 = fadd float %308, %434
  %451 = fadd float %309, %435
  %452 = fadd float %310, %436
  %453 = fadd float %311, %437
  %454 = fadd float %312, %438
  %455 = fadd float %313, %439
  %456 = fadd float %314, %440
  %457 = fadd float %315, %441
  %458 = fadd float %316, %442
  %459 = fadd float %317, %443
  %460 = fadd float %318, %444
  %461 = fadd float %319, %445
  %462 = fadd float %320, %446
  %463 = fadd float %251, %447
  %464 = fadd float %252, %448
  %465 = fadd float %253, %449
  %466 = fadd float %254, %450
  %467 = fadd float %255, %451
  %468 = fadd float %256, %452
  %469 = fadd float %257, %453
  %470 = fadd float %258, %454
  %471 = fadd float %259, %455
  %472 = fadd float %260, %456
  %473 = fadd float %261, %457
  %474 = fadd float %262, %458
  %475 = fadd float %263, %459
  %476 = fadd float %264, %460
  %477 = fadd float %265, %461
  %478 = fadd float %266, %462
  %479 = fadd float %198, %463
  %480 = fadd float %199, %464
  %481 = fadd float %200, %465
  %482 = fadd float %201, %466
  %483 = fadd float %202, %467
  %484 = fadd float %203, %468
  %485 = fadd float %204, %469
  %486 = fadd float %205, %470
  %487 = fadd float %206, %471
  %488 = fadd float %207, %472
  %489 = fadd float %208, %473
  %490 = fadd float %209, %474
  %491 = fadd float %210, %475
  %492 = fadd float %211, %476
  %493 = fadd float %212, %477
  %494 = fadd float %213, %478
  %495 = fadd float %144, %479
  %496 = fadd float %145, %480
  %497 = fadd float %146, %481
  %498 = fadd float %147, %482
  %499 = fadd float %148, %483
  %500 = fadd float %149, %484
  %501 = fadd float %150, %485
  %502 = fadd float %151, %486
  %503 = fadd float %152, %487
  %504 = fadd float %153, %488
  %505 = fadd float %154, %489
  %506 = fadd float %155, %490
  %507 = fadd float %156, %491
  %508 = fadd float %157, %492
  %509 = fadd float %158, %493
  %510 = fadd float %159, %494
  %511 = fadd float %90, %495
  %512 = fadd float %91, %496
  %513 = fadd float %92, %497
  %514 = fadd float %93, %498
  %515 = fadd float %94, %499
  %516 = fadd float %95, %500
  %517 = fadd float %96, %501
  %518 = fadd float %97, %502
  %519 = fadd float %98, %503
  %520 = fadd float %99, %504
  %521 = fadd float %100, %505
  %522 = fadd float %101, %506
  %523 = fadd float %102, %507
  %524 = fadd float %103, %508
  %525 = fadd float %104, %509
  %526 = fadd float %105, %510
  %527 = fmul float %511, %511
  %528 = fmul float %512, %512
  %529 = fmul float %513, %513
  %530 = fmul float %514, %514
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
  %543 = fadd float %527, %528
  %544 = fadd float %543, %529
  %545 = fadd float %544, %530
  %546 = fadd float %545, %531
  %547 = fadd float %546, %532
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
  %558 = bitcast float %557 to i32
  %559 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %558, i32 16, i32 31)
  %560 = bitcast i32 %559 to float
  %561 = fadd float %557, %560
  %562 = bitcast float %561 to i32
  %563 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %562, i32 8, i32 31)
  %564 = bitcast i32 %563 to float
  %565 = fadd float %561, %564
  %566 = bitcast float %565 to i32
  %567 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %566, i32 4, i32 31)
  %568 = bitcast i32 %567 to float
  %569 = fadd float %565, %568
  %570 = bitcast float %569 to i32
  %571 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %570, i32 2, i32 31)
  %572 = bitcast i32 %571 to float
  %573 = fadd float %569, %572
  %574 = bitcast float %573 to i32
  %575 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %574, i32 1, i32 31)
  %576 = bitcast i32 %575 to float
  %577 = fadd float %573, %576
  %578 = urem i32 %16, 32
  %579 = urem i32 %17, 2
  %580 = icmp eq i32 %578, 0
  %581 = and i1 true, %580
  %582 = add i32 0, %579
  %583 = getelementptr float, ptr addrspace(3) @global_smem, i32 %582
  %584 = insertelement <1 x float> undef, float %577, i32 0
  %585 = extractelement <1 x float> %584, i32 0
  %586 = bitcast float %585 to i32
  %587 = insertelement <1 x i32> undef, i32 %586, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %583, <1 x i32> %587, i1 %581)
  call void @llvm.nvvm.barrier0()
  %588 = icmp slt i32 %15, 2
  %589 = getelementptr float, ptr addrspace(3) @global_smem, i32 %15
  %590 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %589, i1 %588)
  %591 = insertelement <1 x i32> undef, i32 %590, i32 0
  %592 = extractelement <1 x i32> %591, i32 0
  %593 = bitcast i32 %592 to float
  %594 = insertelement <1 x float> undef, float %593, i32 0
  %595 = extractelement <1 x float> %594, i32 0
  %596 = bitcast float %595 to i32
  %597 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %596, i32 1, i32 31)
  %598 = bitcast i32 %597 to float
  %599 = fadd float %595, %598
  %600 = urem i32 %16, 2
  %601 = icmp eq i32 %600, 0
  %602 = and i1 %588, %601
  %603 = insertelement <1 x float> undef, float %599, i32 0
  %604 = extractelement <1 x float> %603, i32 0
  %605 = bitcast float %604 to i32
  %606 = insertelement <1 x i32> undef, i32 %605, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %589, <1 x i32> %606, i1 %602)
  call void @llvm.nvvm.barrier0()
  %607 = load float, ptr addrspace(3) @global_smem, align 4
  %608 = fmul float %607, 0x3F50000000000000
  %609 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %610 = bitcast i32 %609 to <1 x float>
  %611 = extractelement <1 x float> %610, i32 0
  %612 = fadd float %608, %611
  %613 = call float @__nv_rsqrtf(float %612)
  %614 = fmul float %511, %613
  %615 = fmul float %512, %613
  %616 = fmul float %513, %613
  %617 = fmul float %514, %613
  %618 = fmul float %515, %613
  %619 = fmul float %516, %613
  %620 = fmul float %517, %613
  %621 = fmul float %518, %613
  %622 = fmul float %519, %613
  %623 = fmul float %520, %613
  %624 = fmul float %521, %613
  %625 = fmul float %522, %613
  %626 = fmul float %523, %613
  %627 = fmul float %524, %613
  %628 = fmul float %525, %613
  %629 = fmul float %526, %613
  %630 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
  %631 = getelementptr bfloat, ptr addrspace(1) %2, i64 %52
  %632 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %630)
  %633 = extractvalue { i32, i32, i32, i32 } %632, 0
  %634 = bitcast i32 %633 to <2 x bfloat>
  %635 = extractvalue { i32, i32, i32, i32 } %632, 1
  %636 = bitcast i32 %635 to <2 x bfloat>
  %637 = extractvalue { i32, i32, i32, i32 } %632, 2
  %638 = bitcast i32 %637 to <2 x bfloat>
  %639 = extractvalue { i32, i32, i32, i32 } %632, 3
  %640 = bitcast i32 %639 to <2 x bfloat>
  %641 = extractelement <2 x bfloat> %634, i32 0
  %642 = extractelement <2 x bfloat> %634, i32 1
  %643 = extractelement <2 x bfloat> %636, i32 0
  %644 = extractelement <2 x bfloat> %636, i32 1
  %645 = extractelement <2 x bfloat> %638, i32 0
  %646 = extractelement <2 x bfloat> %638, i32 1
  %647 = extractelement <2 x bfloat> %640, i32 0
  %648 = extractelement <2 x bfloat> %640, i32 1
  %649 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %631)
  %650 = extractvalue { i32, i32, i32, i32 } %649, 0
  %651 = bitcast i32 %650 to <2 x bfloat>
  %652 = extractvalue { i32, i32, i32, i32 } %649, 1
  %653 = bitcast i32 %652 to <2 x bfloat>
  %654 = extractvalue { i32, i32, i32, i32 } %649, 2
  %655 = bitcast i32 %654 to <2 x bfloat>
  %656 = extractvalue { i32, i32, i32, i32 } %649, 3
  %657 = bitcast i32 %656 to <2 x bfloat>
  %658 = extractelement <2 x bfloat> %651, i32 0
  %659 = extractelement <2 x bfloat> %651, i32 1
  %660 = extractelement <2 x bfloat> %653, i32 0
  %661 = extractelement <2 x bfloat> %653, i32 1
  %662 = extractelement <2 x bfloat> %655, i32 0
  %663 = extractelement <2 x bfloat> %655, i32 1
  %664 = extractelement <2 x bfloat> %657, i32 0
  %665 = extractelement <2 x bfloat> %657, i32 1
  %666 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %641)
  %667 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %642)
  %668 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %643)
  %669 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %644)
  %670 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %645)
  %671 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %646)
  %672 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %647)
  %673 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %648)
  %674 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658)
  %675 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %659)
  %676 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %660)
  %677 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %661)
  %678 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %662)
  %679 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %663)
  %680 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %664)
  %681 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %665)
  %682 = fmul float %614, %666
  %683 = fmul float %615, %667
  %684 = fmul float %616, %668
  %685 = fmul float %617, %669
  %686 = fmul float %618, %670
  %687 = fmul float %619, %671
  %688 = fmul float %620, %672
  %689 = fmul float %621, %673
  %690 = fmul float %622, %674
  %691 = fmul float %623, %675
  %692 = fmul float %624, %676
  %693 = fmul float %625, %677
  %694 = fmul float %626, %678
  %695 = fmul float %627, %679
  %696 = fmul float %628, %680
  %697 = fmul float %629, %681
  %698 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %682)
  %699 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %683)
  %700 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %684)
  %701 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %685)
  %702 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %686)
  %703 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %687)
  %704 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %688)
  %705 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %689)
  %706 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %690)
  %707 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %691)
  %708 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %692)
  %709 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %693)
  %710 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %694)
  %711 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695)
  %712 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696)
  %713 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697)
  %714 = getelementptr bfloat, ptr addrspace(1) %8, i64 %106
  %715 = getelementptr bfloat, ptr addrspace(1) %714, i64 %50
  %716 = getelementptr bfloat, ptr addrspace(1) %714, i64 %52
  %717 = insertelement <2 x bfloat> undef, bfloat %698, i32 0
  %718 = insertelement <2 x bfloat> %717, bfloat %699, i32 1
  %719 = bitcast <2 x bfloat> %718 to i32
  %720 = insertelement <2 x bfloat> undef, bfloat %700, i32 0
  %721 = insertelement <2 x bfloat> %720, bfloat %701, i32 1
  %722 = bitcast <2 x bfloat> %721 to i32
  %723 = insertelement <2 x bfloat> undef, bfloat %702, i32 0
  %724 = insertelement <2 x bfloat> %723, bfloat %703, i32 1
  %725 = bitcast <2 x bfloat> %724 to i32
  %726 = insertelement <2 x bfloat> undef, bfloat %704, i32 0
  %727 = insertelement <2 x bfloat> %726, bfloat %705, i32 1
  %728 = bitcast <2 x bfloat> %727 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %719, i32 %722, i32 %725, i32 %728, ptr addrspace(1) %715)
  %729 = insertelement <2 x bfloat> undef, bfloat %706, i32 0
  %730 = insertelement <2 x bfloat> %729, bfloat %707, i32 1
  %731 = bitcast <2 x bfloat> %730 to i32
  %732 = insertelement <2 x bfloat> undef, bfloat %708, i32 0
  %733 = insertelement <2 x bfloat> %732, bfloat %709, i32 1
  %734 = bitcast <2 x bfloat> %733 to i32
  %735 = insertelement <2 x bfloat> undef, bfloat %710, i32 0
  %736 = insertelement <2 x bfloat> %735, bfloat %711, i32 1
  %737 = bitcast <2 x bfloat> %736 to i32
  %738 = insertelement <2 x bfloat> undef, bfloat %712, i32 0
  %739 = insertelement <2 x bfloat> %738, bfloat %713, i32 1
  %740 = bitcast <2 x bfloat> %739 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %731, i32 %734, i32 %737, i32 %740, ptr addrspace(1) %716)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_102_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_102(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8) #6 {
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
  %13 = mul i64 %12, 8192
  %14 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
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
  %43 = xor i32 %41, 4
  %44 = xor i32 %41, 512
  %45 = xor i32 %41, 516
  %46 = add i32 %42, 0
  %47 = add i32 %43, 0
  %48 = add i32 %44, 0
  %49 = add i32 %45, 0
  %50 = sext i32 %46 to i64
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = sext i32 %49 to i64
  %54 = getelementptr bfloat, ptr addrspace(1) %14, i64 %50
  %55 = getelementptr bfloat, ptr addrspace(1) %14, i64 %52
  %56 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %54)
  %57 = extractvalue { i32, i32, i32, i32 } %56, 0
  %58 = bitcast i32 %57 to <2 x bfloat>
  %59 = extractvalue { i32, i32, i32, i32 } %56, 1
  %60 = bitcast i32 %59 to <2 x bfloat>
  %61 = extractvalue { i32, i32, i32, i32 } %56, 2
  %62 = bitcast i32 %61 to <2 x bfloat>
  %63 = extractvalue { i32, i32, i32, i32 } %56, 3
  %64 = bitcast i32 %63 to <2 x bfloat>
  %65 = extractelement <2 x bfloat> %58, i32 0
  %66 = extractelement <2 x bfloat> %58, i32 1
  %67 = extractelement <2 x bfloat> %60, i32 0
  %68 = extractelement <2 x bfloat> %60, i32 1
  %69 = extractelement <2 x bfloat> %62, i32 0
  %70 = extractelement <2 x bfloat> %62, i32 1
  %71 = extractelement <2 x bfloat> %64, i32 0
  %72 = extractelement <2 x bfloat> %64, i32 1
  %73 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %55)
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i32 0
  %83 = extractelement <2 x bfloat> %75, i32 1
  %84 = extractelement <2 x bfloat> %77, i32 0
  %85 = extractelement <2 x bfloat> %77, i32 1
  %86 = extractelement <2 x bfloat> %79, i32 0
  %87 = extractelement <2 x bfloat> %79, i32 1
  %88 = extractelement <2 x bfloat> %81, i32 0
  %89 = extractelement <2 x bfloat> %81, i32 1
  %90 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %65)
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %105 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89)
  %106 = mul i64 %12, 1024
  %107 = getelementptr bfloat, ptr addrspace(1) %5, i64 %106
  %108 = getelementptr bfloat, ptr addrspace(1) %107, i64 %50
  %109 = getelementptr bfloat, ptr addrspace(1) %107, i64 %52
  %110 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %108)
  %111 = extractvalue { i32, i32, i32, i32 } %110, 0
  %112 = bitcast i32 %111 to <2 x bfloat>
  %113 = extractvalue { i32, i32, i32, i32 } %110, 1
  %114 = bitcast i32 %113 to <2 x bfloat>
  %115 = extractvalue { i32, i32, i32, i32 } %110, 2
  %116 = bitcast i32 %115 to <2 x bfloat>
  %117 = extractvalue { i32, i32, i32, i32 } %110, 3
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractelement <2 x bfloat> %112, i32 0
  %120 = extractelement <2 x bfloat> %112, i32 1
  %121 = extractelement <2 x bfloat> %114, i32 0
  %122 = extractelement <2 x bfloat> %114, i32 1
  %123 = extractelement <2 x bfloat> %116, i32 0
  %124 = extractelement <2 x bfloat> %116, i32 1
  %125 = extractelement <2 x bfloat> %118, i32 0
  %126 = extractelement <2 x bfloat> %118, i32 1
  %127 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %109)
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %127, 1
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractvalue { i32, i32, i32, i32 } %127, 2
  %133 = bitcast i32 %132 to <2 x bfloat>
  %134 = extractvalue { i32, i32, i32, i32 } %127, 3
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractelement <2 x bfloat> %129, i32 0
  %137 = extractelement <2 x bfloat> %129, i32 1
  %138 = extractelement <2 x bfloat> %131, i32 0
  %139 = extractelement <2 x bfloat> %131, i32 1
  %140 = extractelement <2 x bfloat> %133, i32 0
  %141 = extractelement <2 x bfloat> %133, i32 1
  %142 = extractelement <2 x bfloat> %135, i32 0
  %143 = extractelement <2 x bfloat> %135, i32 1
  %144 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %119)
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142)
  %159 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143)
  %160 = add i64 %13, 1024
  %161 = getelementptr bfloat, ptr addrspace(1) %4, i64 %160
  %162 = getelementptr bfloat, ptr addrspace(1) %161, i64 %50
  %163 = getelementptr bfloat, ptr addrspace(1) %161, i64 %52
  %164 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %165 = extractvalue { i32, i32, i32, i32 } %164, 0
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %164, 1
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %164, 2
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractvalue { i32, i32, i32, i32 } %164, 3
  %172 = bitcast i32 %171 to <2 x bfloat>
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = extractelement <2 x bfloat> %172, i32 0
  %180 = extractelement <2 x bfloat> %172, i32 1
  %181 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %163)
  %182 = extractvalue { i32, i32, i32, i32 } %181, 0
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %181, 1
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %181, 2
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractvalue { i32, i32, i32, i32 } %181, 3
  %189 = bitcast i32 %188 to <2 x bfloat>
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = extractelement <2 x bfloat> %189, i32 0
  %197 = extractelement <2 x bfloat> %189, i32 1
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %213 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197)
  %214 = getelementptr bfloat, ptr addrspace(1) %3, i64 %106
  %215 = getelementptr bfloat, ptr addrspace(1) %214, i64 %50
  %216 = getelementptr bfloat, ptr addrspace(1) %214, i64 %52
  %217 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %215)
  %218 = extractvalue { i32, i32, i32, i32 } %217, 0
  %219 = bitcast i32 %218 to <2 x bfloat>
  %220 = extractvalue { i32, i32, i32, i32 } %217, 1
  %221 = bitcast i32 %220 to <2 x bfloat>
  %222 = extractvalue { i32, i32, i32, i32 } %217, 2
  %223 = bitcast i32 %222 to <2 x bfloat>
  %224 = extractvalue { i32, i32, i32, i32 } %217, 3
  %225 = bitcast i32 %224 to <2 x bfloat>
  %226 = extractelement <2 x bfloat> %219, i32 0
  %227 = extractelement <2 x bfloat> %219, i32 1
  %228 = extractelement <2 x bfloat> %221, i32 0
  %229 = extractelement <2 x bfloat> %221, i32 1
  %230 = extractelement <2 x bfloat> %223, i32 0
  %231 = extractelement <2 x bfloat> %223, i32 1
  %232 = extractelement <2 x bfloat> %225, i32 0
  %233 = extractelement <2 x bfloat> %225, i32 1
  %234 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %216)
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %234, 1
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractvalue { i32, i32, i32, i32 } %234, 2
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = extractvalue { i32, i32, i32, i32 } %234, 3
  %242 = bitcast i32 %241 to <2 x bfloat>
  %243 = extractelement <2 x bfloat> %236, i32 0
  %244 = extractelement <2 x bfloat> %236, i32 1
  %245 = extractelement <2 x bfloat> %238, i32 0
  %246 = extractelement <2 x bfloat> %238, i32 1
  %247 = extractelement <2 x bfloat> %240, i32 0
  %248 = extractelement <2 x bfloat> %240, i32 1
  %249 = extractelement <2 x bfloat> %242, i32 0
  %250 = extractelement <2 x bfloat> %242, i32 1
  %251 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %226)
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %233)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %266 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250)
  %267 = add i64 %13, 2048
  %268 = getelementptr bfloat, ptr addrspace(1) %4, i64 %267
  %269 = getelementptr bfloat, ptr addrspace(1) %268, i64 %50
  %270 = getelementptr bfloat, ptr addrspace(1) %268, i64 %52
  %271 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
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
  %288 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %270)
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
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %320 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304)
  %321 = getelementptr bfloat, ptr addrspace(1) %8, i64 %106
  %322 = getelementptr bfloat, ptr addrspace(1) %321, i64 %50
  %323 = getelementptr bfloat, ptr addrspace(1) %321, i64 %52
  %324 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %322)
  %325 = extractvalue { i32, i32, i32, i32 } %324, 0
  %326 = bitcast i32 %325 to <2 x bfloat>
  %327 = extractvalue { i32, i32, i32, i32 } %324, 1
  %328 = bitcast i32 %327 to <2 x bfloat>
  %329 = extractvalue { i32, i32, i32, i32 } %324, 2
  %330 = bitcast i32 %329 to <2 x bfloat>
  %331 = extractvalue { i32, i32, i32, i32 } %324, 3
  %332 = bitcast i32 %331 to <2 x bfloat>
  %333 = extractelement <2 x bfloat> %326, i32 0
  %334 = extractelement <2 x bfloat> %326, i32 1
  %335 = extractelement <2 x bfloat> %328, i32 0
  %336 = extractelement <2 x bfloat> %328, i32 1
  %337 = extractelement <2 x bfloat> %330, i32 0
  %338 = extractelement <2 x bfloat> %330, i32 1
  %339 = extractelement <2 x bfloat> %332, i32 0
  %340 = extractelement <2 x bfloat> %332, i32 1
  %341 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %323)
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32, i32, i32 } %341, 1
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractvalue { i32, i32, i32, i32 } %341, 2
  %347 = bitcast i32 %346 to <2 x bfloat>
  %348 = extractvalue { i32, i32, i32, i32 } %341, 3
  %349 = bitcast i32 %348 to <2 x bfloat>
  %350 = extractelement <2 x bfloat> %343, i32 0
  %351 = extractelement <2 x bfloat> %343, i32 1
  %352 = extractelement <2 x bfloat> %345, i32 0
  %353 = extractelement <2 x bfloat> %345, i32 1
  %354 = extractelement <2 x bfloat> %347, i32 0
  %355 = extractelement <2 x bfloat> %347, i32 1
  %356 = extractelement <2 x bfloat> %349, i32 0
  %357 = extractelement <2 x bfloat> %349, i32 1
  %358 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %333)
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %336)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %337)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %338)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %339)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %340)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %369 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %370 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %371 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %372 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %373 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357)
  %374 = add i64 %13, 3072
  %375 = getelementptr bfloat, ptr addrspace(1) %4, i64 %374
  %376 = getelementptr bfloat, ptr addrspace(1) %375, i64 %50
  %377 = getelementptr bfloat, ptr addrspace(1) %375, i64 %52
  %378 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %376)
  %379 = extractvalue { i32, i32, i32, i32 } %378, 0
  %380 = bitcast i32 %379 to <2 x bfloat>
  %381 = extractvalue { i32, i32, i32, i32 } %378, 1
  %382 = bitcast i32 %381 to <2 x bfloat>
  %383 = extractvalue { i32, i32, i32, i32 } %378, 2
  %384 = bitcast i32 %383 to <2 x bfloat>
  %385 = extractvalue { i32, i32, i32, i32 } %378, 3
  %386 = bitcast i32 %385 to <2 x bfloat>
  %387 = extractelement <2 x bfloat> %380, i32 0
  %388 = extractelement <2 x bfloat> %380, i32 1
  %389 = extractelement <2 x bfloat> %382, i32 0
  %390 = extractelement <2 x bfloat> %382, i32 1
  %391 = extractelement <2 x bfloat> %384, i32 0
  %392 = extractelement <2 x bfloat> %384, i32 1
  %393 = extractelement <2 x bfloat> %386, i32 0
  %394 = extractelement <2 x bfloat> %386, i32 1
  %395 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %377)
  %396 = extractvalue { i32, i32, i32, i32 } %395, 0
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %395, 1
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractvalue { i32, i32, i32, i32 } %395, 2
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractvalue { i32, i32, i32, i32 } %395, 3
  %403 = bitcast i32 %402 to <2 x bfloat>
  %404 = extractelement <2 x bfloat> %397, i32 0
  %405 = extractelement <2 x bfloat> %397, i32 1
  %406 = extractelement <2 x bfloat> %399, i32 0
  %407 = extractelement <2 x bfloat> %399, i32 1
  %408 = extractelement <2 x bfloat> %401, i32 0
  %409 = extractelement <2 x bfloat> %401, i32 1
  %410 = extractelement <2 x bfloat> %403, i32 0
  %411 = extractelement <2 x bfloat> %403, i32 1
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %388)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %389)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %390)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %391)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %392)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %422 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %423 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407)
  %424 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408)
  %425 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409)
  %426 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %410)
  %427 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %411)
  %428 = getelementptr bfloat, ptr addrspace(1) %7, i64 %106
  %429 = getelementptr bfloat, ptr addrspace(1) %428, i64 %50
  %430 = getelementptr bfloat, ptr addrspace(1) %428, i64 %52
  %431 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %429)
  %432 = extractvalue { i32, i32, i32, i32 } %431, 0
  %433 = bitcast i32 %432 to <2 x bfloat>
  %434 = extractvalue { i32, i32, i32, i32 } %431, 1
  %435 = bitcast i32 %434 to <2 x bfloat>
  %436 = extractvalue { i32, i32, i32, i32 } %431, 2
  %437 = bitcast i32 %436 to <2 x bfloat>
  %438 = extractvalue { i32, i32, i32, i32 } %431, 3
  %439 = bitcast i32 %438 to <2 x bfloat>
  %440 = extractelement <2 x bfloat> %433, i32 0
  %441 = extractelement <2 x bfloat> %433, i32 1
  %442 = extractelement <2 x bfloat> %435, i32 0
  %443 = extractelement <2 x bfloat> %435, i32 1
  %444 = extractelement <2 x bfloat> %437, i32 0
  %445 = extractelement <2 x bfloat> %437, i32 1
  %446 = extractelement <2 x bfloat> %439, i32 0
  %447 = extractelement <2 x bfloat> %439, i32 1
  %448 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %430)
  %449 = extractvalue { i32, i32, i32, i32 } %448, 0
  %450 = bitcast i32 %449 to <2 x bfloat>
  %451 = extractvalue { i32, i32, i32, i32 } %448, 1
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractvalue { i32, i32, i32, i32 } %448, 2
  %454 = bitcast i32 %453 to <2 x bfloat>
  %455 = extractvalue { i32, i32, i32, i32 } %448, 3
  %456 = bitcast i32 %455 to <2 x bfloat>
  %457 = extractelement <2 x bfloat> %450, i32 0
  %458 = extractelement <2 x bfloat> %450, i32 1
  %459 = extractelement <2 x bfloat> %452, i32 0
  %460 = extractelement <2 x bfloat> %452, i32 1
  %461 = extractelement <2 x bfloat> %454, i32 0
  %462 = extractelement <2 x bfloat> %454, i32 1
  %463 = extractelement <2 x bfloat> %456, i32 0
  %464 = extractelement <2 x bfloat> %456, i32 1
  %465 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440)
  %466 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %467 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442)
  %468 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443)
  %469 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444)
  %470 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %445)
  %471 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %446)
  %472 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447)
  %473 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457)
  %474 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458)
  %475 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459)
  %476 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460)
  %477 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461)
  %478 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462)
  %479 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463)
  %480 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %464)
  %481 = getelementptr float, ptr addrspace(1) %6, i64 %106
  %482 = getelementptr float, ptr addrspace(1) %481, i64 %50
  %483 = getelementptr float, ptr addrspace(1) %481, i64 %51
  %484 = getelementptr float, ptr addrspace(1) %481, i64 %52
  %485 = getelementptr float, ptr addrspace(1) %481, i64 %53
  %486 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %482)
  %487 = extractvalue { i32, i32, i32, i32 } %486, 0
  %488 = bitcast i32 %487 to <1 x float>
  %489 = extractvalue { i32, i32, i32, i32 } %486, 1
  %490 = bitcast i32 %489 to <1 x float>
  %491 = extractvalue { i32, i32, i32, i32 } %486, 2
  %492 = bitcast i32 %491 to <1 x float>
  %493 = extractvalue { i32, i32, i32, i32 } %486, 3
  %494 = bitcast i32 %493 to <1 x float>
  %495 = extractelement <1 x float> %488, i32 0
  %496 = extractelement <1 x float> %490, i32 0
  %497 = extractelement <1 x float> %492, i32 0
  %498 = extractelement <1 x float> %494, i32 0
  %499 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %483)
  %500 = extractvalue { i32, i32, i32, i32 } %499, 0
  %501 = bitcast i32 %500 to <1 x float>
  %502 = extractvalue { i32, i32, i32, i32 } %499, 1
  %503 = bitcast i32 %502 to <1 x float>
  %504 = extractvalue { i32, i32, i32, i32 } %499, 2
  %505 = bitcast i32 %504 to <1 x float>
  %506 = extractvalue { i32, i32, i32, i32 } %499, 3
  %507 = bitcast i32 %506 to <1 x float>
  %508 = extractelement <1 x float> %501, i32 0
  %509 = extractelement <1 x float> %503, i32 0
  %510 = extractelement <1 x float> %505, i32 0
  %511 = extractelement <1 x float> %507, i32 0
  %512 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %484)
  %513 = extractvalue { i32, i32, i32, i32 } %512, 0
  %514 = bitcast i32 %513 to <1 x float>
  %515 = extractvalue { i32, i32, i32, i32 } %512, 1
  %516 = bitcast i32 %515 to <1 x float>
  %517 = extractvalue { i32, i32, i32, i32 } %512, 2
  %518 = bitcast i32 %517 to <1 x float>
  %519 = extractvalue { i32, i32, i32, i32 } %512, 3
  %520 = bitcast i32 %519 to <1 x float>
  %521 = extractelement <1 x float> %514, i32 0
  %522 = extractelement <1 x float> %516, i32 0
  %523 = extractelement <1 x float> %518, i32 0
  %524 = extractelement <1 x float> %520, i32 0
  %525 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %485)
  %526 = extractvalue { i32, i32, i32, i32 } %525, 0
  %527 = bitcast i32 %526 to <1 x float>
  %528 = extractvalue { i32, i32, i32, i32 } %525, 1
  %529 = bitcast i32 %528 to <1 x float>
  %530 = extractvalue { i32, i32, i32, i32 } %525, 2
  %531 = bitcast i32 %530 to <1 x float>
  %532 = extractvalue { i32, i32, i32, i32 } %525, 3
  %533 = bitcast i32 %532 to <1 x float>
  %534 = extractelement <1 x float> %527, i32 0
  %535 = extractelement <1 x float> %529, i32 0
  %536 = extractelement <1 x float> %531, i32 0
  %537 = extractelement <1 x float> %533, i32 0
  %538 = fadd float %465, %495
  %539 = fadd float %466, %496
  %540 = fadd float %467, %497
  %541 = fadd float %468, %498
  %542 = fadd float %469, %508
  %543 = fadd float %470, %509
  %544 = fadd float %471, %510
  %545 = fadd float %472, %511
  %546 = fadd float %473, %521
  %547 = fadd float %474, %522
  %548 = fadd float %475, %523
  %549 = fadd float %476, %524
  %550 = fadd float %477, %534
  %551 = fadd float %478, %535
  %552 = fadd float %479, %536
  %553 = fadd float %480, %537
  %554 = fadd float %412, %538
  %555 = fadd float %413, %539
  %556 = fadd float %414, %540
  %557 = fadd float %415, %541
  %558 = fadd float %416, %542
  %559 = fadd float %417, %543
  %560 = fadd float %418, %544
  %561 = fadd float %419, %545
  %562 = fadd float %420, %546
  %563 = fadd float %421, %547
  %564 = fadd float %422, %548
  %565 = fadd float %423, %549
  %566 = fadd float %424, %550
  %567 = fadd float %425, %551
  %568 = fadd float %426, %552
  %569 = fadd float %427, %553
  %570 = fadd float %358, %554
  %571 = fadd float %359, %555
  %572 = fadd float %360, %556
  %573 = fadd float %361, %557
  %574 = fadd float %362, %558
  %575 = fadd float %363, %559
  %576 = fadd float %364, %560
  %577 = fadd float %365, %561
  %578 = fadd float %366, %562
  %579 = fadd float %367, %563
  %580 = fadd float %368, %564
  %581 = fadd float %369, %565
  %582 = fadd float %370, %566
  %583 = fadd float %371, %567
  %584 = fadd float %372, %568
  %585 = fadd float %373, %569
  %586 = fadd float %305, %570
  %587 = fadd float %306, %571
  %588 = fadd float %307, %572
  %589 = fadd float %308, %573
  %590 = fadd float %309, %574
  %591 = fadd float %310, %575
  %592 = fadd float %311, %576
  %593 = fadd float %312, %577
  %594 = fadd float %313, %578
  %595 = fadd float %314, %579
  %596 = fadd float %315, %580
  %597 = fadd float %316, %581
  %598 = fadd float %317, %582
  %599 = fadd float %318, %583
  %600 = fadd float %319, %584
  %601 = fadd float %320, %585
  %602 = fadd float %251, %586
  %603 = fadd float %252, %587
  %604 = fadd float %253, %588
  %605 = fadd float %254, %589
  %606 = fadd float %255, %590
  %607 = fadd float %256, %591
  %608 = fadd float %257, %592
  %609 = fadd float %258, %593
  %610 = fadd float %259, %594
  %611 = fadd float %260, %595
  %612 = fadd float %261, %596
  %613 = fadd float %262, %597
  %614 = fadd float %263, %598
  %615 = fadd float %264, %599
  %616 = fadd float %265, %600
  %617 = fadd float %266, %601
  %618 = fadd float %198, %602
  %619 = fadd float %199, %603
  %620 = fadd float %200, %604
  %621 = fadd float %201, %605
  %622 = fadd float %202, %606
  %623 = fadd float %203, %607
  %624 = fadd float %204, %608
  %625 = fadd float %205, %609
  %626 = fadd float %206, %610
  %627 = fadd float %207, %611
  %628 = fadd float %208, %612
  %629 = fadd float %209, %613
  %630 = fadd float %210, %614
  %631 = fadd float %211, %615
  %632 = fadd float %212, %616
  %633 = fadd float %213, %617
  %634 = fadd float %144, %618
  %635 = fadd float %145, %619
  %636 = fadd float %146, %620
  %637 = fadd float %147, %621
  %638 = fadd float %148, %622
  %639 = fadd float %149, %623
  %640 = fadd float %150, %624
  %641 = fadd float %151, %625
  %642 = fadd float %152, %626
  %643 = fadd float %153, %627
  %644 = fadd float %154, %628
  %645 = fadd float %155, %629
  %646 = fadd float %156, %630
  %647 = fadd float %157, %631
  %648 = fadd float %158, %632
  %649 = fadd float %159, %633
  %650 = fadd float %90, %634
  %651 = fadd float %91, %635
  %652 = fadd float %92, %636
  %653 = fadd float %93, %637
  %654 = fadd float %94, %638
  %655 = fadd float %95, %639
  %656 = fadd float %96, %640
  %657 = fadd float %97, %641
  %658 = fadd float %98, %642
  %659 = fadd float %99, %643
  %660 = fadd float %100, %644
  %661 = fadd float %101, %645
  %662 = fadd float %102, %646
  %663 = fadd float %103, %647
  %664 = fadd float %104, %648
  %665 = fadd float %105, %649
  %666 = fmul float %650, %650
  %667 = fmul float %651, %651
  %668 = fmul float %652, %652
  %669 = fmul float %653, %653
  %670 = fmul float %654, %654
  %671 = fmul float %655, %655
  %672 = fmul float %656, %656
  %673 = fmul float %657, %657
  %674 = fmul float %658, %658
  %675 = fmul float %659, %659
  %676 = fmul float %660, %660
  %677 = fmul float %661, %661
  %678 = fmul float %662, %662
  %679 = fmul float %663, %663
  %680 = fmul float %664, %664
  %681 = fmul float %665, %665
  %682 = fadd float %666, %667
  %683 = fadd float %682, %668
  %684 = fadd float %683, %669
  %685 = fadd float %684, %670
  %686 = fadd float %685, %671
  %687 = fadd float %686, %672
  %688 = fadd float %687, %673
  %689 = fadd float %688, %674
  %690 = fadd float %689, %675
  %691 = fadd float %690, %676
  %692 = fadd float %691, %677
  %693 = fadd float %692, %678
  %694 = fadd float %693, %679
  %695 = fadd float %694, %680
  %696 = fadd float %695, %681
  %697 = bitcast float %696 to i32
  %698 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %697, i32 16, i32 31)
  %699 = bitcast i32 %698 to float
  %700 = fadd float %696, %699
  %701 = bitcast float %700 to i32
  %702 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %701, i32 8, i32 31)
  %703 = bitcast i32 %702 to float
  %704 = fadd float %700, %703
  %705 = bitcast float %704 to i32
  %706 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %705, i32 4, i32 31)
  %707 = bitcast i32 %706 to float
  %708 = fadd float %704, %707
  %709 = bitcast float %708 to i32
  %710 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %709, i32 2, i32 31)
  %711 = bitcast i32 %710 to float
  %712 = fadd float %708, %711
  %713 = bitcast float %712 to i32
  %714 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %713, i32 1, i32 31)
  %715 = bitcast i32 %714 to float
  %716 = fadd float %712, %715
  %717 = urem i32 %16, 32
  %718 = urem i32 %17, 2
  %719 = icmp eq i32 %717, 0
  %720 = and i1 true, %719
  %721 = add i32 0, %718
  %722 = getelementptr float, ptr addrspace(3) @global_smem, i32 %721
  %723 = insertelement <1 x float> undef, float %716, i32 0
  %724 = extractelement <1 x float> %723, i32 0
  %725 = bitcast float %724 to i32
  %726 = insertelement <1 x i32> undef, i32 %725, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %722, <1 x i32> %726, i1 %720)
  call void @llvm.nvvm.barrier0()
  %727 = icmp slt i32 %15, 2
  %728 = getelementptr float, ptr addrspace(3) @global_smem, i32 %15
  %729 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %728, i1 %727)
  %730 = insertelement <1 x i32> undef, i32 %729, i32 0
  %731 = extractelement <1 x i32> %730, i32 0
  %732 = bitcast i32 %731 to float
  %733 = insertelement <1 x float> undef, float %732, i32 0
  %734 = extractelement <1 x float> %733, i32 0
  %735 = bitcast float %734 to i32
  %736 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %735, i32 1, i32 31)
  %737 = bitcast i32 %736 to float
  %738 = fadd float %734, %737
  %739 = urem i32 %16, 2
  %740 = icmp eq i32 %739, 0
  %741 = and i1 %727, %740
  %742 = insertelement <1 x float> undef, float %738, i32 0
  %743 = extractelement <1 x float> %742, i32 0
  %744 = bitcast float %743 to i32
  %745 = insertelement <1 x i32> undef, i32 %744, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %728, <1 x i32> %745, i1 %741)
  call void @llvm.nvvm.barrier0()
  %746 = load float, ptr addrspace(3) @global_smem, align 4
  %747 = fmul float %746, 0x3F50000000000000
  %748 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %749 = bitcast i32 %748 to <1 x float>
  %750 = extractelement <1 x float> %749, i32 0
  %751 = fadd float %747, %750
  %752 = call float @__nv_rsqrtf(float %751)
  %753 = fmul float %650, %752
  %754 = fmul float %651, %752
  %755 = fmul float %652, %752
  %756 = fmul float %653, %752
  %757 = fmul float %654, %752
  %758 = fmul float %655, %752
  %759 = fmul float %656, %752
  %760 = fmul float %657, %752
  %761 = fmul float %658, %752
  %762 = fmul float %659, %752
  %763 = fmul float %660, %752
  %764 = fmul float %661, %752
  %765 = fmul float %662, %752
  %766 = fmul float %663, %752
  %767 = fmul float %664, %752
  %768 = fmul float %665, %752
  %769 = getelementptr bfloat, ptr addrspace(1) %2, i64 %50
  %770 = getelementptr bfloat, ptr addrspace(1) %2, i64 %52
  %771 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %769)
  %772 = extractvalue { i32, i32, i32, i32 } %771, 0
  %773 = bitcast i32 %772 to <2 x bfloat>
  %774 = extractvalue { i32, i32, i32, i32 } %771, 1
  %775 = bitcast i32 %774 to <2 x bfloat>
  %776 = extractvalue { i32, i32, i32, i32 } %771, 2
  %777 = bitcast i32 %776 to <2 x bfloat>
  %778 = extractvalue { i32, i32, i32, i32 } %771, 3
  %779 = bitcast i32 %778 to <2 x bfloat>
  %780 = extractelement <2 x bfloat> %773, i32 0
  %781 = extractelement <2 x bfloat> %773, i32 1
  %782 = extractelement <2 x bfloat> %775, i32 0
  %783 = extractelement <2 x bfloat> %775, i32 1
  %784 = extractelement <2 x bfloat> %777, i32 0
  %785 = extractelement <2 x bfloat> %777, i32 1
  %786 = extractelement <2 x bfloat> %779, i32 0
  %787 = extractelement <2 x bfloat> %779, i32 1
  %788 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %770)
  %789 = extractvalue { i32, i32, i32, i32 } %788, 0
  %790 = bitcast i32 %789 to <2 x bfloat>
  %791 = extractvalue { i32, i32, i32, i32 } %788, 1
  %792 = bitcast i32 %791 to <2 x bfloat>
  %793 = extractvalue { i32, i32, i32, i32 } %788, 2
  %794 = bitcast i32 %793 to <2 x bfloat>
  %795 = extractvalue { i32, i32, i32, i32 } %788, 3
  %796 = bitcast i32 %795 to <2 x bfloat>
  %797 = extractelement <2 x bfloat> %790, i32 0
  %798 = extractelement <2 x bfloat> %790, i32 1
  %799 = extractelement <2 x bfloat> %792, i32 0
  %800 = extractelement <2 x bfloat> %792, i32 1
  %801 = extractelement <2 x bfloat> %794, i32 0
  %802 = extractelement <2 x bfloat> %794, i32 1
  %803 = extractelement <2 x bfloat> %796, i32 0
  %804 = extractelement <2 x bfloat> %796, i32 1
  %805 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %780)
  %806 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %781)
  %807 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %782)
  %808 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %783)
  %809 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %784)
  %810 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %785)
  %811 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %786)
  %812 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %787)
  %813 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %797)
  %814 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %798)
  %815 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %799)
  %816 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %800)
  %817 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %801)
  %818 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %802)
  %819 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %803)
  %820 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %804)
  %821 = fmul float %753, %805
  %822 = fmul float %754, %806
  %823 = fmul float %755, %807
  %824 = fmul float %756, %808
  %825 = fmul float %757, %809
  %826 = fmul float %758, %810
  %827 = fmul float %759, %811
  %828 = fmul float %760, %812
  %829 = fmul float %761, %813
  %830 = fmul float %762, %814
  %831 = fmul float %763, %815
  %832 = fmul float %764, %816
  %833 = fmul float %765, %817
  %834 = fmul float %766, %818
  %835 = fmul float %767, %819
  %836 = fmul float %768, %820
  %837 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %821)
  %838 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %822)
  %839 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %823)
  %840 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %824)
  %841 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %825)
  %842 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %826)
  %843 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %827)
  %844 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %828)
  %845 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %829)
  %846 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %830)
  %847 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %831)
  %848 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %832)
  %849 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %833)
  %850 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %834)
  %851 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %835)
  %852 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %836)
  %853 = getelementptr bfloat, ptr addrspace(1) %9, i64 %106
  %854 = getelementptr bfloat, ptr addrspace(1) %853, i64 %50
  %855 = getelementptr bfloat, ptr addrspace(1) %853, i64 %52
  %856 = insertelement <2 x bfloat> undef, bfloat %837, i32 0
  %857 = insertelement <2 x bfloat> %856, bfloat %838, i32 1
  %858 = bitcast <2 x bfloat> %857 to i32
  %859 = insertelement <2 x bfloat> undef, bfloat %839, i32 0
  %860 = insertelement <2 x bfloat> %859, bfloat %840, i32 1
  %861 = bitcast <2 x bfloat> %860 to i32
  %862 = insertelement <2 x bfloat> undef, bfloat %841, i32 0
  %863 = insertelement <2 x bfloat> %862, bfloat %842, i32 1
  %864 = bitcast <2 x bfloat> %863 to i32
  %865 = insertelement <2 x bfloat> undef, bfloat %843, i32 0
  %866 = insertelement <2 x bfloat> %865, bfloat %844, i32 1
  %867 = bitcast <2 x bfloat> %866 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %858, i32 %861, i32 %864, i32 %867, ptr addrspace(1) %854)
  %868 = insertelement <2 x bfloat> undef, bfloat %845, i32 0
  %869 = insertelement <2 x bfloat> %868, bfloat %846, i32 1
  %870 = bitcast <2 x bfloat> %869 to i32
  %871 = insertelement <2 x bfloat> undef, bfloat %847, i32 0
  %872 = insertelement <2 x bfloat> %871, bfloat %848, i32 1
  %873 = bitcast <2 x bfloat> %872 to i32
  %874 = insertelement <2 x bfloat> undef, bfloat %849, i32 0
  %875 = insertelement <2 x bfloat> %874, bfloat %850, i32 1
  %876 = bitcast <2 x bfloat> %875 to i32
  %877 = insertelement <2 x bfloat> undef, bfloat %851, i32 0
  %878 = insertelement <2 x bfloat> %877, bfloat %852, i32 1
  %879 = bitcast <2 x bfloat> %878 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %870, i32 %873, i32 %876, i32 %879, ptr addrspace(1) %855)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_100_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_100(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8, ptr noalias align 128 dereferenceable(32768) %arg9) #6 {
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
  %14 = mul i64 %13, 1024
  %15 = getelementptr bfloat, ptr addrspace(1) %2, i64 %14
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
  %44 = xor i32 %42, 4
  %45 = xor i32 %42, 512
  %46 = xor i32 %42, 516
  %47 = add i32 %43, 0
  %48 = add i32 %44, 0
  %49 = add i32 %45, 0
  %50 = add i32 %46, 0
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = sext i32 %49 to i64
  %54 = sext i32 %50 to i64
  %55 = getelementptr bfloat, ptr addrspace(1) %15, i64 %51
  %56 = getelementptr bfloat, ptr addrspace(1) %15, i64 %53
  %57 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %55)
  %58 = extractvalue { i32, i32, i32, i32 } %57, 0
  %59 = bitcast i32 %58 to <2 x bfloat>
  %60 = extractvalue { i32, i32, i32, i32 } %57, 1
  %61 = bitcast i32 %60 to <2 x bfloat>
  %62 = extractvalue { i32, i32, i32, i32 } %57, 2
  %63 = bitcast i32 %62 to <2 x bfloat>
  %64 = extractvalue { i32, i32, i32, i32 } %57, 3
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractelement <2 x bfloat> %59, i32 0
  %67 = extractelement <2 x bfloat> %59, i32 1
  %68 = extractelement <2 x bfloat> %61, i32 0
  %69 = extractelement <2 x bfloat> %61, i32 1
  %70 = extractelement <2 x bfloat> %63, i32 0
  %71 = extractelement <2 x bfloat> %63, i32 1
  %72 = extractelement <2 x bfloat> %65, i32 0
  %73 = extractelement <2 x bfloat> %65, i32 1
  %74 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %56)
  %75 = extractvalue { i32, i32, i32, i32 } %74, 0
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %74, 1
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %74, 2
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractvalue { i32, i32, i32, i32 } %74, 3
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractelement <2 x bfloat> %76, i32 0
  %84 = extractelement <2 x bfloat> %76, i32 1
  %85 = extractelement <2 x bfloat> %78, i32 0
  %86 = extractelement <2 x bfloat> %78, i32 1
  %87 = extractelement <2 x bfloat> %80, i32 0
  %88 = extractelement <2 x bfloat> %80, i32 1
  %89 = extractelement <2 x bfloat> %82, i32 0
  %90 = extractelement <2 x bfloat> %82, i32 1
  %91 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %66)
  %92 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %67)
  %93 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %68)
  %94 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69)
  %95 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70)
  %96 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71)
  %97 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72)
  %98 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73)
  %99 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83)
  %100 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84)
  %101 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85)
  %102 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86)
  %103 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87)
  %104 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88)
  %105 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89)
  %106 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90)
  %107 = mul i64 %13, 8192
  %108 = getelementptr bfloat, ptr addrspace(1) %5, i64 %107
  %109 = getelementptr bfloat, ptr addrspace(1) %108, i64 %51
  %110 = getelementptr bfloat, ptr addrspace(1) %108, i64 %53
  %111 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %109)
  %112 = extractvalue { i32, i32, i32, i32 } %111, 0
  %113 = bitcast i32 %112 to <2 x bfloat>
  %114 = extractvalue { i32, i32, i32, i32 } %111, 1
  %115 = bitcast i32 %114 to <2 x bfloat>
  %116 = extractvalue { i32, i32, i32, i32 } %111, 2
  %117 = bitcast i32 %116 to <2 x bfloat>
  %118 = extractvalue { i32, i32, i32, i32 } %111, 3
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractelement <2 x bfloat> %113, i32 0
  %121 = extractelement <2 x bfloat> %113, i32 1
  %122 = extractelement <2 x bfloat> %115, i32 0
  %123 = extractelement <2 x bfloat> %115, i32 1
  %124 = extractelement <2 x bfloat> %117, i32 0
  %125 = extractelement <2 x bfloat> %117, i32 1
  %126 = extractelement <2 x bfloat> %119, i32 0
  %127 = extractelement <2 x bfloat> %119, i32 1
  %128 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %110)
  %129 = extractvalue { i32, i32, i32, i32 } %128, 0
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %128, 1
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %128, 2
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractvalue { i32, i32, i32, i32 } %128, 3
  %136 = bitcast i32 %135 to <2 x bfloat>
  %137 = extractelement <2 x bfloat> %130, i32 0
  %138 = extractelement <2 x bfloat> %130, i32 1
  %139 = extractelement <2 x bfloat> %132, i32 0
  %140 = extractelement <2 x bfloat> %132, i32 1
  %141 = extractelement <2 x bfloat> %134, i32 0
  %142 = extractelement <2 x bfloat> %134, i32 1
  %143 = extractelement <2 x bfloat> %136, i32 0
  %144 = extractelement <2 x bfloat> %136, i32 1
  %145 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %120)
  %146 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %121)
  %147 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %122)
  %148 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %123)
  %149 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %124)
  %150 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125)
  %151 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126)
  %152 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127)
  %153 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137)
  %154 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138)
  %155 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139)
  %156 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140)
  %157 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141)
  %158 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142)
  %159 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143)
  %160 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144)
  %161 = getelementptr bfloat, ptr addrspace(1) %6, i64 %14
  %162 = getelementptr bfloat, ptr addrspace(1) %161, i64 %51
  %163 = getelementptr bfloat, ptr addrspace(1) %161, i64 %53
  %164 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %162)
  %165 = extractvalue { i32, i32, i32, i32 } %164, 0
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %164, 1
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractvalue { i32, i32, i32, i32 } %164, 2
  %170 = bitcast i32 %169 to <2 x bfloat>
  %171 = extractvalue { i32, i32, i32, i32 } %164, 3
  %172 = bitcast i32 %171 to <2 x bfloat>
  %173 = extractelement <2 x bfloat> %166, i32 0
  %174 = extractelement <2 x bfloat> %166, i32 1
  %175 = extractelement <2 x bfloat> %168, i32 0
  %176 = extractelement <2 x bfloat> %168, i32 1
  %177 = extractelement <2 x bfloat> %170, i32 0
  %178 = extractelement <2 x bfloat> %170, i32 1
  %179 = extractelement <2 x bfloat> %172, i32 0
  %180 = extractelement <2 x bfloat> %172, i32 1
  %181 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %163)
  %182 = extractvalue { i32, i32, i32, i32 } %181, 0
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %181, 1
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %181, 2
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractvalue { i32, i32, i32, i32 } %181, 3
  %189 = bitcast i32 %188 to <2 x bfloat>
  %190 = extractelement <2 x bfloat> %183, i32 0
  %191 = extractelement <2 x bfloat> %183, i32 1
  %192 = extractelement <2 x bfloat> %185, i32 0
  %193 = extractelement <2 x bfloat> %185, i32 1
  %194 = extractelement <2 x bfloat> %187, i32 0
  %195 = extractelement <2 x bfloat> %187, i32 1
  %196 = extractelement <2 x bfloat> %189, i32 0
  %197 = extractelement <2 x bfloat> %189, i32 1
  %198 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173)
  %199 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174)
  %200 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175)
  %201 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176)
  %202 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %177)
  %203 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %178)
  %204 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %179)
  %205 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180)
  %206 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190)
  %207 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191)
  %208 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192)
  %209 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193)
  %210 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194)
  %211 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195)
  %212 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196)
  %213 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %197)
  %214 = add i64 %107, 1024
  %215 = getelementptr bfloat, ptr addrspace(1) %5, i64 %214
  %216 = getelementptr bfloat, ptr addrspace(1) %215, i64 %51
  %217 = getelementptr bfloat, ptr addrspace(1) %215, i64 %53
  %218 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %216)
  %219 = extractvalue { i32, i32, i32, i32 } %218, 0
  %220 = bitcast i32 %219 to <2 x bfloat>
  %221 = extractvalue { i32, i32, i32, i32 } %218, 1
  %222 = bitcast i32 %221 to <2 x bfloat>
  %223 = extractvalue { i32, i32, i32, i32 } %218, 2
  %224 = bitcast i32 %223 to <2 x bfloat>
  %225 = extractvalue { i32, i32, i32, i32 } %218, 3
  %226 = bitcast i32 %225 to <2 x bfloat>
  %227 = extractelement <2 x bfloat> %220, i32 0
  %228 = extractelement <2 x bfloat> %220, i32 1
  %229 = extractelement <2 x bfloat> %222, i32 0
  %230 = extractelement <2 x bfloat> %222, i32 1
  %231 = extractelement <2 x bfloat> %224, i32 0
  %232 = extractelement <2 x bfloat> %224, i32 1
  %233 = extractelement <2 x bfloat> %226, i32 0
  %234 = extractelement <2 x bfloat> %226, i32 1
  %235 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %217)
  %236 = extractvalue { i32, i32, i32, i32 } %235, 0
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %235, 1
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %235, 2
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractvalue { i32, i32, i32, i32 } %235, 3
  %243 = bitcast i32 %242 to <2 x bfloat>
  %244 = extractelement <2 x bfloat> %237, i32 0
  %245 = extractelement <2 x bfloat> %237, i32 1
  %246 = extractelement <2 x bfloat> %239, i32 0
  %247 = extractelement <2 x bfloat> %239, i32 1
  %248 = extractelement <2 x bfloat> %241, i32 0
  %249 = extractelement <2 x bfloat> %241, i32 1
  %250 = extractelement <2 x bfloat> %243, i32 0
  %251 = extractelement <2 x bfloat> %243, i32 1
  %252 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %227)
  %253 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %228)
  %254 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %229)
  %255 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %230)
  %256 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %231)
  %257 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %232)
  %258 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %233)
  %259 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234)
  %260 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244)
  %261 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245)
  %262 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246)
  %263 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247)
  %264 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248)
  %265 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249)
  %266 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250)
  %267 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %251)
  %268 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %269 = getelementptr bfloat, ptr addrspace(1) %268, i64 %51
  %270 = getelementptr bfloat, ptr addrspace(1) %268, i64 %53
  %271 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %269)
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
  %288 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %270)
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
  %305 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %280)
  %306 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %281)
  %307 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %282)
  %308 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %283)
  %309 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %284)
  %310 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %285)
  %311 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %286)
  %312 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287)
  %313 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297)
  %314 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298)
  %315 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299)
  %316 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300)
  %317 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301)
  %318 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302)
  %319 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303)
  %320 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %304)
  %321 = add i64 %107, 2048
  %322 = getelementptr bfloat, ptr addrspace(1) %5, i64 %321
  %323 = getelementptr bfloat, ptr addrspace(1) %322, i64 %51
  %324 = getelementptr bfloat, ptr addrspace(1) %322, i64 %53
  %325 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %323)
  %326 = extractvalue { i32, i32, i32, i32 } %325, 0
  %327 = bitcast i32 %326 to <2 x bfloat>
  %328 = extractvalue { i32, i32, i32, i32 } %325, 1
  %329 = bitcast i32 %328 to <2 x bfloat>
  %330 = extractvalue { i32, i32, i32, i32 } %325, 2
  %331 = bitcast i32 %330 to <2 x bfloat>
  %332 = extractvalue { i32, i32, i32, i32 } %325, 3
  %333 = bitcast i32 %332 to <2 x bfloat>
  %334 = extractelement <2 x bfloat> %327, i32 0
  %335 = extractelement <2 x bfloat> %327, i32 1
  %336 = extractelement <2 x bfloat> %329, i32 0
  %337 = extractelement <2 x bfloat> %329, i32 1
  %338 = extractelement <2 x bfloat> %331, i32 0
  %339 = extractelement <2 x bfloat> %331, i32 1
  %340 = extractelement <2 x bfloat> %333, i32 0
  %341 = extractelement <2 x bfloat> %333, i32 1
  %342 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %324)
  %343 = extractvalue { i32, i32, i32, i32 } %342, 0
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %342, 1
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractvalue { i32, i32, i32, i32 } %342, 2
  %348 = bitcast i32 %347 to <2 x bfloat>
  %349 = extractvalue { i32, i32, i32, i32 } %342, 3
  %350 = bitcast i32 %349 to <2 x bfloat>
  %351 = extractelement <2 x bfloat> %344, i32 0
  %352 = extractelement <2 x bfloat> %344, i32 1
  %353 = extractelement <2 x bfloat> %346, i32 0
  %354 = extractelement <2 x bfloat> %346, i32 1
  %355 = extractelement <2 x bfloat> %348, i32 0
  %356 = extractelement <2 x bfloat> %348, i32 1
  %357 = extractelement <2 x bfloat> %350, i32 0
  %358 = extractelement <2 x bfloat> %350, i32 1
  %359 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %334)
  %360 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %335)
  %361 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %336)
  %362 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %337)
  %363 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %338)
  %364 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %339)
  %365 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %340)
  %366 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %341)
  %367 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351)
  %368 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352)
  %369 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353)
  %370 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354)
  %371 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355)
  %372 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356)
  %373 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %357)
  %374 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %358)
  %375 = getelementptr bfloat, ptr addrspace(1) %9, i64 %14
  %376 = getelementptr bfloat, ptr addrspace(1) %375, i64 %51
  %377 = getelementptr bfloat, ptr addrspace(1) %375, i64 %53
  %378 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %376)
  %379 = extractvalue { i32, i32, i32, i32 } %378, 0
  %380 = bitcast i32 %379 to <2 x bfloat>
  %381 = extractvalue { i32, i32, i32, i32 } %378, 1
  %382 = bitcast i32 %381 to <2 x bfloat>
  %383 = extractvalue { i32, i32, i32, i32 } %378, 2
  %384 = bitcast i32 %383 to <2 x bfloat>
  %385 = extractvalue { i32, i32, i32, i32 } %378, 3
  %386 = bitcast i32 %385 to <2 x bfloat>
  %387 = extractelement <2 x bfloat> %380, i32 0
  %388 = extractelement <2 x bfloat> %380, i32 1
  %389 = extractelement <2 x bfloat> %382, i32 0
  %390 = extractelement <2 x bfloat> %382, i32 1
  %391 = extractelement <2 x bfloat> %384, i32 0
  %392 = extractelement <2 x bfloat> %384, i32 1
  %393 = extractelement <2 x bfloat> %386, i32 0
  %394 = extractelement <2 x bfloat> %386, i32 1
  %395 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %377)
  %396 = extractvalue { i32, i32, i32, i32 } %395, 0
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %395, 1
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractvalue { i32, i32, i32, i32 } %395, 2
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractvalue { i32, i32, i32, i32 } %395, 3
  %403 = bitcast i32 %402 to <2 x bfloat>
  %404 = extractelement <2 x bfloat> %397, i32 0
  %405 = extractelement <2 x bfloat> %397, i32 1
  %406 = extractelement <2 x bfloat> %399, i32 0
  %407 = extractelement <2 x bfloat> %399, i32 1
  %408 = extractelement <2 x bfloat> %401, i32 0
  %409 = extractelement <2 x bfloat> %401, i32 1
  %410 = extractelement <2 x bfloat> %403, i32 0
  %411 = extractelement <2 x bfloat> %403, i32 1
  %412 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %387)
  %413 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %388)
  %414 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %389)
  %415 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %390)
  %416 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %391)
  %417 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %392)
  %418 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393)
  %419 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394)
  %420 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404)
  %421 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405)
  %422 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406)
  %423 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407)
  %424 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408)
  %425 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409)
  %426 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %410)
  %427 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %411)
  %428 = add i64 %107, 3072
  %429 = getelementptr bfloat, ptr addrspace(1) %5, i64 %428
  %430 = getelementptr bfloat, ptr addrspace(1) %429, i64 %51
  %431 = getelementptr bfloat, ptr addrspace(1) %429, i64 %53
  %432 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %430)
  %433 = extractvalue { i32, i32, i32, i32 } %432, 0
  %434 = bitcast i32 %433 to <2 x bfloat>
  %435 = extractvalue { i32, i32, i32, i32 } %432, 1
  %436 = bitcast i32 %435 to <2 x bfloat>
  %437 = extractvalue { i32, i32, i32, i32 } %432, 2
  %438 = bitcast i32 %437 to <2 x bfloat>
  %439 = extractvalue { i32, i32, i32, i32 } %432, 3
  %440 = bitcast i32 %439 to <2 x bfloat>
  %441 = extractelement <2 x bfloat> %434, i32 0
  %442 = extractelement <2 x bfloat> %434, i32 1
  %443 = extractelement <2 x bfloat> %436, i32 0
  %444 = extractelement <2 x bfloat> %436, i32 1
  %445 = extractelement <2 x bfloat> %438, i32 0
  %446 = extractelement <2 x bfloat> %438, i32 1
  %447 = extractelement <2 x bfloat> %440, i32 0
  %448 = extractelement <2 x bfloat> %440, i32 1
  %449 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %431)
  %450 = extractvalue { i32, i32, i32, i32 } %449, 0
  %451 = bitcast i32 %450 to <2 x bfloat>
  %452 = extractvalue { i32, i32, i32, i32 } %449, 1
  %453 = bitcast i32 %452 to <2 x bfloat>
  %454 = extractvalue { i32, i32, i32, i32 } %449, 2
  %455 = bitcast i32 %454 to <2 x bfloat>
  %456 = extractvalue { i32, i32, i32, i32 } %449, 3
  %457 = bitcast i32 %456 to <2 x bfloat>
  %458 = extractelement <2 x bfloat> %451, i32 0
  %459 = extractelement <2 x bfloat> %451, i32 1
  %460 = extractelement <2 x bfloat> %453, i32 0
  %461 = extractelement <2 x bfloat> %453, i32 1
  %462 = extractelement <2 x bfloat> %455, i32 0
  %463 = extractelement <2 x bfloat> %455, i32 1
  %464 = extractelement <2 x bfloat> %457, i32 0
  %465 = extractelement <2 x bfloat> %457, i32 1
  %466 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441)
  %467 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442)
  %468 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443)
  %469 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444)
  %470 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %445)
  %471 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %446)
  %472 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447)
  %473 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448)
  %474 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458)
  %475 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459)
  %476 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460)
  %477 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461)
  %478 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462)
  %479 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463)
  %480 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %464)
  %481 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %465)
  %482 = getelementptr bfloat, ptr addrspace(1) %8, i64 %14
  %483 = getelementptr bfloat, ptr addrspace(1) %482, i64 %51
  %484 = getelementptr bfloat, ptr addrspace(1) %482, i64 %53
  %485 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %483)
  %486 = extractvalue { i32, i32, i32, i32 } %485, 0
  %487 = bitcast i32 %486 to <2 x bfloat>
  %488 = extractvalue { i32, i32, i32, i32 } %485, 1
  %489 = bitcast i32 %488 to <2 x bfloat>
  %490 = extractvalue { i32, i32, i32, i32 } %485, 2
  %491 = bitcast i32 %490 to <2 x bfloat>
  %492 = extractvalue { i32, i32, i32, i32 } %485, 3
  %493 = bitcast i32 %492 to <2 x bfloat>
  %494 = extractelement <2 x bfloat> %487, i32 0
  %495 = extractelement <2 x bfloat> %487, i32 1
  %496 = extractelement <2 x bfloat> %489, i32 0
  %497 = extractelement <2 x bfloat> %489, i32 1
  %498 = extractelement <2 x bfloat> %491, i32 0
  %499 = extractelement <2 x bfloat> %491, i32 1
  %500 = extractelement <2 x bfloat> %493, i32 0
  %501 = extractelement <2 x bfloat> %493, i32 1
  %502 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %484)
  %503 = extractvalue { i32, i32, i32, i32 } %502, 0
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractvalue { i32, i32, i32, i32 } %502, 1
  %506 = bitcast i32 %505 to <2 x bfloat>
  %507 = extractvalue { i32, i32, i32, i32 } %502, 2
  %508 = bitcast i32 %507 to <2 x bfloat>
  %509 = extractvalue { i32, i32, i32, i32 } %502, 3
  %510 = bitcast i32 %509 to <2 x bfloat>
  %511 = extractelement <2 x bfloat> %504, i32 0
  %512 = extractelement <2 x bfloat> %504, i32 1
  %513 = extractelement <2 x bfloat> %506, i32 0
  %514 = extractelement <2 x bfloat> %506, i32 1
  %515 = extractelement <2 x bfloat> %508, i32 0
  %516 = extractelement <2 x bfloat> %508, i32 1
  %517 = extractelement <2 x bfloat> %510, i32 0
  %518 = extractelement <2 x bfloat> %510, i32 1
  %519 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %494)
  %520 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %495)
  %521 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %496)
  %522 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %497)
  %523 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %498)
  %524 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499)
  %525 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500)
  %526 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501)
  %527 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511)
  %528 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512)
  %529 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513)
  %530 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514)
  %531 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515)
  %532 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516)
  %533 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517)
  %534 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518)
  %535 = getelementptr float, ptr addrspace(1) %7, i64 %14
  %536 = getelementptr float, ptr addrspace(1) %535, i64 %51
  %537 = getelementptr float, ptr addrspace(1) %535, i64 %52
  %538 = getelementptr float, ptr addrspace(1) %535, i64 %53
  %539 = getelementptr float, ptr addrspace(1) %535, i64 %54
  %540 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %536)
  %541 = extractvalue { i32, i32, i32, i32 } %540, 0
  %542 = bitcast i32 %541 to <1 x float>
  %543 = extractvalue { i32, i32, i32, i32 } %540, 1
  %544 = bitcast i32 %543 to <1 x float>
  %545 = extractvalue { i32, i32, i32, i32 } %540, 2
  %546 = bitcast i32 %545 to <1 x float>
  %547 = extractvalue { i32, i32, i32, i32 } %540, 3
  %548 = bitcast i32 %547 to <1 x float>
  %549 = extractelement <1 x float> %542, i32 0
  %550 = extractelement <1 x float> %544, i32 0
  %551 = extractelement <1 x float> %546, i32 0
  %552 = extractelement <1 x float> %548, i32 0
  %553 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %537)
  %554 = extractvalue { i32, i32, i32, i32 } %553, 0
  %555 = bitcast i32 %554 to <1 x float>
  %556 = extractvalue { i32, i32, i32, i32 } %553, 1
  %557 = bitcast i32 %556 to <1 x float>
  %558 = extractvalue { i32, i32, i32, i32 } %553, 2
  %559 = bitcast i32 %558 to <1 x float>
  %560 = extractvalue { i32, i32, i32, i32 } %553, 3
  %561 = bitcast i32 %560 to <1 x float>
  %562 = extractelement <1 x float> %555, i32 0
  %563 = extractelement <1 x float> %557, i32 0
  %564 = extractelement <1 x float> %559, i32 0
  %565 = extractelement <1 x float> %561, i32 0
  %566 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %538)
  %567 = extractvalue { i32, i32, i32, i32 } %566, 0
  %568 = bitcast i32 %567 to <1 x float>
  %569 = extractvalue { i32, i32, i32, i32 } %566, 1
  %570 = bitcast i32 %569 to <1 x float>
  %571 = extractvalue { i32, i32, i32, i32 } %566, 2
  %572 = bitcast i32 %571 to <1 x float>
  %573 = extractvalue { i32, i32, i32, i32 } %566, 3
  %574 = bitcast i32 %573 to <1 x float>
  %575 = extractelement <1 x float> %568, i32 0
  %576 = extractelement <1 x float> %570, i32 0
  %577 = extractelement <1 x float> %572, i32 0
  %578 = extractelement <1 x float> %574, i32 0
  %579 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %539)
  %580 = extractvalue { i32, i32, i32, i32 } %579, 0
  %581 = bitcast i32 %580 to <1 x float>
  %582 = extractvalue { i32, i32, i32, i32 } %579, 1
  %583 = bitcast i32 %582 to <1 x float>
  %584 = extractvalue { i32, i32, i32, i32 } %579, 2
  %585 = bitcast i32 %584 to <1 x float>
  %586 = extractvalue { i32, i32, i32, i32 } %579, 3
  %587 = bitcast i32 %586 to <1 x float>
  %588 = extractelement <1 x float> %581, i32 0
  %589 = extractelement <1 x float> %583, i32 0
  %590 = extractelement <1 x float> %585, i32 0
  %591 = extractelement <1 x float> %587, i32 0
  %592 = fadd float %519, %549
  %593 = fadd float %520, %550
  %594 = fadd float %521, %551
  %595 = fadd float %522, %552
  %596 = fadd float %523, %562
  %597 = fadd float %524, %563
  %598 = fadd float %525, %564
  %599 = fadd float %526, %565
  %600 = fadd float %527, %575
  %601 = fadd float %528, %576
  %602 = fadd float %529, %577
  %603 = fadd float %530, %578
  %604 = fadd float %531, %588
  %605 = fadd float %532, %589
  %606 = fadd float %533, %590
  %607 = fadd float %534, %591
  %608 = fadd float %466, %592
  %609 = fadd float %467, %593
  %610 = fadd float %468, %594
  %611 = fadd float %469, %595
  %612 = fadd float %470, %596
  %613 = fadd float %471, %597
  %614 = fadd float %472, %598
  %615 = fadd float %473, %599
  %616 = fadd float %474, %600
  %617 = fadd float %475, %601
  %618 = fadd float %476, %602
  %619 = fadd float %477, %603
  %620 = fadd float %478, %604
  %621 = fadd float %479, %605
  %622 = fadd float %480, %606
  %623 = fadd float %481, %607
  %624 = fadd float %412, %608
  %625 = fadd float %413, %609
  %626 = fadd float %414, %610
  %627 = fadd float %415, %611
  %628 = fadd float %416, %612
  %629 = fadd float %417, %613
  %630 = fadd float %418, %614
  %631 = fadd float %419, %615
  %632 = fadd float %420, %616
  %633 = fadd float %421, %617
  %634 = fadd float %422, %618
  %635 = fadd float %423, %619
  %636 = fadd float %424, %620
  %637 = fadd float %425, %621
  %638 = fadd float %426, %622
  %639 = fadd float %427, %623
  %640 = fadd float %359, %624
  %641 = fadd float %360, %625
  %642 = fadd float %361, %626
  %643 = fadd float %362, %627
  %644 = fadd float %363, %628
  %645 = fadd float %364, %629
  %646 = fadd float %365, %630
  %647 = fadd float %366, %631
  %648 = fadd float %367, %632
  %649 = fadd float %368, %633
  %650 = fadd float %369, %634
  %651 = fadd float %370, %635
  %652 = fadd float %371, %636
  %653 = fadd float %372, %637
  %654 = fadd float %373, %638
  %655 = fadd float %374, %639
  %656 = fadd float %305, %640
  %657 = fadd float %306, %641
  %658 = fadd float %307, %642
  %659 = fadd float %308, %643
  %660 = fadd float %309, %644
  %661 = fadd float %310, %645
  %662 = fadd float %311, %646
  %663 = fadd float %312, %647
  %664 = fadd float %313, %648
  %665 = fadd float %314, %649
  %666 = fadd float %315, %650
  %667 = fadd float %316, %651
  %668 = fadd float %317, %652
  %669 = fadd float %318, %653
  %670 = fadd float %319, %654
  %671 = fadd float %320, %655
  %672 = fadd float %252, %656
  %673 = fadd float %253, %657
  %674 = fadd float %254, %658
  %675 = fadd float %255, %659
  %676 = fadd float %256, %660
  %677 = fadd float %257, %661
  %678 = fadd float %258, %662
  %679 = fadd float %259, %663
  %680 = fadd float %260, %664
  %681 = fadd float %261, %665
  %682 = fadd float %262, %666
  %683 = fadd float %263, %667
  %684 = fadd float %264, %668
  %685 = fadd float %265, %669
  %686 = fadd float %266, %670
  %687 = fadd float %267, %671
  %688 = fadd float %198, %672
  %689 = fadd float %199, %673
  %690 = fadd float %200, %674
  %691 = fadd float %201, %675
  %692 = fadd float %202, %676
  %693 = fadd float %203, %677
  %694 = fadd float %204, %678
  %695 = fadd float %205, %679
  %696 = fadd float %206, %680
  %697 = fadd float %207, %681
  %698 = fadd float %208, %682
  %699 = fadd float %209, %683
  %700 = fadd float %210, %684
  %701 = fadd float %211, %685
  %702 = fadd float %212, %686
  %703 = fadd float %213, %687
  %704 = fadd float %145, %688
  %705 = fadd float %146, %689
  %706 = fadd float %147, %690
  %707 = fadd float %148, %691
  %708 = fadd float %149, %692
  %709 = fadd float %150, %693
  %710 = fadd float %151, %694
  %711 = fadd float %152, %695
  %712 = fadd float %153, %696
  %713 = fadd float %154, %697
  %714 = fadd float %155, %698
  %715 = fadd float %156, %699
  %716 = fadd float %157, %700
  %717 = fadd float %158, %701
  %718 = fadd float %159, %702
  %719 = fadd float %160, %703
  %720 = fadd float %91, %704
  %721 = fadd float %92, %705
  %722 = fadd float %93, %706
  %723 = fadd float %94, %707
  %724 = fadd float %95, %708
  %725 = fadd float %96, %709
  %726 = fadd float %97, %710
  %727 = fadd float %98, %711
  %728 = fadd float %99, %712
  %729 = fadd float %100, %713
  %730 = fadd float %101, %714
  %731 = fadd float %102, %715
  %732 = fadd float %103, %716
  %733 = fadd float %104, %717
  %734 = fadd float %105, %718
  %735 = fadd float %106, %719
  %736 = fmul float %720, %720
  %737 = fmul float %721, %721
  %738 = fmul float %722, %722
  %739 = fmul float %723, %723
  %740 = fmul float %724, %724
  %741 = fmul float %725, %725
  %742 = fmul float %726, %726
  %743 = fmul float %727, %727
  %744 = fmul float %728, %728
  %745 = fmul float %729, %729
  %746 = fmul float %730, %730
  %747 = fmul float %731, %731
  %748 = fmul float %732, %732
  %749 = fmul float %733, %733
  %750 = fmul float %734, %734
  %751 = fmul float %735, %735
  %752 = fadd float %736, %737
  %753 = fadd float %752, %738
  %754 = fadd float %753, %739
  %755 = fadd float %754, %740
  %756 = fadd float %755, %741
  %757 = fadd float %756, %742
  %758 = fadd float %757, %743
  %759 = fadd float %758, %744
  %760 = fadd float %759, %745
  %761 = fadd float %760, %746
  %762 = fadd float %761, %747
  %763 = fadd float %762, %748
  %764 = fadd float %763, %749
  %765 = fadd float %764, %750
  %766 = fadd float %765, %751
  %767 = bitcast float %766 to i32
  %768 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %767, i32 16, i32 31)
  %769 = bitcast i32 %768 to float
  %770 = fadd float %766, %769
  %771 = bitcast float %770 to i32
  %772 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %771, i32 8, i32 31)
  %773 = bitcast i32 %772 to float
  %774 = fadd float %770, %773
  %775 = bitcast float %774 to i32
  %776 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %775, i32 4, i32 31)
  %777 = bitcast i32 %776 to float
  %778 = fadd float %774, %777
  %779 = bitcast float %778 to i32
  %780 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %779, i32 2, i32 31)
  %781 = bitcast i32 %780 to float
  %782 = fadd float %778, %781
  %783 = bitcast float %782 to i32
  %784 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %783, i32 1, i32 31)
  %785 = bitcast i32 %784 to float
  %786 = fadd float %782, %785
  %787 = urem i32 %17, 32
  %788 = urem i32 %18, 2
  %789 = icmp eq i32 %787, 0
  %790 = and i1 true, %789
  %791 = add i32 0, %788
  %792 = getelementptr float, ptr addrspace(3) @global_smem, i32 %791
  %793 = insertelement <1 x float> undef, float %786, i32 0
  %794 = extractelement <1 x float> %793, i32 0
  %795 = bitcast float %794 to i32
  %796 = insertelement <1 x i32> undef, i32 %795, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %792, <1 x i32> %796, i1 %790)
  call void @llvm.nvvm.barrier0()
  %797 = icmp slt i32 %16, 2
  %798 = getelementptr float, ptr addrspace(3) @global_smem, i32 %16
  %799 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %798, i1 %797)
  %800 = insertelement <1 x i32> undef, i32 %799, i32 0
  %801 = extractelement <1 x i32> %800, i32 0
  %802 = bitcast i32 %801 to float
  %803 = insertelement <1 x float> undef, float %802, i32 0
  %804 = extractelement <1 x float> %803, i32 0
  %805 = bitcast float %804 to i32
  %806 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %805, i32 1, i32 31)
  %807 = bitcast i32 %806 to float
  %808 = fadd float %804, %807
  %809 = urem i32 %17, 2
  %810 = icmp eq i32 %809, 0
  %811 = and i1 %797, %810
  %812 = insertelement <1 x float> undef, float %808, i32 0
  %813 = extractelement <1 x float> %812, i32 0
  %814 = bitcast float %813 to i32
  %815 = insertelement <1 x i32> undef, i32 %814, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %798, <1 x i32> %815, i1 %811)
  call void @llvm.nvvm.barrier0()
  %816 = load float, ptr addrspace(3) @global_smem, align 4
  %817 = fmul float %816, 0x3F50000000000000
  %818 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %819 = bitcast i32 %818 to <1 x float>
  %820 = extractelement <1 x float> %819, i32 0
  %821 = fadd float %817, %820
  %822 = call float @__nv_rsqrtf(float %821)
  %823 = fmul float %720, %822
  %824 = fmul float %721, %822
  %825 = fmul float %722, %822
  %826 = fmul float %723, %822
  %827 = fmul float %724, %822
  %828 = fmul float %725, %822
  %829 = fmul float %726, %822
  %830 = fmul float %727, %822
  %831 = fmul float %728, %822
  %832 = fmul float %729, %822
  %833 = fmul float %730, %822
  %834 = fmul float %731, %822
  %835 = fmul float %732, %822
  %836 = fmul float %733, %822
  %837 = fmul float %734, %822
  %838 = fmul float %735, %822
  %839 = getelementptr bfloat, ptr addrspace(1) %3, i64 %51
  %840 = getelementptr bfloat, ptr addrspace(1) %3, i64 %53
  %841 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %839)
  %842 = extractvalue { i32, i32, i32, i32 } %841, 0
  %843 = bitcast i32 %842 to <2 x bfloat>
  %844 = extractvalue { i32, i32, i32, i32 } %841, 1
  %845 = bitcast i32 %844 to <2 x bfloat>
  %846 = extractvalue { i32, i32, i32, i32 } %841, 2
  %847 = bitcast i32 %846 to <2 x bfloat>
  %848 = extractvalue { i32, i32, i32, i32 } %841, 3
  %849 = bitcast i32 %848 to <2 x bfloat>
  %850 = extractelement <2 x bfloat> %843, i32 0
  %851 = extractelement <2 x bfloat> %843, i32 1
  %852 = extractelement <2 x bfloat> %845, i32 0
  %853 = extractelement <2 x bfloat> %845, i32 1
  %854 = extractelement <2 x bfloat> %847, i32 0
  %855 = extractelement <2 x bfloat> %847, i32 1
  %856 = extractelement <2 x bfloat> %849, i32 0
  %857 = extractelement <2 x bfloat> %849, i32 1
  %858 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %840)
  %859 = extractvalue { i32, i32, i32, i32 } %858, 0
  %860 = bitcast i32 %859 to <2 x bfloat>
  %861 = extractvalue { i32, i32, i32, i32 } %858, 1
  %862 = bitcast i32 %861 to <2 x bfloat>
  %863 = extractvalue { i32, i32, i32, i32 } %858, 2
  %864 = bitcast i32 %863 to <2 x bfloat>
  %865 = extractvalue { i32, i32, i32, i32 } %858, 3
  %866 = bitcast i32 %865 to <2 x bfloat>
  %867 = extractelement <2 x bfloat> %860, i32 0
  %868 = extractelement <2 x bfloat> %860, i32 1
  %869 = extractelement <2 x bfloat> %862, i32 0
  %870 = extractelement <2 x bfloat> %862, i32 1
  %871 = extractelement <2 x bfloat> %864, i32 0
  %872 = extractelement <2 x bfloat> %864, i32 1
  %873 = extractelement <2 x bfloat> %866, i32 0
  %874 = extractelement <2 x bfloat> %866, i32 1
  %875 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %850)
  %876 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %851)
  %877 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %852)
  %878 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %853)
  %879 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %854)
  %880 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %855)
  %881 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %856)
  %882 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %857)
  %883 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %867)
  %884 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %868)
  %885 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %869)
  %886 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %870)
  %887 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %871)
  %888 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %872)
  %889 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %873)
  %890 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %874)
  %891 = fmul float %823, %875
  %892 = fmul float %824, %876
  %893 = fmul float %825, %877
  %894 = fmul float %826, %878
  %895 = fmul float %827, %879
  %896 = fmul float %828, %880
  %897 = fmul float %829, %881
  %898 = fmul float %830, %882
  %899 = fmul float %831, %883
  %900 = fmul float %832, %884
  %901 = fmul float %833, %885
  %902 = fmul float %834, %886
  %903 = fmul float %835, %887
  %904 = fmul float %836, %888
  %905 = fmul float %837, %889
  %906 = fmul float %838, %890
  %907 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %891)
  %908 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %892)
  %909 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %893)
  %910 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %894)
  %911 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %895)
  %912 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %896)
  %913 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %897)
  %914 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %898)
  %915 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %899)
  %916 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %900)
  %917 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %901)
  %918 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %902)
  %919 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %903)
  %920 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %904)
  %921 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %905)
  %922 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %906)
  %923 = getelementptr bfloat, ptr addrspace(1) %10, i64 %14
  %924 = getelementptr bfloat, ptr addrspace(1) %923, i64 %51
  %925 = getelementptr bfloat, ptr addrspace(1) %923, i64 %53
  %926 = insertelement <2 x bfloat> undef, bfloat %907, i32 0
  %927 = insertelement <2 x bfloat> %926, bfloat %908, i32 1
  %928 = bitcast <2 x bfloat> %927 to i32
  %929 = insertelement <2 x bfloat> undef, bfloat %909, i32 0
  %930 = insertelement <2 x bfloat> %929, bfloat %910, i32 1
  %931 = bitcast <2 x bfloat> %930 to i32
  %932 = insertelement <2 x bfloat> undef, bfloat %911, i32 0
  %933 = insertelement <2 x bfloat> %932, bfloat %912, i32 1
  %934 = bitcast <2 x bfloat> %933 to i32
  %935 = insertelement <2 x bfloat> undef, bfloat %913, i32 0
  %936 = insertelement <2 x bfloat> %935, bfloat %914, i32 1
  %937 = bitcast <2 x bfloat> %936 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %928, i32 %931, i32 %934, i32 %937, ptr addrspace(1) %924)
  %938 = insertelement <2 x bfloat> undef, bfloat %915, i32 0
  %939 = insertelement <2 x bfloat> %938, bfloat %916, i32 1
  %940 = bitcast <2 x bfloat> %939 to i32
  %941 = insertelement <2 x bfloat> undef, bfloat %917, i32 0
  %942 = insertelement <2 x bfloat> %941, bfloat %918, i32 1
  %943 = bitcast <2 x bfloat> %942 to i32
  %944 = insertelement <2 x bfloat> undef, bfloat %919, i32 0
  %945 = insertelement <2 x bfloat> %944, bfloat %920, i32 1
  %946 = bitcast <2 x bfloat> %945 to i32
  %947 = insertelement <2 x bfloat> undef, bfloat %921, i32 0
  %948 = insertelement <2 x bfloat> %947, bfloat %922, i32 1
  %949 = bitcast <2 x bfloat> %948 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %940, i32 %943, i32 %946, i32 %949, ptr addrspace(1) %925)
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

declare ptx_kernel void @triton_softmax_10_0_impl(ptr, ptr, ptr, ptr) #7

define ptx_kernel void @triton_softmax_10_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) #8 {
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
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
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
  %21 = call float @fused_concatenate_convert_554_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !2
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !2
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_554_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !2
  %37 = load bfloat, ptr %27, align 2, !invariant.load !2
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_554_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !2
  %43 = load bfloat, ptr %17, align 2, !invariant.load !2
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_554_17(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_554_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
!3 = !{i32 0, i32 32768}
!4 = !{i32 0, i32 384}
!5 = !{i32 0, i32 64}
!6 = !{i32 0, i32 135456}

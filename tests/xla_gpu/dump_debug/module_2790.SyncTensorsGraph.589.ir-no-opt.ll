; ModuleID = 'SyncTensorsGraph.589'
source_filename = "SyncTensorsGraph.589"
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

define ptx_kernel void @wrapped_concatenate(ptr noalias align 16 dereferenceable(4194304) %0, ptr noalias align 16 dereferenceable(4194304) %1, ptr noalias align 16 dereferenceable(4194304) %2, ptr noalias align 16 dereferenceable(4194304) %3, ptr noalias align 16 dereferenceable(4194304) %4, ptr noalias align 16 dereferenceable(4194304) %5, ptr noalias align 128 dereferenceable(25165824) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %10 = udiv i32 %9, 4
  %11 = icmp ult i32 %10, 3072
  %12 = mul i32 %8, 4
  %13 = mul i32 %9, 512
  %14 = add i32 %12, %13
  br i1 %11, label %15, label %46

15:                                               ; preds = %7
  %16 = icmp ult i32 %10, 1024
  br i1 %16, label %17, label %20

17:                                               ; preds = %15
  %18 = getelementptr inbounds bfloat, ptr %0, i32 %14
  %19 = load bfloat, ptr %18, align 2, !invariant.load !3
  br label %43

20:                                               ; preds = %15
  %21 = icmp ult i32 %10, 2048
  br i1 %21, label %22, label %31

22:                                               ; preds = %20
  %23 = sub i32 %10, 1024
  %24 = urem i32 %9, 4
  %25 = mul i32 %24, 512
  %26 = add i32 %25, %12
  %27 = mul i32 %23, 2048
  %28 = add i32 %26, %27
  %29 = getelementptr inbounds bfloat, ptr %1, i32 %28
  %30 = load bfloat, ptr %29, align 2, !invariant.load !3
  br label %40

31:                                               ; preds = %20
  %32 = sub i32 %10, 2048
  %33 = urem i32 %9, 4
  %34 = mul i32 %33, 512
  %35 = add i32 %34, %12
  %36 = mul i32 %32, 2048
  %37 = add i32 %35, %36
  %38 = getelementptr inbounds bfloat, ptr %2, i32 %37
  %39 = load bfloat, ptr %38, align 2, !invariant.load !3
  br label %40

40:                                               ; preds = %22, %31
  %41 = phi bfloat [ %39, %31 ], [ %30, %22 ]
  br label %42

42:                                               ; preds = %40
  br label %43

43:                                               ; preds = %17, %42
  %44 = phi bfloat [ %41, %42 ], [ %19, %17 ]
  br label %45

45:                                               ; preds = %43
  br label %83

46:                                               ; preds = %7
  %47 = icmp ult i32 %10, 4096
  br i1 %47, label %48, label %57

48:                                               ; preds = %46
  %49 = sub i32 %10, 3072
  %50 = urem i32 %9, 4
  %51 = mul i32 %50, 512
  %52 = add i32 %51, %12
  %53 = mul i32 %49, 2048
  %54 = add i32 %52, %53
  %55 = getelementptr inbounds bfloat, ptr %3, i32 %54
  %56 = load bfloat, ptr %55, align 2, !invariant.load !3
  br label %80

57:                                               ; preds = %46
  %58 = icmp ult i32 %10, 5120
  br i1 %58, label %59, label %68

59:                                               ; preds = %57
  %60 = sub i32 %10, 4096
  %61 = urem i32 %9, 4
  %62 = mul i32 %61, 512
  %63 = add i32 %62, %12
  %64 = mul i32 %60, 2048
  %65 = add i32 %63, %64
  %66 = getelementptr inbounds bfloat, ptr %4, i32 %65
  %67 = load bfloat, ptr %66, align 2, !invariant.load !3
  br label %77

68:                                               ; preds = %57
  %69 = sub i32 %10, 5120
  %70 = urem i32 %9, 4
  %71 = mul i32 %70, 512
  %72 = add i32 %71, %12
  %73 = mul i32 %69, 2048
  %74 = add i32 %72, %73
  %75 = getelementptr inbounds bfloat, ptr %5, i32 %74
  %76 = load bfloat, ptr %75, align 2, !invariant.load !3
  br label %77

77:                                               ; preds = %59, %68
  %78 = phi bfloat [ %76, %68 ], [ %67, %59 ]
  br label %79

79:                                               ; preds = %77
  br label %80

80:                                               ; preds = %48, %79
  %81 = phi bfloat [ %78, %79 ], [ %56, %48 ]
  br label %82

82:                                               ; preds = %80
  br label %83

83:                                               ; preds = %45, %82
  %84 = phi bfloat [ %81, %82 ], [ %44, %45 ]
  br label %85

85:                                               ; preds = %83
  %86 = insertelement <4 x bfloat> zeroinitializer, bfloat %84, i64 0
  br i1 %11, label %87, label %121

87:                                               ; preds = %85
  %88 = icmp ult i32 %10, 1024
  br i1 %88, label %89, label %93

89:                                               ; preds = %87
  %90 = add i32 %14, 1
  %91 = getelementptr inbounds bfloat, ptr %0, i32 %90
  %92 = load bfloat, ptr %91, align 2, !invariant.load !3
  br label %118

93:                                               ; preds = %87
  %94 = icmp ult i32 %10, 2048
  br i1 %94, label %95, label %105

95:                                               ; preds = %93
  %96 = sub i32 %10, 1024
  %97 = urem i32 %9, 4
  %98 = mul i32 %97, 512
  %99 = add i32 %98, %12
  %100 = mul i32 %96, 2048
  %101 = add i32 %99, %100
  %102 = add i32 %101, 1
  %103 = getelementptr inbounds bfloat, ptr %1, i32 %102
  %104 = load bfloat, ptr %103, align 2, !invariant.load !3
  br label %115

105:                                              ; preds = %93
  %106 = sub i32 %10, 2048
  %107 = urem i32 %9, 4
  %108 = mul i32 %107, 512
  %109 = add i32 %108, %12
  %110 = mul i32 %106, 2048
  %111 = add i32 %109, %110
  %112 = add i32 %111, 1
  %113 = getelementptr inbounds bfloat, ptr %2, i32 %112
  %114 = load bfloat, ptr %113, align 2, !invariant.load !3
  br label %115

115:                                              ; preds = %95, %105
  %116 = phi bfloat [ %114, %105 ], [ %104, %95 ]
  br label %117

117:                                              ; preds = %115
  br label %118

118:                                              ; preds = %89, %117
  %119 = phi bfloat [ %116, %117 ], [ %92, %89 ]
  br label %120

120:                                              ; preds = %118
  br label %161

121:                                              ; preds = %85
  %122 = icmp ult i32 %10, 4096
  br i1 %122, label %123, label %133

123:                                              ; preds = %121
  %124 = sub i32 %10, 3072
  %125 = urem i32 %9, 4
  %126 = mul i32 %125, 512
  %127 = add i32 %126, %12
  %128 = mul i32 %124, 2048
  %129 = add i32 %127, %128
  %130 = add i32 %129, 1
  %131 = getelementptr inbounds bfloat, ptr %3, i32 %130
  %132 = load bfloat, ptr %131, align 2, !invariant.load !3
  br label %158

133:                                              ; preds = %121
  %134 = icmp ult i32 %10, 5120
  br i1 %134, label %135, label %145

135:                                              ; preds = %133
  %136 = sub i32 %10, 4096
  %137 = urem i32 %9, 4
  %138 = mul i32 %137, 512
  %139 = add i32 %138, %12
  %140 = mul i32 %136, 2048
  %141 = add i32 %139, %140
  %142 = add i32 %141, 1
  %143 = getelementptr inbounds bfloat, ptr %4, i32 %142
  %144 = load bfloat, ptr %143, align 2, !invariant.load !3
  br label %155

145:                                              ; preds = %133
  %146 = sub i32 %10, 5120
  %147 = urem i32 %9, 4
  %148 = mul i32 %147, 512
  %149 = add i32 %148, %12
  %150 = mul i32 %146, 2048
  %151 = add i32 %149, %150
  %152 = add i32 %151, 1
  %153 = getelementptr inbounds bfloat, ptr %5, i32 %152
  %154 = load bfloat, ptr %153, align 2, !invariant.load !3
  br label %155

155:                                              ; preds = %135, %145
  %156 = phi bfloat [ %154, %145 ], [ %144, %135 ]
  br label %157

157:                                              ; preds = %155
  br label %158

158:                                              ; preds = %123, %157
  %159 = phi bfloat [ %156, %157 ], [ %132, %123 ]
  br label %160

160:                                              ; preds = %158
  br label %161

161:                                              ; preds = %120, %160
  %162 = phi bfloat [ %159, %160 ], [ %119, %120 ]
  br label %163

163:                                              ; preds = %161
  %164 = insertelement <4 x bfloat> %86, bfloat %162, i64 1
  br i1 %11, label %165, label %199

165:                                              ; preds = %163
  %166 = icmp ult i32 %10, 1024
  br i1 %166, label %167, label %171

167:                                              ; preds = %165
  %168 = add i32 %14, 2
  %169 = getelementptr inbounds bfloat, ptr %0, i32 %168
  %170 = load bfloat, ptr %169, align 2, !invariant.load !3
  br label %196

171:                                              ; preds = %165
  %172 = icmp ult i32 %10, 2048
  br i1 %172, label %173, label %183

173:                                              ; preds = %171
  %174 = sub i32 %10, 1024
  %175 = urem i32 %9, 4
  %176 = mul i32 %175, 512
  %177 = add i32 %176, %12
  %178 = mul i32 %174, 2048
  %179 = add i32 %177, %178
  %180 = add i32 %179, 2
  %181 = getelementptr inbounds bfloat, ptr %1, i32 %180
  %182 = load bfloat, ptr %181, align 2, !invariant.load !3
  br label %193

183:                                              ; preds = %171
  %184 = sub i32 %10, 2048
  %185 = urem i32 %9, 4
  %186 = mul i32 %185, 512
  %187 = add i32 %186, %12
  %188 = mul i32 %184, 2048
  %189 = add i32 %187, %188
  %190 = add i32 %189, 2
  %191 = getelementptr inbounds bfloat, ptr %2, i32 %190
  %192 = load bfloat, ptr %191, align 2, !invariant.load !3
  br label %193

193:                                              ; preds = %173, %183
  %194 = phi bfloat [ %192, %183 ], [ %182, %173 ]
  br label %195

195:                                              ; preds = %193
  br label %196

196:                                              ; preds = %167, %195
  %197 = phi bfloat [ %194, %195 ], [ %170, %167 ]
  br label %198

198:                                              ; preds = %196
  br label %239

199:                                              ; preds = %163
  %200 = icmp ult i32 %10, 4096
  br i1 %200, label %201, label %211

201:                                              ; preds = %199
  %202 = sub i32 %10, 3072
  %203 = urem i32 %9, 4
  %204 = mul i32 %203, 512
  %205 = add i32 %204, %12
  %206 = mul i32 %202, 2048
  %207 = add i32 %205, %206
  %208 = add i32 %207, 2
  %209 = getelementptr inbounds bfloat, ptr %3, i32 %208
  %210 = load bfloat, ptr %209, align 2, !invariant.load !3
  br label %236

211:                                              ; preds = %199
  %212 = icmp ult i32 %10, 5120
  br i1 %212, label %213, label %223

213:                                              ; preds = %211
  %214 = sub i32 %10, 4096
  %215 = urem i32 %9, 4
  %216 = mul i32 %215, 512
  %217 = add i32 %216, %12
  %218 = mul i32 %214, 2048
  %219 = add i32 %217, %218
  %220 = add i32 %219, 2
  %221 = getelementptr inbounds bfloat, ptr %4, i32 %220
  %222 = load bfloat, ptr %221, align 2, !invariant.load !3
  br label %233

223:                                              ; preds = %211
  %224 = sub i32 %10, 5120
  %225 = urem i32 %9, 4
  %226 = mul i32 %225, 512
  %227 = add i32 %226, %12
  %228 = mul i32 %224, 2048
  %229 = add i32 %227, %228
  %230 = add i32 %229, 2
  %231 = getelementptr inbounds bfloat, ptr %5, i32 %230
  %232 = load bfloat, ptr %231, align 2, !invariant.load !3
  br label %233

233:                                              ; preds = %213, %223
  %234 = phi bfloat [ %232, %223 ], [ %222, %213 ]
  br label %235

235:                                              ; preds = %233
  br label %236

236:                                              ; preds = %201, %235
  %237 = phi bfloat [ %234, %235 ], [ %210, %201 ]
  br label %238

238:                                              ; preds = %236
  br label %239

239:                                              ; preds = %198, %238
  %240 = phi bfloat [ %237, %238 ], [ %197, %198 ]
  br label %241

241:                                              ; preds = %239
  %242 = insertelement <4 x bfloat> %164, bfloat %240, i64 2
  br i1 %11, label %243, label %277

243:                                              ; preds = %241
  %244 = icmp ult i32 %10, 1024
  br i1 %244, label %245, label %249

245:                                              ; preds = %243
  %246 = add i32 %14, 3
  %247 = getelementptr inbounds bfloat, ptr %0, i32 %246
  %248 = load bfloat, ptr %247, align 2, !invariant.load !3
  br label %274

249:                                              ; preds = %243
  %250 = icmp ult i32 %10, 2048
  br i1 %250, label %251, label %261

251:                                              ; preds = %249
  %252 = sub i32 %10, 1024
  %253 = urem i32 %9, 4
  %254 = mul i32 %253, 512
  %255 = add i32 %254, %12
  %256 = mul i32 %252, 2048
  %257 = add i32 %255, %256
  %258 = add i32 %257, 3
  %259 = getelementptr inbounds bfloat, ptr %1, i32 %258
  %260 = load bfloat, ptr %259, align 2, !invariant.load !3
  br label %271

261:                                              ; preds = %249
  %262 = sub i32 %10, 2048
  %263 = urem i32 %9, 4
  %264 = mul i32 %263, 512
  %265 = add i32 %264, %12
  %266 = mul i32 %262, 2048
  %267 = add i32 %265, %266
  %268 = add i32 %267, 3
  %269 = getelementptr inbounds bfloat, ptr %2, i32 %268
  %270 = load bfloat, ptr %269, align 2, !invariant.load !3
  br label %271

271:                                              ; preds = %251, %261
  %272 = phi bfloat [ %270, %261 ], [ %260, %251 ]
  br label %273

273:                                              ; preds = %271
  br label %274

274:                                              ; preds = %245, %273
  %275 = phi bfloat [ %272, %273 ], [ %248, %245 ]
  br label %276

276:                                              ; preds = %274
  br label %317

277:                                              ; preds = %241
  %278 = icmp ult i32 %10, 4096
  br i1 %278, label %279, label %289

279:                                              ; preds = %277
  %280 = sub i32 %10, 3072
  %281 = urem i32 %9, 4
  %282 = mul i32 %281, 512
  %283 = add i32 %282, %12
  %284 = mul i32 %280, 2048
  %285 = add i32 %283, %284
  %286 = add i32 %285, 3
  %287 = getelementptr inbounds bfloat, ptr %3, i32 %286
  %288 = load bfloat, ptr %287, align 2, !invariant.load !3
  br label %314

289:                                              ; preds = %277
  %290 = icmp ult i32 %10, 5120
  br i1 %290, label %291, label %301

291:                                              ; preds = %289
  %292 = sub i32 %10, 4096
  %293 = urem i32 %9, 4
  %294 = mul i32 %293, 512
  %295 = add i32 %294, %12
  %296 = mul i32 %292, 2048
  %297 = add i32 %295, %296
  %298 = add i32 %297, 3
  %299 = getelementptr inbounds bfloat, ptr %4, i32 %298
  %300 = load bfloat, ptr %299, align 2, !invariant.load !3
  br label %311

301:                                              ; preds = %289
  %302 = sub i32 %10, 5120
  %303 = urem i32 %9, 4
  %304 = mul i32 %303, 512
  %305 = add i32 %304, %12
  %306 = mul i32 %302, 2048
  %307 = add i32 %305, %306
  %308 = add i32 %307, 3
  %309 = getelementptr inbounds bfloat, ptr %5, i32 %308
  %310 = load bfloat, ptr %309, align 2, !invariant.load !3
  br label %311

311:                                              ; preds = %291, %301
  %312 = phi bfloat [ %310, %301 ], [ %300, %291 ]
  br label %313

313:                                              ; preds = %311
  br label %314

314:                                              ; preds = %279, %313
  %315 = phi bfloat [ %312, %313 ], [ %288, %279 ]
  br label %316

316:                                              ; preds = %314
  br label %317

317:                                              ; preds = %276, %316
  %318 = phi bfloat [ %315, %316 ], [ %275, %276 ]
  br label %319

319:                                              ; preds = %317
  %320 = insertelement <4 x bfloat> %242, bfloat %318, i64 3
  %321 = getelementptr inbounds bfloat, ptr %6, i32 %14
  store <4 x bfloat> %320, ptr %321, align 8
  ret void
}

declare ptx_kernel void @gemm_fusion_dot_23_0_impl(ptr, ptr, ptr) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_23_0(ptr noalias align 128 dereferenceable(25165824) %arg0, ptr noalias align 128 dereferenceable(786432) %arg1) #0 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr null to ptr addrspace(1)
  %4 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %5 = sdiv i32 %4, 1536
  %6 = mul i32 %5, 8
  %7 = sub i32 1, %6
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 %7, i32 8
  %10 = srem i32 %4, %9
  %11 = add i32 %6, %10
  %12 = srem i32 %4, 1536
  %13 = sdiv i32 %12, %9
  %14 = mul i32 %13, 32
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
  %30 = xor i32 %29, 0
  %31 = add i32 %30, 0
  %32 = sext i32 %31 to i64
  %33 = udiv i32 %16, 32
  %34 = and i32 %17, 8
  %35 = icmp eq i32 %34, 0
  %36 = select i1 %35, i32 0, i32 1
  %37 = xor i32 0, %36
  %38 = and i32 %17, 16
  %39 = icmp eq i32 %38, 0
  %40 = select i1 %39, i32 0, i32 2
  %41 = xor i32 %37, %40
  %42 = and i32 %33, 1
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, i32 0, i32 4
  %45 = xor i32 %41, %44
  %46 = and i32 %33, 2
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %47, i32 0, i32 8
  %49 = xor i32 %45, %48
  %50 = xor i32 %49, 0
  %51 = xor i32 %49, 16
  %52 = add i32 %50, 0
  %53 = add i32 %51, 0
  %54 = sext i32 %52 to i64
  %55 = sext i32 %53 to i64
  %56 = add i64 %15, %54
  %57 = add i64 %15, %55
  %58 = mul i64 %56, 2048
  %59 = mul i64 %57, 2048
  %60 = add i64 %32, %58
  %61 = add i64 %32, %59
  %62 = getelementptr bfloat, ptr addrspace(1) %1, i64 %60
  %63 = getelementptr bfloat, ptr addrspace(1) %1, i64 %61
  %64 = select i1 %35, i32 0, i32 72
  %65 = xor i32 %29, %64
  %66 = select i1 %39, i32 0, i32 144
  %67 = xor i32 %65, %66
  %68 = select i1 %43, i32 0, i32 288
  %69 = xor i32 %67, %68
  %70 = select i1 %47, i32 0, i32 512
  %71 = xor i32 %69, %70
  %72 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %71
  %73 = xor i32 1024, %20
  %74 = xor i32 %73, %24
  %75 = xor i32 %74, %28
  %76 = xor i32 %75, %64
  %77 = xor i32 %76, %66
  %78 = xor i32 %77, %68
  %79 = xor i32 %78, %70
  %80 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %79
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %72, ptr addrspace(1) %62, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %80, ptr addrspace(1) %63, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %81 = add i64 %32, 64
  %82 = add i64 %81, %58
  %83 = add i64 %81, %59
  %84 = getelementptr bfloat, ptr addrspace(1) %1, i64 %82
  %85 = getelementptr bfloat, ptr addrspace(1) %1, i64 %83
  call void @llvm.nvvm.barrier0()
  %86 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 4096), i32 %71
  %87 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 4096), i32 %79
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %86, ptr addrspace(1) %84, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %87, ptr addrspace(1) %85, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %88 = add i64 %32, 128
  %89 = add i64 %88, %58
  %90 = add i64 %88, %59
  %91 = getelementptr bfloat, ptr addrspace(1) %1, i64 %89
  %92 = getelementptr bfloat, ptr addrspace(1) %1, i64 %90
  call void @llvm.nvvm.barrier0()
  %93 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %71
  %94 = getelementptr inbounds bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 8192), i32 %79
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %93, ptr addrspace(1) %91, i32 16)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %94, ptr addrspace(1) %92, i32 16)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  br label %95

95:                                               ; preds = %103, %0
  %96 = phi i32 [ %400, %103 ], [ 0, %0 ]
  %97 = phi i64 [ %372, %103 ], [ 128, %0 ]
  %98 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ %371, %103 ], [ zeroinitializer, %0 ]
  %99 = phi i32 [ %375, %103 ], [ 2, %0 ]
  %100 = phi i32 [ %391, %103 ], [ 0, %0 ]
  %101 = phi { ptr addrspace(3), i32, i32 } [ %399, %103 ], [ { ptr addrspace(3) @global_smem, i32 0, i32 0 }, %0 ]
  %102 = icmp slt i32 %96, 2048
  br i1 %102, label %103, label %401

103:                                              ; preds = %95
  %104 = icmp slt i32 %96, 1856
  %105 = extractvalue { ptr addrspace(3), i32, i32 } %101, 0
  %106 = select i1 %19, i32 0, i32 72
  %107 = xor i32 0, %106
  %108 = select i1 %23, i32 0, i32 144
  %109 = xor i32 %107, %108
  %110 = select i1 %27, i32 0, i32 288
  %111 = xor i32 %109, %110
  %112 = select i1 %35, i32 0, i32 8
  %113 = xor i32 %111, %112
  %114 = select i1 %39, i32 0, i32 16
  %115 = xor i32 %113, %114
  %116 = select i1 %43, i32 0, i32 512
  %117 = xor i32 %115, %116
  %118 = getelementptr inbounds bfloat, ptr addrspace(3) %105, i32 %117
  %119 = ptrtoint ptr addrspace(3) %118 to i32
  %120 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %119)
  %121 = extractvalue { i32, i32, i32, i32 } %120, 0
  %122 = extractvalue { i32, i32, i32, i32 } %120, 1
  %123 = extractvalue { i32, i32, i32, i32 } %120, 2
  %124 = extractvalue { i32, i32, i32, i32 } %120, 3
  %125 = xor i32 32, %106
  %126 = xor i32 %125, %108
  %127 = xor i32 %126, %110
  %128 = xor i32 %127, %112
  %129 = xor i32 %128, %114
  %130 = xor i32 %129, %116
  %131 = getelementptr inbounds bfloat, ptr addrspace(3) %105, i32 %130
  %132 = ptrtoint ptr addrspace(3) %131 to i32
  %133 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %132)
  %134 = extractvalue { i32, i32, i32, i32 } %133, 0
  %135 = extractvalue { i32, i32, i32, i32 } %133, 1
  %136 = extractvalue { i32, i32, i32, i32 } %133, 2
  %137 = extractvalue { i32, i32, i32, i32 } %133, 3
  %138 = xor i32 1024, %106
  %139 = xor i32 %138, %108
  %140 = xor i32 %139, %110
  %141 = xor i32 %140, %112
  %142 = xor i32 %141, %114
  %143 = xor i32 %142, %116
  %144 = getelementptr inbounds bfloat, ptr addrspace(3) %105, i32 %143
  %145 = ptrtoint ptr addrspace(3) %144 to i32
  %146 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %145)
  %147 = extractvalue { i32, i32, i32, i32 } %146, 0
  %148 = extractvalue { i32, i32, i32, i32 } %146, 1
  %149 = extractvalue { i32, i32, i32, i32 } %146, 2
  %150 = extractvalue { i32, i32, i32, i32 } %146, 3
  %151 = xor i32 1056, %106
  %152 = xor i32 %151, %108
  %153 = xor i32 %152, %110
  %154 = xor i32 %153, %112
  %155 = xor i32 %154, %114
  %156 = xor i32 %155, %116
  %157 = getelementptr inbounds bfloat, ptr addrspace(3) %105, i32 %156
  %158 = ptrtoint ptr addrspace(3) %157 to i32
  %159 = call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %158)
  %160 = extractvalue { i32, i32, i32, i32 } %159, 0
  %161 = extractvalue { i32, i32, i32, i32 } %159, 1
  %162 = extractvalue { i32, i32, i32, i32 } %159, 2
  %163 = extractvalue { i32, i32, i32, i32 } %159, 3
  %164 = bitcast i32 %121 to <2 x bfloat>
  %165 = extractelement <2 x bfloat> %164, i32 0
  %166 = extractelement <2 x bfloat> %164, i32 1
  %167 = bitcast i32 %122 to <2 x bfloat>
  %168 = extractelement <2 x bfloat> %167, i32 0
  %169 = extractelement <2 x bfloat> %167, i32 1
  %170 = bitcast i32 %123 to <2 x bfloat>
  %171 = extractelement <2 x bfloat> %170, i32 0
  %172 = extractelement <2 x bfloat> %170, i32 1
  %173 = bitcast i32 %124 to <2 x bfloat>
  %174 = extractelement <2 x bfloat> %173, i32 0
  %175 = extractelement <2 x bfloat> %173, i32 1
  %176 = bitcast i32 %134 to <2 x bfloat>
  %177 = extractelement <2 x bfloat> %176, i32 0
  %178 = extractelement <2 x bfloat> %176, i32 1
  %179 = bitcast i32 %135 to <2 x bfloat>
  %180 = extractelement <2 x bfloat> %179, i32 0
  %181 = extractelement <2 x bfloat> %179, i32 1
  %182 = bitcast i32 %136 to <2 x bfloat>
  %183 = extractelement <2 x bfloat> %182, i32 0
  %184 = extractelement <2 x bfloat> %182, i32 1
  %185 = bitcast i32 %137 to <2 x bfloat>
  %186 = extractelement <2 x bfloat> %185, i32 0
  %187 = extractelement <2 x bfloat> %185, i32 1
  %188 = bitcast i32 %147 to <2 x bfloat>
  %189 = extractelement <2 x bfloat> %188, i32 0
  %190 = extractelement <2 x bfloat> %188, i32 1
  %191 = bitcast i32 %148 to <2 x bfloat>
  %192 = extractelement <2 x bfloat> %191, i32 0
  %193 = extractelement <2 x bfloat> %191, i32 1
  %194 = bitcast i32 %149 to <2 x bfloat>
  %195 = extractelement <2 x bfloat> %194, i32 0
  %196 = extractelement <2 x bfloat> %194, i32 1
  %197 = bitcast i32 %150 to <2 x bfloat>
  %198 = extractelement <2 x bfloat> %197, i32 0
  %199 = extractelement <2 x bfloat> %197, i32 1
  %200 = bitcast i32 %160 to <2 x bfloat>
  %201 = extractelement <2 x bfloat> %200, i32 0
  %202 = extractelement <2 x bfloat> %200, i32 1
  %203 = bitcast i32 %161 to <2 x bfloat>
  %204 = extractelement <2 x bfloat> %203, i32 0
  %205 = extractelement <2 x bfloat> %203, i32 1
  %206 = bitcast i32 %162 to <2 x bfloat>
  %207 = extractelement <2 x bfloat> %206, i32 0
  %208 = extractelement <2 x bfloat> %206, i32 1
  %209 = bitcast i32 %163 to <2 x bfloat>
  %210 = extractelement <2 x bfloat> %209, i32 0
  %211 = extractelement <2 x bfloat> %209, i32 1
  %212 = insertelement <2 x bfloat> undef, bfloat %165, i32 0
  %213 = insertelement <2 x bfloat> %212, bfloat %166, i32 1
  %214 = bitcast <2 x bfloat> %213 to i32
  %215 = insertelement <2 x bfloat> undef, bfloat %168, i32 0
  %216 = insertelement <2 x bfloat> %215, bfloat %169, i32 1
  %217 = bitcast <2 x bfloat> %216 to i32
  %218 = insertelement <2 x bfloat> undef, bfloat %171, i32 0
  %219 = insertelement <2 x bfloat> %218, bfloat %172, i32 1
  %220 = bitcast <2 x bfloat> %219 to i32
  %221 = insertelement <2 x bfloat> undef, bfloat %174, i32 0
  %222 = insertelement <2 x bfloat> %221, bfloat %175, i32 1
  %223 = bitcast <2 x bfloat> %222 to i32
  %224 = insertelement <2 x bfloat> undef, bfloat %177, i32 0
  %225 = insertelement <2 x bfloat> %224, bfloat %178, i32 1
  %226 = bitcast <2 x bfloat> %225 to i32
  %227 = insertelement <2 x bfloat> undef, bfloat %180, i32 0
  %228 = insertelement <2 x bfloat> %227, bfloat %181, i32 1
  %229 = bitcast <2 x bfloat> %228 to i32
  %230 = insertelement <2 x bfloat> undef, bfloat %183, i32 0
  %231 = insertelement <2 x bfloat> %230, bfloat %184, i32 1
  %232 = bitcast <2 x bfloat> %231 to i32
  %233 = insertelement <2 x bfloat> undef, bfloat %186, i32 0
  %234 = insertelement <2 x bfloat> %233, bfloat %187, i32 1
  %235 = bitcast <2 x bfloat> %234 to i32
  %236 = insertelement <2 x bfloat> undef, bfloat %189, i32 0
  %237 = insertelement <2 x bfloat> %236, bfloat %190, i32 1
  %238 = bitcast <2 x bfloat> %237 to i32
  %239 = insertelement <2 x bfloat> undef, bfloat %192, i32 0
  %240 = insertelement <2 x bfloat> %239, bfloat %193, i32 1
  %241 = bitcast <2 x bfloat> %240 to i32
  %242 = insertelement <2 x bfloat> undef, bfloat %195, i32 0
  %243 = insertelement <2 x bfloat> %242, bfloat %196, i32 1
  %244 = bitcast <2 x bfloat> %243 to i32
  %245 = insertelement <2 x bfloat> undef, bfloat %198, i32 0
  %246 = insertelement <2 x bfloat> %245, bfloat %199, i32 1
  %247 = bitcast <2 x bfloat> %246 to i32
  %248 = insertelement <2 x bfloat> undef, bfloat %201, i32 0
  %249 = insertelement <2 x bfloat> %248, bfloat %202, i32 1
  %250 = bitcast <2 x bfloat> %249 to i32
  %251 = insertelement <2 x bfloat> undef, bfloat %204, i32 0
  %252 = insertelement <2 x bfloat> %251, bfloat %205, i32 1
  %253 = bitcast <2 x bfloat> %252 to i32
  %254 = insertelement <2 x bfloat> undef, bfloat %207, i32 0
  %255 = insertelement <2 x bfloat> %254, bfloat %208, i32 1
  %256 = bitcast <2 x bfloat> %255 to i32
  %257 = insertelement <2 x bfloat> undef, bfloat %210, i32 0
  %258 = insertelement <2 x bfloat> %257, bfloat %211, i32 1
  %259 = bitcast <2 x bfloat> %258 to i32
  %260 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 0
  %261 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 1
  %262 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 2
  %263 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 3
  %264 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 4
  %265 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 5
  %266 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 6
  %267 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 7
  %268 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 8
  %269 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 9
  %270 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 10
  %271 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 11
  %272 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 12
  %273 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 13
  %274 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 14
  %275 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 15
  %276 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %260, float %261, float %262, float %263, i32 0, i32 0, i32 0, i32 0, i32 %214, i32 %217)
  %277 = extractvalue { float, float, float, float } %276, 0
  %278 = extractvalue { float, float, float, float } %276, 1
  %279 = extractvalue { float, float, float, float } %276, 2
  %280 = extractvalue { float, float, float, float } %276, 3
  %281 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %264, float %265, float %266, float %267, i32 0, i32 0, i32 0, i32 0, i32 %238, i32 %241)
  %282 = extractvalue { float, float, float, float } %281, 0
  %283 = extractvalue { float, float, float, float } %281, 1
  %284 = extractvalue { float, float, float, float } %281, 2
  %285 = extractvalue { float, float, float, float } %281, 3
  %286 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %268, float %269, float %270, float %271, i32 0, i32 0, i32 0, i32 0, i32 %214, i32 %217)
  %287 = extractvalue { float, float, float, float } %286, 0
  %288 = extractvalue { float, float, float, float } %286, 1
  %289 = extractvalue { float, float, float, float } %286, 2
  %290 = extractvalue { float, float, float, float } %286, 3
  %291 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %272, float %273, float %274, float %275, i32 0, i32 0, i32 0, i32 0, i32 %238, i32 %241)
  %292 = extractvalue { float, float, float, float } %291, 0
  %293 = extractvalue { float, float, float, float } %291, 1
  %294 = extractvalue { float, float, float, float } %291, 2
  %295 = extractvalue { float, float, float, float } %291, 3
  %296 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %277, float %278, float %279, float %280, i32 0, i32 0, i32 0, i32 0, i32 %220, i32 %223)
  %297 = extractvalue { float, float, float, float } %296, 0
  %298 = extractvalue { float, float, float, float } %296, 1
  %299 = extractvalue { float, float, float, float } %296, 2
  %300 = extractvalue { float, float, float, float } %296, 3
  %301 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %282, float %283, float %284, float %285, i32 0, i32 0, i32 0, i32 0, i32 %244, i32 %247)
  %302 = extractvalue { float, float, float, float } %301, 0
  %303 = extractvalue { float, float, float, float } %301, 1
  %304 = extractvalue { float, float, float, float } %301, 2
  %305 = extractvalue { float, float, float, float } %301, 3
  %306 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %287, float %288, float %289, float %290, i32 0, i32 0, i32 0, i32 0, i32 %220, i32 %223)
  %307 = extractvalue { float, float, float, float } %306, 0
  %308 = extractvalue { float, float, float, float } %306, 1
  %309 = extractvalue { float, float, float, float } %306, 2
  %310 = extractvalue { float, float, float, float } %306, 3
  %311 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %292, float %293, float %294, float %295, i32 0, i32 0, i32 0, i32 0, i32 %244, i32 %247)
  %312 = extractvalue { float, float, float, float } %311, 0
  %313 = extractvalue { float, float, float, float } %311, 1
  %314 = extractvalue { float, float, float, float } %311, 2
  %315 = extractvalue { float, float, float, float } %311, 3
  %316 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %297, float %298, float %299, float %300, i32 0, i32 0, i32 0, i32 0, i32 %226, i32 %229)
  %317 = extractvalue { float, float, float, float } %316, 0
  %318 = extractvalue { float, float, float, float } %316, 1
  %319 = extractvalue { float, float, float, float } %316, 2
  %320 = extractvalue { float, float, float, float } %316, 3
  %321 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %302, float %303, float %304, float %305, i32 0, i32 0, i32 0, i32 0, i32 %250, i32 %253)
  %322 = extractvalue { float, float, float, float } %321, 0
  %323 = extractvalue { float, float, float, float } %321, 1
  %324 = extractvalue { float, float, float, float } %321, 2
  %325 = extractvalue { float, float, float, float } %321, 3
  %326 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %307, float %308, float %309, float %310, i32 0, i32 0, i32 0, i32 0, i32 %226, i32 %229)
  %327 = extractvalue { float, float, float, float } %326, 0
  %328 = extractvalue { float, float, float, float } %326, 1
  %329 = extractvalue { float, float, float, float } %326, 2
  %330 = extractvalue { float, float, float, float } %326, 3
  %331 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %312, float %313, float %314, float %315, i32 0, i32 0, i32 0, i32 0, i32 %250, i32 %253)
  %332 = extractvalue { float, float, float, float } %331, 0
  %333 = extractvalue { float, float, float, float } %331, 1
  %334 = extractvalue { float, float, float, float } %331, 2
  %335 = extractvalue { float, float, float, float } %331, 3
  %336 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %317, float %318, float %319, float %320, i32 0, i32 0, i32 0, i32 0, i32 %232, i32 %235)
  %337 = extractvalue { float, float, float, float } %336, 0
  %338 = extractvalue { float, float, float, float } %336, 1
  %339 = extractvalue { float, float, float, float } %336, 2
  %340 = extractvalue { float, float, float, float } %336, 3
  %341 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %322, float %323, float %324, float %325, i32 0, i32 0, i32 0, i32 0, i32 %256, i32 %259)
  %342 = extractvalue { float, float, float, float } %341, 0
  %343 = extractvalue { float, float, float, float } %341, 1
  %344 = extractvalue { float, float, float, float } %341, 2
  %345 = extractvalue { float, float, float, float } %341, 3
  %346 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %327, float %328, float %329, float %330, i32 0, i32 0, i32 0, i32 0, i32 %232, i32 %235)
  %347 = extractvalue { float, float, float, float } %346, 0
  %348 = extractvalue { float, float, float, float } %346, 1
  %349 = extractvalue { float, float, float, float } %346, 2
  %350 = extractvalue { float, float, float, float } %346, 3
  %351 = call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %332, float %333, float %334, float %335, i32 0, i32 0, i32 0, i32 0, i32 %256, i32 %259)
  %352 = extractvalue { float, float, float, float } %351, 0
  %353 = extractvalue { float, float, float, float } %351, 1
  %354 = extractvalue { float, float, float, float } %351, 2
  %355 = extractvalue { float, float, float, float } %351, 3
  %356 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %337, 0
  %357 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %356, float %338, 1
  %358 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %357, float %339, 2
  %359 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %358, float %340, 3
  %360 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %359, float %342, 4
  %361 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %360, float %343, 5
  %362 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %361, float %344, 6
  %363 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %362, float %345, 7
  %364 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %363, float %347, 8
  %365 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %364, float %348, 9
  %366 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %365, float %349, 10
  %367 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %366, float %350, 11
  %368 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %367, float %352, 12
  %369 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %368, float %353, 13
  %370 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %369, float %354, 14
  %371 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %370, float %355, 15
  %372 = add i64 %97, 64
  %373 = add i32 %99, 1
  %374 = icmp slt i32 %373, 3
  %375 = select i1 %374, i32 %373, i32 0
  %376 = add i64 %372, %32
  %377 = add i64 %376, %58
  %378 = add i64 %376, %59
  %379 = getelementptr bfloat, ptr addrspace(1) %1, i64 %377
  %380 = getelementptr bfloat, ptr addrspace(1) %1, i64 %378
  %381 = mul i32 %375, 2048
  %382 = add i32 %381, 0
  %383 = add i32 %382, 0
  %384 = add i32 %383, 0
  %385 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %384
  call void @llvm.nvvm.barrier0()
  %386 = getelementptr inbounds bfloat, ptr addrspace(3) %385, i32 %71
  %387 = getelementptr inbounds bfloat, ptr addrspace(3) %385, i32 %79
  %388 = select i1 %104, i32 16, i32 0
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %386, ptr addrspace(1) %379, i32 %388)
  call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %387, ptr addrspace(1) %380, i32 %388)
  call void asm sideeffect "cp.async.commit_group ;", ""()
  %389 = add i32 %100, 1
  %390 = icmp slt i32 %389, 3
  %391 = select i1 %390, i32 %389, i32 0
  call void asm sideeffect "cp.async.wait_group 0x2;", ""()
  call void @llvm.nvvm.barrier0()
  %392 = mul i32 %391, 2048
  %393 = add i32 %392, 0
  %394 = add i32 %393, 0
  %395 = add i32 %394, 0
  %396 = getelementptr bfloat, ptr addrspace(3) @global_smem, i32 %395
  %397 = insertvalue { ptr addrspace(3), i32, i32 } undef, ptr addrspace(3) %396, 0
  %398 = insertvalue { ptr addrspace(3), i32, i32 } %397, i32 0, 1
  %399 = insertvalue { ptr addrspace(3), i32, i32 } %398, i32 0, 2
  %400 = add i32 %96, 64
  br label %95

401:                                              ; preds = %95
  call void asm sideeffect "cp.async.wait_group 0x0;", ""()
  call void @llvm.nvvm.barrier0()
  %402 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 0
  %403 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 1
  %404 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 2
  %405 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 3
  %406 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 4
  %407 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 5
  %408 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 6
  %409 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 7
  %410 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 8
  %411 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 9
  %412 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 10
  %413 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 11
  %414 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 12
  %415 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 13
  %416 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 14
  %417 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %98, 15
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
  %434 = mul i32 %11, 64
  %435 = sext i32 %434 to i64
  %436 = select i1 %27, i32 0, i32 1
  %437 = xor i32 0, %436
  %438 = select i1 %35, i32 0, i32 2
  %439 = xor i32 %437, %438
  %440 = select i1 %39, i32 0, i32 4
  %441 = xor i32 %439, %440
  %442 = select i1 %43, i32 0, i32 8
  %443 = xor i32 %441, %442
  %444 = select i1 %47, i32 0, i32 16
  %445 = xor i32 %443, %444
  %446 = xor i32 %445, 0
  %447 = xor i32 %445, 32
  %448 = add i32 %446, 0
  %449 = add i32 %447, 0
  %450 = sext i32 %448 to i64
  %451 = sext i32 %449 to i64
  %452 = add i64 %435, %450
  %453 = add i64 %435, %451
  %454 = mul i64 %452, 6144
  %455 = mul i64 %453, 6144
  %456 = xor i32 %25, 0
  %457 = add i32 %456, 0
  %458 = sext i32 %457 to i64
  %459 = add i64 %15, %458
  %460 = add i64 %454, %459
  %461 = add i64 %455, %459
  %462 = getelementptr bfloat, ptr addrspace(1) %2, i64 %460
  %463 = getelementptr bfloat, ptr addrspace(1) %2, i64 %461
  %464 = select i1 %19, i32 0, i32 2
  %465 = xor i32 0, %464
  %466 = select i1 %23, i32 0, i32 4
  %467 = xor i32 %465, %466
  %468 = xor i32 %467, %28
  %469 = select i1 %35, i32 0, i32 64
  %470 = xor i32 %468, %469
  %471 = select i1 %39, i32 0, i32 128
  %472 = xor i32 %470, %471
  %473 = xor i32 %472, %442
  %474 = xor i32 %473, %70
  %475 = xor i32 %29, %469
  %476 = xor i32 %475, %471
  %477 = select i1 %43, i32 0, i32 256
  %478 = xor i32 %476, %477
  %479 = xor i32 %478, %70
  %480 = xor i32 %474, 0
  %481 = lshr i32 %480, 5
  %482 = shl i32 %481, 3
  %483 = add i32 %482, %480
  %484 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %483
  %485 = insertelement <2 x bfloat> undef, bfloat %418, i32 0
  %486 = insertelement <2 x bfloat> %485, bfloat %419, i32 1
  %487 = extractelement <2 x bfloat> %486, i32 0
  %488 = extractelement <2 x bfloat> %486, i32 1
  %489 = bitcast bfloat %487 to i16
  %490 = bitcast bfloat %488 to i16
  %491 = insertelement <2 x i16> undef, i16 %489, i32 0
  %492 = insertelement <2 x i16> %491, i16 %490, i32 1
  %493 = extractelement <2 x i16> %492, i32 0
  %494 = extractelement <2 x i16> %492, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %484, i16 %493, i16 %494, i1 true)
  %495 = xor i32 %474, 256
  %496 = lshr i32 %495, 5
  %497 = shl i32 %496, 3
  %498 = add i32 %497, %495
  %499 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %498
  %500 = insertelement <2 x bfloat> undef, bfloat %420, i32 0
  %501 = insertelement <2 x bfloat> %500, bfloat %421, i32 1
  %502 = extractelement <2 x bfloat> %501, i32 0
  %503 = extractelement <2 x bfloat> %501, i32 1
  %504 = bitcast bfloat %502 to i16
  %505 = bitcast bfloat %503 to i16
  %506 = insertelement <2 x i16> undef, i16 %504, i32 0
  %507 = insertelement <2 x i16> %506, i16 %505, i32 1
  %508 = extractelement <2 x i16> %507, i32 0
  %509 = extractelement <2 x i16> %507, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %499, i16 %508, i16 %509, i1 true)
  %510 = xor i32 %474, 16
  %511 = lshr i32 %510, 5
  %512 = shl i32 %511, 3
  %513 = add i32 %512, %510
  %514 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %513
  %515 = insertelement <2 x bfloat> undef, bfloat %422, i32 0
  %516 = insertelement <2 x bfloat> %515, bfloat %423, i32 1
  %517 = extractelement <2 x bfloat> %516, i32 0
  %518 = extractelement <2 x bfloat> %516, i32 1
  %519 = bitcast bfloat %517 to i16
  %520 = bitcast bfloat %518 to i16
  %521 = insertelement <2 x i16> undef, i16 %519, i32 0
  %522 = insertelement <2 x i16> %521, i16 %520, i32 1
  %523 = extractelement <2 x i16> %522, i32 0
  %524 = extractelement <2 x i16> %522, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %514, i16 %523, i16 %524, i1 true)
  %525 = xor i32 %474, 272
  %526 = lshr i32 %525, 5
  %527 = shl i32 %526, 3
  %528 = add i32 %527, %525
  %529 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %528
  %530 = insertelement <2 x bfloat> undef, bfloat %424, i32 0
  %531 = insertelement <2 x bfloat> %530, bfloat %425, i32 1
  %532 = extractelement <2 x bfloat> %531, i32 0
  %533 = extractelement <2 x bfloat> %531, i32 1
  %534 = bitcast bfloat %532 to i16
  %535 = bitcast bfloat %533 to i16
  %536 = insertelement <2 x i16> undef, i16 %534, i32 0
  %537 = insertelement <2 x i16> %536, i16 %535, i32 1
  %538 = extractelement <2 x i16> %537, i32 0
  %539 = extractelement <2 x i16> %537, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %529, i16 %538, i16 %539, i1 true)
  call void @llvm.nvvm.barrier0()
  %540 = xor i32 %479, 0
  %541 = lshr i32 %540, 5
  %542 = shl i32 %541, 3
  %543 = add i32 %542, %540
  %544 = getelementptr inbounds bfloat, ptr addrspace(3) @global_smem, i32 %543
  %545 = load <4 x i32>, ptr addrspace(3) %544, align 16
  %546 = extractelement <4 x i32> %545, i32 0
  %547 = extractelement <4 x i32> %545, i32 1
  %548 = extractelement <4 x i32> %545, i32 2
  %549 = extractelement <4 x i32> %545, i32 3
  %550 = insertelement <4 x i32> undef, i32 %546, i32 0
  %551 = insertelement <4 x i32> %550, i32 %547, i32 1
  %552 = insertelement <4 x i32> %551, i32 %548, i32 2
  %553 = insertelement <4 x i32> %552, i32 %549, i32 3
  %554 = extractelement <4 x i32> %553, i32 0
  %555 = extractelement <4 x i32> %553, i32 1
  %556 = extractelement <4 x i32> %553, i32 2
  %557 = extractelement <4 x i32> %553, i32 3
  %558 = bitcast i32 %554 to <2 x i16>
  %559 = extractelement <2 x i16> %558, i32 0
  %560 = extractelement <2 x i16> %558, i32 1
  %561 = bitcast i32 %555 to <2 x i16>
  %562 = extractelement <2 x i16> %561, i32 0
  %563 = extractelement <2 x i16> %561, i32 1
  %564 = bitcast i32 %556 to <2 x i16>
  %565 = extractelement <2 x i16> %564, i32 0
  %566 = extractelement <2 x i16> %564, i32 1
  %567 = bitcast i32 %557 to <2 x i16>
  %568 = extractelement <2 x i16> %567, i32 0
  %569 = extractelement <2 x i16> %567, i32 1
  %570 = insertelement <8 x i16> undef, i16 %559, i32 0
  %571 = insertelement <8 x i16> %570, i16 %560, i32 1
  %572 = insertelement <8 x i16> %571, i16 %562, i32 2
  %573 = insertelement <8 x i16> %572, i16 %563, i32 3
  %574 = insertelement <8 x i16> %573, i16 %565, i32 4
  %575 = insertelement <8 x i16> %574, i16 %566, i32 5
  %576 = insertelement <8 x i16> %575, i16 %568, i32 6
  %577 = insertelement <8 x i16> %576, i16 %569, i32 7
  %578 = extractelement <8 x i16> %577, i32 0
  %579 = extractelement <8 x i16> %577, i32 1
  %580 = extractelement <8 x i16> %577, i32 2
  %581 = extractelement <8 x i16> %577, i32 3
  %582 = extractelement <8 x i16> %577, i32 4
  %583 = extractelement <8 x i16> %577, i32 5
  %584 = extractelement <8 x i16> %577, i32 6
  %585 = extractelement <8 x i16> %577, i32 7
  %586 = bitcast i16 %578 to bfloat
  %587 = bitcast i16 %579 to bfloat
  %588 = bitcast i16 %580 to bfloat
  %589 = bitcast i16 %581 to bfloat
  %590 = bitcast i16 %582 to bfloat
  %591 = bitcast i16 %583 to bfloat
  %592 = bitcast i16 %584 to bfloat
  %593 = bitcast i16 %585 to bfloat
  %594 = insertelement <8 x bfloat> undef, bfloat %586, i32 0
  %595 = insertelement <8 x bfloat> %594, bfloat %587, i32 1
  %596 = insertelement <8 x bfloat> %595, bfloat %588, i32 2
  %597 = insertelement <8 x bfloat> %596, bfloat %589, i32 3
  %598 = insertelement <8 x bfloat> %597, bfloat %590, i32 4
  %599 = insertelement <8 x bfloat> %598, bfloat %591, i32 5
  %600 = insertelement <8 x bfloat> %599, bfloat %592, i32 6
  %601 = insertelement <8 x bfloat> %600, bfloat %593, i32 7
  %602 = extractelement <8 x bfloat> %601, i32 0
  %603 = extractelement <8 x bfloat> %601, i32 1
  %604 = extractelement <8 x bfloat> %601, i32 2
  %605 = extractelement <8 x bfloat> %601, i32 3
  %606 = extractelement <8 x bfloat> %601, i32 4
  %607 = extractelement <8 x bfloat> %601, i32 5
  %608 = extractelement <8 x bfloat> %601, i32 6
  %609 = extractelement <8 x bfloat> %601, i32 7
  call void @llvm.nvvm.barrier0()
  %610 = insertelement <2 x bfloat> undef, bfloat %426, i32 0
  %611 = insertelement <2 x bfloat> %610, bfloat %427, i32 1
  %612 = extractelement <2 x bfloat> %611, i32 0
  %613 = extractelement <2 x bfloat> %611, i32 1
  %614 = bitcast bfloat %612 to i16
  %615 = bitcast bfloat %613 to i16
  %616 = insertelement <2 x i16> undef, i16 %614, i32 0
  %617 = insertelement <2 x i16> %616, i16 %615, i32 1
  %618 = extractelement <2 x i16> %617, i32 0
  %619 = extractelement <2 x i16> %617, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %484, i16 %618, i16 %619, i1 true)
  %620 = insertelement <2 x bfloat> undef, bfloat %428, i32 0
  %621 = insertelement <2 x bfloat> %620, bfloat %429, i32 1
  %622 = extractelement <2 x bfloat> %621, i32 0
  %623 = extractelement <2 x bfloat> %621, i32 1
  %624 = bitcast bfloat %622 to i16
  %625 = bitcast bfloat %623 to i16
  %626 = insertelement <2 x i16> undef, i16 %624, i32 0
  %627 = insertelement <2 x i16> %626, i16 %625, i32 1
  %628 = extractelement <2 x i16> %627, i32 0
  %629 = extractelement <2 x i16> %627, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %499, i16 %628, i16 %629, i1 true)
  %630 = insertelement <2 x bfloat> undef, bfloat %430, i32 0
  %631 = insertelement <2 x bfloat> %630, bfloat %431, i32 1
  %632 = extractelement <2 x bfloat> %631, i32 0
  %633 = extractelement <2 x bfloat> %631, i32 1
  %634 = bitcast bfloat %632 to i16
  %635 = bitcast bfloat %633 to i16
  %636 = insertelement <2 x i16> undef, i16 %634, i32 0
  %637 = insertelement <2 x i16> %636, i16 %635, i32 1
  %638 = extractelement <2 x i16> %637, i32 0
  %639 = extractelement <2 x i16> %637, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %514, i16 %638, i16 %639, i1 true)
  %640 = insertelement <2 x bfloat> undef, bfloat %432, i32 0
  %641 = insertelement <2 x bfloat> %640, bfloat %433, i32 1
  %642 = extractelement <2 x bfloat> %641, i32 0
  %643 = extractelement <2 x bfloat> %641, i32 1
  %644 = bitcast bfloat %642 to i16
  %645 = bitcast bfloat %643 to i16
  %646 = insertelement <2 x i16> undef, i16 %644, i32 0
  %647 = insertelement <2 x i16> %646, i16 %645, i32 1
  %648 = extractelement <2 x i16> %647, i32 0
  %649 = extractelement <2 x i16> %647, i32 1
  call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %529, i16 %648, i16 %649, i1 true)
  call void @llvm.nvvm.barrier0()
  %650 = load <4 x i32>, ptr addrspace(3) %544, align 16
  %651 = extractelement <4 x i32> %650, i32 0
  %652 = extractelement <4 x i32> %650, i32 1
  %653 = extractelement <4 x i32> %650, i32 2
  %654 = extractelement <4 x i32> %650, i32 3
  %655 = insertelement <4 x i32> undef, i32 %651, i32 0
  %656 = insertelement <4 x i32> %655, i32 %652, i32 1
  %657 = insertelement <4 x i32> %656, i32 %653, i32 2
  %658 = insertelement <4 x i32> %657, i32 %654, i32 3
  %659 = extractelement <4 x i32> %658, i32 0
  %660 = extractelement <4 x i32> %658, i32 1
  %661 = extractelement <4 x i32> %658, i32 2
  %662 = extractelement <4 x i32> %658, i32 3
  %663 = bitcast i32 %659 to <2 x i16>
  %664 = extractelement <2 x i16> %663, i32 0
  %665 = extractelement <2 x i16> %663, i32 1
  %666 = bitcast i32 %660 to <2 x i16>
  %667 = extractelement <2 x i16> %666, i32 0
  %668 = extractelement <2 x i16> %666, i32 1
  %669 = bitcast i32 %661 to <2 x i16>
  %670 = extractelement <2 x i16> %669, i32 0
  %671 = extractelement <2 x i16> %669, i32 1
  %672 = bitcast i32 %662 to <2 x i16>
  %673 = extractelement <2 x i16> %672, i32 0
  %674 = extractelement <2 x i16> %672, i32 1
  %675 = insertelement <8 x i16> undef, i16 %664, i32 0
  %676 = insertelement <8 x i16> %675, i16 %665, i32 1
  %677 = insertelement <8 x i16> %676, i16 %667, i32 2
  %678 = insertelement <8 x i16> %677, i16 %668, i32 3
  %679 = insertelement <8 x i16> %678, i16 %670, i32 4
  %680 = insertelement <8 x i16> %679, i16 %671, i32 5
  %681 = insertelement <8 x i16> %680, i16 %673, i32 6
  %682 = insertelement <8 x i16> %681, i16 %674, i32 7
  %683 = extractelement <8 x i16> %682, i32 0
  %684 = extractelement <8 x i16> %682, i32 1
  %685 = extractelement <8 x i16> %682, i32 2
  %686 = extractelement <8 x i16> %682, i32 3
  %687 = extractelement <8 x i16> %682, i32 4
  %688 = extractelement <8 x i16> %682, i32 5
  %689 = extractelement <8 x i16> %682, i32 6
  %690 = extractelement <8 x i16> %682, i32 7
  %691 = bitcast i16 %683 to bfloat
  %692 = bitcast i16 %684 to bfloat
  %693 = bitcast i16 %685 to bfloat
  %694 = bitcast i16 %686 to bfloat
  %695 = bitcast i16 %687 to bfloat
  %696 = bitcast i16 %688 to bfloat
  %697 = bitcast i16 %689 to bfloat
  %698 = bitcast i16 %690 to bfloat
  %699 = insertelement <8 x bfloat> undef, bfloat %691, i32 0
  %700 = insertelement <8 x bfloat> %699, bfloat %692, i32 1
  %701 = insertelement <8 x bfloat> %700, bfloat %693, i32 2
  %702 = insertelement <8 x bfloat> %701, bfloat %694, i32 3
  %703 = insertelement <8 x bfloat> %702, bfloat %695, i32 4
  %704 = insertelement <8 x bfloat> %703, bfloat %696, i32 5
  %705 = insertelement <8 x bfloat> %704, bfloat %697, i32 6
  %706 = insertelement <8 x bfloat> %705, bfloat %698, i32 7
  %707 = extractelement <8 x bfloat> %706, i32 0
  %708 = extractelement <8 x bfloat> %706, i32 1
  %709 = extractelement <8 x bfloat> %706, i32 2
  %710 = extractelement <8 x bfloat> %706, i32 3
  %711 = extractelement <8 x bfloat> %706, i32 4
  %712 = extractelement <8 x bfloat> %706, i32 5
  %713 = extractelement <8 x bfloat> %706, i32 6
  %714 = extractelement <8 x bfloat> %706, i32 7
  %715 = insertelement <2 x bfloat> undef, bfloat %602, i32 0
  %716 = insertelement <2 x bfloat> %715, bfloat %603, i32 1
  %717 = bitcast <2 x bfloat> %716 to i32
  %718 = insertelement <2 x bfloat> undef, bfloat %604, i32 0
  %719 = insertelement <2 x bfloat> %718, bfloat %605, i32 1
  %720 = bitcast <2 x bfloat> %719 to i32
  %721 = insertelement <2 x bfloat> undef, bfloat %606, i32 0
  %722 = insertelement <2 x bfloat> %721, bfloat %607, i32 1
  %723 = bitcast <2 x bfloat> %722 to i32
  %724 = insertelement <2 x bfloat> undef, bfloat %608, i32 0
  %725 = insertelement <2 x bfloat> %724, bfloat %609, i32 1
  %726 = bitcast <2 x bfloat> %725 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %717, i32 %720, i32 %723, i32 %726, ptr addrspace(1) %462)
  %727 = insertelement <2 x bfloat> undef, bfloat %707, i32 0
  %728 = insertelement <2 x bfloat> %727, bfloat %708, i32 1
  %729 = bitcast <2 x bfloat> %728 to i32
  %730 = insertelement <2 x bfloat> undef, bfloat %709, i32 0
  %731 = insertelement <2 x bfloat> %730, bfloat %710, i32 1
  %732 = bitcast <2 x bfloat> %731 to i32
  %733 = insertelement <2 x bfloat> undef, bfloat %711, i32 0
  %734 = insertelement <2 x bfloat> %733, bfloat %712, i32 1
  %735 = bitcast <2 x bfloat> %734 to i32
  %736 = insertelement <2 x bfloat> undef, bfloat %713, i32 0
  %737 = insertelement <2 x bfloat> %736, bfloat %714, i32 1
  %738 = bitcast <2 x bfloat> %737 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %729, i32 %732, i32 %735, i32 %738, ptr addrspace(1) %463)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_87_impl(ptr, ptr, ptr, ptr, ptr, ptr) #4

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

declare float @__nv_rsqrtf(float)

define ptx_kernel void @fusion_87(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(786432) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr null to ptr addrspace(1)
  %7 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 6144
  %10 = add i64 %9, 5120
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

define ptx_kernel void @loop_convert_fusion_5(ptr noalias align 128 dereferenceable(786432) %0, ptr noalias align 128 dereferenceable(393216) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %5 = udiv i32 %4, 24
  %6 = urem i32 %4, 24
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %3
  %9 = call bfloat @fused_convert_5_param_0_280(ptr %0, i32 %5, i32 %8)
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
  %20 = call bfloat @fused_convert_5_param_0_280(ptr %0, i32 %5, i32 %19)
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

define internal bfloat @fused_convert_5_param_0_280(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 6144
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds bfloat, ptr %0, i32 %5
  %7 = load bfloat, ptr %6, align 2, !invariant.load !3
  ret bfloat %7
}

declare float @__nv_fast_expf(float)

declare ptx_kernel void @fusion_86_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_86(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(786432) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) #6 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %5 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %6 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %7 = addrspacecast ptr null to ptr addrspace(1)
  %8 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 6144
  %11 = add i64 %10, 4096
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
  %99 = getelementptr bfloat, ptr addrspace(1) %5, i64 %98
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
  %152 = add i64 %10, 5120
  %153 = getelementptr bfloat, ptr addrspace(1) %4, i64 %152
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
  %206 = getelementptr bfloat, ptr addrspace(1) %3, i64 %98
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
  %410 = getelementptr bfloat, ptr addrspace(1) %2, i64 %44
  %411 = getelementptr bfloat, ptr addrspace(1) %2, i64 %45
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

declare ptx_kernel void @fusion_85_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_85(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(786432) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) #6 {
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
  %11 = mul i64 %10, 6144
  %12 = add i64 %11, 3072
  %13 = getelementptr bfloat, ptr addrspace(1) %3, i64 %12
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
  %100 = getelementptr bfloat, ptr addrspace(1) %2, i64 %99
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
  %153 = add i64 %11, 4096
  %154 = getelementptr bfloat, ptr addrspace(1) %3, i64 %153
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
  %260 = add i64 %11, 5120
  %261 = getelementptr bfloat, ptr addrspace(1) %3, i64 %260
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
  %550 = getelementptr bfloat, ptr addrspace(1) %4, i64 %45
  %551 = getelementptr bfloat, ptr addrspace(1) %4, i64 %46
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

declare ptx_kernel void @fusion_84_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_84(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(786432) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) #6 {
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
  %12 = mul i64 %11, 6144
  %13 = add i64 %12, 2048
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
  %101 = getelementptr bfloat, ptr addrspace(1) %7, i64 %100
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
  %154 = add i64 %12, 3072
  %155 = getelementptr bfloat, ptr addrspace(1) %4, i64 %154
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
  %208 = getelementptr bfloat, ptr addrspace(1) %6, i64 %100
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
  %261 = add i64 %12, 4096
  %262 = getelementptr bfloat, ptr addrspace(1) %4, i64 %261
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
  %315 = getelementptr bfloat, ptr addrspace(1) %5, i64 %100
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
  %368 = add i64 %12, 5120
  %369 = getelementptr bfloat, ptr addrspace(1) %4, i64 %368
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
  %422 = getelementptr bfloat, ptr addrspace(1) %3, i64 %100
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
  %690 = getelementptr bfloat, ptr addrspace(1) %2, i64 %46
  %691 = getelementptr bfloat, ptr addrspace(1) %2, i64 %47
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

declare ptx_kernel void @fusion_83_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_83(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(786432) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8) #6 {
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
  %13 = mul i64 %12, 6144
  %14 = add i64 %13, 1024
  %15 = getelementptr bfloat, ptr addrspace(1) %3, i64 %14
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
  %102 = getelementptr bfloat, ptr addrspace(1) %2, i64 %101
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
  %155 = add i64 %13, 2048
  %156 = getelementptr bfloat, ptr addrspace(1) %3, i64 %155
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
  %209 = getelementptr bfloat, ptr addrspace(1) %8, i64 %101
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
  %262 = add i64 %13, 3072
  %263 = getelementptr bfloat, ptr addrspace(1) %3, i64 %262
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
  %316 = getelementptr bfloat, ptr addrspace(1) %7, i64 %101
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
  %369 = add i64 %13, 4096
  %370 = getelementptr bfloat, ptr addrspace(1) %3, i64 %369
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
  %423 = getelementptr bfloat, ptr addrspace(1) %6, i64 %101
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
  %476 = add i64 %13, 5120
  %477 = getelementptr bfloat, ptr addrspace(1) %3, i64 %476
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
  %530 = getelementptr bfloat, ptr addrspace(1) %5, i64 %101
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
  %830 = getelementptr bfloat, ptr addrspace(1) %4, i64 %47
  %831 = getelementptr bfloat, ptr addrspace(1) %4, i64 %48
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

declare ptx_kernel void @fusion_82_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_82(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(786432) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9) #6 {
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
  %14 = mul i64 %13, 6144
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
  %101 = mul i64 %13, 1024
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
  %155 = add i64 %14, 1024
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
  %262 = add i64 %14, 2048
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
  %316 = getelementptr bfloat, ptr addrspace(1) %9, i64 %101
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
  %369 = add i64 %14, 3072
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
  %423 = getelementptr bfloat, ptr addrspace(1) %8, i64 %101
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
  %476 = add i64 %14, 4096
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
  %530 = getelementptr bfloat, ptr addrspace(1) %7, i64 %101
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
  %583 = add i64 %14, 5120
  %584 = getelementptr bfloat, ptr addrspace(1) %4, i64 %583
  %585 = getelementptr bfloat, ptr addrspace(1) %584, i64 %47
  %586 = getelementptr bfloat, ptr addrspace(1) %584, i64 %48
  %587 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %585)
  %588 = extractvalue { i32, i32, i32, i32 } %587, 0
  %589 = bitcast i32 %588 to <2 x bfloat>
  %590 = extractvalue { i32, i32, i32, i32 } %587, 1
  %591 = bitcast i32 %590 to <2 x bfloat>
  %592 = extractvalue { i32, i32, i32, i32 } %587, 2
  %593 = bitcast i32 %592 to <2 x bfloat>
  %594 = extractvalue { i32, i32, i32, i32 } %587, 3
  %595 = bitcast i32 %594 to <2 x bfloat>
  %596 = extractelement <2 x bfloat> %589, i32 0
  %597 = extractelement <2 x bfloat> %589, i32 1
  %598 = extractelement <2 x bfloat> %591, i32 0
  %599 = extractelement <2 x bfloat> %591, i32 1
  %600 = extractelement <2 x bfloat> %593, i32 0
  %601 = extractelement <2 x bfloat> %593, i32 1
  %602 = extractelement <2 x bfloat> %595, i32 0
  %603 = extractelement <2 x bfloat> %595, i32 1
  %604 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %586)
  %605 = extractvalue { i32, i32, i32, i32 } %604, 0
  %606 = bitcast i32 %605 to <2 x bfloat>
  %607 = extractvalue { i32, i32, i32, i32 } %604, 1
  %608 = bitcast i32 %607 to <2 x bfloat>
  %609 = extractvalue { i32, i32, i32, i32 } %604, 2
  %610 = bitcast i32 %609 to <2 x bfloat>
  %611 = extractvalue { i32, i32, i32, i32 } %604, 3
  %612 = bitcast i32 %611 to <2 x bfloat>
  %613 = extractelement <2 x bfloat> %606, i32 0
  %614 = extractelement <2 x bfloat> %606, i32 1
  %615 = extractelement <2 x bfloat> %608, i32 0
  %616 = extractelement <2 x bfloat> %608, i32 1
  %617 = extractelement <2 x bfloat> %610, i32 0
  %618 = extractelement <2 x bfloat> %610, i32 1
  %619 = extractelement <2 x bfloat> %612, i32 0
  %620 = extractelement <2 x bfloat> %612, i32 1
  %621 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %596)
  %622 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %597)
  %623 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %598)
  %624 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %599)
  %625 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %600)
  %626 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %601)
  %627 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %602)
  %628 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %603)
  %629 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %613)
  %630 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %614)
  %631 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %615)
  %632 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %616)
  %633 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %617)
  %634 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %618)
  %635 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %619)
  %636 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %620)
  %637 = getelementptr bfloat, ptr addrspace(1) %6, i64 %101
  %638 = getelementptr bfloat, ptr addrspace(1) %637, i64 %47
  %639 = getelementptr bfloat, ptr addrspace(1) %637, i64 %48
  %640 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %638)
  %641 = extractvalue { i32, i32, i32, i32 } %640, 0
  %642 = bitcast i32 %641 to <2 x bfloat>
  %643 = extractvalue { i32, i32, i32, i32 } %640, 1
  %644 = bitcast i32 %643 to <2 x bfloat>
  %645 = extractvalue { i32, i32, i32, i32 } %640, 2
  %646 = bitcast i32 %645 to <2 x bfloat>
  %647 = extractvalue { i32, i32, i32, i32 } %640, 3
  %648 = bitcast i32 %647 to <2 x bfloat>
  %649 = extractelement <2 x bfloat> %642, i32 0
  %650 = extractelement <2 x bfloat> %642, i32 1
  %651 = extractelement <2 x bfloat> %644, i32 0
  %652 = extractelement <2 x bfloat> %644, i32 1
  %653 = extractelement <2 x bfloat> %646, i32 0
  %654 = extractelement <2 x bfloat> %646, i32 1
  %655 = extractelement <2 x bfloat> %648, i32 0
  %656 = extractelement <2 x bfloat> %648, i32 1
  %657 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %639)
  %658 = extractvalue { i32, i32, i32, i32 } %657, 0
  %659 = bitcast i32 %658 to <2 x bfloat>
  %660 = extractvalue { i32, i32, i32, i32 } %657, 1
  %661 = bitcast i32 %660 to <2 x bfloat>
  %662 = extractvalue { i32, i32, i32, i32 } %657, 2
  %663 = bitcast i32 %662 to <2 x bfloat>
  %664 = extractvalue { i32, i32, i32, i32 } %657, 3
  %665 = bitcast i32 %664 to <2 x bfloat>
  %666 = extractelement <2 x bfloat> %659, i32 0
  %667 = extractelement <2 x bfloat> %659, i32 1
  %668 = extractelement <2 x bfloat> %661, i32 0
  %669 = extractelement <2 x bfloat> %661, i32 1
  %670 = extractelement <2 x bfloat> %663, i32 0
  %671 = extractelement <2 x bfloat> %663, i32 1
  %672 = extractelement <2 x bfloat> %665, i32 0
  %673 = extractelement <2 x bfloat> %665, i32 1
  %674 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %649)
  %675 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %650)
  %676 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %651)
  %677 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %652)
  %678 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653)
  %679 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654)
  %680 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655)
  %681 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656)
  %682 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %666)
  %683 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %667)
  %684 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %668)
  %685 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %669)
  %686 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670)
  %687 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671)
  %688 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672)
  %689 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673)
  %690 = fadd float %621, %674
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
  %706 = fadd float %567, %690
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
  %722 = fadd float %514, %706
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
  %738 = fadd float %460, %722
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
  %754 = fadd float %407, %738
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
  %770 = fadd float %353, %754
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
  %786 = fadd float %300, %770
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
  %802 = fadd float %246, %786
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
  %818 = fadd float %193, %802
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
  %834 = fadd float %139, %818
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
  %850 = fadd float %85, %834
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
  %866 = fmul float %850, %850
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
  %882 = fadd float %866, %867
  %883 = fadd float %882, %868
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
  %897 = bitcast float %896 to i32
  %898 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %897, i32 16, i32 31)
  %899 = bitcast i32 %898 to float
  %900 = fadd float %896, %899
  %901 = bitcast float %900 to i32
  %902 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %901, i32 8, i32 31)
  %903 = bitcast i32 %902 to float
  %904 = fadd float %900, %903
  %905 = bitcast float %904 to i32
  %906 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %905, i32 4, i32 31)
  %907 = bitcast i32 %906 to float
  %908 = fadd float %904, %907
  %909 = bitcast float %908 to i32
  %910 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %909, i32 2, i32 31)
  %911 = bitcast i32 %910 to float
  %912 = fadd float %908, %911
  %913 = bitcast float %912 to i32
  %914 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %913, i32 1, i32 31)
  %915 = bitcast i32 %914 to float
  %916 = fadd float %912, %915
  %917 = urem i32 %17, 32
  %918 = urem i32 %18, 2
  %919 = icmp eq i32 %917, 0
  %920 = and i1 true, %919
  %921 = add i32 0, %918
  %922 = getelementptr float, ptr addrspace(3) @global_smem, i32 %921
  %923 = insertelement <1 x float> undef, float %916, i32 0
  %924 = extractelement <1 x float> %923, i32 0
  %925 = bitcast float %924 to i32
  %926 = insertelement <1 x i32> undef, i32 %925, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %922, <1 x i32> %926, i1 %920)
  call void @llvm.nvvm.barrier0()
  %927 = icmp slt i32 %16, 2
  %928 = getelementptr float, ptr addrspace(3) @global_smem, i32 %16
  %929 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %928, i1 %927)
  %930 = insertelement <1 x i32> undef, i32 %929, i32 0
  %931 = extractelement <1 x i32> %930, i32 0
  %932 = bitcast i32 %931 to float
  %933 = insertelement <1 x float> undef, float %932, i32 0
  %934 = extractelement <1 x float> %933, i32 0
  %935 = bitcast float %934 to i32
  %936 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %935, i32 1, i32 31)
  %937 = bitcast i32 %936 to float
  %938 = fadd float %934, %937
  %939 = urem i32 %17, 2
  %940 = icmp eq i32 %939, 0
  %941 = and i1 %927, %940
  %942 = insertelement <1 x float> undef, float %938, i32 0
  %943 = extractelement <1 x float> %942, i32 0
  %944 = bitcast float %943 to i32
  %945 = insertelement <1 x i32> undef, i32 %944, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %928, <1 x i32> %945, i1 %941)
  call void @llvm.nvvm.barrier0()
  %946 = load float, ptr addrspace(3) @global_smem, align 4
  %947 = fmul float %946, 0x3F50000000000000
  %948 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %949 = bitcast i32 %948 to <1 x float>
  %950 = extractelement <1 x float> %949, i32 0
  %951 = fadd float %947, %950
  %952 = call float @__nv_rsqrtf(float %951)
  %953 = fmul float %850, %952
  %954 = fmul float %851, %952
  %955 = fmul float %852, %952
  %956 = fmul float %853, %952
  %957 = fmul float %854, %952
  %958 = fmul float %855, %952
  %959 = fmul float %856, %952
  %960 = fmul float %857, %952
  %961 = fmul float %858, %952
  %962 = fmul float %859, %952
  %963 = fmul float %860, %952
  %964 = fmul float %861, %952
  %965 = fmul float %862, %952
  %966 = fmul float %863, %952
  %967 = fmul float %864, %952
  %968 = fmul float %865, %952
  %969 = getelementptr bfloat, ptr addrspace(1) %2, i64 %47
  %970 = getelementptr bfloat, ptr addrspace(1) %2, i64 %48
  %971 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %969)
  %972 = extractvalue { i32, i32, i32, i32 } %971, 0
  %973 = bitcast i32 %972 to <2 x bfloat>
  %974 = extractvalue { i32, i32, i32, i32 } %971, 1
  %975 = bitcast i32 %974 to <2 x bfloat>
  %976 = extractvalue { i32, i32, i32, i32 } %971, 2
  %977 = bitcast i32 %976 to <2 x bfloat>
  %978 = extractvalue { i32, i32, i32, i32 } %971, 3
  %979 = bitcast i32 %978 to <2 x bfloat>
  %980 = extractelement <2 x bfloat> %973, i32 0
  %981 = extractelement <2 x bfloat> %973, i32 1
  %982 = extractelement <2 x bfloat> %975, i32 0
  %983 = extractelement <2 x bfloat> %975, i32 1
  %984 = extractelement <2 x bfloat> %977, i32 0
  %985 = extractelement <2 x bfloat> %977, i32 1
  %986 = extractelement <2 x bfloat> %979, i32 0
  %987 = extractelement <2 x bfloat> %979, i32 1
  %988 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %970)
  %989 = extractvalue { i32, i32, i32, i32 } %988, 0
  %990 = bitcast i32 %989 to <2 x bfloat>
  %991 = extractvalue { i32, i32, i32, i32 } %988, 1
  %992 = bitcast i32 %991 to <2 x bfloat>
  %993 = extractvalue { i32, i32, i32, i32 } %988, 2
  %994 = bitcast i32 %993 to <2 x bfloat>
  %995 = extractvalue { i32, i32, i32, i32 } %988, 3
  %996 = bitcast i32 %995 to <2 x bfloat>
  %997 = extractelement <2 x bfloat> %990, i32 0
  %998 = extractelement <2 x bfloat> %990, i32 1
  %999 = extractelement <2 x bfloat> %992, i32 0
  %1000 = extractelement <2 x bfloat> %992, i32 1
  %1001 = extractelement <2 x bfloat> %994, i32 0
  %1002 = extractelement <2 x bfloat> %994, i32 1
  %1003 = extractelement <2 x bfloat> %996, i32 0
  %1004 = extractelement <2 x bfloat> %996, i32 1
  %1005 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %980)
  %1006 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %981)
  %1007 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %982)
  %1008 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %983)
  %1009 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %984)
  %1010 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %985)
  %1011 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %986)
  %1012 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %987)
  %1013 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %997)
  %1014 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %998)
  %1015 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %999)
  %1016 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1000)
  %1017 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1001)
  %1018 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1002)
  %1019 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1003)
  %1020 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1004)
  %1021 = fmul float %953, %1005
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
  %1037 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1021)
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
  %1053 = getelementptr bfloat, ptr addrspace(1) %10, i64 %101
  %1054 = getelementptr bfloat, ptr addrspace(1) %1053, i64 %47
  %1055 = getelementptr bfloat, ptr addrspace(1) %1053, i64 %48
  %1056 = insertelement <2 x bfloat> undef, bfloat %1037, i32 0
  %1057 = insertelement <2 x bfloat> %1056, bfloat %1038, i32 1
  %1058 = bitcast <2 x bfloat> %1057 to i32
  %1059 = insertelement <2 x bfloat> undef, bfloat %1039, i32 0
  %1060 = insertelement <2 x bfloat> %1059, bfloat %1040, i32 1
  %1061 = bitcast <2 x bfloat> %1060 to i32
  %1062 = insertelement <2 x bfloat> undef, bfloat %1041, i32 0
  %1063 = insertelement <2 x bfloat> %1062, bfloat %1042, i32 1
  %1064 = bitcast <2 x bfloat> %1063 to i32
  %1065 = insertelement <2 x bfloat> undef, bfloat %1043, i32 0
  %1066 = insertelement <2 x bfloat> %1065, bfloat %1044, i32 1
  %1067 = bitcast <2 x bfloat> %1066 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1058, i32 %1061, i32 %1064, i32 %1067, ptr addrspace(1) %1054)
  %1068 = insertelement <2 x bfloat> undef, bfloat %1045, i32 0
  %1069 = insertelement <2 x bfloat> %1068, bfloat %1046, i32 1
  %1070 = bitcast <2 x bfloat> %1069 to i32
  %1071 = insertelement <2 x bfloat> undef, bfloat %1047, i32 0
  %1072 = insertelement <2 x bfloat> %1071, bfloat %1048, i32 1
  %1073 = bitcast <2 x bfloat> %1072 to i32
  %1074 = insertelement <2 x bfloat> undef, bfloat %1049, i32 0
  %1075 = insertelement <2 x bfloat> %1074, bfloat %1050, i32 1
  %1076 = bitcast <2 x bfloat> %1075 to i32
  %1077 = insertelement <2 x bfloat> undef, bfloat %1051, i32 0
  %1078 = insertelement <2 x bfloat> %1077, bfloat %1052, i32 1
  %1079 = bitcast <2 x bfloat> %1078 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1070, i32 %1073, i32 %1076, i32 %1079, ptr addrspace(1) %1055)
  ret void

entry:                                            ; No predecessors!
  ret void
}

declare ptx_kernel void @fusion_80_impl(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr) #4

define ptx_kernel void @fusion_80(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(786432) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(131072) %arg10) #6 {
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
  %11 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %12 = addrspacecast ptr null to ptr addrspace(1)
  %13 = call i32 asm "mov.u32 $0, %ctaid.x;", "=r"()
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, 1024
  %16 = getelementptr bfloat, ptr addrspace(1) %2, i64 %15
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
  %102 = mul i64 %14, 6144
  %103 = getelementptr bfloat, ptr addrspace(1) %5, i64 %102
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
  %156 = getelementptr bfloat, ptr addrspace(1) %6, i64 %15
  %157 = getelementptr bfloat, ptr addrspace(1) %156, i64 %48
  %158 = getelementptr bfloat, ptr addrspace(1) %156, i64 %49
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
  %209 = add i64 %102, 1024
  %210 = getelementptr bfloat, ptr addrspace(1) %5, i64 %209
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
  %263 = getelementptr bfloat, ptr addrspace(1) %4, i64 %15
  %264 = getelementptr bfloat, ptr addrspace(1) %263, i64 %48
  %265 = getelementptr bfloat, ptr addrspace(1) %263, i64 %49
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
  %316 = add i64 %102, 2048
  %317 = getelementptr bfloat, ptr addrspace(1) %5, i64 %316
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
  %370 = getelementptr bfloat, ptr addrspace(1) %10, i64 %15
  %371 = getelementptr bfloat, ptr addrspace(1) %370, i64 %48
  %372 = getelementptr bfloat, ptr addrspace(1) %370, i64 %49
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
  %423 = add i64 %102, 3072
  %424 = getelementptr bfloat, ptr addrspace(1) %5, i64 %423
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
  %477 = getelementptr bfloat, ptr addrspace(1) %9, i64 %15
  %478 = getelementptr bfloat, ptr addrspace(1) %477, i64 %48
  %479 = getelementptr bfloat, ptr addrspace(1) %477, i64 %49
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
  %530 = add i64 %102, 4096
  %531 = getelementptr bfloat, ptr addrspace(1) %5, i64 %530
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
  %584 = getelementptr bfloat, ptr addrspace(1) %8, i64 %15
  %585 = getelementptr bfloat, ptr addrspace(1) %584, i64 %48
  %586 = getelementptr bfloat, ptr addrspace(1) %584, i64 %49
  %587 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %585)
  %588 = extractvalue { i32, i32, i32, i32 } %587, 0
  %589 = bitcast i32 %588 to <2 x bfloat>
  %590 = extractvalue { i32, i32, i32, i32 } %587, 1
  %591 = bitcast i32 %590 to <2 x bfloat>
  %592 = extractvalue { i32, i32, i32, i32 } %587, 2
  %593 = bitcast i32 %592 to <2 x bfloat>
  %594 = extractvalue { i32, i32, i32, i32 } %587, 3
  %595 = bitcast i32 %594 to <2 x bfloat>
  %596 = extractelement <2 x bfloat> %589, i32 0
  %597 = extractelement <2 x bfloat> %589, i32 1
  %598 = extractelement <2 x bfloat> %591, i32 0
  %599 = extractelement <2 x bfloat> %591, i32 1
  %600 = extractelement <2 x bfloat> %593, i32 0
  %601 = extractelement <2 x bfloat> %593, i32 1
  %602 = extractelement <2 x bfloat> %595, i32 0
  %603 = extractelement <2 x bfloat> %595, i32 1
  %604 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %586)
  %605 = extractvalue { i32, i32, i32, i32 } %604, 0
  %606 = bitcast i32 %605 to <2 x bfloat>
  %607 = extractvalue { i32, i32, i32, i32 } %604, 1
  %608 = bitcast i32 %607 to <2 x bfloat>
  %609 = extractvalue { i32, i32, i32, i32 } %604, 2
  %610 = bitcast i32 %609 to <2 x bfloat>
  %611 = extractvalue { i32, i32, i32, i32 } %604, 3
  %612 = bitcast i32 %611 to <2 x bfloat>
  %613 = extractelement <2 x bfloat> %606, i32 0
  %614 = extractelement <2 x bfloat> %606, i32 1
  %615 = extractelement <2 x bfloat> %608, i32 0
  %616 = extractelement <2 x bfloat> %608, i32 1
  %617 = extractelement <2 x bfloat> %610, i32 0
  %618 = extractelement <2 x bfloat> %610, i32 1
  %619 = extractelement <2 x bfloat> %612, i32 0
  %620 = extractelement <2 x bfloat> %612, i32 1
  %621 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %596)
  %622 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %597)
  %623 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %598)
  %624 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %599)
  %625 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %600)
  %626 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %601)
  %627 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %602)
  %628 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %603)
  %629 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %613)
  %630 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %614)
  %631 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %615)
  %632 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %616)
  %633 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %617)
  %634 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %618)
  %635 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %619)
  %636 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %620)
  %637 = add i64 %102, 5120
  %638 = getelementptr bfloat, ptr addrspace(1) %5, i64 %637
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
  %691 = getelementptr bfloat, ptr addrspace(1) %7, i64 %15
  %692 = getelementptr bfloat, ptr addrspace(1) %691, i64 %48
  %693 = getelementptr bfloat, ptr addrspace(1) %691, i64 %49
  %694 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %692)
  %695 = extractvalue { i32, i32, i32, i32 } %694, 0
  %696 = bitcast i32 %695 to <2 x bfloat>
  %697 = extractvalue { i32, i32, i32, i32 } %694, 1
  %698 = bitcast i32 %697 to <2 x bfloat>
  %699 = extractvalue { i32, i32, i32, i32 } %694, 2
  %700 = bitcast i32 %699 to <2 x bfloat>
  %701 = extractvalue { i32, i32, i32, i32 } %694, 3
  %702 = bitcast i32 %701 to <2 x bfloat>
  %703 = extractelement <2 x bfloat> %696, i32 0
  %704 = extractelement <2 x bfloat> %696, i32 1
  %705 = extractelement <2 x bfloat> %698, i32 0
  %706 = extractelement <2 x bfloat> %698, i32 1
  %707 = extractelement <2 x bfloat> %700, i32 0
  %708 = extractelement <2 x bfloat> %700, i32 1
  %709 = extractelement <2 x bfloat> %702, i32 0
  %710 = extractelement <2 x bfloat> %702, i32 1
  %711 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %693)
  %712 = extractvalue { i32, i32, i32, i32 } %711, 0
  %713 = bitcast i32 %712 to <2 x bfloat>
  %714 = extractvalue { i32, i32, i32, i32 } %711, 1
  %715 = bitcast i32 %714 to <2 x bfloat>
  %716 = extractvalue { i32, i32, i32, i32 } %711, 2
  %717 = bitcast i32 %716 to <2 x bfloat>
  %718 = extractvalue { i32, i32, i32, i32 } %711, 3
  %719 = bitcast i32 %718 to <2 x bfloat>
  %720 = extractelement <2 x bfloat> %713, i32 0
  %721 = extractelement <2 x bfloat> %713, i32 1
  %722 = extractelement <2 x bfloat> %715, i32 0
  %723 = extractelement <2 x bfloat> %715, i32 1
  %724 = extractelement <2 x bfloat> %717, i32 0
  %725 = extractelement <2 x bfloat> %717, i32 1
  %726 = extractelement <2 x bfloat> %719, i32 0
  %727 = extractelement <2 x bfloat> %719, i32 1
  %728 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %703)
  %729 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %704)
  %730 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %705)
  %731 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %706)
  %732 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %707)
  %733 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %708)
  %734 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %709)
  %735 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %710)
  %736 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %720)
  %737 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %721)
  %738 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %722)
  %739 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %723)
  %740 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %724)
  %741 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %725)
  %742 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %726)
  %743 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %727)
  %744 = fadd float %675, %728
  %745 = fadd float %676, %729
  %746 = fadd float %677, %730
  %747 = fadd float %678, %731
  %748 = fadd float %679, %732
  %749 = fadd float %680, %733
  %750 = fadd float %681, %734
  %751 = fadd float %682, %735
  %752 = fadd float %683, %736
  %753 = fadd float %684, %737
  %754 = fadd float %685, %738
  %755 = fadd float %686, %739
  %756 = fadd float %687, %740
  %757 = fadd float %688, %741
  %758 = fadd float %689, %742
  %759 = fadd float %690, %743
  %760 = fadd float %621, %744
  %761 = fadd float %622, %745
  %762 = fadd float %623, %746
  %763 = fadd float %624, %747
  %764 = fadd float %625, %748
  %765 = fadd float %626, %749
  %766 = fadd float %627, %750
  %767 = fadd float %628, %751
  %768 = fadd float %629, %752
  %769 = fadd float %630, %753
  %770 = fadd float %631, %754
  %771 = fadd float %632, %755
  %772 = fadd float %633, %756
  %773 = fadd float %634, %757
  %774 = fadd float %635, %758
  %775 = fadd float %636, %759
  %776 = fadd float %568, %760
  %777 = fadd float %569, %761
  %778 = fadd float %570, %762
  %779 = fadd float %571, %763
  %780 = fadd float %572, %764
  %781 = fadd float %573, %765
  %782 = fadd float %574, %766
  %783 = fadd float %575, %767
  %784 = fadd float %576, %768
  %785 = fadd float %577, %769
  %786 = fadd float %578, %770
  %787 = fadd float %579, %771
  %788 = fadd float %580, %772
  %789 = fadd float %581, %773
  %790 = fadd float %582, %774
  %791 = fadd float %583, %775
  %792 = fadd float %514, %776
  %793 = fadd float %515, %777
  %794 = fadd float %516, %778
  %795 = fadd float %517, %779
  %796 = fadd float %518, %780
  %797 = fadd float %519, %781
  %798 = fadd float %520, %782
  %799 = fadd float %521, %783
  %800 = fadd float %522, %784
  %801 = fadd float %523, %785
  %802 = fadd float %524, %786
  %803 = fadd float %525, %787
  %804 = fadd float %526, %788
  %805 = fadd float %527, %789
  %806 = fadd float %528, %790
  %807 = fadd float %529, %791
  %808 = fadd float %461, %792
  %809 = fadd float %462, %793
  %810 = fadd float %463, %794
  %811 = fadd float %464, %795
  %812 = fadd float %465, %796
  %813 = fadd float %466, %797
  %814 = fadd float %467, %798
  %815 = fadd float %468, %799
  %816 = fadd float %469, %800
  %817 = fadd float %470, %801
  %818 = fadd float %471, %802
  %819 = fadd float %472, %803
  %820 = fadd float %473, %804
  %821 = fadd float %474, %805
  %822 = fadd float %475, %806
  %823 = fadd float %476, %807
  %824 = fadd float %407, %808
  %825 = fadd float %408, %809
  %826 = fadd float %409, %810
  %827 = fadd float %410, %811
  %828 = fadd float %411, %812
  %829 = fadd float %412, %813
  %830 = fadd float %413, %814
  %831 = fadd float %414, %815
  %832 = fadd float %415, %816
  %833 = fadd float %416, %817
  %834 = fadd float %417, %818
  %835 = fadd float %418, %819
  %836 = fadd float %419, %820
  %837 = fadd float %420, %821
  %838 = fadd float %421, %822
  %839 = fadd float %422, %823
  %840 = fadd float %354, %824
  %841 = fadd float %355, %825
  %842 = fadd float %356, %826
  %843 = fadd float %357, %827
  %844 = fadd float %358, %828
  %845 = fadd float %359, %829
  %846 = fadd float %360, %830
  %847 = fadd float %361, %831
  %848 = fadd float %362, %832
  %849 = fadd float %363, %833
  %850 = fadd float %364, %834
  %851 = fadd float %365, %835
  %852 = fadd float %366, %836
  %853 = fadd float %367, %837
  %854 = fadd float %368, %838
  %855 = fadd float %369, %839
  %856 = fadd float %300, %840
  %857 = fadd float %301, %841
  %858 = fadd float %302, %842
  %859 = fadd float %303, %843
  %860 = fadd float %304, %844
  %861 = fadd float %305, %845
  %862 = fadd float %306, %846
  %863 = fadd float %307, %847
  %864 = fadd float %308, %848
  %865 = fadd float %309, %849
  %866 = fadd float %310, %850
  %867 = fadd float %311, %851
  %868 = fadd float %312, %852
  %869 = fadd float %313, %853
  %870 = fadd float %314, %854
  %871 = fadd float %315, %855
  %872 = fadd float %247, %856
  %873 = fadd float %248, %857
  %874 = fadd float %249, %858
  %875 = fadd float %250, %859
  %876 = fadd float %251, %860
  %877 = fadd float %252, %861
  %878 = fadd float %253, %862
  %879 = fadd float %254, %863
  %880 = fadd float %255, %864
  %881 = fadd float %256, %865
  %882 = fadd float %257, %866
  %883 = fadd float %258, %867
  %884 = fadd float %259, %868
  %885 = fadd float %260, %869
  %886 = fadd float %261, %870
  %887 = fadd float %262, %871
  %888 = fadd float %193, %872
  %889 = fadd float %194, %873
  %890 = fadd float %195, %874
  %891 = fadd float %196, %875
  %892 = fadd float %197, %876
  %893 = fadd float %198, %877
  %894 = fadd float %199, %878
  %895 = fadd float %200, %879
  %896 = fadd float %201, %880
  %897 = fadd float %202, %881
  %898 = fadd float %203, %882
  %899 = fadd float %204, %883
  %900 = fadd float %205, %884
  %901 = fadd float %206, %885
  %902 = fadd float %207, %886
  %903 = fadd float %208, %887
  %904 = fadd float %140, %888
  %905 = fadd float %141, %889
  %906 = fadd float %142, %890
  %907 = fadd float %143, %891
  %908 = fadd float %144, %892
  %909 = fadd float %145, %893
  %910 = fadd float %146, %894
  %911 = fadd float %147, %895
  %912 = fadd float %148, %896
  %913 = fadd float %149, %897
  %914 = fadd float %150, %898
  %915 = fadd float %151, %899
  %916 = fadd float %152, %900
  %917 = fadd float %153, %901
  %918 = fadd float %154, %902
  %919 = fadd float %155, %903
  %920 = fadd float %86, %904
  %921 = fadd float %87, %905
  %922 = fadd float %88, %906
  %923 = fadd float %89, %907
  %924 = fadd float %90, %908
  %925 = fadd float %91, %909
  %926 = fadd float %92, %910
  %927 = fadd float %93, %911
  %928 = fadd float %94, %912
  %929 = fadd float %95, %913
  %930 = fadd float %96, %914
  %931 = fadd float %97, %915
  %932 = fadd float %98, %916
  %933 = fadd float %99, %917
  %934 = fadd float %100, %918
  %935 = fadd float %101, %919
  %936 = fmul float %920, %920
  %937 = fmul float %921, %921
  %938 = fmul float %922, %922
  %939 = fmul float %923, %923
  %940 = fmul float %924, %924
  %941 = fmul float %925, %925
  %942 = fmul float %926, %926
  %943 = fmul float %927, %927
  %944 = fmul float %928, %928
  %945 = fmul float %929, %929
  %946 = fmul float %930, %930
  %947 = fmul float %931, %931
  %948 = fmul float %932, %932
  %949 = fmul float %933, %933
  %950 = fmul float %934, %934
  %951 = fmul float %935, %935
  %952 = fadd float %936, %937
  %953 = fadd float %952, %938
  %954 = fadd float %953, %939
  %955 = fadd float %954, %940
  %956 = fadd float %955, %941
  %957 = fadd float %956, %942
  %958 = fadd float %957, %943
  %959 = fadd float %958, %944
  %960 = fadd float %959, %945
  %961 = fadd float %960, %946
  %962 = fadd float %961, %947
  %963 = fadd float %962, %948
  %964 = fadd float %963, %949
  %965 = fadd float %964, %950
  %966 = fadd float %965, %951
  %967 = bitcast float %966 to i32
  %968 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %967, i32 16, i32 31)
  %969 = bitcast i32 %968 to float
  %970 = fadd float %966, %969
  %971 = bitcast float %970 to i32
  %972 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %971, i32 8, i32 31)
  %973 = bitcast i32 %972 to float
  %974 = fadd float %970, %973
  %975 = bitcast float %974 to i32
  %976 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %975, i32 4, i32 31)
  %977 = bitcast i32 %976 to float
  %978 = fadd float %974, %977
  %979 = bitcast float %978 to i32
  %980 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %979, i32 2, i32 31)
  %981 = bitcast i32 %980 to float
  %982 = fadd float %978, %981
  %983 = bitcast float %982 to i32
  %984 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %983, i32 1, i32 31)
  %985 = bitcast i32 %984 to float
  %986 = fadd float %982, %985
  %987 = urem i32 %18, 32
  %988 = urem i32 %19, 2
  %989 = icmp eq i32 %987, 0
  %990 = and i1 true, %989
  %991 = add i32 0, %988
  %992 = getelementptr float, ptr addrspace(3) @global_smem, i32 %991
  %993 = insertelement <1 x float> undef, float %986, i32 0
  %994 = extractelement <1 x float> %993, i32 0
  %995 = bitcast float %994 to i32
  %996 = insertelement <1 x i32> undef, i32 %995, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %992, <1 x i32> %996, i1 %990)
  call void @llvm.nvvm.barrier0()
  %997 = icmp slt i32 %17, 2
  %998 = getelementptr float, ptr addrspace(3) @global_smem, i32 %17
  %999 = call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %998, i1 %997)
  %1000 = insertelement <1 x i32> undef, i32 %999, i32 0
  %1001 = extractelement <1 x i32> %1000, i32 0
  %1002 = bitcast i32 %1001 to float
  %1003 = insertelement <1 x float> undef, float %1002, i32 0
  %1004 = extractelement <1 x float> %1003, i32 0
  %1005 = bitcast float %1004 to i32
  %1006 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %1005, i32 1, i32 31)
  %1007 = bitcast i32 %1006 to float
  %1008 = fadd float %1004, %1007
  %1009 = urem i32 %18, 2
  %1010 = icmp eq i32 %1009, 0
  %1011 = and i1 %997, %1010
  %1012 = insertelement <1 x float> undef, float %1008, i32 0
  %1013 = extractelement <1 x float> %1012, i32 0
  %1014 = bitcast float %1013 to i32
  %1015 = insertelement <1 x i32> undef, i32 %1014, i32 0
  call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %998, <1 x i32> %1015, i1 %1011)
  call void @llvm.nvvm.barrier0()
  %1016 = load float, ptr addrspace(3) @global_smem, align 4
  %1017 = fmul float %1016, 0x3F50000000000000
  %1018 = call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %1)
  %1019 = bitcast i32 %1018 to <1 x float>
  %1020 = extractelement <1 x float> %1019, i32 0
  %1021 = fadd float %1017, %1020
  %1022 = call float @__nv_rsqrtf(float %1021)
  %1023 = fmul float %920, %1022
  %1024 = fmul float %921, %1022
  %1025 = fmul float %922, %1022
  %1026 = fmul float %923, %1022
  %1027 = fmul float %924, %1022
  %1028 = fmul float %925, %1022
  %1029 = fmul float %926, %1022
  %1030 = fmul float %927, %1022
  %1031 = fmul float %928, %1022
  %1032 = fmul float %929, %1022
  %1033 = fmul float %930, %1022
  %1034 = fmul float %931, %1022
  %1035 = fmul float %932, %1022
  %1036 = fmul float %933, %1022
  %1037 = fmul float %934, %1022
  %1038 = fmul float %935, %1022
  %1039 = getelementptr bfloat, ptr addrspace(1) %3, i64 %48
  %1040 = getelementptr bfloat, ptr addrspace(1) %3, i64 %49
  %1041 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %1039)
  %1042 = extractvalue { i32, i32, i32, i32 } %1041, 0
  %1043 = bitcast i32 %1042 to <2 x bfloat>
  %1044 = extractvalue { i32, i32, i32, i32 } %1041, 1
  %1045 = bitcast i32 %1044 to <2 x bfloat>
  %1046 = extractvalue { i32, i32, i32, i32 } %1041, 2
  %1047 = bitcast i32 %1046 to <2 x bfloat>
  %1048 = extractvalue { i32, i32, i32, i32 } %1041, 3
  %1049 = bitcast i32 %1048 to <2 x bfloat>
  %1050 = extractelement <2 x bfloat> %1043, i32 0
  %1051 = extractelement <2 x bfloat> %1043, i32 1
  %1052 = extractelement <2 x bfloat> %1045, i32 0
  %1053 = extractelement <2 x bfloat> %1045, i32 1
  %1054 = extractelement <2 x bfloat> %1047, i32 0
  %1055 = extractelement <2 x bfloat> %1047, i32 1
  %1056 = extractelement <2 x bfloat> %1049, i32 0
  %1057 = extractelement <2 x bfloat> %1049, i32 1
  %1058 = call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %1040)
  %1059 = extractvalue { i32, i32, i32, i32 } %1058, 0
  %1060 = bitcast i32 %1059 to <2 x bfloat>
  %1061 = extractvalue { i32, i32, i32, i32 } %1058, 1
  %1062 = bitcast i32 %1061 to <2 x bfloat>
  %1063 = extractvalue { i32, i32, i32, i32 } %1058, 2
  %1064 = bitcast i32 %1063 to <2 x bfloat>
  %1065 = extractvalue { i32, i32, i32, i32 } %1058, 3
  %1066 = bitcast i32 %1065 to <2 x bfloat>
  %1067 = extractelement <2 x bfloat> %1060, i32 0
  %1068 = extractelement <2 x bfloat> %1060, i32 1
  %1069 = extractelement <2 x bfloat> %1062, i32 0
  %1070 = extractelement <2 x bfloat> %1062, i32 1
  %1071 = extractelement <2 x bfloat> %1064, i32 0
  %1072 = extractelement <2 x bfloat> %1064, i32 1
  %1073 = extractelement <2 x bfloat> %1066, i32 0
  %1074 = extractelement <2 x bfloat> %1066, i32 1
  %1075 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1050)
  %1076 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1051)
  %1077 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1052)
  %1078 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1053)
  %1079 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1054)
  %1080 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1055)
  %1081 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1056)
  %1082 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1057)
  %1083 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1067)
  %1084 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1068)
  %1085 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1069)
  %1086 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1070)
  %1087 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1071)
  %1088 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1072)
  %1089 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1073)
  %1090 = call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %1074)
  %1091 = fmul float %1023, %1075
  %1092 = fmul float %1024, %1076
  %1093 = fmul float %1025, %1077
  %1094 = fmul float %1026, %1078
  %1095 = fmul float %1027, %1079
  %1096 = fmul float %1028, %1080
  %1097 = fmul float %1029, %1081
  %1098 = fmul float %1030, %1082
  %1099 = fmul float %1031, %1083
  %1100 = fmul float %1032, %1084
  %1101 = fmul float %1033, %1085
  %1102 = fmul float %1034, %1086
  %1103 = fmul float %1035, %1087
  %1104 = fmul float %1036, %1088
  %1105 = fmul float %1037, %1089
  %1106 = fmul float %1038, %1090
  %1107 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1091)
  %1108 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1092)
  %1109 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1093)
  %1110 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1094)
  %1111 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1095)
  %1112 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1096)
  %1113 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1097)
  %1114 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1098)
  %1115 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1099)
  %1116 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1100)
  %1117 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1101)
  %1118 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1102)
  %1119 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1103)
  %1120 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1104)
  %1121 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1105)
  %1122 = call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %1106)
  %1123 = getelementptr bfloat, ptr addrspace(1) %11, i64 %15
  %1124 = getelementptr bfloat, ptr addrspace(1) %1123, i64 %48
  %1125 = getelementptr bfloat, ptr addrspace(1) %1123, i64 %49
  %1126 = insertelement <2 x bfloat> undef, bfloat %1107, i32 0
  %1127 = insertelement <2 x bfloat> %1126, bfloat %1108, i32 1
  %1128 = bitcast <2 x bfloat> %1127 to i32
  %1129 = insertelement <2 x bfloat> undef, bfloat %1109, i32 0
  %1130 = insertelement <2 x bfloat> %1129, bfloat %1110, i32 1
  %1131 = bitcast <2 x bfloat> %1130 to i32
  %1132 = insertelement <2 x bfloat> undef, bfloat %1111, i32 0
  %1133 = insertelement <2 x bfloat> %1132, bfloat %1112, i32 1
  %1134 = bitcast <2 x bfloat> %1133 to i32
  %1135 = insertelement <2 x bfloat> undef, bfloat %1113, i32 0
  %1136 = insertelement <2 x bfloat> %1135, bfloat %1114, i32 1
  %1137 = bitcast <2 x bfloat> %1136 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1128, i32 %1131, i32 %1134, i32 %1137, ptr addrspace(1) %1124)
  %1138 = insertelement <2 x bfloat> undef, bfloat %1115, i32 0
  %1139 = insertelement <2 x bfloat> %1138, bfloat %1116, i32 1
  %1140 = bitcast <2 x bfloat> %1139 to i32
  %1141 = insertelement <2 x bfloat> undef, bfloat %1117, i32 0
  %1142 = insertelement <2 x bfloat> %1141, bfloat %1118, i32 1
  %1143 = bitcast <2 x bfloat> %1142 to i32
  %1144 = insertelement <2 x bfloat> undef, bfloat %1119, i32 0
  %1145 = insertelement <2 x bfloat> %1144, bfloat %1120, i32 1
  %1146 = bitcast <2 x bfloat> %1145 to i32
  %1147 = insertelement <2 x bfloat> undef, bfloat %1121, i32 0
  %1148 = insertelement <2 x bfloat> %1147, bfloat %1122, i32 1
  %1149 = bitcast <2 x bfloat> %1148 to i32
  call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1140, i32 %1143, i32 %1146, i32 %1149, ptr addrspace(1) %1125)
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

declare ptx_kernel void @triton_softmax_8_0_impl(ptr, ptr, ptr, ptr) #4

define ptx_kernel void @triton_softmax_8_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2) #6 {
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
  %21 = call float @fused_concatenate_convert_432_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %22 = fmul float %20, %21
  %23 = add i32 %9, 64
  %24 = add i32 %14, 64
  %25 = getelementptr inbounds float, ptr %0, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = getelementptr inbounds bfloat, ptr %1, i32 %23
  %28 = load bfloat, ptr %27, align 2, !invariant.load !3
  %29 = fpext bfloat %28 to float
  %30 = fmul float %26, %29
  %31 = call float @fused_concatenate_convert_432_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %32 = fmul float %30, %31
  %33 = fsub float %22, %32
  %34 = fptrunc float %33 to bfloat
  %35 = getelementptr inbounds bfloat, ptr %4, i32 %14
  store bfloat %34, ptr %35, align 2
  %36 = load float, ptr %25, align 4, !invariant.load !3
  %37 = load bfloat, ptr %27, align 2, !invariant.load !3
  %38 = fpext bfloat %37 to float
  %39 = fmul float %36, %38
  %40 = call float @fused_concatenate_convert_432_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %9)
  %41 = fmul float %39, %40
  %42 = load float, ptr %15, align 4, !invariant.load !3
  %43 = load bfloat, ptr %17, align 2, !invariant.load !3
  %44 = fpext bfloat %43 to float
  %45 = fmul float %42, %44
  %46 = call float @fused_concatenate_convert_432_7(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 %23)
  %47 = fmul float %45, %46
  %48 = fadd float %41, %47
  %49 = fptrunc float %48 to bfloat
  %50 = getelementptr inbounds bfloat, ptr %4, i32 %24
  store bfloat %49, ptr %50, align 2
  ret void
}

define internal float @fused_concatenate_convert_432_7(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
!4 = !{i32 0, i32 24576}
!5 = !{i32 0, i32 1536}
!6 = !{i32 0, i32 256}
!7 = !{i32 0, i32 135456}

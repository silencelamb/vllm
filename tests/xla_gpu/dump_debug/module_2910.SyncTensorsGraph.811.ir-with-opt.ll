; ModuleID = 'SyncTensorsGraph.811'
source_filename = "SyncTensorsGraph.811"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %2) local_unnamed_addr #0 {
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define ptx_kernel void @wrapped_concatenate(ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %1, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %2, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %3, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %4, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %5, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %6, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %7, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %8, ptr noalias writeonly align 128 captures(none) dereferenceable(37748736) %9) local_unnamed_addr #2 {
  %11 = addrspacecast ptr %9 to ptr addrspace(1)
  %12 = addrspacecast ptr %8 to ptr addrspace(1)
  %13 = addrspacecast ptr %7 to ptr addrspace(1)
  %14 = addrspacecast ptr %6 to ptr addrspace(1)
  %15 = addrspacecast ptr %5 to ptr addrspace(1)
  %16 = addrspacecast ptr %4 to ptr addrspace(1)
  %17 = addrspacecast ptr %3 to ptr addrspace(1)
  %18 = addrspacecast ptr %2 to ptr addrspace(1)
  %19 = addrspacecast ptr %1 to ptr addrspace(1)
  %20 = addrspacecast ptr %0 to ptr addrspace(1)
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %23 = lshr i32 %22, 2
  %24 = icmp samesign ult i32 %22, 16384
  %25 = shl nuw nsw i32 %21, 2
  %26 = shl nuw nsw i32 %22, 9
  %27 = or disjoint i32 %25, %26
  br i1 %24, label %28, label %65

28:                                               ; preds = %10
  %29 = icmp samesign ult i32 %22, 8192
  br i1 %29, label %30, label %45

30:                                               ; preds = %28
  %31 = icmp samesign ult i32 %22, 4096
  br i1 %31, label %32, label %35

32:                                               ; preds = %30
  %33 = zext nneg i32 %27 to i64
  %34 = getelementptr inbounds bfloat, ptr addrspace(1) %20, i64 %33
  br label %119

35:                                               ; preds = %30
  %36 = and i32 %26, 1536
  %37 = shl nuw nsw i32 %23, 11
  %38 = sext i32 %25 to i64
  %39 = sext i32 %36 to i64
  %40 = sext i32 %37 to i64
  %41 = add i64 %40, %39
  %42 = add i64 %41, %38
  %43 = getelementptr bfloat, ptr addrspace(1) %19, i64 %42
  %44 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 -4194304
  br label %119

45:                                               ; preds = %28
  %46 = icmp samesign ult i32 %22, 12288
  %47 = and i32 %26, 1536
  %48 = shl nuw nsw i32 %23, 11
  br i1 %46, label %49, label %57

49:                                               ; preds = %45
  %50 = sext i32 %25 to i64
  %51 = sext i32 %47 to i64
  %52 = sext i32 %48 to i64
  %53 = add i64 %52, %51
  %54 = add i64 %53, %50
  %55 = getelementptr bfloat, ptr addrspace(1) %18, i64 %54
  %56 = getelementptr inbounds i8, ptr addrspace(1) %55, i64 -8388608
  br label %119

57:                                               ; preds = %45
  %58 = sext i32 %25 to i64
  %59 = sext i32 %47 to i64
  %60 = sext i32 %48 to i64
  %61 = add i64 %60, %59
  %62 = add i64 %61, %58
  %63 = getelementptr bfloat, ptr addrspace(1) %17, i64 %62
  %64 = getelementptr inbounds i8, ptr addrspace(1) %63, i64 -12582912
  br label %119

65:                                               ; preds = %10
  %66 = icmp samesign ult i32 %22, 24576
  br i1 %66, label %67, label %87

67:                                               ; preds = %65
  %68 = icmp samesign ult i32 %22, 20480
  %69 = and i32 %26, 1536
  %70 = shl nuw nsw i32 %23, 11
  br i1 %68, label %71, label %79

71:                                               ; preds = %67
  %72 = sext i32 %25 to i64
  %73 = sext i32 %69 to i64
  %74 = sext i32 %70 to i64
  %75 = add i64 %74, %73
  %76 = add i64 %75, %72
  %77 = getelementptr bfloat, ptr addrspace(1) %16, i64 %76
  %78 = getelementptr inbounds i8, ptr addrspace(1) %77, i64 -16777216
  br label %119

79:                                               ; preds = %67
  %80 = sext i32 %25 to i64
  %81 = sext i32 %69 to i64
  %82 = sext i32 %70 to i64
  %83 = add i64 %82, %81
  %84 = add i64 %83, %80
  %85 = getelementptr bfloat, ptr addrspace(1) %15, i64 %84
  %86 = getelementptr inbounds i8, ptr addrspace(1) %85, i64 -20971520
  br label %119

87:                                               ; preds = %65
  %88 = icmp samesign ult i32 %22, 28672
  br i1 %88, label %89, label %99

89:                                               ; preds = %87
  %90 = and i32 %26, 1536
  %91 = shl nuw nsw i32 %23, 11
  %92 = sext i32 %25 to i64
  %93 = sext i32 %90 to i64
  %94 = sext i32 %91 to i64
  %95 = add i64 %94, %93
  %96 = add i64 %95, %92
  %97 = getelementptr bfloat, ptr addrspace(1) %14, i64 %96
  %98 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 -25165824
  br label %119

99:                                               ; preds = %87
  %100 = icmp samesign ult i32 %22, 32768
  %101 = and i32 %26, 1536
  %102 = shl nuw nsw i32 %23, 11
  br i1 %100, label %103, label %111

103:                                              ; preds = %99
  %104 = sext i32 %25 to i64
  %105 = sext i32 %101 to i64
  %106 = sext i32 %102 to i64
  %107 = add i64 %106, %105
  %108 = add i64 %107, %104
  %109 = getelementptr bfloat, ptr addrspace(1) %13, i64 %108
  %110 = getelementptr inbounds i8, ptr addrspace(1) %109, i64 -29360128
  br label %119

111:                                              ; preds = %99
  %112 = sext i32 %25 to i64
  %113 = sext i32 %101 to i64
  %114 = sext i32 %102 to i64
  %115 = add i64 %114, %113
  %116 = add i64 %115, %112
  %117 = getelementptr bfloat, ptr addrspace(1) %12, i64 %116
  %118 = getelementptr inbounds i8, ptr addrspace(1) %117, i64 -33554432
  br label %119

119:                                              ; preds = %35, %32, %57, %49, %79, %71, %89, %111, %103
  %.in = phi ptr addrspace(1) [ %44, %35 ], [ %34, %32 ], [ %64, %57 ], [ %56, %49 ], [ %86, %79 ], [ %78, %71 ], [ %98, %89 ], [ %118, %111 ], [ %110, %103 ]
  %120 = icmp ult i32 %22, 16384
  br i1 %120, label %121, label %162

121:                                              ; preds = %119
  %122 = icmp samesign ult i32 %22, 8192
  br i1 %122, label %123, label %140

123:                                              ; preds = %121
  %124 = icmp samesign ult i32 %22, 4096
  br i1 %124, label %125, label %129

125:                                              ; preds = %123
  %126 = zext nneg i32 %27 to i64
  %127 = getelementptr bfloat, ptr addrspace(1) %20, i64 %126
  %128 = getelementptr inbounds i8, ptr addrspace(1) %127, i64 2
  br label %221

129:                                              ; preds = %123
  %130 = and i32 %26, 1536
  %131 = shl nuw nsw i32 %23, 11
  %132 = sext i32 %25 to i64
  %133 = sext i32 %130 to i64
  %134 = sext i32 %131 to i64
  %135 = add i64 %134, %133
  %136 = add i64 %135, %132
  %137 = add i64 %136, 1
  %138 = getelementptr bfloat, ptr addrspace(1) %19, i64 %137
  %139 = getelementptr inbounds i8, ptr addrspace(1) %138, i64 -4194304
  br label %221

140:                                              ; preds = %121
  %141 = icmp samesign ult i32 %22, 12288
  %142 = and i32 %26, 1536
  %143 = shl nuw nsw i32 %23, 11
  br i1 %141, label %144, label %153

144:                                              ; preds = %140
  %145 = sext i32 %25 to i64
  %146 = sext i32 %142 to i64
  %147 = sext i32 %143 to i64
  %148 = add i64 %147, %146
  %149 = add i64 %148, %145
  %150 = add i64 %149, 1
  %151 = getelementptr bfloat, ptr addrspace(1) %18, i64 %150
  %152 = getelementptr inbounds i8, ptr addrspace(1) %151, i64 -8388608
  br label %221

153:                                              ; preds = %140
  %154 = sext i32 %25 to i64
  %155 = sext i32 %142 to i64
  %156 = sext i32 %143 to i64
  %157 = add i64 %156, %155
  %158 = add i64 %157, %154
  %159 = add i64 %158, 1
  %160 = getelementptr bfloat, ptr addrspace(1) %17, i64 %159
  %161 = getelementptr inbounds i8, ptr addrspace(1) %160, i64 -12582912
  br label %221

162:                                              ; preds = %119
  %163 = icmp samesign ult i32 %22, 24576
  br i1 %163, label %164, label %186

164:                                              ; preds = %162
  %165 = icmp samesign ult i32 %22, 20480
  %166 = and i32 %26, 1536
  %167 = shl nuw nsw i32 %23, 11
  br i1 %165, label %168, label %177

168:                                              ; preds = %164
  %169 = sext i32 %25 to i64
  %170 = sext i32 %166 to i64
  %171 = sext i32 %167 to i64
  %172 = add i64 %171, %170
  %173 = add i64 %172, %169
  %174 = add i64 %173, 1
  %175 = getelementptr bfloat, ptr addrspace(1) %16, i64 %174
  %176 = getelementptr inbounds i8, ptr addrspace(1) %175, i64 -16777216
  br label %221

177:                                              ; preds = %164
  %178 = sext i32 %25 to i64
  %179 = sext i32 %166 to i64
  %180 = sext i32 %167 to i64
  %181 = add i64 %180, %179
  %182 = add i64 %181, %178
  %183 = add i64 %182, 1
  %184 = getelementptr bfloat, ptr addrspace(1) %15, i64 %183
  %185 = getelementptr inbounds i8, ptr addrspace(1) %184, i64 -20971520
  br label %221

186:                                              ; preds = %162
  %187 = icmp samesign ult i32 %22, 28672
  br i1 %187, label %188, label %199

188:                                              ; preds = %186
  %189 = and i32 %26, 1536
  %190 = shl nuw nsw i32 %23, 11
  %191 = sext i32 %25 to i64
  %192 = sext i32 %189 to i64
  %193 = sext i32 %190 to i64
  %194 = add i64 %193, %192
  %195 = add i64 %194, %191
  %196 = add i64 %195, 1
  %197 = getelementptr bfloat, ptr addrspace(1) %14, i64 %196
  %198 = getelementptr inbounds i8, ptr addrspace(1) %197, i64 -25165824
  br label %221

199:                                              ; preds = %186
  %200 = icmp samesign ult i32 %22, 32768
  %201 = and i32 %26, 1536
  %202 = shl nuw nsw i32 %23, 11
  br i1 %200, label %203, label %212

203:                                              ; preds = %199
  %204 = sext i32 %25 to i64
  %205 = sext i32 %201 to i64
  %206 = sext i32 %202 to i64
  %207 = add i64 %206, %205
  %208 = add i64 %207, %204
  %209 = add i64 %208, 1
  %210 = getelementptr bfloat, ptr addrspace(1) %13, i64 %209
  %211 = getelementptr inbounds i8, ptr addrspace(1) %210, i64 -29360128
  br label %221

212:                                              ; preds = %199
  %213 = sext i32 %25 to i64
  %214 = sext i32 %201 to i64
  %215 = sext i32 %202 to i64
  %216 = add i64 %215, %214
  %217 = add i64 %216, %213
  %218 = add i64 %217, 1
  %219 = getelementptr bfloat, ptr addrspace(1) %12, i64 %218
  %220 = getelementptr inbounds i8, ptr addrspace(1) %219, i64 -33554432
  br label %221

221:                                              ; preds = %129, %125, %153, %144, %177, %168, %188, %212, %203
  %.in1 = phi ptr addrspace(1) [ %139, %129 ], [ %128, %125 ], [ %161, %153 ], [ %152, %144 ], [ %185, %177 ], [ %176, %168 ], [ %198, %188 ], [ %220, %212 ], [ %211, %203 ]
  %222 = icmp ult i32 %22, 16384
  br i1 %222, label %223, label %264

223:                                              ; preds = %221
  %224 = icmp samesign ult i32 %22, 8192
  br i1 %224, label %225, label %242

225:                                              ; preds = %223
  %226 = icmp samesign ult i32 %22, 4096
  br i1 %226, label %227, label %231

227:                                              ; preds = %225
  %228 = zext nneg i32 %27 to i64
  %229 = getelementptr bfloat, ptr addrspace(1) %20, i64 %228
  %230 = getelementptr inbounds i8, ptr addrspace(1) %229, i64 4
  br label %323

231:                                              ; preds = %225
  %232 = and i32 %26, 1536
  %233 = shl nuw nsw i32 %23, 11
  %234 = sext i32 %25 to i64
  %235 = sext i32 %232 to i64
  %236 = sext i32 %233 to i64
  %237 = add i64 %236, %235
  %238 = add i64 %237, %234
  %239 = add i64 %238, 2
  %240 = getelementptr bfloat, ptr addrspace(1) %19, i64 %239
  %241 = getelementptr inbounds i8, ptr addrspace(1) %240, i64 -4194304
  br label %323

242:                                              ; preds = %223
  %243 = icmp samesign ult i32 %22, 12288
  %244 = and i32 %26, 1536
  %245 = shl nuw nsw i32 %23, 11
  br i1 %243, label %246, label %255

246:                                              ; preds = %242
  %247 = sext i32 %25 to i64
  %248 = sext i32 %244 to i64
  %249 = sext i32 %245 to i64
  %250 = add i64 %249, %248
  %251 = add i64 %250, %247
  %252 = add i64 %251, 2
  %253 = getelementptr bfloat, ptr addrspace(1) %18, i64 %252
  %254 = getelementptr inbounds i8, ptr addrspace(1) %253, i64 -8388608
  br label %323

255:                                              ; preds = %242
  %256 = sext i32 %25 to i64
  %257 = sext i32 %244 to i64
  %258 = sext i32 %245 to i64
  %259 = add i64 %258, %257
  %260 = add i64 %259, %256
  %261 = add i64 %260, 2
  %262 = getelementptr bfloat, ptr addrspace(1) %17, i64 %261
  %263 = getelementptr inbounds i8, ptr addrspace(1) %262, i64 -12582912
  br label %323

264:                                              ; preds = %221
  %265 = icmp samesign ult i32 %22, 24576
  br i1 %265, label %266, label %288

266:                                              ; preds = %264
  %267 = icmp samesign ult i32 %22, 20480
  %268 = and i32 %26, 1536
  %269 = shl nuw nsw i32 %23, 11
  br i1 %267, label %270, label %279

270:                                              ; preds = %266
  %271 = sext i32 %25 to i64
  %272 = sext i32 %268 to i64
  %273 = sext i32 %269 to i64
  %274 = add i64 %273, %272
  %275 = add i64 %274, %271
  %276 = add i64 %275, 2
  %277 = getelementptr bfloat, ptr addrspace(1) %16, i64 %276
  %278 = getelementptr inbounds i8, ptr addrspace(1) %277, i64 -16777216
  br label %323

279:                                              ; preds = %266
  %280 = sext i32 %25 to i64
  %281 = sext i32 %268 to i64
  %282 = sext i32 %269 to i64
  %283 = add i64 %282, %281
  %284 = add i64 %283, %280
  %285 = add i64 %284, 2
  %286 = getelementptr bfloat, ptr addrspace(1) %15, i64 %285
  %287 = getelementptr inbounds i8, ptr addrspace(1) %286, i64 -20971520
  br label %323

288:                                              ; preds = %264
  %289 = icmp samesign ult i32 %22, 28672
  br i1 %289, label %290, label %301

290:                                              ; preds = %288
  %291 = and i32 %26, 1536
  %292 = shl nuw nsw i32 %23, 11
  %293 = sext i32 %25 to i64
  %294 = sext i32 %291 to i64
  %295 = sext i32 %292 to i64
  %296 = add i64 %295, %294
  %297 = add i64 %296, %293
  %298 = add i64 %297, 2
  %299 = getelementptr bfloat, ptr addrspace(1) %14, i64 %298
  %300 = getelementptr inbounds i8, ptr addrspace(1) %299, i64 -25165824
  br label %323

301:                                              ; preds = %288
  %302 = icmp samesign ult i32 %22, 32768
  %303 = and i32 %26, 1536
  %304 = shl nuw nsw i32 %23, 11
  br i1 %302, label %305, label %314

305:                                              ; preds = %301
  %306 = sext i32 %25 to i64
  %307 = sext i32 %303 to i64
  %308 = sext i32 %304 to i64
  %309 = add i64 %308, %307
  %310 = add i64 %309, %306
  %311 = add i64 %310, 2
  %312 = getelementptr bfloat, ptr addrspace(1) %13, i64 %311
  %313 = getelementptr inbounds i8, ptr addrspace(1) %312, i64 -29360128
  br label %323

314:                                              ; preds = %301
  %315 = sext i32 %25 to i64
  %316 = sext i32 %303 to i64
  %317 = sext i32 %304 to i64
  %318 = add i64 %317, %316
  %319 = add i64 %318, %315
  %320 = add i64 %319, 2
  %321 = getelementptr bfloat, ptr addrspace(1) %12, i64 %320
  %322 = getelementptr inbounds i8, ptr addrspace(1) %321, i64 -33554432
  br label %323

323:                                              ; preds = %231, %227, %255, %246, %279, %270, %290, %314, %305
  %.in2 = phi ptr addrspace(1) [ %241, %231 ], [ %230, %227 ], [ %263, %255 ], [ %254, %246 ], [ %287, %279 ], [ %278, %270 ], [ %300, %290 ], [ %322, %314 ], [ %313, %305 ]
  %324 = icmp ult i32 %22, 16384
  br i1 %324, label %325, label %366

325:                                              ; preds = %323
  %326 = icmp samesign ult i32 %22, 8192
  br i1 %326, label %327, label %344

327:                                              ; preds = %325
  %328 = icmp samesign ult i32 %22, 4096
  br i1 %328, label %329, label %333

329:                                              ; preds = %327
  %330 = zext nneg i32 %27 to i64
  %331 = getelementptr bfloat, ptr addrspace(1) %20, i64 %330
  %332 = getelementptr inbounds i8, ptr addrspace(1) %331, i64 6
  br label %425

333:                                              ; preds = %327
  %334 = and i32 %26, 1536
  %335 = shl nuw nsw i32 %23, 11
  %336 = sext i32 %25 to i64
  %337 = sext i32 %334 to i64
  %338 = sext i32 %335 to i64
  %339 = add i64 %338, %337
  %340 = add i64 %339, %336
  %341 = add i64 %340, 3
  %342 = getelementptr bfloat, ptr addrspace(1) %19, i64 %341
  %343 = getelementptr inbounds i8, ptr addrspace(1) %342, i64 -4194304
  br label %425

344:                                              ; preds = %325
  %345 = icmp samesign ult i32 %22, 12288
  %346 = and i32 %26, 1536
  %347 = shl nuw nsw i32 %23, 11
  br i1 %345, label %348, label %357

348:                                              ; preds = %344
  %349 = sext i32 %25 to i64
  %350 = sext i32 %346 to i64
  %351 = sext i32 %347 to i64
  %352 = add i64 %351, %350
  %353 = add i64 %352, %349
  %354 = add i64 %353, 3
  %355 = getelementptr bfloat, ptr addrspace(1) %18, i64 %354
  %356 = getelementptr inbounds i8, ptr addrspace(1) %355, i64 -8388608
  br label %425

357:                                              ; preds = %344
  %358 = sext i32 %25 to i64
  %359 = sext i32 %346 to i64
  %360 = sext i32 %347 to i64
  %361 = add i64 %360, %359
  %362 = add i64 %361, %358
  %363 = add i64 %362, 3
  %364 = getelementptr bfloat, ptr addrspace(1) %17, i64 %363
  %365 = getelementptr inbounds i8, ptr addrspace(1) %364, i64 -12582912
  br label %425

366:                                              ; preds = %323
  %367 = icmp samesign ult i32 %22, 24576
  br i1 %367, label %368, label %390

368:                                              ; preds = %366
  %369 = icmp samesign ult i32 %22, 20480
  %370 = and i32 %26, 1536
  %371 = shl nuw nsw i32 %23, 11
  br i1 %369, label %372, label %381

372:                                              ; preds = %368
  %373 = sext i32 %25 to i64
  %374 = sext i32 %370 to i64
  %375 = sext i32 %371 to i64
  %376 = add i64 %375, %374
  %377 = add i64 %376, %373
  %378 = add i64 %377, 3
  %379 = getelementptr bfloat, ptr addrspace(1) %16, i64 %378
  %380 = getelementptr inbounds i8, ptr addrspace(1) %379, i64 -16777216
  br label %425

381:                                              ; preds = %368
  %382 = sext i32 %25 to i64
  %383 = sext i32 %370 to i64
  %384 = sext i32 %371 to i64
  %385 = add i64 %384, %383
  %386 = add i64 %385, %382
  %387 = add i64 %386, 3
  %388 = getelementptr bfloat, ptr addrspace(1) %15, i64 %387
  %389 = getelementptr inbounds i8, ptr addrspace(1) %388, i64 -20971520
  br label %425

390:                                              ; preds = %366
  %391 = icmp samesign ult i32 %22, 28672
  br i1 %391, label %392, label %403

392:                                              ; preds = %390
  %393 = and i32 %26, 1536
  %394 = shl nuw nsw i32 %23, 11
  %395 = sext i32 %25 to i64
  %396 = sext i32 %393 to i64
  %397 = sext i32 %394 to i64
  %398 = add i64 %397, %396
  %399 = add i64 %398, %395
  %400 = add i64 %399, 3
  %401 = getelementptr bfloat, ptr addrspace(1) %14, i64 %400
  %402 = getelementptr inbounds i8, ptr addrspace(1) %401, i64 -25165824
  br label %425

403:                                              ; preds = %390
  %404 = icmp samesign ult i32 %22, 32768
  %405 = and i32 %26, 1536
  %406 = shl nuw nsw i32 %23, 11
  br i1 %404, label %407, label %416

407:                                              ; preds = %403
  %408 = sext i32 %25 to i64
  %409 = sext i32 %405 to i64
  %410 = sext i32 %406 to i64
  %411 = add i64 %410, %409
  %412 = add i64 %411, %408
  %413 = add i64 %412, 3
  %414 = getelementptr bfloat, ptr addrspace(1) %13, i64 %413
  %415 = getelementptr inbounds i8, ptr addrspace(1) %414, i64 -29360128
  br label %425

416:                                              ; preds = %403
  %417 = sext i32 %25 to i64
  %418 = sext i32 %405 to i64
  %419 = sext i32 %406 to i64
  %420 = add i64 %419, %418
  %421 = add i64 %420, %417
  %422 = add i64 %421, 3
  %423 = getelementptr bfloat, ptr addrspace(1) %12, i64 %422
  %424 = getelementptr inbounds i8, ptr addrspace(1) %423, i64 -33554432
  br label %425

425:                                              ; preds = %333, %329, %357, %348, %381, %372, %392, %416, %407
  %.in3 = phi ptr addrspace(1) [ %343, %333 ], [ %332, %329 ], [ %365, %357 ], [ %356, %348 ], [ %389, %381 ], [ %380, %372 ], [ %402, %392 ], [ %424, %416 ], [ %415, %407 ]
  %426 = load bfloat, ptr addrspace(1) %.in3, align 2, !invariant.load !6
  %427 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !6
  %428 = insertelement <4 x bfloat> poison, bfloat %427, i64 0
  %429 = load bfloat, ptr addrspace(1) %.in1, align 2, !invariant.load !6
  %430 = insertelement <4 x bfloat> %428, bfloat %429, i64 1
  %431 = load bfloat, ptr addrspace(1) %.in2, align 2, !invariant.load !6
  %432 = insertelement <4 x bfloat> %430, bfloat %431, i64 2
  %433 = insertelement <4 x bfloat> %432, bfloat %426, i64 3
  %434 = zext nneg i32 %27 to i64
  %435 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %434
  store <4 x bfloat> %433, ptr addrspace(1) %435, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_35_0(ptr noalias align 128 dereferenceable(37748736) %arg0, ptr noalias align 128 dereferenceable(1179648) %arg1) local_unnamed_addr #4 {
  %arg1255 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0253 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 1152
  %3 = shl nsw i32 %2, 3
  %4 = sub nsw i32 1, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = mul i32 %2, 1152
  %.decomposed = sub i32 %.frozen, %6
  %7 = sdiv i32 %.decomposed, %5
  %8 = shl i32 %7, 6
  %9 = sext i32 %8 to i64
  %10 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = and i32 %10, 1
  %12 = icmp eq i32 %11, 0
  %13 = and i32 %10, 2
  %14 = icmp eq i32 %13, 0
  %15 = and i32 %10, 4
  %16 = icmp eq i32 %15, 0
  %17 = shl i32 %10, 3
  %18 = and i32 %17, 120
  %19 = zext i32 %18 to i64
  %20 = and i32 %10, 16
  %.not = icmp eq i32 %20, 0
  %21 = and i32 %10, 32
  %22 = icmp eq i32 %21, 0
  %.lobit1 = lshr i32 %10, 4
  %23 = and i32 %.lobit1, 3
  %24 = icmp samesign ult i32 %10, 64
  %25 = select i1 %24, i32 0, i32 4
  %26 = or disjoint i32 %23, %25
  %27 = or disjoint i32 %26, 8
  %28 = or disjoint i32 %26, 16
  %29 = or disjoint i32 %26, 24
  %30 = or disjoint i32 %26, 32
  %31 = or disjoint i32 %26, 40
  %32 = or disjoint i32 %26, 48
  %33 = or disjoint i32 %26, 56
  %34 = zext nneg i32 %26 to i64
  %35 = zext nneg i32 %27 to i64
  %36 = zext nneg i32 %28 to i64
  %37 = zext nneg i32 %29 to i64
  %38 = zext nneg i32 %30 to i64
  %39 = zext nneg i32 %31 to i64
  %40 = zext nneg i32 %32 to i64
  %41 = zext nneg i32 %33 to i64
  %42 = or disjoint i64 %9, %34
  %43 = or disjoint i64 %9, %35
  %44 = or disjoint i64 %9, %36
  %45 = or disjoint i64 %9, %37
  %46 = or disjoint i64 %9, %38
  %47 = or disjoint i64 %9, %39
  %48 = or disjoint i64 %9, %40
  %49 = or disjoint i64 %9, %41
  %50 = shl nsw i64 %42, 11
  %51 = shl nsw i64 %43, 11
  %52 = shl nsw i64 %44, 11
  %53 = shl nsw i64 %45, 11
  %54 = shl nsw i64 %46, 11
  %55 = shl nsw i64 %47, 11
  %56 = shl nsw i64 %48, 11
  %57 = shl nsw i64 %49, 11
  %58 = or disjoint i64 %50, %19
  %59 = or disjoint i64 %51, %19
  %60 = or disjoint i64 %52, %19
  %61 = or disjoint i64 %53, %19
  %62 = or disjoint i64 %54, %19
  %63 = or disjoint i64 %55, %19
  %64 = or disjoint i64 %56, %19
  %65 = or disjoint i64 %57, %19
  %66 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %58
  %67 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %59
  %68 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %60
  %69 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %61
  %70 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %62
  %71 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %63
  %72 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %64
  %73 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %65
  %74 = select i1 %.not, i32 0, i32 136
  %75 = select i1 %22, i32 0, i32 272
  %76 = select i1 %24, i32 0, i32 544
  %77 = or disjoint i32 %74, %76
  %78 = xor i32 %77, %18
  %79 = xor i32 %78, %75
  %80 = zext nneg i32 %79 to i64
  %81 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %80
  %82 = or disjoint i32 %18, 1024
  %83 = xor i32 %77, %82
  %84 = xor i32 %83, %75
  %85 = zext nneg i32 %84 to i64
  %86 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %85
  %87 = or disjoint i32 %18, 2048
  %88 = xor i32 %77, %87
  %89 = xor i32 %88, %75
  %90 = zext nneg i32 %89 to i64
  %91 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %90
  %92 = or disjoint i32 %18, 3072
  %93 = xor i32 %77, %92
  %94 = xor i32 %93, %75
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %95
  %97 = or disjoint i32 %18, 4096
  %98 = xor i32 %77, %97
  %99 = xor i32 %98, %75
  %100 = zext nneg i32 %99 to i64
  %101 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %100
  %102 = or disjoint i32 %18, 5120
  %103 = xor i32 %77, %102
  %104 = xor i32 %103, %75
  %105 = zext nneg i32 %104 to i64
  %106 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %105
  %107 = or disjoint i32 %18, 6144
  %108 = xor i32 %77, %107
  %109 = xor i32 %108, %75
  %110 = zext nneg i32 %109 to i64
  %111 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %110
  %112 = or disjoint i32 %18, 7168
  %113 = xor i32 %77, %112
  %114 = xor i32 %113, %75
  %115 = zext nneg i32 %114 to i64
  %116 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %115
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %81, ptr addrspace(1) %66, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %86, ptr addrspace(1) %67, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %91, ptr addrspace(1) %68, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %96, ptr addrspace(1) %69, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %101, ptr addrspace(1) %70, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %106, ptr addrspace(1) %71, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %111, ptr addrspace(1) %72, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %116, ptr addrspace(1) %73, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %117 = getelementptr bfloat, ptr addrspace(1) %arg0253, i64 %19
  %118 = getelementptr bfloat, ptr addrspace(1) %117, i64 %50
  %119 = getelementptr i8, ptr addrspace(1) %118, i64 256
  %120 = getelementptr bfloat, ptr addrspace(1) %117, i64 %51
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 256
  %122 = getelementptr bfloat, ptr addrspace(1) %117, i64 %52
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 256
  %124 = getelementptr bfloat, ptr addrspace(1) %117, i64 %53
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 256
  %126 = getelementptr bfloat, ptr addrspace(1) %117, i64 %54
  %127 = getelementptr i8, ptr addrspace(1) %126, i64 256
  %128 = getelementptr bfloat, ptr addrspace(1) %117, i64 %55
  %129 = getelementptr i8, ptr addrspace(1) %128, i64 256
  %130 = getelementptr bfloat, ptr addrspace(1) %117, i64 %56
  %131 = getelementptr i8, ptr addrspace(1) %130, i64 256
  %132 = getelementptr bfloat, ptr addrspace(1) %117, i64 %57
  %133 = getelementptr i8, ptr addrspace(1) %132, i64 256
  tail call void @llvm.nvvm.barrier0()
  %134 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %80
  %135 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %85
  %136 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %90
  %137 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %95
  %138 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %100
  %139 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %105
  %140 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %110
  %141 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 16384), i64 %115
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %134, ptr addrspace(1) %119, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %135, ptr addrspace(1) %121, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %136, ptr addrspace(1) %123, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %137, ptr addrspace(1) %125, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %138, ptr addrspace(1) %127, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %139, ptr addrspace(1) %129, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %140, ptr addrspace(1) %131, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %141, ptr addrspace(1) %133, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %142 = getelementptr i8, ptr addrspace(1) %118, i64 512
  %143 = getelementptr i8, ptr addrspace(1) %120, i64 512
  %144 = getelementptr i8, ptr addrspace(1) %122, i64 512
  %145 = getelementptr i8, ptr addrspace(1) %124, i64 512
  %146 = getelementptr i8, ptr addrspace(1) %126, i64 512
  %147 = getelementptr i8, ptr addrspace(1) %128, i64 512
  %148 = getelementptr i8, ptr addrspace(1) %130, i64 512
  %149 = getelementptr i8, ptr addrspace(1) %132, i64 512
  tail call void @llvm.nvvm.barrier0()
  %150 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %80
  %151 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %85
  %152 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %90
  %153 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %95
  %154 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %100
  %155 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %105
  %156 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %110
  %157 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %115
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %150, ptr addrspace(1) %142, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %151, ptr addrspace(1) %143, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %144, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %153, ptr addrspace(1) %145, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %154, ptr addrspace(1) %146, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %155, ptr addrspace(1) %147, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %156, ptr addrspace(1) %148, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %157, ptr addrspace(1) %149, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %158 = select i1 %12, i32 0, i32 136
  %159 = select i1 %14, i32 0, i32 272
  %160 = or disjoint i32 %158, %159
  %161 = select i1 %16, i32 0, i32 544
  %162 = or disjoint i32 %160, %161
  %and.ra = and i32 %10, 24
  %163 = xor i32 %162, %and.ra
  %164 = shl nuw nsw i32 %21, 5
  %165 = or disjoint i32 %163, %164
  %166 = zext nneg i32 %165 to i64
  %167 = or disjoint i32 %160, 32
  %168 = or disjoint i32 %164, %and.ra
  %169 = or disjoint i32 %168, %161
  %170 = xor i32 %169, %167
  %171 = zext nneg i32 %170 to i64
  %172 = or disjoint i32 %162, 64
  %173 = xor i32 %168, %172
  %174 = zext nneg i32 %173 to i64
  %175 = or disjoint i32 %160, 96
  %176 = xor i32 %169, %175
  %177 = zext nneg i32 %176 to i64
  %178 = or disjoint i32 %162, 2048
  %179 = xor i32 %168, %178
  %180 = zext nneg i32 %179 to i64
  %181 = or disjoint i32 %160, 2080
  %182 = xor i32 %169, %181
  %183 = zext nneg i32 %182 to i64
  %184 = or disjoint i32 %162, 2112
  %185 = xor i32 %168, %184
  %186 = zext nneg i32 %185 to i64
  %187 = or disjoint i32 %160, 2144
  %188 = xor i32 %169, %187
  %189 = zext nneg i32 %188 to i64
  %190 = or disjoint i32 %162, 4096
  %191 = xor i32 %168, %190
  %192 = zext nneg i32 %191 to i64
  %193 = or disjoint i32 %160, 4128
  %194 = xor i32 %169, %193
  %195 = zext nneg i32 %194 to i64
  %196 = or disjoint i32 %162, 4160
  %197 = xor i32 %168, %196
  %198 = zext nneg i32 %197 to i64
  %199 = or disjoint i32 %160, 4192
  %200 = xor i32 %169, %199
  %201 = zext nneg i32 %200 to i64
  %202 = or disjoint i32 %162, 6144
  %203 = xor i32 %168, %202
  %204 = zext nneg i32 %203 to i64
  %205 = or disjoint i32 %160, 6176
  %206 = xor i32 %169, %205
  %207 = zext nneg i32 %206 to i64
  %208 = or disjoint i32 %162, 6208
  %209 = xor i32 %168, %208
  %210 = zext nneg i32 %209 to i64
  %211 = or disjoint i32 %160, 6240
  %212 = xor i32 %169, %211
  %213 = zext nneg i32 %212 to i64
  %214 = trunc i32 %10 to i4
  %215 = zext i4 %214 to i64
  %216 = shl nuw nsw i64 %215, 4
  %217 = add i32 %25, %23
  %218 = zext nneg i32 %217 to i64
  %219 = add i64 %9, %218
  %220 = shl nsw i64 %219, 12
  %221 = add nuw nsw i64 %220, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0253, i64 %221
  %222 = add i32 %217, 8
  %223 = zext nneg i32 %222 to i64
  %224 = add i64 %9, %223
  %225 = shl nsw i64 %224, 12
  %226 = add nuw nsw i64 %225, 768
  %scevgep259 = getelementptr i8, ptr addrspace(1) %arg0253, i64 %226
  %227 = add i32 %217, 16
  %228 = zext nneg i32 %227 to i64
  %229 = add i64 %9, %228
  %230 = shl nsw i64 %229, 12
  %231 = add nuw nsw i64 %230, 768
  %scevgep263 = getelementptr i8, ptr addrspace(1) %arg0253, i64 %231
  %232 = add i32 %217, 24
  %233 = zext nneg i32 %232 to i64
  %234 = add i64 %9, %233
  %235 = shl nsw i64 %234, 12
  %236 = add nuw nsw i64 %235, 768
  %scevgep267 = getelementptr i8, ptr addrspace(1) %arg0253, i64 %236
  %237 = add i32 %217, 32
  %238 = zext nneg i32 %237 to i64
  %239 = add i64 %9, %238
  %240 = shl nsw i64 %239, 12
  %241 = add nuw nsw i64 %240, 768
  %scevgep271 = getelementptr i8, ptr addrspace(1) %arg0253, i64 %241
  %242 = add i32 %217, 40
  %243 = zext nneg i32 %242 to i64
  %244 = add i64 %9, %243
  %245 = shl nsw i64 %244, 12
  %246 = add nuw nsw i64 %245, 768
  %scevgep275 = getelementptr i8, ptr addrspace(1) %arg0253, i64 %246
  %247 = add i32 %217, 48
  %248 = zext nneg i32 %247 to i64
  %249 = add i64 %9, %248
  %250 = shl nsw i64 %249, 12
  %251 = add nuw nsw i64 %250, 768
  %scevgep279 = getelementptr i8, ptr addrspace(1) %arg0253, i64 %251
  %252 = add i32 %217, 56
  %253 = zext nneg i32 %252 to i64
  %254 = add i64 %9, %253
  %255 = shl nsw i64 %254, 12
  %256 = add nuw nsw i64 %255, 768
  %scevgep283 = getelementptr i8, ptr addrspace(1) %arg0253, i64 %256
  br label %257

257:                                              ; preds = %0, %257
  %lsr.iv287 = phi i32 [ -128, %0 ], [ %262, %257 ]
  %lsr.iv284 = phi ptr addrspace(1) [ %scevgep283, %0 ], [ %scevgep285, %257 ]
  %lsr.iv280 = phi ptr addrspace(1) [ %scevgep279, %0 ], [ %scevgep281, %257 ]
  %lsr.iv276 = phi ptr addrspace(1) [ %scevgep275, %0 ], [ %scevgep277, %257 ]
  %lsr.iv272 = phi ptr addrspace(1) [ %scevgep271, %0 ], [ %scevgep273, %257 ]
  %lsr.iv268 = phi ptr addrspace(1) [ %scevgep267, %0 ], [ %scevgep269, %257 ]
  %lsr.iv264 = phi ptr addrspace(1) [ %scevgep263, %0 ], [ %scevgep265, %257 ]
  %lsr.iv260 = phi ptr addrspace(1) [ %scevgep259, %0 ], [ %scevgep261, %257 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep257, %257 ]
  %258 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %796, %257 ]
  %259 = phi i32 [ 0, %0 ], [ %793, %257 ]
  %260 = phi i32 [ 2, %0 ], [ %778, %257 ]
  %261 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %775, %257 ]
  %262 = add i32 %lsr.iv287, 128
  %263 = icmp samesign ult i32 %262, 1664
  %264 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %166
  %265 = ptrtoint ptr addrspace(3) %264 to i64
  %266 = trunc i64 %265 to i32
  %267 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %266) #10
  %268 = extractvalue { i32, i32, i32, i32 } %267, 0
  %269 = extractvalue { i32, i32, i32, i32 } %267, 1
  %270 = extractvalue { i32, i32, i32, i32 } %267, 2
  %271 = extractvalue { i32, i32, i32, i32 } %267, 3
  %272 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %171
  %273 = ptrtoint ptr addrspace(3) %272 to i64
  %274 = trunc i64 %273 to i32
  %275 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %274) #10
  %276 = extractvalue { i32, i32, i32, i32 } %275, 0
  %277 = extractvalue { i32, i32, i32, i32 } %275, 1
  %278 = extractvalue { i32, i32, i32, i32 } %275, 2
  %279 = extractvalue { i32, i32, i32, i32 } %275, 3
  %280 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %174
  %281 = ptrtoint ptr addrspace(3) %280 to i64
  %282 = trunc i64 %281 to i32
  %283 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %282) #10
  %284 = extractvalue { i32, i32, i32, i32 } %283, 0
  %285 = extractvalue { i32, i32, i32, i32 } %283, 1
  %286 = extractvalue { i32, i32, i32, i32 } %283, 2
  %287 = extractvalue { i32, i32, i32, i32 } %283, 3
  %288 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %177
  %289 = ptrtoint ptr addrspace(3) %288 to i64
  %290 = trunc i64 %289 to i32
  %291 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %290) #10
  %292 = extractvalue { i32, i32, i32, i32 } %291, 0
  %293 = extractvalue { i32, i32, i32, i32 } %291, 1
  %294 = extractvalue { i32, i32, i32, i32 } %291, 2
  %295 = extractvalue { i32, i32, i32, i32 } %291, 3
  %296 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %180
  %297 = ptrtoint ptr addrspace(3) %296 to i64
  %298 = trunc i64 %297 to i32
  %299 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %298) #10
  %300 = extractvalue { i32, i32, i32, i32 } %299, 0
  %301 = extractvalue { i32, i32, i32, i32 } %299, 1
  %302 = extractvalue { i32, i32, i32, i32 } %299, 2
  %303 = extractvalue { i32, i32, i32, i32 } %299, 3
  %304 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %183
  %305 = ptrtoint ptr addrspace(3) %304 to i64
  %306 = trunc i64 %305 to i32
  %307 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %306) #10
  %308 = extractvalue { i32, i32, i32, i32 } %307, 0
  %309 = extractvalue { i32, i32, i32, i32 } %307, 1
  %310 = extractvalue { i32, i32, i32, i32 } %307, 2
  %311 = extractvalue { i32, i32, i32, i32 } %307, 3
  %312 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %186
  %313 = ptrtoint ptr addrspace(3) %312 to i64
  %314 = trunc i64 %313 to i32
  %315 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %314) #10
  %316 = extractvalue { i32, i32, i32, i32 } %315, 0
  %317 = extractvalue { i32, i32, i32, i32 } %315, 1
  %318 = extractvalue { i32, i32, i32, i32 } %315, 2
  %319 = extractvalue { i32, i32, i32, i32 } %315, 3
  %320 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %189
  %321 = ptrtoint ptr addrspace(3) %320 to i64
  %322 = trunc i64 %321 to i32
  %323 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %322) #10
  %324 = extractvalue { i32, i32, i32, i32 } %323, 0
  %325 = extractvalue { i32, i32, i32, i32 } %323, 1
  %326 = extractvalue { i32, i32, i32, i32 } %323, 2
  %327 = extractvalue { i32, i32, i32, i32 } %323, 3
  %328 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %192
  %329 = ptrtoint ptr addrspace(3) %328 to i64
  %330 = trunc i64 %329 to i32
  %331 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %330) #10
  %332 = extractvalue { i32, i32, i32, i32 } %331, 0
  %333 = extractvalue { i32, i32, i32, i32 } %331, 1
  %334 = extractvalue { i32, i32, i32, i32 } %331, 2
  %335 = extractvalue { i32, i32, i32, i32 } %331, 3
  %336 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %195
  %337 = ptrtoint ptr addrspace(3) %336 to i64
  %338 = trunc i64 %337 to i32
  %339 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %338) #10
  %340 = extractvalue { i32, i32, i32, i32 } %339, 0
  %341 = extractvalue { i32, i32, i32, i32 } %339, 1
  %342 = extractvalue { i32, i32, i32, i32 } %339, 2
  %343 = extractvalue { i32, i32, i32, i32 } %339, 3
  %344 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %198
  %345 = ptrtoint ptr addrspace(3) %344 to i64
  %346 = trunc i64 %345 to i32
  %347 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %346) #10
  %348 = extractvalue { i32, i32, i32, i32 } %347, 0
  %349 = extractvalue { i32, i32, i32, i32 } %347, 1
  %350 = extractvalue { i32, i32, i32, i32 } %347, 2
  %351 = extractvalue { i32, i32, i32, i32 } %347, 3
  %352 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %201
  %353 = ptrtoint ptr addrspace(3) %352 to i64
  %354 = trunc i64 %353 to i32
  %355 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %354) #10
  %356 = extractvalue { i32, i32, i32, i32 } %355, 0
  %357 = extractvalue { i32, i32, i32, i32 } %355, 1
  %358 = extractvalue { i32, i32, i32, i32 } %355, 2
  %359 = extractvalue { i32, i32, i32, i32 } %355, 3
  %360 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %204
  %361 = ptrtoint ptr addrspace(3) %360 to i64
  %362 = trunc i64 %361 to i32
  %363 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %362) #10
  %364 = extractvalue { i32, i32, i32, i32 } %363, 0
  %365 = extractvalue { i32, i32, i32, i32 } %363, 1
  %366 = extractvalue { i32, i32, i32, i32 } %363, 2
  %367 = extractvalue { i32, i32, i32, i32 } %363, 3
  %368 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %207
  %369 = ptrtoint ptr addrspace(3) %368 to i64
  %370 = trunc i64 %369 to i32
  %371 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %370) #10
  %372 = extractvalue { i32, i32, i32, i32 } %371, 0
  %373 = extractvalue { i32, i32, i32, i32 } %371, 1
  %374 = extractvalue { i32, i32, i32, i32 } %371, 2
  %375 = extractvalue { i32, i32, i32, i32 } %371, 3
  %376 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %210
  %377 = ptrtoint ptr addrspace(3) %376 to i64
  %378 = trunc i64 %377 to i32
  %379 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %378) #10
  %380 = extractvalue { i32, i32, i32, i32 } %379, 0
  %381 = extractvalue { i32, i32, i32, i32 } %379, 1
  %382 = extractvalue { i32, i32, i32, i32 } %379, 2
  %383 = extractvalue { i32, i32, i32, i32 } %379, 3
  %384 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %258, i64 %213
  %385 = ptrtoint ptr addrspace(3) %384 to i64
  %386 = trunc i64 %385 to i32
  %387 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %386) #10
  %388 = extractvalue { i32, i32, i32, i32 } %387, 0
  %389 = extractvalue { i32, i32, i32, i32 } %387, 1
  %390 = extractvalue { i32, i32, i32, i32 } %387, 2
  %391 = extractvalue { i32, i32, i32, i32 } %387, 3
  %392 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 0
  %393 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 1
  %394 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 2
  %395 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 3
  %396 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 4
  %397 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 5
  %398 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 6
  %399 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 7
  %400 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 8
  %401 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 9
  %402 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 10
  %403 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 11
  %404 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 12
  %405 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 13
  %406 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 14
  %407 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 15
  %408 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 16
  %409 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 17
  %410 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 18
  %411 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 19
  %412 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 20
  %413 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 21
  %414 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 22
  %415 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 23
  %416 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 24
  %417 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 25
  %418 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 26
  %419 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 27
  %420 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 28
  %421 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 29
  %422 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 30
  %423 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %261, 31
  %424 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %392, float %393, float %394, float %395, i32 0, i32 0, i32 0, i32 0, i32 %268, i32 %269) #10
  %425 = extractvalue { float, float, float, float } %424, 0
  %426 = extractvalue { float, float, float, float } %424, 1
  %427 = extractvalue { float, float, float, float } %424, 2
  %428 = extractvalue { float, float, float, float } %424, 3
  %429 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %396, float %397, float %398, float %399, i32 0, i32 0, i32 0, i32 0, i32 %300, i32 %301) #10
  %430 = extractvalue { float, float, float, float } %429, 0
  %431 = extractvalue { float, float, float, float } %429, 1
  %432 = extractvalue { float, float, float, float } %429, 2
  %433 = extractvalue { float, float, float, float } %429, 3
  %434 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %400, float %401, float %402, float %403, i32 0, i32 0, i32 0, i32 0, i32 %332, i32 %333) #10
  %435 = extractvalue { float, float, float, float } %434, 0
  %436 = extractvalue { float, float, float, float } %434, 1
  %437 = extractvalue { float, float, float, float } %434, 2
  %438 = extractvalue { float, float, float, float } %434, 3
  %439 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %404, float %405, float %406, float %407, i32 0, i32 0, i32 0, i32 0, i32 %364, i32 %365) #10
  %440 = extractvalue { float, float, float, float } %439, 0
  %441 = extractvalue { float, float, float, float } %439, 1
  %442 = extractvalue { float, float, float, float } %439, 2
  %443 = extractvalue { float, float, float, float } %439, 3
  %444 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %408, float %409, float %410, float %411, i32 0, i32 0, i32 0, i32 0, i32 %268, i32 %269) #10
  %445 = extractvalue { float, float, float, float } %444, 0
  %446 = extractvalue { float, float, float, float } %444, 1
  %447 = extractvalue { float, float, float, float } %444, 2
  %448 = extractvalue { float, float, float, float } %444, 3
  %449 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %412, float %413, float %414, float %415, i32 0, i32 0, i32 0, i32 0, i32 %300, i32 %301) #10
  %450 = extractvalue { float, float, float, float } %449, 0
  %451 = extractvalue { float, float, float, float } %449, 1
  %452 = extractvalue { float, float, float, float } %449, 2
  %453 = extractvalue { float, float, float, float } %449, 3
  %454 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %416, float %417, float %418, float %419, i32 0, i32 0, i32 0, i32 0, i32 %332, i32 %333) #10
  %455 = extractvalue { float, float, float, float } %454, 0
  %456 = extractvalue { float, float, float, float } %454, 1
  %457 = extractvalue { float, float, float, float } %454, 2
  %458 = extractvalue { float, float, float, float } %454, 3
  %459 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %420, float %421, float %422, float %423, i32 0, i32 0, i32 0, i32 0, i32 %364, i32 %365) #10
  %460 = extractvalue { float, float, float, float } %459, 0
  %461 = extractvalue { float, float, float, float } %459, 1
  %462 = extractvalue { float, float, float, float } %459, 2
  %463 = extractvalue { float, float, float, float } %459, 3
  %464 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %425, float %426, float %427, float %428, i32 0, i32 0, i32 0, i32 0, i32 %270, i32 %271) #10
  %465 = extractvalue { float, float, float, float } %464, 0
  %466 = extractvalue { float, float, float, float } %464, 1
  %467 = extractvalue { float, float, float, float } %464, 2
  %468 = extractvalue { float, float, float, float } %464, 3
  %469 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %430, float %431, float %432, float %433, i32 0, i32 0, i32 0, i32 0, i32 %302, i32 %303) #10
  %470 = extractvalue { float, float, float, float } %469, 0
  %471 = extractvalue { float, float, float, float } %469, 1
  %472 = extractvalue { float, float, float, float } %469, 2
  %473 = extractvalue { float, float, float, float } %469, 3
  %474 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %435, float %436, float %437, float %438, i32 0, i32 0, i32 0, i32 0, i32 %334, i32 %335) #10
  %475 = extractvalue { float, float, float, float } %474, 0
  %476 = extractvalue { float, float, float, float } %474, 1
  %477 = extractvalue { float, float, float, float } %474, 2
  %478 = extractvalue { float, float, float, float } %474, 3
  %479 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %440, float %441, float %442, float %443, i32 0, i32 0, i32 0, i32 0, i32 %366, i32 %367) #10
  %480 = extractvalue { float, float, float, float } %479, 0
  %481 = extractvalue { float, float, float, float } %479, 1
  %482 = extractvalue { float, float, float, float } %479, 2
  %483 = extractvalue { float, float, float, float } %479, 3
  %484 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %445, float %446, float %447, float %448, i32 0, i32 0, i32 0, i32 0, i32 %270, i32 %271) #10
  %485 = extractvalue { float, float, float, float } %484, 0
  %486 = extractvalue { float, float, float, float } %484, 1
  %487 = extractvalue { float, float, float, float } %484, 2
  %488 = extractvalue { float, float, float, float } %484, 3
  %489 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %450, float %451, float %452, float %453, i32 0, i32 0, i32 0, i32 0, i32 %302, i32 %303) #10
  %490 = extractvalue { float, float, float, float } %489, 0
  %491 = extractvalue { float, float, float, float } %489, 1
  %492 = extractvalue { float, float, float, float } %489, 2
  %493 = extractvalue { float, float, float, float } %489, 3
  %494 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %455, float %456, float %457, float %458, i32 0, i32 0, i32 0, i32 0, i32 %334, i32 %335) #10
  %495 = extractvalue { float, float, float, float } %494, 0
  %496 = extractvalue { float, float, float, float } %494, 1
  %497 = extractvalue { float, float, float, float } %494, 2
  %498 = extractvalue { float, float, float, float } %494, 3
  %499 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %460, float %461, float %462, float %463, i32 0, i32 0, i32 0, i32 0, i32 %366, i32 %367) #10
  %500 = extractvalue { float, float, float, float } %499, 0
  %501 = extractvalue { float, float, float, float } %499, 1
  %502 = extractvalue { float, float, float, float } %499, 2
  %503 = extractvalue { float, float, float, float } %499, 3
  %504 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %465, float %466, float %467, float %468, i32 0, i32 0, i32 0, i32 0, i32 %276, i32 %277) #10
  %505 = extractvalue { float, float, float, float } %504, 0
  %506 = extractvalue { float, float, float, float } %504, 1
  %507 = extractvalue { float, float, float, float } %504, 2
  %508 = extractvalue { float, float, float, float } %504, 3
  %509 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %470, float %471, float %472, float %473, i32 0, i32 0, i32 0, i32 0, i32 %308, i32 %309) #10
  %510 = extractvalue { float, float, float, float } %509, 0
  %511 = extractvalue { float, float, float, float } %509, 1
  %512 = extractvalue { float, float, float, float } %509, 2
  %513 = extractvalue { float, float, float, float } %509, 3
  %514 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %475, float %476, float %477, float %478, i32 0, i32 0, i32 0, i32 0, i32 %340, i32 %341) #10
  %515 = extractvalue { float, float, float, float } %514, 0
  %516 = extractvalue { float, float, float, float } %514, 1
  %517 = extractvalue { float, float, float, float } %514, 2
  %518 = extractvalue { float, float, float, float } %514, 3
  %519 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %480, float %481, float %482, float %483, i32 0, i32 0, i32 0, i32 0, i32 %372, i32 %373) #10
  %520 = extractvalue { float, float, float, float } %519, 0
  %521 = extractvalue { float, float, float, float } %519, 1
  %522 = extractvalue { float, float, float, float } %519, 2
  %523 = extractvalue { float, float, float, float } %519, 3
  %524 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %485, float %486, float %487, float %488, i32 0, i32 0, i32 0, i32 0, i32 %276, i32 %277) #10
  %525 = extractvalue { float, float, float, float } %524, 0
  %526 = extractvalue { float, float, float, float } %524, 1
  %527 = extractvalue { float, float, float, float } %524, 2
  %528 = extractvalue { float, float, float, float } %524, 3
  %529 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %490, float %491, float %492, float %493, i32 0, i32 0, i32 0, i32 0, i32 %308, i32 %309) #10
  %530 = extractvalue { float, float, float, float } %529, 0
  %531 = extractvalue { float, float, float, float } %529, 1
  %532 = extractvalue { float, float, float, float } %529, 2
  %533 = extractvalue { float, float, float, float } %529, 3
  %534 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %495, float %496, float %497, float %498, i32 0, i32 0, i32 0, i32 0, i32 %340, i32 %341) #10
  %535 = extractvalue { float, float, float, float } %534, 0
  %536 = extractvalue { float, float, float, float } %534, 1
  %537 = extractvalue { float, float, float, float } %534, 2
  %538 = extractvalue { float, float, float, float } %534, 3
  %539 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %500, float %501, float %502, float %503, i32 0, i32 0, i32 0, i32 0, i32 %372, i32 %373) #10
  %540 = extractvalue { float, float, float, float } %539, 0
  %541 = extractvalue { float, float, float, float } %539, 1
  %542 = extractvalue { float, float, float, float } %539, 2
  %543 = extractvalue { float, float, float, float } %539, 3
  %544 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %505, float %506, float %507, float %508, i32 0, i32 0, i32 0, i32 0, i32 %278, i32 %279) #10
  %545 = extractvalue { float, float, float, float } %544, 0
  %546 = extractvalue { float, float, float, float } %544, 1
  %547 = extractvalue { float, float, float, float } %544, 2
  %548 = extractvalue { float, float, float, float } %544, 3
  %549 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %510, float %511, float %512, float %513, i32 0, i32 0, i32 0, i32 0, i32 %310, i32 %311) #10
  %550 = extractvalue { float, float, float, float } %549, 0
  %551 = extractvalue { float, float, float, float } %549, 1
  %552 = extractvalue { float, float, float, float } %549, 2
  %553 = extractvalue { float, float, float, float } %549, 3
  %554 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %515, float %516, float %517, float %518, i32 0, i32 0, i32 0, i32 0, i32 %342, i32 %343) #10
  %555 = extractvalue { float, float, float, float } %554, 0
  %556 = extractvalue { float, float, float, float } %554, 1
  %557 = extractvalue { float, float, float, float } %554, 2
  %558 = extractvalue { float, float, float, float } %554, 3
  %559 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %520, float %521, float %522, float %523, i32 0, i32 0, i32 0, i32 0, i32 %374, i32 %375) #10
  %560 = extractvalue { float, float, float, float } %559, 0
  %561 = extractvalue { float, float, float, float } %559, 1
  %562 = extractvalue { float, float, float, float } %559, 2
  %563 = extractvalue { float, float, float, float } %559, 3
  %564 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %525, float %526, float %527, float %528, i32 0, i32 0, i32 0, i32 0, i32 %278, i32 %279) #10
  %565 = extractvalue { float, float, float, float } %564, 0
  %566 = extractvalue { float, float, float, float } %564, 1
  %567 = extractvalue { float, float, float, float } %564, 2
  %568 = extractvalue { float, float, float, float } %564, 3
  %569 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %530, float %531, float %532, float %533, i32 0, i32 0, i32 0, i32 0, i32 %310, i32 %311) #10
  %570 = extractvalue { float, float, float, float } %569, 0
  %571 = extractvalue { float, float, float, float } %569, 1
  %572 = extractvalue { float, float, float, float } %569, 2
  %573 = extractvalue { float, float, float, float } %569, 3
  %574 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %535, float %536, float %537, float %538, i32 0, i32 0, i32 0, i32 0, i32 %342, i32 %343) #10
  %575 = extractvalue { float, float, float, float } %574, 0
  %576 = extractvalue { float, float, float, float } %574, 1
  %577 = extractvalue { float, float, float, float } %574, 2
  %578 = extractvalue { float, float, float, float } %574, 3
  %579 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %540, float %541, float %542, float %543, i32 0, i32 0, i32 0, i32 0, i32 %374, i32 %375) #10
  %580 = extractvalue { float, float, float, float } %579, 0
  %581 = extractvalue { float, float, float, float } %579, 1
  %582 = extractvalue { float, float, float, float } %579, 2
  %583 = extractvalue { float, float, float, float } %579, 3
  %584 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %545, float %546, float %547, float %548, i32 0, i32 0, i32 0, i32 0, i32 %284, i32 %285) #10
  %585 = extractvalue { float, float, float, float } %584, 0
  %586 = extractvalue { float, float, float, float } %584, 1
  %587 = extractvalue { float, float, float, float } %584, 2
  %588 = extractvalue { float, float, float, float } %584, 3
  %589 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %550, float %551, float %552, float %553, i32 0, i32 0, i32 0, i32 0, i32 %316, i32 %317) #10
  %590 = extractvalue { float, float, float, float } %589, 0
  %591 = extractvalue { float, float, float, float } %589, 1
  %592 = extractvalue { float, float, float, float } %589, 2
  %593 = extractvalue { float, float, float, float } %589, 3
  %594 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %555, float %556, float %557, float %558, i32 0, i32 0, i32 0, i32 0, i32 %348, i32 %349) #10
  %595 = extractvalue { float, float, float, float } %594, 0
  %596 = extractvalue { float, float, float, float } %594, 1
  %597 = extractvalue { float, float, float, float } %594, 2
  %598 = extractvalue { float, float, float, float } %594, 3
  %599 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %560, float %561, float %562, float %563, i32 0, i32 0, i32 0, i32 0, i32 %380, i32 %381) #10
  %600 = extractvalue { float, float, float, float } %599, 0
  %601 = extractvalue { float, float, float, float } %599, 1
  %602 = extractvalue { float, float, float, float } %599, 2
  %603 = extractvalue { float, float, float, float } %599, 3
  %604 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %565, float %566, float %567, float %568, i32 0, i32 0, i32 0, i32 0, i32 %284, i32 %285) #10
  %605 = extractvalue { float, float, float, float } %604, 0
  %606 = extractvalue { float, float, float, float } %604, 1
  %607 = extractvalue { float, float, float, float } %604, 2
  %608 = extractvalue { float, float, float, float } %604, 3
  %609 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %570, float %571, float %572, float %573, i32 0, i32 0, i32 0, i32 0, i32 %316, i32 %317) #10
  %610 = extractvalue { float, float, float, float } %609, 0
  %611 = extractvalue { float, float, float, float } %609, 1
  %612 = extractvalue { float, float, float, float } %609, 2
  %613 = extractvalue { float, float, float, float } %609, 3
  %614 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %575, float %576, float %577, float %578, i32 0, i32 0, i32 0, i32 0, i32 %348, i32 %349) #10
  %615 = extractvalue { float, float, float, float } %614, 0
  %616 = extractvalue { float, float, float, float } %614, 1
  %617 = extractvalue { float, float, float, float } %614, 2
  %618 = extractvalue { float, float, float, float } %614, 3
  %619 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %580, float %581, float %582, float %583, i32 0, i32 0, i32 0, i32 0, i32 %380, i32 %381) #10
  %620 = extractvalue { float, float, float, float } %619, 0
  %621 = extractvalue { float, float, float, float } %619, 1
  %622 = extractvalue { float, float, float, float } %619, 2
  %623 = extractvalue { float, float, float, float } %619, 3
  %624 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %585, float %586, float %587, float %588, i32 0, i32 0, i32 0, i32 0, i32 %286, i32 %287) #10
  %625 = extractvalue { float, float, float, float } %624, 0
  %626 = extractvalue { float, float, float, float } %624, 1
  %627 = extractvalue { float, float, float, float } %624, 2
  %628 = extractvalue { float, float, float, float } %624, 3
  %629 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %590, float %591, float %592, float %593, i32 0, i32 0, i32 0, i32 0, i32 %318, i32 %319) #10
  %630 = extractvalue { float, float, float, float } %629, 0
  %631 = extractvalue { float, float, float, float } %629, 1
  %632 = extractvalue { float, float, float, float } %629, 2
  %633 = extractvalue { float, float, float, float } %629, 3
  %634 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %595, float %596, float %597, float %598, i32 0, i32 0, i32 0, i32 0, i32 %350, i32 %351) #10
  %635 = extractvalue { float, float, float, float } %634, 0
  %636 = extractvalue { float, float, float, float } %634, 1
  %637 = extractvalue { float, float, float, float } %634, 2
  %638 = extractvalue { float, float, float, float } %634, 3
  %639 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %600, float %601, float %602, float %603, i32 0, i32 0, i32 0, i32 0, i32 %382, i32 %383) #10
  %640 = extractvalue { float, float, float, float } %639, 0
  %641 = extractvalue { float, float, float, float } %639, 1
  %642 = extractvalue { float, float, float, float } %639, 2
  %643 = extractvalue { float, float, float, float } %639, 3
  %644 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %605, float %606, float %607, float %608, i32 0, i32 0, i32 0, i32 0, i32 %286, i32 %287) #10
  %645 = extractvalue { float, float, float, float } %644, 0
  %646 = extractvalue { float, float, float, float } %644, 1
  %647 = extractvalue { float, float, float, float } %644, 2
  %648 = extractvalue { float, float, float, float } %644, 3
  %649 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %610, float %611, float %612, float %613, i32 0, i32 0, i32 0, i32 0, i32 %318, i32 %319) #10
  %650 = extractvalue { float, float, float, float } %649, 0
  %651 = extractvalue { float, float, float, float } %649, 1
  %652 = extractvalue { float, float, float, float } %649, 2
  %653 = extractvalue { float, float, float, float } %649, 3
  %654 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %615, float %616, float %617, float %618, i32 0, i32 0, i32 0, i32 0, i32 %350, i32 %351) #10
  %655 = extractvalue { float, float, float, float } %654, 0
  %656 = extractvalue { float, float, float, float } %654, 1
  %657 = extractvalue { float, float, float, float } %654, 2
  %658 = extractvalue { float, float, float, float } %654, 3
  %659 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %620, float %621, float %622, float %623, i32 0, i32 0, i32 0, i32 0, i32 %382, i32 %383) #10
  %660 = extractvalue { float, float, float, float } %659, 0
  %661 = extractvalue { float, float, float, float } %659, 1
  %662 = extractvalue { float, float, float, float } %659, 2
  %663 = extractvalue { float, float, float, float } %659, 3
  %664 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %625, float %626, float %627, float %628, i32 0, i32 0, i32 0, i32 0, i32 %292, i32 %293) #10
  %665 = extractvalue { float, float, float, float } %664, 0
  %666 = extractvalue { float, float, float, float } %664, 1
  %667 = extractvalue { float, float, float, float } %664, 2
  %668 = extractvalue { float, float, float, float } %664, 3
  %669 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %630, float %631, float %632, float %633, i32 0, i32 0, i32 0, i32 0, i32 %324, i32 %325) #10
  %670 = extractvalue { float, float, float, float } %669, 0
  %671 = extractvalue { float, float, float, float } %669, 1
  %672 = extractvalue { float, float, float, float } %669, 2
  %673 = extractvalue { float, float, float, float } %669, 3
  %674 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %635, float %636, float %637, float %638, i32 0, i32 0, i32 0, i32 0, i32 %356, i32 %357) #10
  %675 = extractvalue { float, float, float, float } %674, 0
  %676 = extractvalue { float, float, float, float } %674, 1
  %677 = extractvalue { float, float, float, float } %674, 2
  %678 = extractvalue { float, float, float, float } %674, 3
  %679 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %640, float %641, float %642, float %643, i32 0, i32 0, i32 0, i32 0, i32 %388, i32 %389) #10
  %680 = extractvalue { float, float, float, float } %679, 0
  %681 = extractvalue { float, float, float, float } %679, 1
  %682 = extractvalue { float, float, float, float } %679, 2
  %683 = extractvalue { float, float, float, float } %679, 3
  %684 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %645, float %646, float %647, float %648, i32 0, i32 0, i32 0, i32 0, i32 %292, i32 %293) #10
  %685 = extractvalue { float, float, float, float } %684, 0
  %686 = extractvalue { float, float, float, float } %684, 1
  %687 = extractvalue { float, float, float, float } %684, 2
  %688 = extractvalue { float, float, float, float } %684, 3
  %689 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %650, float %651, float %652, float %653, i32 0, i32 0, i32 0, i32 0, i32 %324, i32 %325) #10
  %690 = extractvalue { float, float, float, float } %689, 0
  %691 = extractvalue { float, float, float, float } %689, 1
  %692 = extractvalue { float, float, float, float } %689, 2
  %693 = extractvalue { float, float, float, float } %689, 3
  %694 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %655, float %656, float %657, float %658, i32 0, i32 0, i32 0, i32 0, i32 %356, i32 %357) #10
  %695 = extractvalue { float, float, float, float } %694, 0
  %696 = extractvalue { float, float, float, float } %694, 1
  %697 = extractvalue { float, float, float, float } %694, 2
  %698 = extractvalue { float, float, float, float } %694, 3
  %699 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %660, float %661, float %662, float %663, i32 0, i32 0, i32 0, i32 0, i32 %388, i32 %389) #10
  %700 = extractvalue { float, float, float, float } %699, 0
  %701 = extractvalue { float, float, float, float } %699, 1
  %702 = extractvalue { float, float, float, float } %699, 2
  %703 = extractvalue { float, float, float, float } %699, 3
  %704 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %665, float %666, float %667, float %668, i32 0, i32 0, i32 0, i32 0, i32 %294, i32 %295) #10
  %705 = extractvalue { float, float, float, float } %704, 0
  %706 = extractvalue { float, float, float, float } %704, 1
  %707 = extractvalue { float, float, float, float } %704, 2
  %708 = extractvalue { float, float, float, float } %704, 3
  %709 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %670, float %671, float %672, float %673, i32 0, i32 0, i32 0, i32 0, i32 %326, i32 %327) #10
  %710 = extractvalue { float, float, float, float } %709, 0
  %711 = extractvalue { float, float, float, float } %709, 1
  %712 = extractvalue { float, float, float, float } %709, 2
  %713 = extractvalue { float, float, float, float } %709, 3
  %714 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %675, float %676, float %677, float %678, i32 0, i32 0, i32 0, i32 0, i32 %358, i32 %359) #10
  %715 = extractvalue { float, float, float, float } %714, 0
  %716 = extractvalue { float, float, float, float } %714, 1
  %717 = extractvalue { float, float, float, float } %714, 2
  %718 = extractvalue { float, float, float, float } %714, 3
  %719 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %680, float %681, float %682, float %683, i32 0, i32 0, i32 0, i32 0, i32 %390, i32 %391) #10
  %720 = extractvalue { float, float, float, float } %719, 0
  %721 = extractvalue { float, float, float, float } %719, 1
  %722 = extractvalue { float, float, float, float } %719, 2
  %723 = extractvalue { float, float, float, float } %719, 3
  %724 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %685, float %686, float %687, float %688, i32 0, i32 0, i32 0, i32 0, i32 %294, i32 %295) #10
  %725 = extractvalue { float, float, float, float } %724, 0
  %726 = extractvalue { float, float, float, float } %724, 1
  %727 = extractvalue { float, float, float, float } %724, 2
  %728 = extractvalue { float, float, float, float } %724, 3
  %729 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %690, float %691, float %692, float %693, i32 0, i32 0, i32 0, i32 0, i32 %326, i32 %327) #10
  %730 = extractvalue { float, float, float, float } %729, 0
  %731 = extractvalue { float, float, float, float } %729, 1
  %732 = extractvalue { float, float, float, float } %729, 2
  %733 = extractvalue { float, float, float, float } %729, 3
  %734 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %695, float %696, float %697, float %698, i32 0, i32 0, i32 0, i32 0, i32 %358, i32 %359) #10
  %735 = extractvalue { float, float, float, float } %734, 0
  %736 = extractvalue { float, float, float, float } %734, 1
  %737 = extractvalue { float, float, float, float } %734, 2
  %738 = extractvalue { float, float, float, float } %734, 3
  %739 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %700, float %701, float %702, float %703, i32 0, i32 0, i32 0, i32 0, i32 %390, i32 %391) #10
  %740 = extractvalue { float, float, float, float } %739, 0
  %741 = extractvalue { float, float, float, float } %739, 1
  %742 = extractvalue { float, float, float, float } %739, 2
  %743 = extractvalue { float, float, float, float } %739, 3
  %744 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %705, 0
  %745 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %744, float %706, 1
  %746 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %745, float %707, 2
  %747 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %746, float %708, 3
  %748 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %747, float %710, 4
  %749 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %748, float %711, 5
  %750 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %749, float %712, 6
  %751 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %750, float %713, 7
  %752 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %751, float %715, 8
  %753 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %752, float %716, 9
  %754 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %753, float %717, 10
  %755 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %754, float %718, 11
  %756 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %755, float %720, 12
  %757 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %756, float %721, 13
  %758 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %757, float %722, 14
  %759 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %758, float %723, 15
  %760 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %759, float %725, 16
  %761 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %760, float %726, 17
  %762 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %761, float %727, 18
  %763 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %762, float %728, 19
  %764 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %763, float %730, 20
  %765 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %764, float %731, 21
  %766 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %765, float %732, 22
  %767 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %766, float %733, 23
  %768 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %767, float %735, 24
  %769 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %768, float %736, 25
  %770 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %769, float %737, 26
  %771 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %770, float %738, 27
  %772 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %771, float %740, 28
  %773 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %772, float %741, 29
  %774 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %773, float %742, 30
  %775 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %774, float %743, 31
  %776 = add i32 %260, 1
  %777 = icmp slt i32 %776, 3
  %778 = select i1 %777, i32 %776, i32 0
  %scevgep258 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %216
  %scevgep262 = getelementptr i8, ptr addrspace(1) %lsr.iv260, i64 %216
  %scevgep266 = getelementptr i8, ptr addrspace(1) %lsr.iv264, i64 %216
  %scevgep270 = getelementptr i8, ptr addrspace(1) %lsr.iv268, i64 %216
  %scevgep274 = getelementptr i8, ptr addrspace(1) %lsr.iv272, i64 %216
  %scevgep278 = getelementptr i8, ptr addrspace(1) %lsr.iv276, i64 %216
  %scevgep282 = getelementptr i8, ptr addrspace(1) %lsr.iv280, i64 %216
  %scevgep286 = getelementptr i8, ptr addrspace(1) %lsr.iv284, i64 %216
  %779 = shl i32 %778, 13
  %780 = sext i32 %779 to i64
  %781 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %780
  tail call void @llvm.nvvm.barrier0()
  %782 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %80
  %783 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %85
  %784 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %90
  %785 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %95
  %786 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %100
  %787 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %105
  %788 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %110
  %789 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %781, i64 %115
  %790 = select i1 %263, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %782, ptr addrspace(1) %scevgep258, i32 %790) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %783, ptr addrspace(1) %scevgep262, i32 %790) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %784, ptr addrspace(1) %scevgep266, i32 %790) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %785, ptr addrspace(1) %scevgep270, i32 %790) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %786, ptr addrspace(1) %scevgep274, i32 %790) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %787, ptr addrspace(1) %scevgep278, i32 %790) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %788, ptr addrspace(1) %scevgep282, i32 %790) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %789, ptr addrspace(1) %scevgep286, i32 %790) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %791 = add i32 %259, 1
  %792 = icmp slt i32 %791, 3
  %793 = select i1 %792, i32 %791, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %794 = shl i32 %793, 13
  %795 = sext i32 %794 to i64
  %796 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %795
  %scevgep257 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep261 = getelementptr i8, ptr addrspace(1) %lsr.iv260, i64 256
  %scevgep265 = getelementptr i8, ptr addrspace(1) %lsr.iv264, i64 256
  %scevgep269 = getelementptr i8, ptr addrspace(1) %lsr.iv268, i64 256
  %scevgep273 = getelementptr i8, ptr addrspace(1) %lsr.iv272, i64 256
  %scevgep277 = getelementptr i8, ptr addrspace(1) %lsr.iv276, i64 256
  %scevgep281 = getelementptr i8, ptr addrspace(1) %lsr.iv280, i64 256
  %scevgep285 = getelementptr i8, ptr addrspace(1) %lsr.iv284, i64 256
  %797 = icmp samesign ult i32 %262, 1920
  br i1 %797, label %257, label %798

798:                                              ; preds = %257
  %799 = icmp ult i32 %10, 64
  %800 = and i32 %17, 56
  %801 = srem i32 %1, %5
  %802 = add nsw i32 %801, %3
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %803 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %705) #10
  %804 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %706) #10
  %805 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %707) #10
  %806 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %708) #10
  %807 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %710) #10
  %808 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %711) #10
  %809 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %712) #10
  %810 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %713) #10
  %811 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %715) #10
  %812 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %716) #10
  %813 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %717) #10
  %814 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %718) #10
  %815 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %720) #10
  %816 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %721) #10
  %817 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %722) #10
  %818 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %723) #10
  %819 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %725) #10
  %820 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %726) #10
  %821 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %727) #10
  %822 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %728) #10
  %823 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %730) #10
  %824 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %731) #10
  %825 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %732) #10
  %826 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %733) #10
  %827 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %735) #10
  %828 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %736) #10
  %829 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %737) #10
  %830 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %738) #10
  %831 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %740) #10
  %832 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %741) #10
  %833 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %742) #10
  %834 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %743) #10
  %835 = shl nsw i32 %802, 6
  %836 = sext i32 %835 to i64
  %837 = lshr i32 %10, 3
  %838 = and i32 %837, 7
  %839 = select i1 %799, i32 0, i32 8
  %840 = or disjoint i32 %838, %839
  %841 = or disjoint i32 %840, 16
  %842 = or disjoint i32 %840, 32
  %843 = or disjoint i32 %840, 48
  %844 = zext nneg i32 %840 to i64
  %845 = zext nneg i32 %841 to i64
  %846 = zext nneg i32 %842 to i64
  %847 = zext nneg i32 %843 to i64
  %848 = zext nneg i32 %800 to i64
  %849 = or disjoint i64 %836, %844
  %850 = or disjoint i64 %836, %845
  %851 = or disjoint i64 %836, %846
  %852 = or disjoint i64 %836, %847
  %853 = or disjoint i64 %9, %848
  %.idx = mul nsw i64 %849, 18432
  %854 = getelementptr i8, ptr addrspace(1) %arg1255, i64 %.idx
  %855 = getelementptr bfloat, ptr addrspace(1) %854, i64 %853
  %.idx4 = mul nsw i64 %850, 18432
  %856 = getelementptr i8, ptr addrspace(1) %arg1255, i64 %.idx4
  %857 = getelementptr bfloat, ptr addrspace(1) %856, i64 %853
  %.idx5 = mul nsw i64 %851, 18432
  %858 = getelementptr i8, ptr addrspace(1) %arg1255, i64 %.idx5
  %859 = getelementptr bfloat, ptr addrspace(1) %858, i64 %853
  %.idx6 = mul nsw i64 %852, 18432
  %860 = getelementptr i8, ptr addrspace(1) %arg1255, i64 %.idx6
  %861 = getelementptr bfloat, ptr addrspace(1) %860, i64 %853
  %862 = shl nuw nsw i32 %10, 1
  %863 = and i32 %862, 6
  %864 = shl nuw nsw i32 %10, 4
  %865 = and i32 %864, 192
  %866 = or disjoint i32 %865, %863
  %867 = shl nuw nsw i32 %20, 4
  %868 = or disjoint i32 %866, %867
  %869 = lshr exact i32 %21, 2
  %870 = or disjoint i32 %868, %869
  %871 = select i1 %799, i32 0, i32 1024
  %872 = or disjoint i32 %870, %871
  %873 = and i32 %17, 504
  %874 = select i1 %799, i32 0, i32 512
  %875 = or disjoint i32 %873, %874
  %876 = lshr i32 %872, 3
  %877 = and i32 %876, 536870904
  %878 = add nuw nsw i32 %877, %872
  %879 = zext nneg i32 %878 to i64
  %880 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %879
  %881 = bitcast bfloat %803 to i16
  %882 = bitcast bfloat %804 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %880, i16 %881, i16 %882, i1 true) #10
  %883 = or disjoint i32 %872, 512
  %884 = lshr i32 %883, 3
  %885 = and i32 %884, 536870904
  %886 = zext nneg i32 %885 to i64
  %887 = zext nneg i32 %872 to i64
  %888 = add i64 %886, %887
  %889 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %888
  %890 = getelementptr inbounds i8, ptr addrspace(3) %889, i64 1024
  %891 = bitcast bfloat %805 to i16
  %892 = bitcast bfloat %806 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %890, i16 %891, i16 %892, i1 true) #10
  %893 = zext nneg i32 %877 to i64
  %894 = add i64 %887, %893
  %895 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %894
  %896 = getelementptr inbounds i8, ptr addrspace(3) %895, i64 32
  %897 = bitcast bfloat %807 to i16
  %898 = bitcast bfloat %808 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %896, i16 %897, i16 %898, i1 true) #10
  %899 = or disjoint i32 %872, 528
  %900 = lshr i32 %899, 3
  %901 = and i32 %900, 536870904
  %902 = zext nneg i32 %901 to i64
  %903 = add i64 %902, %887
  %904 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %903
  %905 = getelementptr inbounds i8, ptr addrspace(3) %904, i64 1056
  %906 = bitcast bfloat %809 to i16
  %907 = bitcast bfloat %810 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %905, i16 %906, i16 %907, i1 true) #10
  %908 = getelementptr inbounds i8, ptr addrspace(3) %895, i64 64
  %909 = bitcast bfloat %811 to i16
  %910 = bitcast bfloat %812 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %908, i16 %909, i16 %910, i1 true) #10
  %911 = or disjoint i32 %872, 544
  %912 = lshr i32 %911, 3
  %913 = and i32 %912, 536870904
  %914 = zext nneg i32 %913 to i64
  %915 = add i64 %914, %887
  %916 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %915
  %917 = getelementptr inbounds i8, ptr addrspace(3) %916, i64 1088
  %918 = bitcast bfloat %813 to i16
  %919 = bitcast bfloat %814 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %917, i16 %918, i16 %919, i1 true) #10
  %920 = getelementptr inbounds i8, ptr addrspace(3) %895, i64 96
  %921 = bitcast bfloat %815 to i16
  %922 = bitcast bfloat %816 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %920, i16 %921, i16 %922, i1 true) #10
  %923 = or disjoint i32 %872, 560
  %924 = lshr i32 %923, 3
  %925 = and i32 %924, 536870904
  %926 = zext nneg i32 %925 to i64
  %927 = add i64 %926, %887
  %928 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %927
  %929 = getelementptr inbounds i8, ptr addrspace(3) %928, i64 1120
  %930 = bitcast bfloat %817 to i16
  %931 = bitcast bfloat %818 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %929, i16 %930, i16 %931, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %932 = lshr exact i32 %875, 3
  %933 = and i32 %932, 120
  %934 = add nuw nsw i32 %933, %875
  %935 = zext nneg i32 %934 to i64
  %936 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %935
  %937 = load <4 x i32>, ptr addrspace(3) %936, align 16
  %938 = or disjoint i32 %875, 1024
  %939 = lshr exact i32 %938, 3
  %940 = and i32 %939, 248
  %941 = zext nneg i32 %940 to i64
  %942 = zext nneg i32 %875 to i64
  %943 = add i64 %941, %942
  %944 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %943
  %945 = getelementptr inbounds i8, ptr addrspace(3) %944, i64 2048
  %946 = load <4 x i32>, ptr addrspace(3) %945, align 16
  tail call void @llvm.nvvm.barrier0()
  %947 = bitcast bfloat %819 to i16
  %948 = bitcast bfloat %820 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %880, i16 %947, i16 %948, i1 true) #10
  %949 = bitcast bfloat %821 to i16
  %950 = bitcast bfloat %822 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %890, i16 %949, i16 %950, i1 true) #10
  %951 = bitcast bfloat %823 to i16
  %952 = bitcast bfloat %824 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %896, i16 %951, i16 %952, i1 true) #10
  %953 = bitcast bfloat %825 to i16
  %954 = bitcast bfloat %826 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %905, i16 %953, i16 %954, i1 true) #10
  %955 = bitcast bfloat %827 to i16
  %956 = bitcast bfloat %828 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %908, i16 %955, i16 %956, i1 true) #10
  %957 = bitcast bfloat %829 to i16
  %958 = bitcast bfloat %830 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %917, i16 %957, i16 %958, i1 true) #10
  %959 = bitcast bfloat %831 to i16
  %960 = bitcast bfloat %832 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %920, i16 %959, i16 %960, i1 true) #10
  %961 = bitcast bfloat %833 to i16
  %962 = bitcast bfloat %834 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %929, i16 %961, i16 %962, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %963 = load <4 x i32>, ptr addrspace(3) %936, align 16
  %964 = load <4 x i32>, ptr addrspace(3) %945, align 16
  %.extract = extractelement <4 x i32> %937, i64 0
  %.extract54 = extractelement <4 x i32> %937, i64 1
  %.extract56 = extractelement <4 x i32> %937, i64 2
  %.extract58 = extractelement <4 x i32> %937, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract54, i32 %.extract56, i32 %.extract58, ptr addrspace(1) %855) #10
  %.extract60 = extractelement <4 x i32> %946, i64 0
  %.extract62 = extractelement <4 x i32> %946, i64 1
  %.extract64 = extractelement <4 x i32> %946, i64 2
  %.extract66 = extractelement <4 x i32> %946, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract60, i32 %.extract62, i32 %.extract64, i32 %.extract66, ptr addrspace(1) %857) #10
  %.extract68 = extractelement <4 x i32> %963, i64 0
  %.extract70 = extractelement <4 x i32> %963, i64 1
  %.extract72 = extractelement <4 x i32> %963, i64 2
  %.extract74 = extractelement <4 x i32> %963, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract68, i32 %.extract70, i32 %.extract72, i32 %.extract74, ptr addrspace(1) %859) #10
  %.extract76 = extractelement <4 x i32> %964, i64 0
  %.extract78 = extractelement <4 x i32> %964, i64 1
  %.extract80 = extractelement <4 x i32> %964, i64 2
  %.extract82 = extractelement <4 x i32> %964, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract76, i32 %.extract78, i32 %.extract80, i32 %.extract82, ptr addrspace(1) %861) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_123(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) local_unnamed_addr #6 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg25, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = fadd float %52, %106
  %123 = fadd float %53, %107
  %124 = fadd float %54, %108
  %125 = fadd float %55, %109
  %126 = fadd float %56, %110
  %127 = fadd float %57, %111
  %128 = fadd float %58, %112
  %129 = fadd float %59, %113
  %130 = fadd float %60, %114
  %131 = fadd float %61, %115
  %132 = fadd float %62, %116
  %133 = fadd float %63, %117
  %134 = fadd float %64, %118
  %135 = fadd float %65, %119
  %136 = fadd float %66, %120
  %137 = fadd float %67, %121
  %138 = fmul float %122, %122
  %139 = fmul float %123, %123
  %140 = fmul float %124, %124
  %141 = fmul float %125, %125
  %142 = fmul float %126, %126
  %143 = fmul float %127, %127
  %144 = fmul float %128, %128
  %145 = fmul float %129, %129
  %146 = fmul float %130, %130
  %147 = fmul float %131, %131
  %148 = fmul float %132, %132
  %149 = fmul float %133, %133
  %150 = fmul float %134, %134
  %151 = fmul float %135, %135
  %152 = fmul float %136, %136
  %153 = fmul float %137, %137
  %154 = fadd float %138, %139
  %155 = fadd float %154, %140
  %156 = fadd float %155, %141
  %157 = fadd float %156, %142
  %158 = fadd float %157, %143
  %159 = fadd float %158, %144
  %160 = fadd float %159, %145
  %161 = fadd float %160, %146
  %162 = fadd float %161, %147
  %163 = fadd float %162, %148
  %164 = fadd float %163, %149
  %165 = fadd float %164, %150
  %166 = fadd float %165, %151
  %167 = fadd float %166, %152
  %168 = fadd float %167, %153
  %169 = bitcast float %168 to i32
  %170 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %169, i32 16, i32 31)
  %171 = bitcast i32 %170 to float
  %172 = fadd float %168, %171
  %173 = bitcast float %172 to i32
  %174 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %173, i32 8, i32 31)
  %175 = bitcast i32 %174 to float
  %176 = fadd float %172, %175
  %177 = bitcast float %176 to i32
  %178 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %177, i32 4, i32 31)
  %179 = bitcast i32 %178 to float
  %180 = fadd float %176, %179
  %181 = bitcast float %180 to i32
  %182 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %181, i32 2, i32 31)
  %183 = bitcast i32 %182 to float
  %184 = fadd float %180, %183
  %185 = bitcast float %184 to i32
  %186 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %185, i32 1, i32 31)
  %187 = bitcast i32 %186 to float
  %188 = fadd float %184, %187
  %189 = icmp eq i32 %6, 0
  %190 = zext nneg i32 %7 to i64
  %191 = getelementptr float, ptr addrspace(3) @global_smem, i64 %190
  %192 = bitcast float %188 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %191, <1 x i32> %192, i1 %189) #10
  tail call void @llvm.nvvm.barrier0()
  %193 = icmp samesign ult i32 %5, 2
  %194 = zext nneg i32 %5 to i64
  %195 = getelementptr float, ptr addrspace(3) @global_smem, i64 %194
  %196 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %195, i1 %193) #10
  %197 = bitcast i32 %196 to float
  %198 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %196, i32 1, i32 31)
  %199 = bitcast i32 %198 to float
  %200 = fadd float %197, %199
  %201 = icmp eq i32 %5, 0
  %202 = bitcast float %200 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %195, <1 x i32> %202, i1 %201) #10
  tail call void @llvm.nvvm.barrier0()
  %203 = load float, ptr addrspace(3) @global_smem, align 16
  %204 = fmul float %203, 0x3F50000000000000
  %205 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %206 = bitcast i32 %205 to float
  %207 = fadd float %204, %206
  %208 = tail call float @llvm.nvvm.rsqrt.approx.f(float %207)
  %209 = fmul float %122, %208
  %210 = fmul float %123, %208
  %211 = fmul float %124, %208
  %212 = fmul float %125, %208
  %213 = fmul float %126, %208
  %214 = fmul float %127, %208
  %215 = fmul float %128, %208
  %216 = fmul float %129, %208
  %217 = fmul float %130, %208
  %218 = fmul float %131, %208
  %219 = fmul float %132, %208
  %220 = fmul float %133, %208
  %221 = fmul float %134, %208
  %222 = fmul float %135, %208
  %223 = fmul float %136, %208
  %224 = fmul float %137, %208
  %225 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %13
  %226 = getelementptr i8, ptr addrspace(1) %225, i64 1024
  %227 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %225) #10
  %228 = extractvalue { i32, i32, i32, i32 } %227, 0
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %227, 1
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %227, 2
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %227, 3
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractelement <2 x bfloat> %229, i64 0
  %237 = extractelement <2 x bfloat> %229, i64 1
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %226) #10
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = bitcast i32 %245 to <2 x bfloat>
  %247 = extractvalue { i32, i32, i32, i32 } %244, 1
  %248 = bitcast i32 %247 to <2 x bfloat>
  %249 = extractvalue { i32, i32, i32, i32 } %244, 2
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %244, 3
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractelement <2 x bfloat> %246, i64 0
  %254 = extractelement <2 x bfloat> %246, i64 1
  %255 = extractelement <2 x bfloat> %248, i64 0
  %256 = extractelement <2 x bfloat> %248, i64 1
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #10
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #10
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %253) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = fmul float %209, %261
  %278 = fmul float %210, %262
  %279 = fmul float %211, %263
  %280 = fmul float %212, %264
  %281 = fmul float %213, %265
  %282 = fmul float %214, %266
  %283 = fmul float %215, %267
  %284 = fmul float %216, %268
  %285 = fmul float %217, %269
  %286 = fmul float %218, %270
  %287 = fmul float %219, %271
  %288 = fmul float %220, %272
  %289 = fmul float %221, %273
  %290 = fmul float %222, %274
  %291 = fmul float %223, %275
  %292 = fmul float %224, %276
  %293 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %277) #10
  %294 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %278) #10
  %295 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %279) #10
  %296 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %280) #10
  %297 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %281) #10
  %298 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %282) #10
  %299 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %283) #10
  %300 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %284) #10
  %301 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %285) #10
  %302 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %286) #10
  %303 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %287) #10
  %304 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %288) #10
  %305 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %289) #10
  %306 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %290) #10
  %307 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %291) #10
  %308 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %292) #10
  %309 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %310 = getelementptr bfloat, ptr addrspace(1) %309, i64 %13
  %311 = getelementptr i8, ptr addrspace(1) %310, i64 1024
  %312 = insertelement <2 x bfloat> poison, bfloat %293, i64 0
  %313 = insertelement <2 x bfloat> %312, bfloat %294, i64 1
  %314 = bitcast <2 x bfloat> %313 to i32
  %315 = insertelement <2 x bfloat> poison, bfloat %295, i64 0
  %316 = insertelement <2 x bfloat> %315, bfloat %296, i64 1
  %317 = bitcast <2 x bfloat> %316 to i32
  %318 = insertelement <2 x bfloat> poison, bfloat %297, i64 0
  %319 = insertelement <2 x bfloat> %318, bfloat %298, i64 1
  %320 = bitcast <2 x bfloat> %319 to i32
  %321 = insertelement <2 x bfloat> poison, bfloat %299, i64 0
  %322 = insertelement <2 x bfloat> %321, bfloat %300, i64 1
  %323 = bitcast <2 x bfloat> %322 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %314, i32 %317, i32 %320, i32 %323, ptr addrspace(1) %310) #10
  %324 = insertelement <2 x bfloat> poison, bfloat %301, i64 0
  %325 = insertelement <2 x bfloat> %324, bfloat %302, i64 1
  %326 = bitcast <2 x bfloat> %325 to i32
  %327 = insertelement <2 x bfloat> poison, bfloat %303, i64 0
  %328 = insertelement <2 x bfloat> %327, bfloat %304, i64 1
  %329 = bitcast <2 x bfloat> %328 to i32
  %330 = insertelement <2 x bfloat> poison, bfloat %305, i64 0
  %331 = insertelement <2 x bfloat> %330, bfloat %306, i64 1
  %332 = bitcast <2 x bfloat> %331 to i32
  %333 = insertelement <2 x bfloat> poison, bfloat %307, i64 0
  %334 = insertelement <2 x bfloat> %333, bfloat %308, i64 1
  %335 = bitcast <2 x bfloat> %334 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %326, i32 %329, i32 %332, i32 %335, ptr addrspace(1) %311) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion_8(ptr noalias readonly align 128 captures(none) dereferenceable(786432) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(393216) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
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
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !6, !alias.scope !9
  %17 = fpext bfloat %16 to float
  %18 = fneg bfloat %16
  %19 = fpext bfloat %18 to float
  %20 = fmul float %19, 0x3FF7154760000000
  %21 = tail call float @llvm.nvvm.ex2.approx.f(float %20) #10
  %22 = fptrunc float %21 to bfloat
  %23 = fpext bfloat %22 to float
  %24 = fadd float %23, 1.000000e+00
  %25 = fdiv float 1.000000e+00, %24
  %26 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 6144
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !6, !alias.scope !12
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

define ptx_kernel void @fusion_122(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg25, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 14336
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 14336
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = extractelement <2 x bfloat> %134, i64 0
  %142 = extractelement <2 x bfloat> %134, i64 1
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %143, 1
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %143, 2
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %143, 3
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = extractelement <2 x bfloat> %151, i64 0
  %159 = extractelement <2 x bfloat> %151, i64 1
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = extractelement <2 x bfloat> %187, i64 0
  %195 = extractelement <2 x bfloat> %187, i64 1
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %196, 1
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %196, 2
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %196, 3
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = extractelement <2 x bfloat> %204, i64 0
  %212 = extractelement <2 x bfloat> %204, i64 1
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = fadd float %160, %213
  %230 = fadd float %161, %214
  %231 = fadd float %162, %215
  %232 = fadd float %163, %216
  %233 = fadd float %164, %217
  %234 = fadd float %165, %218
  %235 = fadd float %166, %219
  %236 = fadd float %167, %220
  %237 = fadd float %168, %221
  %238 = fadd float %169, %222
  %239 = fadd float %170, %223
  %240 = fadd float %171, %224
  %241 = fadd float %172, %225
  %242 = fadd float %173, %226
  %243 = fadd float %174, %227
  %244 = fadd float %175, %228
  %245 = fadd float %106, %229
  %246 = fadd float %107, %230
  %247 = fadd float %108, %231
  %248 = fadd float %109, %232
  %249 = fadd float %110, %233
  %250 = fadd float %111, %234
  %251 = fadd float %112, %235
  %252 = fadd float %113, %236
  %253 = fadd float %114, %237
  %254 = fadd float %115, %238
  %255 = fadd float %116, %239
  %256 = fadd float %117, %240
  %257 = fadd float %118, %241
  %258 = fadd float %119, %242
  %259 = fadd float %120, %243
  %260 = fadd float %121, %244
  %261 = fadd float %52, %245
  %262 = fadd float %53, %246
  %263 = fadd float %54, %247
  %264 = fadd float %55, %248
  %265 = fadd float %56, %249
  %266 = fadd float %57, %250
  %267 = fadd float %58, %251
  %268 = fadd float %59, %252
  %269 = fadd float %60, %253
  %270 = fadd float %61, %254
  %271 = fadd float %62, %255
  %272 = fadd float %63, %256
  %273 = fadd float %64, %257
  %274 = fadd float %65, %258
  %275 = fadd float %66, %259
  %276 = fadd float %67, %260
  %277 = fmul float %261, %261
  %278 = fmul float %262, %262
  %279 = fmul float %263, %263
  %280 = fmul float %264, %264
  %281 = fmul float %265, %265
  %282 = fmul float %266, %266
  %283 = fmul float %267, %267
  %284 = fmul float %268, %268
  %285 = fmul float %269, %269
  %286 = fmul float %270, %270
  %287 = fmul float %271, %271
  %288 = fmul float %272, %272
  %289 = fmul float %273, %273
  %290 = fmul float %274, %274
  %291 = fmul float %275, %275
  %292 = fmul float %276, %276
  %293 = fadd float %277, %278
  %294 = fadd float %293, %279
  %295 = fadd float %294, %280
  %296 = fadd float %295, %281
  %297 = fadd float %296, %282
  %298 = fadd float %297, %283
  %299 = fadd float %298, %284
  %300 = fadd float %299, %285
  %301 = fadd float %300, %286
  %302 = fadd float %301, %287
  %303 = fadd float %302, %288
  %304 = fadd float %303, %289
  %305 = fadd float %304, %290
  %306 = fadd float %305, %291
  %307 = fadd float %306, %292
  %308 = bitcast float %307 to i32
  %309 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %308, i32 16, i32 31)
  %310 = bitcast i32 %309 to float
  %311 = fadd float %307, %310
  %312 = bitcast float %311 to i32
  %313 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %312, i32 8, i32 31)
  %314 = bitcast i32 %313 to float
  %315 = fadd float %311, %314
  %316 = bitcast float %315 to i32
  %317 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %316, i32 4, i32 31)
  %318 = bitcast i32 %317 to float
  %319 = fadd float %315, %318
  %320 = bitcast float %319 to i32
  %321 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %320, i32 2, i32 31)
  %322 = bitcast i32 %321 to float
  %323 = fadd float %319, %322
  %324 = bitcast float %323 to i32
  %325 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %324, i32 1, i32 31)
  %326 = bitcast i32 %325 to float
  %327 = fadd float %323, %326
  %328 = icmp eq i32 %6, 0
  %329 = zext nneg i32 %7 to i64
  %330 = getelementptr float, ptr addrspace(3) @global_smem, i64 %329
  %331 = bitcast float %327 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %330, <1 x i32> %331, i1 %328) #10
  tail call void @llvm.nvvm.barrier0()
  %332 = icmp samesign ult i32 %5, 2
  %333 = zext nneg i32 %5 to i64
  %334 = getelementptr float, ptr addrspace(3) @global_smem, i64 %333
  %335 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %334, i1 %332) #10
  %336 = bitcast i32 %335 to float
  %337 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %335, i32 1, i32 31)
  %338 = bitcast i32 %337 to float
  %339 = fadd float %336, %338
  %340 = icmp eq i32 %5, 0
  %341 = bitcast float %339 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %334, <1 x i32> %341, i1 %340) #10
  tail call void @llvm.nvvm.barrier0()
  %342 = load float, ptr addrspace(3) @global_smem, align 16
  %343 = fmul float %342, 0x3F50000000000000
  %344 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %345 = bitcast i32 %344 to float
  %346 = fadd float %343, %345
  %347 = tail call float @llvm.nvvm.rsqrt.approx.f(float %346)
  %348 = fmul float %261, %347
  %349 = fmul float %262, %347
  %350 = fmul float %263, %347
  %351 = fmul float %264, %347
  %352 = fmul float %265, %347
  %353 = fmul float %266, %347
  %354 = fmul float %267, %347
  %355 = fmul float %268, %347
  %356 = fmul float %269, %347
  %357 = fmul float %270, %347
  %358 = fmul float %271, %347
  %359 = fmul float %272, %347
  %360 = fmul float %273, %347
  %361 = fmul float %274, %347
  %362 = fmul float %275, %347
  %363 = fmul float %276, %347
  %364 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %13
  %365 = getelementptr i8, ptr addrspace(1) %364, i64 1024
  %366 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %364) #10
  %367 = extractvalue { i32, i32, i32, i32 } %366, 0
  %368 = bitcast i32 %367 to <2 x bfloat>
  %369 = extractvalue { i32, i32, i32, i32 } %366, 1
  %370 = bitcast i32 %369 to <2 x bfloat>
  %371 = extractvalue { i32, i32, i32, i32 } %366, 2
  %372 = bitcast i32 %371 to <2 x bfloat>
  %373 = extractvalue { i32, i32, i32, i32 } %366, 3
  %374 = bitcast i32 %373 to <2 x bfloat>
  %375 = extractelement <2 x bfloat> %368, i64 0
  %376 = extractelement <2 x bfloat> %368, i64 1
  %377 = extractelement <2 x bfloat> %370, i64 0
  %378 = extractelement <2 x bfloat> %370, i64 1
  %379 = extractelement <2 x bfloat> %372, i64 0
  %380 = extractelement <2 x bfloat> %372, i64 1
  %381 = extractelement <2 x bfloat> %374, i64 0
  %382 = extractelement <2 x bfloat> %374, i64 1
  %383 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %365) #10
  %384 = extractvalue { i32, i32, i32, i32 } %383, 0
  %385 = bitcast i32 %384 to <2 x bfloat>
  %386 = extractvalue { i32, i32, i32, i32 } %383, 1
  %387 = bitcast i32 %386 to <2 x bfloat>
  %388 = extractvalue { i32, i32, i32, i32 } %383, 2
  %389 = bitcast i32 %388 to <2 x bfloat>
  %390 = extractvalue { i32, i32, i32, i32 } %383, 3
  %391 = bitcast i32 %390 to <2 x bfloat>
  %392 = extractelement <2 x bfloat> %385, i64 0
  %393 = extractelement <2 x bfloat> %385, i64 1
  %394 = extractelement <2 x bfloat> %387, i64 0
  %395 = extractelement <2 x bfloat> %387, i64 1
  %396 = extractelement <2 x bfloat> %389, i64 0
  %397 = extractelement <2 x bfloat> %389, i64 1
  %398 = extractelement <2 x bfloat> %391, i64 0
  %399 = extractelement <2 x bfloat> %391, i64 1
  %400 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %375) #10
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #10
  %402 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #10
  %403 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #10
  %404 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #10
  %405 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #10
  %406 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #10
  %407 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382) #10
  %408 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %392) #10
  %409 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393) #10
  %410 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394) #10
  %411 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %395) #10
  %412 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396) #10
  %413 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397) #10
  %414 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398) #10
  %415 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399) #10
  %416 = fmul float %348, %400
  %417 = fmul float %349, %401
  %418 = fmul float %350, %402
  %419 = fmul float %351, %403
  %420 = fmul float %352, %404
  %421 = fmul float %353, %405
  %422 = fmul float %354, %406
  %423 = fmul float %355, %407
  %424 = fmul float %356, %408
  %425 = fmul float %357, %409
  %426 = fmul float %358, %410
  %427 = fmul float %359, %411
  %428 = fmul float %360, %412
  %429 = fmul float %361, %413
  %430 = fmul float %362, %414
  %431 = fmul float %363, %415
  %432 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416) #10
  %433 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417) #10
  %434 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %418) #10
  %435 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %419) #10
  %436 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %420) #10
  %437 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %421) #10
  %438 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %422) #10
  %439 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %423) #10
  %440 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %424) #10
  %441 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %425) #10
  %442 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %426) #10
  %443 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %427) #10
  %444 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %428) #10
  %445 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %429) #10
  %446 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %430) #10
  %447 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %431) #10
  %448 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %449 = getelementptr bfloat, ptr addrspace(1) %448, i64 %13
  %450 = getelementptr i8, ptr addrspace(1) %449, i64 1024
  %451 = insertelement <2 x bfloat> poison, bfloat %432, i64 0
  %452 = insertelement <2 x bfloat> %451, bfloat %433, i64 1
  %453 = bitcast <2 x bfloat> %452 to i32
  %454 = insertelement <2 x bfloat> poison, bfloat %434, i64 0
  %455 = insertelement <2 x bfloat> %454, bfloat %435, i64 1
  %456 = bitcast <2 x bfloat> %455 to i32
  %457 = insertelement <2 x bfloat> poison, bfloat %436, i64 0
  %458 = insertelement <2 x bfloat> %457, bfloat %437, i64 1
  %459 = bitcast <2 x bfloat> %458 to i32
  %460 = insertelement <2 x bfloat> poison, bfloat %438, i64 0
  %461 = insertelement <2 x bfloat> %460, bfloat %439, i64 1
  %462 = bitcast <2 x bfloat> %461 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %453, i32 %456, i32 %459, i32 %462, ptr addrspace(1) %449) #10
  %463 = insertelement <2 x bfloat> poison, bfloat %440, i64 0
  %464 = insertelement <2 x bfloat> %463, bfloat %441, i64 1
  %465 = bitcast <2 x bfloat> %464 to i32
  %466 = insertelement <2 x bfloat> poison, bfloat %442, i64 0
  %467 = insertelement <2 x bfloat> %466, bfloat %443, i64 1
  %468 = bitcast <2 x bfloat> %467 to i32
  %469 = insertelement <2 x bfloat> poison, bfloat %444, i64 0
  %470 = insertelement <2 x bfloat> %469, bfloat %445, i64 1
  %471 = bitcast <2 x bfloat> %470 to i32
  %472 = insertelement <2 x bfloat> poison, bfloat %446, i64 0
  %473 = insertelement <2 x bfloat> %472, bfloat %447, i64 1
  %474 = bitcast <2 x bfloat> %473 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %465, i32 %468, i32 %471, i32 %474, ptr addrspace(1) %450) #10
  ret void
}

define ptx_kernel void @fusion_121(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 12288
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 12288
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 14336
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 14336
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = extractelement <2 x bfloat> %134, i64 0
  %142 = extractelement <2 x bfloat> %134, i64 1
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %143, 1
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %143, 2
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %143, 3
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = extractelement <2 x bfloat> %151, i64 0
  %159 = extractelement <2 x bfloat> %151, i64 1
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = extractelement <2 x bfloat> %187, i64 0
  %195 = extractelement <2 x bfloat> %187, i64 1
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %196, 1
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %196, 2
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %196, 3
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = extractelement <2 x bfloat> %204, i64 0
  %212 = extractelement <2 x bfloat> %204, i64 1
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %233, 1
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %233, 2
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %233, 3
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = extractelement <2 x bfloat> %239, i64 0
  %247 = extractelement <2 x bfloat> %239, i64 1
  %248 = extractelement <2 x bfloat> %241, i64 0
  %249 = extractelement <2 x bfloat> %241, i64 1
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %250, 1
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %250, 2
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractvalue { i32, i32, i32, i32 } %250, 3
  %258 = bitcast i32 %257 to <2 x bfloat>
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = extractelement <2 x bfloat> %256, i64 0
  %264 = extractelement <2 x bfloat> %256, i64 1
  %265 = extractelement <2 x bfloat> %258, i64 0
  %266 = extractelement <2 x bfloat> %258, i64 1
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
  %287 = extractvalue { i32, i32, i32, i32 } %286, 0
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %286, 1
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %286, 2
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %286, 3
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractelement <2 x bfloat> %288, i64 0
  %296 = extractelement <2 x bfloat> %288, i64 1
  %297 = extractelement <2 x bfloat> %290, i64 0
  %298 = extractelement <2 x bfloat> %290, i64 1
  %299 = extractelement <2 x bfloat> %292, i64 0
  %300 = extractelement <2 x bfloat> %292, i64 1
  %301 = extractelement <2 x bfloat> %294, i64 0
  %302 = extractelement <2 x bfloat> %294, i64 1
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %303, 1
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %303, 2
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %303, 3
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractelement <2 x bfloat> %305, i64 0
  %313 = extractelement <2 x bfloat> %305, i64 1
  %314 = extractelement <2 x bfloat> %307, i64 0
  %315 = extractelement <2 x bfloat> %307, i64 1
  %316 = extractelement <2 x bfloat> %309, i64 0
  %317 = extractelement <2 x bfloat> %309, i64 1
  %318 = extractelement <2 x bfloat> %311, i64 0
  %319 = extractelement <2 x bfloat> %311, i64 1
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = fadd float %267, %320
  %337 = fadd float %268, %321
  %338 = fadd float %269, %322
  %339 = fadd float %270, %323
  %340 = fadd float %271, %324
  %341 = fadd float %272, %325
  %342 = fadd float %273, %326
  %343 = fadd float %274, %327
  %344 = fadd float %275, %328
  %345 = fadd float %276, %329
  %346 = fadd float %277, %330
  %347 = fadd float %278, %331
  %348 = fadd float %279, %332
  %349 = fadd float %280, %333
  %350 = fadd float %281, %334
  %351 = fadd float %282, %335
  %352 = fadd float %213, %336
  %353 = fadd float %214, %337
  %354 = fadd float %215, %338
  %355 = fadd float %216, %339
  %356 = fadd float %217, %340
  %357 = fadd float %218, %341
  %358 = fadd float %219, %342
  %359 = fadd float %220, %343
  %360 = fadd float %221, %344
  %361 = fadd float %222, %345
  %362 = fadd float %223, %346
  %363 = fadd float %224, %347
  %364 = fadd float %225, %348
  %365 = fadd float %226, %349
  %366 = fadd float %227, %350
  %367 = fadd float %228, %351
  %368 = fadd float %160, %352
  %369 = fadd float %161, %353
  %370 = fadd float %162, %354
  %371 = fadd float %163, %355
  %372 = fadd float %164, %356
  %373 = fadd float %165, %357
  %374 = fadd float %166, %358
  %375 = fadd float %167, %359
  %376 = fadd float %168, %360
  %377 = fadd float %169, %361
  %378 = fadd float %170, %362
  %379 = fadd float %171, %363
  %380 = fadd float %172, %364
  %381 = fadd float %173, %365
  %382 = fadd float %174, %366
  %383 = fadd float %175, %367
  %384 = fadd float %106, %368
  %385 = fadd float %107, %369
  %386 = fadd float %108, %370
  %387 = fadd float %109, %371
  %388 = fadd float %110, %372
  %389 = fadd float %111, %373
  %390 = fadd float %112, %374
  %391 = fadd float %113, %375
  %392 = fadd float %114, %376
  %393 = fadd float %115, %377
  %394 = fadd float %116, %378
  %395 = fadd float %117, %379
  %396 = fadd float %118, %380
  %397 = fadd float %119, %381
  %398 = fadd float %120, %382
  %399 = fadd float %121, %383
  %400 = fadd float %52, %384
  %401 = fadd float %53, %385
  %402 = fadd float %54, %386
  %403 = fadd float %55, %387
  %404 = fadd float %56, %388
  %405 = fadd float %57, %389
  %406 = fadd float %58, %390
  %407 = fadd float %59, %391
  %408 = fadd float %60, %392
  %409 = fadd float %61, %393
  %410 = fadd float %62, %394
  %411 = fadd float %63, %395
  %412 = fadd float %64, %396
  %413 = fadd float %65, %397
  %414 = fadd float %66, %398
  %415 = fadd float %67, %399
  %416 = fmul float %400, %400
  %417 = fmul float %401, %401
  %418 = fmul float %402, %402
  %419 = fmul float %403, %403
  %420 = fmul float %404, %404
  %421 = fmul float %405, %405
  %422 = fmul float %406, %406
  %423 = fmul float %407, %407
  %424 = fmul float %408, %408
  %425 = fmul float %409, %409
  %426 = fmul float %410, %410
  %427 = fmul float %411, %411
  %428 = fmul float %412, %412
  %429 = fmul float %413, %413
  %430 = fmul float %414, %414
  %431 = fmul float %415, %415
  %432 = fadd float %416, %417
  %433 = fadd float %432, %418
  %434 = fadd float %433, %419
  %435 = fadd float %434, %420
  %436 = fadd float %435, %421
  %437 = fadd float %436, %422
  %438 = fadd float %437, %423
  %439 = fadd float %438, %424
  %440 = fadd float %439, %425
  %441 = fadd float %440, %426
  %442 = fadd float %441, %427
  %443 = fadd float %442, %428
  %444 = fadd float %443, %429
  %445 = fadd float %444, %430
  %446 = fadd float %445, %431
  %447 = bitcast float %446 to i32
  %448 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %447, i32 16, i32 31)
  %449 = bitcast i32 %448 to float
  %450 = fadd float %446, %449
  %451 = bitcast float %450 to i32
  %452 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %451, i32 8, i32 31)
  %453 = bitcast i32 %452 to float
  %454 = fadd float %450, %453
  %455 = bitcast float %454 to i32
  %456 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %455, i32 4, i32 31)
  %457 = bitcast i32 %456 to float
  %458 = fadd float %454, %457
  %459 = bitcast float %458 to i32
  %460 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %459, i32 2, i32 31)
  %461 = bitcast i32 %460 to float
  %462 = fadd float %458, %461
  %463 = bitcast float %462 to i32
  %464 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %463, i32 1, i32 31)
  %465 = bitcast i32 %464 to float
  %466 = fadd float %462, %465
  %467 = icmp eq i32 %6, 0
  %468 = zext nneg i32 %7 to i64
  %469 = getelementptr float, ptr addrspace(3) @global_smem, i64 %468
  %470 = bitcast float %466 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %469, <1 x i32> %470, i1 %467) #10
  tail call void @llvm.nvvm.barrier0()
  %471 = icmp samesign ult i32 %5, 2
  %472 = zext nneg i32 %5 to i64
  %473 = getelementptr float, ptr addrspace(3) @global_smem, i64 %472
  %474 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %473, i1 %471) #10
  %475 = bitcast i32 %474 to float
  %476 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %474, i32 1, i32 31)
  %477 = bitcast i32 %476 to float
  %478 = fadd float %475, %477
  %479 = icmp eq i32 %5, 0
  %480 = bitcast float %478 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %473, <1 x i32> %480, i1 %479) #10
  tail call void @llvm.nvvm.barrier0()
  %481 = load float, ptr addrspace(3) @global_smem, align 16
  %482 = fmul float %481, 0x3F50000000000000
  %483 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %484 = bitcast i32 %483 to float
  %485 = fadd float %482, %484
  %486 = tail call float @llvm.nvvm.rsqrt.approx.f(float %485)
  %487 = fmul float %400, %486
  %488 = fmul float %401, %486
  %489 = fmul float %402, %486
  %490 = fmul float %403, %486
  %491 = fmul float %404, %486
  %492 = fmul float %405, %486
  %493 = fmul float %406, %486
  %494 = fmul float %407, %486
  %495 = fmul float %408, %486
  %496 = fmul float %409, %486
  %497 = fmul float %410, %486
  %498 = fmul float %411, %486
  %499 = fmul float %412, %486
  %500 = fmul float %413, %486
  %501 = fmul float %414, %486
  %502 = fmul float %415, %486
  %503 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %504 = getelementptr i8, ptr addrspace(1) %503, i64 1024
  %505 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %503) #10
  %506 = extractvalue { i32, i32, i32, i32 } %505, 0
  %507 = bitcast i32 %506 to <2 x bfloat>
  %508 = extractvalue { i32, i32, i32, i32 } %505, 1
  %509 = bitcast i32 %508 to <2 x bfloat>
  %510 = extractvalue { i32, i32, i32, i32 } %505, 2
  %511 = bitcast i32 %510 to <2 x bfloat>
  %512 = extractvalue { i32, i32, i32, i32 } %505, 3
  %513 = bitcast i32 %512 to <2 x bfloat>
  %514 = extractelement <2 x bfloat> %507, i64 0
  %515 = extractelement <2 x bfloat> %507, i64 1
  %516 = extractelement <2 x bfloat> %509, i64 0
  %517 = extractelement <2 x bfloat> %509, i64 1
  %518 = extractelement <2 x bfloat> %511, i64 0
  %519 = extractelement <2 x bfloat> %511, i64 1
  %520 = extractelement <2 x bfloat> %513, i64 0
  %521 = extractelement <2 x bfloat> %513, i64 1
  %522 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %504) #10
  %523 = extractvalue { i32, i32, i32, i32 } %522, 0
  %524 = bitcast i32 %523 to <2 x bfloat>
  %525 = extractvalue { i32, i32, i32, i32 } %522, 1
  %526 = bitcast i32 %525 to <2 x bfloat>
  %527 = extractvalue { i32, i32, i32, i32 } %522, 2
  %528 = bitcast i32 %527 to <2 x bfloat>
  %529 = extractvalue { i32, i32, i32, i32 } %522, 3
  %530 = bitcast i32 %529 to <2 x bfloat>
  %531 = extractelement <2 x bfloat> %524, i64 0
  %532 = extractelement <2 x bfloat> %524, i64 1
  %533 = extractelement <2 x bfloat> %526, i64 0
  %534 = extractelement <2 x bfloat> %526, i64 1
  %535 = extractelement <2 x bfloat> %528, i64 0
  %536 = extractelement <2 x bfloat> %528, i64 1
  %537 = extractelement <2 x bfloat> %530, i64 0
  %538 = extractelement <2 x bfloat> %530, i64 1
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #10
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #10
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #10
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #10
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #10
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #10
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #10
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #10
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #10
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #10
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #10
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #10
  %552 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %536) #10
  %553 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %537) #10
  %554 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %538) #10
  %555 = fmul float %487, %539
  %556 = fmul float %488, %540
  %557 = fmul float %489, %541
  %558 = fmul float %490, %542
  %559 = fmul float %491, %543
  %560 = fmul float %492, %544
  %561 = fmul float %493, %545
  %562 = fmul float %494, %546
  %563 = fmul float %495, %547
  %564 = fmul float %496, %548
  %565 = fmul float %497, %549
  %566 = fmul float %498, %550
  %567 = fmul float %499, %551
  %568 = fmul float %500, %552
  %569 = fmul float %501, %553
  %570 = fmul float %502, %554
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #10
  %572 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %556) #10
  %573 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %557) #10
  %574 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %558) #10
  %575 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %559) #10
  %576 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %560) #10
  %577 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %561) #10
  %578 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %562) #10
  %579 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %563) #10
  %580 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %564) #10
  %581 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %565) #10
  %582 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %566) #10
  %583 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %567) #10
  %584 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %568) #10
  %585 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %569) #10
  %586 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %570) #10
  %587 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %588 = getelementptr bfloat, ptr addrspace(1) %587, i64 %13
  %589 = getelementptr i8, ptr addrspace(1) %588, i64 1024
  %590 = insertelement <2 x bfloat> poison, bfloat %571, i64 0
  %591 = insertelement <2 x bfloat> %590, bfloat %572, i64 1
  %592 = bitcast <2 x bfloat> %591 to i32
  %593 = insertelement <2 x bfloat> poison, bfloat %573, i64 0
  %594 = insertelement <2 x bfloat> %593, bfloat %574, i64 1
  %595 = bitcast <2 x bfloat> %594 to i32
  %596 = insertelement <2 x bfloat> poison, bfloat %575, i64 0
  %597 = insertelement <2 x bfloat> %596, bfloat %576, i64 1
  %598 = bitcast <2 x bfloat> %597 to i32
  %599 = insertelement <2 x bfloat> poison, bfloat %577, i64 0
  %600 = insertelement <2 x bfloat> %599, bfloat %578, i64 1
  %601 = bitcast <2 x bfloat> %600 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %592, i32 %595, i32 %598, i32 %601, ptr addrspace(1) %588) #10
  %602 = insertelement <2 x bfloat> poison, bfloat %579, i64 0
  %603 = insertelement <2 x bfloat> %602, bfloat %580, i64 1
  %604 = bitcast <2 x bfloat> %603 to i32
  %605 = insertelement <2 x bfloat> poison, bfloat %581, i64 0
  %606 = insertelement <2 x bfloat> %605, bfloat %582, i64 1
  %607 = bitcast <2 x bfloat> %606 to i32
  %608 = insertelement <2 x bfloat> poison, bfloat %583, i64 0
  %609 = insertelement <2 x bfloat> %608, bfloat %584, i64 1
  %610 = bitcast <2 x bfloat> %609 to i32
  %611 = insertelement <2 x bfloat> poison, bfloat %585, i64 0
  %612 = insertelement <2 x bfloat> %611, bfloat %586, i64 1
  %613 = bitcast <2 x bfloat> %612 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %604, i32 %607, i32 %610, i32 %613, ptr addrspace(1) %589) #10
  ret void
}

define ptx_kernel void @fusion_120(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg25, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 12288
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 12288
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = extractelement <2 x bfloat> %134, i64 0
  %142 = extractelement <2 x bfloat> %134, i64 1
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %143, 1
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %143, 2
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %143, 3
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = extractelement <2 x bfloat> %151, i64 0
  %159 = extractelement <2 x bfloat> %151, i64 1
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = extractelement <2 x bfloat> %187, i64 0
  %195 = extractelement <2 x bfloat> %187, i64 1
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %196, 1
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %196, 2
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %196, 3
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = extractelement <2 x bfloat> %204, i64 0
  %212 = extractelement <2 x bfloat> %204, i64 1
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 14336
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 14336
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %233, 1
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %233, 2
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %233, 3
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = extractelement <2 x bfloat> %239, i64 0
  %247 = extractelement <2 x bfloat> %239, i64 1
  %248 = extractelement <2 x bfloat> %241, i64 0
  %249 = extractelement <2 x bfloat> %241, i64 1
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %250, 1
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %250, 2
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractvalue { i32, i32, i32, i32 } %250, 3
  %258 = bitcast i32 %257 to <2 x bfloat>
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = extractelement <2 x bfloat> %256, i64 0
  %264 = extractelement <2 x bfloat> %256, i64 1
  %265 = extractelement <2 x bfloat> %258, i64 0
  %266 = extractelement <2 x bfloat> %258, i64 1
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
  %287 = extractvalue { i32, i32, i32, i32 } %286, 0
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %286, 1
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %286, 2
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %286, 3
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractelement <2 x bfloat> %288, i64 0
  %296 = extractelement <2 x bfloat> %288, i64 1
  %297 = extractelement <2 x bfloat> %290, i64 0
  %298 = extractelement <2 x bfloat> %290, i64 1
  %299 = extractelement <2 x bfloat> %292, i64 0
  %300 = extractelement <2 x bfloat> %292, i64 1
  %301 = extractelement <2 x bfloat> %294, i64 0
  %302 = extractelement <2 x bfloat> %294, i64 1
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %303, 1
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %303, 2
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %303, 3
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractelement <2 x bfloat> %305, i64 0
  %313 = extractelement <2 x bfloat> %305, i64 1
  %314 = extractelement <2 x bfloat> %307, i64 0
  %315 = extractelement <2 x bfloat> %307, i64 1
  %316 = extractelement <2 x bfloat> %309, i64 0
  %317 = extractelement <2 x bfloat> %309, i64 1
  %318 = extractelement <2 x bfloat> %311, i64 0
  %319 = extractelement <2 x bfloat> %311, i64 1
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %337 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %338 = getelementptr bfloat, ptr addrspace(1) %336, i64 %13
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 1024
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %341 = extractvalue { i32, i32, i32, i32 } %340, 0
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %340, 1
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %340, 2
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractvalue { i32, i32, i32, i32 } %340, 3
  %348 = bitcast i32 %347 to <2 x bfloat>
  %349 = extractelement <2 x bfloat> %342, i64 0
  %350 = extractelement <2 x bfloat> %342, i64 1
  %351 = extractelement <2 x bfloat> %344, i64 0
  %352 = extractelement <2 x bfloat> %344, i64 1
  %353 = extractelement <2 x bfloat> %346, i64 0
  %354 = extractelement <2 x bfloat> %346, i64 1
  %355 = extractelement <2 x bfloat> %348, i64 0
  %356 = extractelement <2 x bfloat> %348, i64 1
  %357 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
  %358 = extractvalue { i32, i32, i32, i32 } %357, 0
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %357, 1
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %357, 2
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractvalue { i32, i32, i32, i32 } %357, 3
  %365 = bitcast i32 %364 to <2 x bfloat>
  %366 = extractelement <2 x bfloat> %359, i64 0
  %367 = extractelement <2 x bfloat> %359, i64 1
  %368 = extractelement <2 x bfloat> %361, i64 0
  %369 = extractelement <2 x bfloat> %361, i64 1
  %370 = extractelement <2 x bfloat> %363, i64 0
  %371 = extractelement <2 x bfloat> %363, i64 1
  %372 = extractelement <2 x bfloat> %365, i64 0
  %373 = extractelement <2 x bfloat> %365, i64 1
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #10
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372) #10
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #10
  %390 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %391 = getelementptr bfloat, ptr addrspace(1) %390, i64 %13
  %392 = getelementptr i8, ptr addrspace(1) %391, i64 1024
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %391) #10
  %394 = extractvalue { i32, i32, i32, i32 } %393, 0
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %393, 1
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %393, 2
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractvalue { i32, i32, i32, i32 } %393, 3
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = extractelement <2 x bfloat> %401, i64 0
  %409 = extractelement <2 x bfloat> %401, i64 1
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %392) #10
  %411 = extractvalue { i32, i32, i32, i32 } %410, 0
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %410, 1
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %410, 2
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractvalue { i32, i32, i32, i32 } %410, 3
  %418 = bitcast i32 %417 to <2 x bfloat>
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = extractelement <2 x bfloat> %418, i64 0
  %426 = extractelement <2 x bfloat> %418, i64 1
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425) #10
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426) #10
  %443 = fadd float %374, %427
  %444 = fadd float %375, %428
  %445 = fadd float %376, %429
  %446 = fadd float %377, %430
  %447 = fadd float %378, %431
  %448 = fadd float %379, %432
  %449 = fadd float %380, %433
  %450 = fadd float %381, %434
  %451 = fadd float %382, %435
  %452 = fadd float %383, %436
  %453 = fadd float %384, %437
  %454 = fadd float %385, %438
  %455 = fadd float %386, %439
  %456 = fadd float %387, %440
  %457 = fadd float %388, %441
  %458 = fadd float %389, %442
  %459 = fadd float %320, %443
  %460 = fadd float %321, %444
  %461 = fadd float %322, %445
  %462 = fadd float %323, %446
  %463 = fadd float %324, %447
  %464 = fadd float %325, %448
  %465 = fadd float %326, %449
  %466 = fadd float %327, %450
  %467 = fadd float %328, %451
  %468 = fadd float %329, %452
  %469 = fadd float %330, %453
  %470 = fadd float %331, %454
  %471 = fadd float %332, %455
  %472 = fadd float %333, %456
  %473 = fadd float %334, %457
  %474 = fadd float %335, %458
  %475 = fadd float %267, %459
  %476 = fadd float %268, %460
  %477 = fadd float %269, %461
  %478 = fadd float %270, %462
  %479 = fadd float %271, %463
  %480 = fadd float %272, %464
  %481 = fadd float %273, %465
  %482 = fadd float %274, %466
  %483 = fadd float %275, %467
  %484 = fadd float %276, %468
  %485 = fadd float %277, %469
  %486 = fadd float %278, %470
  %487 = fadd float %279, %471
  %488 = fadd float %280, %472
  %489 = fadd float %281, %473
  %490 = fadd float %282, %474
  %491 = fadd float %213, %475
  %492 = fadd float %214, %476
  %493 = fadd float %215, %477
  %494 = fadd float %216, %478
  %495 = fadd float %217, %479
  %496 = fadd float %218, %480
  %497 = fadd float %219, %481
  %498 = fadd float %220, %482
  %499 = fadd float %221, %483
  %500 = fadd float %222, %484
  %501 = fadd float %223, %485
  %502 = fadd float %224, %486
  %503 = fadd float %225, %487
  %504 = fadd float %226, %488
  %505 = fadd float %227, %489
  %506 = fadd float %228, %490
  %507 = fadd float %160, %491
  %508 = fadd float %161, %492
  %509 = fadd float %162, %493
  %510 = fadd float %163, %494
  %511 = fadd float %164, %495
  %512 = fadd float %165, %496
  %513 = fadd float %166, %497
  %514 = fadd float %167, %498
  %515 = fadd float %168, %499
  %516 = fadd float %169, %500
  %517 = fadd float %170, %501
  %518 = fadd float %171, %502
  %519 = fadd float %172, %503
  %520 = fadd float %173, %504
  %521 = fadd float %174, %505
  %522 = fadd float %175, %506
  %523 = fadd float %106, %507
  %524 = fadd float %107, %508
  %525 = fadd float %108, %509
  %526 = fadd float %109, %510
  %527 = fadd float %110, %511
  %528 = fadd float %111, %512
  %529 = fadd float %112, %513
  %530 = fadd float %113, %514
  %531 = fadd float %114, %515
  %532 = fadd float %115, %516
  %533 = fadd float %116, %517
  %534 = fadd float %117, %518
  %535 = fadd float %118, %519
  %536 = fadd float %119, %520
  %537 = fadd float %120, %521
  %538 = fadd float %121, %522
  %539 = fadd float %52, %523
  %540 = fadd float %53, %524
  %541 = fadd float %54, %525
  %542 = fadd float %55, %526
  %543 = fadd float %56, %527
  %544 = fadd float %57, %528
  %545 = fadd float %58, %529
  %546 = fadd float %59, %530
  %547 = fadd float %60, %531
  %548 = fadd float %61, %532
  %549 = fadd float %62, %533
  %550 = fadd float %63, %534
  %551 = fadd float %64, %535
  %552 = fadd float %65, %536
  %553 = fadd float %66, %537
  %554 = fadd float %67, %538
  %555 = fmul float %539, %539
  %556 = fmul float %540, %540
  %557 = fmul float %541, %541
  %558 = fmul float %542, %542
  %559 = fmul float %543, %543
  %560 = fmul float %544, %544
  %561 = fmul float %545, %545
  %562 = fmul float %546, %546
  %563 = fmul float %547, %547
  %564 = fmul float %548, %548
  %565 = fmul float %549, %549
  %566 = fmul float %550, %550
  %567 = fmul float %551, %551
  %568 = fmul float %552, %552
  %569 = fmul float %553, %553
  %570 = fmul float %554, %554
  %571 = fadd float %555, %556
  %572 = fadd float %571, %557
  %573 = fadd float %572, %558
  %574 = fadd float %573, %559
  %575 = fadd float %574, %560
  %576 = fadd float %575, %561
  %577 = fadd float %576, %562
  %578 = fadd float %577, %563
  %579 = fadd float %578, %564
  %580 = fadd float %579, %565
  %581 = fadd float %580, %566
  %582 = fadd float %581, %567
  %583 = fadd float %582, %568
  %584 = fadd float %583, %569
  %585 = fadd float %584, %570
  %586 = bitcast float %585 to i32
  %587 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %586, i32 16, i32 31)
  %588 = bitcast i32 %587 to float
  %589 = fadd float %585, %588
  %590 = bitcast float %589 to i32
  %591 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %590, i32 8, i32 31)
  %592 = bitcast i32 %591 to float
  %593 = fadd float %589, %592
  %594 = bitcast float %593 to i32
  %595 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %594, i32 4, i32 31)
  %596 = bitcast i32 %595 to float
  %597 = fadd float %593, %596
  %598 = bitcast float %597 to i32
  %599 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %598, i32 2, i32 31)
  %600 = bitcast i32 %599 to float
  %601 = fadd float %597, %600
  %602 = bitcast float %601 to i32
  %603 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %602, i32 1, i32 31)
  %604 = bitcast i32 %603 to float
  %605 = fadd float %601, %604
  %606 = icmp eq i32 %6, 0
  %607 = zext nneg i32 %7 to i64
  %608 = getelementptr float, ptr addrspace(3) @global_smem, i64 %607
  %609 = bitcast float %605 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %608, <1 x i32> %609, i1 %606) #10
  tail call void @llvm.nvvm.barrier0()
  %610 = icmp samesign ult i32 %5, 2
  %611 = zext nneg i32 %5 to i64
  %612 = getelementptr float, ptr addrspace(3) @global_smem, i64 %611
  %613 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %612, i1 %610) #10
  %614 = bitcast i32 %613 to float
  %615 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %613, i32 1, i32 31)
  %616 = bitcast i32 %615 to float
  %617 = fadd float %614, %616
  %618 = icmp eq i32 %5, 0
  %619 = bitcast float %617 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %612, <1 x i32> %619, i1 %618) #10
  tail call void @llvm.nvvm.barrier0()
  %620 = load float, ptr addrspace(3) @global_smem, align 16
  %621 = fmul float %620, 0x3F50000000000000
  %622 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %623 = bitcast i32 %622 to float
  %624 = fadd float %621, %623
  %625 = tail call float @llvm.nvvm.rsqrt.approx.f(float %624)
  %626 = fmul float %539, %625
  %627 = fmul float %540, %625
  %628 = fmul float %541, %625
  %629 = fmul float %542, %625
  %630 = fmul float %543, %625
  %631 = fmul float %544, %625
  %632 = fmul float %545, %625
  %633 = fmul float %546, %625
  %634 = fmul float %547, %625
  %635 = fmul float %548, %625
  %636 = fmul float %549, %625
  %637 = fmul float %550, %625
  %638 = fmul float %551, %625
  %639 = fmul float %552, %625
  %640 = fmul float %553, %625
  %641 = fmul float %554, %625
  %642 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %13
  %643 = getelementptr i8, ptr addrspace(1) %642, i64 1024
  %644 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %642) #10
  %645 = extractvalue { i32, i32, i32, i32 } %644, 0
  %646 = bitcast i32 %645 to <2 x bfloat>
  %647 = extractvalue { i32, i32, i32, i32 } %644, 1
  %648 = bitcast i32 %647 to <2 x bfloat>
  %649 = extractvalue { i32, i32, i32, i32 } %644, 2
  %650 = bitcast i32 %649 to <2 x bfloat>
  %651 = extractvalue { i32, i32, i32, i32 } %644, 3
  %652 = bitcast i32 %651 to <2 x bfloat>
  %653 = extractelement <2 x bfloat> %646, i64 0
  %654 = extractelement <2 x bfloat> %646, i64 1
  %655 = extractelement <2 x bfloat> %648, i64 0
  %656 = extractelement <2 x bfloat> %648, i64 1
  %657 = extractelement <2 x bfloat> %650, i64 0
  %658 = extractelement <2 x bfloat> %650, i64 1
  %659 = extractelement <2 x bfloat> %652, i64 0
  %660 = extractelement <2 x bfloat> %652, i64 1
  %661 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %643) #10
  %662 = extractvalue { i32, i32, i32, i32 } %661, 0
  %663 = bitcast i32 %662 to <2 x bfloat>
  %664 = extractvalue { i32, i32, i32, i32 } %661, 1
  %665 = bitcast i32 %664 to <2 x bfloat>
  %666 = extractvalue { i32, i32, i32, i32 } %661, 2
  %667 = bitcast i32 %666 to <2 x bfloat>
  %668 = extractvalue { i32, i32, i32, i32 } %661, 3
  %669 = bitcast i32 %668 to <2 x bfloat>
  %670 = extractelement <2 x bfloat> %663, i64 0
  %671 = extractelement <2 x bfloat> %663, i64 1
  %672 = extractelement <2 x bfloat> %665, i64 0
  %673 = extractelement <2 x bfloat> %665, i64 1
  %674 = extractelement <2 x bfloat> %667, i64 0
  %675 = extractelement <2 x bfloat> %667, i64 1
  %676 = extractelement <2 x bfloat> %669, i64 0
  %677 = extractelement <2 x bfloat> %669, i64 1
  %678 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653) #10
  %679 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654) #10
  %680 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655) #10
  %681 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656) #10
  %682 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %657) #10
  %683 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658) #10
  %684 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %659) #10
  %685 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %660) #10
  %686 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670) #10
  %687 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671) #10
  %688 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672) #10
  %689 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673) #10
  %690 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %674) #10
  %691 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %675) #10
  %692 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %676) #10
  %693 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %677) #10
  %694 = fmul float %626, %678
  %695 = fmul float %627, %679
  %696 = fmul float %628, %680
  %697 = fmul float %629, %681
  %698 = fmul float %630, %682
  %699 = fmul float %631, %683
  %700 = fmul float %632, %684
  %701 = fmul float %633, %685
  %702 = fmul float %634, %686
  %703 = fmul float %635, %687
  %704 = fmul float %636, %688
  %705 = fmul float %637, %689
  %706 = fmul float %638, %690
  %707 = fmul float %639, %691
  %708 = fmul float %640, %692
  %709 = fmul float %641, %693
  %710 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %694) #10
  %711 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695) #10
  %712 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696) #10
  %713 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697) #10
  %714 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %698) #10
  %715 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %699) #10
  %716 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %700) #10
  %717 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %701) #10
  %718 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %702) #10
  %719 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %703) #10
  %720 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %704) #10
  %721 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %705) #10
  %722 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %706) #10
  %723 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %707) #10
  %724 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %708) #10
  %725 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %709) #10
  %726 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %727 = getelementptr bfloat, ptr addrspace(1) %726, i64 %13
  %728 = getelementptr i8, ptr addrspace(1) %727, i64 1024
  %729 = insertelement <2 x bfloat> poison, bfloat %710, i64 0
  %730 = insertelement <2 x bfloat> %729, bfloat %711, i64 1
  %731 = bitcast <2 x bfloat> %730 to i32
  %732 = insertelement <2 x bfloat> poison, bfloat %712, i64 0
  %733 = insertelement <2 x bfloat> %732, bfloat %713, i64 1
  %734 = bitcast <2 x bfloat> %733 to i32
  %735 = insertelement <2 x bfloat> poison, bfloat %714, i64 0
  %736 = insertelement <2 x bfloat> %735, bfloat %715, i64 1
  %737 = bitcast <2 x bfloat> %736 to i32
  %738 = insertelement <2 x bfloat> poison, bfloat %716, i64 0
  %739 = insertelement <2 x bfloat> %738, bfloat %717, i64 1
  %740 = bitcast <2 x bfloat> %739 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %731, i32 %734, i32 %737, i32 %740, ptr addrspace(1) %727) #10
  %741 = insertelement <2 x bfloat> poison, bfloat %718, i64 0
  %742 = insertelement <2 x bfloat> %741, bfloat %719, i64 1
  %743 = bitcast <2 x bfloat> %742 to i32
  %744 = insertelement <2 x bfloat> poison, bfloat %720, i64 0
  %745 = insertelement <2 x bfloat> %744, bfloat %721, i64 1
  %746 = bitcast <2 x bfloat> %745 to i32
  %747 = insertelement <2 x bfloat> poison, bfloat %722, i64 0
  %748 = insertelement <2 x bfloat> %747, bfloat %723, i64 1
  %749 = bitcast <2 x bfloat> %748 to i32
  %750 = insertelement <2 x bfloat> poison, bfloat %724, i64 0
  %751 = insertelement <2 x bfloat> %750, bfloat %725, i64 1
  %752 = bitcast <2 x bfloat> %751 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %743, i32 %746, i32 %749, i32 %752, ptr addrspace(1) %728) #10
  ret void
}

define ptx_kernel void @fusion_119(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8) local_unnamed_addr #6 {
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 8192
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 8192
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = extractelement <2 x bfloat> %134, i64 0
  %142 = extractelement <2 x bfloat> %134, i64 1
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %143, 1
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %143, 2
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %143, 3
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = extractelement <2 x bfloat> %151, i64 0
  %159 = extractelement <2 x bfloat> %151, i64 1
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = extractelement <2 x bfloat> %187, i64 0
  %195 = extractelement <2 x bfloat> %187, i64 1
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %196, 1
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %196, 2
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %196, 3
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = extractelement <2 x bfloat> %204, i64 0
  %212 = extractelement <2 x bfloat> %204, i64 1
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 12288
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 12288
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %233, 1
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %233, 2
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %233, 3
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = extractelement <2 x bfloat> %239, i64 0
  %247 = extractelement <2 x bfloat> %239, i64 1
  %248 = extractelement <2 x bfloat> %241, i64 0
  %249 = extractelement <2 x bfloat> %241, i64 1
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %250, 1
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %250, 2
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractvalue { i32, i32, i32, i32 } %250, 3
  %258 = bitcast i32 %257 to <2 x bfloat>
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = extractelement <2 x bfloat> %256, i64 0
  %264 = extractelement <2 x bfloat> %256, i64 1
  %265 = extractelement <2 x bfloat> %258, i64 0
  %266 = extractelement <2 x bfloat> %258, i64 1
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
  %287 = extractvalue { i32, i32, i32, i32 } %286, 0
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %286, 1
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %286, 2
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %286, 3
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractelement <2 x bfloat> %288, i64 0
  %296 = extractelement <2 x bfloat> %288, i64 1
  %297 = extractelement <2 x bfloat> %290, i64 0
  %298 = extractelement <2 x bfloat> %290, i64 1
  %299 = extractelement <2 x bfloat> %292, i64 0
  %300 = extractelement <2 x bfloat> %292, i64 1
  %301 = extractelement <2 x bfloat> %294, i64 0
  %302 = extractelement <2 x bfloat> %294, i64 1
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %303, 1
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %303, 2
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %303, 3
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractelement <2 x bfloat> %305, i64 0
  %313 = extractelement <2 x bfloat> %305, i64 1
  %314 = extractelement <2 x bfloat> %307, i64 0
  %315 = extractelement <2 x bfloat> %307, i64 1
  %316 = extractelement <2 x bfloat> %309, i64 0
  %317 = extractelement <2 x bfloat> %309, i64 1
  %318 = extractelement <2 x bfloat> %311, i64 0
  %319 = extractelement <2 x bfloat> %311, i64 1
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = getelementptr i8, ptr addrspace(1) %3, i64 14336
  %337 = getelementptr i8, ptr addrspace(1) %14, i64 14336
  %338 = getelementptr bfloat, ptr addrspace(1) %336, i64 %13
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 1024
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %341 = extractvalue { i32, i32, i32, i32 } %340, 0
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %340, 1
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %340, 2
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractvalue { i32, i32, i32, i32 } %340, 3
  %348 = bitcast i32 %347 to <2 x bfloat>
  %349 = extractelement <2 x bfloat> %342, i64 0
  %350 = extractelement <2 x bfloat> %342, i64 1
  %351 = extractelement <2 x bfloat> %344, i64 0
  %352 = extractelement <2 x bfloat> %344, i64 1
  %353 = extractelement <2 x bfloat> %346, i64 0
  %354 = extractelement <2 x bfloat> %346, i64 1
  %355 = extractelement <2 x bfloat> %348, i64 0
  %356 = extractelement <2 x bfloat> %348, i64 1
  %357 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
  %358 = extractvalue { i32, i32, i32, i32 } %357, 0
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %357, 1
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %357, 2
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractvalue { i32, i32, i32, i32 } %357, 3
  %365 = bitcast i32 %364 to <2 x bfloat>
  %366 = extractelement <2 x bfloat> %359, i64 0
  %367 = extractelement <2 x bfloat> %359, i64 1
  %368 = extractelement <2 x bfloat> %361, i64 0
  %369 = extractelement <2 x bfloat> %361, i64 1
  %370 = extractelement <2 x bfloat> %363, i64 0
  %371 = extractelement <2 x bfloat> %363, i64 1
  %372 = extractelement <2 x bfloat> %365, i64 0
  %373 = extractelement <2 x bfloat> %365, i64 1
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #10
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372) #10
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #10
  %390 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %391 = getelementptr bfloat, ptr addrspace(1) %390, i64 %13
  %392 = getelementptr i8, ptr addrspace(1) %391, i64 1024
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %391) #10
  %394 = extractvalue { i32, i32, i32, i32 } %393, 0
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %393, 1
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %393, 2
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractvalue { i32, i32, i32, i32 } %393, 3
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = extractelement <2 x bfloat> %401, i64 0
  %409 = extractelement <2 x bfloat> %401, i64 1
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %392) #10
  %411 = extractvalue { i32, i32, i32, i32 } %410, 0
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %410, 1
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %410, 2
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractvalue { i32, i32, i32, i32 } %410, 3
  %418 = bitcast i32 %417 to <2 x bfloat>
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = extractelement <2 x bfloat> %418, i64 0
  %426 = extractelement <2 x bfloat> %418, i64 1
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425) #10
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426) #10
  %443 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %444 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %445 = getelementptr bfloat, ptr addrspace(1) %443, i64 %13
  %446 = getelementptr i8, ptr addrspace(1) %445, i64 1024
  %447 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %444) #10
  %448 = extractvalue { i32, i32, i32, i32 } %447, 0
  %449 = bitcast i32 %448 to <2 x bfloat>
  %450 = extractvalue { i32, i32, i32, i32 } %447, 1
  %451 = bitcast i32 %450 to <2 x bfloat>
  %452 = extractvalue { i32, i32, i32, i32 } %447, 2
  %453 = bitcast i32 %452 to <2 x bfloat>
  %454 = extractvalue { i32, i32, i32, i32 } %447, 3
  %455 = bitcast i32 %454 to <2 x bfloat>
  %456 = extractelement <2 x bfloat> %449, i64 0
  %457 = extractelement <2 x bfloat> %449, i64 1
  %458 = extractelement <2 x bfloat> %451, i64 0
  %459 = extractelement <2 x bfloat> %451, i64 1
  %460 = extractelement <2 x bfloat> %453, i64 0
  %461 = extractelement <2 x bfloat> %453, i64 1
  %462 = extractelement <2 x bfloat> %455, i64 0
  %463 = extractelement <2 x bfloat> %455, i64 1
  %464 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %446) #10
  %465 = extractvalue { i32, i32, i32, i32 } %464, 0
  %466 = bitcast i32 %465 to <2 x bfloat>
  %467 = extractvalue { i32, i32, i32, i32 } %464, 1
  %468 = bitcast i32 %467 to <2 x bfloat>
  %469 = extractvalue { i32, i32, i32, i32 } %464, 2
  %470 = bitcast i32 %469 to <2 x bfloat>
  %471 = extractvalue { i32, i32, i32, i32 } %464, 3
  %472 = bitcast i32 %471 to <2 x bfloat>
  %473 = extractelement <2 x bfloat> %466, i64 0
  %474 = extractelement <2 x bfloat> %466, i64 1
  %475 = extractelement <2 x bfloat> %468, i64 0
  %476 = extractelement <2 x bfloat> %468, i64 1
  %477 = extractelement <2 x bfloat> %470, i64 0
  %478 = extractelement <2 x bfloat> %470, i64 1
  %479 = extractelement <2 x bfloat> %472, i64 0
  %480 = extractelement <2 x bfloat> %472, i64 1
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #10
  %483 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458) #10
  %484 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #10
  %485 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #10
  %486 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461) #10
  %487 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462) #10
  %488 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463) #10
  %489 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %473) #10
  %490 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474) #10
  %491 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475) #10
  %492 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476) #10
  %493 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477) #10
  %494 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %478) #10
  %495 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %479) #10
  %496 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %480) #10
  %497 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %498 = getelementptr bfloat, ptr addrspace(1) %497, i64 %13
  %499 = getelementptr i8, ptr addrspace(1) %498, i64 1024
  %500 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %498) #10
  %501 = extractvalue { i32, i32, i32, i32 } %500, 0
  %502 = bitcast i32 %501 to <2 x bfloat>
  %503 = extractvalue { i32, i32, i32, i32 } %500, 1
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractvalue { i32, i32, i32, i32 } %500, 2
  %506 = bitcast i32 %505 to <2 x bfloat>
  %507 = extractvalue { i32, i32, i32, i32 } %500, 3
  %508 = bitcast i32 %507 to <2 x bfloat>
  %509 = extractelement <2 x bfloat> %502, i64 0
  %510 = extractelement <2 x bfloat> %502, i64 1
  %511 = extractelement <2 x bfloat> %504, i64 0
  %512 = extractelement <2 x bfloat> %504, i64 1
  %513 = extractelement <2 x bfloat> %506, i64 0
  %514 = extractelement <2 x bfloat> %506, i64 1
  %515 = extractelement <2 x bfloat> %508, i64 0
  %516 = extractelement <2 x bfloat> %508, i64 1
  %517 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %499) #10
  %518 = extractvalue { i32, i32, i32, i32 } %517, 0
  %519 = bitcast i32 %518 to <2 x bfloat>
  %520 = extractvalue { i32, i32, i32, i32 } %517, 1
  %521 = bitcast i32 %520 to <2 x bfloat>
  %522 = extractvalue { i32, i32, i32, i32 } %517, 2
  %523 = bitcast i32 %522 to <2 x bfloat>
  %524 = extractvalue { i32, i32, i32, i32 } %517, 3
  %525 = bitcast i32 %524 to <2 x bfloat>
  %526 = extractelement <2 x bfloat> %519, i64 0
  %527 = extractelement <2 x bfloat> %519, i64 1
  %528 = extractelement <2 x bfloat> %521, i64 0
  %529 = extractelement <2 x bfloat> %521, i64 1
  %530 = extractelement <2 x bfloat> %523, i64 0
  %531 = extractelement <2 x bfloat> %523, i64 1
  %532 = extractelement <2 x bfloat> %525, i64 0
  %533 = extractelement <2 x bfloat> %525, i64 1
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509) #10
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510) #10
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511) #10
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512) #10
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513) #10
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #10
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #10
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %526) #10
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %527) #10
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %528) #10
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %529) #10
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %530) #10
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #10
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #10
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #10
  %550 = fadd float %481, %534
  %551 = fadd float %482, %535
  %552 = fadd float %483, %536
  %553 = fadd float %484, %537
  %554 = fadd float %485, %538
  %555 = fadd float %486, %539
  %556 = fadd float %487, %540
  %557 = fadd float %488, %541
  %558 = fadd float %489, %542
  %559 = fadd float %490, %543
  %560 = fadd float %491, %544
  %561 = fadd float %492, %545
  %562 = fadd float %493, %546
  %563 = fadd float %494, %547
  %564 = fadd float %495, %548
  %565 = fadd float %496, %549
  %566 = fadd float %427, %550
  %567 = fadd float %428, %551
  %568 = fadd float %429, %552
  %569 = fadd float %430, %553
  %570 = fadd float %431, %554
  %571 = fadd float %432, %555
  %572 = fadd float %433, %556
  %573 = fadd float %434, %557
  %574 = fadd float %435, %558
  %575 = fadd float %436, %559
  %576 = fadd float %437, %560
  %577 = fadd float %438, %561
  %578 = fadd float %439, %562
  %579 = fadd float %440, %563
  %580 = fadd float %441, %564
  %581 = fadd float %442, %565
  %582 = fadd float %374, %566
  %583 = fadd float %375, %567
  %584 = fadd float %376, %568
  %585 = fadd float %377, %569
  %586 = fadd float %378, %570
  %587 = fadd float %379, %571
  %588 = fadd float %380, %572
  %589 = fadd float %381, %573
  %590 = fadd float %382, %574
  %591 = fadd float %383, %575
  %592 = fadd float %384, %576
  %593 = fadd float %385, %577
  %594 = fadd float %386, %578
  %595 = fadd float %387, %579
  %596 = fadd float %388, %580
  %597 = fadd float %389, %581
  %598 = fadd float %320, %582
  %599 = fadd float %321, %583
  %600 = fadd float %322, %584
  %601 = fadd float %323, %585
  %602 = fadd float %324, %586
  %603 = fadd float %325, %587
  %604 = fadd float %326, %588
  %605 = fadd float %327, %589
  %606 = fadd float %328, %590
  %607 = fadd float %329, %591
  %608 = fadd float %330, %592
  %609 = fadd float %331, %593
  %610 = fadd float %332, %594
  %611 = fadd float %333, %595
  %612 = fadd float %334, %596
  %613 = fadd float %335, %597
  %614 = fadd float %267, %598
  %615 = fadd float %268, %599
  %616 = fadd float %269, %600
  %617 = fadd float %270, %601
  %618 = fadd float %271, %602
  %619 = fadd float %272, %603
  %620 = fadd float %273, %604
  %621 = fadd float %274, %605
  %622 = fadd float %275, %606
  %623 = fadd float %276, %607
  %624 = fadd float %277, %608
  %625 = fadd float %278, %609
  %626 = fadd float %279, %610
  %627 = fadd float %280, %611
  %628 = fadd float %281, %612
  %629 = fadd float %282, %613
  %630 = fadd float %213, %614
  %631 = fadd float %214, %615
  %632 = fadd float %215, %616
  %633 = fadd float %216, %617
  %634 = fadd float %217, %618
  %635 = fadd float %218, %619
  %636 = fadd float %219, %620
  %637 = fadd float %220, %621
  %638 = fadd float %221, %622
  %639 = fadd float %222, %623
  %640 = fadd float %223, %624
  %641 = fadd float %224, %625
  %642 = fadd float %225, %626
  %643 = fadd float %226, %627
  %644 = fadd float %227, %628
  %645 = fadd float %228, %629
  %646 = fadd float %160, %630
  %647 = fadd float %161, %631
  %648 = fadd float %162, %632
  %649 = fadd float %163, %633
  %650 = fadd float %164, %634
  %651 = fadd float %165, %635
  %652 = fadd float %166, %636
  %653 = fadd float %167, %637
  %654 = fadd float %168, %638
  %655 = fadd float %169, %639
  %656 = fadd float %170, %640
  %657 = fadd float %171, %641
  %658 = fadd float %172, %642
  %659 = fadd float %173, %643
  %660 = fadd float %174, %644
  %661 = fadd float %175, %645
  %662 = fadd float %106, %646
  %663 = fadd float %107, %647
  %664 = fadd float %108, %648
  %665 = fadd float %109, %649
  %666 = fadd float %110, %650
  %667 = fadd float %111, %651
  %668 = fadd float %112, %652
  %669 = fadd float %113, %653
  %670 = fadd float %114, %654
  %671 = fadd float %115, %655
  %672 = fadd float %116, %656
  %673 = fadd float %117, %657
  %674 = fadd float %118, %658
  %675 = fadd float %119, %659
  %676 = fadd float %120, %660
  %677 = fadd float %121, %661
  %678 = fadd float %52, %662
  %679 = fadd float %53, %663
  %680 = fadd float %54, %664
  %681 = fadd float %55, %665
  %682 = fadd float %56, %666
  %683 = fadd float %57, %667
  %684 = fadd float %58, %668
  %685 = fadd float %59, %669
  %686 = fadd float %60, %670
  %687 = fadd float %61, %671
  %688 = fadd float %62, %672
  %689 = fadd float %63, %673
  %690 = fadd float %64, %674
  %691 = fadd float %65, %675
  %692 = fadd float %66, %676
  %693 = fadd float %67, %677
  %694 = fmul float %678, %678
  %695 = fmul float %679, %679
  %696 = fmul float %680, %680
  %697 = fmul float %681, %681
  %698 = fmul float %682, %682
  %699 = fmul float %683, %683
  %700 = fmul float %684, %684
  %701 = fmul float %685, %685
  %702 = fmul float %686, %686
  %703 = fmul float %687, %687
  %704 = fmul float %688, %688
  %705 = fmul float %689, %689
  %706 = fmul float %690, %690
  %707 = fmul float %691, %691
  %708 = fmul float %692, %692
  %709 = fmul float %693, %693
  %710 = fadd float %694, %695
  %711 = fadd float %710, %696
  %712 = fadd float %711, %697
  %713 = fadd float %712, %698
  %714 = fadd float %713, %699
  %715 = fadd float %714, %700
  %716 = fadd float %715, %701
  %717 = fadd float %716, %702
  %718 = fadd float %717, %703
  %719 = fadd float %718, %704
  %720 = fadd float %719, %705
  %721 = fadd float %720, %706
  %722 = fadd float %721, %707
  %723 = fadd float %722, %708
  %724 = fadd float %723, %709
  %725 = bitcast float %724 to i32
  %726 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %725, i32 16, i32 31)
  %727 = bitcast i32 %726 to float
  %728 = fadd float %724, %727
  %729 = bitcast float %728 to i32
  %730 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %729, i32 8, i32 31)
  %731 = bitcast i32 %730 to float
  %732 = fadd float %728, %731
  %733 = bitcast float %732 to i32
  %734 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %733, i32 4, i32 31)
  %735 = bitcast i32 %734 to float
  %736 = fadd float %732, %735
  %737 = bitcast float %736 to i32
  %738 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %737, i32 2, i32 31)
  %739 = bitcast i32 %738 to float
  %740 = fadd float %736, %739
  %741 = bitcast float %740 to i32
  %742 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %741, i32 1, i32 31)
  %743 = bitcast i32 %742 to float
  %744 = fadd float %740, %743
  %745 = icmp eq i32 %6, 0
  %746 = zext nneg i32 %7 to i64
  %747 = getelementptr float, ptr addrspace(3) @global_smem, i64 %746
  %748 = bitcast float %744 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %747, <1 x i32> %748, i1 %745) #10
  tail call void @llvm.nvvm.barrier0()
  %749 = icmp samesign ult i32 %5, 2
  %750 = zext nneg i32 %5 to i64
  %751 = getelementptr float, ptr addrspace(3) @global_smem, i64 %750
  %752 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %751, i1 %749) #10
  %753 = bitcast i32 %752 to float
  %754 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %752, i32 1, i32 31)
  %755 = bitcast i32 %754 to float
  %756 = fadd float %753, %755
  %757 = icmp eq i32 %5, 0
  %758 = bitcast float %756 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %751, <1 x i32> %758, i1 %757) #10
  tail call void @llvm.nvvm.barrier0()
  %759 = load float, ptr addrspace(3) @global_smem, align 16
  %760 = fmul float %759, 0x3F50000000000000
  %761 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %762 = bitcast i32 %761 to float
  %763 = fadd float %760, %762
  %764 = tail call float @llvm.nvvm.rsqrt.approx.f(float %763)
  %765 = fmul float %678, %764
  %766 = fmul float %679, %764
  %767 = fmul float %680, %764
  %768 = fmul float %681, %764
  %769 = fmul float %682, %764
  %770 = fmul float %683, %764
  %771 = fmul float %684, %764
  %772 = fmul float %685, %764
  %773 = fmul float %686, %764
  %774 = fmul float %687, %764
  %775 = fmul float %688, %764
  %776 = fmul float %689, %764
  %777 = fmul float %690, %764
  %778 = fmul float %691, %764
  %779 = fmul float %692, %764
  %780 = fmul float %693, %764
  %781 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %782 = getelementptr i8, ptr addrspace(1) %781, i64 1024
  %783 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %781) #10
  %784 = extractvalue { i32, i32, i32, i32 } %783, 0
  %785 = bitcast i32 %784 to <2 x bfloat>
  %786 = extractvalue { i32, i32, i32, i32 } %783, 1
  %787 = bitcast i32 %786 to <2 x bfloat>
  %788 = extractvalue { i32, i32, i32, i32 } %783, 2
  %789 = bitcast i32 %788 to <2 x bfloat>
  %790 = extractvalue { i32, i32, i32, i32 } %783, 3
  %791 = bitcast i32 %790 to <2 x bfloat>
  %792 = extractelement <2 x bfloat> %785, i64 0
  %793 = extractelement <2 x bfloat> %785, i64 1
  %794 = extractelement <2 x bfloat> %787, i64 0
  %795 = extractelement <2 x bfloat> %787, i64 1
  %796 = extractelement <2 x bfloat> %789, i64 0
  %797 = extractelement <2 x bfloat> %789, i64 1
  %798 = extractelement <2 x bfloat> %791, i64 0
  %799 = extractelement <2 x bfloat> %791, i64 1
  %800 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %782) #10
  %801 = extractvalue { i32, i32, i32, i32 } %800, 0
  %802 = bitcast i32 %801 to <2 x bfloat>
  %803 = extractvalue { i32, i32, i32, i32 } %800, 1
  %804 = bitcast i32 %803 to <2 x bfloat>
  %805 = extractvalue { i32, i32, i32, i32 } %800, 2
  %806 = bitcast i32 %805 to <2 x bfloat>
  %807 = extractvalue { i32, i32, i32, i32 } %800, 3
  %808 = bitcast i32 %807 to <2 x bfloat>
  %809 = extractelement <2 x bfloat> %802, i64 0
  %810 = extractelement <2 x bfloat> %802, i64 1
  %811 = extractelement <2 x bfloat> %804, i64 0
  %812 = extractelement <2 x bfloat> %804, i64 1
  %813 = extractelement <2 x bfloat> %806, i64 0
  %814 = extractelement <2 x bfloat> %806, i64 1
  %815 = extractelement <2 x bfloat> %808, i64 0
  %816 = extractelement <2 x bfloat> %808, i64 1
  %817 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %792) #10
  %818 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %793) #10
  %819 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %794) #10
  %820 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %795) #10
  %821 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %796) #10
  %822 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %797) #10
  %823 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %798) #10
  %824 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %799) #10
  %825 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %809) #10
  %826 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %810) #10
  %827 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %811) #10
  %828 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %812) #10
  %829 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %813) #10
  %830 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %814) #10
  %831 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %815) #10
  %832 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %816) #10
  %833 = fmul float %765, %817
  %834 = fmul float %766, %818
  %835 = fmul float %767, %819
  %836 = fmul float %768, %820
  %837 = fmul float %769, %821
  %838 = fmul float %770, %822
  %839 = fmul float %771, %823
  %840 = fmul float %772, %824
  %841 = fmul float %773, %825
  %842 = fmul float %774, %826
  %843 = fmul float %775, %827
  %844 = fmul float %776, %828
  %845 = fmul float %777, %829
  %846 = fmul float %778, %830
  %847 = fmul float %779, %831
  %848 = fmul float %780, %832
  %849 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %833) #10
  %850 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %834) #10
  %851 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %835) #10
  %852 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %836) #10
  %853 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %837) #10
  %854 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %838) #10
  %855 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %839) #10
  %856 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %840) #10
  %857 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %841) #10
  %858 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %842) #10
  %859 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %843) #10
  %860 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %844) #10
  %861 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %845) #10
  %862 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %846) #10
  %863 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %847) #10
  %864 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %848) #10
  %865 = getelementptr bfloat, ptr addrspace(1) %arg817, i64 %68
  %866 = getelementptr bfloat, ptr addrspace(1) %865, i64 %13
  %867 = getelementptr i8, ptr addrspace(1) %866, i64 1024
  %868 = insertelement <2 x bfloat> poison, bfloat %849, i64 0
  %869 = insertelement <2 x bfloat> %868, bfloat %850, i64 1
  %870 = bitcast <2 x bfloat> %869 to i32
  %871 = insertelement <2 x bfloat> poison, bfloat %851, i64 0
  %872 = insertelement <2 x bfloat> %871, bfloat %852, i64 1
  %873 = bitcast <2 x bfloat> %872 to i32
  %874 = insertelement <2 x bfloat> poison, bfloat %853, i64 0
  %875 = insertelement <2 x bfloat> %874, bfloat %854, i64 1
  %876 = bitcast <2 x bfloat> %875 to i32
  %877 = insertelement <2 x bfloat> poison, bfloat %855, i64 0
  %878 = insertelement <2 x bfloat> %877, bfloat %856, i64 1
  %879 = bitcast <2 x bfloat> %878 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %870, i32 %873, i32 %876, i32 %879, ptr addrspace(1) %866) #10
  %880 = insertelement <2 x bfloat> poison, bfloat %857, i64 0
  %881 = insertelement <2 x bfloat> %880, bfloat %858, i64 1
  %882 = bitcast <2 x bfloat> %881 to i32
  %883 = insertelement <2 x bfloat> poison, bfloat %859, i64 0
  %884 = insertelement <2 x bfloat> %883, bfloat %860, i64 1
  %885 = bitcast <2 x bfloat> %884 to i32
  %886 = insertelement <2 x bfloat> poison, bfloat %861, i64 0
  %887 = insertelement <2 x bfloat> %886, bfloat %862, i64 1
  %888 = bitcast <2 x bfloat> %887 to i32
  %889 = insertelement <2 x bfloat> poison, bfloat %863, i64 0
  %890 = insertelement <2 x bfloat> %889, bfloat %864, i64 1
  %891 = bitcast <2 x bfloat> %890 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %882, i32 %885, i32 %888, i32 %891, ptr addrspace(1) %867) #10
  ret void
}

define ptx_kernel void @fusion_118(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1179648) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9) local_unnamed_addr #6 {
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg25, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 6144
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 6144
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 8192
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 8192
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %127 = extractvalue { i32, i32, i32, i32 } %126, 0
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %126, 1
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %126, 2
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractvalue { i32, i32, i32, i32 } %126, 3
  %134 = bitcast i32 %133 to <2 x bfloat>
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = extractelement <2 x bfloat> %134, i64 0
  %142 = extractelement <2 x bfloat> %134, i64 1
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %143, 1
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %143, 2
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %143, 3
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = extractelement <2 x bfloat> %151, i64 0
  %159 = extractelement <2 x bfloat> %151, i64 1
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #10
  %180 = extractvalue { i32, i32, i32, i32 } %179, 0
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %179, 1
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %179, 2
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractvalue { i32, i32, i32, i32 } %179, 3
  %187 = bitcast i32 %186 to <2 x bfloat>
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = extractelement <2 x bfloat> %187, i64 0
  %195 = extractelement <2 x bfloat> %187, i64 1
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
  %197 = extractvalue { i32, i32, i32, i32 } %196, 0
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %196, 1
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %196, 2
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractvalue { i32, i32, i32, i32 } %196, 3
  %204 = bitcast i32 %203 to <2 x bfloat>
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = extractelement <2 x bfloat> %204, i64 0
  %212 = extractelement <2 x bfloat> %204, i64 1
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %234 = extractvalue { i32, i32, i32, i32 } %233, 0
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %233, 1
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %233, 2
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractvalue { i32, i32, i32, i32 } %233, 3
  %241 = bitcast i32 %240 to <2 x bfloat>
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = extractelement <2 x bfloat> %239, i64 0
  %247 = extractelement <2 x bfloat> %239, i64 1
  %248 = extractelement <2 x bfloat> %241, i64 0
  %249 = extractelement <2 x bfloat> %241, i64 1
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %250, 1
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %250, 2
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractvalue { i32, i32, i32, i32 } %250, 3
  %258 = bitcast i32 %257 to <2 x bfloat>
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = extractelement <2 x bfloat> %256, i64 0
  %264 = extractelement <2 x bfloat> %256, i64 1
  %265 = extractelement <2 x bfloat> %258, i64 0
  %266 = extractelement <2 x bfloat> %258, i64 1
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
  %287 = extractvalue { i32, i32, i32, i32 } %286, 0
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %286, 1
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %286, 2
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractvalue { i32, i32, i32, i32 } %286, 3
  %294 = bitcast i32 %293 to <2 x bfloat>
  %295 = extractelement <2 x bfloat> %288, i64 0
  %296 = extractelement <2 x bfloat> %288, i64 1
  %297 = extractelement <2 x bfloat> %290, i64 0
  %298 = extractelement <2 x bfloat> %290, i64 1
  %299 = extractelement <2 x bfloat> %292, i64 0
  %300 = extractelement <2 x bfloat> %292, i64 1
  %301 = extractelement <2 x bfloat> %294, i64 0
  %302 = extractelement <2 x bfloat> %294, i64 1
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %303, 1
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %303, 2
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractvalue { i32, i32, i32, i32 } %303, 3
  %311 = bitcast i32 %310 to <2 x bfloat>
  %312 = extractelement <2 x bfloat> %305, i64 0
  %313 = extractelement <2 x bfloat> %305, i64 1
  %314 = extractelement <2 x bfloat> %307, i64 0
  %315 = extractelement <2 x bfloat> %307, i64 1
  %316 = extractelement <2 x bfloat> %309, i64 0
  %317 = extractelement <2 x bfloat> %309, i64 1
  %318 = extractelement <2 x bfloat> %311, i64 0
  %319 = extractelement <2 x bfloat> %311, i64 1
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = getelementptr i8, ptr addrspace(1) %3, i64 12288
  %337 = getelementptr i8, ptr addrspace(1) %14, i64 12288
  %338 = getelementptr bfloat, ptr addrspace(1) %336, i64 %13
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 1024
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %341 = extractvalue { i32, i32, i32, i32 } %340, 0
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %340, 1
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %340, 2
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractvalue { i32, i32, i32, i32 } %340, 3
  %348 = bitcast i32 %347 to <2 x bfloat>
  %349 = extractelement <2 x bfloat> %342, i64 0
  %350 = extractelement <2 x bfloat> %342, i64 1
  %351 = extractelement <2 x bfloat> %344, i64 0
  %352 = extractelement <2 x bfloat> %344, i64 1
  %353 = extractelement <2 x bfloat> %346, i64 0
  %354 = extractelement <2 x bfloat> %346, i64 1
  %355 = extractelement <2 x bfloat> %348, i64 0
  %356 = extractelement <2 x bfloat> %348, i64 1
  %357 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
  %358 = extractvalue { i32, i32, i32, i32 } %357, 0
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %357, 1
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %357, 2
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractvalue { i32, i32, i32, i32 } %357, 3
  %365 = bitcast i32 %364 to <2 x bfloat>
  %366 = extractelement <2 x bfloat> %359, i64 0
  %367 = extractelement <2 x bfloat> %359, i64 1
  %368 = extractelement <2 x bfloat> %361, i64 0
  %369 = extractelement <2 x bfloat> %361, i64 1
  %370 = extractelement <2 x bfloat> %363, i64 0
  %371 = extractelement <2 x bfloat> %363, i64 1
  %372 = extractelement <2 x bfloat> %365, i64 0
  %373 = extractelement <2 x bfloat> %365, i64 1
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #10
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372) #10
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #10
  %390 = getelementptr bfloat, ptr addrspace(1) %arg817, i64 %68
  %391 = getelementptr bfloat, ptr addrspace(1) %390, i64 %13
  %392 = getelementptr i8, ptr addrspace(1) %391, i64 1024
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %391) #10
  %394 = extractvalue { i32, i32, i32, i32 } %393, 0
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %393, 1
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %393, 2
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractvalue { i32, i32, i32, i32 } %393, 3
  %401 = bitcast i32 %400 to <2 x bfloat>
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = extractelement <2 x bfloat> %401, i64 0
  %409 = extractelement <2 x bfloat> %401, i64 1
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %392) #10
  %411 = extractvalue { i32, i32, i32, i32 } %410, 0
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %410, 1
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %410, 2
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractvalue { i32, i32, i32, i32 } %410, 3
  %418 = bitcast i32 %417 to <2 x bfloat>
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = extractelement <2 x bfloat> %418, i64 0
  %426 = extractelement <2 x bfloat> %418, i64 1
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425) #10
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426) #10
  %443 = getelementptr i8, ptr addrspace(1) %3, i64 14336
  %444 = getelementptr i8, ptr addrspace(1) %14, i64 14336
  %445 = getelementptr bfloat, ptr addrspace(1) %443, i64 %13
  %446 = getelementptr i8, ptr addrspace(1) %445, i64 1024
  %447 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %444) #10
  %448 = extractvalue { i32, i32, i32, i32 } %447, 0
  %449 = bitcast i32 %448 to <2 x bfloat>
  %450 = extractvalue { i32, i32, i32, i32 } %447, 1
  %451 = bitcast i32 %450 to <2 x bfloat>
  %452 = extractvalue { i32, i32, i32, i32 } %447, 2
  %453 = bitcast i32 %452 to <2 x bfloat>
  %454 = extractvalue { i32, i32, i32, i32 } %447, 3
  %455 = bitcast i32 %454 to <2 x bfloat>
  %456 = extractelement <2 x bfloat> %449, i64 0
  %457 = extractelement <2 x bfloat> %449, i64 1
  %458 = extractelement <2 x bfloat> %451, i64 0
  %459 = extractelement <2 x bfloat> %451, i64 1
  %460 = extractelement <2 x bfloat> %453, i64 0
  %461 = extractelement <2 x bfloat> %453, i64 1
  %462 = extractelement <2 x bfloat> %455, i64 0
  %463 = extractelement <2 x bfloat> %455, i64 1
  %464 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %446) #10
  %465 = extractvalue { i32, i32, i32, i32 } %464, 0
  %466 = bitcast i32 %465 to <2 x bfloat>
  %467 = extractvalue { i32, i32, i32, i32 } %464, 1
  %468 = bitcast i32 %467 to <2 x bfloat>
  %469 = extractvalue { i32, i32, i32, i32 } %464, 2
  %470 = bitcast i32 %469 to <2 x bfloat>
  %471 = extractvalue { i32, i32, i32, i32 } %464, 3
  %472 = bitcast i32 %471 to <2 x bfloat>
  %473 = extractelement <2 x bfloat> %466, i64 0
  %474 = extractelement <2 x bfloat> %466, i64 1
  %475 = extractelement <2 x bfloat> %468, i64 0
  %476 = extractelement <2 x bfloat> %468, i64 1
  %477 = extractelement <2 x bfloat> %470, i64 0
  %478 = extractelement <2 x bfloat> %470, i64 1
  %479 = extractelement <2 x bfloat> %472, i64 0
  %480 = extractelement <2 x bfloat> %472, i64 1
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #10
  %483 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458) #10
  %484 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #10
  %485 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #10
  %486 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461) #10
  %487 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462) #10
  %488 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463) #10
  %489 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %473) #10
  %490 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474) #10
  %491 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475) #10
  %492 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476) #10
  %493 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477) #10
  %494 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %478) #10
  %495 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %479) #10
  %496 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %480) #10
  %497 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %498 = getelementptr bfloat, ptr addrspace(1) %497, i64 %13
  %499 = getelementptr i8, ptr addrspace(1) %498, i64 1024
  %500 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %498) #10
  %501 = extractvalue { i32, i32, i32, i32 } %500, 0
  %502 = bitcast i32 %501 to <2 x bfloat>
  %503 = extractvalue { i32, i32, i32, i32 } %500, 1
  %504 = bitcast i32 %503 to <2 x bfloat>
  %505 = extractvalue { i32, i32, i32, i32 } %500, 2
  %506 = bitcast i32 %505 to <2 x bfloat>
  %507 = extractvalue { i32, i32, i32, i32 } %500, 3
  %508 = bitcast i32 %507 to <2 x bfloat>
  %509 = extractelement <2 x bfloat> %502, i64 0
  %510 = extractelement <2 x bfloat> %502, i64 1
  %511 = extractelement <2 x bfloat> %504, i64 0
  %512 = extractelement <2 x bfloat> %504, i64 1
  %513 = extractelement <2 x bfloat> %506, i64 0
  %514 = extractelement <2 x bfloat> %506, i64 1
  %515 = extractelement <2 x bfloat> %508, i64 0
  %516 = extractelement <2 x bfloat> %508, i64 1
  %517 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %499) #10
  %518 = extractvalue { i32, i32, i32, i32 } %517, 0
  %519 = bitcast i32 %518 to <2 x bfloat>
  %520 = extractvalue { i32, i32, i32, i32 } %517, 1
  %521 = bitcast i32 %520 to <2 x bfloat>
  %522 = extractvalue { i32, i32, i32, i32 } %517, 2
  %523 = bitcast i32 %522 to <2 x bfloat>
  %524 = extractvalue { i32, i32, i32, i32 } %517, 3
  %525 = bitcast i32 %524 to <2 x bfloat>
  %526 = extractelement <2 x bfloat> %519, i64 0
  %527 = extractelement <2 x bfloat> %519, i64 1
  %528 = extractelement <2 x bfloat> %521, i64 0
  %529 = extractelement <2 x bfloat> %521, i64 1
  %530 = extractelement <2 x bfloat> %523, i64 0
  %531 = extractelement <2 x bfloat> %523, i64 1
  %532 = extractelement <2 x bfloat> %525, i64 0
  %533 = extractelement <2 x bfloat> %525, i64 1
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509) #10
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510) #10
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511) #10
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512) #10
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513) #10
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #10
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #10
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %526) #10
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %527) #10
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %528) #10
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %529) #10
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %530) #10
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #10
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #10
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #10
  %550 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %551 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %552 = getelementptr bfloat, ptr addrspace(1) %550, i64 %13
  %553 = getelementptr i8, ptr addrspace(1) %552, i64 1024
  %554 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %551) #10
  %555 = extractvalue { i32, i32, i32, i32 } %554, 0
  %556 = bitcast i32 %555 to <2 x bfloat>
  %557 = extractvalue { i32, i32, i32, i32 } %554, 1
  %558 = bitcast i32 %557 to <2 x bfloat>
  %559 = extractvalue { i32, i32, i32, i32 } %554, 2
  %560 = bitcast i32 %559 to <2 x bfloat>
  %561 = extractvalue { i32, i32, i32, i32 } %554, 3
  %562 = bitcast i32 %561 to <2 x bfloat>
  %563 = extractelement <2 x bfloat> %556, i64 0
  %564 = extractelement <2 x bfloat> %556, i64 1
  %565 = extractelement <2 x bfloat> %558, i64 0
  %566 = extractelement <2 x bfloat> %558, i64 1
  %567 = extractelement <2 x bfloat> %560, i64 0
  %568 = extractelement <2 x bfloat> %560, i64 1
  %569 = extractelement <2 x bfloat> %562, i64 0
  %570 = extractelement <2 x bfloat> %562, i64 1
  %571 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %553) #10
  %572 = extractvalue { i32, i32, i32, i32 } %571, 0
  %573 = bitcast i32 %572 to <2 x bfloat>
  %574 = extractvalue { i32, i32, i32, i32 } %571, 1
  %575 = bitcast i32 %574 to <2 x bfloat>
  %576 = extractvalue { i32, i32, i32, i32 } %571, 2
  %577 = bitcast i32 %576 to <2 x bfloat>
  %578 = extractvalue { i32, i32, i32, i32 } %571, 3
  %579 = bitcast i32 %578 to <2 x bfloat>
  %580 = extractelement <2 x bfloat> %573, i64 0
  %581 = extractelement <2 x bfloat> %573, i64 1
  %582 = extractelement <2 x bfloat> %575, i64 0
  %583 = extractelement <2 x bfloat> %575, i64 1
  %584 = extractelement <2 x bfloat> %577, i64 0
  %585 = extractelement <2 x bfloat> %577, i64 1
  %586 = extractelement <2 x bfloat> %579, i64 0
  %587 = extractelement <2 x bfloat> %579, i64 1
  %588 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %563) #10
  %589 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %564) #10
  %590 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %565) #10
  %591 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %566) #10
  %592 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %567) #10
  %593 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %568) #10
  %594 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %569) #10
  %595 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %570) #10
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %580) #10
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %581) #10
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %582) #10
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %583) #10
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %584) #10
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %585) #10
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %586) #10
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %587) #10
  %604 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %605 = getelementptr bfloat, ptr addrspace(1) %604, i64 %13
  %606 = getelementptr i8, ptr addrspace(1) %605, i64 1024
  %607 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %605) #10
  %608 = extractvalue { i32, i32, i32, i32 } %607, 0
  %609 = bitcast i32 %608 to <2 x bfloat>
  %610 = extractvalue { i32, i32, i32, i32 } %607, 1
  %611 = bitcast i32 %610 to <2 x bfloat>
  %612 = extractvalue { i32, i32, i32, i32 } %607, 2
  %613 = bitcast i32 %612 to <2 x bfloat>
  %614 = extractvalue { i32, i32, i32, i32 } %607, 3
  %615 = bitcast i32 %614 to <2 x bfloat>
  %616 = extractelement <2 x bfloat> %609, i64 0
  %617 = extractelement <2 x bfloat> %609, i64 1
  %618 = extractelement <2 x bfloat> %611, i64 0
  %619 = extractelement <2 x bfloat> %611, i64 1
  %620 = extractelement <2 x bfloat> %613, i64 0
  %621 = extractelement <2 x bfloat> %613, i64 1
  %622 = extractelement <2 x bfloat> %615, i64 0
  %623 = extractelement <2 x bfloat> %615, i64 1
  %624 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %606) #10
  %625 = extractvalue { i32, i32, i32, i32 } %624, 0
  %626 = bitcast i32 %625 to <2 x bfloat>
  %627 = extractvalue { i32, i32, i32, i32 } %624, 1
  %628 = bitcast i32 %627 to <2 x bfloat>
  %629 = extractvalue { i32, i32, i32, i32 } %624, 2
  %630 = bitcast i32 %629 to <2 x bfloat>
  %631 = extractvalue { i32, i32, i32, i32 } %624, 3
  %632 = bitcast i32 %631 to <2 x bfloat>
  %633 = extractelement <2 x bfloat> %626, i64 0
  %634 = extractelement <2 x bfloat> %626, i64 1
  %635 = extractelement <2 x bfloat> %628, i64 0
  %636 = extractelement <2 x bfloat> %628, i64 1
  %637 = extractelement <2 x bfloat> %630, i64 0
  %638 = extractelement <2 x bfloat> %630, i64 1
  %639 = extractelement <2 x bfloat> %632, i64 0
  %640 = extractelement <2 x bfloat> %632, i64 1
  %641 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %616) #10
  %642 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %617) #10
  %643 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %618) #10
  %644 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %619) #10
  %645 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %620) #10
  %646 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %621) #10
  %647 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %622) #10
  %648 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %623) #10
  %649 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %633) #10
  %650 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %634) #10
  %651 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %635) #10
  %652 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %636) #10
  %653 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %637) #10
  %654 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %638) #10
  %655 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %639) #10
  %656 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %640) #10
  %657 = fadd float %588, %641
  %658 = fadd float %589, %642
  %659 = fadd float %590, %643
  %660 = fadd float %591, %644
  %661 = fadd float %592, %645
  %662 = fadd float %593, %646
  %663 = fadd float %594, %647
  %664 = fadd float %595, %648
  %665 = fadd float %596, %649
  %666 = fadd float %597, %650
  %667 = fadd float %598, %651
  %668 = fadd float %599, %652
  %669 = fadd float %600, %653
  %670 = fadd float %601, %654
  %671 = fadd float %602, %655
  %672 = fadd float %603, %656
  %673 = fadd float %534, %657
  %674 = fadd float %535, %658
  %675 = fadd float %536, %659
  %676 = fadd float %537, %660
  %677 = fadd float %538, %661
  %678 = fadd float %539, %662
  %679 = fadd float %540, %663
  %680 = fadd float %541, %664
  %681 = fadd float %542, %665
  %682 = fadd float %543, %666
  %683 = fadd float %544, %667
  %684 = fadd float %545, %668
  %685 = fadd float %546, %669
  %686 = fadd float %547, %670
  %687 = fadd float %548, %671
  %688 = fadd float %549, %672
  %689 = fadd float %481, %673
  %690 = fadd float %482, %674
  %691 = fadd float %483, %675
  %692 = fadd float %484, %676
  %693 = fadd float %485, %677
  %694 = fadd float %486, %678
  %695 = fadd float %487, %679
  %696 = fadd float %488, %680
  %697 = fadd float %489, %681
  %698 = fadd float %490, %682
  %699 = fadd float %491, %683
  %700 = fadd float %492, %684
  %701 = fadd float %493, %685
  %702 = fadd float %494, %686
  %703 = fadd float %495, %687
  %704 = fadd float %496, %688
  %705 = fadd float %427, %689
  %706 = fadd float %428, %690
  %707 = fadd float %429, %691
  %708 = fadd float %430, %692
  %709 = fadd float %431, %693
  %710 = fadd float %432, %694
  %711 = fadd float %433, %695
  %712 = fadd float %434, %696
  %713 = fadd float %435, %697
  %714 = fadd float %436, %698
  %715 = fadd float %437, %699
  %716 = fadd float %438, %700
  %717 = fadd float %439, %701
  %718 = fadd float %440, %702
  %719 = fadd float %441, %703
  %720 = fadd float %442, %704
  %721 = fadd float %374, %705
  %722 = fadd float %375, %706
  %723 = fadd float %376, %707
  %724 = fadd float %377, %708
  %725 = fadd float %378, %709
  %726 = fadd float %379, %710
  %727 = fadd float %380, %711
  %728 = fadd float %381, %712
  %729 = fadd float %382, %713
  %730 = fadd float %383, %714
  %731 = fadd float %384, %715
  %732 = fadd float %385, %716
  %733 = fadd float %386, %717
  %734 = fadd float %387, %718
  %735 = fadd float %388, %719
  %736 = fadd float %389, %720
  %737 = fadd float %320, %721
  %738 = fadd float %321, %722
  %739 = fadd float %322, %723
  %740 = fadd float %323, %724
  %741 = fadd float %324, %725
  %742 = fadd float %325, %726
  %743 = fadd float %326, %727
  %744 = fadd float %327, %728
  %745 = fadd float %328, %729
  %746 = fadd float %329, %730
  %747 = fadd float %330, %731
  %748 = fadd float %331, %732
  %749 = fadd float %332, %733
  %750 = fadd float %333, %734
  %751 = fadd float %334, %735
  %752 = fadd float %335, %736
  %753 = fadd float %267, %737
  %754 = fadd float %268, %738
  %755 = fadd float %269, %739
  %756 = fadd float %270, %740
  %757 = fadd float %271, %741
  %758 = fadd float %272, %742
  %759 = fadd float %273, %743
  %760 = fadd float %274, %744
  %761 = fadd float %275, %745
  %762 = fadd float %276, %746
  %763 = fadd float %277, %747
  %764 = fadd float %278, %748
  %765 = fadd float %279, %749
  %766 = fadd float %280, %750
  %767 = fadd float %281, %751
  %768 = fadd float %282, %752
  %769 = fadd float %213, %753
  %770 = fadd float %214, %754
  %771 = fadd float %215, %755
  %772 = fadd float %216, %756
  %773 = fadd float %217, %757
  %774 = fadd float %218, %758
  %775 = fadd float %219, %759
  %776 = fadd float %220, %760
  %777 = fadd float %221, %761
  %778 = fadd float %222, %762
  %779 = fadd float %223, %763
  %780 = fadd float %224, %764
  %781 = fadd float %225, %765
  %782 = fadd float %226, %766
  %783 = fadd float %227, %767
  %784 = fadd float %228, %768
  %785 = fadd float %160, %769
  %786 = fadd float %161, %770
  %787 = fadd float %162, %771
  %788 = fadd float %163, %772
  %789 = fadd float %164, %773
  %790 = fadd float %165, %774
  %791 = fadd float %166, %775
  %792 = fadd float %167, %776
  %793 = fadd float %168, %777
  %794 = fadd float %169, %778
  %795 = fadd float %170, %779
  %796 = fadd float %171, %780
  %797 = fadd float %172, %781
  %798 = fadd float %173, %782
  %799 = fadd float %174, %783
  %800 = fadd float %175, %784
  %801 = fadd float %106, %785
  %802 = fadd float %107, %786
  %803 = fadd float %108, %787
  %804 = fadd float %109, %788
  %805 = fadd float %110, %789
  %806 = fadd float %111, %790
  %807 = fadd float %112, %791
  %808 = fadd float %113, %792
  %809 = fadd float %114, %793
  %810 = fadd float %115, %794
  %811 = fadd float %116, %795
  %812 = fadd float %117, %796
  %813 = fadd float %118, %797
  %814 = fadd float %119, %798
  %815 = fadd float %120, %799
  %816 = fadd float %121, %800
  %817 = fadd float %52, %801
  %818 = fadd float %53, %802
  %819 = fadd float %54, %803
  %820 = fadd float %55, %804
  %821 = fadd float %56, %805
  %822 = fadd float %57, %806
  %823 = fadd float %58, %807
  %824 = fadd float %59, %808
  %825 = fadd float %60, %809
  %826 = fadd float %61, %810
  %827 = fadd float %62, %811
  %828 = fadd float %63, %812
  %829 = fadd float %64, %813
  %830 = fadd float %65, %814
  %831 = fadd float %66, %815
  %832 = fadd float %67, %816
  %833 = fmul float %817, %817
  %834 = fmul float %818, %818
  %835 = fmul float %819, %819
  %836 = fmul float %820, %820
  %837 = fmul float %821, %821
  %838 = fmul float %822, %822
  %839 = fmul float %823, %823
  %840 = fmul float %824, %824
  %841 = fmul float %825, %825
  %842 = fmul float %826, %826
  %843 = fmul float %827, %827
  %844 = fmul float %828, %828
  %845 = fmul float %829, %829
  %846 = fmul float %830, %830
  %847 = fmul float %831, %831
  %848 = fmul float %832, %832
  %849 = fadd float %833, %834
  %850 = fadd float %849, %835
  %851 = fadd float %850, %836
  %852 = fadd float %851, %837
  %853 = fadd float %852, %838
  %854 = fadd float %853, %839
  %855 = fadd float %854, %840
  %856 = fadd float %855, %841
  %857 = fadd float %856, %842
  %858 = fadd float %857, %843
  %859 = fadd float %858, %844
  %860 = fadd float %859, %845
  %861 = fadd float %860, %846
  %862 = fadd float %861, %847
  %863 = fadd float %862, %848
  %864 = bitcast float %863 to i32
  %865 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %864, i32 16, i32 31)
  %866 = bitcast i32 %865 to float
  %867 = fadd float %863, %866
  %868 = bitcast float %867 to i32
  %869 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %868, i32 8, i32 31)
  %870 = bitcast i32 %869 to float
  %871 = fadd float %867, %870
  %872 = bitcast float %871 to i32
  %873 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %872, i32 4, i32 31)
  %874 = bitcast i32 %873 to float
  %875 = fadd float %871, %874
  %876 = bitcast float %875 to i32
  %877 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %876, i32 2, i32 31)
  %878 = bitcast i32 %877 to float
  %879 = fadd float %875, %878
  %880 = bitcast float %879 to i32
  %881 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %880, i32 1, i32 31)
  %882 = bitcast i32 %881 to float
  %883 = fadd float %879, %882
  %884 = icmp eq i32 %6, 0
  %885 = zext nneg i32 %7 to i64
  %886 = getelementptr float, ptr addrspace(3) @global_smem, i64 %885
  %887 = bitcast float %883 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %886, <1 x i32> %887, i1 %884) #10
  tail call void @llvm.nvvm.barrier0()
  %888 = icmp samesign ult i32 %5, 2
  %889 = zext nneg i32 %5 to i64
  %890 = getelementptr float, ptr addrspace(3) @global_smem, i64 %889
  %891 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %890, i1 %888) #10
  %892 = bitcast i32 %891 to float
  %893 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %891, i32 1, i32 31)
  %894 = bitcast i32 %893 to float
  %895 = fadd float %892, %894
  %896 = icmp eq i32 %5, 0
  %897 = bitcast float %895 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %890, <1 x i32> %897, i1 %896) #10
  tail call void @llvm.nvvm.barrier0()
  %898 = load float, ptr addrspace(3) @global_smem, align 16
  %899 = fmul float %898, 0x3F50000000000000
  %900 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %901 = bitcast i32 %900 to float
  %902 = fadd float %899, %901
  %903 = tail call float @llvm.nvvm.rsqrt.approx.f(float %902)
  %904 = fmul float %817, %903
  %905 = fmul float %818, %903
  %906 = fmul float %819, %903
  %907 = fmul float %820, %903
  %908 = fmul float %821, %903
  %909 = fmul float %822, %903
  %910 = fmul float %823, %903
  %911 = fmul float %824, %903
  %912 = fmul float %825, %903
  %913 = fmul float %826, %903
  %914 = fmul float %827, %903
  %915 = fmul float %828, %903
  %916 = fmul float %829, %903
  %917 = fmul float %830, %903
  %918 = fmul float %831, %903
  %919 = fmul float %832, %903
  %920 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %13
  %921 = getelementptr i8, ptr addrspace(1) %920, i64 1024
  %922 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %920) #10
  %923 = extractvalue { i32, i32, i32, i32 } %922, 0
  %924 = bitcast i32 %923 to <2 x bfloat>
  %925 = extractvalue { i32, i32, i32, i32 } %922, 1
  %926 = bitcast i32 %925 to <2 x bfloat>
  %927 = extractvalue { i32, i32, i32, i32 } %922, 2
  %928 = bitcast i32 %927 to <2 x bfloat>
  %929 = extractvalue { i32, i32, i32, i32 } %922, 3
  %930 = bitcast i32 %929 to <2 x bfloat>
  %931 = extractelement <2 x bfloat> %924, i64 0
  %932 = extractelement <2 x bfloat> %924, i64 1
  %933 = extractelement <2 x bfloat> %926, i64 0
  %934 = extractelement <2 x bfloat> %926, i64 1
  %935 = extractelement <2 x bfloat> %928, i64 0
  %936 = extractelement <2 x bfloat> %928, i64 1
  %937 = extractelement <2 x bfloat> %930, i64 0
  %938 = extractelement <2 x bfloat> %930, i64 1
  %939 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %921) #10
  %940 = extractvalue { i32, i32, i32, i32 } %939, 0
  %941 = bitcast i32 %940 to <2 x bfloat>
  %942 = extractvalue { i32, i32, i32, i32 } %939, 1
  %943 = bitcast i32 %942 to <2 x bfloat>
  %944 = extractvalue { i32, i32, i32, i32 } %939, 2
  %945 = bitcast i32 %944 to <2 x bfloat>
  %946 = extractvalue { i32, i32, i32, i32 } %939, 3
  %947 = bitcast i32 %946 to <2 x bfloat>
  %948 = extractelement <2 x bfloat> %941, i64 0
  %949 = extractelement <2 x bfloat> %941, i64 1
  %950 = extractelement <2 x bfloat> %943, i64 0
  %951 = extractelement <2 x bfloat> %943, i64 1
  %952 = extractelement <2 x bfloat> %945, i64 0
  %953 = extractelement <2 x bfloat> %945, i64 1
  %954 = extractelement <2 x bfloat> %947, i64 0
  %955 = extractelement <2 x bfloat> %947, i64 1
  %956 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %931) #10
  %957 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %932) #10
  %958 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %933) #10
  %959 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %934) #10
  %960 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %935) #10
  %961 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %936) #10
  %962 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %937) #10
  %963 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %938) #10
  %964 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %948) #10
  %965 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %949) #10
  %966 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %950) #10
  %967 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %951) #10
  %968 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %952) #10
  %969 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %953) #10
  %970 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %954) #10
  %971 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %955) #10
  %972 = fmul float %904, %956
  %973 = fmul float %905, %957
  %974 = fmul float %906, %958
  %975 = fmul float %907, %959
  %976 = fmul float %908, %960
  %977 = fmul float %909, %961
  %978 = fmul float %910, %962
  %979 = fmul float %911, %963
  %980 = fmul float %912, %964
  %981 = fmul float %913, %965
  %982 = fmul float %914, %966
  %983 = fmul float %915, %967
  %984 = fmul float %916, %968
  %985 = fmul float %917, %969
  %986 = fmul float %918, %970
  %987 = fmul float %919, %971
  %988 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %972) #10
  %989 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %973) #10
  %990 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %974) #10
  %991 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %975) #10
  %992 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %976) #10
  %993 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %977) #10
  %994 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %978) #10
  %995 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %979) #10
  %996 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %980) #10
  %997 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %981) #10
  %998 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %982) #10
  %999 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %983) #10
  %1000 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %984) #10
  %1001 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %985) #10
  %1002 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %986) #10
  %1003 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %987) #10
  %1004 = getelementptr bfloat, ptr addrspace(1) %arg919, i64 %68
  %1005 = getelementptr bfloat, ptr addrspace(1) %1004, i64 %13
  %1006 = getelementptr i8, ptr addrspace(1) %1005, i64 1024
  %1007 = insertelement <2 x bfloat> poison, bfloat %988, i64 0
  %1008 = insertelement <2 x bfloat> %1007, bfloat %989, i64 1
  %1009 = bitcast <2 x bfloat> %1008 to i32
  %1010 = insertelement <2 x bfloat> poison, bfloat %990, i64 0
  %1011 = insertelement <2 x bfloat> %1010, bfloat %991, i64 1
  %1012 = bitcast <2 x bfloat> %1011 to i32
  %1013 = insertelement <2 x bfloat> poison, bfloat %992, i64 0
  %1014 = insertelement <2 x bfloat> %1013, bfloat %993, i64 1
  %1015 = bitcast <2 x bfloat> %1014 to i32
  %1016 = insertelement <2 x bfloat> poison, bfloat %994, i64 0
  %1017 = insertelement <2 x bfloat> %1016, bfloat %995, i64 1
  %1018 = bitcast <2 x bfloat> %1017 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1009, i32 %1012, i32 %1015, i32 %1018, ptr addrspace(1) %1005) #10
  %1019 = insertelement <2 x bfloat> poison, bfloat %996, i64 0
  %1020 = insertelement <2 x bfloat> %1019, bfloat %997, i64 1
  %1021 = bitcast <2 x bfloat> %1020 to i32
  %1022 = insertelement <2 x bfloat> poison, bfloat %998, i64 0
  %1023 = insertelement <2 x bfloat> %1022, bfloat %999, i64 1
  %1024 = bitcast <2 x bfloat> %1023 to i32
  %1025 = insertelement <2 x bfloat> poison, bfloat %1000, i64 0
  %1026 = insertelement <2 x bfloat> %1025, bfloat %1001, i64 1
  %1027 = bitcast <2 x bfloat> %1026 to i32
  %1028 = insertelement <2 x bfloat> poison, bfloat %1002, i64 0
  %1029 = insertelement <2 x bfloat> %1028, bfloat %1003, i64 1
  %1030 = bitcast <2 x bfloat> %1029 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %1021, i32 %1024, i32 %1027, i32 %1030, ptr addrspace(1) %1006) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(1179648) %0, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %1, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %2, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %4, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %5, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %6, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %7, ptr noalias writeonly align 128 captures(none) dereferenceable(262144) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %8 to ptr addrspace(1)
  %11 = addrspacecast ptr %7 to ptr addrspace(1)
  %12 = addrspacecast ptr %6 to ptr addrspace(1)
  %13 = addrspacecast ptr %5 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %3 to ptr addrspace(1)
  %16 = addrspacecast ptr %2 to ptr addrspace(1)
  %17 = addrspacecast ptr %1 to ptr addrspace(1)
  %18 = addrspacecast ptr %0 to ptr addrspace(1)
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %21 = lshr i32 %20, 3
  %22 = shl nuw nsw i32 %20, 7
  %23 = and i32 %22, 896
  %24 = or disjoint i32 %23, %19
  %25 = or disjoint i32 %22, %19
  %26 = zext nneg i32 %25 to i64
  %27 = getelementptr inbounds bfloat, ptr addrspace(1) %13, i64 %26
  %28 = load bfloat, ptr addrspace(1) %27, align 2, !invariant.load !6
  %29 = getelementptr inbounds bfloat, ptr addrspace(1) %12, i64 %26
  %30 = load bfloat, ptr addrspace(1) %29, align 2, !invariant.load !6
  %31 = mul nuw nsw i32 %21, 9216
  %32 = zext nneg i32 %24 to i64
  %33 = zext nneg i32 %31 to i64
  %34 = add i64 %33, %32
  %35 = getelementptr bfloat, ptr addrspace(1) %18, i64 %34
  %36 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 16384
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !6, !alias.scope !15
  %38 = fpext bfloat %37 to float
  %39 = fpext bfloat %28 to float
  %40 = fpext bfloat %30 to float
  %41 = fadd float %39, %38
  %42 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %26
  %43 = load bfloat, ptr addrspace(1) %42, align 2, !invariant.load !6
  %44 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 14336
  %45 = load bfloat, ptr addrspace(1) %44, align 2, !invariant.load !6, !alias.scope !18
  %46 = fpext bfloat %45 to float
  %47 = fadd float %41, %40
  %48 = fpext bfloat %43 to float
  %49 = fadd float %47, %46
  %50 = getelementptr inbounds bfloat, ptr addrspace(1) %15, i64 %26
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !6
  %52 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 12288
  %53 = load bfloat, ptr addrspace(1) %52, align 2, !invariant.load !6, !alias.scope !21
  %54 = fpext bfloat %53 to float
  %55 = fadd float %49, %48
  %56 = fpext bfloat %51 to float
  %57 = fadd float %55, %54
  %58 = getelementptr inbounds bfloat, ptr addrspace(1) %14, i64 %26
  %59 = load bfloat, ptr addrspace(1) %58, align 2, !invariant.load !6
  %60 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 10240
  %61 = load bfloat, ptr addrspace(1) %60, align 2, !invariant.load !6, !alias.scope !24
  %62 = fpext bfloat %61 to float
  %63 = fadd float %57, %56
  %64 = fpext bfloat %59 to float
  %65 = fadd float %63, %62
  %66 = getelementptr inbounds bfloat, ptr addrspace(1) %16, i64 %26
  %67 = load bfloat, ptr addrspace(1) %66, align 2, !invariant.load !6
  %68 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 8192
  %69 = load bfloat, ptr addrspace(1) %68, align 2, !invariant.load !6, !alias.scope !27
  %70 = fpext bfloat %69 to float
  %71 = fadd float %65, %64
  %72 = fpext bfloat %67 to float
  %73 = fadd float %71, %70
  %74 = getelementptr inbounds bfloat, ptr addrspace(1) %17, i64 %26
  %75 = load bfloat, ptr addrspace(1) %74, align 2, !invariant.load !6
  %76 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 6144
  %77 = load bfloat, ptr addrspace(1) %76, align 2, !invariant.load !6, !alias.scope !30
  %78 = fpext bfloat %77 to float
  %79 = fadd float %73, %72
  %80 = fpext bfloat %75 to float
  %81 = fadd float %79, %78
  %82 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 4096
  %83 = load bfloat, ptr addrspace(1) %82, align 2, !invariant.load !6, !alias.scope !33
  %84 = fpext bfloat %83 to float
  %85 = fadd float %81, %80
  %86 = fadd float %85, %84
  %87 = getelementptr inbounds float, ptr addrspace(1) %10, i64 %26
  store float %86, ptr addrspace(1) %87, align 4
  ret void
}

define ptx_kernel void @fusion_117(ptr noalias align 128 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) local_unnamed_addr #6 {
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 10
  %4 = getelementptr float, ptr addrspace(1) %arg01, i64 %3
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr float, ptr addrspace(1) %4, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 16
  %16 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %17 = getelementptr i8, ptr addrspace(1) %14, i64 2064
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #10
  %19 = extractvalue { i32, i32, i32, i32 } %18, 0
  %20 = extractvalue { i32, i32, i32, i32 } %18, 1
  %21 = extractvalue { i32, i32, i32, i32 } %18, 2
  %22 = extractvalue { i32, i32, i32, i32 } %18, 3
  %23 = bitcast i32 %19 to float
  %24 = bitcast i32 %20 to float
  %25 = bitcast i32 %21 to float
  %26 = bitcast i32 %22 to float
  %27 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
  %28 = extractvalue { i32, i32, i32, i32 } %27, 0
  %29 = extractvalue { i32, i32, i32, i32 } %27, 1
  %30 = extractvalue { i32, i32, i32, i32 } %27, 2
  %31 = extractvalue { i32, i32, i32, i32 } %27, 3
  %32 = bitcast i32 %28 to float
  %33 = bitcast i32 %29 to float
  %34 = bitcast i32 %30 to float
  %35 = bitcast i32 %31 to float
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
  %37 = extractvalue { i32, i32, i32, i32 } %36, 0
  %38 = extractvalue { i32, i32, i32, i32 } %36, 1
  %39 = extractvalue { i32, i32, i32, i32 } %36, 2
  %40 = extractvalue { i32, i32, i32, i32 } %36, 3
  %41 = bitcast i32 %37 to float
  %42 = bitcast i32 %38 to float
  %43 = bitcast i32 %39 to float
  %44 = bitcast i32 %40 to float
  %45 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %46 = extractvalue { i32, i32, i32, i32 } %45, 0
  %47 = extractvalue { i32, i32, i32, i32 } %45, 1
  %48 = extractvalue { i32, i32, i32, i32 } %45, 2
  %49 = extractvalue { i32, i32, i32, i32 } %45, 3
  %50 = bitcast i32 %46 to float
  %51 = bitcast i32 %47 to float
  %52 = bitcast i32 %48 to float
  %53 = bitcast i32 %49 to float
  %54 = fmul float %23, %23
  %55 = fmul float %24, %24
  %56 = fmul float %25, %25
  %57 = fmul float %26, %26
  %58 = fmul float %32, %32
  %59 = fmul float %33, %33
  %60 = fmul float %34, %34
  %61 = fmul float %35, %35
  %62 = fmul float %41, %41
  %63 = fmul float %42, %42
  %64 = fmul float %43, %43
  %65 = fmul float %44, %44
  %66 = fmul float %50, %50
  %67 = fmul float %51, %51
  %68 = fmul float %52, %52
  %69 = fmul float %53, %53
  %70 = fadd float %54, %55
  %71 = fadd float %56, %70
  %72 = fadd float %57, %71
  %73 = fadd float %58, %72
  %74 = fadd float %59, %73
  %75 = fadd float %60, %74
  %76 = fadd float %61, %75
  %77 = fadd float %62, %76
  %78 = fadd float %63, %77
  %79 = fadd float %64, %78
  %80 = fadd float %65, %79
  %81 = fadd float %66, %80
  %82 = fadd float %67, %81
  %83 = fadd float %68, %82
  %84 = fadd float %69, %83
  %85 = bitcast float %84 to i32
  %86 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %85, i32 16, i32 31)
  %87 = bitcast i32 %86 to float
  %88 = fadd float %84, %87
  %89 = bitcast float %88 to i32
  %90 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %89, i32 8, i32 31)
  %91 = bitcast i32 %90 to float
  %92 = fadd float %88, %91
  %93 = bitcast float %92 to i32
  %94 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %93, i32 4, i32 31)
  %95 = bitcast i32 %94 to float
  %96 = fadd float %92, %95
  %97 = bitcast float %96 to i32
  %98 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %97, i32 2, i32 31)
  %99 = bitcast i32 %98 to float
  %100 = fadd float %96, %99
  %101 = bitcast float %100 to i32
  %102 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %101, i32 1, i32 31)
  %103 = bitcast i32 %102 to float
  %104 = fadd float %100, %103
  %105 = icmp eq i32 %6, 0
  %106 = zext nneg i32 %7 to i64
  %107 = getelementptr float, ptr addrspace(3) @global_smem, i64 %106
  %108 = bitcast float %104 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %107, <1 x i32> %108, i1 %105) #10
  tail call void @llvm.nvvm.barrier0()
  %109 = icmp samesign ult i32 %5, 2
  %110 = zext nneg i32 %5 to i64
  %111 = getelementptr float, ptr addrspace(3) @global_smem, i64 %110
  %112 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %111, i1 %109) #10
  %113 = bitcast i32 %112 to float
  %114 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %112, i32 1, i32 31)
  %115 = bitcast i32 %114 to float
  %116 = fadd float %113, %115
  %117 = icmp eq i32 %5, 0
  %118 = bitcast float %116 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %111, <1 x i32> %118, i1 %117) #10
  tail call void @llvm.nvvm.barrier0()
  %119 = load float, ptr addrspace(3) @global_smem, align 16
  %120 = fmul float %119, 0x3F50000000000000
  %121 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg13) #10
  %122 = bitcast i32 %121 to float
  %123 = fadd float %120, %122
  %124 = tail call float @llvm.nvvm.rsqrt.approx.f(float %123)
  %125 = fmul float %124, %23
  %126 = fmul float %124, %24
  %127 = fmul float %124, %25
  %128 = fmul float %124, %26
  %129 = fmul float %124, %32
  %130 = fmul float %124, %33
  %131 = fmul float %124, %34
  %132 = fmul float %124, %35
  %133 = fmul float %124, %41
  %134 = fmul float %124, %42
  %135 = fmul float %124, %43
  %136 = fmul float %124, %44
  %137 = fmul float %124, %50
  %138 = fmul float %124, %51
  %139 = fmul float %124, %52
  %140 = fmul float %124, %53
  %141 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %142 = getelementptr i8, ptr addrspace(1) %141, i64 1024
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %141) #10
  %144 = extractvalue { i32, i32, i32, i32 } %143, 0
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %143, 1
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %143, 2
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractvalue { i32, i32, i32, i32 } %143, 3
  %151 = bitcast i32 %150 to <2 x bfloat>
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = extractelement <2 x bfloat> %151, i64 0
  %159 = extractelement <2 x bfloat> %151, i64 1
  %160 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %142) #10
  %161 = extractvalue { i32, i32, i32, i32 } %160, 0
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractvalue { i32, i32, i32, i32 } %160, 1
  %164 = bitcast i32 %163 to <2 x bfloat>
  %165 = extractvalue { i32, i32, i32, i32 } %160, 2
  %166 = bitcast i32 %165 to <2 x bfloat>
  %167 = extractvalue { i32, i32, i32, i32 } %160, 3
  %168 = bitcast i32 %167 to <2 x bfloat>
  %169 = extractelement <2 x bfloat> %162, i64 0
  %170 = extractelement <2 x bfloat> %162, i64 1
  %171 = extractelement <2 x bfloat> %164, i64 0
  %172 = extractelement <2 x bfloat> %164, i64 1
  %173 = extractelement <2 x bfloat> %166, i64 0
  %174 = extractelement <2 x bfloat> %166, i64 1
  %175 = extractelement <2 x bfloat> %168, i64 0
  %176 = extractelement <2 x bfloat> %168, i64 1
  %177 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %178 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %179 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %180 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %181 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %182 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %183 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %184 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %185 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169) #10
  %186 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170) #10
  %187 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %171) #10
  %188 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %172) #10
  %189 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %173) #10
  %190 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %174) #10
  %191 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %175) #10
  %192 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %176) #10
  %193 = fmul float %125, %177
  %194 = fmul float %126, %178
  %195 = fmul float %127, %179
  %196 = fmul float %128, %180
  %197 = fmul float %129, %181
  %198 = fmul float %130, %182
  %199 = fmul float %131, %183
  %200 = fmul float %132, %184
  %201 = fmul float %133, %185
  %202 = fmul float %134, %186
  %203 = fmul float %135, %187
  %204 = fmul float %136, %188
  %205 = fmul float %137, %189
  %206 = fmul float %138, %190
  %207 = fmul float %139, %191
  %208 = fmul float %140, %192
  %209 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %193) #10
  %210 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %194) #10
  %211 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %195) #10
  %212 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %196) #10
  %213 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %197) #10
  %214 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %198) #10
  %215 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %199) #10
  %216 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %200) #10
  %217 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %201) #10
  %218 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %202) #10
  %219 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %203) #10
  %220 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %204) #10
  %221 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %205) #10
  %222 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %206) #10
  %223 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %207) #10
  %224 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %208) #10
  %225 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %226 = getelementptr bfloat, ptr addrspace(1) %225, i64 %13
  %227 = getelementptr i8, ptr addrspace(1) %226, i64 1024
  %228 = insertelement <2 x bfloat> poison, bfloat %209, i64 0
  %229 = insertelement <2 x bfloat> %228, bfloat %210, i64 1
  %230 = bitcast <2 x bfloat> %229 to i32
  %231 = insertelement <2 x bfloat> poison, bfloat %211, i64 0
  %232 = insertelement <2 x bfloat> %231, bfloat %212, i64 1
  %233 = bitcast <2 x bfloat> %232 to i32
  %234 = insertelement <2 x bfloat> poison, bfloat %213, i64 0
  %235 = insertelement <2 x bfloat> %234, bfloat %214, i64 1
  %236 = bitcast <2 x bfloat> %235 to i32
  %237 = insertelement <2 x bfloat> poison, bfloat %215, i64 0
  %238 = insertelement <2 x bfloat> %237, bfloat %216, i64 1
  %239 = bitcast <2 x bfloat> %238 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %230, i32 %233, i32 %236, i32 %239, ptr addrspace(1) %226) #10
  %240 = insertelement <2 x bfloat> poison, bfloat %217, i64 0
  %241 = insertelement <2 x bfloat> %240, bfloat %218, i64 1
  %242 = bitcast <2 x bfloat> %241 to i32
  %243 = insertelement <2 x bfloat> poison, bfloat %219, i64 0
  %244 = insertelement <2 x bfloat> %243, bfloat %220, i64 1
  %245 = bitcast <2 x bfloat> %244 to i32
  %246 = insertelement <2 x bfloat> poison, bfloat %221, i64 0
  %247 = insertelement <2 x bfloat> %246, bfloat %222, i64 1
  %248 = bitcast <2 x bfloat> %247 to i32
  %249 = insertelement <2 x bfloat> poison, bfloat %223, i64 0
  %250 = insertelement <2 x bfloat> %249, bfloat %224, i64 1
  %251 = bitcast <2 x bfloat> %250 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %242, i32 %245, i32 %248, i32 %251, ptr addrspace(1) %227) #10
  ret void
}

define ptx_kernel void @fusion_116(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1179648) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 2048
  %5 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %6 = and i32 %5, 31
  %7 = lshr i32 %5, 5
  %8 = shl nuw nsw i32 %5, 3
  %9 = and i32 %8, 248
  %10 = icmp samesign ult i32 %5, 32
  %11 = select i1 %10, i32 0, i32 256
  %12 = or disjoint i32 %9, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %3, i64 %13
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #10
  %36 = extractvalue { i32, i32, i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32, i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractvalue { i32, i32, i32, i32 } %35, 2
  %41 = bitcast i32 %40 to <2 x bfloat>
  %42 = extractvalue { i32, i32, i32, i32 } %35, 3
  %43 = bitcast i32 %42 to <2 x bfloat>
  %44 = extractelement <2 x bfloat> %37, i64 0
  %45 = extractelement <2 x bfloat> %37, i64 1
  %46 = extractelement <2 x bfloat> %39, i64 0
  %47 = extractelement <2 x bfloat> %39, i64 1
  %48 = extractelement <2 x bfloat> %41, i64 0
  %49 = extractelement <2 x bfloat> %41, i64 1
  %50 = extractelement <2 x bfloat> %43, i64 0
  %51 = extractelement <2 x bfloat> %43, i64 1
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #10
  %73 = extractvalue { i32, i32, i32, i32 } %72, 0
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %72, 1
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %72, 2
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractvalue { i32, i32, i32, i32 } %72, 3
  %80 = bitcast i32 %79 to <2 x bfloat>
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = extractelement <2 x bfloat> %80, i64 0
  %88 = extractelement <2 x bfloat> %80, i64 1
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
  %90 = extractvalue { i32, i32, i32, i32 } %89, 0
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %89, 1
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %89, 2
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractvalue { i32, i32, i32, i32 } %89, 3
  %97 = bitcast i32 %96 to <2 x bfloat>
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = extractelement <2 x bfloat> %97, i64 0
  %105 = extractelement <2 x bfloat> %97, i64 1
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = getelementptr float, ptr addrspace(1) %arg13, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
  %155 = extractvalue { i32, i32, i32, i32 } %154, 0
  %156 = extractvalue { i32, i32, i32, i32 } %154, 1
  %157 = extractvalue { i32, i32, i32, i32 } %154, 2
  %158 = extractvalue { i32, i32, i32, i32 } %154, 3
  %159 = bitcast i32 %155 to float
  %160 = bitcast i32 %156 to float
  %161 = bitcast i32 %157 to float
  %162 = bitcast i32 %158 to float
  %163 = fadd float %106, %132
  %164 = fadd float %107, %133
  %165 = fadd float %108, %134
  %166 = fadd float %109, %135
  %167 = fadd float %110, %141
  %168 = fadd float %111, %142
  %169 = fadd float %112, %143
  %170 = fadd float %113, %144
  %171 = fadd float %114, %150
  %172 = fadd float %115, %151
  %173 = fadd float %116, %152
  %174 = fadd float %117, %153
  %175 = fadd float %118, %159
  %176 = fadd float %119, %160
  %177 = fadd float %120, %161
  %178 = fadd float %121, %162
  %179 = fadd float %52, %163
  %180 = fadd float %53, %164
  %181 = fadd float %54, %165
  %182 = fadd float %55, %166
  %183 = fadd float %56, %167
  %184 = fadd float %57, %168
  %185 = fadd float %58, %169
  %186 = fadd float %59, %170
  %187 = fadd float %60, %171
  %188 = fadd float %61, %172
  %189 = fadd float %62, %173
  %190 = fadd float %63, %174
  %191 = fadd float %64, %175
  %192 = fadd float %65, %176
  %193 = fadd float %66, %177
  %194 = fadd float %67, %178
  %195 = fmul float %179, %179
  %196 = fmul float %180, %180
  %197 = fmul float %181, %181
  %198 = fmul float %182, %182
  %199 = fmul float %183, %183
  %200 = fmul float %184, %184
  %201 = fmul float %185, %185
  %202 = fmul float %186, %186
  %203 = fmul float %187, %187
  %204 = fmul float %188, %188
  %205 = fmul float %189, %189
  %206 = fmul float %190, %190
  %207 = fmul float %191, %191
  %208 = fmul float %192, %192
  %209 = fmul float %193, %193
  %210 = fmul float %194, %194
  %211 = fadd float %195, %196
  %212 = fadd float %197, %211
  %213 = fadd float %198, %212
  %214 = fadd float %199, %213
  %215 = fadd float %200, %214
  %216 = fadd float %201, %215
  %217 = fadd float %202, %216
  %218 = fadd float %203, %217
  %219 = fadd float %204, %218
  %220 = fadd float %205, %219
  %221 = fadd float %206, %220
  %222 = fadd float %207, %221
  %223 = fadd float %208, %222
  %224 = fadd float %209, %223
  %225 = fadd float %210, %224
  %226 = bitcast float %225 to i32
  %227 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %226, i32 16, i32 31)
  %228 = bitcast i32 %227 to float
  %229 = fadd float %225, %228
  %230 = bitcast float %229 to i32
  %231 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %230, i32 8, i32 31)
  %232 = bitcast i32 %231 to float
  %233 = fadd float %229, %232
  %234 = bitcast float %233 to i32
  %235 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %234, i32 4, i32 31)
  %236 = bitcast i32 %235 to float
  %237 = fadd float %233, %236
  %238 = bitcast float %237 to i32
  %239 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %238, i32 2, i32 31)
  %240 = bitcast i32 %239 to float
  %241 = fadd float %237, %240
  %242 = bitcast float %241 to i32
  %243 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %242, i32 1, i32 31)
  %244 = bitcast i32 %243 to float
  %245 = fadd float %241, %244
  %246 = icmp eq i32 %6, 0
  %247 = zext nneg i32 %7 to i64
  %248 = getelementptr float, ptr addrspace(3) @global_smem, i64 %247
  %249 = bitcast float %245 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #10
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #10
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #10
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %263 = bitcast i32 %262 to float
  %264 = fadd float %261, %263
  %265 = tail call float @llvm.nvvm.rsqrt.approx.f(float %264)
  %266 = fmul float %179, %265
  %267 = fmul float %180, %265
  %268 = fmul float %181, %265
  %269 = fmul float %182, %265
  %270 = fmul float %183, %265
  %271 = fmul float %184, %265
  %272 = fmul float %185, %265
  %273 = fmul float %186, %265
  %274 = fmul float %187, %265
  %275 = fmul float %188, %265
  %276 = fmul float %189, %265
  %277 = fmul float %190, %265
  %278 = fmul float %191, %265
  %279 = fmul float %192, %265
  %280 = fmul float %193, %265
  %281 = fmul float %194, %265
  %282 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #10
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractvalue { i32, i32, i32, i32 } %284, 1
  %288 = bitcast i32 %287 to <2 x bfloat>
  %289 = extractvalue { i32, i32, i32, i32 } %284, 2
  %290 = bitcast i32 %289 to <2 x bfloat>
  %291 = extractvalue { i32, i32, i32, i32 } %284, 3
  %292 = bitcast i32 %291 to <2 x bfloat>
  %293 = extractelement <2 x bfloat> %286, i64 0
  %294 = extractelement <2 x bfloat> %286, i64 1
  %295 = extractelement <2 x bfloat> %288, i64 0
  %296 = extractelement <2 x bfloat> %288, i64 1
  %297 = extractelement <2 x bfloat> %290, i64 0
  %298 = extractelement <2 x bfloat> %290, i64 1
  %299 = extractelement <2 x bfloat> %292, i64 0
  %300 = extractelement <2 x bfloat> %292, i64 1
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #10
  %302 = extractvalue { i32, i32, i32, i32 } %301, 0
  %303 = bitcast i32 %302 to <2 x bfloat>
  %304 = extractvalue { i32, i32, i32, i32 } %301, 1
  %305 = bitcast i32 %304 to <2 x bfloat>
  %306 = extractvalue { i32, i32, i32, i32 } %301, 2
  %307 = bitcast i32 %306 to <2 x bfloat>
  %308 = extractvalue { i32, i32, i32, i32 } %301, 3
  %309 = bitcast i32 %308 to <2 x bfloat>
  %310 = extractelement <2 x bfloat> %303, i64 0
  %311 = extractelement <2 x bfloat> %303, i64 1
  %312 = extractelement <2 x bfloat> %305, i64 0
  %313 = extractelement <2 x bfloat> %305, i64 1
  %314 = extractelement <2 x bfloat> %307, i64 0
  %315 = extractelement <2 x bfloat> %307, i64 1
  %316 = extractelement <2 x bfloat> %309, i64 0
  %317 = extractelement <2 x bfloat> %309, i64 1
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #10
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #10
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = fmul float %266, %318
  %335 = fmul float %267, %319
  %336 = fmul float %268, %320
  %337 = fmul float %269, %321
  %338 = fmul float %270, %322
  %339 = fmul float %271, %323
  %340 = fmul float %272, %324
  %341 = fmul float %273, %325
  %342 = fmul float %274, %326
  %343 = fmul float %275, %327
  %344 = fmul float %276, %328
  %345 = fmul float %277, %329
  %346 = fmul float %278, %330
  %347 = fmul float %279, %331
  %348 = fmul float %280, %332
  %349 = fmul float %281, %333
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #10
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #10
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #10
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #10
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #10
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #10
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #10
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #10
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #10
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #10
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #10
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #10
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #10
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #10
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #10
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #10
  %366 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %367 = getelementptr bfloat, ptr addrspace(1) %366, i64 %13
  %368 = getelementptr i8, ptr addrspace(1) %367, i64 1024
  %369 = insertelement <2 x bfloat> poison, bfloat %350, i64 0
  %370 = insertelement <2 x bfloat> %369, bfloat %351, i64 1
  %371 = bitcast <2 x bfloat> %370 to i32
  %372 = insertelement <2 x bfloat> poison, bfloat %352, i64 0
  %373 = insertelement <2 x bfloat> %372, bfloat %353, i64 1
  %374 = bitcast <2 x bfloat> %373 to i32
  %375 = insertelement <2 x bfloat> poison, bfloat %354, i64 0
  %376 = insertelement <2 x bfloat> %375, bfloat %355, i64 1
  %377 = bitcast <2 x bfloat> %376 to i32
  %378 = insertelement <2 x bfloat> poison, bfloat %356, i64 0
  %379 = insertelement <2 x bfloat> %378, bfloat %357, i64 1
  %380 = bitcast <2 x bfloat> %379 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #10
  %381 = insertelement <2 x bfloat> poison, bfloat %358, i64 0
  %382 = insertelement <2 x bfloat> %381, bfloat %359, i64 1
  %383 = bitcast <2 x bfloat> %382 to i32
  %384 = insertelement <2 x bfloat> poison, bfloat %360, i64 0
  %385 = insertelement <2 x bfloat> %384, bfloat %361, i64 1
  %386 = bitcast <2 x bfloat> %385 to i32
  %387 = insertelement <2 x bfloat> poison, bfloat %362, i64 0
  %388 = insertelement <2 x bfloat> %387, bfloat %363, i64 1
  %389 = bitcast <2 x bfloat> %388 to i32
  %390 = insertelement <2 x bfloat> poison, bfloat %364, i64 0
  %391 = insertelement <2 x bfloat> %390, bfloat %365, i64 1
  %392 = bitcast <2 x bfloat> %391 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #10
  ret void
}

define ptx_kernel void @fusion_115(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(1179648) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 18432
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %5 = and i32 %4, 31
  %6 = lshr i32 %4, 5
  %7 = shl nuw nsw i32 %4, 3
  %8 = and i32 %7, 248
  %9 = icmp samesign ult i32 %4, 32
  %10 = select i1 %9, i32 0, i32 256
  %11 = or disjoint i32 %8, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr bfloat, ptr addrspace(1) %3, i64 %12
  %14 = getelementptr i8, ptr addrspace(1) %13, i64 1024
  %15 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %13) #10
  %16 = extractvalue { i32, i32, i32, i32 } %15, 0
  %17 = bitcast i32 %16 to <2 x bfloat>
  %18 = extractvalue { i32, i32, i32, i32 } %15, 1
  %19 = bitcast i32 %18 to <2 x bfloat>
  %20 = extractvalue { i32, i32, i32, i32 } %15, 2
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %15, 3
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractelement <2 x bfloat> %17, i64 0
  %25 = extractelement <2 x bfloat> %17, i64 1
  %26 = extractelement <2 x bfloat> %19, i64 0
  %27 = extractelement <2 x bfloat> %19, i64 1
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #10
  %33 = extractvalue { i32, i32, i32, i32 } %32, 0
  %34 = bitcast i32 %33 to <2 x bfloat>
  %35 = extractvalue { i32, i32, i32, i32 } %32, 1
  %36 = bitcast i32 %35 to <2 x bfloat>
  %37 = extractvalue { i32, i32, i32, i32 } %32, 2
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractvalue { i32, i32, i32, i32 } %32, 3
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractelement <2 x bfloat> %34, i64 0
  %42 = extractelement <2 x bfloat> %34, i64 1
  %43 = extractelement <2 x bfloat> %36, i64 0
  %44 = extractelement <2 x bfloat> %36, i64 1
  %45 = extractelement <2 x bfloat> %38, i64 0
  %46 = extractelement <2 x bfloat> %38, i64 1
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #10
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = shl nsw i64 %2, 10
  %66 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %65
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %12
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #10
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #10
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = getelementptr i8, ptr addrspace(1) %3, i64 2048
  %120 = getelementptr i8, ptr addrspace(1) %13, i64 2048
  %121 = getelementptr bfloat, ptr addrspace(1) %119, i64 %12
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #10
  %124 = extractvalue { i32, i32, i32, i32 } %123, 0
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractvalue { i32, i32, i32, i32 } %123, 1
  %127 = bitcast i32 %126 to <2 x bfloat>
  %128 = extractvalue { i32, i32, i32, i32 } %123, 2
  %129 = bitcast i32 %128 to <2 x bfloat>
  %130 = extractvalue { i32, i32, i32, i32 } %123, 3
  %131 = bitcast i32 %130 to <2 x bfloat>
  %132 = extractelement <2 x bfloat> %125, i64 0
  %133 = extractelement <2 x bfloat> %125, i64 1
  %134 = extractelement <2 x bfloat> %127, i64 0
  %135 = extractelement <2 x bfloat> %127, i64 1
  %136 = extractelement <2 x bfloat> %129, i64 0
  %137 = extractelement <2 x bfloat> %129, i64 1
  %138 = extractelement <2 x bfloat> %131, i64 0
  %139 = extractelement <2 x bfloat> %131, i64 1
  %140 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %122) #10
  %141 = extractvalue { i32, i32, i32, i32 } %140, 0
  %142 = bitcast i32 %141 to <2 x bfloat>
  %143 = extractvalue { i32, i32, i32, i32 } %140, 1
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractvalue { i32, i32, i32, i32 } %140, 2
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractvalue { i32, i32, i32, i32 } %140, 3
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractelement <2 x bfloat> %142, i64 0
  %150 = extractelement <2 x bfloat> %142, i64 1
  %151 = extractelement <2 x bfloat> %144, i64 0
  %152 = extractelement <2 x bfloat> %144, i64 1
  %153 = extractelement <2 x bfloat> %146, i64 0
  %154 = extractelement <2 x bfloat> %146, i64 1
  %155 = extractelement <2 x bfloat> %148, i64 0
  %156 = extractelement <2 x bfloat> %148, i64 1
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %65
  %174 = getelementptr bfloat, ptr addrspace(1) %173, i64 %12
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #10
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractelement <2 x bfloat> %178, i64 0
  %186 = extractelement <2 x bfloat> %178, i64 1
  %187 = extractelement <2 x bfloat> %180, i64 0
  %188 = extractelement <2 x bfloat> %180, i64 1
  %189 = extractelement <2 x bfloat> %182, i64 0
  %190 = extractelement <2 x bfloat> %182, i64 1
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #10
  %194 = extractvalue { i32, i32, i32, i32 } %193, 0
  %195 = bitcast i32 %194 to <2 x bfloat>
  %196 = extractvalue { i32, i32, i32, i32 } %193, 1
  %197 = bitcast i32 %196 to <2 x bfloat>
  %198 = extractvalue { i32, i32, i32, i32 } %193, 2
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %193, 3
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractelement <2 x bfloat> %195, i64 0
  %203 = extractelement <2 x bfloat> %195, i64 1
  %204 = extractelement <2 x bfloat> %197, i64 0
  %205 = extractelement <2 x bfloat> %197, i64 1
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = getelementptr float, ptr addrspace(1) %arg25, i64 %65
  %227 = getelementptr float, ptr addrspace(1) %226, i64 %12
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 16
  %229 = getelementptr i8, ptr addrspace(1) %227, i64 2048
  %230 = getelementptr i8, ptr addrspace(1) %227, i64 2064
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #10
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = extractvalue { i32, i32, i32, i32 } %231, 1
  %234 = extractvalue { i32, i32, i32, i32 } %231, 2
  %235 = extractvalue { i32, i32, i32, i32 } %231, 3
  %236 = bitcast i32 %232 to float
  %237 = bitcast i32 %233 to float
  %238 = bitcast i32 %234 to float
  %239 = bitcast i32 %235 to float
  %240 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
  %241 = extractvalue { i32, i32, i32, i32 } %240, 0
  %242 = extractvalue { i32, i32, i32, i32 } %240, 1
  %243 = extractvalue { i32, i32, i32, i32 } %240, 2
  %244 = extractvalue { i32, i32, i32, i32 } %240, 3
  %245 = bitcast i32 %241 to float
  %246 = bitcast i32 %242 to float
  %247 = bitcast i32 %243 to float
  %248 = bitcast i32 %244 to float
  %249 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #10
  %250 = extractvalue { i32, i32, i32, i32 } %249, 0
  %251 = extractvalue { i32, i32, i32, i32 } %249, 1
  %252 = extractvalue { i32, i32, i32, i32 } %249, 2
  %253 = extractvalue { i32, i32, i32, i32 } %249, 3
  %254 = bitcast i32 %250 to float
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %259 = extractvalue { i32, i32, i32, i32 } %258, 0
  %260 = extractvalue { i32, i32, i32, i32 } %258, 1
  %261 = extractvalue { i32, i32, i32, i32 } %258, 2
  %262 = extractvalue { i32, i32, i32, i32 } %258, 3
  %263 = bitcast i32 %259 to float
  %264 = bitcast i32 %260 to float
  %265 = bitcast i32 %261 to float
  %266 = bitcast i32 %262 to float
  %267 = fadd float %210, %236
  %268 = fadd float %211, %237
  %269 = fadd float %212, %238
  %270 = fadd float %213, %239
  %271 = fadd float %214, %245
  %272 = fadd float %215, %246
  %273 = fadd float %216, %247
  %274 = fadd float %217, %248
  %275 = fadd float %218, %254
  %276 = fadd float %219, %255
  %277 = fadd float %220, %256
  %278 = fadd float %221, %257
  %279 = fadd float %222, %263
  %280 = fadd float %223, %264
  %281 = fadd float %224, %265
  %282 = fadd float %225, %266
  %283 = fadd float %157, %267
  %284 = fadd float %158, %268
  %285 = fadd float %159, %269
  %286 = fadd float %160, %270
  %287 = fadd float %161, %271
  %288 = fadd float %162, %272
  %289 = fadd float %163, %273
  %290 = fadd float %164, %274
  %291 = fadd float %165, %275
  %292 = fadd float %166, %276
  %293 = fadd float %167, %277
  %294 = fadd float %168, %278
  %295 = fadd float %169, %279
  %296 = fadd float %170, %280
  %297 = fadd float %171, %281
  %298 = fadd float %172, %282
  %299 = fadd float %103, %283
  %300 = fadd float %104, %284
  %301 = fadd float %105, %285
  %302 = fadd float %106, %286
  %303 = fadd float %107, %287
  %304 = fadd float %108, %288
  %305 = fadd float %109, %289
  %306 = fadd float %110, %290
  %307 = fadd float %111, %291
  %308 = fadd float %112, %292
  %309 = fadd float %113, %293
  %310 = fadd float %114, %294
  %311 = fadd float %115, %295
  %312 = fadd float %116, %296
  %313 = fadd float %117, %297
  %314 = fadd float %118, %298
  %315 = fadd float %49, %299
  %316 = fadd float %50, %300
  %317 = fadd float %51, %301
  %318 = fadd float %52, %302
  %319 = fadd float %53, %303
  %320 = fadd float %54, %304
  %321 = fadd float %55, %305
  %322 = fadd float %56, %306
  %323 = fadd float %57, %307
  %324 = fadd float %58, %308
  %325 = fadd float %59, %309
  %326 = fadd float %60, %310
  %327 = fadd float %61, %311
  %328 = fadd float %62, %312
  %329 = fadd float %63, %313
  %330 = fadd float %64, %314
  %331 = fmul float %315, %315
  %332 = fmul float %316, %316
  %333 = fmul float %317, %317
  %334 = fmul float %318, %318
  %335 = fmul float %319, %319
  %336 = fmul float %320, %320
  %337 = fmul float %321, %321
  %338 = fmul float %322, %322
  %339 = fmul float %323, %323
  %340 = fmul float %324, %324
  %341 = fmul float %325, %325
  %342 = fmul float %326, %326
  %343 = fmul float %327, %327
  %344 = fmul float %328, %328
  %345 = fmul float %329, %329
  %346 = fmul float %330, %330
  %347 = fadd float %331, %332
  %348 = fadd float %333, %347
  %349 = fadd float %334, %348
  %350 = fadd float %335, %349
  %351 = fadd float %336, %350
  %352 = fadd float %337, %351
  %353 = fadd float %338, %352
  %354 = fadd float %339, %353
  %355 = fadd float %340, %354
  %356 = fadd float %341, %355
  %357 = fadd float %342, %356
  %358 = fadd float %343, %357
  %359 = fadd float %344, %358
  %360 = fadd float %345, %359
  %361 = fadd float %346, %360
  %362 = bitcast float %361 to i32
  %363 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %362, i32 16, i32 31)
  %364 = bitcast i32 %363 to float
  %365 = fadd float %361, %364
  %366 = bitcast float %365 to i32
  %367 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %366, i32 8, i32 31)
  %368 = bitcast i32 %367 to float
  %369 = fadd float %365, %368
  %370 = bitcast float %369 to i32
  %371 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %370, i32 4, i32 31)
  %372 = bitcast i32 %371 to float
  %373 = fadd float %369, %372
  %374 = bitcast float %373 to i32
  %375 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %374, i32 2, i32 31)
  %376 = bitcast i32 %375 to float
  %377 = fadd float %373, %376
  %378 = bitcast float %377 to i32
  %379 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %378, i32 1, i32 31)
  %380 = bitcast i32 %379 to float
  %381 = fadd float %377, %380
  %382 = icmp eq i32 %5, 0
  %383 = zext nneg i32 %6 to i64
  %384 = getelementptr float, ptr addrspace(3) @global_smem, i64 %383
  %385 = bitcast float %381 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %384, <1 x i32> %385, i1 %382) #10
  tail call void @llvm.nvvm.barrier0()
  %386 = icmp samesign ult i32 %4, 2
  %387 = zext nneg i32 %4 to i64
  %388 = getelementptr float, ptr addrspace(3) @global_smem, i64 %387
  %389 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %388, i1 %386) #10
  %390 = bitcast i32 %389 to float
  %391 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %389, i32 1, i32 31)
  %392 = bitcast i32 %391 to float
  %393 = fadd float %390, %392
  %394 = icmp eq i32 %4, 0
  %395 = bitcast float %393 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %388, <1 x i32> %395, i1 %394) #10
  tail call void @llvm.nvvm.barrier0()
  %396 = load float, ptr addrspace(3) @global_smem, align 16
  %397 = fmul float %396, 0x3F50000000000000
  %398 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %399 = bitcast i32 %398 to float
  %400 = fadd float %397, %399
  %401 = tail call float @llvm.nvvm.rsqrt.approx.f(float %400)
  %402 = fmul float %315, %401
  %403 = fmul float %316, %401
  %404 = fmul float %317, %401
  %405 = fmul float %318, %401
  %406 = fmul float %319, %401
  %407 = fmul float %320, %401
  %408 = fmul float %321, %401
  %409 = fmul float %322, %401
  %410 = fmul float %323, %401
  %411 = fmul float %324, %401
  %412 = fmul float %325, %401
  %413 = fmul float %326, %401
  %414 = fmul float %327, %401
  %415 = fmul float %328, %401
  %416 = fmul float %329, %401
  %417 = fmul float %330, %401
  %418 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %12
  %419 = getelementptr i8, ptr addrspace(1) %418, i64 1024
  %420 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %418) #10
  %421 = extractvalue { i32, i32, i32, i32 } %420, 0
  %422 = bitcast i32 %421 to <2 x bfloat>
  %423 = extractvalue { i32, i32, i32, i32 } %420, 1
  %424 = bitcast i32 %423 to <2 x bfloat>
  %425 = extractvalue { i32, i32, i32, i32 } %420, 2
  %426 = bitcast i32 %425 to <2 x bfloat>
  %427 = extractvalue { i32, i32, i32, i32 } %420, 3
  %428 = bitcast i32 %427 to <2 x bfloat>
  %429 = extractelement <2 x bfloat> %422, i64 0
  %430 = extractelement <2 x bfloat> %422, i64 1
  %431 = extractelement <2 x bfloat> %424, i64 0
  %432 = extractelement <2 x bfloat> %424, i64 1
  %433 = extractelement <2 x bfloat> %426, i64 0
  %434 = extractelement <2 x bfloat> %426, i64 1
  %435 = extractelement <2 x bfloat> %428, i64 0
  %436 = extractelement <2 x bfloat> %428, i64 1
  %437 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %419) #10
  %438 = extractvalue { i32, i32, i32, i32 } %437, 0
  %439 = bitcast i32 %438 to <2 x bfloat>
  %440 = extractvalue { i32, i32, i32, i32 } %437, 1
  %441 = bitcast i32 %440 to <2 x bfloat>
  %442 = extractvalue { i32, i32, i32, i32 } %437, 2
  %443 = bitcast i32 %442 to <2 x bfloat>
  %444 = extractvalue { i32, i32, i32, i32 } %437, 3
  %445 = bitcast i32 %444 to <2 x bfloat>
  %446 = extractelement <2 x bfloat> %439, i64 0
  %447 = extractelement <2 x bfloat> %439, i64 1
  %448 = extractelement <2 x bfloat> %441, i64 0
  %449 = extractelement <2 x bfloat> %441, i64 1
  %450 = extractelement <2 x bfloat> %443, i64 0
  %451 = extractelement <2 x bfloat> %443, i64 1
  %452 = extractelement <2 x bfloat> %445, i64 0
  %453 = extractelement <2 x bfloat> %445, i64 1
  %454 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %429) #10
  %455 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430) #10
  %456 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #10
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #10
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %446) #10
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447) #10
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448) #10
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #10
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #10
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #10
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #10
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %470 = fmul float %402, %454
  %471 = fmul float %403, %455
  %472 = fmul float %404, %456
  %473 = fmul float %405, %457
  %474 = fmul float %406, %458
  %475 = fmul float %407, %459
  %476 = fmul float %408, %460
  %477 = fmul float %409, %461
  %478 = fmul float %410, %462
  %479 = fmul float %411, %463
  %480 = fmul float %412, %464
  %481 = fmul float %413, %465
  %482 = fmul float %414, %466
  %483 = fmul float %415, %467
  %484 = fmul float %416, %468
  %485 = fmul float %417, %469
  %486 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %470) #10
  %487 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %471) #10
  %488 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %472) #10
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #10
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #10
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #10
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #10
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #10
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #10
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #10
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #10
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #10
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #10
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #10
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #10
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #10
  %502 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %65
  %503 = getelementptr bfloat, ptr addrspace(1) %502, i64 %12
  %504 = getelementptr i8, ptr addrspace(1) %503, i64 1024
  %505 = insertelement <2 x bfloat> poison, bfloat %486, i64 0
  %506 = insertelement <2 x bfloat> %505, bfloat %487, i64 1
  %507 = bitcast <2 x bfloat> %506 to i32
  %508 = insertelement <2 x bfloat> poison, bfloat %488, i64 0
  %509 = insertelement <2 x bfloat> %508, bfloat %489, i64 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> poison, bfloat %490, i64 0
  %512 = insertelement <2 x bfloat> %511, bfloat %491, i64 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> poison, bfloat %492, i64 0
  %515 = insertelement <2 x bfloat> %514, bfloat %493, i64 1
  %516 = bitcast <2 x bfloat> %515 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %507, i32 %510, i32 %513, i32 %516, ptr addrspace(1) %503) #10
  %517 = insertelement <2 x bfloat> poison, bfloat %494, i64 0
  %518 = insertelement <2 x bfloat> %517, bfloat %495, i64 1
  %519 = bitcast <2 x bfloat> %518 to i32
  %520 = insertelement <2 x bfloat> poison, bfloat %496, i64 0
  %521 = insertelement <2 x bfloat> %520, bfloat %497, i64 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> poison, bfloat %498, i64 0
  %524 = insertelement <2 x bfloat> %523, bfloat %499, i64 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> poison, bfloat %500, i64 0
  %527 = insertelement <2 x bfloat> %526, bfloat %501, i64 1
  %528 = bitcast <2 x bfloat> %527 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %519, i32 %522, i32 %525, i32 %528, ptr addrspace(1) %504) #10
  ret void
}

define ptx_kernel void @fusion_113(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(1179648) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
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
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #10
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
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #10
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
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #10
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %.idx = mul nsw i64 %2, 18432
  %66 = getelementptr i8, ptr addrspace(1) %arg511, i64 %.idx
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %13
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #10
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #10
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #10
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %13
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 1024
  %122 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #10
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
  %139 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #10
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
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #10
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #10
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = getelementptr i8, ptr addrspace(1) %66, i64 2048
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr bfloat, ptr addrspace(1) %172, i64 %13
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %173) #10
  %177 = extractvalue { i32, i32, i32, i32 } %176, 0
  %178 = bitcast i32 %177 to <2 x bfloat>
  %179 = extractvalue { i32, i32, i32, i32 } %176, 1
  %180 = bitcast i32 %179 to <2 x bfloat>
  %181 = extractvalue { i32, i32, i32, i32 } %176, 2
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %176, 3
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractelement <2 x bfloat> %178, i64 0
  %186 = extractelement <2 x bfloat> %178, i64 1
  %187 = extractelement <2 x bfloat> %180, i64 0
  %188 = extractelement <2 x bfloat> %180, i64 1
  %189 = extractelement <2 x bfloat> %182, i64 0
  %190 = extractelement <2 x bfloat> %182, i64 1
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #10
  %194 = extractvalue { i32, i32, i32, i32 } %193, 0
  %195 = bitcast i32 %194 to <2 x bfloat>
  %196 = extractvalue { i32, i32, i32, i32 } %193, 1
  %197 = bitcast i32 %196 to <2 x bfloat>
  %198 = extractvalue { i32, i32, i32, i32 } %193, 2
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %193, 3
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractelement <2 x bfloat> %195, i64 0
  %203 = extractelement <2 x bfloat> %195, i64 1
  %204 = extractelement <2 x bfloat> %197, i64 0
  %205 = extractelement <2 x bfloat> %197, i64 1
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #10
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %227 = getelementptr bfloat, ptr addrspace(1) %226, i64 %13
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 1024
  %229 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #10
  %230 = extractvalue { i32, i32, i32, i32 } %229, 0
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %229, 1
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %229, 2
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %229, 3
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
  %247 = extractvalue { i32, i32, i32, i32 } %246, 0
  %248 = bitcast i32 %247 to <2 x bfloat>
  %249 = extractvalue { i32, i32, i32, i32 } %246, 1
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %246, 2
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %246, 3
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractelement <2 x bfloat> %248, i64 0
  %256 = extractelement <2 x bfloat> %248, i64 1
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = getelementptr float, ptr addrspace(1) %arg37, i64 %3
  %280 = getelementptr float, ptr addrspace(1) %279, i64 %13
  %281 = getelementptr i8, ptr addrspace(1) %280, i64 16
  %282 = getelementptr i8, ptr addrspace(1) %280, i64 2048
  %283 = getelementptr i8, ptr addrspace(1) %280, i64 2064
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %280) #10
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = extractvalue { i32, i32, i32, i32 } %284, 1
  %287 = extractvalue { i32, i32, i32, i32 } %284, 2
  %288 = extractvalue { i32, i32, i32, i32 } %284, 3
  %289 = bitcast i32 %285 to float
  %290 = bitcast i32 %286 to float
  %291 = bitcast i32 %287 to float
  %292 = bitcast i32 %288 to float
  %293 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #10
  %294 = extractvalue { i32, i32, i32, i32 } %293, 0
  %295 = extractvalue { i32, i32, i32, i32 } %293, 1
  %296 = extractvalue { i32, i32, i32, i32 } %293, 2
  %297 = extractvalue { i32, i32, i32, i32 } %293, 3
  %298 = bitcast i32 %294 to float
  %299 = bitcast i32 %295 to float
  %300 = bitcast i32 %296 to float
  %301 = bitcast i32 %297 to float
  %302 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #10
  %303 = extractvalue { i32, i32, i32, i32 } %302, 0
  %304 = extractvalue { i32, i32, i32, i32 } %302, 1
  %305 = extractvalue { i32, i32, i32, i32 } %302, 2
  %306 = extractvalue { i32, i32, i32, i32 } %302, 3
  %307 = bitcast i32 %303 to float
  %308 = bitcast i32 %304 to float
  %309 = bitcast i32 %305 to float
  %310 = bitcast i32 %306 to float
  %311 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #10
  %312 = extractvalue { i32, i32, i32, i32 } %311, 0
  %313 = extractvalue { i32, i32, i32, i32 } %311, 1
  %314 = extractvalue { i32, i32, i32, i32 } %311, 2
  %315 = extractvalue { i32, i32, i32, i32 } %311, 3
  %316 = bitcast i32 %312 to float
  %317 = bitcast i32 %313 to float
  %318 = bitcast i32 %314 to float
  %319 = bitcast i32 %315 to float
  %320 = fadd float %263, %289
  %321 = fadd float %264, %290
  %322 = fadd float %265, %291
  %323 = fadd float %266, %292
  %324 = fadd float %267, %298
  %325 = fadd float %268, %299
  %326 = fadd float %269, %300
  %327 = fadd float %270, %301
  %328 = fadd float %271, %307
  %329 = fadd float %272, %308
  %330 = fadd float %273, %309
  %331 = fadd float %274, %310
  %332 = fadd float %275, %316
  %333 = fadd float %276, %317
  %334 = fadd float %277, %318
  %335 = fadd float %278, %319
  %336 = fadd float %210, %320
  %337 = fadd float %211, %321
  %338 = fadd float %212, %322
  %339 = fadd float %213, %323
  %340 = fadd float %214, %324
  %341 = fadd float %215, %325
  %342 = fadd float %216, %326
  %343 = fadd float %217, %327
  %344 = fadd float %218, %328
  %345 = fadd float %219, %329
  %346 = fadd float %220, %330
  %347 = fadd float %221, %331
  %348 = fadd float %222, %332
  %349 = fadd float %223, %333
  %350 = fadd float %224, %334
  %351 = fadd float %225, %335
  %352 = fadd float %156, %336
  %353 = fadd float %157, %337
  %354 = fadd float %158, %338
  %355 = fadd float %159, %339
  %356 = fadd float %160, %340
  %357 = fadd float %161, %341
  %358 = fadd float %162, %342
  %359 = fadd float %163, %343
  %360 = fadd float %164, %344
  %361 = fadd float %165, %345
  %362 = fadd float %166, %346
  %363 = fadd float %167, %347
  %364 = fadd float %168, %348
  %365 = fadd float %169, %349
  %366 = fadd float %170, %350
  %367 = fadd float %171, %351
  %368 = fadd float %103, %352
  %369 = fadd float %104, %353
  %370 = fadd float %105, %354
  %371 = fadd float %106, %355
  %372 = fadd float %107, %356
  %373 = fadd float %108, %357
  %374 = fadd float %109, %358
  %375 = fadd float %110, %359
  %376 = fadd float %111, %360
  %377 = fadd float %112, %361
  %378 = fadd float %113, %362
  %379 = fadd float %114, %363
  %380 = fadd float %115, %364
  %381 = fadd float %116, %365
  %382 = fadd float %117, %366
  %383 = fadd float %118, %367
  %384 = fadd float %50, %368
  %385 = fadd float %51, %369
  %386 = fadd float %52, %370
  %387 = fadd float %53, %371
  %388 = fadd float %54, %372
  %389 = fadd float %55, %373
  %390 = fadd float %56, %374
  %391 = fadd float %57, %375
  %392 = fadd float %58, %376
  %393 = fadd float %59, %377
  %394 = fadd float %60, %378
  %395 = fadd float %61, %379
  %396 = fadd float %62, %380
  %397 = fadd float %63, %381
  %398 = fadd float %64, %382
  %399 = fadd float %65, %383
  %400 = fmul float %384, %384
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
  %416 = fadd float %400, %401
  %417 = fadd float %402, %416
  %418 = fadd float %403, %417
  %419 = fadd float %404, %418
  %420 = fadd float %405, %419
  %421 = fadd float %406, %420
  %422 = fadd float %407, %421
  %423 = fadd float %408, %422
  %424 = fadd float %409, %423
  %425 = fadd float %410, %424
  %426 = fadd float %411, %425
  %427 = fadd float %412, %426
  %428 = fadd float %413, %427
  %429 = fadd float %414, %428
  %430 = fadd float %415, %429
  %431 = bitcast float %430 to i32
  %432 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %431, i32 16, i32 31)
  %433 = bitcast i32 %432 to float
  %434 = fadd float %430, %433
  %435 = bitcast float %434 to i32
  %436 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %435, i32 8, i32 31)
  %437 = bitcast i32 %436 to float
  %438 = fadd float %434, %437
  %439 = bitcast float %438 to i32
  %440 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %439, i32 4, i32 31)
  %441 = bitcast i32 %440 to float
  %442 = fadd float %438, %441
  %443 = bitcast float %442 to i32
  %444 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %443, i32 2, i32 31)
  %445 = bitcast i32 %444 to float
  %446 = fadd float %442, %445
  %447 = bitcast float %446 to i32
  %448 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %447, i32 1, i32 31)
  %449 = bitcast i32 %448 to float
  %450 = fadd float %446, %449
  %451 = icmp eq i32 %6, 0
  %452 = zext nneg i32 %7 to i64
  %453 = getelementptr float, ptr addrspace(3) @global_smem, i64 %452
  %454 = bitcast float %450 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %453, <1 x i32> %454, i1 %451) #10
  tail call void @llvm.nvvm.barrier0()
  %455 = icmp samesign ult i32 %5, 2
  %456 = zext nneg i32 %5 to i64
  %457 = getelementptr float, ptr addrspace(3) @global_smem, i64 %456
  %458 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %457, i1 %455) #10
  %459 = bitcast i32 %458 to float
  %460 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %458, i32 1, i32 31)
  %461 = bitcast i32 %460 to float
  %462 = fadd float %459, %461
  %463 = icmp eq i32 %5, 0
  %464 = bitcast float %462 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %457, <1 x i32> %464, i1 %463) #10
  tail call void @llvm.nvvm.barrier0()
  %465 = load float, ptr addrspace(3) @global_smem, align 16
  %466 = fmul float %465, 0x3F50000000000000
  %467 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %468 = bitcast i32 %467 to float
  %469 = fadd float %466, %468
  %470 = tail call float @llvm.nvvm.rsqrt.approx.f(float %469)
  %471 = fmul float %384, %470
  %472 = fmul float %385, %470
  %473 = fmul float %386, %470
  %474 = fmul float %387, %470
  %475 = fmul float %388, %470
  %476 = fmul float %389, %470
  %477 = fmul float %390, %470
  %478 = fmul float %391, %470
  %479 = fmul float %392, %470
  %480 = fmul float %393, %470
  %481 = fmul float %394, %470
  %482 = fmul float %395, %470
  %483 = fmul float %396, %470
  %484 = fmul float %397, %470
  %485 = fmul float %398, %470
  %486 = fmul float %399, %470
  %487 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %488 = getelementptr i8, ptr addrspace(1) %487, i64 1024
  %489 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %487) #10
  %490 = extractvalue { i32, i32, i32, i32 } %489, 0
  %491 = bitcast i32 %490 to <2 x bfloat>
  %492 = extractvalue { i32, i32, i32, i32 } %489, 1
  %493 = bitcast i32 %492 to <2 x bfloat>
  %494 = extractvalue { i32, i32, i32, i32 } %489, 2
  %495 = bitcast i32 %494 to <2 x bfloat>
  %496 = extractvalue { i32, i32, i32, i32 } %489, 3
  %497 = bitcast i32 %496 to <2 x bfloat>
  %498 = extractelement <2 x bfloat> %491, i64 0
  %499 = extractelement <2 x bfloat> %491, i64 1
  %500 = extractelement <2 x bfloat> %493, i64 0
  %501 = extractelement <2 x bfloat> %493, i64 1
  %502 = extractelement <2 x bfloat> %495, i64 0
  %503 = extractelement <2 x bfloat> %495, i64 1
  %504 = extractelement <2 x bfloat> %497, i64 0
  %505 = extractelement <2 x bfloat> %497, i64 1
  %506 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %488) #10
  %507 = extractvalue { i32, i32, i32, i32 } %506, 0
  %508 = bitcast i32 %507 to <2 x bfloat>
  %509 = extractvalue { i32, i32, i32, i32 } %506, 1
  %510 = bitcast i32 %509 to <2 x bfloat>
  %511 = extractvalue { i32, i32, i32, i32 } %506, 2
  %512 = bitcast i32 %511 to <2 x bfloat>
  %513 = extractvalue { i32, i32, i32, i32 } %506, 3
  %514 = bitcast i32 %513 to <2 x bfloat>
  %515 = extractelement <2 x bfloat> %508, i64 0
  %516 = extractelement <2 x bfloat> %508, i64 1
  %517 = extractelement <2 x bfloat> %510, i64 0
  %518 = extractelement <2 x bfloat> %510, i64 1
  %519 = extractelement <2 x bfloat> %512, i64 0
  %520 = extractelement <2 x bfloat> %512, i64 1
  %521 = extractelement <2 x bfloat> %514, i64 0
  %522 = extractelement <2 x bfloat> %514, i64 1
  %523 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %498) #10
  %524 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499) #10
  %525 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500) #10
  %526 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501) #10
  %527 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502) #10
  %528 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503) #10
  %529 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504) #10
  %530 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505) #10
  %531 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #10
  %532 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %533 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #10
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #10
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #10
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #10
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #10
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #10
  %539 = fmul float %471, %523
  %540 = fmul float %472, %524
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
  %555 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %539) #10
  %556 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %540) #10
  %557 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541) #10
  %558 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542) #10
  %559 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543) #10
  %560 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544) #10
  %561 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545) #10
  %562 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546) #10
  %563 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %547) #10
  %564 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %548) #10
  %565 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %549) #10
  %566 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550) #10
  %567 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551) #10
  %568 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552) #10
  %569 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553) #10
  %570 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554) #10
  %571 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %3
  %572 = getelementptr bfloat, ptr addrspace(1) %571, i64 %13
  %573 = getelementptr i8, ptr addrspace(1) %572, i64 1024
  %574 = insertelement <2 x bfloat> poison, bfloat %555, i64 0
  %575 = insertelement <2 x bfloat> %574, bfloat %556, i64 1
  %576 = bitcast <2 x bfloat> %575 to i32
  %577 = insertelement <2 x bfloat> poison, bfloat %557, i64 0
  %578 = insertelement <2 x bfloat> %577, bfloat %558, i64 1
  %579 = bitcast <2 x bfloat> %578 to i32
  %580 = insertelement <2 x bfloat> poison, bfloat %559, i64 0
  %581 = insertelement <2 x bfloat> %580, bfloat %560, i64 1
  %582 = bitcast <2 x bfloat> %581 to i32
  %583 = insertelement <2 x bfloat> poison, bfloat %561, i64 0
  %584 = insertelement <2 x bfloat> %583, bfloat %562, i64 1
  %585 = bitcast <2 x bfloat> %584 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %576, i32 %579, i32 %582, i32 %585, ptr addrspace(1) %572) #10
  %586 = insertelement <2 x bfloat> poison, bfloat %563, i64 0
  %587 = insertelement <2 x bfloat> %586, bfloat %564, i64 1
  %588 = bitcast <2 x bfloat> %587 to i32
  %589 = insertelement <2 x bfloat> poison, bfloat %565, i64 0
  %590 = insertelement <2 x bfloat> %589, bfloat %566, i64 1
  %591 = bitcast <2 x bfloat> %590 to i32
  %592 = insertelement <2 x bfloat> poison, bfloat %567, i64 0
  %593 = insertelement <2 x bfloat> %592, bfloat %568, i64 1
  %594 = bitcast <2 x bfloat> %593 to i32
  %595 = insertelement <2 x bfloat> poison, bfloat %569, i64 0
  %596 = insertelement <2 x bfloat> %595, bfloat %570, i64 1
  %597 = bitcast <2 x bfloat> %596 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %588, i32 %591, i32 %594, i32 %597, ptr addrspace(1) %573) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(524288) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 258048
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

define ptx_kernel void @triton_softmax_11_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2) local_unnamed_addr #6 {
  %arg219 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg015 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
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
  %17 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
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
  %34 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #10
  %35 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #10
  %36 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %37 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %38 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %39 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %40 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %41 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
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
  %74 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg015) #10
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
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) %102, i32 %103, i32 %104, i32 %105, i32 %106, i1 true) #10
  %111 = getelementptr inbounds nuw i8, ptr addrspace(3) %102, i64 16
  tail call void asm sideeffect "@$5 st.shared.v4.b32 [ $0 + 0 ], { $1, $2, $3, $4 };", "r,r,r,r,r,b"(ptr addrspace(3) nonnull %111, i32 %107, i32 %108, i32 %109, i32 %110, i1 true) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract21, i32 %.extract822, i32 %.extract923, i32 %.extract1024, ptr addrspace(1) %94) #10
  %.extract11 = extractelement <4 x i32> %124, i64 0
  %.extract12 = extractelement <4 x i32> %124, i64 1
  %.extract13 = extractelement <4 x i32> %124, i64 2
  %.extract14 = extractelement <4 x i32> %124, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract11, i32 %.extract12, i32 %.extract13, i32 %.extract14, ptr addrspace(1) %95) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(262144) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(256) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(131072) %4) local_unnamed_addr #7 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !37)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !40)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !6, !alias.scope !40, !noalias !37
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !6, !alias.scope !37, !noalias !40
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
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !6, !alias.scope !42, !noalias !45
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
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
declare float @llvm.nvvm.rsqrt.approx.f(float) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #8

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) "nvvm.reqntid"="128,1,1" }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { "nvvm.reqntid"="128,1,1" }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { "nvvm.reqntid"="64,1,1" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 0, i32 128}
!5 = !{i32 0, i32 512}
!6 = !{}
!7 = !{i32 0, i32 36864}
!8 = !{i32 0, i32 1536}
!9 = !{!10}
!10 = distinct !{!10, !11, !"fused_convert_8_param_0_360: argument 0"}
!11 = distinct !{!11, !"fused_convert_8_param_0_360"}
!12 = !{!13}
!13 = distinct !{!13, !14, !"fused_convert_8_param_0_360: argument 0"}
!14 = distinct !{!14, !"fused_convert_8_param_0_360"}
!15 = !{!16}
!16 = distinct !{!16, !17, !"fused_add_convert_476_23: argument 0"}
!17 = distinct !{!17, !"fused_add_convert_476_23"}
!18 = !{!19}
!19 = distinct !{!19, !20, !"fused_add_convert_476_23: argument 0"}
!20 = distinct !{!20, !"fused_add_convert_476_23"}
!21 = !{!22}
!22 = distinct !{!22, !23, !"fused_add_convert_476_23: argument 0"}
!23 = distinct !{!23, !"fused_add_convert_476_23"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"fused_add_convert_476_23: argument 0"}
!26 = distinct !{!26, !"fused_add_convert_476_23"}
!27 = !{!28}
!28 = distinct !{!28, !29, !"fused_add_convert_476_23: argument 0"}
!29 = distinct !{!29, !"fused_add_convert_476_23"}
!30 = !{!31}
!31 = distinct !{!31, !32, !"fused_add_convert_476_23: argument 0"}
!32 = distinct !{!32, !"fused_add_convert_476_23"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"fused_add_convert_476_23: argument 0"}
!35 = distinct !{!35, !"fused_add_convert_476_23"}
!36 = !{i32 0, i32 256}
!37 = !{!38}
!38 = distinct !{!38, !39, !"fused_concatenate_convert_613_7: argument 0"}
!39 = distinct !{!39, !"fused_concatenate_convert_613_7"}
!40 = !{!41}
!41 = distinct !{!41, !39, !"fused_concatenate_convert_613_7: argument 1"}
!42 = !{!43}
!43 = distinct !{!43, !44, !"fused_concatenate_convert_613_7: argument 0"}
!44 = distinct !{!44, !"fused_concatenate_convert_613_7"}
!45 = !{!46}
!46 = distinct !{!46, !44, !"fused_concatenate_convert_613_7: argument 1"}
!47 = !{i32 0, i32 135456}

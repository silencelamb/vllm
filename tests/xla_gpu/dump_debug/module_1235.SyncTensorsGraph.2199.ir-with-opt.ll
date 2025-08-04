; ModuleID = 'SyncTensorsGraph.2199'
source_filename = "SyncTensorsGraph.2199"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@global_smem = external addrspace(3) global [0 x i8], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_gather_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(311164928) %0, ptr noalias readonly align 16 captures(none) dereferenceable(64) %1, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %9 = lshr i32 %8, 3
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %10
  %12 = load i32, ptr addrspace(1) %11, align 4, !invariant.load !5
  %13 = tail call i32 @llvm.umin.i32(i32 %12, i32 151935)
  %14 = shl nuw nsw i32 %8, 7
  %15 = and i32 %14, 896
  %16 = shl nuw nsw i32 %13, 10
  %17 = or disjoint i32 %16, %15
  %18 = or disjoint i32 %17, %7
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds bfloat, ptr addrspace(1) %6, i64 %19
  %21 = load bfloat, ptr addrspace(1) %20, align 2, !invariant.load !5
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
define ptx_kernel void @wrapped_concatenate(ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %1, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %2, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %3, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %4, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %5, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %6, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %7, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %8, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %9, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %10, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %11, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %12, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %13, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %14, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %15, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %16, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %17, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %18, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %19, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %20, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %21, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %22, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %23, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %24, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %25, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %26, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %27, ptr noalias writeonly align 128 captures(none) dereferenceable(117440512) %28) local_unnamed_addr #2 {
  %30 = addrspacecast ptr %28 to ptr addrspace(1)
  %31 = addrspacecast ptr %27 to ptr addrspace(1)
  %32 = addrspacecast ptr %26 to ptr addrspace(1)
  %33 = addrspacecast ptr %25 to ptr addrspace(1)
  %34 = addrspacecast ptr %24 to ptr addrspace(1)
  %35 = addrspacecast ptr %23 to ptr addrspace(1)
  %36 = addrspacecast ptr %22 to ptr addrspace(1)
  %37 = addrspacecast ptr %21 to ptr addrspace(1)
  %38 = addrspacecast ptr %20 to ptr addrspace(1)
  %39 = addrspacecast ptr %19 to ptr addrspace(1)
  %40 = addrspacecast ptr %18 to ptr addrspace(1)
  %41 = addrspacecast ptr %17 to ptr addrspace(1)
  %42 = addrspacecast ptr %16 to ptr addrspace(1)
  %43 = addrspacecast ptr %15 to ptr addrspace(1)
  %44 = addrspacecast ptr %14 to ptr addrspace(1)
  %45 = addrspacecast ptr %13 to ptr addrspace(1)
  %46 = addrspacecast ptr %12 to ptr addrspace(1)
  %47 = addrspacecast ptr %11 to ptr addrspace(1)
  %48 = addrspacecast ptr %10 to ptr addrspace(1)
  %49 = addrspacecast ptr %9 to ptr addrspace(1)
  %50 = addrspacecast ptr %8 to ptr addrspace(1)
  %51 = addrspacecast ptr %7 to ptr addrspace(1)
  %52 = addrspacecast ptr %6 to ptr addrspace(1)
  %53 = addrspacecast ptr %5 to ptr addrspace(1)
  %54 = addrspacecast ptr %4 to ptr addrspace(1)
  %55 = addrspacecast ptr %3 to ptr addrspace(1)
  %56 = addrspacecast ptr %2 to ptr addrspace(1)
  %57 = addrspacecast ptr %1 to ptr addrspace(1)
  %58 = addrspacecast ptr %0 to ptr addrspace(1)
  %59 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %60 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %61 = lshr i32 %60, 4
  %62 = icmp samesign ult i32 %60, 229376
  br i1 %62, label %63, label %213

63:                                               ; preds = %29
  %64 = icmp samesign ult i32 %60, 114688
  br i1 %64, label %65, label %136

65:                                               ; preds = %63
  %66 = icmp samesign ult i32 %60, 49152
  br i1 %66, label %67, label %95

67:                                               ; preds = %65
  %68 = icmp samesign ult i32 %60, 16384
  br i1 %68, label %69, label %74

69:                                               ; preds = %67
  %70 = shl nuw nsw i32 %60, 7
  %71 = or disjoint i32 %70, %59
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr inbounds bfloat, ptr addrspace(1) %58, i64 %72
  br label %369

74:                                               ; preds = %67
  %75 = icmp samesign ult i32 %60, 32768
  %76 = shl nuw nsw i32 %60, 7
  %77 = and i32 %76, 1920
  %78 = shl nuw nsw i32 %61, 11
  br i1 %75, label %79, label %87

79:                                               ; preds = %74
  %80 = sext i32 %59 to i64
  %81 = sext i32 %77 to i64
  %82 = sext i32 %78 to i64
  %83 = add i64 %82, %81
  %84 = add i64 %83, %80
  %85 = getelementptr bfloat, ptr addrspace(1) %57, i64 %84
  %86 = getelementptr inbounds i8, ptr addrspace(1) %85, i64 -4194304
  br label %369

87:                                               ; preds = %74
  %88 = sext i32 %59 to i64
  %89 = sext i32 %77 to i64
  %90 = sext i32 %78 to i64
  %91 = add i64 %90, %89
  %92 = add i64 %91, %88
  %93 = getelementptr bfloat, ptr addrspace(1) %56, i64 %92
  %94 = getelementptr inbounds i8, ptr addrspace(1) %93, i64 -8388608
  br label %369

95:                                               ; preds = %65
  %96 = icmp samesign ult i32 %60, 81920
  %97 = shl nuw nsw i32 %60, 7
  %98 = and i32 %97, 1920
  %99 = shl nuw nsw i32 %61, 11
  br i1 %96, label %100, label %118

100:                                              ; preds = %95
  %101 = icmp samesign ult i32 %60, 65536
  br i1 %101, label %102, label %110

102:                                              ; preds = %100
  %103 = sext i32 %59 to i64
  %104 = sext i32 %98 to i64
  %105 = sext i32 %99 to i64
  %106 = add i64 %105, %104
  %107 = add i64 %106, %103
  %108 = getelementptr bfloat, ptr addrspace(1) %55, i64 %107
  %109 = getelementptr inbounds i8, ptr addrspace(1) %108, i64 -12582912
  br label %369

110:                                              ; preds = %100
  %111 = sext i32 %59 to i64
  %112 = sext i32 %98 to i64
  %113 = sext i32 %99 to i64
  %114 = add i64 %113, %112
  %115 = add i64 %114, %111
  %116 = getelementptr bfloat, ptr addrspace(1) %54, i64 %115
  %117 = getelementptr inbounds i8, ptr addrspace(1) %116, i64 -16777216
  br label %369

118:                                              ; preds = %95
  %119 = icmp samesign ult i32 %60, 98304
  br i1 %119, label %120, label %128

120:                                              ; preds = %118
  %121 = sext i32 %59 to i64
  %122 = sext i32 %98 to i64
  %123 = sext i32 %99 to i64
  %124 = add i64 %123, %122
  %125 = add i64 %124, %121
  %126 = getelementptr bfloat, ptr addrspace(1) %53, i64 %125
  %127 = getelementptr inbounds i8, ptr addrspace(1) %126, i64 -20971520
  br label %369

128:                                              ; preds = %118
  %129 = sext i32 %59 to i64
  %130 = sext i32 %98 to i64
  %131 = sext i32 %99 to i64
  %132 = add i64 %131, %130
  %133 = add i64 %132, %129
  %134 = getelementptr bfloat, ptr addrspace(1) %52, i64 %133
  %135 = getelementptr inbounds i8, ptr addrspace(1) %134, i64 -25165824
  br label %369

136:                                              ; preds = %63
  %137 = icmp samesign ult i32 %60, 163840
  br i1 %137, label %138, label %172

138:                                              ; preds = %136
  %139 = icmp samesign ult i32 %60, 131072
  br i1 %139, label %140, label %151

140:                                              ; preds = %138
  %141 = shl nuw nsw i32 %60, 7
  %142 = and i32 %141, 1920
  %143 = shl nuw nsw i32 %61, 11
  %144 = sext i32 %59 to i64
  %145 = sext i32 %142 to i64
  %146 = sext i32 %143 to i64
  %147 = add i64 %146, %145
  %148 = add i64 %147, %144
  %149 = getelementptr bfloat, ptr addrspace(1) %51, i64 %148
  %150 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 -29360128
  br label %369

151:                                              ; preds = %138
  %152 = icmp samesign ult i32 %60, 147456
  %153 = shl nuw nsw i32 %60, 7
  %154 = and i32 %153, 1920
  %155 = shl nuw nsw i32 %61, 11
  br i1 %152, label %156, label %164

156:                                              ; preds = %151
  %157 = sext i32 %59 to i64
  %158 = sext i32 %154 to i64
  %159 = sext i32 %155 to i64
  %160 = add i64 %159, %158
  %161 = add i64 %160, %157
  %162 = getelementptr bfloat, ptr addrspace(1) %50, i64 %161
  %163 = getelementptr inbounds i8, ptr addrspace(1) %162, i64 -33554432
  br label %369

164:                                              ; preds = %151
  %165 = sext i32 %59 to i64
  %166 = sext i32 %154 to i64
  %167 = sext i32 %155 to i64
  %168 = add i64 %167, %166
  %169 = add i64 %168, %165
  %170 = getelementptr bfloat, ptr addrspace(1) %49, i64 %169
  %171 = getelementptr inbounds i8, ptr addrspace(1) %170, i64 -37748736
  br label %369

172:                                              ; preds = %136
  %173 = icmp samesign ult i32 %60, 196608
  %174 = shl nuw nsw i32 %60, 7
  %175 = and i32 %174, 1920
  %176 = shl nuw nsw i32 %61, 11
  br i1 %173, label %177, label %195

177:                                              ; preds = %172
  %178 = icmp samesign ult i32 %60, 180224
  br i1 %178, label %179, label %187

179:                                              ; preds = %177
  %180 = sext i32 %59 to i64
  %181 = sext i32 %175 to i64
  %182 = sext i32 %176 to i64
  %183 = add i64 %182, %181
  %184 = add i64 %183, %180
  %185 = getelementptr bfloat, ptr addrspace(1) %48, i64 %184
  %186 = getelementptr inbounds i8, ptr addrspace(1) %185, i64 -41943040
  br label %369

187:                                              ; preds = %177
  %188 = sext i32 %59 to i64
  %189 = sext i32 %175 to i64
  %190 = sext i32 %176 to i64
  %191 = add i64 %190, %189
  %192 = add i64 %191, %188
  %193 = getelementptr bfloat, ptr addrspace(1) %47, i64 %192
  %194 = getelementptr inbounds i8, ptr addrspace(1) %193, i64 -46137344
  br label %369

195:                                              ; preds = %172
  %196 = icmp samesign ult i32 %60, 212992
  br i1 %196, label %197, label %205

197:                                              ; preds = %195
  %198 = sext i32 %59 to i64
  %199 = sext i32 %175 to i64
  %200 = sext i32 %176 to i64
  %201 = add i64 %200, %199
  %202 = add i64 %201, %198
  %203 = getelementptr bfloat, ptr addrspace(1) %46, i64 %202
  %204 = getelementptr inbounds i8, ptr addrspace(1) %203, i64 -50331648
  br label %369

205:                                              ; preds = %195
  %206 = sext i32 %59 to i64
  %207 = sext i32 %175 to i64
  %208 = sext i32 %176 to i64
  %209 = add i64 %208, %207
  %210 = add i64 %209, %206
  %211 = getelementptr bfloat, ptr addrspace(1) %45, i64 %210
  %212 = getelementptr inbounds i8, ptr addrspace(1) %211, i64 -54525952
  br label %369

213:                                              ; preds = %29
  %214 = icmp samesign ult i32 %60, 344064
  br i1 %214, label %215, label %292

215:                                              ; preds = %213
  %216 = icmp samesign ult i32 %60, 278528
  br i1 %216, label %217, label %251

217:                                              ; preds = %215
  %218 = icmp samesign ult i32 %60, 245760
  br i1 %218, label %219, label %230

219:                                              ; preds = %217
  %220 = shl nuw nsw i32 %60, 7
  %221 = and i32 %220, 1920
  %222 = shl nuw nsw i32 %61, 11
  %223 = sext i32 %59 to i64
  %224 = sext i32 %221 to i64
  %225 = sext i32 %222 to i64
  %226 = add i64 %225, %224
  %227 = add i64 %226, %223
  %228 = getelementptr bfloat, ptr addrspace(1) %44, i64 %227
  %229 = getelementptr inbounds i8, ptr addrspace(1) %228, i64 -58720256
  br label %369

230:                                              ; preds = %217
  %231 = icmp samesign ult i32 %60, 262144
  %232 = shl nuw nsw i32 %60, 7
  %233 = and i32 %232, 1920
  %234 = shl nuw nsw i32 %61, 11
  br i1 %231, label %235, label %243

235:                                              ; preds = %230
  %236 = sext i32 %59 to i64
  %237 = sext i32 %233 to i64
  %238 = sext i32 %234 to i64
  %239 = add i64 %238, %237
  %240 = add i64 %239, %236
  %241 = getelementptr bfloat, ptr addrspace(1) %43, i64 %240
  %242 = getelementptr inbounds i8, ptr addrspace(1) %241, i64 -62914560
  br label %369

243:                                              ; preds = %230
  %244 = sext i32 %59 to i64
  %245 = sext i32 %233 to i64
  %246 = sext i32 %234 to i64
  %247 = add i64 %246, %245
  %248 = add i64 %247, %244
  %249 = getelementptr bfloat, ptr addrspace(1) %42, i64 %248
  %250 = getelementptr inbounds i8, ptr addrspace(1) %249, i64 -67108864
  br label %369

251:                                              ; preds = %215
  %252 = icmp samesign ult i32 %60, 311296
  %253 = shl nuw nsw i32 %60, 7
  %254 = and i32 %253, 1920
  %255 = shl nuw nsw i32 %61, 11
  br i1 %252, label %256, label %274

256:                                              ; preds = %251
  %257 = icmp samesign ult i32 %60, 294912
  br i1 %257, label %258, label %266

258:                                              ; preds = %256
  %259 = sext i32 %59 to i64
  %260 = sext i32 %254 to i64
  %261 = sext i32 %255 to i64
  %262 = add i64 %261, %260
  %263 = add i64 %262, %259
  %264 = getelementptr bfloat, ptr addrspace(1) %41, i64 %263
  %265 = getelementptr inbounds i8, ptr addrspace(1) %264, i64 -71303168
  br label %369

266:                                              ; preds = %256
  %267 = sext i32 %59 to i64
  %268 = sext i32 %254 to i64
  %269 = sext i32 %255 to i64
  %270 = add i64 %269, %268
  %271 = add i64 %270, %267
  %272 = getelementptr bfloat, ptr addrspace(1) %40, i64 %271
  %273 = getelementptr inbounds i8, ptr addrspace(1) %272, i64 -75497472
  br label %369

274:                                              ; preds = %251
  %275 = icmp samesign ult i32 %60, 327680
  br i1 %275, label %276, label %284

276:                                              ; preds = %274
  %277 = sext i32 %59 to i64
  %278 = sext i32 %254 to i64
  %279 = sext i32 %255 to i64
  %280 = add i64 %279, %278
  %281 = add i64 %280, %277
  %282 = getelementptr bfloat, ptr addrspace(1) %39, i64 %281
  %283 = getelementptr inbounds i8, ptr addrspace(1) %282, i64 -79691776
  br label %369

284:                                              ; preds = %274
  %285 = sext i32 %59 to i64
  %286 = sext i32 %254 to i64
  %287 = sext i32 %255 to i64
  %288 = add i64 %287, %286
  %289 = add i64 %288, %285
  %290 = getelementptr bfloat, ptr addrspace(1) %38, i64 %289
  %291 = getelementptr inbounds i8, ptr addrspace(1) %290, i64 -83886080
  br label %369

292:                                              ; preds = %213
  %293 = icmp samesign ult i32 %60, 393216
  br i1 %293, label %294, label %328

294:                                              ; preds = %292
  %295 = icmp samesign ult i32 %60, 360448
  br i1 %295, label %296, label %307

296:                                              ; preds = %294
  %297 = shl nuw nsw i32 %60, 7
  %298 = and i32 %297, 1920
  %299 = shl nuw nsw i32 %61, 11
  %300 = sext i32 %59 to i64
  %301 = sext i32 %298 to i64
  %302 = sext i32 %299 to i64
  %303 = add i64 %302, %301
  %304 = add i64 %303, %300
  %305 = getelementptr bfloat, ptr addrspace(1) %37, i64 %304
  %306 = getelementptr inbounds i8, ptr addrspace(1) %305, i64 -88080384
  br label %369

307:                                              ; preds = %294
  %308 = icmp samesign ult i32 %60, 376832
  %309 = shl nuw nsw i32 %60, 7
  %310 = and i32 %309, 1920
  %311 = shl nuw nsw i32 %61, 11
  br i1 %308, label %312, label %320

312:                                              ; preds = %307
  %313 = sext i32 %59 to i64
  %314 = sext i32 %310 to i64
  %315 = sext i32 %311 to i64
  %316 = add i64 %315, %314
  %317 = add i64 %316, %313
  %318 = getelementptr bfloat, ptr addrspace(1) %36, i64 %317
  %319 = getelementptr inbounds i8, ptr addrspace(1) %318, i64 -92274688
  br label %369

320:                                              ; preds = %307
  %321 = sext i32 %59 to i64
  %322 = sext i32 %310 to i64
  %323 = sext i32 %311 to i64
  %324 = add i64 %323, %322
  %325 = add i64 %324, %321
  %326 = getelementptr bfloat, ptr addrspace(1) %35, i64 %325
  %327 = getelementptr inbounds i8, ptr addrspace(1) %326, i64 -96468992
  br label %369

328:                                              ; preds = %292
  %329 = icmp samesign ult i32 %60, 425984
  %330 = shl nuw nsw i32 %60, 7
  %331 = and i32 %330, 1920
  %332 = shl nuw nsw i32 %61, 11
  br i1 %329, label %333, label %351

333:                                              ; preds = %328
  %334 = icmp samesign ult i32 %60, 409600
  br i1 %334, label %335, label %343

335:                                              ; preds = %333
  %336 = sext i32 %59 to i64
  %337 = sext i32 %331 to i64
  %338 = sext i32 %332 to i64
  %339 = add i64 %338, %337
  %340 = add i64 %339, %336
  %341 = getelementptr bfloat, ptr addrspace(1) %34, i64 %340
  %342 = getelementptr inbounds i8, ptr addrspace(1) %341, i64 -100663296
  br label %369

343:                                              ; preds = %333
  %344 = sext i32 %59 to i64
  %345 = sext i32 %331 to i64
  %346 = sext i32 %332 to i64
  %347 = add i64 %346, %345
  %348 = add i64 %347, %344
  %349 = getelementptr bfloat, ptr addrspace(1) %33, i64 %348
  %350 = getelementptr inbounds i8, ptr addrspace(1) %349, i64 -104857600
  br label %369

351:                                              ; preds = %328
  %352 = icmp samesign ult i32 %60, 442368
  br i1 %352, label %353, label %361

353:                                              ; preds = %351
  %354 = sext i32 %59 to i64
  %355 = sext i32 %331 to i64
  %356 = sext i32 %332 to i64
  %357 = add i64 %356, %355
  %358 = add i64 %357, %354
  %359 = getelementptr bfloat, ptr addrspace(1) %32, i64 %358
  %360 = getelementptr inbounds i8, ptr addrspace(1) %359, i64 -109051904
  br label %369

361:                                              ; preds = %351
  %362 = sext i32 %59 to i64
  %363 = sext i32 %331 to i64
  %364 = sext i32 %332 to i64
  %365 = add i64 %364, %363
  %366 = add i64 %365, %362
  %367 = getelementptr bfloat, ptr addrspace(1) %31, i64 %366
  %368 = getelementptr inbounds i8, ptr addrspace(1) %367, i64 -113246208
  br label %369

369:                                              ; preds = %69, %87, %79, %110, %102, %128, %120, %140, %164, %156, %187, %179, %205, %197, %219, %243, %235, %266, %258, %284, %276, %296, %320, %312, %343, %335, %361, %353
  %.pre-phi = phi i32 [ %70, %69 ], [ %76, %87 ], [ %76, %79 ], [ %97, %110 ], [ %97, %102 ], [ %97, %128 ], [ %97, %120 ], [ %141, %140 ], [ %153, %164 ], [ %153, %156 ], [ %174, %187 ], [ %174, %179 ], [ %174, %205 ], [ %174, %197 ], [ %220, %219 ], [ %232, %243 ], [ %232, %235 ], [ %253, %266 ], [ %253, %258 ], [ %253, %284 ], [ %253, %276 ], [ %297, %296 ], [ %309, %320 ], [ %309, %312 ], [ %330, %343 ], [ %330, %335 ], [ %330, %361 ], [ %330, %353 ]
  %.in = phi ptr addrspace(1) [ %73, %69 ], [ %94, %87 ], [ %86, %79 ], [ %117, %110 ], [ %109, %102 ], [ %135, %128 ], [ %127, %120 ], [ %150, %140 ], [ %171, %164 ], [ %163, %156 ], [ %194, %187 ], [ %186, %179 ], [ %212, %205 ], [ %204, %197 ], [ %229, %219 ], [ %250, %243 ], [ %242, %235 ], [ %273, %266 ], [ %265, %258 ], [ %291, %284 ], [ %283, %276 ], [ %306, %296 ], [ %327, %320 ], [ %319, %312 ], [ %350, %343 ], [ %342, %335 ], [ %368, %361 ], [ %360, %353 ]
  %370 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !5
  %371 = or disjoint i32 %.pre-phi, %59
  %372 = zext nneg i32 %371 to i64
  %373 = getelementptr inbounds bfloat, ptr addrspace(1) %30, i64 %372
  store bfloat %370, ptr addrspace(1) %373, align 2
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_110_0(ptr noalias align 128 dereferenceable(117440512) %arg0, ptr noalias align 128 dereferenceable(917504) %arg1) local_unnamed_addr #4 {
  %arg1117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0115 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 224, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 7
  %9 = sext i32 %8 to i64
  %10 = tail call range(i32 0, 128) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = and i32 %10, 16
  %.not = icmp eq i32 %11, 0
  %12 = and i32 %10, 32
  %13 = icmp eq i32 %12, 0
  %.lobit1 = lshr i32 %10, 4
  %14 = and i32 %.lobit1, 3
  %15 = icmp samesign ult i32 %10, 64
  %16 = select i1 %15, i32 0, i32 4
  %17 = or disjoint i32 %14, %16
  %18 = or disjoint i32 %17, 8
  %19 = or disjoint i32 %17, 16
  %20 = or disjoint i32 %17, 24
  %21 = or disjoint i32 %17, 32
  %22 = or disjoint i32 %17, 40
  %23 = or disjoint i32 %17, 48
  %24 = or disjoint i32 %17, 56
  %25 = or disjoint i32 %17, 64
  %26 = or disjoint i32 %17, 72
  %27 = or disjoint i32 %17, 80
  %28 = or disjoint i32 %17, 88
  %29 = or disjoint i32 %17, 96
  %30 = or disjoint i32 %17, 104
  %31 = or disjoint i32 %17, 112
  %32 = or disjoint i32 %17, 120
  %33 = and i32 %10, 1
  %34 = icmp eq i32 %33, 0
  %35 = and i32 %10, 2
  %36 = icmp eq i32 %35, 0
  %37 = and i32 %10, 4
  %.not3 = icmp eq i32 %37, 0
  %38 = shl nuw nsw i32 %10, 3
  %39 = and i32 %38, 120
  %40 = zext nneg i32 %17 to i64
  %41 = zext nneg i32 %18 to i64
  %42 = zext nneg i32 %19 to i64
  %43 = zext nneg i32 %20 to i64
  %44 = zext nneg i32 %21 to i64
  %45 = zext nneg i32 %22 to i64
  %46 = zext nneg i32 %23 to i64
  %47 = zext nneg i32 %24 to i64
  %48 = zext nneg i32 %25 to i64
  %49 = zext nneg i32 %26 to i64
  %50 = zext nneg i32 %27 to i64
  %51 = zext nneg i32 %28 to i64
  %52 = zext nneg i32 %29 to i64
  %53 = zext nneg i32 %30 to i64
  %54 = zext nneg i32 %31 to i64
  %55 = zext nneg i32 %32 to i64
  %56 = zext nneg i32 %39 to i64
  %57 = or disjoint i64 %9, %40
  %58 = or disjoint i64 %9, %41
  %59 = or disjoint i64 %9, %42
  %60 = or disjoint i64 %9, %43
  %61 = or disjoint i64 %9, %44
  %62 = or disjoint i64 %9, %45
  %63 = or disjoint i64 %9, %46
  %64 = or disjoint i64 %9, %47
  %65 = or disjoint i64 %9, %48
  %66 = or disjoint i64 %9, %49
  %67 = or disjoint i64 %9, %50
  %68 = or disjoint i64 %9, %51
  %69 = or disjoint i64 %9, %52
  %70 = or disjoint i64 %9, %53
  %71 = or disjoint i64 %9, %54
  %72 = or disjoint i64 %9, %55
  %73 = shl nsw i64 %57, 11
  %74 = shl nsw i64 %58, 11
  %75 = shl nsw i64 %59, 11
  %76 = shl nsw i64 %60, 11
  %77 = shl nsw i64 %61, 11
  %78 = shl nsw i64 %62, 11
  %79 = shl nsw i64 %63, 11
  %80 = shl nsw i64 %64, 11
  %81 = shl nsw i64 %65, 11
  %82 = shl nsw i64 %66, 11
  %83 = shl nsw i64 %67, 11
  %84 = shl nsw i64 %68, 11
  %85 = shl nsw i64 %69, 11
  %86 = shl nsw i64 %70, 11
  %87 = shl nsw i64 %71, 11
  %88 = shl nsw i64 %72, 11
  %89 = or disjoint i64 %73, %56
  %90 = or disjoint i64 %74, %56
  %91 = or disjoint i64 %75, %56
  %92 = or disjoint i64 %76, %56
  %93 = or disjoint i64 %77, %56
  %94 = or disjoint i64 %78, %56
  %95 = or disjoint i64 %79, %56
  %96 = or disjoint i64 %80, %56
  %97 = or disjoint i64 %81, %56
  %98 = or disjoint i64 %82, %56
  %99 = or disjoint i64 %83, %56
  %100 = or disjoint i64 %84, %56
  %101 = or disjoint i64 %85, %56
  %102 = or disjoint i64 %86, %56
  %103 = or disjoint i64 %87, %56
  %104 = or disjoint i64 %88, %56
  %105 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %89
  %106 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %90
  %107 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %91
  %108 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %92
  %109 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %93
  %110 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %94
  %111 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %95
  %112 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %96
  %113 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %97
  %114 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %98
  %115 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %99
  %116 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %100
  %117 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %101
  %118 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %102
  %119 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %103
  %120 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %104
  %121 = select i1 %.not, i32 0, i32 136
  %122 = select i1 %13, i32 0, i32 272
  %123 = select i1 %15, i32 0, i32 544
  %124 = or disjoint i32 %121, %123
  %125 = xor i32 %124, %39
  %126 = xor i32 %125, %122
  %127 = zext nneg i32 %126 to i64
  %128 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %127
  %129 = or disjoint i32 %39, 1024
  %130 = xor i32 %124, %129
  %131 = xor i32 %130, %122
  %132 = zext nneg i32 %131 to i64
  %133 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %132
  %134 = or disjoint i32 %39, 2048
  %135 = xor i32 %124, %134
  %136 = xor i32 %135, %122
  %137 = zext nneg i32 %136 to i64
  %138 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %137
  %139 = or disjoint i32 %39, 3072
  %140 = xor i32 %124, %139
  %141 = xor i32 %140, %122
  %142 = zext nneg i32 %141 to i64
  %143 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %142
  %144 = or disjoint i32 %39, 4096
  %145 = xor i32 %124, %144
  %146 = xor i32 %145, %122
  %147 = zext nneg i32 %146 to i64
  %148 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %147
  %149 = or disjoint i32 %39, 5120
  %150 = xor i32 %124, %149
  %151 = xor i32 %150, %122
  %152 = zext nneg i32 %151 to i64
  %153 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %152
  %154 = or disjoint i32 %39, 6144
  %155 = xor i32 %124, %154
  %156 = xor i32 %155, %122
  %157 = zext nneg i32 %156 to i64
  %158 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %157
  %159 = or disjoint i32 %39, 7168
  %160 = xor i32 %124, %159
  %161 = xor i32 %160, %122
  %162 = zext nneg i32 %161 to i64
  %163 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %162
  %164 = or disjoint i32 %39, 8192
  %165 = xor i32 %124, %164
  %166 = xor i32 %165, %122
  %167 = zext nneg i32 %166 to i64
  %168 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %167
  %169 = or disjoint i32 %39, 9216
  %170 = xor i32 %124, %169
  %171 = xor i32 %170, %122
  %172 = zext nneg i32 %171 to i64
  %173 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %172
  %174 = or disjoint i32 %39, 10240
  %175 = xor i32 %124, %174
  %176 = xor i32 %175, %122
  %177 = zext nneg i32 %176 to i64
  %178 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %177
  %179 = or disjoint i32 %39, 11264
  %180 = xor i32 %124, %179
  %181 = xor i32 %180, %122
  %182 = zext nneg i32 %181 to i64
  %183 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %182
  %184 = or disjoint i32 %39, 12288
  %185 = xor i32 %124, %184
  %186 = xor i32 %185, %122
  %187 = zext nneg i32 %186 to i64
  %188 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %187
  %189 = or disjoint i32 %39, 13312
  %190 = xor i32 %124, %189
  %191 = xor i32 %190, %122
  %192 = zext nneg i32 %191 to i64
  %193 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %192
  %194 = or disjoint i32 %39, 14336
  %195 = xor i32 %124, %194
  %196 = xor i32 %195, %122
  %197 = zext nneg i32 %196 to i64
  %198 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %197
  %199 = or disjoint i32 %39, 15360
  %200 = xor i32 %124, %199
  %201 = xor i32 %200, %122
  %202 = zext nneg i32 %201 to i64
  %203 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %202
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %128, ptr addrspace(1) %105, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %133, ptr addrspace(1) %106, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %138, ptr addrspace(1) %107, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %143, ptr addrspace(1) %108, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %148, ptr addrspace(1) %109, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %153, ptr addrspace(1) %110, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %158, ptr addrspace(1) %111, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %163, ptr addrspace(1) %112, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %113, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %173, ptr addrspace(1) %114, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %178, ptr addrspace(1) %115, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %183, ptr addrspace(1) %116, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %188, ptr addrspace(1) %117, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %193, ptr addrspace(1) %118, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %198, ptr addrspace(1) %119, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %203, ptr addrspace(1) %120, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %204 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %73
  %205 = getelementptr bfloat, ptr addrspace(1) %204, i64 %56
  %206 = getelementptr i8, ptr addrspace(1) %205, i64 256
  %207 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %74
  %208 = getelementptr bfloat, ptr addrspace(1) %207, i64 %56
  %209 = getelementptr i8, ptr addrspace(1) %208, i64 256
  %210 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %75
  %211 = getelementptr bfloat, ptr addrspace(1) %210, i64 %56
  %212 = getelementptr i8, ptr addrspace(1) %211, i64 256
  %213 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %76
  %214 = getelementptr bfloat, ptr addrspace(1) %213, i64 %56
  %215 = getelementptr i8, ptr addrspace(1) %214, i64 256
  %216 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %77
  %217 = getelementptr bfloat, ptr addrspace(1) %216, i64 %56
  %218 = getelementptr i8, ptr addrspace(1) %217, i64 256
  %219 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %78
  %220 = getelementptr bfloat, ptr addrspace(1) %219, i64 %56
  %221 = getelementptr i8, ptr addrspace(1) %220, i64 256
  %222 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %79
  %223 = getelementptr bfloat, ptr addrspace(1) %222, i64 %56
  %224 = getelementptr i8, ptr addrspace(1) %223, i64 256
  %225 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %80
  %226 = getelementptr bfloat, ptr addrspace(1) %225, i64 %56
  %227 = getelementptr i8, ptr addrspace(1) %226, i64 256
  %228 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %81
  %229 = getelementptr bfloat, ptr addrspace(1) %228, i64 %56
  %230 = getelementptr i8, ptr addrspace(1) %229, i64 256
  %231 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %82
  %232 = getelementptr bfloat, ptr addrspace(1) %231, i64 %56
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 256
  %234 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %83
  %235 = getelementptr bfloat, ptr addrspace(1) %234, i64 %56
  %236 = getelementptr i8, ptr addrspace(1) %235, i64 256
  %237 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %84
  %238 = getelementptr bfloat, ptr addrspace(1) %237, i64 %56
  %239 = getelementptr i8, ptr addrspace(1) %238, i64 256
  %240 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %85
  %241 = getelementptr bfloat, ptr addrspace(1) %240, i64 %56
  %242 = getelementptr i8, ptr addrspace(1) %241, i64 256
  %243 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %86
  %244 = getelementptr bfloat, ptr addrspace(1) %243, i64 %56
  %245 = getelementptr i8, ptr addrspace(1) %244, i64 256
  %246 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %87
  %247 = getelementptr bfloat, ptr addrspace(1) %246, i64 %56
  %248 = getelementptr i8, ptr addrspace(1) %247, i64 256
  %249 = getelementptr bfloat, ptr addrspace(1) %arg0115, i64 %88
  %250 = getelementptr bfloat, ptr addrspace(1) %249, i64 %56
  %251 = getelementptr i8, ptr addrspace(1) %250, i64 256
  tail call void @llvm.nvvm.barrier0()
  %252 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %127
  %253 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %132
  %254 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %137
  %255 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %142
  %256 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %147
  %257 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %152
  %258 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %157
  %259 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %162
  %260 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %167
  %261 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %172
  %262 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %177
  %263 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %182
  %264 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %187
  %265 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %192
  %266 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %197
  %267 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %202
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %252, ptr addrspace(1) %206, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %253, ptr addrspace(1) %209, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %254, ptr addrspace(1) %212, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %255, ptr addrspace(1) %215, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %256, ptr addrspace(1) %218, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %257, ptr addrspace(1) %221, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %258, ptr addrspace(1) %224, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %259, ptr addrspace(1) %227, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %260, ptr addrspace(1) %230, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %261, ptr addrspace(1) %233, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %262, ptr addrspace(1) %236, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %263, ptr addrspace(1) %239, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %264, ptr addrspace(1) %242, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %265, ptr addrspace(1) %245, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %266, ptr addrspace(1) %248, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %267, ptr addrspace(1) %251, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %268 = getelementptr i8, ptr addrspace(1) %205, i64 512
  %269 = getelementptr i8, ptr addrspace(1) %208, i64 512
  %270 = getelementptr i8, ptr addrspace(1) %211, i64 512
  %271 = getelementptr i8, ptr addrspace(1) %214, i64 512
  %272 = getelementptr i8, ptr addrspace(1) %217, i64 512
  %273 = getelementptr i8, ptr addrspace(1) %220, i64 512
  %274 = getelementptr i8, ptr addrspace(1) %223, i64 512
  %275 = getelementptr i8, ptr addrspace(1) %226, i64 512
  %276 = getelementptr i8, ptr addrspace(1) %229, i64 512
  %277 = getelementptr i8, ptr addrspace(1) %232, i64 512
  %278 = getelementptr i8, ptr addrspace(1) %235, i64 512
  %279 = getelementptr i8, ptr addrspace(1) %238, i64 512
  %280 = getelementptr i8, ptr addrspace(1) %241, i64 512
  %281 = getelementptr i8, ptr addrspace(1) %244, i64 512
  %282 = getelementptr i8, ptr addrspace(1) %247, i64 512
  %283 = getelementptr i8, ptr addrspace(1) %250, i64 512
  tail call void @llvm.nvvm.barrier0()
  %284 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %127
  %285 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %132
  %286 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %137
  %287 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %142
  %288 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %147
  %289 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %152
  %290 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %157
  %291 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %162
  %292 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %167
  %293 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %172
  %294 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %177
  %295 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %182
  %296 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %187
  %297 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %192
  %298 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %197
  %299 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %202
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %284, ptr addrspace(1) %268, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %285, ptr addrspace(1) %269, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %286, ptr addrspace(1) %270, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %287, ptr addrspace(1) %271, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %288, ptr addrspace(1) %272, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %289, ptr addrspace(1) %273, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %290, ptr addrspace(1) %274, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %291, ptr addrspace(1) %275, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %292, ptr addrspace(1) %276, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %293, ptr addrspace(1) %277, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %294, ptr addrspace(1) %278, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %295, ptr addrspace(1) %279, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %296, ptr addrspace(1) %280, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %297, ptr addrspace(1) %281, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %298, ptr addrspace(1) %282, i32 16) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %299, ptr addrspace(1) %283, i32 16) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %300 = select i1 %34, i32 0, i32 136
  %301 = select i1 %36, i32 0, i32 272
  %302 = or disjoint i32 %300, %301
  %303 = select i1 %.not3, i32 0, i32 544
  %304 = shl nuw nsw i32 %10, 7
  %305 = and i32 %304, 1024
  %306 = or disjoint i32 %303, %305
  %307 = or disjoint i32 %306, %302
  %308 = lshr exact i32 %11, 1
  %309 = xor i32 %307, %308
  %310 = shl nuw nsw i32 %12, 6
  %311 = or disjoint i32 %309, %310
  %312 = select i1 %15, i32 0, i32 4096
  %313 = or disjoint i32 %311, %312
  %314 = zext nneg i32 %313 to i64
  %315 = or disjoint i32 %300, 16
  %316 = xor i32 %315, %301
  %317 = or disjoint i32 %305, %316
  %318 = or disjoint i32 %317, %303
  %319 = or disjoint i32 %310, %308
  %320 = or disjoint i32 %319, %312
  %321 = xor i32 %320, %318
  %322 = zext nneg i32 %321 to i64
  %323 = or disjoint i32 %302, 32
  %324 = xor i32 %323, %303
  %325 = or disjoint i32 %324, %305
  %326 = xor i32 %320, %325
  %327 = zext nneg i32 %326 to i64
  %328 = or disjoint i32 %300, 48
  %329 = or disjoint i32 %303, %301
  %330 = xor i32 %329, %328
  %331 = or disjoint i32 %330, %305
  %332 = xor i32 %320, %331
  %333 = zext nneg i32 %332 to i64
  %334 = or disjoint i32 %307, 64
  %335 = xor i32 %320, %334
  %336 = zext nneg i32 %335 to i64
  %337 = or disjoint i32 %300, 80
  %338 = xor i32 %337, %301
  %339 = or disjoint i32 %305, %338
  %340 = or disjoint i32 %339, %303
  %341 = xor i32 %320, %340
  %342 = zext nneg i32 %341 to i64
  %343 = or disjoint i32 %302, 96
  %344 = xor i32 %343, %303
  %345 = or disjoint i32 %344, %305
  %346 = xor i32 %320, %345
  %347 = zext nneg i32 %346 to i64
  %348 = or disjoint i32 %300, 112
  %349 = xor i32 %329, %348
  %350 = or disjoint i32 %349, %305
  %351 = xor i32 %320, %350
  %352 = zext nneg i32 %351 to i64
  %353 = or disjoint i32 %307, 8192
  %354 = xor i32 %320, %353
  %355 = zext nneg i32 %354 to i64
  %356 = or disjoint i32 %300, 8208
  %357 = xor i32 %356, %301
  %358 = or disjoint i32 %305, %357
  %359 = or disjoint i32 %358, %303
  %360 = xor i32 %320, %359
  %361 = zext nneg i32 %360 to i64
  %362 = or disjoint i32 %302, 8224
  %363 = xor i32 %362, %303
  %364 = or disjoint i32 %363, %305
  %365 = xor i32 %320, %364
  %366 = zext nneg i32 %365 to i64
  %367 = or disjoint i32 %300, 8240
  %368 = xor i32 %329, %367
  %369 = or disjoint i32 %368, %305
  %370 = xor i32 %320, %369
  %371 = zext nneg i32 %370 to i64
  %372 = or disjoint i32 %307, 8256
  %373 = xor i32 %320, %372
  %374 = zext nneg i32 %373 to i64
  %375 = or disjoint i32 %300, 8272
  %376 = xor i32 %375, %301
  %377 = or disjoint i32 %305, %376
  %378 = or disjoint i32 %377, %303
  %379 = xor i32 %320, %378
  %380 = zext nneg i32 %379 to i64
  %381 = or disjoint i32 %302, 8288
  %382 = xor i32 %381, %303
  %383 = or disjoint i32 %382, %305
  %384 = xor i32 %320, %383
  %385 = zext nneg i32 %384 to i64
  %386 = or disjoint i32 %300, 8304
  %387 = xor i32 %329, %386
  %388 = or disjoint i32 %387, %305
  %389 = xor i32 %320, %388
  %390 = zext nneg i32 %389 to i64
  %391 = trunc i32 %10 to i4
  %392 = zext i4 %391 to i64
  %393 = shl nuw nsw i64 %392, 4
  %394 = add i32 %16, %14
  %395 = add i32 %394, 120
  %396 = zext nneg i32 %395 to i64
  %397 = add i64 %9, %396
  %398 = shl nsw i64 %397, 12
  %399 = add nuw nsw i64 %398, 768
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0115, i64 %399
  %400 = add i32 %394, 112
  %401 = zext nneg i32 %400 to i64
  %402 = add i64 %9, %401
  %403 = shl nsw i64 %402, 12
  %404 = add nuw nsw i64 %403, 768
  %scevgep121 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %404
  %405 = add i32 %394, 104
  %406 = zext nneg i32 %405 to i64
  %407 = add i64 %9, %406
  %408 = shl nsw i64 %407, 12
  %409 = add nuw nsw i64 %408, 768
  %scevgep125 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %409
  %410 = add i32 %394, 96
  %411 = zext nneg i32 %410 to i64
  %412 = add i64 %9, %411
  %413 = shl nsw i64 %412, 12
  %414 = add nuw nsw i64 %413, 768
  %scevgep129 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %414
  %415 = add i32 %394, 88
  %416 = zext nneg i32 %415 to i64
  %417 = add i64 %9, %416
  %418 = shl nsw i64 %417, 12
  %419 = add nuw nsw i64 %418, 768
  %scevgep133 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %419
  %420 = add i32 %394, 80
  %421 = zext nneg i32 %420 to i64
  %422 = add i64 %9, %421
  %423 = shl nsw i64 %422, 12
  %424 = add nuw nsw i64 %423, 768
  %scevgep137 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %424
  %425 = add i32 %394, 72
  %426 = zext nneg i32 %425 to i64
  %427 = add i64 %9, %426
  %428 = shl nsw i64 %427, 12
  %429 = add nuw nsw i64 %428, 768
  %scevgep141 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %429
  %430 = add i32 %394, 64
  %431 = zext nneg i32 %430 to i64
  %432 = add i64 %9, %431
  %433 = shl nsw i64 %432, 12
  %434 = add nuw nsw i64 %433, 768
  %scevgep145 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %434
  %435 = add i32 %394, 56
  %436 = zext nneg i32 %435 to i64
  %437 = add i64 %9, %436
  %438 = shl nsw i64 %437, 12
  %439 = add nuw nsw i64 %438, 768
  %scevgep149 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %439
  %440 = add i32 %394, 48
  %441 = zext nneg i32 %440 to i64
  %442 = add i64 %9, %441
  %443 = shl nsw i64 %442, 12
  %444 = add nuw nsw i64 %443, 768
  %scevgep153 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %444
  %445 = add i32 %394, 40
  %446 = zext nneg i32 %445 to i64
  %447 = add i64 %9, %446
  %448 = shl nsw i64 %447, 12
  %449 = add nuw nsw i64 %448, 768
  %scevgep157 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %449
  %450 = add i32 %394, 32
  %451 = zext nneg i32 %450 to i64
  %452 = add i64 %9, %451
  %453 = shl nsw i64 %452, 12
  %454 = add nuw nsw i64 %453, 768
  %scevgep161 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %454
  %455 = add i32 %394, 24
  %456 = zext nneg i32 %455 to i64
  %457 = add i64 %9, %456
  %458 = shl nsw i64 %457, 12
  %459 = add nuw nsw i64 %458, 768
  %scevgep165 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %459
  %460 = add i32 %394, 16
  %461 = zext nneg i32 %460 to i64
  %462 = add i64 %9, %461
  %463 = shl nsw i64 %462, 12
  %464 = add nuw nsw i64 %463, 768
  %scevgep169 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %464
  %465 = add i32 %394, 8
  %466 = zext nneg i32 %465 to i64
  %467 = add i64 %9, %466
  %468 = shl nsw i64 %467, 12
  %469 = add nuw nsw i64 %468, 768
  %scevgep173 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %469
  %470 = zext nneg i32 %394 to i64
  %471 = add i64 %9, %470
  %472 = shl nsw i64 %471, 12
  %473 = add nuw nsw i64 %472, 768
  %scevgep177 = getelementptr i8, ptr addrspace(1) %arg0115, i64 %473
  br label %474

474:                                              ; preds = %0, %474
  %lsr.iv181 = phi i32 [ -128, %0 ], [ %479, %474 ]
  %lsr.iv178 = phi ptr addrspace(1) [ %scevgep177, %0 ], [ %scevgep179, %474 ]
  %lsr.iv174 = phi ptr addrspace(1) [ %scevgep173, %0 ], [ %scevgep175, %474 ]
  %lsr.iv170 = phi ptr addrspace(1) [ %scevgep169, %0 ], [ %scevgep171, %474 ]
  %lsr.iv166 = phi ptr addrspace(1) [ %scevgep165, %0 ], [ %scevgep167, %474 ]
  %lsr.iv162 = phi ptr addrspace(1) [ %scevgep161, %0 ], [ %scevgep163, %474 ]
  %lsr.iv158 = phi ptr addrspace(1) [ %scevgep157, %0 ], [ %scevgep159, %474 ]
  %lsr.iv154 = phi ptr addrspace(1) [ %scevgep153, %0 ], [ %scevgep155, %474 ]
  %lsr.iv150 = phi ptr addrspace(1) [ %scevgep149, %0 ], [ %scevgep151, %474 ]
  %lsr.iv146 = phi ptr addrspace(1) [ %scevgep145, %0 ], [ %scevgep147, %474 ]
  %lsr.iv142 = phi ptr addrspace(1) [ %scevgep141, %0 ], [ %scevgep143, %474 ]
  %lsr.iv138 = phi ptr addrspace(1) [ %scevgep137, %0 ], [ %scevgep139, %474 ]
  %lsr.iv134 = phi ptr addrspace(1) [ %scevgep133, %0 ], [ %scevgep135, %474 ]
  %lsr.iv130 = phi ptr addrspace(1) [ %scevgep129, %0 ], [ %scevgep131, %474 ]
  %lsr.iv126 = phi ptr addrspace(1) [ %scevgep125, %0 ], [ %scevgep127, %474 ]
  %lsr.iv122 = phi ptr addrspace(1) [ %scevgep121, %0 ], [ %scevgep123, %474 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep119, %474 ]
  %475 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %829, %474 ]
  %476 = phi i32 [ 0, %0 ], [ %826, %474 ]
  %477 = phi i32 [ 2, %0 ], [ %803, %474 ]
  %478 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %800, %474 ]
  %479 = add i32 %lsr.iv181, 128
  %480 = icmp samesign ult i32 %479, 1664
  %481 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %314
  %482 = ptrtoint ptr addrspace(3) %481 to i64
  %483 = trunc i64 %482 to i32
  %484 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %483) #9
  %485 = extractvalue { i32, i32, i32, i32 } %484, 0
  %486 = extractvalue { i32, i32, i32, i32 } %484, 1
  %487 = extractvalue { i32, i32, i32, i32 } %484, 2
  %488 = extractvalue { i32, i32, i32, i32 } %484, 3
  %489 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %322
  %490 = ptrtoint ptr addrspace(3) %489 to i64
  %491 = trunc i64 %490 to i32
  %492 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %491) #9
  %493 = extractvalue { i32, i32, i32, i32 } %492, 0
  %494 = extractvalue { i32, i32, i32, i32 } %492, 1
  %495 = extractvalue { i32, i32, i32, i32 } %492, 2
  %496 = extractvalue { i32, i32, i32, i32 } %492, 3
  %497 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %327
  %498 = ptrtoint ptr addrspace(3) %497 to i64
  %499 = trunc i64 %498 to i32
  %500 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %499) #9
  %501 = extractvalue { i32, i32, i32, i32 } %500, 0
  %502 = extractvalue { i32, i32, i32, i32 } %500, 1
  %503 = extractvalue { i32, i32, i32, i32 } %500, 2
  %504 = extractvalue { i32, i32, i32, i32 } %500, 3
  %505 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %333
  %506 = ptrtoint ptr addrspace(3) %505 to i64
  %507 = trunc i64 %506 to i32
  %508 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %507) #9
  %509 = extractvalue { i32, i32, i32, i32 } %508, 0
  %510 = extractvalue { i32, i32, i32, i32 } %508, 1
  %511 = extractvalue { i32, i32, i32, i32 } %508, 2
  %512 = extractvalue { i32, i32, i32, i32 } %508, 3
  %513 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %336
  %514 = ptrtoint ptr addrspace(3) %513 to i64
  %515 = trunc i64 %514 to i32
  %516 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %515) #9
  %517 = extractvalue { i32, i32, i32, i32 } %516, 0
  %518 = extractvalue { i32, i32, i32, i32 } %516, 1
  %519 = extractvalue { i32, i32, i32, i32 } %516, 2
  %520 = extractvalue { i32, i32, i32, i32 } %516, 3
  %521 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %342
  %522 = ptrtoint ptr addrspace(3) %521 to i64
  %523 = trunc i64 %522 to i32
  %524 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %523) #9
  %525 = extractvalue { i32, i32, i32, i32 } %524, 0
  %526 = extractvalue { i32, i32, i32, i32 } %524, 1
  %527 = extractvalue { i32, i32, i32, i32 } %524, 2
  %528 = extractvalue { i32, i32, i32, i32 } %524, 3
  %529 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %347
  %530 = ptrtoint ptr addrspace(3) %529 to i64
  %531 = trunc i64 %530 to i32
  %532 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %531) #9
  %533 = extractvalue { i32, i32, i32, i32 } %532, 0
  %534 = extractvalue { i32, i32, i32, i32 } %532, 1
  %535 = extractvalue { i32, i32, i32, i32 } %532, 2
  %536 = extractvalue { i32, i32, i32, i32 } %532, 3
  %537 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %352
  %538 = ptrtoint ptr addrspace(3) %537 to i64
  %539 = trunc i64 %538 to i32
  %540 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %539) #9
  %541 = extractvalue { i32, i32, i32, i32 } %540, 0
  %542 = extractvalue { i32, i32, i32, i32 } %540, 1
  %543 = extractvalue { i32, i32, i32, i32 } %540, 2
  %544 = extractvalue { i32, i32, i32, i32 } %540, 3
  %545 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %355
  %546 = ptrtoint ptr addrspace(3) %545 to i64
  %547 = trunc i64 %546 to i32
  %548 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %547) #9
  %549 = extractvalue { i32, i32, i32, i32 } %548, 0
  %550 = extractvalue { i32, i32, i32, i32 } %548, 1
  %551 = extractvalue { i32, i32, i32, i32 } %548, 2
  %552 = extractvalue { i32, i32, i32, i32 } %548, 3
  %553 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %361
  %554 = ptrtoint ptr addrspace(3) %553 to i64
  %555 = trunc i64 %554 to i32
  %556 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %555) #9
  %557 = extractvalue { i32, i32, i32, i32 } %556, 0
  %558 = extractvalue { i32, i32, i32, i32 } %556, 1
  %559 = extractvalue { i32, i32, i32, i32 } %556, 2
  %560 = extractvalue { i32, i32, i32, i32 } %556, 3
  %561 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %366
  %562 = ptrtoint ptr addrspace(3) %561 to i64
  %563 = trunc i64 %562 to i32
  %564 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %563) #9
  %565 = extractvalue { i32, i32, i32, i32 } %564, 0
  %566 = extractvalue { i32, i32, i32, i32 } %564, 1
  %567 = extractvalue { i32, i32, i32, i32 } %564, 2
  %568 = extractvalue { i32, i32, i32, i32 } %564, 3
  %569 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %371
  %570 = ptrtoint ptr addrspace(3) %569 to i64
  %571 = trunc i64 %570 to i32
  %572 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %571) #9
  %573 = extractvalue { i32, i32, i32, i32 } %572, 0
  %574 = extractvalue { i32, i32, i32, i32 } %572, 1
  %575 = extractvalue { i32, i32, i32, i32 } %572, 2
  %576 = extractvalue { i32, i32, i32, i32 } %572, 3
  %577 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %374
  %578 = ptrtoint ptr addrspace(3) %577 to i64
  %579 = trunc i64 %578 to i32
  %580 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %579) #9
  %581 = extractvalue { i32, i32, i32, i32 } %580, 0
  %582 = extractvalue { i32, i32, i32, i32 } %580, 1
  %583 = extractvalue { i32, i32, i32, i32 } %580, 2
  %584 = extractvalue { i32, i32, i32, i32 } %580, 3
  %585 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %380
  %586 = ptrtoint ptr addrspace(3) %585 to i64
  %587 = trunc i64 %586 to i32
  %588 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %587) #9
  %589 = extractvalue { i32, i32, i32, i32 } %588, 0
  %590 = extractvalue { i32, i32, i32, i32 } %588, 1
  %591 = extractvalue { i32, i32, i32, i32 } %588, 2
  %592 = extractvalue { i32, i32, i32, i32 } %588, 3
  %593 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %385
  %594 = ptrtoint ptr addrspace(3) %593 to i64
  %595 = trunc i64 %594 to i32
  %596 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %595) #9
  %597 = extractvalue { i32, i32, i32, i32 } %596, 0
  %598 = extractvalue { i32, i32, i32, i32 } %596, 1
  %599 = extractvalue { i32, i32, i32, i32 } %596, 2
  %600 = extractvalue { i32, i32, i32, i32 } %596, 3
  %601 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %390
  %602 = ptrtoint ptr addrspace(3) %601 to i64
  %603 = trunc i64 %602 to i32
  %604 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %603) #9
  %605 = extractvalue { i32, i32, i32, i32 } %604, 0
  %606 = extractvalue { i32, i32, i32, i32 } %604, 1
  %607 = extractvalue { i32, i32, i32, i32 } %604, 2
  %608 = extractvalue { i32, i32, i32, i32 } %604, 3
  %609 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 0
  %610 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 1
  %611 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 2
  %612 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 3
  %613 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 4
  %614 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 5
  %615 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 6
  %616 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 7
  %617 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 8
  %618 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 9
  %619 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 10
  %620 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 11
  %621 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 12
  %622 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 13
  %623 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 14
  %624 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %478, 15
  %625 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %609, float %610, float %611, float %612, i32 %485, i32 %486, i32 %487, i32 %488, i32 0, i32 0) #9
  %626 = extractvalue { float, float, float, float } %625, 0
  %627 = extractvalue { float, float, float, float } %625, 1
  %628 = extractvalue { float, float, float, float } %625, 2
  %629 = extractvalue { float, float, float, float } %625, 3
  %630 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %613, float %614, float %615, float %616, i32 %485, i32 %486, i32 %487, i32 %488, i32 0, i32 0) #9
  %631 = extractvalue { float, float, float, float } %630, 0
  %632 = extractvalue { float, float, float, float } %630, 1
  %633 = extractvalue { float, float, float, float } %630, 2
  %634 = extractvalue { float, float, float, float } %630, 3
  %635 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %617, float %618, float %619, float %620, i32 %549, i32 %550, i32 %551, i32 %552, i32 0, i32 0) #9
  %636 = extractvalue { float, float, float, float } %635, 0
  %637 = extractvalue { float, float, float, float } %635, 1
  %638 = extractvalue { float, float, float, float } %635, 2
  %639 = extractvalue { float, float, float, float } %635, 3
  %640 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %621, float %622, float %623, float %624, i32 %549, i32 %550, i32 %551, i32 %552, i32 0, i32 0) #9
  %641 = extractvalue { float, float, float, float } %640, 0
  %642 = extractvalue { float, float, float, float } %640, 1
  %643 = extractvalue { float, float, float, float } %640, 2
  %644 = extractvalue { float, float, float, float } %640, 3
  %645 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %626, float %627, float %628, float %629, i32 %493, i32 %494, i32 %495, i32 %496, i32 0, i32 0) #9
  %646 = extractvalue { float, float, float, float } %645, 0
  %647 = extractvalue { float, float, float, float } %645, 1
  %648 = extractvalue { float, float, float, float } %645, 2
  %649 = extractvalue { float, float, float, float } %645, 3
  %650 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %631, float %632, float %633, float %634, i32 %493, i32 %494, i32 %495, i32 %496, i32 0, i32 0) #9
  %651 = extractvalue { float, float, float, float } %650, 0
  %652 = extractvalue { float, float, float, float } %650, 1
  %653 = extractvalue { float, float, float, float } %650, 2
  %654 = extractvalue { float, float, float, float } %650, 3
  %655 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %636, float %637, float %638, float %639, i32 %557, i32 %558, i32 %559, i32 %560, i32 0, i32 0) #9
  %656 = extractvalue { float, float, float, float } %655, 0
  %657 = extractvalue { float, float, float, float } %655, 1
  %658 = extractvalue { float, float, float, float } %655, 2
  %659 = extractvalue { float, float, float, float } %655, 3
  %660 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %641, float %642, float %643, float %644, i32 %557, i32 %558, i32 %559, i32 %560, i32 0, i32 0) #9
  %661 = extractvalue { float, float, float, float } %660, 0
  %662 = extractvalue { float, float, float, float } %660, 1
  %663 = extractvalue { float, float, float, float } %660, 2
  %664 = extractvalue { float, float, float, float } %660, 3
  %665 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %646, float %647, float %648, float %649, i32 %501, i32 %502, i32 %503, i32 %504, i32 0, i32 0) #9
  %666 = extractvalue { float, float, float, float } %665, 0
  %667 = extractvalue { float, float, float, float } %665, 1
  %668 = extractvalue { float, float, float, float } %665, 2
  %669 = extractvalue { float, float, float, float } %665, 3
  %670 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %651, float %652, float %653, float %654, i32 %501, i32 %502, i32 %503, i32 %504, i32 0, i32 0) #9
  %671 = extractvalue { float, float, float, float } %670, 0
  %672 = extractvalue { float, float, float, float } %670, 1
  %673 = extractvalue { float, float, float, float } %670, 2
  %674 = extractvalue { float, float, float, float } %670, 3
  %675 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %656, float %657, float %658, float %659, i32 %565, i32 %566, i32 %567, i32 %568, i32 0, i32 0) #9
  %676 = extractvalue { float, float, float, float } %675, 0
  %677 = extractvalue { float, float, float, float } %675, 1
  %678 = extractvalue { float, float, float, float } %675, 2
  %679 = extractvalue { float, float, float, float } %675, 3
  %680 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %661, float %662, float %663, float %664, i32 %565, i32 %566, i32 %567, i32 %568, i32 0, i32 0) #9
  %681 = extractvalue { float, float, float, float } %680, 0
  %682 = extractvalue { float, float, float, float } %680, 1
  %683 = extractvalue { float, float, float, float } %680, 2
  %684 = extractvalue { float, float, float, float } %680, 3
  %685 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %666, float %667, float %668, float %669, i32 %509, i32 %510, i32 %511, i32 %512, i32 0, i32 0) #9
  %686 = extractvalue { float, float, float, float } %685, 0
  %687 = extractvalue { float, float, float, float } %685, 1
  %688 = extractvalue { float, float, float, float } %685, 2
  %689 = extractvalue { float, float, float, float } %685, 3
  %690 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %671, float %672, float %673, float %674, i32 %509, i32 %510, i32 %511, i32 %512, i32 0, i32 0) #9
  %691 = extractvalue { float, float, float, float } %690, 0
  %692 = extractvalue { float, float, float, float } %690, 1
  %693 = extractvalue { float, float, float, float } %690, 2
  %694 = extractvalue { float, float, float, float } %690, 3
  %695 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %676, float %677, float %678, float %679, i32 %573, i32 %574, i32 %575, i32 %576, i32 0, i32 0) #9
  %696 = extractvalue { float, float, float, float } %695, 0
  %697 = extractvalue { float, float, float, float } %695, 1
  %698 = extractvalue { float, float, float, float } %695, 2
  %699 = extractvalue { float, float, float, float } %695, 3
  %700 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %681, float %682, float %683, float %684, i32 %573, i32 %574, i32 %575, i32 %576, i32 0, i32 0) #9
  %701 = extractvalue { float, float, float, float } %700, 0
  %702 = extractvalue { float, float, float, float } %700, 1
  %703 = extractvalue { float, float, float, float } %700, 2
  %704 = extractvalue { float, float, float, float } %700, 3
  %705 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %686, float %687, float %688, float %689, i32 %517, i32 %518, i32 %519, i32 %520, i32 0, i32 0) #9
  %706 = extractvalue { float, float, float, float } %705, 0
  %707 = extractvalue { float, float, float, float } %705, 1
  %708 = extractvalue { float, float, float, float } %705, 2
  %709 = extractvalue { float, float, float, float } %705, 3
  %710 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %691, float %692, float %693, float %694, i32 %517, i32 %518, i32 %519, i32 %520, i32 0, i32 0) #9
  %711 = extractvalue { float, float, float, float } %710, 0
  %712 = extractvalue { float, float, float, float } %710, 1
  %713 = extractvalue { float, float, float, float } %710, 2
  %714 = extractvalue { float, float, float, float } %710, 3
  %715 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %696, float %697, float %698, float %699, i32 %581, i32 %582, i32 %583, i32 %584, i32 0, i32 0) #9
  %716 = extractvalue { float, float, float, float } %715, 0
  %717 = extractvalue { float, float, float, float } %715, 1
  %718 = extractvalue { float, float, float, float } %715, 2
  %719 = extractvalue { float, float, float, float } %715, 3
  %720 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %701, float %702, float %703, float %704, i32 %581, i32 %582, i32 %583, i32 %584, i32 0, i32 0) #9
  %721 = extractvalue { float, float, float, float } %720, 0
  %722 = extractvalue { float, float, float, float } %720, 1
  %723 = extractvalue { float, float, float, float } %720, 2
  %724 = extractvalue { float, float, float, float } %720, 3
  %725 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %706, float %707, float %708, float %709, i32 %525, i32 %526, i32 %527, i32 %528, i32 0, i32 0) #9
  %726 = extractvalue { float, float, float, float } %725, 0
  %727 = extractvalue { float, float, float, float } %725, 1
  %728 = extractvalue { float, float, float, float } %725, 2
  %729 = extractvalue { float, float, float, float } %725, 3
  %730 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %711, float %712, float %713, float %714, i32 %525, i32 %526, i32 %527, i32 %528, i32 0, i32 0) #9
  %731 = extractvalue { float, float, float, float } %730, 0
  %732 = extractvalue { float, float, float, float } %730, 1
  %733 = extractvalue { float, float, float, float } %730, 2
  %734 = extractvalue { float, float, float, float } %730, 3
  %735 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %716, float %717, float %718, float %719, i32 %589, i32 %590, i32 %591, i32 %592, i32 0, i32 0) #9
  %736 = extractvalue { float, float, float, float } %735, 0
  %737 = extractvalue { float, float, float, float } %735, 1
  %738 = extractvalue { float, float, float, float } %735, 2
  %739 = extractvalue { float, float, float, float } %735, 3
  %740 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %721, float %722, float %723, float %724, i32 %589, i32 %590, i32 %591, i32 %592, i32 0, i32 0) #9
  %741 = extractvalue { float, float, float, float } %740, 0
  %742 = extractvalue { float, float, float, float } %740, 1
  %743 = extractvalue { float, float, float, float } %740, 2
  %744 = extractvalue { float, float, float, float } %740, 3
  %745 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %726, float %727, float %728, float %729, i32 %533, i32 %534, i32 %535, i32 %536, i32 0, i32 0) #9
  %746 = extractvalue { float, float, float, float } %745, 0
  %747 = extractvalue { float, float, float, float } %745, 1
  %748 = extractvalue { float, float, float, float } %745, 2
  %749 = extractvalue { float, float, float, float } %745, 3
  %750 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %731, float %732, float %733, float %734, i32 %533, i32 %534, i32 %535, i32 %536, i32 0, i32 0) #9
  %751 = extractvalue { float, float, float, float } %750, 0
  %752 = extractvalue { float, float, float, float } %750, 1
  %753 = extractvalue { float, float, float, float } %750, 2
  %754 = extractvalue { float, float, float, float } %750, 3
  %755 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %736, float %737, float %738, float %739, i32 %597, i32 %598, i32 %599, i32 %600, i32 0, i32 0) #9
  %756 = extractvalue { float, float, float, float } %755, 0
  %757 = extractvalue { float, float, float, float } %755, 1
  %758 = extractvalue { float, float, float, float } %755, 2
  %759 = extractvalue { float, float, float, float } %755, 3
  %760 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %741, float %742, float %743, float %744, i32 %597, i32 %598, i32 %599, i32 %600, i32 0, i32 0) #9
  %761 = extractvalue { float, float, float, float } %760, 0
  %762 = extractvalue { float, float, float, float } %760, 1
  %763 = extractvalue { float, float, float, float } %760, 2
  %764 = extractvalue { float, float, float, float } %760, 3
  %765 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %746, float %747, float %748, float %749, i32 %541, i32 %542, i32 %543, i32 %544, i32 0, i32 0) #9
  %766 = extractvalue { float, float, float, float } %765, 0
  %767 = extractvalue { float, float, float, float } %765, 1
  %768 = extractvalue { float, float, float, float } %765, 2
  %769 = extractvalue { float, float, float, float } %765, 3
  %770 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %751, float %752, float %753, float %754, i32 %541, i32 %542, i32 %543, i32 %544, i32 0, i32 0) #9
  %771 = extractvalue { float, float, float, float } %770, 0
  %772 = extractvalue { float, float, float, float } %770, 1
  %773 = extractvalue { float, float, float, float } %770, 2
  %774 = extractvalue { float, float, float, float } %770, 3
  %775 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %756, float %757, float %758, float %759, i32 %605, i32 %606, i32 %607, i32 %608, i32 0, i32 0) #9
  %776 = extractvalue { float, float, float, float } %775, 0
  %777 = extractvalue { float, float, float, float } %775, 1
  %778 = extractvalue { float, float, float, float } %775, 2
  %779 = extractvalue { float, float, float, float } %775, 3
  %780 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %761, float %762, float %763, float %764, i32 %605, i32 %606, i32 %607, i32 %608, i32 0, i32 0) #9
  %781 = extractvalue { float, float, float, float } %780, 0
  %782 = extractvalue { float, float, float, float } %780, 1
  %783 = extractvalue { float, float, float, float } %780, 2
  %784 = extractvalue { float, float, float, float } %780, 3
  %785 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %766, 0
  %786 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %785, float %767, 1
  %787 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %786, float %768, 2
  %788 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %787, float %769, 3
  %789 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %788, float %771, 4
  %790 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %789, float %772, 5
  %791 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %790, float %773, 6
  %792 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %791, float %774, 7
  %793 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %792, float %776, 8
  %794 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %793, float %777, 9
  %795 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %794, float %778, 10
  %796 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %795, float %779, 11
  %797 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %796, float %781, 12
  %798 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %797, float %782, 13
  %799 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %798, float %783, 14
  %800 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %799, float %784, 15
  %801 = add i32 %477, 1
  %802 = icmp slt i32 %801, 3
  %803 = select i1 %802, i32 %801, i32 0
  %scevgep180 = getelementptr i8, ptr addrspace(1) %lsr.iv178, i64 %393
  %scevgep176 = getelementptr i8, ptr addrspace(1) %lsr.iv174, i64 %393
  %scevgep172 = getelementptr i8, ptr addrspace(1) %lsr.iv170, i64 %393
  %scevgep168 = getelementptr i8, ptr addrspace(1) %lsr.iv166, i64 %393
  %scevgep164 = getelementptr i8, ptr addrspace(1) %lsr.iv162, i64 %393
  %scevgep160 = getelementptr i8, ptr addrspace(1) %lsr.iv158, i64 %393
  %scevgep156 = getelementptr i8, ptr addrspace(1) %lsr.iv154, i64 %393
  %scevgep152 = getelementptr i8, ptr addrspace(1) %lsr.iv150, i64 %393
  %scevgep148 = getelementptr i8, ptr addrspace(1) %lsr.iv146, i64 %393
  %scevgep144 = getelementptr i8, ptr addrspace(1) %lsr.iv142, i64 %393
  %scevgep140 = getelementptr i8, ptr addrspace(1) %lsr.iv138, i64 %393
  %scevgep136 = getelementptr i8, ptr addrspace(1) %lsr.iv134, i64 %393
  %scevgep132 = getelementptr i8, ptr addrspace(1) %lsr.iv130, i64 %393
  %scevgep128 = getelementptr i8, ptr addrspace(1) %lsr.iv126, i64 %393
  %scevgep124 = getelementptr i8, ptr addrspace(1) %lsr.iv122, i64 %393
  %scevgep120 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %393
  %804 = shl i32 %803, 14
  %805 = sext i32 %804 to i64
  %806 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %805
  tail call void @llvm.nvvm.barrier0()
  %807 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %127
  %808 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %132
  %809 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %137
  %810 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %142
  %811 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %147
  %812 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %152
  %813 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %157
  %814 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %162
  %815 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %167
  %816 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %172
  %817 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %177
  %818 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %182
  %819 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %187
  %820 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %192
  %821 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %197
  %822 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %806, i64 %202
  %823 = select i1 %480, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %807, ptr addrspace(1) %scevgep180, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %808, ptr addrspace(1) %scevgep176, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %809, ptr addrspace(1) %scevgep172, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %810, ptr addrspace(1) %scevgep168, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %811, ptr addrspace(1) %scevgep164, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %812, ptr addrspace(1) %scevgep160, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %813, ptr addrspace(1) %scevgep156, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %814, ptr addrspace(1) %scevgep152, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %815, ptr addrspace(1) %scevgep148, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %816, ptr addrspace(1) %scevgep144, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %817, ptr addrspace(1) %scevgep140, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %818, ptr addrspace(1) %scevgep136, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %819, ptr addrspace(1) %scevgep132, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %820, ptr addrspace(1) %scevgep128, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %821, ptr addrspace(1) %scevgep124, i32 %823) #9
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %822, ptr addrspace(1) %scevgep120, i32 %823) #9
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #9
  %824 = add i32 %476, 1
  %825 = icmp slt i32 %824, 3
  %826 = select i1 %825, i32 %824, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %827 = shl i32 %826, 14
  %828 = sext i32 %827 to i64
  %829 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %828
  %scevgep119 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep123 = getelementptr i8, ptr addrspace(1) %lsr.iv122, i64 256
  %scevgep127 = getelementptr i8, ptr addrspace(1) %lsr.iv126, i64 256
  %scevgep131 = getelementptr i8, ptr addrspace(1) %lsr.iv130, i64 256
  %scevgep135 = getelementptr i8, ptr addrspace(1) %lsr.iv134, i64 256
  %scevgep139 = getelementptr i8, ptr addrspace(1) %lsr.iv138, i64 256
  %scevgep143 = getelementptr i8, ptr addrspace(1) %lsr.iv142, i64 256
  %scevgep147 = getelementptr i8, ptr addrspace(1) %lsr.iv146, i64 256
  %scevgep151 = getelementptr i8, ptr addrspace(1) %lsr.iv150, i64 256
  %scevgep155 = getelementptr i8, ptr addrspace(1) %lsr.iv154, i64 256
  %scevgep159 = getelementptr i8, ptr addrspace(1) %lsr.iv158, i64 256
  %scevgep163 = getelementptr i8, ptr addrspace(1) %lsr.iv162, i64 256
  %scevgep167 = getelementptr i8, ptr addrspace(1) %lsr.iv166, i64 256
  %scevgep171 = getelementptr i8, ptr addrspace(1) %lsr.iv170, i64 256
  %scevgep175 = getelementptr i8, ptr addrspace(1) %lsr.iv174, i64 256
  %scevgep179 = getelementptr i8, ptr addrspace(1) %lsr.iv178, i64 256
  %830 = icmp samesign ult i32 %479, 1920
  br i1 %830, label %474, label %831

831:                                              ; preds = %474
  %832 = icmp ult i32 %10, 64
  %833 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %833
  %834 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #9
  tail call void @llvm.nvvm.barrier0()
  %835 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %766) #9
  %836 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %767) #9
  %837 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %768) #9
  %838 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %769) #9
  %839 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %771) #9
  %840 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %772) #9
  %841 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %773) #9
  %842 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %774) #9
  %843 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %776) #9
  %844 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %777) #9
  %845 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %778) #9
  %846 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %779) #9
  %847 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %781) #9
  %848 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %782) #9
  %849 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %783) #9
  %850 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %784) #9
  %851 = shl nsw i32 %834, 4
  %852 = sext i32 %851 to i64
  %853 = or disjoint i64 %9, %56
  %854 = or disjoint i64 %852, %40
  %855 = or disjoint i64 %852, %41
  %856 = getelementptr bfloat, ptr addrspace(1) %arg1117, i64 %853
  %.idx = mul nsw i64 %854, 57344
  %857 = getelementptr i8, ptr addrspace(1) %856, i64 %.idx
  %.idx2 = mul nsw i64 %855, 57344
  %858 = getelementptr i8, ptr addrspace(1) %856, i64 %.idx2
  %859 = shl nuw nsw i32 %10, 8
  %860 = and i32 %859, 768
  %861 = lshr i32 %10, 2
  %862 = and i32 %861, 7
  %863 = lshr exact i32 %12, 1
  %864 = select i1 %832, i32 0, i32 32
  %865 = or disjoint i32 %863, %864
  %866 = or disjoint i32 %865, %862
  %867 = or disjoint i32 %866, %860
  %868 = and i32 %38, 504
  %869 = select i1 %832, i32 0, i32 512
  %870 = or disjoint i32 %868, %869
  %871 = lshr exact i32 %860, 4
  %872 = add nuw nsw i32 %867, %871
  %873 = zext nneg i32 %872 to i64
  %874 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %873
  %875 = bitcast bfloat %835 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %874, <1 x i16> %875, i1 true) #9
  %876 = or disjoint i32 %867, 128
  %877 = lshr i32 %876, 4
  %878 = and i32 %877, 134217720
  %879 = zext nneg i32 %878 to i64
  %880 = zext nneg i32 %867 to i64
  %881 = add i64 %879, %880
  %882 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %881
  %883 = getelementptr inbounds i8, ptr addrspace(3) %882, i64 256
  %884 = bitcast bfloat %836 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %883, <1 x i16> %884, i1 true) #9
  %885 = zext nneg i32 %871 to i64
  %886 = add i64 %885, %880
  %887 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %886
  %888 = getelementptr inbounds i8, ptr addrspace(3) %887, i64 16
  %889 = bitcast bfloat %837 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %888, <1 x i16> %889, i1 true) #9
  %890 = or disjoint i32 %867, 136
  %891 = lshr i32 %890, 4
  %892 = and i32 %891, 134217720
  %893 = zext nneg i32 %892 to i64
  %894 = add i64 %893, %880
  %895 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %894
  %896 = getelementptr inbounds i8, ptr addrspace(3) %895, i64 272
  %897 = bitcast bfloat %838 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %896, <1 x i16> %897, i1 true) #9
  %898 = getelementptr inbounds i8, ptr addrspace(3) %887, i64 128
  %899 = bitcast bfloat %843 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %898, <1 x i16> %899, i1 true) #9
  %900 = or disjoint i32 %867, 192
  %901 = lshr i32 %900, 4
  %902 = and i32 %901, 134217720
  %903 = zext nneg i32 %902 to i64
  %904 = add i64 %903, %880
  %905 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %904
  %906 = getelementptr inbounds i8, ptr addrspace(3) %905, i64 384
  %907 = bitcast bfloat %844 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %906, <1 x i16> %907, i1 true) #9
  %908 = getelementptr inbounds i8, ptr addrspace(3) %887, i64 144
  %909 = bitcast bfloat %845 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %908, <1 x i16> %909, i1 true) #9
  %910 = or disjoint i32 %867, 200
  %911 = lshr i32 %910, 4
  %912 = and i32 %911, 134217720
  %913 = zext nneg i32 %912 to i64
  %914 = add i64 %913, %880
  %915 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %914
  %916 = getelementptr inbounds i8, ptr addrspace(3) %915, i64 400
  %917 = bitcast bfloat %846 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %916, <1 x i16> %917, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %918 = lshr i32 %870, 4
  %919 = and i32 %918, 56
  %920 = add nuw nsw i32 %919, %870
  %921 = zext nneg i32 %920 to i64
  %922 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %921
  %923 = load <4 x i32>, ptr addrspace(3) %922, align 16
  tail call void @llvm.nvvm.barrier0()
  %924 = bitcast bfloat %839 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %874, <1 x i16> %924, i1 true) #9
  %925 = bitcast bfloat %840 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %883, <1 x i16> %925, i1 true) #9
  %926 = bitcast bfloat %841 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %888, <1 x i16> %926, i1 true) #9
  %927 = bitcast bfloat %842 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %896, <1 x i16> %927, i1 true) #9
  %928 = bitcast bfloat %847 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %898, <1 x i16> %928, i1 true) #9
  %929 = bitcast bfloat %848 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %906, <1 x i16> %929, i1 true) #9
  %930 = bitcast bfloat %849 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %908, <1 x i16> %930, i1 true) #9
  %931 = bitcast bfloat %850 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %916, <1 x i16> %931, i1 true) #9
  tail call void @llvm.nvvm.barrier0()
  %932 = load <4 x i32>, ptr addrspace(3) %922, align 16
  %.extract = extractelement <4 x i32> %923, i64 0
  %.extract27 = extractelement <4 x i32> %923, i64 1
  %.extract29 = extractelement <4 x i32> %923, i64 2
  %.extract31 = extractelement <4 x i32> %923, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract27, i32 %.extract29, i32 %.extract31, ptr addrspace(1) %857) #9
  %.extract33 = extractelement <4 x i32> %932, i64 0
  %.extract35 = extractelement <4 x i32> %932, i64 1
  %.extract37 = extractelement <4 x i32> %932, i64 2
  %.extract39 = extractelement <4 x i32> %932, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract33, i32 %.extract35, i32 %.extract37, i32 %.extract39, ptr addrspace(1) %858) #9
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_370(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(917504) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #6 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = mul i64 %3, 28672
  %7 = or disjoint i64 %5, %6
  %8 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %7
  %9 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = and i32 %9, 31
  %11 = lshr i32 %9, 5
  %12 = shl nuw nsw i32 %9, 2
  %13 = and i32 %12, 124
  %14 = icmp samesign ult i32 %9, 32
  %15 = select i1 %14, i32 0, i32 128
  %16 = or disjoint i32 %13, %15
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr bfloat, ptr addrspace(1) %8, i64 %17
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 55296
  %20 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %19) #9
  %21 = extractvalue { i32, i32 } %20, 0
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32 } %20, 1
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = extractelement <2 x bfloat> %24, i64 0
  %28 = extractelement <2 x bfloat> %24, i64 1
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #9
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #9
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %32 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %33 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %4
  %34 = getelementptr bfloat, ptr addrspace(1) %33, i64 %17
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %34) #9
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractelement <2 x bfloat> %37, i64 0
  %41 = extractelement <2 x bfloat> %37, i64 1
  %42 = extractelement <2 x bfloat> %39, i64 0
  %43 = extractelement <2 x bfloat> %39, i64 1
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #9
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #9
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #9
  %47 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #9
  %48 = fadd float %29, %44
  %49 = fadd float %30, %45
  %50 = fadd float %31, %46
  %51 = fadd float %32, %47
  %52 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %6
  %53 = getelementptr i8, ptr addrspace(1) %52, i64 55296
  %54 = shl nuw nsw i32 %9, 3
  %55 = and i32 %54, 248
  %56 = select i1 %14, i32 0, i32 256
  %57 = or disjoint i32 %55, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr bfloat, ptr addrspace(1) %52, i64 %58
  %60 = getelementptr i8, ptr addrspace(1) %59, i64 55296
  %61 = getelementptr bfloat, ptr addrspace(1) %53, i64 %58
  %62 = getelementptr i8, ptr addrspace(1) %61, i64 1024
  %63 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %60) #9
  %64 = extractvalue { i32, i32, i32, i32 } %63, 0
  %65 = bitcast i32 %64 to <2 x bfloat>
  %66 = extractvalue { i32, i32, i32, i32 } %63, 1
  %67 = bitcast i32 %66 to <2 x bfloat>
  %68 = extractvalue { i32, i32, i32, i32 } %63, 2
  %69 = bitcast i32 %68 to <2 x bfloat>
  %70 = extractvalue { i32, i32, i32, i32 } %63, 3
  %71 = bitcast i32 %70 to <2 x bfloat>
  %72 = extractelement <2 x bfloat> %65, i64 0
  %73 = extractelement <2 x bfloat> %65, i64 1
  %74 = extractelement <2 x bfloat> %67, i64 0
  %75 = extractelement <2 x bfloat> %67, i64 1
  %76 = extractelement <2 x bfloat> %69, i64 0
  %77 = extractelement <2 x bfloat> %69, i64 1
  %78 = extractelement <2 x bfloat> %71, i64 0
  %79 = extractelement <2 x bfloat> %71, i64 1
  %80 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %62) #9
  %81 = extractvalue { i32, i32, i32, i32 } %80, 0
  %82 = bitcast i32 %81 to <2 x bfloat>
  %83 = extractvalue { i32, i32, i32, i32 } %80, 1
  %84 = bitcast i32 %83 to <2 x bfloat>
  %85 = extractvalue { i32, i32, i32, i32 } %80, 2
  %86 = bitcast i32 %85 to <2 x bfloat>
  %87 = extractvalue { i32, i32, i32, i32 } %80, 3
  %88 = bitcast i32 %87 to <2 x bfloat>
  %89 = extractelement <2 x bfloat> %82, i64 0
  %90 = extractelement <2 x bfloat> %82, i64 1
  %91 = extractelement <2 x bfloat> %84, i64 0
  %92 = extractelement <2 x bfloat> %84, i64 1
  %93 = extractelement <2 x bfloat> %86, i64 0
  %94 = extractelement <2 x bfloat> %86, i64 1
  %95 = extractelement <2 x bfloat> %88, i64 0
  %96 = extractelement <2 x bfloat> %88, i64 1
  %97 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #9
  %98 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73) #9
  %99 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74) #9
  %100 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75) #9
  %101 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76) #9
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77) #9
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #9
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %91) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %92) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %93) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %94) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %.idx = shl i64 %3, 11
  %113 = getelementptr i8, ptr addrspace(1) %arg13, i64 %.idx
  %114 = getelementptr bfloat, ptr addrspace(1) %113, i64 %58
  %115 = getelementptr i8, ptr addrspace(1) %114, i64 1024
  %116 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %114) #9
  %117 = extractvalue { i32, i32, i32, i32 } %116, 0
  %118 = bitcast i32 %117 to <2 x bfloat>
  %119 = extractvalue { i32, i32, i32, i32 } %116, 1
  %120 = bitcast i32 %119 to <2 x bfloat>
  %121 = extractvalue { i32, i32, i32, i32 } %116, 2
  %122 = bitcast i32 %121 to <2 x bfloat>
  %123 = extractvalue { i32, i32, i32, i32 } %116, 3
  %124 = bitcast i32 %123 to <2 x bfloat>
  %125 = extractelement <2 x bfloat> %118, i64 0
  %126 = extractelement <2 x bfloat> %118, i64 1
  %127 = extractelement <2 x bfloat> %120, i64 0
  %128 = extractelement <2 x bfloat> %120, i64 1
  %129 = extractelement <2 x bfloat> %122, i64 0
  %130 = extractelement <2 x bfloat> %122, i64 1
  %131 = extractelement <2 x bfloat> %124, i64 0
  %132 = extractelement <2 x bfloat> %124, i64 1
  %133 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %115) #9
  %134 = extractvalue { i32, i32, i32, i32 } %133, 0
  %135 = bitcast i32 %134 to <2 x bfloat>
  %136 = extractvalue { i32, i32, i32, i32 } %133, 1
  %137 = bitcast i32 %136 to <2 x bfloat>
  %138 = extractvalue { i32, i32, i32, i32 } %133, 2
  %139 = bitcast i32 %138 to <2 x bfloat>
  %140 = extractvalue { i32, i32, i32, i32 } %133, 3
  %141 = bitcast i32 %140 to <2 x bfloat>
  %142 = extractelement <2 x bfloat> %135, i64 0
  %143 = extractelement <2 x bfloat> %135, i64 1
  %144 = extractelement <2 x bfloat> %137, i64 0
  %145 = extractelement <2 x bfloat> %137, i64 1
  %146 = extractelement <2 x bfloat> %139, i64 0
  %147 = extractelement <2 x bfloat> %139, i64 1
  %148 = extractelement <2 x bfloat> %141, i64 0
  %149 = extractelement <2 x bfloat> %141, i64 1
  %150 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #9
  %151 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #9
  %152 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #9
  %153 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #9
  %154 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #9
  %155 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #9
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #9
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #9
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #9
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
  %176 = fadd float %107, %160
  %177 = fadd float %108, %161
  %178 = fadd float %109, %162
  %179 = fadd float %110, %163
  %180 = fadd float %111, %164
  %181 = fadd float %112, %165
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
  %192 = fmul float %176, %176
  %193 = fmul float %177, %177
  %194 = fmul float %178, %178
  %195 = fmul float %179, %179
  %196 = fmul float %180, %180
  %197 = fmul float %181, %181
  %198 = fadd float %182, %183
  %199 = fadd float %198, %184
  %200 = fadd float %199, %185
  %201 = fadd float %200, %186
  %202 = fadd float %201, %187
  %203 = fadd float %202, %188
  %204 = fadd float %203, %189
  %205 = fadd float %204, %190
  %206 = fadd float %205, %191
  %207 = fadd float %206, %192
  %208 = fadd float %207, %193
  %209 = fadd float %208, %194
  %210 = fadd float %209, %195
  %211 = fadd float %210, %196
  %212 = fadd float %211, %197
  %213 = bitcast float %212 to i32
  %214 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %213, i32 16, i32 31)
  %215 = bitcast i32 %214 to float
  %216 = fadd float %212, %215
  %217 = bitcast float %216 to i32
  %218 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %217, i32 8, i32 31)
  %219 = bitcast i32 %218 to float
  %220 = fadd float %216, %219
  %221 = bitcast float %220 to i32
  %222 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %221, i32 4, i32 31)
  %223 = bitcast i32 %222 to float
  %224 = fadd float %220, %223
  %225 = bitcast float %224 to i32
  %226 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %225, i32 2, i32 31)
  %227 = bitcast i32 %226 to float
  %228 = fadd float %224, %227
  %229 = bitcast float %228 to i32
  %230 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %229, i32 1, i32 31)
  %231 = bitcast i32 %230 to float
  %232 = fadd float %228, %231
  %233 = icmp eq i32 %10, 0
  %234 = zext nneg i32 %11 to i64
  %235 = getelementptr float, ptr addrspace(3) @global_smem, i64 %234
  %236 = bitcast float %232 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %235, <1 x i32> %236, i1 %233) #9
  tail call void @llvm.nvvm.barrier0()
  %237 = icmp samesign ult i32 %9, 2
  %238 = zext nneg i32 %9 to i64
  %239 = getelementptr float, ptr addrspace(3) @global_smem, i64 %238
  %240 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %239, i1 %237) #9
  %241 = bitcast i32 %240 to float
  %242 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %240, i32 1, i32 31)
  %243 = bitcast i32 %242 to float
  %244 = fadd float %241, %243
  %245 = icmp eq i32 %9, 0
  %246 = bitcast float %244 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %239, <1 x i32> %246, i1 %245) #9
  tail call void @llvm.nvvm.barrier0()
  %247 = load float, ptr addrspace(3) @global_smem, align 16
  %248 = fmul float %247, 0x3F50000000000000
  %249 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %250 = bitcast i32 %249 to float
  %251 = fadd float %248, %250
  %252 = tail call float @llvm.nvvm.rsqrt.approx.f(float %251)
  %253 = fmul float %48, %252
  %254 = fmul float %49, %252
  %255 = fmul float %50, %252
  %256 = fmul float %51, %252
  %257 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %5
  %258 = getelementptr bfloat, ptr addrspace(1) %257, i64 %17
  %259 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %258) #9
  %260 = extractvalue { i32, i32 } %259, 0
  %261 = bitcast i32 %260 to <2 x bfloat>
  %262 = extractvalue { i32, i32 } %259, 1
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractelement <2 x bfloat> %261, i64 0
  %265 = extractelement <2 x bfloat> %261, i64 1
  %266 = extractelement <2 x bfloat> %263, i64 0
  %267 = extractelement <2 x bfloat> %263, i64 1
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #9
  %272 = fmul float %253, %268
  %273 = fmul float %254, %269
  %274 = fmul float %255, %270
  %275 = fmul float %256, %271
  %276 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %272) #9
  %277 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %273) #9
  %278 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %274) #9
  %279 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %275) #9
  %280 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %281 = getelementptr bfloat, ptr addrspace(1) %280, i64 %17
  %282 = insertelement <2 x bfloat> poison, bfloat %276, i64 0
  %283 = insertelement <2 x bfloat> %282, bfloat %277, i64 1
  %284 = bitcast <2 x bfloat> %283 to i32
  %285 = insertelement <2 x bfloat> poison, bfloat %278, i64 0
  %286 = insertelement <2 x bfloat> %285, bfloat %279, i64 1
  %287 = bitcast <2 x bfloat> %286 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %284, i32 %287, ptr addrspace(1) %281) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion_27(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
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
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !5, !alias.scope !8
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
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5, !alias.scope !11
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

define ptx_kernel void @fusion_368(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 53248
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 53248
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 55296
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 55296
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %330, <1 x i32> %331, i1 %328) #9
  tail call void @llvm.nvvm.barrier0()
  %332 = icmp samesign ult i32 %5, 2
  %333 = zext nneg i32 %5 to i64
  %334 = getelementptr float, ptr addrspace(3) @global_smem, i64 %333
  %335 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %334, i1 %332) #9
  %336 = bitcast i32 %335 to float
  %337 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %335, i32 1, i32 31)
  %338 = bitcast i32 %337 to float
  %339 = fadd float %336, %338
  %340 = icmp eq i32 %5, 0
  %341 = bitcast float %339 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %334, <1 x i32> %341, i1 %340) #9
  tail call void @llvm.nvvm.barrier0()
  %342 = load float, ptr addrspace(3) @global_smem, align 16
  %343 = fmul float %342, 0x3F50000000000000
  %344 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %364 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %365 = getelementptr i8, ptr addrspace(1) %364, i64 1024
  %366 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %364) #9
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
  %383 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %365) #9
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
  %400 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %375) #9
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #9
  %402 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #9
  %403 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #9
  %404 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #9
  %405 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #9
  %406 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #9
  %407 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382) #9
  %408 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %392) #9
  %409 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393) #9
  %410 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394) #9
  %411 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %395) #9
  %412 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396) #9
  %413 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397) #9
  %414 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398) #9
  %415 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399) #9
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
  %432 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %416) #9
  %433 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %417) #9
  %434 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %418) #9
  %435 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %419) #9
  %436 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %420) #9
  %437 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %421) #9
  %438 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %422) #9
  %439 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %423) #9
  %440 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %424) #9
  %441 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %425) #9
  %442 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %426) #9
  %443 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %427) #9
  %444 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %428) #9
  %445 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %429) #9
  %446 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %430) #9
  %447 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %431) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %453, i32 %456, i32 %459, i32 %462, ptr addrspace(1) %449) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %465, i32 %468, i32 %471, i32 %474, ptr addrspace(1) %450) #9
  ret void
}

define ptx_kernel void @fusion_366(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 51200
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 51200
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 53248
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 53248
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 55296
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 55296
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %469, <1 x i32> %470, i1 %467) #9
  tail call void @llvm.nvvm.barrier0()
  %471 = icmp samesign ult i32 %5, 2
  %472 = zext nneg i32 %5 to i64
  %473 = getelementptr float, ptr addrspace(3) @global_smem, i64 %472
  %474 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %473, i1 %471) #9
  %475 = bitcast i32 %474 to float
  %476 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %474, i32 1, i32 31)
  %477 = bitcast i32 %476 to float
  %478 = fadd float %475, %477
  %479 = icmp eq i32 %5, 0
  %480 = bitcast float %478 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %473, <1 x i32> %480, i1 %479) #9
  tail call void @llvm.nvvm.barrier0()
  %481 = load float, ptr addrspace(3) @global_smem, align 16
  %482 = fmul float %481, 0x3F50000000000000
  %483 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %505 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %503) #9
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
  %522 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %504) #9
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
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #9
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #9
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #9
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #9
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #9
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #9
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #9
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #9
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #9
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #9
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #9
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #9
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #9
  %552 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %536) #9
  %553 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %537) #9
  %554 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %538) #9
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
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #9
  %572 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %556) #9
  %573 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %557) #9
  %574 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %558) #9
  %575 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %559) #9
  %576 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %560) #9
  %577 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %561) #9
  %578 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %562) #9
  %579 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %563) #9
  %580 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %564) #9
  %581 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %565) #9
  %582 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %566) #9
  %583 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %567) #9
  %584 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %568) #9
  %585 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %569) #9
  %586 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %570) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %592, i32 %595, i32 %598, i32 %601, ptr addrspace(1) %588) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %604, i32 %607, i32 %610, i32 %613, ptr addrspace(1) %589) #9
  ret void
}

define ptx_kernel void @fusion_364(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 49152
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 49152
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 51200
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 51200
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 53248
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 53248
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = getelementptr i8, ptr addrspace(1) %3, i64 55296
  %337 = getelementptr i8, ptr addrspace(1) %14, i64 55296
  %338 = getelementptr bfloat, ptr addrspace(1) %336, i64 %13
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 1024
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #9
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
  %357 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #9
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
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #9
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #9
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #9
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #9
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #9
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #9
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #9
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #9
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #9
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #9
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #9
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #9
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #9
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #9
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372) #9
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #9
  %390 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %391 = getelementptr bfloat, ptr addrspace(1) %390, i64 %13
  %392 = getelementptr i8, ptr addrspace(1) %391, i64 1024
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %391) #9
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
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %392) #9
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
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #9
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #9
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #9
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #9
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #9
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #9
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408) #9
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409) #9
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #9
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #9
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #9
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #9
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #9
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #9
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425) #9
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %608, <1 x i32> %609, i1 %606) #9
  tail call void @llvm.nvvm.barrier0()
  %610 = icmp samesign ult i32 %5, 2
  %611 = zext nneg i32 %5 to i64
  %612 = getelementptr float, ptr addrspace(3) @global_smem, i64 %611
  %613 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %612, i1 %610) #9
  %614 = bitcast i32 %613 to float
  %615 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %613, i32 1, i32 31)
  %616 = bitcast i32 %615 to float
  %617 = fadd float %614, %616
  %618 = icmp eq i32 %5, 0
  %619 = bitcast float %617 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %612, <1 x i32> %619, i1 %618) #9
  tail call void @llvm.nvvm.barrier0()
  %620 = load float, ptr addrspace(3) @global_smem, align 16
  %621 = fmul float %620, 0x3F50000000000000
  %622 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %642 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %643 = getelementptr i8, ptr addrspace(1) %642, i64 1024
  %644 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %642) #9
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
  %661 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %643) #9
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
  %678 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653) #9
  %679 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654) #9
  %680 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655) #9
  %681 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656) #9
  %682 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %657) #9
  %683 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658) #9
  %684 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %659) #9
  %685 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %660) #9
  %686 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670) #9
  %687 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671) #9
  %688 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672) #9
  %689 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673) #9
  %690 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %674) #9
  %691 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %675) #9
  %692 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %676) #9
  %693 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %677) #9
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
  %710 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %694) #9
  %711 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695) #9
  %712 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696) #9
  %713 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697) #9
  %714 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %698) #9
  %715 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %699) #9
  %716 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %700) #9
  %717 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %701) #9
  %718 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %702) #9
  %719 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %703) #9
  %720 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %704) #9
  %721 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %705) #9
  %722 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %706) #9
  %723 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %707) #9
  %724 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %708) #9
  %725 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %709) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %731, i32 %734, i32 %737, i32 %740, ptr addrspace(1) %727) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %743, i32 %746, i32 %749, i32 %752, ptr addrspace(1) %728) #9
  ret void
}

define ptx_kernel void @fusion_362(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8) local_unnamed_addr #6 {
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 47104
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 47104
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 49152
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 49152
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 51200
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 51200
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = getelementptr i8, ptr addrspace(1) %3, i64 53248
  %337 = getelementptr i8, ptr addrspace(1) %14, i64 53248
  %338 = getelementptr bfloat, ptr addrspace(1) %336, i64 %13
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 1024
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #9
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
  %357 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #9
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
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #9
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #9
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #9
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #9
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #9
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #9
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #9
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #9
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #9
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #9
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #9
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #9
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #9
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #9
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372) #9
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #9
  %390 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %391 = getelementptr bfloat, ptr addrspace(1) %390, i64 %13
  %392 = getelementptr i8, ptr addrspace(1) %391, i64 1024
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %391) #9
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
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %392) #9
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
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #9
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #9
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #9
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #9
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #9
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #9
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408) #9
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409) #9
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #9
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #9
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #9
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #9
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #9
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #9
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425) #9
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426) #9
  %443 = getelementptr i8, ptr addrspace(1) %3, i64 55296
  %444 = getelementptr i8, ptr addrspace(1) %14, i64 55296
  %445 = getelementptr bfloat, ptr addrspace(1) %443, i64 %13
  %446 = getelementptr i8, ptr addrspace(1) %445, i64 1024
  %447 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %444) #9
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
  %464 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %446) #9
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
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #9
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #9
  %483 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458) #9
  %484 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #9
  %485 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #9
  %486 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %461) #9
  %487 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %462) #9
  %488 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %463) #9
  %489 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %473) #9
  %490 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474) #9
  %491 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475) #9
  %492 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476) #9
  %493 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477) #9
  %494 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %478) #9
  %495 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %479) #9
  %496 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %480) #9
  %497 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %498 = getelementptr bfloat, ptr addrspace(1) %497, i64 %13
  %499 = getelementptr i8, ptr addrspace(1) %498, i64 1024
  %500 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %498) #9
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
  %517 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %499) #9
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
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %509) #9
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %510) #9
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %511) #9
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %512) #9
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %513) #9
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #9
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #9
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #9
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %526) #9
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %527) #9
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %528) #9
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %529) #9
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %530) #9
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #9
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #9
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %747, <1 x i32> %748, i1 %745) #9
  tail call void @llvm.nvvm.barrier0()
  %749 = icmp samesign ult i32 %5, 2
  %750 = zext nneg i32 %5 to i64
  %751 = getelementptr float, ptr addrspace(3) @global_smem, i64 %750
  %752 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %751, i1 %749) #9
  %753 = bitcast i32 %752 to float
  %754 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %752, i32 1, i32 31)
  %755 = bitcast i32 %754 to float
  %756 = fadd float %753, %755
  %757 = icmp eq i32 %5, 0
  %758 = bitcast float %756 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %751, <1 x i32> %758, i1 %757) #9
  tail call void @llvm.nvvm.barrier0()
  %759 = load float, ptr addrspace(3) @global_smem, align 16
  %760 = fmul float %759, 0x3F50000000000000
  %761 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %783 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %781) #9
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
  %800 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %782) #9
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
  %817 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %792) #9
  %818 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %793) #9
  %819 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %794) #9
  %820 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %795) #9
  %821 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %796) #9
  %822 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %797) #9
  %823 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %798) #9
  %824 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %799) #9
  %825 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %809) #9
  %826 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %810) #9
  %827 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %811) #9
  %828 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %812) #9
  %829 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %813) #9
  %830 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %814) #9
  %831 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %815) #9
  %832 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %816) #9
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
  %849 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %833) #9
  %850 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %834) #9
  %851 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %835) #9
  %852 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %836) #9
  %853 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %837) #9
  %854 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %838) #9
  %855 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %839) #9
  %856 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %840) #9
  %857 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %841) #9
  %858 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %842) #9
  %859 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %843) #9
  %860 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %844) #9
  %861 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %845) #9
  %862 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %846) #9
  %863 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %847) #9
  %864 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %848) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %870, i32 %873, i32 %876, i32 %879, ptr addrspace(1) %866) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %882, i32 %885, i32 %888, i32 %891, ptr addrspace(1) %867) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(917504) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %5, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %6, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %7) local_unnamed_addr #0 {
  %9 = addrspacecast ptr %7 to ptr addrspace(1)
  %10 = addrspacecast ptr %6 to ptr addrspace(1)
  %11 = addrspacecast ptr %5 to ptr addrspace(1)
  %12 = addrspacecast ptr %4 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = addrspacecast ptr %2 to ptr addrspace(1)
  %15 = addrspacecast ptr %1 to ptr addrspace(1)
  %16 = addrspacecast ptr %0 to ptr addrspace(1)
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %19 = lshr i32 %18, 3
  %20 = shl nuw nsw i32 %18, 7
  %21 = and i32 %20, 896
  %22 = or disjoint i32 %21, %17
  %23 = or disjoint i32 %20, %17
  %24 = zext nneg i32 %23 to i64
  %25 = getelementptr inbounds bfloat, ptr addrspace(1) %13, i64 %24
  %26 = load bfloat, ptr addrspace(1) %25, align 2, !invariant.load !5
  %27 = getelementptr inbounds bfloat, ptr addrspace(1) %12, i64 %24
  %28 = load bfloat, ptr addrspace(1) %27, align 2, !invariant.load !5
  %29 = mul nuw nsw i32 %19, 28672
  %30 = zext nneg i32 %22 to i64
  %31 = zext nneg i32 %29 to i64
  %32 = add i64 %31, %30
  %33 = getelementptr bfloat, ptr addrspace(1) %16, i64 %32
  %34 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 55296
  %35 = load bfloat, ptr addrspace(1) %34, align 2, !invariant.load !5, !alias.scope !14
  %36 = fpext bfloat %35 to float
  %37 = fpext bfloat %26 to float
  %38 = fpext bfloat %28 to float
  %39 = fadd float %37, %36
  %40 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %24
  %41 = load bfloat, ptr addrspace(1) %40, align 2, !invariant.load !5
  %42 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 53248
  %43 = load bfloat, ptr addrspace(1) %42, align 2, !invariant.load !5, !alias.scope !17
  %44 = fpext bfloat %43 to float
  %45 = fadd float %39, %38
  %46 = fpext bfloat %41 to float
  %47 = fadd float %45, %44
  %48 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %24
  %49 = load bfloat, ptr addrspace(1) %48, align 2, !invariant.load !5
  %50 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 51200
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !5, !alias.scope !20
  %52 = fpext bfloat %51 to float
  %53 = fadd float %47, %46
  %54 = fpext bfloat %49 to float
  %55 = fadd float %53, %52
  %56 = getelementptr inbounds bfloat, ptr addrspace(1) %14, i64 %24
  %57 = load bfloat, ptr addrspace(1) %56, align 2, !invariant.load !5
  %58 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 49152
  %59 = load bfloat, ptr addrspace(1) %58, align 2, !invariant.load !5, !alias.scope !23
  %60 = fpext bfloat %59 to float
  %61 = fadd float %55, %54
  %62 = fpext bfloat %57 to float
  %63 = fadd float %61, %60
  %64 = getelementptr inbounds bfloat, ptr addrspace(1) %15, i64 %24
  %65 = load bfloat, ptr addrspace(1) %64, align 2, !invariant.load !5
  %66 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 47104
  %67 = load bfloat, ptr addrspace(1) %66, align 2, !invariant.load !5, !alias.scope !26
  %68 = fpext bfloat %67 to float
  %69 = fadd float %63, %62
  %70 = fpext bfloat %65 to float
  %71 = fadd float %69, %68
  %72 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 45056
  %73 = load bfloat, ptr addrspace(1) %72, align 2, !invariant.load !5, !alias.scope !29
  %74 = fpext bfloat %73 to float
  %75 = fadd float %71, %70
  %76 = fadd float %75, %74
  %77 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %24
  store float %76, ptr addrspace(1) %77, align 4
  ret void
}

define ptx_kernel void @fusion_360(ptr noalias align 128 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) local_unnamed_addr #6 {
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 7
  %4 = and i64 %3, 896
  %5 = getelementptr float, ptr addrspace(1) %arg01, i64 %3
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 1
  %10 = and i32 %9, 62
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 64
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr float, ptr addrspace(1) %5, i64 %14
  %16 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %15) #9
  %17 = extractvalue { i32, i32 } %16, 0
  %18 = extractvalue { i32, i32 } %16, 1
  %19 = bitcast i32 %17 to float
  %20 = bitcast i32 %18 to float
  %21 = and i64 %3, -1024
  %22 = getelementptr float, ptr addrspace(1) %arg01, i64 %21
  %23 = shl nuw nsw i32 %6, 2
  %24 = and i32 %23, 124
  %25 = select i1 %11, i32 0, i32 128
  %26 = or disjoint i32 %24, %25
  %27 = zext nneg i32 %26 to i64
  %28 = getelementptr float, ptr addrspace(1) %22, i64 %27
  %29 = getelementptr i8, ptr addrspace(1) %28, i64 1024
  %30 = getelementptr i8, ptr addrspace(1) %28, i64 2048
  %31 = getelementptr i8, ptr addrspace(1) %28, i64 3072
  %32 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %28) #9
  %33 = extractvalue { i32, i32, i32, i32 } %32, 0
  %34 = extractvalue { i32, i32, i32, i32 } %32, 1
  %35 = extractvalue { i32, i32, i32, i32 } %32, 2
  %36 = extractvalue { i32, i32, i32, i32 } %32, 3
  %37 = bitcast i32 %33 to float
  %38 = bitcast i32 %34 to float
  %39 = bitcast i32 %35 to float
  %40 = bitcast i32 %36 to float
  %41 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %29) #9
  %42 = extractvalue { i32, i32, i32, i32 } %41, 0
  %43 = extractvalue { i32, i32, i32, i32 } %41, 1
  %44 = extractvalue { i32, i32, i32, i32 } %41, 2
  %45 = extractvalue { i32, i32, i32, i32 } %41, 3
  %46 = bitcast i32 %42 to float
  %47 = bitcast i32 %43 to float
  %48 = bitcast i32 %44 to float
  %49 = bitcast i32 %45 to float
  %50 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %30) #9
  %51 = extractvalue { i32, i32, i32, i32 } %50, 0
  %52 = extractvalue { i32, i32, i32, i32 } %50, 1
  %53 = extractvalue { i32, i32, i32, i32 } %50, 2
  %54 = extractvalue { i32, i32, i32, i32 } %50, 3
  %55 = bitcast i32 %51 to float
  %56 = bitcast i32 %52 to float
  %57 = bitcast i32 %53 to float
  %58 = bitcast i32 %54 to float
  %59 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %31) #9
  %60 = extractvalue { i32, i32, i32, i32 } %59, 0
  %61 = extractvalue { i32, i32, i32, i32 } %59, 1
  %62 = extractvalue { i32, i32, i32, i32 } %59, 2
  %63 = extractvalue { i32, i32, i32, i32 } %59, 3
  %64 = bitcast i32 %60 to float
  %65 = bitcast i32 %61 to float
  %66 = bitcast i32 %62 to float
  %67 = bitcast i32 %63 to float
  %68 = fmul float %37, %37
  %69 = fmul float %38, %38
  %70 = fmul float %39, %39
  %71 = fmul float %40, %40
  %72 = fmul float %46, %46
  %73 = fmul float %47, %47
  %74 = fmul float %48, %48
  %75 = fmul float %49, %49
  %76 = fmul float %55, %55
  %77 = fmul float %56, %56
  %78 = fmul float %57, %57
  %79 = fmul float %58, %58
  %80 = fmul float %64, %64
  %81 = fmul float %65, %65
  %82 = fmul float %66, %66
  %83 = fmul float %67, %67
  %84 = fadd float %68, %69
  %85 = fadd float %70, %84
  %86 = fadd float %71, %85
  %87 = fadd float %72, %86
  %88 = fadd float %73, %87
  %89 = fadd float %74, %88
  %90 = fadd float %75, %89
  %91 = fadd float %76, %90
  %92 = fadd float %77, %91
  %93 = fadd float %78, %92
  %94 = fadd float %79, %93
  %95 = fadd float %80, %94
  %96 = fadd float %81, %95
  %97 = fadd float %82, %96
  %98 = fadd float %83, %97
  %99 = bitcast float %98 to i32
  %100 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %99, i32 16, i32 31)
  %101 = bitcast i32 %100 to float
  %102 = fadd float %98, %101
  %103 = bitcast float %102 to i32
  %104 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %103, i32 8, i32 31)
  %105 = bitcast i32 %104 to float
  %106 = fadd float %102, %105
  %107 = bitcast float %106 to i32
  %108 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %107, i32 4, i32 31)
  %109 = bitcast i32 %108 to float
  %110 = fadd float %106, %109
  %111 = bitcast float %110 to i32
  %112 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %111, i32 2, i32 31)
  %113 = bitcast i32 %112 to float
  %114 = fadd float %110, %113
  %115 = bitcast float %114 to i32
  %116 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %115, i32 1, i32 31)
  %117 = bitcast i32 %116 to float
  %118 = fadd float %114, %117
  %119 = icmp eq i32 %7, 0
  %120 = zext nneg i32 %8 to i64
  %121 = getelementptr float, ptr addrspace(3) @global_smem, i64 %120
  %122 = bitcast float %118 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %121, <1 x i32> %122, i1 %119) #9
  tail call void @llvm.nvvm.barrier0()
  %123 = icmp samesign ult i32 %6, 2
  %124 = zext nneg i32 %6 to i64
  %125 = getelementptr float, ptr addrspace(3) @global_smem, i64 %124
  %126 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %125, i1 %123) #9
  %127 = bitcast i32 %126 to float
  %128 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %126, i32 1, i32 31)
  %129 = bitcast i32 %128 to float
  %130 = fadd float %127, %129
  %131 = icmp eq i32 %6, 0
  %132 = bitcast float %130 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %125, <1 x i32> %132, i1 %131) #9
  tail call void @llvm.nvvm.barrier0()
  %133 = load float, ptr addrspace(3) @global_smem, align 16
  %134 = fmul float %133, 0x3F50000000000000
  %135 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg13) #9
  %136 = bitcast i32 %135 to float
  %137 = fadd float %134, %136
  %138 = tail call float @llvm.nvvm.rsqrt.approx.f(float %137)
  %139 = fmul float %138, %19
  %140 = fmul float %138, %20
  %141 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %142 = getelementptr bfloat, ptr addrspace(1) %141, i64 %14
  %143 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %142) #9
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractelement <2 x bfloat> %144, i64 0
  %146 = extractelement <2 x bfloat> %144, i64 1
  %147 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #9
  %148 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #9
  %149 = fmul float %139, %147
  %150 = fmul float %140, %148
  %151 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %149) #9
  %152 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %150) #9
  %153 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %154 = getelementptr bfloat, ptr addrspace(1) %153, i64 %14
  %155 = insertelement <2 x bfloat> poison, bfloat %151, i64 0
  %156 = insertelement <2 x bfloat> %155, bfloat %152, i64 1
  %157 = bitcast <2 x bfloat> %156 to i32
  tail call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %157, ptr addrspace(1) %154) #9
  ret void
}

define ptx_kernel void @fusion_358(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 43008
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 43008
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #9
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #9
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #9
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %282 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
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
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
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
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #9
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #9
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #9
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #9
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #9
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #9
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #9
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #9
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #9
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #9
  ret void
}

define ptx_kernel void @fusion_356(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 40960
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 40960
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 43008
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 43008
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #9
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = extractvalue { i32, i32, i32, i32 } %261, 1
  %264 = extractvalue { i32, i32, i32, i32 } %261, 2
  %265 = extractvalue { i32, i32, i32, i32 } %261, 3
  %266 = bitcast i32 %262 to float
  %267 = bitcast i32 %263 to float
  %268 = bitcast i32 %264 to float
  %269 = bitcast i32 %265 to float
  %270 = fadd float %213, %239
  %271 = fadd float %214, %240
  %272 = fadd float %215, %241
  %273 = fadd float %216, %242
  %274 = fadd float %217, %248
  %275 = fadd float %218, %249
  %276 = fadd float %219, %250
  %277 = fadd float %220, %251
  %278 = fadd float %221, %257
  %279 = fadd float %222, %258
  %280 = fadd float %223, %259
  %281 = fadd float %224, %260
  %282 = fadd float %225, %266
  %283 = fadd float %226, %267
  %284 = fadd float %227, %268
  %285 = fadd float %228, %269
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
  %299 = fadd float %173, %283
  %300 = fadd float %174, %284
  %301 = fadd float %175, %285
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
  %315 = fadd float %119, %299
  %316 = fadd float %120, %300
  %317 = fadd float %121, %301
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
  %331 = fadd float %65, %315
  %332 = fadd float %66, %316
  %333 = fadd float %67, %317
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
  %347 = fmul float %331, %331
  %348 = fmul float %332, %332
  %349 = fmul float %333, %333
  %350 = fadd float %334, %335
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
  %362 = fadd float %347, %361
  %363 = fadd float %348, %362
  %364 = fadd float %349, %363
  %365 = bitcast float %364 to i32
  %366 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %365, i32 16, i32 31)
  %367 = bitcast i32 %366 to float
  %368 = fadd float %364, %367
  %369 = bitcast float %368 to i32
  %370 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %369, i32 8, i32 31)
  %371 = bitcast i32 %370 to float
  %372 = fadd float %368, %371
  %373 = bitcast float %372 to i32
  %374 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %373, i32 4, i32 31)
  %375 = bitcast i32 %374 to float
  %376 = fadd float %372, %375
  %377 = bitcast float %376 to i32
  %378 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %377, i32 2, i32 31)
  %379 = bitcast i32 %378 to float
  %380 = fadd float %376, %379
  %381 = bitcast float %380 to i32
  %382 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %381, i32 1, i32 31)
  %383 = bitcast i32 %382 to float
  %384 = fadd float %380, %383
  %385 = icmp eq i32 %6, 0
  %386 = zext nneg i32 %7 to i64
  %387 = getelementptr float, ptr addrspace(3) @global_smem, i64 %386
  %388 = bitcast float %384 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #9
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #9
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #9
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %402 = bitcast i32 %401 to float
  %403 = fadd float %400, %402
  %404 = tail call float @llvm.nvvm.rsqrt.approx.f(float %403)
  %405 = fmul float %318, %404
  %406 = fmul float %319, %404
  %407 = fmul float %320, %404
  %408 = fmul float %321, %404
  %409 = fmul float %322, %404
  %410 = fmul float %323, %404
  %411 = fmul float %324, %404
  %412 = fmul float %325, %404
  %413 = fmul float %326, %404
  %414 = fmul float %327, %404
  %415 = fmul float %328, %404
  %416 = fmul float %329, %404
  %417 = fmul float %330, %404
  %418 = fmul float %331, %404
  %419 = fmul float %332, %404
  %420 = fmul float %333, %404
  %421 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %422 = getelementptr i8, ptr addrspace(1) %421, i64 1024
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #9
  %424 = extractvalue { i32, i32, i32, i32 } %423, 0
  %425 = bitcast i32 %424 to <2 x bfloat>
  %426 = extractvalue { i32, i32, i32, i32 } %423, 1
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = extractvalue { i32, i32, i32, i32 } %423, 2
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractvalue { i32, i32, i32, i32 } %423, 3
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractelement <2 x bfloat> %425, i64 0
  %433 = extractelement <2 x bfloat> %425, i64 1
  %434 = extractelement <2 x bfloat> %427, i64 0
  %435 = extractelement <2 x bfloat> %427, i64 1
  %436 = extractelement <2 x bfloat> %429, i64 0
  %437 = extractelement <2 x bfloat> %429, i64 1
  %438 = extractelement <2 x bfloat> %431, i64 0
  %439 = extractelement <2 x bfloat> %431, i64 1
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #9
  %441 = extractvalue { i32, i32, i32, i32 } %440, 0
  %442 = bitcast i32 %441 to <2 x bfloat>
  %443 = extractvalue { i32, i32, i32, i32 } %440, 1
  %444 = bitcast i32 %443 to <2 x bfloat>
  %445 = extractvalue { i32, i32, i32, i32 } %440, 2
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %440, 3
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractelement <2 x bfloat> %442, i64 0
  %450 = extractelement <2 x bfloat> %442, i64 1
  %451 = extractelement <2 x bfloat> %444, i64 0
  %452 = extractelement <2 x bfloat> %444, i64 1
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #9
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #9
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #9
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #9
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #9
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #9
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #9
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #9
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #9
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #9
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #9
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #9
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #9
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #9
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #9
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #9
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
  %486 = fmul float %418, %470
  %487 = fmul float %419, %471
  %488 = fmul float %420, %472
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #9
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #9
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #9
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #9
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #9
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #9
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #9
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #9
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #9
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #9
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #9
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #9
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #9
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #9
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #9
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #9
  %505 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %506 = getelementptr bfloat, ptr addrspace(1) %505, i64 %13
  %507 = getelementptr i8, ptr addrspace(1) %506, i64 1024
  %508 = insertelement <2 x bfloat> poison, bfloat %489, i64 0
  %509 = insertelement <2 x bfloat> %508, bfloat %490, i64 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> poison, bfloat %491, i64 0
  %512 = insertelement <2 x bfloat> %511, bfloat %492, i64 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> poison, bfloat %493, i64 0
  %515 = insertelement <2 x bfloat> %514, bfloat %494, i64 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> poison, bfloat %495, i64 0
  %518 = insertelement <2 x bfloat> %517, bfloat %496, i64 1
  %519 = bitcast <2 x bfloat> %518 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #9
  %520 = insertelement <2 x bfloat> poison, bfloat %497, i64 0
  %521 = insertelement <2 x bfloat> %520, bfloat %498, i64 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> poison, bfloat %499, i64 0
  %524 = insertelement <2 x bfloat> %523, bfloat %500, i64 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> poison, bfloat %501, i64 0
  %527 = insertelement <2 x bfloat> %526, bfloat %502, i64 1
  %528 = bitcast <2 x bfloat> %527 to i32
  %529 = insertelement <2 x bfloat> poison, bfloat %503, i64 0
  %530 = insertelement <2 x bfloat> %529, bfloat %504, i64 1
  %531 = bitcast <2 x bfloat> %530 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #9
  ret void
}

define ptx_kernel void @fusion_354(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 38912
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 38912
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 40960
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 40960
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 43008
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 43008
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = getelementptr float, ptr addrspace(1) %arg49, i64 %68
  %337 = getelementptr float, ptr addrspace(1) %336, i64 %13
  %338 = getelementptr i8, ptr addrspace(1) %337, i64 16
  %339 = getelementptr i8, ptr addrspace(1) %337, i64 2048
  %340 = getelementptr i8, ptr addrspace(1) %337, i64 2064
  %341 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #9
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = extractvalue { i32, i32, i32, i32 } %341, 1
  %344 = extractvalue { i32, i32, i32, i32 } %341, 2
  %345 = extractvalue { i32, i32, i32, i32 } %341, 3
  %346 = bitcast i32 %342 to float
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #9
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = bitcast i32 %351 to float
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #9
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = bitcast i32 %360 to float
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #9
  %369 = extractvalue { i32, i32, i32, i32 } %368, 0
  %370 = extractvalue { i32, i32, i32, i32 } %368, 1
  %371 = extractvalue { i32, i32, i32, i32 } %368, 2
  %372 = extractvalue { i32, i32, i32, i32 } %368, 3
  %373 = bitcast i32 %369 to float
  %374 = bitcast i32 %370 to float
  %375 = bitcast i32 %371 to float
  %376 = bitcast i32 %372 to float
  %377 = fadd float %320, %346
  %378 = fadd float %321, %347
  %379 = fadd float %322, %348
  %380 = fadd float %323, %349
  %381 = fadd float %324, %355
  %382 = fadd float %325, %356
  %383 = fadd float %326, %357
  %384 = fadd float %327, %358
  %385 = fadd float %328, %364
  %386 = fadd float %329, %365
  %387 = fadd float %330, %366
  %388 = fadd float %331, %367
  %389 = fadd float %332, %373
  %390 = fadd float %333, %374
  %391 = fadd float %334, %375
  %392 = fadd float %335, %376
  %393 = fadd float %267, %377
  %394 = fadd float %268, %378
  %395 = fadd float %269, %379
  %396 = fadd float %270, %380
  %397 = fadd float %271, %381
  %398 = fadd float %272, %382
  %399 = fadd float %273, %383
  %400 = fadd float %274, %384
  %401 = fadd float %275, %385
  %402 = fadd float %276, %386
  %403 = fadd float %277, %387
  %404 = fadd float %278, %388
  %405 = fadd float %279, %389
  %406 = fadd float %280, %390
  %407 = fadd float %281, %391
  %408 = fadd float %282, %392
  %409 = fadd float %213, %393
  %410 = fadd float %214, %394
  %411 = fadd float %215, %395
  %412 = fadd float %216, %396
  %413 = fadd float %217, %397
  %414 = fadd float %218, %398
  %415 = fadd float %219, %399
  %416 = fadd float %220, %400
  %417 = fadd float %221, %401
  %418 = fadd float %222, %402
  %419 = fadd float %223, %403
  %420 = fadd float %224, %404
  %421 = fadd float %225, %405
  %422 = fadd float %226, %406
  %423 = fadd float %227, %407
  %424 = fadd float %228, %408
  %425 = fadd float %160, %409
  %426 = fadd float %161, %410
  %427 = fadd float %162, %411
  %428 = fadd float %163, %412
  %429 = fadd float %164, %413
  %430 = fadd float %165, %414
  %431 = fadd float %166, %415
  %432 = fadd float %167, %416
  %433 = fadd float %168, %417
  %434 = fadd float %169, %418
  %435 = fadd float %170, %419
  %436 = fadd float %171, %420
  %437 = fadd float %172, %421
  %438 = fadd float %173, %422
  %439 = fadd float %174, %423
  %440 = fadd float %175, %424
  %441 = fadd float %106, %425
  %442 = fadd float %107, %426
  %443 = fadd float %108, %427
  %444 = fadd float %109, %428
  %445 = fadd float %110, %429
  %446 = fadd float %111, %430
  %447 = fadd float %112, %431
  %448 = fadd float %113, %432
  %449 = fadd float %114, %433
  %450 = fadd float %115, %434
  %451 = fadd float %116, %435
  %452 = fadd float %117, %436
  %453 = fadd float %118, %437
  %454 = fadd float %119, %438
  %455 = fadd float %120, %439
  %456 = fadd float %121, %440
  %457 = fadd float %52, %441
  %458 = fadd float %53, %442
  %459 = fadd float %54, %443
  %460 = fadd float %55, %444
  %461 = fadd float %56, %445
  %462 = fadd float %57, %446
  %463 = fadd float %58, %447
  %464 = fadd float %59, %448
  %465 = fadd float %60, %449
  %466 = fadd float %61, %450
  %467 = fadd float %62, %451
  %468 = fadd float %63, %452
  %469 = fadd float %64, %453
  %470 = fadd float %65, %454
  %471 = fadd float %66, %455
  %472 = fadd float %67, %456
  %473 = fmul float %457, %457
  %474 = fmul float %458, %458
  %475 = fmul float %459, %459
  %476 = fmul float %460, %460
  %477 = fmul float %461, %461
  %478 = fmul float %462, %462
  %479 = fmul float %463, %463
  %480 = fmul float %464, %464
  %481 = fmul float %465, %465
  %482 = fmul float %466, %466
  %483 = fmul float %467, %467
  %484 = fmul float %468, %468
  %485 = fmul float %469, %469
  %486 = fmul float %470, %470
  %487 = fmul float %471, %471
  %488 = fmul float %472, %472
  %489 = fadd float %473, %474
  %490 = fadd float %475, %489
  %491 = fadd float %476, %490
  %492 = fadd float %477, %491
  %493 = fadd float %478, %492
  %494 = fadd float %479, %493
  %495 = fadd float %480, %494
  %496 = fadd float %481, %495
  %497 = fadd float %482, %496
  %498 = fadd float %483, %497
  %499 = fadd float %484, %498
  %500 = fadd float %485, %499
  %501 = fadd float %486, %500
  %502 = fadd float %487, %501
  %503 = fadd float %488, %502
  %504 = bitcast float %503 to i32
  %505 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %504, i32 16, i32 31)
  %506 = bitcast i32 %505 to float
  %507 = fadd float %503, %506
  %508 = bitcast float %507 to i32
  %509 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %508, i32 8, i32 31)
  %510 = bitcast i32 %509 to float
  %511 = fadd float %507, %510
  %512 = bitcast float %511 to i32
  %513 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %512, i32 4, i32 31)
  %514 = bitcast i32 %513 to float
  %515 = fadd float %511, %514
  %516 = bitcast float %515 to i32
  %517 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %516, i32 2, i32 31)
  %518 = bitcast i32 %517 to float
  %519 = fadd float %515, %518
  %520 = bitcast float %519 to i32
  %521 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %520, i32 1, i32 31)
  %522 = bitcast i32 %521 to float
  %523 = fadd float %519, %522
  %524 = icmp eq i32 %6, 0
  %525 = zext nneg i32 %7 to i64
  %526 = getelementptr float, ptr addrspace(3) @global_smem, i64 %525
  %527 = bitcast float %523 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %526, <1 x i32> %527, i1 %524) #9
  tail call void @llvm.nvvm.barrier0()
  %528 = icmp samesign ult i32 %5, 2
  %529 = zext nneg i32 %5 to i64
  %530 = getelementptr float, ptr addrspace(3) @global_smem, i64 %529
  %531 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %530, i1 %528) #9
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 1, i32 31)
  %534 = bitcast i32 %533 to float
  %535 = fadd float %532, %534
  %536 = icmp eq i32 %5, 0
  %537 = bitcast float %535 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %530, <1 x i32> %537, i1 %536) #9
  tail call void @llvm.nvvm.barrier0()
  %538 = load float, ptr addrspace(3) @global_smem, align 16
  %539 = fmul float %538, 0x3F50000000000000
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %541 = bitcast i32 %540 to float
  %542 = fadd float %539, %541
  %543 = tail call float @llvm.nvvm.rsqrt.approx.f(float %542)
  %544 = fmul float %457, %543
  %545 = fmul float %458, %543
  %546 = fmul float %459, %543
  %547 = fmul float %460, %543
  %548 = fmul float %461, %543
  %549 = fmul float %462, %543
  %550 = fmul float %463, %543
  %551 = fmul float %464, %543
  %552 = fmul float %465, %543
  %553 = fmul float %466, %543
  %554 = fmul float %467, %543
  %555 = fmul float %468, %543
  %556 = fmul float %469, %543
  %557 = fmul float %470, %543
  %558 = fmul float %471, %543
  %559 = fmul float %472, %543
  %560 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %561 = getelementptr i8, ptr addrspace(1) %560, i64 1024
  %562 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560) #9
  %563 = extractvalue { i32, i32, i32, i32 } %562, 0
  %564 = bitcast i32 %563 to <2 x bfloat>
  %565 = extractvalue { i32, i32, i32, i32 } %562, 1
  %566 = bitcast i32 %565 to <2 x bfloat>
  %567 = extractvalue { i32, i32, i32, i32 } %562, 2
  %568 = bitcast i32 %567 to <2 x bfloat>
  %569 = extractvalue { i32, i32, i32, i32 } %562, 3
  %570 = bitcast i32 %569 to <2 x bfloat>
  %571 = extractelement <2 x bfloat> %564, i64 0
  %572 = extractelement <2 x bfloat> %564, i64 1
  %573 = extractelement <2 x bfloat> %566, i64 0
  %574 = extractelement <2 x bfloat> %566, i64 1
  %575 = extractelement <2 x bfloat> %568, i64 0
  %576 = extractelement <2 x bfloat> %568, i64 1
  %577 = extractelement <2 x bfloat> %570, i64 0
  %578 = extractelement <2 x bfloat> %570, i64 1
  %579 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #9
  %580 = extractvalue { i32, i32, i32, i32 } %579, 0
  %581 = bitcast i32 %580 to <2 x bfloat>
  %582 = extractvalue { i32, i32, i32, i32 } %579, 1
  %583 = bitcast i32 %582 to <2 x bfloat>
  %584 = extractvalue { i32, i32, i32, i32 } %579, 2
  %585 = bitcast i32 %584 to <2 x bfloat>
  %586 = extractvalue { i32, i32, i32, i32 } %579, 3
  %587 = bitcast i32 %586 to <2 x bfloat>
  %588 = extractelement <2 x bfloat> %581, i64 0
  %589 = extractelement <2 x bfloat> %581, i64 1
  %590 = extractelement <2 x bfloat> %583, i64 0
  %591 = extractelement <2 x bfloat> %583, i64 1
  %592 = extractelement <2 x bfloat> %585, i64 0
  %593 = extractelement <2 x bfloat> %585, i64 1
  %594 = extractelement <2 x bfloat> %587, i64 0
  %595 = extractelement <2 x bfloat> %587, i64 1
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571) #9
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #9
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #9
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #9
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #9
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #9
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #9
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #9
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588) #9
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #9
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #9
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #9
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #9
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #9
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #9
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #9
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
  %627 = fmul float %559, %611
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612) #9
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613) #9
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614) #9
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615) #9
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616) #9
  %633 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617) #9
  %634 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618) #9
  %635 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619) #9
  %636 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620) #9
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #9
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #9
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #9
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #9
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #9
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #9
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #9
  %644 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %645 = getelementptr bfloat, ptr addrspace(1) %644, i64 %13
  %646 = getelementptr i8, ptr addrspace(1) %645, i64 1024
  %647 = insertelement <2 x bfloat> poison, bfloat %628, i64 0
  %648 = insertelement <2 x bfloat> %647, bfloat %629, i64 1
  %649 = bitcast <2 x bfloat> %648 to i32
  %650 = insertelement <2 x bfloat> poison, bfloat %630, i64 0
  %651 = insertelement <2 x bfloat> %650, bfloat %631, i64 1
  %652 = bitcast <2 x bfloat> %651 to i32
  %653 = insertelement <2 x bfloat> poison, bfloat %632, i64 0
  %654 = insertelement <2 x bfloat> %653, bfloat %633, i64 1
  %655 = bitcast <2 x bfloat> %654 to i32
  %656 = insertelement <2 x bfloat> poison, bfloat %634, i64 0
  %657 = insertelement <2 x bfloat> %656, bfloat %635, i64 1
  %658 = bitcast <2 x bfloat> %657 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %649, i32 %652, i32 %655, i32 %658, ptr addrspace(1) %645) #9
  %659 = insertelement <2 x bfloat> poison, bfloat %636, i64 0
  %660 = insertelement <2 x bfloat> %659, bfloat %637, i64 1
  %661 = bitcast <2 x bfloat> %660 to i32
  %662 = insertelement <2 x bfloat> poison, bfloat %638, i64 0
  %663 = insertelement <2 x bfloat> %662, bfloat %639, i64 1
  %664 = bitcast <2 x bfloat> %663 to i32
  %665 = insertelement <2 x bfloat> poison, bfloat %640, i64 0
  %666 = insertelement <2 x bfloat> %665, bfloat %641, i64 1
  %667 = bitcast <2 x bfloat> %666 to i32
  %668 = insertelement <2 x bfloat> poison, bfloat %642, i64 0
  %669 = insertelement <2 x bfloat> %668, bfloat %643, i64 1
  %670 = bitcast <2 x bfloat> %669 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %661, i32 %664, i32 %667, i32 %670, ptr addrspace(1) %646) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_1(ptr noalias readonly align 128 captures(none) dereferenceable(917504) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias align 128 captures(none) dereferenceable(65536) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !5
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5
  %28 = mul nuw nsw i32 %15, 28672
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 43008
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !5, !alias.scope !32
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !5
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 40960
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !5, !alias.scope !35
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !5
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 38912
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !5, !alias.scope !38
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 36864
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !5, !alias.scope !41
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_350(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 34816
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 34816
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #9
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #9
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #9
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %282 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
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
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
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
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #9
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #9
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #9
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #9
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #9
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #9
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #9
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #9
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #9
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #9
  ret void
}

define ptx_kernel void @fusion_348(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 32768
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 32768
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 34816
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 34816
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #9
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = extractvalue { i32, i32, i32, i32 } %261, 1
  %264 = extractvalue { i32, i32, i32, i32 } %261, 2
  %265 = extractvalue { i32, i32, i32, i32 } %261, 3
  %266 = bitcast i32 %262 to float
  %267 = bitcast i32 %263 to float
  %268 = bitcast i32 %264 to float
  %269 = bitcast i32 %265 to float
  %270 = fadd float %213, %239
  %271 = fadd float %214, %240
  %272 = fadd float %215, %241
  %273 = fadd float %216, %242
  %274 = fadd float %217, %248
  %275 = fadd float %218, %249
  %276 = fadd float %219, %250
  %277 = fadd float %220, %251
  %278 = fadd float %221, %257
  %279 = fadd float %222, %258
  %280 = fadd float %223, %259
  %281 = fadd float %224, %260
  %282 = fadd float %225, %266
  %283 = fadd float %226, %267
  %284 = fadd float %227, %268
  %285 = fadd float %228, %269
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
  %299 = fadd float %173, %283
  %300 = fadd float %174, %284
  %301 = fadd float %175, %285
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
  %315 = fadd float %119, %299
  %316 = fadd float %120, %300
  %317 = fadd float %121, %301
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
  %331 = fadd float %65, %315
  %332 = fadd float %66, %316
  %333 = fadd float %67, %317
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
  %347 = fmul float %331, %331
  %348 = fmul float %332, %332
  %349 = fmul float %333, %333
  %350 = fadd float %334, %335
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
  %362 = fadd float %347, %361
  %363 = fadd float %348, %362
  %364 = fadd float %349, %363
  %365 = bitcast float %364 to i32
  %366 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %365, i32 16, i32 31)
  %367 = bitcast i32 %366 to float
  %368 = fadd float %364, %367
  %369 = bitcast float %368 to i32
  %370 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %369, i32 8, i32 31)
  %371 = bitcast i32 %370 to float
  %372 = fadd float %368, %371
  %373 = bitcast float %372 to i32
  %374 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %373, i32 4, i32 31)
  %375 = bitcast i32 %374 to float
  %376 = fadd float %372, %375
  %377 = bitcast float %376 to i32
  %378 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %377, i32 2, i32 31)
  %379 = bitcast i32 %378 to float
  %380 = fadd float %376, %379
  %381 = bitcast float %380 to i32
  %382 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %381, i32 1, i32 31)
  %383 = bitcast i32 %382 to float
  %384 = fadd float %380, %383
  %385 = icmp eq i32 %6, 0
  %386 = zext nneg i32 %7 to i64
  %387 = getelementptr float, ptr addrspace(3) @global_smem, i64 %386
  %388 = bitcast float %384 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #9
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #9
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #9
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %402 = bitcast i32 %401 to float
  %403 = fadd float %400, %402
  %404 = tail call float @llvm.nvvm.rsqrt.approx.f(float %403)
  %405 = fmul float %318, %404
  %406 = fmul float %319, %404
  %407 = fmul float %320, %404
  %408 = fmul float %321, %404
  %409 = fmul float %322, %404
  %410 = fmul float %323, %404
  %411 = fmul float %324, %404
  %412 = fmul float %325, %404
  %413 = fmul float %326, %404
  %414 = fmul float %327, %404
  %415 = fmul float %328, %404
  %416 = fmul float %329, %404
  %417 = fmul float %330, %404
  %418 = fmul float %331, %404
  %419 = fmul float %332, %404
  %420 = fmul float %333, %404
  %421 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %422 = getelementptr i8, ptr addrspace(1) %421, i64 1024
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #9
  %424 = extractvalue { i32, i32, i32, i32 } %423, 0
  %425 = bitcast i32 %424 to <2 x bfloat>
  %426 = extractvalue { i32, i32, i32, i32 } %423, 1
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = extractvalue { i32, i32, i32, i32 } %423, 2
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractvalue { i32, i32, i32, i32 } %423, 3
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractelement <2 x bfloat> %425, i64 0
  %433 = extractelement <2 x bfloat> %425, i64 1
  %434 = extractelement <2 x bfloat> %427, i64 0
  %435 = extractelement <2 x bfloat> %427, i64 1
  %436 = extractelement <2 x bfloat> %429, i64 0
  %437 = extractelement <2 x bfloat> %429, i64 1
  %438 = extractelement <2 x bfloat> %431, i64 0
  %439 = extractelement <2 x bfloat> %431, i64 1
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #9
  %441 = extractvalue { i32, i32, i32, i32 } %440, 0
  %442 = bitcast i32 %441 to <2 x bfloat>
  %443 = extractvalue { i32, i32, i32, i32 } %440, 1
  %444 = bitcast i32 %443 to <2 x bfloat>
  %445 = extractvalue { i32, i32, i32, i32 } %440, 2
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %440, 3
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractelement <2 x bfloat> %442, i64 0
  %450 = extractelement <2 x bfloat> %442, i64 1
  %451 = extractelement <2 x bfloat> %444, i64 0
  %452 = extractelement <2 x bfloat> %444, i64 1
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #9
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #9
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #9
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #9
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #9
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #9
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #9
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #9
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #9
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #9
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #9
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #9
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #9
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #9
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #9
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #9
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
  %486 = fmul float %418, %470
  %487 = fmul float %419, %471
  %488 = fmul float %420, %472
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #9
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #9
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #9
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #9
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #9
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #9
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #9
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #9
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #9
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #9
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #9
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #9
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #9
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #9
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #9
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #9
  %505 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %506 = getelementptr bfloat, ptr addrspace(1) %505, i64 %13
  %507 = getelementptr i8, ptr addrspace(1) %506, i64 1024
  %508 = insertelement <2 x bfloat> poison, bfloat %489, i64 0
  %509 = insertelement <2 x bfloat> %508, bfloat %490, i64 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> poison, bfloat %491, i64 0
  %512 = insertelement <2 x bfloat> %511, bfloat %492, i64 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> poison, bfloat %493, i64 0
  %515 = insertelement <2 x bfloat> %514, bfloat %494, i64 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> poison, bfloat %495, i64 0
  %518 = insertelement <2 x bfloat> %517, bfloat %496, i64 1
  %519 = bitcast <2 x bfloat> %518 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #9
  %520 = insertelement <2 x bfloat> poison, bfloat %497, i64 0
  %521 = insertelement <2 x bfloat> %520, bfloat %498, i64 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> poison, bfloat %499, i64 0
  %524 = insertelement <2 x bfloat> %523, bfloat %500, i64 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> poison, bfloat %501, i64 0
  %527 = insertelement <2 x bfloat> %526, bfloat %502, i64 1
  %528 = bitcast <2 x bfloat> %527 to i32
  %529 = insertelement <2 x bfloat> poison, bfloat %503, i64 0
  %530 = insertelement <2 x bfloat> %529, bfloat %504, i64 1
  %531 = bitcast <2 x bfloat> %530 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #9
  ret void
}

define ptx_kernel void @fusion_346(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 30720
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 30720
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 32768
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 32768
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 34816
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 34816
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = getelementptr float, ptr addrspace(1) %arg49, i64 %68
  %337 = getelementptr float, ptr addrspace(1) %336, i64 %13
  %338 = getelementptr i8, ptr addrspace(1) %337, i64 16
  %339 = getelementptr i8, ptr addrspace(1) %337, i64 2048
  %340 = getelementptr i8, ptr addrspace(1) %337, i64 2064
  %341 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #9
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = extractvalue { i32, i32, i32, i32 } %341, 1
  %344 = extractvalue { i32, i32, i32, i32 } %341, 2
  %345 = extractvalue { i32, i32, i32, i32 } %341, 3
  %346 = bitcast i32 %342 to float
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #9
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = bitcast i32 %351 to float
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #9
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = bitcast i32 %360 to float
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #9
  %369 = extractvalue { i32, i32, i32, i32 } %368, 0
  %370 = extractvalue { i32, i32, i32, i32 } %368, 1
  %371 = extractvalue { i32, i32, i32, i32 } %368, 2
  %372 = extractvalue { i32, i32, i32, i32 } %368, 3
  %373 = bitcast i32 %369 to float
  %374 = bitcast i32 %370 to float
  %375 = bitcast i32 %371 to float
  %376 = bitcast i32 %372 to float
  %377 = fadd float %320, %346
  %378 = fadd float %321, %347
  %379 = fadd float %322, %348
  %380 = fadd float %323, %349
  %381 = fadd float %324, %355
  %382 = fadd float %325, %356
  %383 = fadd float %326, %357
  %384 = fadd float %327, %358
  %385 = fadd float %328, %364
  %386 = fadd float %329, %365
  %387 = fadd float %330, %366
  %388 = fadd float %331, %367
  %389 = fadd float %332, %373
  %390 = fadd float %333, %374
  %391 = fadd float %334, %375
  %392 = fadd float %335, %376
  %393 = fadd float %267, %377
  %394 = fadd float %268, %378
  %395 = fadd float %269, %379
  %396 = fadd float %270, %380
  %397 = fadd float %271, %381
  %398 = fadd float %272, %382
  %399 = fadd float %273, %383
  %400 = fadd float %274, %384
  %401 = fadd float %275, %385
  %402 = fadd float %276, %386
  %403 = fadd float %277, %387
  %404 = fadd float %278, %388
  %405 = fadd float %279, %389
  %406 = fadd float %280, %390
  %407 = fadd float %281, %391
  %408 = fadd float %282, %392
  %409 = fadd float %213, %393
  %410 = fadd float %214, %394
  %411 = fadd float %215, %395
  %412 = fadd float %216, %396
  %413 = fadd float %217, %397
  %414 = fadd float %218, %398
  %415 = fadd float %219, %399
  %416 = fadd float %220, %400
  %417 = fadd float %221, %401
  %418 = fadd float %222, %402
  %419 = fadd float %223, %403
  %420 = fadd float %224, %404
  %421 = fadd float %225, %405
  %422 = fadd float %226, %406
  %423 = fadd float %227, %407
  %424 = fadd float %228, %408
  %425 = fadd float %160, %409
  %426 = fadd float %161, %410
  %427 = fadd float %162, %411
  %428 = fadd float %163, %412
  %429 = fadd float %164, %413
  %430 = fadd float %165, %414
  %431 = fadd float %166, %415
  %432 = fadd float %167, %416
  %433 = fadd float %168, %417
  %434 = fadd float %169, %418
  %435 = fadd float %170, %419
  %436 = fadd float %171, %420
  %437 = fadd float %172, %421
  %438 = fadd float %173, %422
  %439 = fadd float %174, %423
  %440 = fadd float %175, %424
  %441 = fadd float %106, %425
  %442 = fadd float %107, %426
  %443 = fadd float %108, %427
  %444 = fadd float %109, %428
  %445 = fadd float %110, %429
  %446 = fadd float %111, %430
  %447 = fadd float %112, %431
  %448 = fadd float %113, %432
  %449 = fadd float %114, %433
  %450 = fadd float %115, %434
  %451 = fadd float %116, %435
  %452 = fadd float %117, %436
  %453 = fadd float %118, %437
  %454 = fadd float %119, %438
  %455 = fadd float %120, %439
  %456 = fadd float %121, %440
  %457 = fadd float %52, %441
  %458 = fadd float %53, %442
  %459 = fadd float %54, %443
  %460 = fadd float %55, %444
  %461 = fadd float %56, %445
  %462 = fadd float %57, %446
  %463 = fadd float %58, %447
  %464 = fadd float %59, %448
  %465 = fadd float %60, %449
  %466 = fadd float %61, %450
  %467 = fadd float %62, %451
  %468 = fadd float %63, %452
  %469 = fadd float %64, %453
  %470 = fadd float %65, %454
  %471 = fadd float %66, %455
  %472 = fadd float %67, %456
  %473 = fmul float %457, %457
  %474 = fmul float %458, %458
  %475 = fmul float %459, %459
  %476 = fmul float %460, %460
  %477 = fmul float %461, %461
  %478 = fmul float %462, %462
  %479 = fmul float %463, %463
  %480 = fmul float %464, %464
  %481 = fmul float %465, %465
  %482 = fmul float %466, %466
  %483 = fmul float %467, %467
  %484 = fmul float %468, %468
  %485 = fmul float %469, %469
  %486 = fmul float %470, %470
  %487 = fmul float %471, %471
  %488 = fmul float %472, %472
  %489 = fadd float %473, %474
  %490 = fadd float %475, %489
  %491 = fadd float %476, %490
  %492 = fadd float %477, %491
  %493 = fadd float %478, %492
  %494 = fadd float %479, %493
  %495 = fadd float %480, %494
  %496 = fadd float %481, %495
  %497 = fadd float %482, %496
  %498 = fadd float %483, %497
  %499 = fadd float %484, %498
  %500 = fadd float %485, %499
  %501 = fadd float %486, %500
  %502 = fadd float %487, %501
  %503 = fadd float %488, %502
  %504 = bitcast float %503 to i32
  %505 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %504, i32 16, i32 31)
  %506 = bitcast i32 %505 to float
  %507 = fadd float %503, %506
  %508 = bitcast float %507 to i32
  %509 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %508, i32 8, i32 31)
  %510 = bitcast i32 %509 to float
  %511 = fadd float %507, %510
  %512 = bitcast float %511 to i32
  %513 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %512, i32 4, i32 31)
  %514 = bitcast i32 %513 to float
  %515 = fadd float %511, %514
  %516 = bitcast float %515 to i32
  %517 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %516, i32 2, i32 31)
  %518 = bitcast i32 %517 to float
  %519 = fadd float %515, %518
  %520 = bitcast float %519 to i32
  %521 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %520, i32 1, i32 31)
  %522 = bitcast i32 %521 to float
  %523 = fadd float %519, %522
  %524 = icmp eq i32 %6, 0
  %525 = zext nneg i32 %7 to i64
  %526 = getelementptr float, ptr addrspace(3) @global_smem, i64 %525
  %527 = bitcast float %523 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %526, <1 x i32> %527, i1 %524) #9
  tail call void @llvm.nvvm.barrier0()
  %528 = icmp samesign ult i32 %5, 2
  %529 = zext nneg i32 %5 to i64
  %530 = getelementptr float, ptr addrspace(3) @global_smem, i64 %529
  %531 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %530, i1 %528) #9
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 1, i32 31)
  %534 = bitcast i32 %533 to float
  %535 = fadd float %532, %534
  %536 = icmp eq i32 %5, 0
  %537 = bitcast float %535 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %530, <1 x i32> %537, i1 %536) #9
  tail call void @llvm.nvvm.barrier0()
  %538 = load float, ptr addrspace(3) @global_smem, align 16
  %539 = fmul float %538, 0x3F50000000000000
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %541 = bitcast i32 %540 to float
  %542 = fadd float %539, %541
  %543 = tail call float @llvm.nvvm.rsqrt.approx.f(float %542)
  %544 = fmul float %457, %543
  %545 = fmul float %458, %543
  %546 = fmul float %459, %543
  %547 = fmul float %460, %543
  %548 = fmul float %461, %543
  %549 = fmul float %462, %543
  %550 = fmul float %463, %543
  %551 = fmul float %464, %543
  %552 = fmul float %465, %543
  %553 = fmul float %466, %543
  %554 = fmul float %467, %543
  %555 = fmul float %468, %543
  %556 = fmul float %469, %543
  %557 = fmul float %470, %543
  %558 = fmul float %471, %543
  %559 = fmul float %472, %543
  %560 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %561 = getelementptr i8, ptr addrspace(1) %560, i64 1024
  %562 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560) #9
  %563 = extractvalue { i32, i32, i32, i32 } %562, 0
  %564 = bitcast i32 %563 to <2 x bfloat>
  %565 = extractvalue { i32, i32, i32, i32 } %562, 1
  %566 = bitcast i32 %565 to <2 x bfloat>
  %567 = extractvalue { i32, i32, i32, i32 } %562, 2
  %568 = bitcast i32 %567 to <2 x bfloat>
  %569 = extractvalue { i32, i32, i32, i32 } %562, 3
  %570 = bitcast i32 %569 to <2 x bfloat>
  %571 = extractelement <2 x bfloat> %564, i64 0
  %572 = extractelement <2 x bfloat> %564, i64 1
  %573 = extractelement <2 x bfloat> %566, i64 0
  %574 = extractelement <2 x bfloat> %566, i64 1
  %575 = extractelement <2 x bfloat> %568, i64 0
  %576 = extractelement <2 x bfloat> %568, i64 1
  %577 = extractelement <2 x bfloat> %570, i64 0
  %578 = extractelement <2 x bfloat> %570, i64 1
  %579 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #9
  %580 = extractvalue { i32, i32, i32, i32 } %579, 0
  %581 = bitcast i32 %580 to <2 x bfloat>
  %582 = extractvalue { i32, i32, i32, i32 } %579, 1
  %583 = bitcast i32 %582 to <2 x bfloat>
  %584 = extractvalue { i32, i32, i32, i32 } %579, 2
  %585 = bitcast i32 %584 to <2 x bfloat>
  %586 = extractvalue { i32, i32, i32, i32 } %579, 3
  %587 = bitcast i32 %586 to <2 x bfloat>
  %588 = extractelement <2 x bfloat> %581, i64 0
  %589 = extractelement <2 x bfloat> %581, i64 1
  %590 = extractelement <2 x bfloat> %583, i64 0
  %591 = extractelement <2 x bfloat> %583, i64 1
  %592 = extractelement <2 x bfloat> %585, i64 0
  %593 = extractelement <2 x bfloat> %585, i64 1
  %594 = extractelement <2 x bfloat> %587, i64 0
  %595 = extractelement <2 x bfloat> %587, i64 1
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571) #9
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #9
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #9
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #9
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #9
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #9
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #9
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #9
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588) #9
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #9
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #9
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #9
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #9
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #9
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #9
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #9
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
  %627 = fmul float %559, %611
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612) #9
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613) #9
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614) #9
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615) #9
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616) #9
  %633 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617) #9
  %634 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618) #9
  %635 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619) #9
  %636 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620) #9
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #9
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #9
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #9
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #9
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #9
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #9
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #9
  %644 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %645 = getelementptr bfloat, ptr addrspace(1) %644, i64 %13
  %646 = getelementptr i8, ptr addrspace(1) %645, i64 1024
  %647 = insertelement <2 x bfloat> poison, bfloat %628, i64 0
  %648 = insertelement <2 x bfloat> %647, bfloat %629, i64 1
  %649 = bitcast <2 x bfloat> %648 to i32
  %650 = insertelement <2 x bfloat> poison, bfloat %630, i64 0
  %651 = insertelement <2 x bfloat> %650, bfloat %631, i64 1
  %652 = bitcast <2 x bfloat> %651 to i32
  %653 = insertelement <2 x bfloat> poison, bfloat %632, i64 0
  %654 = insertelement <2 x bfloat> %653, bfloat %633, i64 1
  %655 = bitcast <2 x bfloat> %654 to i32
  %656 = insertelement <2 x bfloat> poison, bfloat %634, i64 0
  %657 = insertelement <2 x bfloat> %656, bfloat %635, i64 1
  %658 = bitcast <2 x bfloat> %657 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %649, i32 %652, i32 %655, i32 %658, ptr addrspace(1) %645) #9
  %659 = insertelement <2 x bfloat> poison, bfloat %636, i64 0
  %660 = insertelement <2 x bfloat> %659, bfloat %637, i64 1
  %661 = bitcast <2 x bfloat> %660 to i32
  %662 = insertelement <2 x bfloat> poison, bfloat %638, i64 0
  %663 = insertelement <2 x bfloat> %662, bfloat %639, i64 1
  %664 = bitcast <2 x bfloat> %663 to i32
  %665 = insertelement <2 x bfloat> poison, bfloat %640, i64 0
  %666 = insertelement <2 x bfloat> %665, bfloat %641, i64 1
  %667 = bitcast <2 x bfloat> %666 to i32
  %668 = insertelement <2 x bfloat> poison, bfloat %642, i64 0
  %669 = insertelement <2 x bfloat> %668, bfloat %643, i64 1
  %670 = bitcast <2 x bfloat> %669 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %661, i32 %664, i32 %667, i32 %670, ptr addrspace(1) %646) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_2(ptr noalias readonly align 128 captures(none) dereferenceable(917504) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias align 128 captures(none) dereferenceable(65536) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !5
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5
  %28 = mul nuw nsw i32 %15, 28672
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 34816
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !5, !alias.scope !44
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !5
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 32768
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !5, !alias.scope !47
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !5
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 30720
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !5, !alias.scope !50
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 28672
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !5, !alias.scope !53
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_342(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 26624
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 26624
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #9
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #9
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #9
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %282 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
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
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
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
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #9
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #9
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #9
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #9
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #9
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #9
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #9
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #9
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #9
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #9
  ret void
}

define ptx_kernel void @fusion_340(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 24576
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 24576
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 26624
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 26624
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #9
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = extractvalue { i32, i32, i32, i32 } %261, 1
  %264 = extractvalue { i32, i32, i32, i32 } %261, 2
  %265 = extractvalue { i32, i32, i32, i32 } %261, 3
  %266 = bitcast i32 %262 to float
  %267 = bitcast i32 %263 to float
  %268 = bitcast i32 %264 to float
  %269 = bitcast i32 %265 to float
  %270 = fadd float %213, %239
  %271 = fadd float %214, %240
  %272 = fadd float %215, %241
  %273 = fadd float %216, %242
  %274 = fadd float %217, %248
  %275 = fadd float %218, %249
  %276 = fadd float %219, %250
  %277 = fadd float %220, %251
  %278 = fadd float %221, %257
  %279 = fadd float %222, %258
  %280 = fadd float %223, %259
  %281 = fadd float %224, %260
  %282 = fadd float %225, %266
  %283 = fadd float %226, %267
  %284 = fadd float %227, %268
  %285 = fadd float %228, %269
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
  %299 = fadd float %173, %283
  %300 = fadd float %174, %284
  %301 = fadd float %175, %285
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
  %315 = fadd float %119, %299
  %316 = fadd float %120, %300
  %317 = fadd float %121, %301
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
  %331 = fadd float %65, %315
  %332 = fadd float %66, %316
  %333 = fadd float %67, %317
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
  %347 = fmul float %331, %331
  %348 = fmul float %332, %332
  %349 = fmul float %333, %333
  %350 = fadd float %334, %335
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
  %362 = fadd float %347, %361
  %363 = fadd float %348, %362
  %364 = fadd float %349, %363
  %365 = bitcast float %364 to i32
  %366 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %365, i32 16, i32 31)
  %367 = bitcast i32 %366 to float
  %368 = fadd float %364, %367
  %369 = bitcast float %368 to i32
  %370 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %369, i32 8, i32 31)
  %371 = bitcast i32 %370 to float
  %372 = fadd float %368, %371
  %373 = bitcast float %372 to i32
  %374 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %373, i32 4, i32 31)
  %375 = bitcast i32 %374 to float
  %376 = fadd float %372, %375
  %377 = bitcast float %376 to i32
  %378 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %377, i32 2, i32 31)
  %379 = bitcast i32 %378 to float
  %380 = fadd float %376, %379
  %381 = bitcast float %380 to i32
  %382 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %381, i32 1, i32 31)
  %383 = bitcast i32 %382 to float
  %384 = fadd float %380, %383
  %385 = icmp eq i32 %6, 0
  %386 = zext nneg i32 %7 to i64
  %387 = getelementptr float, ptr addrspace(3) @global_smem, i64 %386
  %388 = bitcast float %384 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #9
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #9
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #9
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %402 = bitcast i32 %401 to float
  %403 = fadd float %400, %402
  %404 = tail call float @llvm.nvvm.rsqrt.approx.f(float %403)
  %405 = fmul float %318, %404
  %406 = fmul float %319, %404
  %407 = fmul float %320, %404
  %408 = fmul float %321, %404
  %409 = fmul float %322, %404
  %410 = fmul float %323, %404
  %411 = fmul float %324, %404
  %412 = fmul float %325, %404
  %413 = fmul float %326, %404
  %414 = fmul float %327, %404
  %415 = fmul float %328, %404
  %416 = fmul float %329, %404
  %417 = fmul float %330, %404
  %418 = fmul float %331, %404
  %419 = fmul float %332, %404
  %420 = fmul float %333, %404
  %421 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %422 = getelementptr i8, ptr addrspace(1) %421, i64 1024
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #9
  %424 = extractvalue { i32, i32, i32, i32 } %423, 0
  %425 = bitcast i32 %424 to <2 x bfloat>
  %426 = extractvalue { i32, i32, i32, i32 } %423, 1
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = extractvalue { i32, i32, i32, i32 } %423, 2
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractvalue { i32, i32, i32, i32 } %423, 3
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractelement <2 x bfloat> %425, i64 0
  %433 = extractelement <2 x bfloat> %425, i64 1
  %434 = extractelement <2 x bfloat> %427, i64 0
  %435 = extractelement <2 x bfloat> %427, i64 1
  %436 = extractelement <2 x bfloat> %429, i64 0
  %437 = extractelement <2 x bfloat> %429, i64 1
  %438 = extractelement <2 x bfloat> %431, i64 0
  %439 = extractelement <2 x bfloat> %431, i64 1
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #9
  %441 = extractvalue { i32, i32, i32, i32 } %440, 0
  %442 = bitcast i32 %441 to <2 x bfloat>
  %443 = extractvalue { i32, i32, i32, i32 } %440, 1
  %444 = bitcast i32 %443 to <2 x bfloat>
  %445 = extractvalue { i32, i32, i32, i32 } %440, 2
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %440, 3
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractelement <2 x bfloat> %442, i64 0
  %450 = extractelement <2 x bfloat> %442, i64 1
  %451 = extractelement <2 x bfloat> %444, i64 0
  %452 = extractelement <2 x bfloat> %444, i64 1
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #9
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #9
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #9
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #9
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #9
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #9
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #9
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #9
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #9
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #9
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #9
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #9
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #9
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #9
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #9
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #9
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
  %486 = fmul float %418, %470
  %487 = fmul float %419, %471
  %488 = fmul float %420, %472
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #9
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #9
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #9
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #9
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #9
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #9
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #9
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #9
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #9
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #9
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #9
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #9
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #9
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #9
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #9
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #9
  %505 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %506 = getelementptr bfloat, ptr addrspace(1) %505, i64 %13
  %507 = getelementptr i8, ptr addrspace(1) %506, i64 1024
  %508 = insertelement <2 x bfloat> poison, bfloat %489, i64 0
  %509 = insertelement <2 x bfloat> %508, bfloat %490, i64 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> poison, bfloat %491, i64 0
  %512 = insertelement <2 x bfloat> %511, bfloat %492, i64 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> poison, bfloat %493, i64 0
  %515 = insertelement <2 x bfloat> %514, bfloat %494, i64 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> poison, bfloat %495, i64 0
  %518 = insertelement <2 x bfloat> %517, bfloat %496, i64 1
  %519 = bitcast <2 x bfloat> %518 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #9
  %520 = insertelement <2 x bfloat> poison, bfloat %497, i64 0
  %521 = insertelement <2 x bfloat> %520, bfloat %498, i64 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> poison, bfloat %499, i64 0
  %524 = insertelement <2 x bfloat> %523, bfloat %500, i64 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> poison, bfloat %501, i64 0
  %527 = insertelement <2 x bfloat> %526, bfloat %502, i64 1
  %528 = bitcast <2 x bfloat> %527 to i32
  %529 = insertelement <2 x bfloat> poison, bfloat %503, i64 0
  %530 = insertelement <2 x bfloat> %529, bfloat %504, i64 1
  %531 = bitcast <2 x bfloat> %530 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #9
  ret void
}

define ptx_kernel void @fusion_338(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 22528
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 22528
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 24576
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 24576
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 26624
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 26624
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = getelementptr float, ptr addrspace(1) %arg49, i64 %68
  %337 = getelementptr float, ptr addrspace(1) %336, i64 %13
  %338 = getelementptr i8, ptr addrspace(1) %337, i64 16
  %339 = getelementptr i8, ptr addrspace(1) %337, i64 2048
  %340 = getelementptr i8, ptr addrspace(1) %337, i64 2064
  %341 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #9
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = extractvalue { i32, i32, i32, i32 } %341, 1
  %344 = extractvalue { i32, i32, i32, i32 } %341, 2
  %345 = extractvalue { i32, i32, i32, i32 } %341, 3
  %346 = bitcast i32 %342 to float
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #9
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = bitcast i32 %351 to float
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #9
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = bitcast i32 %360 to float
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #9
  %369 = extractvalue { i32, i32, i32, i32 } %368, 0
  %370 = extractvalue { i32, i32, i32, i32 } %368, 1
  %371 = extractvalue { i32, i32, i32, i32 } %368, 2
  %372 = extractvalue { i32, i32, i32, i32 } %368, 3
  %373 = bitcast i32 %369 to float
  %374 = bitcast i32 %370 to float
  %375 = bitcast i32 %371 to float
  %376 = bitcast i32 %372 to float
  %377 = fadd float %320, %346
  %378 = fadd float %321, %347
  %379 = fadd float %322, %348
  %380 = fadd float %323, %349
  %381 = fadd float %324, %355
  %382 = fadd float %325, %356
  %383 = fadd float %326, %357
  %384 = fadd float %327, %358
  %385 = fadd float %328, %364
  %386 = fadd float %329, %365
  %387 = fadd float %330, %366
  %388 = fadd float %331, %367
  %389 = fadd float %332, %373
  %390 = fadd float %333, %374
  %391 = fadd float %334, %375
  %392 = fadd float %335, %376
  %393 = fadd float %267, %377
  %394 = fadd float %268, %378
  %395 = fadd float %269, %379
  %396 = fadd float %270, %380
  %397 = fadd float %271, %381
  %398 = fadd float %272, %382
  %399 = fadd float %273, %383
  %400 = fadd float %274, %384
  %401 = fadd float %275, %385
  %402 = fadd float %276, %386
  %403 = fadd float %277, %387
  %404 = fadd float %278, %388
  %405 = fadd float %279, %389
  %406 = fadd float %280, %390
  %407 = fadd float %281, %391
  %408 = fadd float %282, %392
  %409 = fadd float %213, %393
  %410 = fadd float %214, %394
  %411 = fadd float %215, %395
  %412 = fadd float %216, %396
  %413 = fadd float %217, %397
  %414 = fadd float %218, %398
  %415 = fadd float %219, %399
  %416 = fadd float %220, %400
  %417 = fadd float %221, %401
  %418 = fadd float %222, %402
  %419 = fadd float %223, %403
  %420 = fadd float %224, %404
  %421 = fadd float %225, %405
  %422 = fadd float %226, %406
  %423 = fadd float %227, %407
  %424 = fadd float %228, %408
  %425 = fadd float %160, %409
  %426 = fadd float %161, %410
  %427 = fadd float %162, %411
  %428 = fadd float %163, %412
  %429 = fadd float %164, %413
  %430 = fadd float %165, %414
  %431 = fadd float %166, %415
  %432 = fadd float %167, %416
  %433 = fadd float %168, %417
  %434 = fadd float %169, %418
  %435 = fadd float %170, %419
  %436 = fadd float %171, %420
  %437 = fadd float %172, %421
  %438 = fadd float %173, %422
  %439 = fadd float %174, %423
  %440 = fadd float %175, %424
  %441 = fadd float %106, %425
  %442 = fadd float %107, %426
  %443 = fadd float %108, %427
  %444 = fadd float %109, %428
  %445 = fadd float %110, %429
  %446 = fadd float %111, %430
  %447 = fadd float %112, %431
  %448 = fadd float %113, %432
  %449 = fadd float %114, %433
  %450 = fadd float %115, %434
  %451 = fadd float %116, %435
  %452 = fadd float %117, %436
  %453 = fadd float %118, %437
  %454 = fadd float %119, %438
  %455 = fadd float %120, %439
  %456 = fadd float %121, %440
  %457 = fadd float %52, %441
  %458 = fadd float %53, %442
  %459 = fadd float %54, %443
  %460 = fadd float %55, %444
  %461 = fadd float %56, %445
  %462 = fadd float %57, %446
  %463 = fadd float %58, %447
  %464 = fadd float %59, %448
  %465 = fadd float %60, %449
  %466 = fadd float %61, %450
  %467 = fadd float %62, %451
  %468 = fadd float %63, %452
  %469 = fadd float %64, %453
  %470 = fadd float %65, %454
  %471 = fadd float %66, %455
  %472 = fadd float %67, %456
  %473 = fmul float %457, %457
  %474 = fmul float %458, %458
  %475 = fmul float %459, %459
  %476 = fmul float %460, %460
  %477 = fmul float %461, %461
  %478 = fmul float %462, %462
  %479 = fmul float %463, %463
  %480 = fmul float %464, %464
  %481 = fmul float %465, %465
  %482 = fmul float %466, %466
  %483 = fmul float %467, %467
  %484 = fmul float %468, %468
  %485 = fmul float %469, %469
  %486 = fmul float %470, %470
  %487 = fmul float %471, %471
  %488 = fmul float %472, %472
  %489 = fadd float %473, %474
  %490 = fadd float %475, %489
  %491 = fadd float %476, %490
  %492 = fadd float %477, %491
  %493 = fadd float %478, %492
  %494 = fadd float %479, %493
  %495 = fadd float %480, %494
  %496 = fadd float %481, %495
  %497 = fadd float %482, %496
  %498 = fadd float %483, %497
  %499 = fadd float %484, %498
  %500 = fadd float %485, %499
  %501 = fadd float %486, %500
  %502 = fadd float %487, %501
  %503 = fadd float %488, %502
  %504 = bitcast float %503 to i32
  %505 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %504, i32 16, i32 31)
  %506 = bitcast i32 %505 to float
  %507 = fadd float %503, %506
  %508 = bitcast float %507 to i32
  %509 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %508, i32 8, i32 31)
  %510 = bitcast i32 %509 to float
  %511 = fadd float %507, %510
  %512 = bitcast float %511 to i32
  %513 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %512, i32 4, i32 31)
  %514 = bitcast i32 %513 to float
  %515 = fadd float %511, %514
  %516 = bitcast float %515 to i32
  %517 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %516, i32 2, i32 31)
  %518 = bitcast i32 %517 to float
  %519 = fadd float %515, %518
  %520 = bitcast float %519 to i32
  %521 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %520, i32 1, i32 31)
  %522 = bitcast i32 %521 to float
  %523 = fadd float %519, %522
  %524 = icmp eq i32 %6, 0
  %525 = zext nneg i32 %7 to i64
  %526 = getelementptr float, ptr addrspace(3) @global_smem, i64 %525
  %527 = bitcast float %523 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %526, <1 x i32> %527, i1 %524) #9
  tail call void @llvm.nvvm.barrier0()
  %528 = icmp samesign ult i32 %5, 2
  %529 = zext nneg i32 %5 to i64
  %530 = getelementptr float, ptr addrspace(3) @global_smem, i64 %529
  %531 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %530, i1 %528) #9
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 1, i32 31)
  %534 = bitcast i32 %533 to float
  %535 = fadd float %532, %534
  %536 = icmp eq i32 %5, 0
  %537 = bitcast float %535 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %530, <1 x i32> %537, i1 %536) #9
  tail call void @llvm.nvvm.barrier0()
  %538 = load float, ptr addrspace(3) @global_smem, align 16
  %539 = fmul float %538, 0x3F50000000000000
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %541 = bitcast i32 %540 to float
  %542 = fadd float %539, %541
  %543 = tail call float @llvm.nvvm.rsqrt.approx.f(float %542)
  %544 = fmul float %457, %543
  %545 = fmul float %458, %543
  %546 = fmul float %459, %543
  %547 = fmul float %460, %543
  %548 = fmul float %461, %543
  %549 = fmul float %462, %543
  %550 = fmul float %463, %543
  %551 = fmul float %464, %543
  %552 = fmul float %465, %543
  %553 = fmul float %466, %543
  %554 = fmul float %467, %543
  %555 = fmul float %468, %543
  %556 = fmul float %469, %543
  %557 = fmul float %470, %543
  %558 = fmul float %471, %543
  %559 = fmul float %472, %543
  %560 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %561 = getelementptr i8, ptr addrspace(1) %560, i64 1024
  %562 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560) #9
  %563 = extractvalue { i32, i32, i32, i32 } %562, 0
  %564 = bitcast i32 %563 to <2 x bfloat>
  %565 = extractvalue { i32, i32, i32, i32 } %562, 1
  %566 = bitcast i32 %565 to <2 x bfloat>
  %567 = extractvalue { i32, i32, i32, i32 } %562, 2
  %568 = bitcast i32 %567 to <2 x bfloat>
  %569 = extractvalue { i32, i32, i32, i32 } %562, 3
  %570 = bitcast i32 %569 to <2 x bfloat>
  %571 = extractelement <2 x bfloat> %564, i64 0
  %572 = extractelement <2 x bfloat> %564, i64 1
  %573 = extractelement <2 x bfloat> %566, i64 0
  %574 = extractelement <2 x bfloat> %566, i64 1
  %575 = extractelement <2 x bfloat> %568, i64 0
  %576 = extractelement <2 x bfloat> %568, i64 1
  %577 = extractelement <2 x bfloat> %570, i64 0
  %578 = extractelement <2 x bfloat> %570, i64 1
  %579 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #9
  %580 = extractvalue { i32, i32, i32, i32 } %579, 0
  %581 = bitcast i32 %580 to <2 x bfloat>
  %582 = extractvalue { i32, i32, i32, i32 } %579, 1
  %583 = bitcast i32 %582 to <2 x bfloat>
  %584 = extractvalue { i32, i32, i32, i32 } %579, 2
  %585 = bitcast i32 %584 to <2 x bfloat>
  %586 = extractvalue { i32, i32, i32, i32 } %579, 3
  %587 = bitcast i32 %586 to <2 x bfloat>
  %588 = extractelement <2 x bfloat> %581, i64 0
  %589 = extractelement <2 x bfloat> %581, i64 1
  %590 = extractelement <2 x bfloat> %583, i64 0
  %591 = extractelement <2 x bfloat> %583, i64 1
  %592 = extractelement <2 x bfloat> %585, i64 0
  %593 = extractelement <2 x bfloat> %585, i64 1
  %594 = extractelement <2 x bfloat> %587, i64 0
  %595 = extractelement <2 x bfloat> %587, i64 1
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571) #9
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #9
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #9
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #9
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #9
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #9
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #9
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #9
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588) #9
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #9
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #9
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #9
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #9
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #9
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #9
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #9
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
  %627 = fmul float %559, %611
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612) #9
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613) #9
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614) #9
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615) #9
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616) #9
  %633 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617) #9
  %634 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618) #9
  %635 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619) #9
  %636 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620) #9
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #9
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #9
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #9
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #9
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #9
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #9
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #9
  %644 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %645 = getelementptr bfloat, ptr addrspace(1) %644, i64 %13
  %646 = getelementptr i8, ptr addrspace(1) %645, i64 1024
  %647 = insertelement <2 x bfloat> poison, bfloat %628, i64 0
  %648 = insertelement <2 x bfloat> %647, bfloat %629, i64 1
  %649 = bitcast <2 x bfloat> %648 to i32
  %650 = insertelement <2 x bfloat> poison, bfloat %630, i64 0
  %651 = insertelement <2 x bfloat> %650, bfloat %631, i64 1
  %652 = bitcast <2 x bfloat> %651 to i32
  %653 = insertelement <2 x bfloat> poison, bfloat %632, i64 0
  %654 = insertelement <2 x bfloat> %653, bfloat %633, i64 1
  %655 = bitcast <2 x bfloat> %654 to i32
  %656 = insertelement <2 x bfloat> poison, bfloat %634, i64 0
  %657 = insertelement <2 x bfloat> %656, bfloat %635, i64 1
  %658 = bitcast <2 x bfloat> %657 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %649, i32 %652, i32 %655, i32 %658, ptr addrspace(1) %645) #9
  %659 = insertelement <2 x bfloat> poison, bfloat %636, i64 0
  %660 = insertelement <2 x bfloat> %659, bfloat %637, i64 1
  %661 = bitcast <2 x bfloat> %660 to i32
  %662 = insertelement <2 x bfloat> poison, bfloat %638, i64 0
  %663 = insertelement <2 x bfloat> %662, bfloat %639, i64 1
  %664 = bitcast <2 x bfloat> %663 to i32
  %665 = insertelement <2 x bfloat> poison, bfloat %640, i64 0
  %666 = insertelement <2 x bfloat> %665, bfloat %641, i64 1
  %667 = bitcast <2 x bfloat> %666 to i32
  %668 = insertelement <2 x bfloat> poison, bfloat %642, i64 0
  %669 = insertelement <2 x bfloat> %668, bfloat %643, i64 1
  %670 = bitcast <2 x bfloat> %669 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %661, i32 %664, i32 %667, i32 %670, ptr addrspace(1) %646) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_3(ptr noalias readonly align 128 captures(none) dereferenceable(917504) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias align 128 captures(none) dereferenceable(65536) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !5
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5
  %28 = mul nuw nsw i32 %15, 28672
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 26624
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !5, !alias.scope !56
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !5
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 24576
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !5, !alias.scope !59
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !5
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 22528
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !5, !alias.scope !62
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 20480
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !5, !alias.scope !65
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_334(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
  %4 = getelementptr i8, ptr addrspace(1) %3, i64 18432
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
  %15 = getelementptr i8, ptr addrspace(1) %14, i64 18432
  %16 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 1024
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #9
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #9
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #9
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %282 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
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
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
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
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #9
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #9
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #9
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #9
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #9
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #9
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #9
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #9
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #9
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #9
  ret void
}

define ptx_kernel void @fusion_332(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 18432
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 18432
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #9
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = extractvalue { i32, i32, i32, i32 } %261, 1
  %264 = extractvalue { i32, i32, i32, i32 } %261, 2
  %265 = extractvalue { i32, i32, i32, i32 } %261, 3
  %266 = bitcast i32 %262 to float
  %267 = bitcast i32 %263 to float
  %268 = bitcast i32 %264 to float
  %269 = bitcast i32 %265 to float
  %270 = fadd float %213, %239
  %271 = fadd float %214, %240
  %272 = fadd float %215, %241
  %273 = fadd float %216, %242
  %274 = fadd float %217, %248
  %275 = fadd float %218, %249
  %276 = fadd float %219, %250
  %277 = fadd float %220, %251
  %278 = fadd float %221, %257
  %279 = fadd float %222, %258
  %280 = fadd float %223, %259
  %281 = fadd float %224, %260
  %282 = fadd float %225, %266
  %283 = fadd float %226, %267
  %284 = fadd float %227, %268
  %285 = fadd float %228, %269
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
  %299 = fadd float %173, %283
  %300 = fadd float %174, %284
  %301 = fadd float %175, %285
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
  %315 = fadd float %119, %299
  %316 = fadd float %120, %300
  %317 = fadd float %121, %301
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
  %331 = fadd float %65, %315
  %332 = fadd float %66, %316
  %333 = fadd float %67, %317
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
  %347 = fmul float %331, %331
  %348 = fmul float %332, %332
  %349 = fmul float %333, %333
  %350 = fadd float %334, %335
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
  %362 = fadd float %347, %361
  %363 = fadd float %348, %362
  %364 = fadd float %349, %363
  %365 = bitcast float %364 to i32
  %366 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %365, i32 16, i32 31)
  %367 = bitcast i32 %366 to float
  %368 = fadd float %364, %367
  %369 = bitcast float %368 to i32
  %370 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %369, i32 8, i32 31)
  %371 = bitcast i32 %370 to float
  %372 = fadd float %368, %371
  %373 = bitcast float %372 to i32
  %374 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %373, i32 4, i32 31)
  %375 = bitcast i32 %374 to float
  %376 = fadd float %372, %375
  %377 = bitcast float %376 to i32
  %378 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %377, i32 2, i32 31)
  %379 = bitcast i32 %378 to float
  %380 = fadd float %376, %379
  %381 = bitcast float %380 to i32
  %382 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %381, i32 1, i32 31)
  %383 = bitcast i32 %382 to float
  %384 = fadd float %380, %383
  %385 = icmp eq i32 %6, 0
  %386 = zext nneg i32 %7 to i64
  %387 = getelementptr float, ptr addrspace(3) @global_smem, i64 %386
  %388 = bitcast float %384 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #9
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #9
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #9
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %402 = bitcast i32 %401 to float
  %403 = fadd float %400, %402
  %404 = tail call float @llvm.nvvm.rsqrt.approx.f(float %403)
  %405 = fmul float %318, %404
  %406 = fmul float %319, %404
  %407 = fmul float %320, %404
  %408 = fmul float %321, %404
  %409 = fmul float %322, %404
  %410 = fmul float %323, %404
  %411 = fmul float %324, %404
  %412 = fmul float %325, %404
  %413 = fmul float %326, %404
  %414 = fmul float %327, %404
  %415 = fmul float %328, %404
  %416 = fmul float %329, %404
  %417 = fmul float %330, %404
  %418 = fmul float %331, %404
  %419 = fmul float %332, %404
  %420 = fmul float %333, %404
  %421 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %422 = getelementptr i8, ptr addrspace(1) %421, i64 1024
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #9
  %424 = extractvalue { i32, i32, i32, i32 } %423, 0
  %425 = bitcast i32 %424 to <2 x bfloat>
  %426 = extractvalue { i32, i32, i32, i32 } %423, 1
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = extractvalue { i32, i32, i32, i32 } %423, 2
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractvalue { i32, i32, i32, i32 } %423, 3
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractelement <2 x bfloat> %425, i64 0
  %433 = extractelement <2 x bfloat> %425, i64 1
  %434 = extractelement <2 x bfloat> %427, i64 0
  %435 = extractelement <2 x bfloat> %427, i64 1
  %436 = extractelement <2 x bfloat> %429, i64 0
  %437 = extractelement <2 x bfloat> %429, i64 1
  %438 = extractelement <2 x bfloat> %431, i64 0
  %439 = extractelement <2 x bfloat> %431, i64 1
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #9
  %441 = extractvalue { i32, i32, i32, i32 } %440, 0
  %442 = bitcast i32 %441 to <2 x bfloat>
  %443 = extractvalue { i32, i32, i32, i32 } %440, 1
  %444 = bitcast i32 %443 to <2 x bfloat>
  %445 = extractvalue { i32, i32, i32, i32 } %440, 2
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %440, 3
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractelement <2 x bfloat> %442, i64 0
  %450 = extractelement <2 x bfloat> %442, i64 1
  %451 = extractelement <2 x bfloat> %444, i64 0
  %452 = extractelement <2 x bfloat> %444, i64 1
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #9
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #9
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #9
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #9
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #9
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #9
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #9
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #9
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #9
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #9
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #9
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #9
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #9
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #9
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #9
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #9
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
  %486 = fmul float %418, %470
  %487 = fmul float %419, %471
  %488 = fmul float %420, %472
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #9
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #9
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #9
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #9
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #9
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #9
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #9
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #9
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #9
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #9
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #9
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #9
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #9
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #9
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #9
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #9
  %505 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %506 = getelementptr bfloat, ptr addrspace(1) %505, i64 %13
  %507 = getelementptr i8, ptr addrspace(1) %506, i64 1024
  %508 = insertelement <2 x bfloat> poison, bfloat %489, i64 0
  %509 = insertelement <2 x bfloat> %508, bfloat %490, i64 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> poison, bfloat %491, i64 0
  %512 = insertelement <2 x bfloat> %511, bfloat %492, i64 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> poison, bfloat %493, i64 0
  %515 = insertelement <2 x bfloat> %514, bfloat %494, i64 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> poison, bfloat %495, i64 0
  %518 = insertelement <2 x bfloat> %517, bfloat %496, i64 1
  %519 = bitcast <2 x bfloat> %518 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #9
  %520 = insertelement <2 x bfloat> poison, bfloat %497, i64 0
  %521 = insertelement <2 x bfloat> %520, bfloat %498, i64 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> poison, bfloat %499, i64 0
  %524 = insertelement <2 x bfloat> %523, bfloat %500, i64 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> poison, bfloat %501, i64 0
  %527 = insertelement <2 x bfloat> %526, bfloat %502, i64 1
  %528 = bitcast <2 x bfloat> %527 to i32
  %529 = insertelement <2 x bfloat> poison, bfloat %503, i64 0
  %530 = insertelement <2 x bfloat> %529, bfloat %504, i64 1
  %531 = bitcast <2 x bfloat> %530 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #9
  ret void
}

define ptx_kernel void @fusion_330(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 16384
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 16384
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 18432
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 18432
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = getelementptr float, ptr addrspace(1) %arg49, i64 %68
  %337 = getelementptr float, ptr addrspace(1) %336, i64 %13
  %338 = getelementptr i8, ptr addrspace(1) %337, i64 16
  %339 = getelementptr i8, ptr addrspace(1) %337, i64 2048
  %340 = getelementptr i8, ptr addrspace(1) %337, i64 2064
  %341 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #9
  %342 = extractvalue { i32, i32, i32, i32 } %341, 0
  %343 = extractvalue { i32, i32, i32, i32 } %341, 1
  %344 = extractvalue { i32, i32, i32, i32 } %341, 2
  %345 = extractvalue { i32, i32, i32, i32 } %341, 3
  %346 = bitcast i32 %342 to float
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #9
  %351 = extractvalue { i32, i32, i32, i32 } %350, 0
  %352 = extractvalue { i32, i32, i32, i32 } %350, 1
  %353 = extractvalue { i32, i32, i32, i32 } %350, 2
  %354 = extractvalue { i32, i32, i32, i32 } %350, 3
  %355 = bitcast i32 %351 to float
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #9
  %360 = extractvalue { i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32 } %359, 3
  %364 = bitcast i32 %360 to float
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #9
  %369 = extractvalue { i32, i32, i32, i32 } %368, 0
  %370 = extractvalue { i32, i32, i32, i32 } %368, 1
  %371 = extractvalue { i32, i32, i32, i32 } %368, 2
  %372 = extractvalue { i32, i32, i32, i32 } %368, 3
  %373 = bitcast i32 %369 to float
  %374 = bitcast i32 %370 to float
  %375 = bitcast i32 %371 to float
  %376 = bitcast i32 %372 to float
  %377 = fadd float %320, %346
  %378 = fadd float %321, %347
  %379 = fadd float %322, %348
  %380 = fadd float %323, %349
  %381 = fadd float %324, %355
  %382 = fadd float %325, %356
  %383 = fadd float %326, %357
  %384 = fadd float %327, %358
  %385 = fadd float %328, %364
  %386 = fadd float %329, %365
  %387 = fadd float %330, %366
  %388 = fadd float %331, %367
  %389 = fadd float %332, %373
  %390 = fadd float %333, %374
  %391 = fadd float %334, %375
  %392 = fadd float %335, %376
  %393 = fadd float %267, %377
  %394 = fadd float %268, %378
  %395 = fadd float %269, %379
  %396 = fadd float %270, %380
  %397 = fadd float %271, %381
  %398 = fadd float %272, %382
  %399 = fadd float %273, %383
  %400 = fadd float %274, %384
  %401 = fadd float %275, %385
  %402 = fadd float %276, %386
  %403 = fadd float %277, %387
  %404 = fadd float %278, %388
  %405 = fadd float %279, %389
  %406 = fadd float %280, %390
  %407 = fadd float %281, %391
  %408 = fadd float %282, %392
  %409 = fadd float %213, %393
  %410 = fadd float %214, %394
  %411 = fadd float %215, %395
  %412 = fadd float %216, %396
  %413 = fadd float %217, %397
  %414 = fadd float %218, %398
  %415 = fadd float %219, %399
  %416 = fadd float %220, %400
  %417 = fadd float %221, %401
  %418 = fadd float %222, %402
  %419 = fadd float %223, %403
  %420 = fadd float %224, %404
  %421 = fadd float %225, %405
  %422 = fadd float %226, %406
  %423 = fadd float %227, %407
  %424 = fadd float %228, %408
  %425 = fadd float %160, %409
  %426 = fadd float %161, %410
  %427 = fadd float %162, %411
  %428 = fadd float %163, %412
  %429 = fadd float %164, %413
  %430 = fadd float %165, %414
  %431 = fadd float %166, %415
  %432 = fadd float %167, %416
  %433 = fadd float %168, %417
  %434 = fadd float %169, %418
  %435 = fadd float %170, %419
  %436 = fadd float %171, %420
  %437 = fadd float %172, %421
  %438 = fadd float %173, %422
  %439 = fadd float %174, %423
  %440 = fadd float %175, %424
  %441 = fadd float %106, %425
  %442 = fadd float %107, %426
  %443 = fadd float %108, %427
  %444 = fadd float %109, %428
  %445 = fadd float %110, %429
  %446 = fadd float %111, %430
  %447 = fadd float %112, %431
  %448 = fadd float %113, %432
  %449 = fadd float %114, %433
  %450 = fadd float %115, %434
  %451 = fadd float %116, %435
  %452 = fadd float %117, %436
  %453 = fadd float %118, %437
  %454 = fadd float %119, %438
  %455 = fadd float %120, %439
  %456 = fadd float %121, %440
  %457 = fadd float %52, %441
  %458 = fadd float %53, %442
  %459 = fadd float %54, %443
  %460 = fadd float %55, %444
  %461 = fadd float %56, %445
  %462 = fadd float %57, %446
  %463 = fadd float %58, %447
  %464 = fadd float %59, %448
  %465 = fadd float %60, %449
  %466 = fadd float %61, %450
  %467 = fadd float %62, %451
  %468 = fadd float %63, %452
  %469 = fadd float %64, %453
  %470 = fadd float %65, %454
  %471 = fadd float %66, %455
  %472 = fadd float %67, %456
  %473 = fmul float %457, %457
  %474 = fmul float %458, %458
  %475 = fmul float %459, %459
  %476 = fmul float %460, %460
  %477 = fmul float %461, %461
  %478 = fmul float %462, %462
  %479 = fmul float %463, %463
  %480 = fmul float %464, %464
  %481 = fmul float %465, %465
  %482 = fmul float %466, %466
  %483 = fmul float %467, %467
  %484 = fmul float %468, %468
  %485 = fmul float %469, %469
  %486 = fmul float %470, %470
  %487 = fmul float %471, %471
  %488 = fmul float %472, %472
  %489 = fadd float %473, %474
  %490 = fadd float %475, %489
  %491 = fadd float %476, %490
  %492 = fadd float %477, %491
  %493 = fadd float %478, %492
  %494 = fadd float %479, %493
  %495 = fadd float %480, %494
  %496 = fadd float %481, %495
  %497 = fadd float %482, %496
  %498 = fadd float %483, %497
  %499 = fadd float %484, %498
  %500 = fadd float %485, %499
  %501 = fadd float %486, %500
  %502 = fadd float %487, %501
  %503 = fadd float %488, %502
  %504 = bitcast float %503 to i32
  %505 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %504, i32 16, i32 31)
  %506 = bitcast i32 %505 to float
  %507 = fadd float %503, %506
  %508 = bitcast float %507 to i32
  %509 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %508, i32 8, i32 31)
  %510 = bitcast i32 %509 to float
  %511 = fadd float %507, %510
  %512 = bitcast float %511 to i32
  %513 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %512, i32 4, i32 31)
  %514 = bitcast i32 %513 to float
  %515 = fadd float %511, %514
  %516 = bitcast float %515 to i32
  %517 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %516, i32 2, i32 31)
  %518 = bitcast i32 %517 to float
  %519 = fadd float %515, %518
  %520 = bitcast float %519 to i32
  %521 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %520, i32 1, i32 31)
  %522 = bitcast i32 %521 to float
  %523 = fadd float %519, %522
  %524 = icmp eq i32 %6, 0
  %525 = zext nneg i32 %7 to i64
  %526 = getelementptr float, ptr addrspace(3) @global_smem, i64 %525
  %527 = bitcast float %523 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %526, <1 x i32> %527, i1 %524) #9
  tail call void @llvm.nvvm.barrier0()
  %528 = icmp samesign ult i32 %5, 2
  %529 = zext nneg i32 %5 to i64
  %530 = getelementptr float, ptr addrspace(3) @global_smem, i64 %529
  %531 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %530, i1 %528) #9
  %532 = bitcast i32 %531 to float
  %533 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %531, i32 1, i32 31)
  %534 = bitcast i32 %533 to float
  %535 = fadd float %532, %534
  %536 = icmp eq i32 %5, 0
  %537 = bitcast float %535 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %530, <1 x i32> %537, i1 %536) #9
  tail call void @llvm.nvvm.barrier0()
  %538 = load float, ptr addrspace(3) @global_smem, align 16
  %539 = fmul float %538, 0x3F50000000000000
  %540 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %541 = bitcast i32 %540 to float
  %542 = fadd float %539, %541
  %543 = tail call float @llvm.nvvm.rsqrt.approx.f(float %542)
  %544 = fmul float %457, %543
  %545 = fmul float %458, %543
  %546 = fmul float %459, %543
  %547 = fmul float %460, %543
  %548 = fmul float %461, %543
  %549 = fmul float %462, %543
  %550 = fmul float %463, %543
  %551 = fmul float %464, %543
  %552 = fmul float %465, %543
  %553 = fmul float %466, %543
  %554 = fmul float %467, %543
  %555 = fmul float %468, %543
  %556 = fmul float %469, %543
  %557 = fmul float %470, %543
  %558 = fmul float %471, %543
  %559 = fmul float %472, %543
  %560 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %561 = getelementptr i8, ptr addrspace(1) %560, i64 1024
  %562 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %560) #9
  %563 = extractvalue { i32, i32, i32, i32 } %562, 0
  %564 = bitcast i32 %563 to <2 x bfloat>
  %565 = extractvalue { i32, i32, i32, i32 } %562, 1
  %566 = bitcast i32 %565 to <2 x bfloat>
  %567 = extractvalue { i32, i32, i32, i32 } %562, 2
  %568 = bitcast i32 %567 to <2 x bfloat>
  %569 = extractvalue { i32, i32, i32, i32 } %562, 3
  %570 = bitcast i32 %569 to <2 x bfloat>
  %571 = extractelement <2 x bfloat> %564, i64 0
  %572 = extractelement <2 x bfloat> %564, i64 1
  %573 = extractelement <2 x bfloat> %566, i64 0
  %574 = extractelement <2 x bfloat> %566, i64 1
  %575 = extractelement <2 x bfloat> %568, i64 0
  %576 = extractelement <2 x bfloat> %568, i64 1
  %577 = extractelement <2 x bfloat> %570, i64 0
  %578 = extractelement <2 x bfloat> %570, i64 1
  %579 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #9
  %580 = extractvalue { i32, i32, i32, i32 } %579, 0
  %581 = bitcast i32 %580 to <2 x bfloat>
  %582 = extractvalue { i32, i32, i32, i32 } %579, 1
  %583 = bitcast i32 %582 to <2 x bfloat>
  %584 = extractvalue { i32, i32, i32, i32 } %579, 2
  %585 = bitcast i32 %584 to <2 x bfloat>
  %586 = extractvalue { i32, i32, i32, i32 } %579, 3
  %587 = bitcast i32 %586 to <2 x bfloat>
  %588 = extractelement <2 x bfloat> %581, i64 0
  %589 = extractelement <2 x bfloat> %581, i64 1
  %590 = extractelement <2 x bfloat> %583, i64 0
  %591 = extractelement <2 x bfloat> %583, i64 1
  %592 = extractelement <2 x bfloat> %585, i64 0
  %593 = extractelement <2 x bfloat> %585, i64 1
  %594 = extractelement <2 x bfloat> %587, i64 0
  %595 = extractelement <2 x bfloat> %587, i64 1
  %596 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %571) #9
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #9
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #9
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #9
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #9
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #9
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #9
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #9
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %588) #9
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #9
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #9
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #9
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #9
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #9
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #9
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #9
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
  %627 = fmul float %559, %611
  %628 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %612) #9
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613) #9
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614) #9
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615) #9
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616) #9
  %633 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617) #9
  %634 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618) #9
  %635 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619) #9
  %636 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620) #9
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #9
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #9
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #9
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #9
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #9
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #9
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #9
  %644 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %68
  %645 = getelementptr bfloat, ptr addrspace(1) %644, i64 %13
  %646 = getelementptr i8, ptr addrspace(1) %645, i64 1024
  %647 = insertelement <2 x bfloat> poison, bfloat %628, i64 0
  %648 = insertelement <2 x bfloat> %647, bfloat %629, i64 1
  %649 = bitcast <2 x bfloat> %648 to i32
  %650 = insertelement <2 x bfloat> poison, bfloat %630, i64 0
  %651 = insertelement <2 x bfloat> %650, bfloat %631, i64 1
  %652 = bitcast <2 x bfloat> %651 to i32
  %653 = insertelement <2 x bfloat> poison, bfloat %632, i64 0
  %654 = insertelement <2 x bfloat> %653, bfloat %633, i64 1
  %655 = bitcast <2 x bfloat> %654 to i32
  %656 = insertelement <2 x bfloat> poison, bfloat %634, i64 0
  %657 = insertelement <2 x bfloat> %656, bfloat %635, i64 1
  %658 = bitcast <2 x bfloat> %657 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %649, i32 %652, i32 %655, i32 %658, ptr addrspace(1) %645) #9
  %659 = insertelement <2 x bfloat> poison, bfloat %636, i64 0
  %660 = insertelement <2 x bfloat> %659, bfloat %637, i64 1
  %661 = bitcast <2 x bfloat> %660 to i32
  %662 = insertelement <2 x bfloat> poison, bfloat %638, i64 0
  %663 = insertelement <2 x bfloat> %662, bfloat %639, i64 1
  %664 = bitcast <2 x bfloat> %663 to i32
  %665 = insertelement <2 x bfloat> poison, bfloat %640, i64 0
  %666 = insertelement <2 x bfloat> %665, bfloat %641, i64 1
  %667 = bitcast <2 x bfloat> %666 to i32
  %668 = insertelement <2 x bfloat> poison, bfloat %642, i64 0
  %669 = insertelement <2 x bfloat> %668, bfloat %643, i64 1
  %670 = bitcast <2 x bfloat> %669 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %661, i32 %664, i32 %667, i32 %670, ptr addrspace(1) %646) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_4(ptr noalias readonly align 128 captures(none) dereferenceable(917504) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias align 128 captures(none) dereferenceable(65536) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !5
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5
  %28 = mul nuw nsw i32 %15, 28672
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 18432
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !5, !alias.scope !68
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !5
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 16384
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !5, !alias.scope !71
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !5
  %49 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 14336
  %50 = load bfloat, ptr addrspace(1) %49, align 2, !invariant.load !5, !alias.scope !74
  %51 = fpext bfloat %50 to float
  %52 = fadd float %46, %45
  %53 = fpext bfloat %48 to float
  %54 = fadd float %52, %51
  %55 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 12288
  %56 = load bfloat, ptr addrspace(1) %55, align 2, !invariant.load !5, !alias.scope !77
  %57 = fpext bfloat %56 to float
  %58 = fadd float %54, %53
  %59 = fadd float %58, %57
  store float %59, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_326(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #9
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #9
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #9
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
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
  %282 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
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
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
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
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #9
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #9
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #9
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #9
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #9
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #9
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #9
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #9
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #9
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #9
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #9
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #9
  ret void
}

define ptx_kernel void @fusion_324(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 57344
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #9
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #9
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #9
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #9
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #9
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %230 = getelementptr float, ptr addrspace(1) %229, i64 %13
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 16
  %232 = getelementptr i8, ptr addrspace(1) %230, i64 2048
  %233 = getelementptr i8, ptr addrspace(1) %230, i64 2064
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = extractvalue { i32, i32, i32, i32 } %234, 1
  %237 = extractvalue { i32, i32, i32, i32 } %234, 2
  %238 = extractvalue { i32, i32, i32, i32 } %234, 3
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %244 = extractvalue { i32, i32, i32, i32 } %243, 0
  %245 = extractvalue { i32, i32, i32, i32 } %243, 1
  %246 = extractvalue { i32, i32, i32, i32 } %243, 2
  %247 = extractvalue { i32, i32, i32, i32 } %243, 3
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #9
  %253 = extractvalue { i32, i32, i32, i32 } %252, 0
  %254 = extractvalue { i32, i32, i32, i32 } %252, 1
  %255 = extractvalue { i32, i32, i32, i32 } %252, 2
  %256 = extractvalue { i32, i32, i32, i32 } %252, 3
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #9
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = extractvalue { i32, i32, i32, i32 } %261, 1
  %264 = extractvalue { i32, i32, i32, i32 } %261, 2
  %265 = extractvalue { i32, i32, i32, i32 } %261, 3
  %266 = bitcast i32 %262 to float
  %267 = bitcast i32 %263 to float
  %268 = bitcast i32 %264 to float
  %269 = bitcast i32 %265 to float
  %270 = fadd float %213, %239
  %271 = fadd float %214, %240
  %272 = fadd float %215, %241
  %273 = fadd float %216, %242
  %274 = fadd float %217, %248
  %275 = fadd float %218, %249
  %276 = fadd float %219, %250
  %277 = fadd float %220, %251
  %278 = fadd float %221, %257
  %279 = fadd float %222, %258
  %280 = fadd float %223, %259
  %281 = fadd float %224, %260
  %282 = fadd float %225, %266
  %283 = fadd float %226, %267
  %284 = fadd float %227, %268
  %285 = fadd float %228, %269
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
  %299 = fadd float %173, %283
  %300 = fadd float %174, %284
  %301 = fadd float %175, %285
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
  %315 = fadd float %119, %299
  %316 = fadd float %120, %300
  %317 = fadd float %121, %301
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
  %331 = fadd float %65, %315
  %332 = fadd float %66, %316
  %333 = fadd float %67, %317
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
  %347 = fmul float %331, %331
  %348 = fmul float %332, %332
  %349 = fmul float %333, %333
  %350 = fadd float %334, %335
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
  %362 = fadd float %347, %361
  %363 = fadd float %348, %362
  %364 = fadd float %349, %363
  %365 = bitcast float %364 to i32
  %366 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %365, i32 16, i32 31)
  %367 = bitcast i32 %366 to float
  %368 = fadd float %364, %367
  %369 = bitcast float %368 to i32
  %370 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %369, i32 8, i32 31)
  %371 = bitcast i32 %370 to float
  %372 = fadd float %368, %371
  %373 = bitcast float %372 to i32
  %374 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %373, i32 4, i32 31)
  %375 = bitcast i32 %374 to float
  %376 = fadd float %372, %375
  %377 = bitcast float %376 to i32
  %378 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %377, i32 2, i32 31)
  %379 = bitcast i32 %378 to float
  %380 = fadd float %376, %379
  %381 = bitcast float %380 to i32
  %382 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %381, i32 1, i32 31)
  %383 = bitcast i32 %382 to float
  %384 = fadd float %380, %383
  %385 = icmp eq i32 %6, 0
  %386 = zext nneg i32 %7 to i64
  %387 = getelementptr float, ptr addrspace(3) @global_smem, i64 %386
  %388 = bitcast float %384 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %387, <1 x i32> %388, i1 %385) #9
  tail call void @llvm.nvvm.barrier0()
  %389 = icmp samesign ult i32 %5, 2
  %390 = zext nneg i32 %5 to i64
  %391 = getelementptr float, ptr addrspace(3) @global_smem, i64 %390
  %392 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %391, i1 %389) #9
  %393 = bitcast i32 %392 to float
  %394 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %392, i32 1, i32 31)
  %395 = bitcast i32 %394 to float
  %396 = fadd float %393, %395
  %397 = icmp eq i32 %5, 0
  %398 = bitcast float %396 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %391, <1 x i32> %398, i1 %397) #9
  tail call void @llvm.nvvm.barrier0()
  %399 = load float, ptr addrspace(3) @global_smem, align 16
  %400 = fmul float %399, 0x3F50000000000000
  %401 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %402 = bitcast i32 %401 to float
  %403 = fadd float %400, %402
  %404 = tail call float @llvm.nvvm.rsqrt.approx.f(float %403)
  %405 = fmul float %318, %404
  %406 = fmul float %319, %404
  %407 = fmul float %320, %404
  %408 = fmul float %321, %404
  %409 = fmul float %322, %404
  %410 = fmul float %323, %404
  %411 = fmul float %324, %404
  %412 = fmul float %325, %404
  %413 = fmul float %326, %404
  %414 = fmul float %327, %404
  %415 = fmul float %328, %404
  %416 = fmul float %329, %404
  %417 = fmul float %330, %404
  %418 = fmul float %331, %404
  %419 = fmul float %332, %404
  %420 = fmul float %333, %404
  %421 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %422 = getelementptr i8, ptr addrspace(1) %421, i64 1024
  %423 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %421) #9
  %424 = extractvalue { i32, i32, i32, i32 } %423, 0
  %425 = bitcast i32 %424 to <2 x bfloat>
  %426 = extractvalue { i32, i32, i32, i32 } %423, 1
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = extractvalue { i32, i32, i32, i32 } %423, 2
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractvalue { i32, i32, i32, i32 } %423, 3
  %431 = bitcast i32 %430 to <2 x bfloat>
  %432 = extractelement <2 x bfloat> %425, i64 0
  %433 = extractelement <2 x bfloat> %425, i64 1
  %434 = extractelement <2 x bfloat> %427, i64 0
  %435 = extractelement <2 x bfloat> %427, i64 1
  %436 = extractelement <2 x bfloat> %429, i64 0
  %437 = extractelement <2 x bfloat> %429, i64 1
  %438 = extractelement <2 x bfloat> %431, i64 0
  %439 = extractelement <2 x bfloat> %431, i64 1
  %440 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #9
  %441 = extractvalue { i32, i32, i32, i32 } %440, 0
  %442 = bitcast i32 %441 to <2 x bfloat>
  %443 = extractvalue { i32, i32, i32, i32 } %440, 1
  %444 = bitcast i32 %443 to <2 x bfloat>
  %445 = extractvalue { i32, i32, i32, i32 } %440, 2
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %440, 3
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractelement <2 x bfloat> %442, i64 0
  %450 = extractelement <2 x bfloat> %442, i64 1
  %451 = extractelement <2 x bfloat> %444, i64 0
  %452 = extractelement <2 x bfloat> %444, i64 1
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #9
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #9
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #9
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #9
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #9
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #9
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #9
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #9
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #9
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #9
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #9
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #9
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #9
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #9
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #9
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #9
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
  %486 = fmul float %418, %470
  %487 = fmul float %419, %471
  %488 = fmul float %420, %472
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #9
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #9
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #9
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #9
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #9
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #9
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #9
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #9
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #9
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #9
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #9
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #9
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #9
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #9
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #9
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #9
  %505 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %506 = getelementptr bfloat, ptr addrspace(1) %505, i64 %13
  %507 = getelementptr i8, ptr addrspace(1) %506, i64 1024
  %508 = insertelement <2 x bfloat> poison, bfloat %489, i64 0
  %509 = insertelement <2 x bfloat> %508, bfloat %490, i64 1
  %510 = bitcast <2 x bfloat> %509 to i32
  %511 = insertelement <2 x bfloat> poison, bfloat %491, i64 0
  %512 = insertelement <2 x bfloat> %511, bfloat %492, i64 1
  %513 = bitcast <2 x bfloat> %512 to i32
  %514 = insertelement <2 x bfloat> poison, bfloat %493, i64 0
  %515 = insertelement <2 x bfloat> %514, bfloat %494, i64 1
  %516 = bitcast <2 x bfloat> %515 to i32
  %517 = insertelement <2 x bfloat> poison, bfloat %495, i64 0
  %518 = insertelement <2 x bfloat> %517, bfloat %496, i64 1
  %519 = bitcast <2 x bfloat> %518 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %510, i32 %513, i32 %516, i32 %519, ptr addrspace(1) %506) #9
  %520 = insertelement <2 x bfloat> poison, bfloat %497, i64 0
  %521 = insertelement <2 x bfloat> %520, bfloat %498, i64 1
  %522 = bitcast <2 x bfloat> %521 to i32
  %523 = insertelement <2 x bfloat> poison, bfloat %499, i64 0
  %524 = insertelement <2 x bfloat> %523, bfloat %500, i64 1
  %525 = bitcast <2 x bfloat> %524 to i32
  %526 = insertelement <2 x bfloat> poison, bfloat %501, i64 0
  %527 = insertelement <2 x bfloat> %526, bfloat %502, i64 1
  %528 = bitcast <2 x bfloat> %527 to i32
  %529 = insertelement <2 x bfloat> poison, bfloat %503, i64 0
  %530 = insertelement <2 x bfloat> %529, bfloat %504, i64 1
  %531 = bitcast <2 x bfloat> %530 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %522, i32 %525, i32 %528, i32 %531, ptr addrspace(1) %507) #9
  ret void
}

define ptx_kernel void @fusion_322(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(917504) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %2, 28672
  %4 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 3
  %10 = and i32 %9, 248
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 256
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
  %20 = extractvalue { i32, i32, i32, i32 } %19, 0
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %19, 1
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractvalue { i32, i32, i32, i32 } %19, 2
  %25 = bitcast i32 %24 to <2 x bfloat>
  %26 = extractvalue { i32, i32, i32, i32 } %19, 3
  %27 = bitcast i32 %26 to <2 x bfloat>
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = extractelement <2 x bfloat> %25, i64 0
  %33 = extractelement <2 x bfloat> %25, i64 1
  %34 = extractelement <2 x bfloat> %27, i64 0
  %35 = extractelement <2 x bfloat> %27, i64 1
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #9
  %37 = extractvalue { i32, i32, i32, i32 } %36, 0
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractvalue { i32, i32, i32, i32 } %36, 1
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractvalue { i32, i32, i32, i32 } %36, 2
  %42 = bitcast i32 %41 to <2 x bfloat>
  %43 = extractvalue { i32, i32, i32, i32 } %36, 3
  %44 = bitcast i32 %43 to <2 x bfloat>
  %45 = extractelement <2 x bfloat> %38, i64 0
  %46 = extractelement <2 x bfloat> %38, i64 1
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = extractelement <2 x bfloat> %42, i64 0
  %50 = extractelement <2 x bfloat> %42, i64 1
  %51 = extractelement <2 x bfloat> %44, i64 0
  %52 = extractelement <2 x bfloat> %44, i64 1
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #9
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i64 0
  %83 = extractelement <2 x bfloat> %75, i64 1
  %84 = extractelement <2 x bfloat> %77, i64 0
  %85 = extractelement <2 x bfloat> %77, i64 1
  %86 = extractelement <2 x bfloat> %79, i64 0
  %87 = extractelement <2 x bfloat> %79, i64 1
  %88 = extractelement <2 x bfloat> %81, i64 0
  %89 = extractelement <2 x bfloat> %81, i64 1
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #9
  %91 = extractvalue { i32, i32, i32, i32 } %90, 0
  %92 = bitcast i32 %91 to <2 x bfloat>
  %93 = extractvalue { i32, i32, i32, i32 } %90, 1
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractvalue { i32, i32, i32, i32 } %90, 2
  %96 = bitcast i32 %95 to <2 x bfloat>
  %97 = extractvalue { i32, i32, i32, i32 } %90, 3
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractelement <2 x bfloat> %92, i64 0
  %100 = extractelement <2 x bfloat> %92, i64 1
  %101 = extractelement <2 x bfloat> %94, i64 0
  %102 = extractelement <2 x bfloat> %94, i64 1
  %103 = extractelement <2 x bfloat> %96, i64 0
  %104 = extractelement <2 x bfloat> %96, i64 1
  %105 = extractelement <2 x bfloat> %98, i64 0
  %106 = extractelement <2 x bfloat> %98, i64 1
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 8192
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 8192
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
  %145 = extractvalue { i32, i32, i32, i32 } %144, 0
  %146 = bitcast i32 %145 to <2 x bfloat>
  %147 = extractvalue { i32, i32, i32, i32 } %144, 1
  %148 = bitcast i32 %147 to <2 x bfloat>
  %149 = extractvalue { i32, i32, i32, i32 } %144, 2
  %150 = bitcast i32 %149 to <2 x bfloat>
  %151 = extractvalue { i32, i32, i32, i32 } %144, 3
  %152 = bitcast i32 %151 to <2 x bfloat>
  %153 = extractelement <2 x bfloat> %146, i64 0
  %154 = extractelement <2 x bfloat> %146, i64 1
  %155 = extractelement <2 x bfloat> %148, i64 0
  %156 = extractelement <2 x bfloat> %148, i64 1
  %157 = extractelement <2 x bfloat> %150, i64 0
  %158 = extractelement <2 x bfloat> %150, i64 1
  %159 = extractelement <2 x bfloat> %152, i64 0
  %160 = extractelement <2 x bfloat> %152, i64 1
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #9
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #9
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #9
  %177 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #9
  %181 = extractvalue { i32, i32, i32, i32 } %180, 0
  %182 = bitcast i32 %181 to <2 x bfloat>
  %183 = extractvalue { i32, i32, i32, i32 } %180, 1
  %184 = bitcast i32 %183 to <2 x bfloat>
  %185 = extractvalue { i32, i32, i32, i32 } %180, 2
  %186 = bitcast i32 %185 to <2 x bfloat>
  %187 = extractvalue { i32, i32, i32, i32 } %180, 3
  %188 = bitcast i32 %187 to <2 x bfloat>
  %189 = extractelement <2 x bfloat> %182, i64 0
  %190 = extractelement <2 x bfloat> %182, i64 1
  %191 = extractelement <2 x bfloat> %184, i64 0
  %192 = extractelement <2 x bfloat> %184, i64 1
  %193 = extractelement <2 x bfloat> %186, i64 0
  %194 = extractelement <2 x bfloat> %186, i64 1
  %195 = extractelement <2 x bfloat> %188, i64 0
  %196 = extractelement <2 x bfloat> %188, i64 1
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #9
  %198 = extractvalue { i32, i32, i32, i32 } %197, 0
  %199 = bitcast i32 %198 to <2 x bfloat>
  %200 = extractvalue { i32, i32, i32, i32 } %197, 1
  %201 = bitcast i32 %200 to <2 x bfloat>
  %202 = extractvalue { i32, i32, i32, i32 } %197, 2
  %203 = bitcast i32 %202 to <2 x bfloat>
  %204 = extractvalue { i32, i32, i32, i32 } %197, 3
  %205 = bitcast i32 %204 to <2 x bfloat>
  %206 = extractelement <2 x bfloat> %199, i64 0
  %207 = extractelement <2 x bfloat> %199, i64 1
  %208 = extractelement <2 x bfloat> %201, i64 0
  %209 = extractelement <2 x bfloat> %201, i64 1
  %210 = extractelement <2 x bfloat> %203, i64 0
  %211 = extractelement <2 x bfloat> %203, i64 1
  %212 = extractelement <2 x bfloat> %205, i64 0
  %213 = extractelement <2 x bfloat> %205, i64 1
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #9
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #9
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #9
  %230 = getelementptr i8, ptr addrspace(1) %4, i64 10240
  %231 = getelementptr i8, ptr addrspace(1) %15, i64 10240
  %232 = getelementptr bfloat, ptr addrspace(1) %230, i64 %14
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 1024
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %235 = extractvalue { i32, i32, i32, i32 } %234, 0
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %234, 1
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractvalue { i32, i32, i32, i32 } %234, 2
  %240 = bitcast i32 %239 to <2 x bfloat>
  %241 = extractvalue { i32, i32, i32, i32 } %234, 3
  %242 = bitcast i32 %241 to <2 x bfloat>
  %243 = extractelement <2 x bfloat> %236, i64 0
  %244 = extractelement <2 x bfloat> %236, i64 1
  %245 = extractelement <2 x bfloat> %238, i64 0
  %246 = extractelement <2 x bfloat> %238, i64 1
  %247 = extractelement <2 x bfloat> %240, i64 0
  %248 = extractelement <2 x bfloat> %240, i64 1
  %249 = extractelement <2 x bfloat> %242, i64 0
  %250 = extractelement <2 x bfloat> %242, i64 1
  %251 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #9
  %252 = extractvalue { i32, i32, i32, i32 } %251, 0
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractvalue { i32, i32, i32, i32 } %251, 1
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractvalue { i32, i32, i32, i32 } %251, 2
  %257 = bitcast i32 %256 to <2 x bfloat>
  %258 = extractvalue { i32, i32, i32, i32 } %251, 3
  %259 = bitcast i32 %258 to <2 x bfloat>
  %260 = extractelement <2 x bfloat> %253, i64 0
  %261 = extractelement <2 x bfloat> %253, i64 1
  %262 = extractelement <2 x bfloat> %255, i64 0
  %263 = extractelement <2 x bfloat> %255, i64 1
  %264 = extractelement <2 x bfloat> %257, i64 0
  %265 = extractelement <2 x bfloat> %257, i64 1
  %266 = extractelement <2 x bfloat> %259, i64 0
  %267 = extractelement <2 x bfloat> %259, i64 1
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #9
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #9
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #9
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #9
  %284 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %285 = getelementptr bfloat, ptr addrspace(1) %284, i64 %14
  %286 = getelementptr i8, ptr addrspace(1) %285, i64 1024
  %287 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #9
  %288 = extractvalue { i32, i32, i32, i32 } %287, 0
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %287, 1
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractvalue { i32, i32, i32, i32 } %287, 2
  %293 = bitcast i32 %292 to <2 x bfloat>
  %294 = extractvalue { i32, i32, i32, i32 } %287, 3
  %295 = bitcast i32 %294 to <2 x bfloat>
  %296 = extractelement <2 x bfloat> %289, i64 0
  %297 = extractelement <2 x bfloat> %289, i64 1
  %298 = extractelement <2 x bfloat> %291, i64 0
  %299 = extractelement <2 x bfloat> %291, i64 1
  %300 = extractelement <2 x bfloat> %293, i64 0
  %301 = extractelement <2 x bfloat> %293, i64 1
  %302 = extractelement <2 x bfloat> %295, i64 0
  %303 = extractelement <2 x bfloat> %295, i64 1
  %304 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %286) #9
  %305 = extractvalue { i32, i32, i32, i32 } %304, 0
  %306 = bitcast i32 %305 to <2 x bfloat>
  %307 = extractvalue { i32, i32, i32, i32 } %304, 1
  %308 = bitcast i32 %307 to <2 x bfloat>
  %309 = extractvalue { i32, i32, i32, i32 } %304, 2
  %310 = bitcast i32 %309 to <2 x bfloat>
  %311 = extractvalue { i32, i32, i32, i32 } %304, 3
  %312 = bitcast i32 %311 to <2 x bfloat>
  %313 = extractelement <2 x bfloat> %306, i64 0
  %314 = extractelement <2 x bfloat> %306, i64 1
  %315 = extractelement <2 x bfloat> %308, i64 0
  %316 = extractelement <2 x bfloat> %308, i64 1
  %317 = extractelement <2 x bfloat> %310, i64 0
  %318 = extractelement <2 x bfloat> %310, i64 1
  %319 = extractelement <2 x bfloat> %312, i64 0
  %320 = extractelement <2 x bfloat> %312, i64 1
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #9
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #9
  %337 = getelementptr float, ptr addrspace(1) %arg49, i64 %69
  %338 = getelementptr float, ptr addrspace(1) %337, i64 %14
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 16
  %340 = getelementptr i8, ptr addrspace(1) %338, i64 2048
  %341 = getelementptr i8, ptr addrspace(1) %338, i64 2064
  %342 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #9
  %343 = extractvalue { i32, i32, i32, i32 } %342, 0
  %344 = extractvalue { i32, i32, i32, i32 } %342, 1
  %345 = extractvalue { i32, i32, i32, i32 } %342, 2
  %346 = extractvalue { i32, i32, i32, i32 } %342, 3
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = bitcast i32 %346 to float
  %351 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #9
  %352 = extractvalue { i32, i32, i32, i32 } %351, 0
  %353 = extractvalue { i32, i32, i32, i32 } %351, 1
  %354 = extractvalue { i32, i32, i32, i32 } %351, 2
  %355 = extractvalue { i32, i32, i32, i32 } %351, 3
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = bitcast i32 %355 to float
  %360 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #9
  %361 = extractvalue { i32, i32, i32, i32 } %360, 0
  %362 = extractvalue { i32, i32, i32, i32 } %360, 1
  %363 = extractvalue { i32, i32, i32, i32 } %360, 2
  %364 = extractvalue { i32, i32, i32, i32 } %360, 3
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = bitcast i32 %364 to float
  %369 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %341) #9
  %370 = extractvalue { i32, i32, i32, i32 } %369, 0
  %371 = extractvalue { i32, i32, i32, i32 } %369, 1
  %372 = extractvalue { i32, i32, i32, i32 } %369, 2
  %373 = extractvalue { i32, i32, i32, i32 } %369, 3
  %374 = bitcast i32 %370 to float
  %375 = bitcast i32 %371 to float
  %376 = bitcast i32 %372 to float
  %377 = bitcast i32 %373 to float
  %378 = fadd float %321, %347
  %379 = fadd float %322, %348
  %380 = fadd float %323, %349
  %381 = fadd float %324, %350
  %382 = fadd float %325, %356
  %383 = fadd float %326, %357
  %384 = fadd float %327, %358
  %385 = fadd float %328, %359
  %386 = fadd float %329, %365
  %387 = fadd float %330, %366
  %388 = fadd float %331, %367
  %389 = fadd float %332, %368
  %390 = fadd float %333, %374
  %391 = fadd float %334, %375
  %392 = fadd float %335, %376
  %393 = fadd float %336, %377
  %394 = fadd float %268, %378
  %395 = fadd float %269, %379
  %396 = fadd float %270, %380
  %397 = fadd float %271, %381
  %398 = fadd float %272, %382
  %399 = fadd float %273, %383
  %400 = fadd float %274, %384
  %401 = fadd float %275, %385
  %402 = fadd float %276, %386
  %403 = fadd float %277, %387
  %404 = fadd float %278, %388
  %405 = fadd float %279, %389
  %406 = fadd float %280, %390
  %407 = fadd float %281, %391
  %408 = fadd float %282, %392
  %409 = fadd float %283, %393
  %410 = fadd float %214, %394
  %411 = fadd float %215, %395
  %412 = fadd float %216, %396
  %413 = fadd float %217, %397
  %414 = fadd float %218, %398
  %415 = fadd float %219, %399
  %416 = fadd float %220, %400
  %417 = fadd float %221, %401
  %418 = fadd float %222, %402
  %419 = fadd float %223, %403
  %420 = fadd float %224, %404
  %421 = fadd float %225, %405
  %422 = fadd float %226, %406
  %423 = fadd float %227, %407
  %424 = fadd float %228, %408
  %425 = fadd float %229, %409
  %426 = fadd float %161, %410
  %427 = fadd float %162, %411
  %428 = fadd float %163, %412
  %429 = fadd float %164, %413
  %430 = fadd float %165, %414
  %431 = fadd float %166, %415
  %432 = fadd float %167, %416
  %433 = fadd float %168, %417
  %434 = fadd float %169, %418
  %435 = fadd float %170, %419
  %436 = fadd float %171, %420
  %437 = fadd float %172, %421
  %438 = fadd float %173, %422
  %439 = fadd float %174, %423
  %440 = fadd float %175, %424
  %441 = fadd float %176, %425
  %442 = fadd float %107, %426
  %443 = fadd float %108, %427
  %444 = fadd float %109, %428
  %445 = fadd float %110, %429
  %446 = fadd float %111, %430
  %447 = fadd float %112, %431
  %448 = fadd float %113, %432
  %449 = fadd float %114, %433
  %450 = fadd float %115, %434
  %451 = fadd float %116, %435
  %452 = fadd float %117, %436
  %453 = fadd float %118, %437
  %454 = fadd float %119, %438
  %455 = fadd float %120, %439
  %456 = fadd float %121, %440
  %457 = fadd float %122, %441
  %458 = fadd float %53, %442
  %459 = fadd float %54, %443
  %460 = fadd float %55, %444
  %461 = fadd float %56, %445
  %462 = fadd float %57, %446
  %463 = fadd float %58, %447
  %464 = fadd float %59, %448
  %465 = fadd float %60, %449
  %466 = fadd float %61, %450
  %467 = fadd float %62, %451
  %468 = fadd float %63, %452
  %469 = fadd float %64, %453
  %470 = fadd float %65, %454
  %471 = fadd float %66, %455
  %472 = fadd float %67, %456
  %473 = fadd float %68, %457
  %474 = fmul float %458, %458
  %475 = fmul float %459, %459
  %476 = fmul float %460, %460
  %477 = fmul float %461, %461
  %478 = fmul float %462, %462
  %479 = fmul float %463, %463
  %480 = fmul float %464, %464
  %481 = fmul float %465, %465
  %482 = fmul float %466, %466
  %483 = fmul float %467, %467
  %484 = fmul float %468, %468
  %485 = fmul float %469, %469
  %486 = fmul float %470, %470
  %487 = fmul float %471, %471
  %488 = fmul float %472, %472
  %489 = fmul float %473, %473
  %490 = fadd float %474, %475
  %491 = fadd float %476, %490
  %492 = fadd float %477, %491
  %493 = fadd float %478, %492
  %494 = fadd float %479, %493
  %495 = fadd float %480, %494
  %496 = fadd float %481, %495
  %497 = fadd float %482, %496
  %498 = fadd float %483, %497
  %499 = fadd float %484, %498
  %500 = fadd float %485, %499
  %501 = fadd float %486, %500
  %502 = fadd float %487, %501
  %503 = fadd float %488, %502
  %504 = fadd float %489, %503
  %505 = bitcast float %504 to i32
  %506 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %505, i32 16, i32 31)
  %507 = bitcast i32 %506 to float
  %508 = fadd float %504, %507
  %509 = bitcast float %508 to i32
  %510 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %509, i32 8, i32 31)
  %511 = bitcast i32 %510 to float
  %512 = fadd float %508, %511
  %513 = bitcast float %512 to i32
  %514 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %513, i32 4, i32 31)
  %515 = bitcast i32 %514 to float
  %516 = fadd float %512, %515
  %517 = bitcast float %516 to i32
  %518 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %517, i32 2, i32 31)
  %519 = bitcast i32 %518 to float
  %520 = fadd float %516, %519
  %521 = bitcast float %520 to i32
  %522 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %521, i32 1, i32 31)
  %523 = bitcast i32 %522 to float
  %524 = fadd float %520, %523
  %525 = icmp eq i32 %7, 0
  %526 = zext nneg i32 %8 to i64
  %527 = getelementptr float, ptr addrspace(3) @global_smem, i64 %526
  %528 = bitcast float %524 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %527, <1 x i32> %528, i1 %525) #9
  tail call void @llvm.nvvm.barrier0()
  %529 = icmp samesign ult i32 %6, 2
  %530 = zext nneg i32 %6 to i64
  %531 = getelementptr float, ptr addrspace(3) @global_smem, i64 %530
  %532 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %531, i1 %529) #9
  %533 = bitcast i32 %532 to float
  %534 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %532, i32 1, i32 31)
  %535 = bitcast i32 %534 to float
  %536 = fadd float %533, %535
  %537 = icmp eq i32 %6, 0
  %538 = bitcast float %536 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %531, <1 x i32> %538, i1 %537) #9
  tail call void @llvm.nvvm.barrier0()
  %539 = load float, ptr addrspace(3) @global_smem, align 16
  %540 = fmul float %539, 0x3F50000000000000
  %541 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %542 = bitcast i32 %541 to float
  %543 = fadd float %540, %542
  %544 = tail call float @llvm.nvvm.rsqrt.approx.f(float %543)
  %545 = fmul float %458, %544
  %546 = fmul float %459, %544
  %547 = fmul float %460, %544
  %548 = fmul float %461, %544
  %549 = fmul float %462, %544
  %550 = fmul float %463, %544
  %551 = fmul float %464, %544
  %552 = fmul float %465, %544
  %553 = fmul float %466, %544
  %554 = fmul float %467, %544
  %555 = fmul float %468, %544
  %556 = fmul float %469, %544
  %557 = fmul float %470, %544
  %558 = fmul float %471, %544
  %559 = fmul float %472, %544
  %560 = fmul float %473, %544
  %561 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %14
  %562 = getelementptr i8, ptr addrspace(1) %561, i64 1024
  %563 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #9
  %564 = extractvalue { i32, i32, i32, i32 } %563, 0
  %565 = bitcast i32 %564 to <2 x bfloat>
  %566 = extractvalue { i32, i32, i32, i32 } %563, 1
  %567 = bitcast i32 %566 to <2 x bfloat>
  %568 = extractvalue { i32, i32, i32, i32 } %563, 2
  %569 = bitcast i32 %568 to <2 x bfloat>
  %570 = extractvalue { i32, i32, i32, i32 } %563, 3
  %571 = bitcast i32 %570 to <2 x bfloat>
  %572 = extractelement <2 x bfloat> %565, i64 0
  %573 = extractelement <2 x bfloat> %565, i64 1
  %574 = extractelement <2 x bfloat> %567, i64 0
  %575 = extractelement <2 x bfloat> %567, i64 1
  %576 = extractelement <2 x bfloat> %569, i64 0
  %577 = extractelement <2 x bfloat> %569, i64 1
  %578 = extractelement <2 x bfloat> %571, i64 0
  %579 = extractelement <2 x bfloat> %571, i64 1
  %580 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %562) #9
  %581 = extractvalue { i32, i32, i32, i32 } %580, 0
  %582 = bitcast i32 %581 to <2 x bfloat>
  %583 = extractvalue { i32, i32, i32, i32 } %580, 1
  %584 = bitcast i32 %583 to <2 x bfloat>
  %585 = extractvalue { i32, i32, i32, i32 } %580, 2
  %586 = bitcast i32 %585 to <2 x bfloat>
  %587 = extractvalue { i32, i32, i32, i32 } %580, 3
  %588 = bitcast i32 %587 to <2 x bfloat>
  %589 = extractelement <2 x bfloat> %582, i64 0
  %590 = extractelement <2 x bfloat> %582, i64 1
  %591 = extractelement <2 x bfloat> %584, i64 0
  %592 = extractelement <2 x bfloat> %584, i64 1
  %593 = extractelement <2 x bfloat> %586, i64 0
  %594 = extractelement <2 x bfloat> %586, i64 1
  %595 = extractelement <2 x bfloat> %588, i64 0
  %596 = extractelement <2 x bfloat> %588, i64 1
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #9
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #9
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #9
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #9
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #9
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #9
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #9
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %579) #9
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #9
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #9
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #9
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #9
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #9
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #9
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #9
  %612 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %596) #9
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
  %627 = fmul float %559, %611
  %628 = fmul float %560, %612
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613) #9
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614) #9
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615) #9
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616) #9
  %633 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617) #9
  %634 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618) #9
  %635 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619) #9
  %636 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620) #9
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #9
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #9
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #9
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #9
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #9
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #9
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #9
  %644 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %628) #9
  %645 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %69
  %646 = getelementptr bfloat, ptr addrspace(1) %645, i64 %14
  %647 = getelementptr i8, ptr addrspace(1) %646, i64 1024
  %648 = insertelement <2 x bfloat> poison, bfloat %629, i64 0
  %649 = insertelement <2 x bfloat> %648, bfloat %630, i64 1
  %650 = bitcast <2 x bfloat> %649 to i32
  %651 = insertelement <2 x bfloat> poison, bfloat %631, i64 0
  %652 = insertelement <2 x bfloat> %651, bfloat %632, i64 1
  %653 = bitcast <2 x bfloat> %652 to i32
  %654 = insertelement <2 x bfloat> poison, bfloat %633, i64 0
  %655 = insertelement <2 x bfloat> %654, bfloat %634, i64 1
  %656 = bitcast <2 x bfloat> %655 to i32
  %657 = insertelement <2 x bfloat> poison, bfloat %635, i64 0
  %658 = insertelement <2 x bfloat> %657, bfloat %636, i64 1
  %659 = bitcast <2 x bfloat> %658 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %650, i32 %653, i32 %656, i32 %659, ptr addrspace(1) %646) #9
  %660 = insertelement <2 x bfloat> poison, bfloat %637, i64 0
  %661 = insertelement <2 x bfloat> %660, bfloat %638, i64 1
  %662 = bitcast <2 x bfloat> %661 to i32
  %663 = insertelement <2 x bfloat> poison, bfloat %639, i64 0
  %664 = insertelement <2 x bfloat> %663, bfloat %640, i64 1
  %665 = bitcast <2 x bfloat> %664 to i32
  %666 = insertelement <2 x bfloat> poison, bfloat %641, i64 0
  %667 = insertelement <2 x bfloat> %666, bfloat %642, i64 1
  %668 = bitcast <2 x bfloat> %667 to i32
  %669 = insertelement <2 x bfloat> poison, bfloat %643, i64 0
  %670 = insertelement <2 x bfloat> %669, bfloat %644, i64 1
  %671 = bitcast <2 x bfloat> %670 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %662, i32 %665, i32 %668, i32 %671, ptr addrspace(1) %647) #9
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_5(ptr noalias readonly align 128 captures(none) dereferenceable(917504) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias align 128 captures(none) dereferenceable(65536) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %15 = lshr i32 %14, 3
  %16 = shl nuw nsw i32 %14, 7
  %17 = and i32 %16, 896
  %18 = or disjoint i32 %17, %13
  %19 = or disjoint i32 %16, %13
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %20
  %22 = load bfloat, ptr addrspace(1) %21, align 2, !invariant.load !5
  %23 = fpext bfloat %22 to float
  %24 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %20
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = getelementptr inbounds bfloat, ptr addrspace(1) %7, i64 %20
  %27 = load bfloat, ptr addrspace(1) %26, align 2, !invariant.load !5
  %28 = mul nuw nsw i32 %15, 28672
  %29 = zext nneg i32 %18 to i64
  %30 = zext nneg i32 %28 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr bfloat, ptr addrspace(1) %12, i64 %31
  %33 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 10240
  %34 = load bfloat, ptr addrspace(1) %33, align 2, !invariant.load !5, !alias.scope !80
  %35 = fpext bfloat %34 to float
  %36 = fadd float %25, %23
  %37 = fpext bfloat %27 to float
  %38 = fadd float %36, %35
  %39 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %20
  %40 = load bfloat, ptr addrspace(1) %39, align 2, !invariant.load !5
  %41 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 8192
  %42 = load bfloat, ptr addrspace(1) %41, align 2, !invariant.load !5, !alias.scope !83
  %43 = fpext bfloat %42 to float
  %44 = fadd float %38, %37
  %45 = fpext bfloat %40 to float
  %46 = fadd float %44, %43
  %47 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %20
  %48 = load bfloat, ptr addrspace(1) %47, align 2, !invariant.load !5
  %49 = or disjoint i32 %18, %28
  %50 = zext nneg i32 %49 to i64
  %51 = getelementptr bfloat, ptr addrspace(1) %12, i64 %50
  %52 = getelementptr inbounds i8, ptr addrspace(1) %51, i64 6144
  %53 = load bfloat, ptr addrspace(1) %52, align 2, !invariant.load !5, !alias.scope !86
  %54 = fpext bfloat %53 to float
  %55 = fadd float %46, %45
  %56 = fpext bfloat %48 to float
  %57 = fadd float %55, %54
  %58 = getelementptr inbounds i8, ptr addrspace(1) %51, i64 4096
  %59 = load bfloat, ptr addrspace(1) %58, align 2, !invariant.load !5, !alias.scope !89
  %60 = fpext bfloat %59 to float
  %61 = fadd float %57, %56
  %62 = fadd float %61, %60
  store float %62, ptr addrspace(1) %24, align 4
  ret void
}

define ptx_kernel void @fusion_318(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %2, 28672
  %4 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 2048
  %6 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %7 = and i32 %6, 31
  %8 = lshr i32 %6, 5
  %9 = shl nuw nsw i32 %6, 3
  %10 = and i32 %9, 248
  %11 = icmp samesign ult i32 %6, 32
  %12 = select i1 %11, i32 0, i32 256
  %13 = or disjoint i32 %10, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr bfloat, ptr addrspace(1) %4, i64 %14
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 2048
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #9
  %20 = extractvalue { i32, i32, i32, i32 } %19, 0
  %21 = bitcast i32 %20 to <2 x bfloat>
  %22 = extractvalue { i32, i32, i32, i32 } %19, 1
  %23 = bitcast i32 %22 to <2 x bfloat>
  %24 = extractvalue { i32, i32, i32, i32 } %19, 2
  %25 = bitcast i32 %24 to <2 x bfloat>
  %26 = extractvalue { i32, i32, i32, i32 } %19, 3
  %27 = bitcast i32 %26 to <2 x bfloat>
  %28 = extractelement <2 x bfloat> %21, i64 0
  %29 = extractelement <2 x bfloat> %21, i64 1
  %30 = extractelement <2 x bfloat> %23, i64 0
  %31 = extractelement <2 x bfloat> %23, i64 1
  %32 = extractelement <2 x bfloat> %25, i64 0
  %33 = extractelement <2 x bfloat> %25, i64 1
  %34 = extractelement <2 x bfloat> %27, i64 0
  %35 = extractelement <2 x bfloat> %27, i64 1
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #9
  %37 = extractvalue { i32, i32, i32, i32 } %36, 0
  %38 = bitcast i32 %37 to <2 x bfloat>
  %39 = extractvalue { i32, i32, i32, i32 } %36, 1
  %40 = bitcast i32 %39 to <2 x bfloat>
  %41 = extractvalue { i32, i32, i32, i32 } %36, 2
  %42 = bitcast i32 %41 to <2 x bfloat>
  %43 = extractvalue { i32, i32, i32, i32 } %36, 3
  %44 = bitcast i32 %43 to <2 x bfloat>
  %45 = extractelement <2 x bfloat> %38, i64 0
  %46 = extractelement <2 x bfloat> %38, i64 1
  %47 = extractelement <2 x bfloat> %40, i64 0
  %48 = extractelement <2 x bfloat> %40, i64 1
  %49 = extractelement <2 x bfloat> %42, i64 0
  %50 = extractelement <2 x bfloat> %42, i64 1
  %51 = extractelement <2 x bfloat> %44, i64 0
  %52 = extractelement <2 x bfloat> %44, i64 1
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #9
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #9
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #9
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #9
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #9
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #9
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #9
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #9
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #9
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #9
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #9
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #9
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #9
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #9
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #9
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #9
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #9
  %74 = extractvalue { i32, i32, i32, i32 } %73, 0
  %75 = bitcast i32 %74 to <2 x bfloat>
  %76 = extractvalue { i32, i32, i32, i32 } %73, 1
  %77 = bitcast i32 %76 to <2 x bfloat>
  %78 = extractvalue { i32, i32, i32, i32 } %73, 2
  %79 = bitcast i32 %78 to <2 x bfloat>
  %80 = extractvalue { i32, i32, i32, i32 } %73, 3
  %81 = bitcast i32 %80 to <2 x bfloat>
  %82 = extractelement <2 x bfloat> %75, i64 0
  %83 = extractelement <2 x bfloat> %75, i64 1
  %84 = extractelement <2 x bfloat> %77, i64 0
  %85 = extractelement <2 x bfloat> %77, i64 1
  %86 = extractelement <2 x bfloat> %79, i64 0
  %87 = extractelement <2 x bfloat> %79, i64 1
  %88 = extractelement <2 x bfloat> %81, i64 0
  %89 = extractelement <2 x bfloat> %81, i64 1
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #9
  %91 = extractvalue { i32, i32, i32, i32 } %90, 0
  %92 = bitcast i32 %91 to <2 x bfloat>
  %93 = extractvalue { i32, i32, i32, i32 } %90, 1
  %94 = bitcast i32 %93 to <2 x bfloat>
  %95 = extractvalue { i32, i32, i32, i32 } %90, 2
  %96 = bitcast i32 %95 to <2 x bfloat>
  %97 = extractvalue { i32, i32, i32, i32 } %90, 3
  %98 = bitcast i32 %97 to <2 x bfloat>
  %99 = extractelement <2 x bfloat> %92, i64 0
  %100 = extractelement <2 x bfloat> %92, i64 1
  %101 = extractelement <2 x bfloat> %94, i64 0
  %102 = extractelement <2 x bfloat> %94, i64 1
  %103 = extractelement <2 x bfloat> %96, i64 0
  %104 = extractelement <2 x bfloat> %96, i64 1
  %105 = extractelement <2 x bfloat> %98, i64 0
  %106 = extractelement <2 x bfloat> %98, i64 1
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #9
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #9
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #9
  %123 = getelementptr float, ptr addrspace(1) %arg25, i64 %69
  %124 = getelementptr float, ptr addrspace(1) %123, i64 %14
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 16
  %126 = getelementptr i8, ptr addrspace(1) %124, i64 2048
  %127 = getelementptr i8, ptr addrspace(1) %124, i64 2064
  %128 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #9
  %129 = extractvalue { i32, i32, i32, i32 } %128, 0
  %130 = extractvalue { i32, i32, i32, i32 } %128, 1
  %131 = extractvalue { i32, i32, i32, i32 } %128, 2
  %132 = extractvalue { i32, i32, i32, i32 } %128, 3
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = bitcast i32 %132 to float
  %137 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #9
  %138 = extractvalue { i32, i32, i32, i32 } %137, 0
  %139 = extractvalue { i32, i32, i32, i32 } %137, 1
  %140 = extractvalue { i32, i32, i32, i32 } %137, 2
  %141 = extractvalue { i32, i32, i32, i32 } %137, 3
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = bitcast i32 %141 to float
  %146 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #9
  %147 = extractvalue { i32, i32, i32, i32 } %146, 0
  %148 = extractvalue { i32, i32, i32, i32 } %146, 1
  %149 = extractvalue { i32, i32, i32, i32 } %146, 2
  %150 = extractvalue { i32, i32, i32, i32 } %146, 3
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = bitcast i32 %150 to float
  %155 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %127) #9
  %156 = extractvalue { i32, i32, i32, i32 } %155, 0
  %157 = extractvalue { i32, i32, i32, i32 } %155, 1
  %158 = extractvalue { i32, i32, i32, i32 } %155, 2
  %159 = extractvalue { i32, i32, i32, i32 } %155, 3
  %160 = bitcast i32 %156 to float
  %161 = bitcast i32 %157 to float
  %162 = bitcast i32 %158 to float
  %163 = bitcast i32 %159 to float
  %164 = fadd float %107, %133
  %165 = fadd float %108, %134
  %166 = fadd float %109, %135
  %167 = fadd float %110, %136
  %168 = fadd float %111, %142
  %169 = fadd float %112, %143
  %170 = fadd float %113, %144
  %171 = fadd float %114, %145
  %172 = fadd float %115, %151
  %173 = fadd float %116, %152
  %174 = fadd float %117, %153
  %175 = fadd float %118, %154
  %176 = fadd float %119, %160
  %177 = fadd float %120, %161
  %178 = fadd float %121, %162
  %179 = fadd float %122, %163
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
  %195 = fadd float %68, %179
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
  %211 = fmul float %195, %195
  %212 = fadd float %196, %197
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
  %226 = fadd float %211, %225
  %227 = bitcast float %226 to i32
  %228 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %227, i32 16, i32 31)
  %229 = bitcast i32 %228 to float
  %230 = fadd float %226, %229
  %231 = bitcast float %230 to i32
  %232 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %231, i32 8, i32 31)
  %233 = bitcast i32 %232 to float
  %234 = fadd float %230, %233
  %235 = bitcast float %234 to i32
  %236 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %235, i32 4, i32 31)
  %237 = bitcast i32 %236 to float
  %238 = fadd float %234, %237
  %239 = bitcast float %238 to i32
  %240 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %239, i32 2, i32 31)
  %241 = bitcast i32 %240 to float
  %242 = fadd float %238, %241
  %243 = bitcast float %242 to i32
  %244 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %243, i32 1, i32 31)
  %245 = bitcast i32 %244 to float
  %246 = fadd float %242, %245
  %247 = icmp eq i32 %7, 0
  %248 = zext nneg i32 %8 to i64
  %249 = getelementptr float, ptr addrspace(3) @global_smem, i64 %248
  %250 = bitcast float %246 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %249, <1 x i32> %250, i1 %247) #9
  tail call void @llvm.nvvm.barrier0()
  %251 = icmp samesign ult i32 %6, 2
  %252 = zext nneg i32 %6 to i64
  %253 = getelementptr float, ptr addrspace(3) @global_smem, i64 %252
  %254 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %253, i1 %251) #9
  %255 = bitcast i32 %254 to float
  %256 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %254, i32 1, i32 31)
  %257 = bitcast i32 %256 to float
  %258 = fadd float %255, %257
  %259 = icmp eq i32 %6, 0
  %260 = bitcast float %258 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %253, <1 x i32> %260, i1 %259) #9
  tail call void @llvm.nvvm.barrier0()
  %261 = load float, ptr addrspace(3) @global_smem, align 16
  %262 = fmul float %261, 0x3F50000000000000
  %263 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %264 = bitcast i32 %263 to float
  %265 = fadd float %262, %264
  %266 = tail call float @llvm.nvvm.rsqrt.approx.f(float %265)
  %267 = fmul float %180, %266
  %268 = fmul float %181, %266
  %269 = fmul float %182, %266
  %270 = fmul float %183, %266
  %271 = fmul float %184, %266
  %272 = fmul float %185, %266
  %273 = fmul float %186, %266
  %274 = fmul float %187, %266
  %275 = fmul float %188, %266
  %276 = fmul float %189, %266
  %277 = fmul float %190, %266
  %278 = fmul float %191, %266
  %279 = fmul float %192, %266
  %280 = fmul float %193, %266
  %281 = fmul float %194, %266
  %282 = fmul float %195, %266
  %283 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %14
  %284 = getelementptr i8, ptr addrspace(1) %283, i64 1024
  %285 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
  %286 = extractvalue { i32, i32, i32, i32 } %285, 0
  %287 = bitcast i32 %286 to <2 x bfloat>
  %288 = extractvalue { i32, i32, i32, i32 } %285, 1
  %289 = bitcast i32 %288 to <2 x bfloat>
  %290 = extractvalue { i32, i32, i32, i32 } %285, 2
  %291 = bitcast i32 %290 to <2 x bfloat>
  %292 = extractvalue { i32, i32, i32, i32 } %285, 3
  %293 = bitcast i32 %292 to <2 x bfloat>
  %294 = extractelement <2 x bfloat> %287, i64 0
  %295 = extractelement <2 x bfloat> %287, i64 1
  %296 = extractelement <2 x bfloat> %289, i64 0
  %297 = extractelement <2 x bfloat> %289, i64 1
  %298 = extractelement <2 x bfloat> %291, i64 0
  %299 = extractelement <2 x bfloat> %291, i64 1
  %300 = extractelement <2 x bfloat> %293, i64 0
  %301 = extractelement <2 x bfloat> %293, i64 1
  %302 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
  %303 = extractvalue { i32, i32, i32, i32 } %302, 0
  %304 = bitcast i32 %303 to <2 x bfloat>
  %305 = extractvalue { i32, i32, i32, i32 } %302, 1
  %306 = bitcast i32 %305 to <2 x bfloat>
  %307 = extractvalue { i32, i32, i32, i32 } %302, 2
  %308 = bitcast i32 %307 to <2 x bfloat>
  %309 = extractvalue { i32, i32, i32, i32 } %302, 3
  %310 = bitcast i32 %309 to <2 x bfloat>
  %311 = extractelement <2 x bfloat> %304, i64 0
  %312 = extractelement <2 x bfloat> %304, i64 1
  %313 = extractelement <2 x bfloat> %306, i64 0
  %314 = extractelement <2 x bfloat> %306, i64 1
  %315 = extractelement <2 x bfloat> %308, i64 0
  %316 = extractelement <2 x bfloat> %308, i64 1
  %317 = extractelement <2 x bfloat> %310, i64 0
  %318 = extractelement <2 x bfloat> %310, i64 1
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #9
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #9
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #9
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #9
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #9
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #9
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #9
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #9
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #9
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #9
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #9
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #9
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #9
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #9
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #9
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #9
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
  %350 = fmul float %282, %334
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #9
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #9
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #9
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #9
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #9
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #9
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #9
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #9
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #9
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #9
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #9
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #9
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #9
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #9
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #9
  %366 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %350) #9
  %367 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %368 = getelementptr bfloat, ptr addrspace(1) %367, i64 %14
  %369 = getelementptr i8, ptr addrspace(1) %368, i64 1024
  %370 = insertelement <2 x bfloat> poison, bfloat %351, i64 0
  %371 = insertelement <2 x bfloat> %370, bfloat %352, i64 1
  %372 = bitcast <2 x bfloat> %371 to i32
  %373 = insertelement <2 x bfloat> poison, bfloat %353, i64 0
  %374 = insertelement <2 x bfloat> %373, bfloat %354, i64 1
  %375 = bitcast <2 x bfloat> %374 to i32
  %376 = insertelement <2 x bfloat> poison, bfloat %355, i64 0
  %377 = insertelement <2 x bfloat> %376, bfloat %356, i64 1
  %378 = bitcast <2 x bfloat> %377 to i32
  %379 = insertelement <2 x bfloat> poison, bfloat %357, i64 0
  %380 = insertelement <2 x bfloat> %379, bfloat %358, i64 1
  %381 = bitcast <2 x bfloat> %380 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %372, i32 %375, i32 %378, i32 %381, ptr addrspace(1) %368) #9
  %382 = insertelement <2 x bfloat> poison, bfloat %359, i64 0
  %383 = insertelement <2 x bfloat> %382, bfloat %360, i64 1
  %384 = bitcast <2 x bfloat> %383 to i32
  %385 = insertelement <2 x bfloat> poison, bfloat %361, i64 0
  %386 = insertelement <2 x bfloat> %385, bfloat %362, i64 1
  %387 = bitcast <2 x bfloat> %386 to i32
  %388 = insertelement <2 x bfloat> poison, bfloat %363, i64 0
  %389 = insertelement <2 x bfloat> %388, bfloat %364, i64 1
  %390 = bitcast <2 x bfloat> %389 to i32
  %391 = insertelement <2 x bfloat> poison, bfloat %365, i64 0
  %392 = insertelement <2 x bfloat> %391, bfloat %366, i64 1
  %393 = bitcast <2 x bfloat> %392 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %384, i32 %387, i32 %390, i32 %393, ptr addrspace(1) %369) #9
  ret void
}

define ptx_kernel void @fusion_316(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(917504) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %2, 28672
  %4 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
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
  %66 = shl nsw i64 %2, 10
  %67 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
  %71 = extractvalue { i32, i32, i32, i32 } %70, 0
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractvalue { i32, i32, i32, i32 } %70, 1
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %70, 2
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %70, 3
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractelement <2 x bfloat> %72, i64 0
  %80 = extractelement <2 x bfloat> %72, i64 1
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #9
  %88 = extractvalue { i32, i32, i32, i32 } %87, 0
  %89 = bitcast i32 %88 to <2 x bfloat>
  %90 = extractvalue { i32, i32, i32, i32 } %87, 1
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %87, 2
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %87, 3
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractelement <2 x bfloat> %89, i64 0
  %97 = extractelement <2 x bfloat> %89, i64 1
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = getelementptr i8, ptr addrspace(1) %4, i64 2048
  %121 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %122 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 1024
  %124 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
  %125 = extractvalue { i32, i32, i32, i32 } %124, 0
  %126 = bitcast i32 %125 to <2 x bfloat>
  %127 = extractvalue { i32, i32, i32, i32 } %124, 1
  %128 = bitcast i32 %127 to <2 x bfloat>
  %129 = extractvalue { i32, i32, i32, i32 } %124, 2
  %130 = bitcast i32 %129 to <2 x bfloat>
  %131 = extractvalue { i32, i32, i32, i32 } %124, 3
  %132 = bitcast i32 %131 to <2 x bfloat>
  %133 = extractelement <2 x bfloat> %126, i64 0
  %134 = extractelement <2 x bfloat> %126, i64 1
  %135 = extractelement <2 x bfloat> %128, i64 0
  %136 = extractelement <2 x bfloat> %128, i64 1
  %137 = extractelement <2 x bfloat> %130, i64 0
  %138 = extractelement <2 x bfloat> %130, i64 1
  %139 = extractelement <2 x bfloat> %132, i64 0
  %140 = extractelement <2 x bfloat> %132, i64 1
  %141 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #9
  %142 = extractvalue { i32, i32, i32, i32 } %141, 0
  %143 = bitcast i32 %142 to <2 x bfloat>
  %144 = extractvalue { i32, i32, i32, i32 } %141, 1
  %145 = bitcast i32 %144 to <2 x bfloat>
  %146 = extractvalue { i32, i32, i32, i32 } %141, 2
  %147 = bitcast i32 %146 to <2 x bfloat>
  %148 = extractvalue { i32, i32, i32, i32 } %141, 3
  %149 = bitcast i32 %148 to <2 x bfloat>
  %150 = extractelement <2 x bfloat> %143, i64 0
  %151 = extractelement <2 x bfloat> %143, i64 1
  %152 = extractelement <2 x bfloat> %145, i64 0
  %153 = extractelement <2 x bfloat> %145, i64 1
  %154 = extractelement <2 x bfloat> %147, i64 0
  %155 = extractelement <2 x bfloat> %147, i64 1
  %156 = extractelement <2 x bfloat> %149, i64 0
  %157 = extractelement <2 x bfloat> %149, i64 1
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #9
  %174 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %66
  %175 = getelementptr bfloat, ptr addrspace(1) %174, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #9
  %178 = extractvalue { i32, i32, i32, i32 } %177, 0
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractvalue { i32, i32, i32, i32 } %177, 1
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %177, 2
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %177, 3
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractelement <2 x bfloat> %179, i64 0
  %187 = extractelement <2 x bfloat> %179, i64 1
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #9
  %195 = extractvalue { i32, i32, i32, i32 } %194, 0
  %196 = bitcast i32 %195 to <2 x bfloat>
  %197 = extractvalue { i32, i32, i32, i32 } %194, 1
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %194, 2
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %194, 3
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractelement <2 x bfloat> %196, i64 0
  %204 = extractelement <2 x bfloat> %196, i64 1
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = getelementptr float, ptr addrspace(1) %arg25, i64 %66
  %228 = getelementptr float, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 16
  %230 = getelementptr i8, ptr addrspace(1) %228, i64 2048
  %231 = getelementptr i8, ptr addrspace(1) %228, i64 2064
  %232 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #9
  %233 = extractvalue { i32, i32, i32, i32 } %232, 0
  %234 = extractvalue { i32, i32, i32, i32 } %232, 1
  %235 = extractvalue { i32, i32, i32, i32 } %232, 2
  %236 = extractvalue { i32, i32, i32, i32 } %232, 3
  %237 = bitcast i32 %233 to float
  %238 = bitcast i32 %234 to float
  %239 = bitcast i32 %235 to float
  %240 = bitcast i32 %236 to float
  %241 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #9
  %242 = extractvalue { i32, i32, i32, i32 } %241, 0
  %243 = extractvalue { i32, i32, i32, i32 } %241, 1
  %244 = extractvalue { i32, i32, i32, i32 } %241, 2
  %245 = extractvalue { i32, i32, i32, i32 } %241, 3
  %246 = bitcast i32 %242 to float
  %247 = bitcast i32 %243 to float
  %248 = bitcast i32 %244 to float
  %249 = bitcast i32 %245 to float
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #9
  %251 = extractvalue { i32, i32, i32, i32 } %250, 0
  %252 = extractvalue { i32, i32, i32, i32 } %250, 1
  %253 = extractvalue { i32, i32, i32, i32 } %250, 2
  %254 = extractvalue { i32, i32, i32, i32 } %250, 3
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = bitcast i32 %254 to float
  %259 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #9
  %260 = extractvalue { i32, i32, i32, i32 } %259, 0
  %261 = extractvalue { i32, i32, i32, i32 } %259, 1
  %262 = extractvalue { i32, i32, i32, i32 } %259, 2
  %263 = extractvalue { i32, i32, i32, i32 } %259, 3
  %264 = bitcast i32 %260 to float
  %265 = bitcast i32 %261 to float
  %266 = bitcast i32 %262 to float
  %267 = bitcast i32 %263 to float
  %268 = fadd float %211, %237
  %269 = fadd float %212, %238
  %270 = fadd float %213, %239
  %271 = fadd float %214, %240
  %272 = fadd float %215, %246
  %273 = fadd float %216, %247
  %274 = fadd float %217, %248
  %275 = fadd float %218, %249
  %276 = fadd float %219, %255
  %277 = fadd float %220, %256
  %278 = fadd float %221, %257
  %279 = fadd float %222, %258
  %280 = fadd float %223, %264
  %281 = fadd float %224, %265
  %282 = fadd float %225, %266
  %283 = fadd float %226, %267
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
  %299 = fadd float %173, %283
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
  %315 = fadd float %119, %299
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
  %331 = fadd float %65, %315
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
  %347 = fmul float %331, %331
  %348 = fadd float %332, %333
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
  %362 = fadd float %347, %361
  %363 = bitcast float %362 to i32
  %364 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %363, i32 16, i32 31)
  %365 = bitcast i32 %364 to float
  %366 = fadd float %362, %365
  %367 = bitcast float %366 to i32
  %368 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %367, i32 8, i32 31)
  %369 = bitcast i32 %368 to float
  %370 = fadd float %366, %369
  %371 = bitcast float %370 to i32
  %372 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %371, i32 4, i32 31)
  %373 = bitcast i32 %372 to float
  %374 = fadd float %370, %373
  %375 = bitcast float %374 to i32
  %376 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %375, i32 2, i32 31)
  %377 = bitcast i32 %376 to float
  %378 = fadd float %374, %377
  %379 = bitcast float %378 to i32
  %380 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %379, i32 1, i32 31)
  %381 = bitcast i32 %380 to float
  %382 = fadd float %378, %381
  %383 = icmp eq i32 %6, 0
  %384 = zext nneg i32 %7 to i64
  %385 = getelementptr float, ptr addrspace(3) @global_smem, i64 %384
  %386 = bitcast float %382 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %385, <1 x i32> %386, i1 %383) #9
  tail call void @llvm.nvvm.barrier0()
  %387 = icmp samesign ult i32 %5, 2
  %388 = zext nneg i32 %5 to i64
  %389 = getelementptr float, ptr addrspace(3) @global_smem, i64 %388
  %390 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %389, i1 %387) #9
  %391 = bitcast i32 %390 to float
  %392 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %390, i32 1, i32 31)
  %393 = bitcast i32 %392 to float
  %394 = fadd float %391, %393
  %395 = icmp eq i32 %5, 0
  %396 = bitcast float %394 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %389, <1 x i32> %396, i1 %395) #9
  tail call void @llvm.nvvm.barrier0()
  %397 = load float, ptr addrspace(3) @global_smem, align 16
  %398 = fmul float %397, 0x3F50000000000000
  %399 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %400 = bitcast i32 %399 to float
  %401 = fadd float %398, %400
  %402 = tail call float @llvm.nvvm.rsqrt.approx.f(float %401)
  %403 = fmul float %316, %402
  %404 = fmul float %317, %402
  %405 = fmul float %318, %402
  %406 = fmul float %319, %402
  %407 = fmul float %320, %402
  %408 = fmul float %321, %402
  %409 = fmul float %322, %402
  %410 = fmul float %323, %402
  %411 = fmul float %324, %402
  %412 = fmul float %325, %402
  %413 = fmul float %326, %402
  %414 = fmul float %327, %402
  %415 = fmul float %328, %402
  %416 = fmul float %329, %402
  %417 = fmul float %330, %402
  %418 = fmul float %331, %402
  %419 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %420 = getelementptr i8, ptr addrspace(1) %419, i64 1024
  %421 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %419) #9
  %422 = extractvalue { i32, i32, i32, i32 } %421, 0
  %423 = bitcast i32 %422 to <2 x bfloat>
  %424 = extractvalue { i32, i32, i32, i32 } %421, 1
  %425 = bitcast i32 %424 to <2 x bfloat>
  %426 = extractvalue { i32, i32, i32, i32 } %421, 2
  %427 = bitcast i32 %426 to <2 x bfloat>
  %428 = extractvalue { i32, i32, i32, i32 } %421, 3
  %429 = bitcast i32 %428 to <2 x bfloat>
  %430 = extractelement <2 x bfloat> %423, i64 0
  %431 = extractelement <2 x bfloat> %423, i64 1
  %432 = extractelement <2 x bfloat> %425, i64 0
  %433 = extractelement <2 x bfloat> %425, i64 1
  %434 = extractelement <2 x bfloat> %427, i64 0
  %435 = extractelement <2 x bfloat> %427, i64 1
  %436 = extractelement <2 x bfloat> %429, i64 0
  %437 = extractelement <2 x bfloat> %429, i64 1
  %438 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %420) #9
  %439 = extractvalue { i32, i32, i32, i32 } %438, 0
  %440 = bitcast i32 %439 to <2 x bfloat>
  %441 = extractvalue { i32, i32, i32, i32 } %438, 1
  %442 = bitcast i32 %441 to <2 x bfloat>
  %443 = extractvalue { i32, i32, i32, i32 } %438, 2
  %444 = bitcast i32 %443 to <2 x bfloat>
  %445 = extractvalue { i32, i32, i32, i32 } %438, 3
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractelement <2 x bfloat> %440, i64 0
  %448 = extractelement <2 x bfloat> %440, i64 1
  %449 = extractelement <2 x bfloat> %442, i64 0
  %450 = extractelement <2 x bfloat> %442, i64 1
  %451 = extractelement <2 x bfloat> %444, i64 0
  %452 = extractelement <2 x bfloat> %444, i64 1
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430) #9
  %456 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #9
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #9
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #9
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #9
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #9
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #9
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #9
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447) #9
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448) #9
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #9
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #9
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #9
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #9
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #9
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #9
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
  %486 = fmul float %418, %470
  %487 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %471) #9
  %488 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %472) #9
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #9
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #9
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #9
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #9
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #9
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #9
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #9
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #9
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #9
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #9
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #9
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #9
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #9
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #9
  %503 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %66
  %504 = getelementptr bfloat, ptr addrspace(1) %503, i64 %13
  %505 = getelementptr i8, ptr addrspace(1) %504, i64 1024
  %506 = insertelement <2 x bfloat> poison, bfloat %487, i64 0
  %507 = insertelement <2 x bfloat> %506, bfloat %488, i64 1
  %508 = bitcast <2 x bfloat> %507 to i32
  %509 = insertelement <2 x bfloat> poison, bfloat %489, i64 0
  %510 = insertelement <2 x bfloat> %509, bfloat %490, i64 1
  %511 = bitcast <2 x bfloat> %510 to i32
  %512 = insertelement <2 x bfloat> poison, bfloat %491, i64 0
  %513 = insertelement <2 x bfloat> %512, bfloat %492, i64 1
  %514 = bitcast <2 x bfloat> %513 to i32
  %515 = insertelement <2 x bfloat> poison, bfloat %493, i64 0
  %516 = insertelement <2 x bfloat> %515, bfloat %494, i64 1
  %517 = bitcast <2 x bfloat> %516 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %508, i32 %511, i32 %514, i32 %517, ptr addrspace(1) %504) #9
  %518 = insertelement <2 x bfloat> poison, bfloat %495, i64 0
  %519 = insertelement <2 x bfloat> %518, bfloat %496, i64 1
  %520 = bitcast <2 x bfloat> %519 to i32
  %521 = insertelement <2 x bfloat> poison, bfloat %497, i64 0
  %522 = insertelement <2 x bfloat> %521, bfloat %498, i64 1
  %523 = bitcast <2 x bfloat> %522 to i32
  %524 = insertelement <2 x bfloat> poison, bfloat %499, i64 0
  %525 = insertelement <2 x bfloat> %524, bfloat %500, i64 1
  %526 = bitcast <2 x bfloat> %525 to i32
  %527 = insertelement <2 x bfloat> poison, bfloat %501, i64 0
  %528 = insertelement <2 x bfloat> %527, bfloat %502, i64 1
  %529 = bitcast <2 x bfloat> %528 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %520, i32 %523, i32 %526, i32 %529, ptr addrspace(1) %505) #9
  ret void
}

define ptx_kernel void @fusion_314(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(917504) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #9
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
  %66 = mul nsw i64 %2, 28672
  %67 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #9
  %71 = extractvalue { i32, i32, i32, i32 } %70, 0
  %72 = bitcast i32 %71 to <2 x bfloat>
  %73 = extractvalue { i32, i32, i32, i32 } %70, 1
  %74 = bitcast i32 %73 to <2 x bfloat>
  %75 = extractvalue { i32, i32, i32, i32 } %70, 2
  %76 = bitcast i32 %75 to <2 x bfloat>
  %77 = extractvalue { i32, i32, i32, i32 } %70, 3
  %78 = bitcast i32 %77 to <2 x bfloat>
  %79 = extractelement <2 x bfloat> %72, i64 0
  %80 = extractelement <2 x bfloat> %72, i64 1
  %81 = extractelement <2 x bfloat> %74, i64 0
  %82 = extractelement <2 x bfloat> %74, i64 1
  %83 = extractelement <2 x bfloat> %76, i64 0
  %84 = extractelement <2 x bfloat> %76, i64 1
  %85 = extractelement <2 x bfloat> %78, i64 0
  %86 = extractelement <2 x bfloat> %78, i64 1
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #9
  %88 = extractvalue { i32, i32, i32, i32 } %87, 0
  %89 = bitcast i32 %88 to <2 x bfloat>
  %90 = extractvalue { i32, i32, i32, i32 } %87, 1
  %91 = bitcast i32 %90 to <2 x bfloat>
  %92 = extractvalue { i32, i32, i32, i32 } %87, 2
  %93 = bitcast i32 %92 to <2 x bfloat>
  %94 = extractvalue { i32, i32, i32, i32 } %87, 3
  %95 = bitcast i32 %94 to <2 x bfloat>
  %96 = extractelement <2 x bfloat> %89, i64 0
  %97 = extractelement <2 x bfloat> %89, i64 1
  %98 = extractelement <2 x bfloat> %91, i64 0
  %99 = extractelement <2 x bfloat> %91, i64 1
  %100 = extractelement <2 x bfloat> %93, i64 0
  %101 = extractelement <2 x bfloat> %93, i64 1
  %102 = extractelement <2 x bfloat> %95, i64 0
  %103 = extractelement <2 x bfloat> %95, i64 1
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #9
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #9
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #9
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #9
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #9
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #9
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #9
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #9
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #9
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #9
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #9
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #9
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #9
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #9
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #9
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #9
  %120 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %121 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #9
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
  %140 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %122) #9
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
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #9
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #9
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #9
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #9
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #9
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #9
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #9
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #9
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #9
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #9
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #9
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #9
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #9
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #9
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #9
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #9
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr i8, ptr addrspace(1) %68, i64 2048
  %175 = getelementptr bfloat, ptr addrspace(1) %173, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #9
  %178 = extractvalue { i32, i32, i32, i32 } %177, 0
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractvalue { i32, i32, i32, i32 } %177, 1
  %181 = bitcast i32 %180 to <2 x bfloat>
  %182 = extractvalue { i32, i32, i32, i32 } %177, 2
  %183 = bitcast i32 %182 to <2 x bfloat>
  %184 = extractvalue { i32, i32, i32, i32 } %177, 3
  %185 = bitcast i32 %184 to <2 x bfloat>
  %186 = extractelement <2 x bfloat> %179, i64 0
  %187 = extractelement <2 x bfloat> %179, i64 1
  %188 = extractelement <2 x bfloat> %181, i64 0
  %189 = extractelement <2 x bfloat> %181, i64 1
  %190 = extractelement <2 x bfloat> %183, i64 0
  %191 = extractelement <2 x bfloat> %183, i64 1
  %192 = extractelement <2 x bfloat> %185, i64 0
  %193 = extractelement <2 x bfloat> %185, i64 1
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #9
  %195 = extractvalue { i32, i32, i32, i32 } %194, 0
  %196 = bitcast i32 %195 to <2 x bfloat>
  %197 = extractvalue { i32, i32, i32, i32 } %194, 1
  %198 = bitcast i32 %197 to <2 x bfloat>
  %199 = extractvalue { i32, i32, i32, i32 } %194, 2
  %200 = bitcast i32 %199 to <2 x bfloat>
  %201 = extractvalue { i32, i32, i32, i32 } %194, 3
  %202 = bitcast i32 %201 to <2 x bfloat>
  %203 = extractelement <2 x bfloat> %196, i64 0
  %204 = extractelement <2 x bfloat> %196, i64 1
  %205 = extractelement <2 x bfloat> %198, i64 0
  %206 = extractelement <2 x bfloat> %198, i64 1
  %207 = extractelement <2 x bfloat> %200, i64 0
  %208 = extractelement <2 x bfloat> %200, i64 1
  %209 = extractelement <2 x bfloat> %202, i64 0
  %210 = extractelement <2 x bfloat> %202, i64 1
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #9
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #9
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #9
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #9
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #9
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #9
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #9
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #9
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #9
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #9
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #9
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #9
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #9
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #9
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #9
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #9
  %227 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %228 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 1024
  %230 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #9
  %231 = extractvalue { i32, i32, i32, i32 } %230, 0
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %230, 1
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %230, 2
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractvalue { i32, i32, i32, i32 } %230, 3
  %238 = bitcast i32 %237 to <2 x bfloat>
  %239 = extractelement <2 x bfloat> %232, i64 0
  %240 = extractelement <2 x bfloat> %232, i64 1
  %241 = extractelement <2 x bfloat> %234, i64 0
  %242 = extractelement <2 x bfloat> %234, i64 1
  %243 = extractelement <2 x bfloat> %236, i64 0
  %244 = extractelement <2 x bfloat> %236, i64 1
  %245 = extractelement <2 x bfloat> %238, i64 0
  %246 = extractelement <2 x bfloat> %238, i64 1
  %247 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #9
  %248 = extractvalue { i32, i32, i32, i32 } %247, 0
  %249 = bitcast i32 %248 to <2 x bfloat>
  %250 = extractvalue { i32, i32, i32, i32 } %247, 1
  %251 = bitcast i32 %250 to <2 x bfloat>
  %252 = extractvalue { i32, i32, i32, i32 } %247, 2
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractvalue { i32, i32, i32, i32 } %247, 3
  %255 = bitcast i32 %254 to <2 x bfloat>
  %256 = extractelement <2 x bfloat> %249, i64 0
  %257 = extractelement <2 x bfloat> %249, i64 1
  %258 = extractelement <2 x bfloat> %251, i64 0
  %259 = extractelement <2 x bfloat> %251, i64 1
  %260 = extractelement <2 x bfloat> %253, i64 0
  %261 = extractelement <2 x bfloat> %253, i64 1
  %262 = extractelement <2 x bfloat> %255, i64 0
  %263 = extractelement <2 x bfloat> %255, i64 1
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #9
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #9
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #9
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #9
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #9
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #9
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #9
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #9
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #9
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #9
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #9
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #9
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #9
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #9
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #9
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #9
  %280 = getelementptr float, ptr addrspace(1) %arg37, i64 %3
  %281 = getelementptr float, ptr addrspace(1) %280, i64 %13
  %282 = getelementptr i8, ptr addrspace(1) %281, i64 16
  %283 = getelementptr i8, ptr addrspace(1) %281, i64 2048
  %284 = getelementptr i8, ptr addrspace(1) %281, i64 2064
  %285 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #9
  %286 = extractvalue { i32, i32, i32, i32 } %285, 0
  %287 = extractvalue { i32, i32, i32, i32 } %285, 1
  %288 = extractvalue { i32, i32, i32, i32 } %285, 2
  %289 = extractvalue { i32, i32, i32, i32 } %285, 3
  %290 = bitcast i32 %286 to float
  %291 = bitcast i32 %287 to float
  %292 = bitcast i32 %288 to float
  %293 = bitcast i32 %289 to float
  %294 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #9
  %295 = extractvalue { i32, i32, i32, i32 } %294, 0
  %296 = extractvalue { i32, i32, i32, i32 } %294, 1
  %297 = extractvalue { i32, i32, i32, i32 } %294, 2
  %298 = extractvalue { i32, i32, i32, i32 } %294, 3
  %299 = bitcast i32 %295 to float
  %300 = bitcast i32 %296 to float
  %301 = bitcast i32 %297 to float
  %302 = bitcast i32 %298 to float
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #9
  %304 = extractvalue { i32, i32, i32, i32 } %303, 0
  %305 = extractvalue { i32, i32, i32, i32 } %303, 1
  %306 = extractvalue { i32, i32, i32, i32 } %303, 2
  %307 = extractvalue { i32, i32, i32, i32 } %303, 3
  %308 = bitcast i32 %304 to float
  %309 = bitcast i32 %305 to float
  %310 = bitcast i32 %306 to float
  %311 = bitcast i32 %307 to float
  %312 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #9
  %313 = extractvalue { i32, i32, i32, i32 } %312, 0
  %314 = extractvalue { i32, i32, i32, i32 } %312, 1
  %315 = extractvalue { i32, i32, i32, i32 } %312, 2
  %316 = extractvalue { i32, i32, i32, i32 } %312, 3
  %317 = bitcast i32 %313 to float
  %318 = bitcast i32 %314 to float
  %319 = bitcast i32 %315 to float
  %320 = bitcast i32 %316 to float
  %321 = fadd float %264, %290
  %322 = fadd float %265, %291
  %323 = fadd float %266, %292
  %324 = fadd float %267, %293
  %325 = fadd float %268, %299
  %326 = fadd float %269, %300
  %327 = fadd float %270, %301
  %328 = fadd float %271, %302
  %329 = fadd float %272, %308
  %330 = fadd float %273, %309
  %331 = fadd float %274, %310
  %332 = fadd float %275, %311
  %333 = fadd float %276, %317
  %334 = fadd float %277, %318
  %335 = fadd float %278, %319
  %336 = fadd float %279, %320
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
  %352 = fadd float %226, %336
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
  %368 = fadd float %172, %352
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
  %384 = fadd float %119, %368
  %385 = fadd float %50, %369
  %386 = fadd float %51, %370
  %387 = fadd float %52, %371
  %388 = fadd float %53, %372
  %389 = fadd float %54, %373
  %390 = fadd float %55, %374
  %391 = fadd float %56, %375
  %392 = fadd float %57, %376
  %393 = fadd float %58, %377
  %394 = fadd float %59, %378
  %395 = fadd float %60, %379
  %396 = fadd float %61, %380
  %397 = fadd float %62, %381
  %398 = fadd float %63, %382
  %399 = fadd float %64, %383
  %400 = fadd float %65, %384
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
  %431 = fadd float %416, %430
  %432 = bitcast float %431 to i32
  %433 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %432, i32 16, i32 31)
  %434 = bitcast i32 %433 to float
  %435 = fadd float %431, %434
  %436 = bitcast float %435 to i32
  %437 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %436, i32 8, i32 31)
  %438 = bitcast i32 %437 to float
  %439 = fadd float %435, %438
  %440 = bitcast float %439 to i32
  %441 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %440, i32 4, i32 31)
  %442 = bitcast i32 %441 to float
  %443 = fadd float %439, %442
  %444 = bitcast float %443 to i32
  %445 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %444, i32 2, i32 31)
  %446 = bitcast i32 %445 to float
  %447 = fadd float %443, %446
  %448 = bitcast float %447 to i32
  %449 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %448, i32 1, i32 31)
  %450 = bitcast i32 %449 to float
  %451 = fadd float %447, %450
  %452 = icmp eq i32 %6, 0
  %453 = zext nneg i32 %7 to i64
  %454 = getelementptr float, ptr addrspace(3) @global_smem, i64 %453
  %455 = bitcast float %451 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %454, <1 x i32> %455, i1 %452) #9
  tail call void @llvm.nvvm.barrier0()
  %456 = icmp samesign ult i32 %5, 2
  %457 = zext nneg i32 %5 to i64
  %458 = getelementptr float, ptr addrspace(3) @global_smem, i64 %457
  %459 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %458, i1 %456) #9
  %460 = bitcast i32 %459 to float
  %461 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %459, i32 1, i32 31)
  %462 = bitcast i32 %461 to float
  %463 = fadd float %460, %462
  %464 = icmp eq i32 %5, 0
  %465 = bitcast float %463 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %458, <1 x i32> %465, i1 %464) #9
  tail call void @llvm.nvvm.barrier0()
  %466 = load float, ptr addrspace(3) @global_smem, align 16
  %467 = fmul float %466, 0x3F50000000000000
  %468 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #9
  %469 = bitcast i32 %468 to float
  %470 = fadd float %467, %469
  %471 = tail call float @llvm.nvvm.rsqrt.approx.f(float %470)
  %472 = fmul float %385, %471
  %473 = fmul float %386, %471
  %474 = fmul float %387, %471
  %475 = fmul float %388, %471
  %476 = fmul float %389, %471
  %477 = fmul float %390, %471
  %478 = fmul float %391, %471
  %479 = fmul float %392, %471
  %480 = fmul float %393, %471
  %481 = fmul float %394, %471
  %482 = fmul float %395, %471
  %483 = fmul float %396, %471
  %484 = fmul float %397, %471
  %485 = fmul float %398, %471
  %486 = fmul float %399, %471
  %487 = fmul float %400, %471
  %488 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %489 = getelementptr i8, ptr addrspace(1) %488, i64 1024
  %490 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %488) #9
  %491 = extractvalue { i32, i32, i32, i32 } %490, 0
  %492 = bitcast i32 %491 to <2 x bfloat>
  %493 = extractvalue { i32, i32, i32, i32 } %490, 1
  %494 = bitcast i32 %493 to <2 x bfloat>
  %495 = extractvalue { i32, i32, i32, i32 } %490, 2
  %496 = bitcast i32 %495 to <2 x bfloat>
  %497 = extractvalue { i32, i32, i32, i32 } %490, 3
  %498 = bitcast i32 %497 to <2 x bfloat>
  %499 = extractelement <2 x bfloat> %492, i64 0
  %500 = extractelement <2 x bfloat> %492, i64 1
  %501 = extractelement <2 x bfloat> %494, i64 0
  %502 = extractelement <2 x bfloat> %494, i64 1
  %503 = extractelement <2 x bfloat> %496, i64 0
  %504 = extractelement <2 x bfloat> %496, i64 1
  %505 = extractelement <2 x bfloat> %498, i64 0
  %506 = extractelement <2 x bfloat> %498, i64 1
  %507 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %489) #9
  %508 = extractvalue { i32, i32, i32, i32 } %507, 0
  %509 = bitcast i32 %508 to <2 x bfloat>
  %510 = extractvalue { i32, i32, i32, i32 } %507, 1
  %511 = bitcast i32 %510 to <2 x bfloat>
  %512 = extractvalue { i32, i32, i32, i32 } %507, 2
  %513 = bitcast i32 %512 to <2 x bfloat>
  %514 = extractvalue { i32, i32, i32, i32 } %507, 3
  %515 = bitcast i32 %514 to <2 x bfloat>
  %516 = extractelement <2 x bfloat> %509, i64 0
  %517 = extractelement <2 x bfloat> %509, i64 1
  %518 = extractelement <2 x bfloat> %511, i64 0
  %519 = extractelement <2 x bfloat> %511, i64 1
  %520 = extractelement <2 x bfloat> %513, i64 0
  %521 = extractelement <2 x bfloat> %513, i64 1
  %522 = extractelement <2 x bfloat> %515, i64 0
  %523 = extractelement <2 x bfloat> %515, i64 1
  %524 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499) #9
  %525 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500) #9
  %526 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501) #9
  %527 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502) #9
  %528 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503) #9
  %529 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504) #9
  %530 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505) #9
  %531 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %506) #9
  %532 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #9
  %533 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #9
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #9
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #9
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #9
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #9
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #9
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %523) #9
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
  %555 = fmul float %487, %539
  %556 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %540) #9
  %557 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541) #9
  %558 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542) #9
  %559 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543) #9
  %560 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544) #9
  %561 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545) #9
  %562 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546) #9
  %563 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %547) #9
  %564 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %548) #9
  %565 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %549) #9
  %566 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550) #9
  %567 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551) #9
  %568 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552) #9
  %569 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553) #9
  %570 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554) #9
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #9
  %572 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %3
  %573 = getelementptr bfloat, ptr addrspace(1) %572, i64 %13
  %574 = getelementptr i8, ptr addrspace(1) %573, i64 1024
  %575 = insertelement <2 x bfloat> poison, bfloat %556, i64 0
  %576 = insertelement <2 x bfloat> %575, bfloat %557, i64 1
  %577 = bitcast <2 x bfloat> %576 to i32
  %578 = insertelement <2 x bfloat> poison, bfloat %558, i64 0
  %579 = insertelement <2 x bfloat> %578, bfloat %559, i64 1
  %580 = bitcast <2 x bfloat> %579 to i32
  %581 = insertelement <2 x bfloat> poison, bfloat %560, i64 0
  %582 = insertelement <2 x bfloat> %581, bfloat %561, i64 1
  %583 = bitcast <2 x bfloat> %582 to i32
  %584 = insertelement <2 x bfloat> poison, bfloat %562, i64 0
  %585 = insertelement <2 x bfloat> %584, bfloat %563, i64 1
  %586 = bitcast <2 x bfloat> %585 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %577, i32 %580, i32 %583, i32 %586, ptr addrspace(1) %573) #9
  %587 = insertelement <2 x bfloat> poison, bfloat %564, i64 0
  %588 = insertelement <2 x bfloat> %587, bfloat %565, i64 1
  %589 = bitcast <2 x bfloat> %588 to i32
  %590 = insertelement <2 x bfloat> poison, bfloat %566, i64 0
  %591 = insertelement <2 x bfloat> %590, bfloat %567, i64 1
  %592 = bitcast <2 x bfloat> %591 to i32
  %593 = insertelement <2 x bfloat> poison, bfloat %568, i64 0
  %594 = insertelement <2 x bfloat> %593, bfloat %569, i64 1
  %595 = bitcast <2 x bfloat> %594 to i32
  %596 = insertelement <2 x bfloat> poison, bfloat %570, i64 0
  %597 = insertelement <2 x bfloat> %596, bfloat %571, i64 1
  %598 = bitcast <2 x bfloat> %597 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %589, i32 %592, i32 %595, i32 %598, ptr addrspace(1) %574) #9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.rsqrt.approx.f(float) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) "nvvm.reqntid"="128,1,1" }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { "nvvm.reqntid"="128,1,1" }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { "nvvm.reqntid"="64,1,1" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 0, i32 128}
!5 = !{}
!6 = !{i32 0, i32 458752}
!7 = !{i32 0, i32 384}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_27_param_0_1150: argument 0"}
!10 = distinct !{!10, !"fused_convert_27_param_0_1150"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_27_param_0_1150: argument 0"}
!13 = distinct !{!13, !"fused_convert_27_param_0_1150"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_add_convert_1256_40: argument 0"}
!16 = distinct !{!16, !"fused_add_convert_1256_40"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"fused_add_convert_1256_40: argument 0"}
!19 = distinct !{!19, !"fused_add_convert_1256_40"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"fused_add_convert_1256_40: argument 0"}
!22 = distinct !{!22, !"fused_add_convert_1256_40"}
!23 = !{!24}
!24 = distinct !{!24, !25, !"fused_add_convert_1256_40: argument 0"}
!25 = distinct !{!25, !"fused_add_convert_1256_40"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"fused_add_convert_1256_40: argument 0"}
!28 = distinct !{!28, !"fused_add_convert_1256_40"}
!29 = !{!30}
!30 = distinct !{!30, !31, !"fused_add_convert_1256_40: argument 0"}
!31 = distinct !{!31, !"fused_add_convert_1256_40"}
!32 = !{!33}
!33 = distinct !{!33, !34, !"fused_add_1_convert_1256_48: argument 0"}
!34 = distinct !{!34, !"fused_add_1_convert_1256_48"}
!35 = !{!36}
!36 = distinct !{!36, !37, !"fused_add_1_convert_1256_48: argument 0"}
!37 = distinct !{!37, !"fused_add_1_convert_1256_48"}
!38 = !{!39}
!39 = distinct !{!39, !40, !"fused_add_1_convert_1256_48: argument 0"}
!40 = distinct !{!40, !"fused_add_1_convert_1256_48"}
!41 = !{!42}
!42 = distinct !{!42, !43, !"fused_add_1_convert_1256_48: argument 0"}
!43 = distinct !{!43, !"fused_add_1_convert_1256_48"}
!44 = !{!45}
!45 = distinct !{!45, !46, !"fused_add_2_convert_1256_56: argument 0"}
!46 = distinct !{!46, !"fused_add_2_convert_1256_56"}
!47 = !{!48}
!48 = distinct !{!48, !49, !"fused_add_2_convert_1256_56: argument 0"}
!49 = distinct !{!49, !"fused_add_2_convert_1256_56"}
!50 = !{!51}
!51 = distinct !{!51, !52, !"fused_add_2_convert_1256_56: argument 0"}
!52 = distinct !{!52, !"fused_add_2_convert_1256_56"}
!53 = !{!54}
!54 = distinct !{!54, !55, !"fused_add_2_convert_1256_56: argument 0"}
!55 = distinct !{!55, !"fused_add_2_convert_1256_56"}
!56 = !{!57}
!57 = distinct !{!57, !58, !"fused_add_3_convert_1256_64: argument 0"}
!58 = distinct !{!58, !"fused_add_3_convert_1256_64"}
!59 = !{!60}
!60 = distinct !{!60, !61, !"fused_add_3_convert_1256_64: argument 0"}
!61 = distinct !{!61, !"fused_add_3_convert_1256_64"}
!62 = !{!63}
!63 = distinct !{!63, !64, !"fused_add_3_convert_1256_64: argument 0"}
!64 = distinct !{!64, !"fused_add_3_convert_1256_64"}
!65 = !{!66}
!66 = distinct !{!66, !67, !"fused_add_3_convert_1256_64: argument 0"}
!67 = distinct !{!67, !"fused_add_3_convert_1256_64"}
!68 = !{!69}
!69 = distinct !{!69, !70, !"fused_add_4_convert_1256_72: argument 0"}
!70 = distinct !{!70, !"fused_add_4_convert_1256_72"}
!71 = !{!72}
!72 = distinct !{!72, !73, !"fused_add_4_convert_1256_72: argument 0"}
!73 = distinct !{!73, !"fused_add_4_convert_1256_72"}
!74 = !{!75}
!75 = distinct !{!75, !76, !"fused_add_4_convert_1256_72: argument 0"}
!76 = distinct !{!76, !"fused_add_4_convert_1256_72"}
!77 = !{!78}
!78 = distinct !{!78, !79, !"fused_add_4_convert_1256_72: argument 0"}
!79 = distinct !{!79, !"fused_add_4_convert_1256_72"}
!80 = !{!81}
!81 = distinct !{!81, !82, !"fused_add_5_convert_1256_80: argument 0"}
!82 = distinct !{!82, !"fused_add_5_convert_1256_80"}
!83 = !{!84}
!84 = distinct !{!84, !85, !"fused_add_5_convert_1256_80: argument 0"}
!85 = distinct !{!85, !"fused_add_5_convert_1256_80"}
!86 = !{!87}
!87 = distinct !{!87, !88, !"fused_add_5_convert_1256_80: argument 0"}
!88 = distinct !{!88, !"fused_add_5_convert_1256_80"}
!89 = !{!90}
!90 = distinct !{!90, !91, !"fused_add_5_convert_1256_80: argument 0"}
!91 = distinct !{!91, !"fused_add_5_convert_1256_80"}

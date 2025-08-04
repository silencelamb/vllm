; ModuleID = 'SyncTensorsGraph.737'
source_filename = "SyncTensorsGraph.737"
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
define ptx_kernel void @wrapped_concatenate(ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %1, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %2, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %3, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %4, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %5, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %6, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %7, ptr noalias writeonly align 128 captures(none) dereferenceable(33554432) %8) local_unnamed_addr #2 {
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
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %21 = lshr i32 %20, 2
  %22 = icmp samesign ult i32 %20, 16384
  %23 = shl nuw nsw i32 %19, 2
  %24 = shl nuw nsw i32 %20, 9
  %25 = or disjoint i32 %23, %24
  br i1 %22, label %26, label %63

26:                                               ; preds = %9
  %27 = icmp samesign ult i32 %20, 8192
  br i1 %27, label %28, label %43

28:                                               ; preds = %26
  %29 = icmp samesign ult i32 %20, 4096
  br i1 %29, label %30, label %33

30:                                               ; preds = %28
  %31 = zext nneg i32 %25 to i64
  %32 = getelementptr inbounds bfloat, ptr addrspace(1) %18, i64 %31
  br label %103

33:                                               ; preds = %28
  %34 = and i32 %24, 1536
  %35 = shl nuw nsw i32 %21, 11
  %36 = sext i32 %23 to i64
  %37 = sext i32 %34 to i64
  %38 = sext i32 %35 to i64
  %39 = add i64 %38, %37
  %40 = add i64 %39, %36
  %41 = getelementptr bfloat, ptr addrspace(1) %17, i64 %40
  %42 = getelementptr inbounds i8, ptr addrspace(1) %41, i64 -4194304
  br label %103

43:                                               ; preds = %26
  %44 = icmp samesign ult i32 %20, 12288
  %45 = and i32 %24, 1536
  %46 = shl nuw nsw i32 %21, 11
  br i1 %44, label %47, label %55

47:                                               ; preds = %43
  %48 = sext i32 %23 to i64
  %49 = sext i32 %45 to i64
  %50 = sext i32 %46 to i64
  %51 = add i64 %50, %49
  %52 = add i64 %51, %48
  %53 = getelementptr bfloat, ptr addrspace(1) %16, i64 %52
  %54 = getelementptr inbounds i8, ptr addrspace(1) %53, i64 -8388608
  br label %103

55:                                               ; preds = %43
  %56 = sext i32 %23 to i64
  %57 = sext i32 %45 to i64
  %58 = sext i32 %46 to i64
  %59 = add i64 %58, %57
  %60 = add i64 %59, %56
  %61 = getelementptr bfloat, ptr addrspace(1) %15, i64 %60
  %62 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 -12582912
  br label %103

63:                                               ; preds = %9
  %64 = icmp samesign ult i32 %20, 24576
  %65 = and i32 %24, 1536
  %66 = shl nuw nsw i32 %21, 11
  br i1 %64, label %67, label %85

67:                                               ; preds = %63
  %68 = icmp samesign ult i32 %20, 20480
  br i1 %68, label %69, label %77

69:                                               ; preds = %67
  %70 = sext i32 %23 to i64
  %71 = sext i32 %65 to i64
  %72 = sext i32 %66 to i64
  %73 = add i64 %72, %71
  %74 = add i64 %73, %70
  %75 = getelementptr bfloat, ptr addrspace(1) %14, i64 %74
  %76 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 -16777216
  br label %103

77:                                               ; preds = %67
  %78 = sext i32 %23 to i64
  %79 = sext i32 %65 to i64
  %80 = sext i32 %66 to i64
  %81 = add i64 %80, %79
  %82 = add i64 %81, %78
  %83 = getelementptr bfloat, ptr addrspace(1) %13, i64 %82
  %84 = getelementptr inbounds i8, ptr addrspace(1) %83, i64 -20971520
  br label %103

85:                                               ; preds = %63
  %86 = icmp samesign ult i32 %20, 28672
  br i1 %86, label %87, label %95

87:                                               ; preds = %85
  %88 = sext i32 %23 to i64
  %89 = sext i32 %65 to i64
  %90 = sext i32 %66 to i64
  %91 = add i64 %90, %89
  %92 = add i64 %91, %88
  %93 = getelementptr bfloat, ptr addrspace(1) %12, i64 %92
  %94 = getelementptr inbounds i8, ptr addrspace(1) %93, i64 -25165824
  br label %103

95:                                               ; preds = %85
  %96 = sext i32 %23 to i64
  %97 = sext i32 %65 to i64
  %98 = sext i32 %66 to i64
  %99 = add i64 %98, %97
  %100 = add i64 %99, %96
  %101 = getelementptr bfloat, ptr addrspace(1) %11, i64 %100
  %102 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 -29360128
  br label %103

103:                                              ; preds = %33, %30, %55, %47, %77, %69, %95, %87
  %.in = phi ptr addrspace(1) [ %42, %33 ], [ %32, %30 ], [ %62, %55 ], [ %54, %47 ], [ %84, %77 ], [ %76, %69 ], [ %102, %95 ], [ %94, %87 ]
  %104 = icmp ult i32 %20, 16384
  br i1 %104, label %105, label %146

105:                                              ; preds = %103
  %106 = icmp samesign ult i32 %20, 8192
  br i1 %106, label %107, label %124

107:                                              ; preds = %105
  %108 = icmp samesign ult i32 %20, 4096
  br i1 %108, label %109, label %113

109:                                              ; preds = %107
  %110 = zext nneg i32 %25 to i64
  %111 = getelementptr bfloat, ptr addrspace(1) %18, i64 %110
  %112 = getelementptr inbounds i8, ptr addrspace(1) %111, i64 2
  br label %190

113:                                              ; preds = %107
  %114 = and i32 %24, 1536
  %115 = shl nuw nsw i32 %21, 11
  %116 = sext i32 %23 to i64
  %117 = sext i32 %114 to i64
  %118 = sext i32 %115 to i64
  %119 = add i64 %118, %117
  %120 = add i64 %119, %116
  %121 = add i64 %120, 1
  %122 = getelementptr bfloat, ptr addrspace(1) %17, i64 %121
  %123 = getelementptr inbounds i8, ptr addrspace(1) %122, i64 -4194304
  br label %190

124:                                              ; preds = %105
  %125 = icmp samesign ult i32 %20, 12288
  %126 = and i32 %24, 1536
  %127 = shl nuw nsw i32 %21, 11
  br i1 %125, label %128, label %137

128:                                              ; preds = %124
  %129 = sext i32 %23 to i64
  %130 = sext i32 %126 to i64
  %131 = sext i32 %127 to i64
  %132 = add i64 %131, %130
  %133 = add i64 %132, %129
  %134 = add i64 %133, 1
  %135 = getelementptr bfloat, ptr addrspace(1) %16, i64 %134
  %136 = getelementptr inbounds i8, ptr addrspace(1) %135, i64 -8388608
  br label %190

137:                                              ; preds = %124
  %138 = sext i32 %23 to i64
  %139 = sext i32 %126 to i64
  %140 = sext i32 %127 to i64
  %141 = add i64 %140, %139
  %142 = add i64 %141, %138
  %143 = add i64 %142, 1
  %144 = getelementptr bfloat, ptr addrspace(1) %15, i64 %143
  %145 = getelementptr inbounds i8, ptr addrspace(1) %144, i64 -12582912
  br label %190

146:                                              ; preds = %103
  %147 = icmp samesign ult i32 %20, 24576
  %148 = and i32 %24, 1536
  %149 = shl nuw nsw i32 %21, 11
  br i1 %147, label %150, label %170

150:                                              ; preds = %146
  %151 = icmp samesign ult i32 %20, 20480
  br i1 %151, label %152, label %161

152:                                              ; preds = %150
  %153 = sext i32 %23 to i64
  %154 = sext i32 %148 to i64
  %155 = sext i32 %149 to i64
  %156 = add i64 %155, %154
  %157 = add i64 %156, %153
  %158 = add i64 %157, 1
  %159 = getelementptr bfloat, ptr addrspace(1) %14, i64 %158
  %160 = getelementptr inbounds i8, ptr addrspace(1) %159, i64 -16777216
  br label %190

161:                                              ; preds = %150
  %162 = sext i32 %23 to i64
  %163 = sext i32 %148 to i64
  %164 = sext i32 %149 to i64
  %165 = add i64 %164, %163
  %166 = add i64 %165, %162
  %167 = add i64 %166, 1
  %168 = getelementptr bfloat, ptr addrspace(1) %13, i64 %167
  %169 = getelementptr inbounds i8, ptr addrspace(1) %168, i64 -20971520
  br label %190

170:                                              ; preds = %146
  %171 = icmp samesign ult i32 %20, 28672
  br i1 %171, label %172, label %181

172:                                              ; preds = %170
  %173 = sext i32 %23 to i64
  %174 = sext i32 %148 to i64
  %175 = sext i32 %149 to i64
  %176 = add i64 %175, %174
  %177 = add i64 %176, %173
  %178 = add i64 %177, 1
  %179 = getelementptr bfloat, ptr addrspace(1) %12, i64 %178
  %180 = getelementptr inbounds i8, ptr addrspace(1) %179, i64 -25165824
  br label %190

181:                                              ; preds = %170
  %182 = sext i32 %23 to i64
  %183 = sext i32 %148 to i64
  %184 = sext i32 %149 to i64
  %185 = add i64 %184, %183
  %186 = add i64 %185, %182
  %187 = add i64 %186, 1
  %188 = getelementptr bfloat, ptr addrspace(1) %11, i64 %187
  %189 = getelementptr inbounds i8, ptr addrspace(1) %188, i64 -29360128
  br label %190

190:                                              ; preds = %113, %109, %137, %128, %161, %152, %181, %172
  %.in1 = phi ptr addrspace(1) [ %123, %113 ], [ %112, %109 ], [ %145, %137 ], [ %136, %128 ], [ %169, %161 ], [ %160, %152 ], [ %189, %181 ], [ %180, %172 ]
  %191 = icmp ult i32 %20, 16384
  br i1 %191, label %192, label %233

192:                                              ; preds = %190
  %193 = icmp samesign ult i32 %20, 8192
  br i1 %193, label %194, label %211

194:                                              ; preds = %192
  %195 = icmp samesign ult i32 %20, 4096
  br i1 %195, label %196, label %200

196:                                              ; preds = %194
  %197 = zext nneg i32 %25 to i64
  %198 = getelementptr bfloat, ptr addrspace(1) %18, i64 %197
  %199 = getelementptr inbounds i8, ptr addrspace(1) %198, i64 4
  br label %277

200:                                              ; preds = %194
  %201 = and i32 %24, 1536
  %202 = shl nuw nsw i32 %21, 11
  %203 = sext i32 %23 to i64
  %204 = sext i32 %201 to i64
  %205 = sext i32 %202 to i64
  %206 = add i64 %205, %204
  %207 = add i64 %206, %203
  %208 = add i64 %207, 2
  %209 = getelementptr bfloat, ptr addrspace(1) %17, i64 %208
  %210 = getelementptr inbounds i8, ptr addrspace(1) %209, i64 -4194304
  br label %277

211:                                              ; preds = %192
  %212 = icmp samesign ult i32 %20, 12288
  %213 = and i32 %24, 1536
  %214 = shl nuw nsw i32 %21, 11
  br i1 %212, label %215, label %224

215:                                              ; preds = %211
  %216 = sext i32 %23 to i64
  %217 = sext i32 %213 to i64
  %218 = sext i32 %214 to i64
  %219 = add i64 %218, %217
  %220 = add i64 %219, %216
  %221 = add i64 %220, 2
  %222 = getelementptr bfloat, ptr addrspace(1) %16, i64 %221
  %223 = getelementptr inbounds i8, ptr addrspace(1) %222, i64 -8388608
  br label %277

224:                                              ; preds = %211
  %225 = sext i32 %23 to i64
  %226 = sext i32 %213 to i64
  %227 = sext i32 %214 to i64
  %228 = add i64 %227, %226
  %229 = add i64 %228, %225
  %230 = add i64 %229, 2
  %231 = getelementptr bfloat, ptr addrspace(1) %15, i64 %230
  %232 = getelementptr inbounds i8, ptr addrspace(1) %231, i64 -12582912
  br label %277

233:                                              ; preds = %190
  %234 = icmp samesign ult i32 %20, 24576
  %235 = and i32 %24, 1536
  %236 = shl nuw nsw i32 %21, 11
  br i1 %234, label %237, label %257

237:                                              ; preds = %233
  %238 = icmp samesign ult i32 %20, 20480
  br i1 %238, label %239, label %248

239:                                              ; preds = %237
  %240 = sext i32 %23 to i64
  %241 = sext i32 %235 to i64
  %242 = sext i32 %236 to i64
  %243 = add i64 %242, %241
  %244 = add i64 %243, %240
  %245 = add i64 %244, 2
  %246 = getelementptr bfloat, ptr addrspace(1) %14, i64 %245
  %247 = getelementptr inbounds i8, ptr addrspace(1) %246, i64 -16777216
  br label %277

248:                                              ; preds = %237
  %249 = sext i32 %23 to i64
  %250 = sext i32 %235 to i64
  %251 = sext i32 %236 to i64
  %252 = add i64 %251, %250
  %253 = add i64 %252, %249
  %254 = add i64 %253, 2
  %255 = getelementptr bfloat, ptr addrspace(1) %13, i64 %254
  %256 = getelementptr inbounds i8, ptr addrspace(1) %255, i64 -20971520
  br label %277

257:                                              ; preds = %233
  %258 = icmp samesign ult i32 %20, 28672
  br i1 %258, label %259, label %268

259:                                              ; preds = %257
  %260 = sext i32 %23 to i64
  %261 = sext i32 %235 to i64
  %262 = sext i32 %236 to i64
  %263 = add i64 %262, %261
  %264 = add i64 %263, %260
  %265 = add i64 %264, 2
  %266 = getelementptr bfloat, ptr addrspace(1) %12, i64 %265
  %267 = getelementptr inbounds i8, ptr addrspace(1) %266, i64 -25165824
  br label %277

268:                                              ; preds = %257
  %269 = sext i32 %23 to i64
  %270 = sext i32 %235 to i64
  %271 = sext i32 %236 to i64
  %272 = add i64 %271, %270
  %273 = add i64 %272, %269
  %274 = add i64 %273, 2
  %275 = getelementptr bfloat, ptr addrspace(1) %11, i64 %274
  %276 = getelementptr inbounds i8, ptr addrspace(1) %275, i64 -29360128
  br label %277

277:                                              ; preds = %200, %196, %224, %215, %248, %239, %268, %259
  %.in2 = phi ptr addrspace(1) [ %210, %200 ], [ %199, %196 ], [ %232, %224 ], [ %223, %215 ], [ %256, %248 ], [ %247, %239 ], [ %276, %268 ], [ %267, %259 ]
  %278 = icmp ult i32 %20, 16384
  br i1 %278, label %279, label %320

279:                                              ; preds = %277
  %280 = icmp samesign ult i32 %20, 8192
  br i1 %280, label %281, label %298

281:                                              ; preds = %279
  %282 = icmp samesign ult i32 %20, 4096
  br i1 %282, label %283, label %287

283:                                              ; preds = %281
  %284 = zext nneg i32 %25 to i64
  %285 = getelementptr bfloat, ptr addrspace(1) %18, i64 %284
  %286 = getelementptr inbounds i8, ptr addrspace(1) %285, i64 6
  br label %364

287:                                              ; preds = %281
  %288 = and i32 %24, 1536
  %289 = shl nuw nsw i32 %21, 11
  %290 = sext i32 %23 to i64
  %291 = sext i32 %288 to i64
  %292 = sext i32 %289 to i64
  %293 = add i64 %292, %291
  %294 = add i64 %293, %290
  %295 = add i64 %294, 3
  %296 = getelementptr bfloat, ptr addrspace(1) %17, i64 %295
  %297 = getelementptr inbounds i8, ptr addrspace(1) %296, i64 -4194304
  br label %364

298:                                              ; preds = %279
  %299 = icmp samesign ult i32 %20, 12288
  %300 = and i32 %24, 1536
  %301 = shl nuw nsw i32 %21, 11
  br i1 %299, label %302, label %311

302:                                              ; preds = %298
  %303 = sext i32 %23 to i64
  %304 = sext i32 %300 to i64
  %305 = sext i32 %301 to i64
  %306 = add i64 %305, %304
  %307 = add i64 %306, %303
  %308 = add i64 %307, 3
  %309 = getelementptr bfloat, ptr addrspace(1) %16, i64 %308
  %310 = getelementptr inbounds i8, ptr addrspace(1) %309, i64 -8388608
  br label %364

311:                                              ; preds = %298
  %312 = sext i32 %23 to i64
  %313 = sext i32 %300 to i64
  %314 = sext i32 %301 to i64
  %315 = add i64 %314, %313
  %316 = add i64 %315, %312
  %317 = add i64 %316, 3
  %318 = getelementptr bfloat, ptr addrspace(1) %15, i64 %317
  %319 = getelementptr inbounds i8, ptr addrspace(1) %318, i64 -12582912
  br label %364

320:                                              ; preds = %277
  %321 = icmp samesign ult i32 %20, 24576
  %322 = and i32 %24, 1536
  %323 = shl nuw nsw i32 %21, 11
  br i1 %321, label %324, label %344

324:                                              ; preds = %320
  %325 = icmp samesign ult i32 %20, 20480
  br i1 %325, label %326, label %335

326:                                              ; preds = %324
  %327 = sext i32 %23 to i64
  %328 = sext i32 %322 to i64
  %329 = sext i32 %323 to i64
  %330 = add i64 %329, %328
  %331 = add i64 %330, %327
  %332 = add i64 %331, 3
  %333 = getelementptr bfloat, ptr addrspace(1) %14, i64 %332
  %334 = getelementptr inbounds i8, ptr addrspace(1) %333, i64 -16777216
  br label %364

335:                                              ; preds = %324
  %336 = sext i32 %23 to i64
  %337 = sext i32 %322 to i64
  %338 = sext i32 %323 to i64
  %339 = add i64 %338, %337
  %340 = add i64 %339, %336
  %341 = add i64 %340, 3
  %342 = getelementptr bfloat, ptr addrspace(1) %13, i64 %341
  %343 = getelementptr inbounds i8, ptr addrspace(1) %342, i64 -20971520
  br label %364

344:                                              ; preds = %320
  %345 = icmp samesign ult i32 %20, 28672
  br i1 %345, label %346, label %355

346:                                              ; preds = %344
  %347 = sext i32 %23 to i64
  %348 = sext i32 %322 to i64
  %349 = sext i32 %323 to i64
  %350 = add i64 %349, %348
  %351 = add i64 %350, %347
  %352 = add i64 %351, 3
  %353 = getelementptr bfloat, ptr addrspace(1) %12, i64 %352
  %354 = getelementptr inbounds i8, ptr addrspace(1) %353, i64 -25165824
  br label %364

355:                                              ; preds = %344
  %356 = sext i32 %23 to i64
  %357 = sext i32 %322 to i64
  %358 = sext i32 %323 to i64
  %359 = add i64 %358, %357
  %360 = add i64 %359, %356
  %361 = add i64 %360, 3
  %362 = getelementptr bfloat, ptr addrspace(1) %11, i64 %361
  %363 = getelementptr inbounds i8, ptr addrspace(1) %362, i64 -29360128
  br label %364

364:                                              ; preds = %287, %283, %311, %302, %335, %326, %355, %346
  %.in3 = phi ptr addrspace(1) [ %297, %287 ], [ %286, %283 ], [ %319, %311 ], [ %310, %302 ], [ %343, %335 ], [ %334, %326 ], [ %363, %355 ], [ %354, %346 ]
  %365 = load bfloat, ptr addrspace(1) %.in3, align 2, !invariant.load !6
  %366 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !6
  %367 = insertelement <4 x bfloat> poison, bfloat %366, i64 0
  %368 = load bfloat, ptr addrspace(1) %.in1, align 2, !invariant.load !6
  %369 = insertelement <4 x bfloat> %367, bfloat %368, i64 1
  %370 = load bfloat, ptr addrspace(1) %.in2, align 2, !invariant.load !6
  %371 = insertelement <4 x bfloat> %369, bfloat %370, i64 2
  %372 = insertelement <4 x bfloat> %371, bfloat %365, i64 3
  %373 = zext nneg i32 %25 to i64
  %374 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %373
  store <4 x bfloat> %372, ptr addrspace(1) %374, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_31_0(ptr noalias align 128 dereferenceable(33554432) %arg0, ptr noalias align 128 dereferenceable(1048576) %arg1) local_unnamed_addr #4 {
  %arg1253 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0251 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 512
  %3 = shl nsw i32 %2, 3
  %4 = sub nsw i32 1, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = mul i32 %2, 512
  %.decomposed = sub i32 %.frozen, %6
  %7 = sdiv i32 %.decomposed, %5
  %8 = shl i32 %7, 7
  %9 = sext i32 %8 to i64
  %10 = tail call range(i32 0, 256) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = and i32 %10, 16
  %.not = icmp eq i32 %11, 0
  %12 = and i32 %10, 32
  %13 = icmp eq i32 %12, 0
  %14 = and i32 %10, 64
  %15 = icmp eq i32 %14, 0
  %16 = lshr i32 %10, 4
  %17 = and i32 %16, 7
  %18 = icmp samesign ult i32 %10, 128
  %19 = select i1 %18, i32 0, i32 8
  %20 = or disjoint i32 %17, %19
  %21 = or disjoint i32 %20, 16
  %22 = or disjoint i32 %20, 32
  %23 = or disjoint i32 %20, 48
  %24 = or disjoint i32 %20, 64
  %25 = or disjoint i32 %20, 80
  %26 = or disjoint i32 %20, 96
  %27 = or disjoint i32 %20, 112
  %28 = and i32 %10, 1
  %29 = icmp eq i32 %28, 0
  %30 = and i32 %10, 2
  %31 = icmp eq i32 %30, 0
  %32 = and i32 %10, 4
  %33 = icmp eq i32 %32, 0
  %34 = shl i32 %10, 3
  %35 = and i32 %34, 120
  %36 = zext nneg i32 %20 to i64
  %37 = zext nneg i32 %21 to i64
  %38 = zext nneg i32 %22 to i64
  %39 = zext nneg i32 %23 to i64
  %40 = zext nneg i32 %24 to i64
  %41 = zext nneg i32 %25 to i64
  %42 = zext nneg i32 %26 to i64
  %43 = zext nneg i32 %27 to i64
  %44 = zext i32 %35 to i64
  %45 = or disjoint i64 %9, %36
  %46 = or disjoint i64 %9, %37
  %47 = or disjoint i64 %9, %38
  %48 = or disjoint i64 %9, %39
  %49 = or disjoint i64 %9, %40
  %50 = or disjoint i64 %9, %41
  %51 = or disjoint i64 %9, %42
  %52 = or disjoint i64 %9, %43
  %53 = shl nsw i64 %45, 11
  %54 = shl nsw i64 %46, 11
  %55 = shl nsw i64 %47, 11
  %56 = shl nsw i64 %48, 11
  %57 = shl nsw i64 %49, 11
  %58 = shl nsw i64 %50, 11
  %59 = shl nsw i64 %51, 11
  %60 = shl nsw i64 %52, 11
  %61 = or disjoint i64 %53, %44
  %62 = or disjoint i64 %54, %44
  %63 = or disjoint i64 %55, %44
  %64 = or disjoint i64 %56, %44
  %65 = or disjoint i64 %57, %44
  %66 = or disjoint i64 %58, %44
  %67 = or disjoint i64 %59, %44
  %68 = or disjoint i64 %60, %44
  %69 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %61
  %70 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %62
  %71 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %63
  %72 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %64
  %73 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %65
  %74 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %66
  %75 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %67
  %76 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %68
  %77 = select i1 %.not, i32 0, i32 136
  %78 = select i1 %13, i32 0, i32 272
  %79 = select i1 %15, i32 0, i32 544
  %80 = or disjoint i32 %78, %77
  %81 = xor i32 %80, %35
  %82 = xor i32 %81, %79
  %83 = select i1 %18, i32 0, i32 1024
  %84 = or disjoint i32 %82, %83
  %85 = zext nneg i32 %84 to i64
  %86 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %85
  %87 = or disjoint i32 %35, 2048
  %88 = xor i32 %80, %87
  %89 = xor i32 %88, %79
  %90 = or disjoint i32 %89, %83
  %91 = zext nneg i32 %90 to i64
  %92 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %91
  %93 = or disjoint i32 %35, 4096
  %94 = xor i32 %80, %93
  %95 = xor i32 %94, %79
  %96 = or disjoint i32 %95, %83
  %97 = zext nneg i32 %96 to i64
  %98 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %97
  %99 = or disjoint i32 %35, 6144
  %100 = xor i32 %80, %99
  %101 = xor i32 %100, %79
  %102 = or disjoint i32 %101, %83
  %103 = zext nneg i32 %102 to i64
  %104 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %103
  %105 = or disjoint i32 %35, 8192
  %106 = xor i32 %80, %105
  %107 = xor i32 %106, %79
  %108 = or disjoint i32 %107, %83
  %109 = zext nneg i32 %108 to i64
  %110 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %109
  %111 = or disjoint i32 %35, 10240
  %112 = xor i32 %80, %111
  %113 = xor i32 %112, %79
  %114 = or disjoint i32 %113, %83
  %115 = zext nneg i32 %114 to i64
  %116 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %115
  %117 = or disjoint i32 %35, 12288
  %118 = xor i32 %80, %117
  %119 = xor i32 %118, %79
  %120 = or disjoint i32 %119, %83
  %121 = zext nneg i32 %120 to i64
  %122 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %121
  %123 = or disjoint i32 %35, 14336
  %124 = xor i32 %80, %123
  %125 = xor i32 %124, %79
  %126 = or disjoint i32 %125, %83
  %127 = zext nneg i32 %126 to i64
  %128 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %127
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %86, ptr addrspace(1) %69, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %92, ptr addrspace(1) %70, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %98, ptr addrspace(1) %71, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %104, ptr addrspace(1) %72, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %110, ptr addrspace(1) %73, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %116, ptr addrspace(1) %74, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %122, ptr addrspace(1) %75, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %128, ptr addrspace(1) %76, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %129 = getelementptr bfloat, ptr addrspace(1) %arg0251, i64 %44
  %130 = getelementptr bfloat, ptr addrspace(1) %129, i64 %53
  %131 = getelementptr i8, ptr addrspace(1) %130, i64 256
  %132 = getelementptr bfloat, ptr addrspace(1) %129, i64 %54
  %133 = getelementptr i8, ptr addrspace(1) %132, i64 256
  %134 = getelementptr bfloat, ptr addrspace(1) %129, i64 %55
  %135 = getelementptr i8, ptr addrspace(1) %134, i64 256
  %136 = getelementptr bfloat, ptr addrspace(1) %129, i64 %56
  %137 = getelementptr i8, ptr addrspace(1) %136, i64 256
  %138 = getelementptr bfloat, ptr addrspace(1) %129, i64 %57
  %139 = getelementptr i8, ptr addrspace(1) %138, i64 256
  %140 = getelementptr bfloat, ptr addrspace(1) %129, i64 %58
  %141 = getelementptr i8, ptr addrspace(1) %140, i64 256
  %142 = getelementptr bfloat, ptr addrspace(1) %129, i64 %59
  %143 = getelementptr i8, ptr addrspace(1) %142, i64 256
  %144 = getelementptr bfloat, ptr addrspace(1) %129, i64 %60
  %145 = getelementptr i8, ptr addrspace(1) %144, i64 256
  tail call void @llvm.nvvm.barrier0()
  %146 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %85
  %147 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %91
  %148 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %97
  %149 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %103
  %150 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %109
  %151 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %115
  %152 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %121
  %153 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 32768), i64 %127
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %146, ptr addrspace(1) %131, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %147, ptr addrspace(1) %133, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %148, ptr addrspace(1) %135, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %149, ptr addrspace(1) %137, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %150, ptr addrspace(1) %139, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %151, ptr addrspace(1) %141, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %152, ptr addrspace(1) %143, i32 16) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %153, ptr addrspace(1) %145, i32 16) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %154 = select i1 %29, i32 0, i32 136
  %155 = select i1 %31, i32 0, i32 272
  %156 = or disjoint i32 %154, %155
  %157 = select i1 %33, i32 0, i32 544
  %158 = or disjoint i32 %156, %157
  %and.ra = and i32 %10, 24
  %159 = xor i32 %158, %and.ra
  %160 = shl nuw nsw i32 %12, 5
  %161 = or disjoint i32 %159, %160
  %162 = shl nuw nsw i32 %14, 5
  %163 = or disjoint i32 %161, %162
  %164 = zext nneg i32 %163 to i64
  %165 = or disjoint i32 %156, 32
  %166 = or disjoint i32 %160, %and.ra
  %167 = or disjoint i32 %166, %162
  %168 = or disjoint i32 %167, %157
  %169 = xor i32 %168, %165
  %170 = zext nneg i32 %169 to i64
  %171 = or disjoint i32 %158, 64
  %172 = xor i32 %167, %171
  %173 = zext nneg i32 %172 to i64
  %174 = or disjoint i32 %156, 96
  %175 = xor i32 %168, %174
  %176 = zext nneg i32 %175 to i64
  %177 = or disjoint i32 %158, 4096
  %178 = xor i32 %167, %177
  %179 = zext nneg i32 %178 to i64
  %180 = or disjoint i32 %156, 4128
  %181 = xor i32 %168, %180
  %182 = zext nneg i32 %181 to i64
  %183 = or disjoint i32 %158, 4160
  %184 = xor i32 %167, %183
  %185 = zext nneg i32 %184 to i64
  %186 = or disjoint i32 %156, 4192
  %187 = xor i32 %168, %186
  %188 = zext nneg i32 %187 to i64
  %189 = or disjoint i32 %158, 8192
  %190 = xor i32 %167, %189
  %191 = zext nneg i32 %190 to i64
  %192 = or disjoint i32 %156, 8224
  %193 = xor i32 %168, %192
  %194 = zext nneg i32 %193 to i64
  %195 = or disjoint i32 %158, 8256
  %196 = xor i32 %167, %195
  %197 = zext nneg i32 %196 to i64
  %198 = or disjoint i32 %156, 8288
  %199 = xor i32 %168, %198
  %200 = zext nneg i32 %199 to i64
  %201 = or disjoint i32 %158, 12288
  %202 = xor i32 %167, %201
  %203 = zext nneg i32 %202 to i64
  %204 = or disjoint i32 %156, 12320
  %205 = xor i32 %168, %204
  %206 = zext nneg i32 %205 to i64
  %207 = or disjoint i32 %158, 12352
  %208 = xor i32 %167, %207
  %209 = zext nneg i32 %208 to i64
  %210 = or disjoint i32 %156, 12384
  %211 = xor i32 %168, %210
  %212 = zext nneg i32 %211 to i64
  %213 = trunc i32 %10 to i4
  %214 = zext i4 %213 to i64
  %215 = shl nuw nsw i64 %214, 4
  %216 = add i32 %19, %17
  %217 = zext nneg i32 %216 to i64
  %218 = add i64 %9, %217
  %219 = shl nsw i64 %218, 12
  %220 = add nuw nsw i64 %219, 512
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0251, i64 %220
  %221 = add i32 %216, 16
  %222 = zext nneg i32 %221 to i64
  %223 = add i64 %9, %222
  %224 = shl nsw i64 %223, 12
  %225 = add nuw nsw i64 %224, 512
  %scevgep257 = getelementptr i8, ptr addrspace(1) %arg0251, i64 %225
  %226 = add i32 %216, 32
  %227 = zext nneg i32 %226 to i64
  %228 = add i64 %9, %227
  %229 = shl nsw i64 %228, 12
  %230 = add nuw nsw i64 %229, 512
  %scevgep261 = getelementptr i8, ptr addrspace(1) %arg0251, i64 %230
  %231 = add i32 %216, 48
  %232 = zext nneg i32 %231 to i64
  %233 = add i64 %9, %232
  %234 = shl nsw i64 %233, 12
  %235 = add nuw nsw i64 %234, 512
  %scevgep265 = getelementptr i8, ptr addrspace(1) %arg0251, i64 %235
  %236 = add i32 %216, 64
  %237 = zext nneg i32 %236 to i64
  %238 = add i64 %9, %237
  %239 = shl nsw i64 %238, 12
  %240 = add nuw nsw i64 %239, 512
  %scevgep269 = getelementptr i8, ptr addrspace(1) %arg0251, i64 %240
  %241 = add i32 %216, 80
  %242 = zext nneg i32 %241 to i64
  %243 = add i64 %9, %242
  %244 = shl nsw i64 %243, 12
  %245 = add nuw nsw i64 %244, 512
  %scevgep273 = getelementptr i8, ptr addrspace(1) %arg0251, i64 %245
  %246 = add i32 %216, 96
  %247 = zext nneg i32 %246 to i64
  %248 = add i64 %9, %247
  %249 = shl nsw i64 %248, 12
  %250 = add nuw nsw i64 %249, 512
  %scevgep277 = getelementptr i8, ptr addrspace(1) %arg0251, i64 %250
  %251 = add i32 %216, 112
  %252 = zext nneg i32 %251 to i64
  %253 = add i64 %9, %252
  %254 = shl nsw i64 %253, 12
  %255 = add nuw nsw i64 %254, 512
  %scevgep281 = getelementptr i8, ptr addrspace(1) %arg0251, i64 %255
  br label %256

256:                                              ; preds = %0, %256
  %lsr.iv285 = phi i32 [ -128, %0 ], [ %261, %256 ]
  %lsr.iv282 = phi ptr addrspace(1) [ %scevgep281, %0 ], [ %scevgep283, %256 ]
  %lsr.iv278 = phi ptr addrspace(1) [ %scevgep277, %0 ], [ %scevgep279, %256 ]
  %lsr.iv274 = phi ptr addrspace(1) [ %scevgep273, %0 ], [ %scevgep275, %256 ]
  %lsr.iv270 = phi ptr addrspace(1) [ %scevgep269, %0 ], [ %scevgep271, %256 ]
  %lsr.iv266 = phi ptr addrspace(1) [ %scevgep265, %0 ], [ %scevgep267, %256 ]
  %lsr.iv262 = phi ptr addrspace(1) [ %scevgep261, %0 ], [ %scevgep263, %256 ]
  %lsr.iv258 = phi ptr addrspace(1) [ %scevgep257, %0 ], [ %scevgep259, %256 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep255, %256 ]
  %257 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %795, %256 ]
  %258 = phi i32 [ 0, %0 ], [ %792, %256 ]
  %259 = phi i32 [ 1, %0 ], [ %777, %256 ]
  %260 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %774, %256 ]
  %261 = add i32 %lsr.iv285, 128
  %262 = icmp samesign ult i32 %261, 1792
  %263 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %164
  %264 = ptrtoint ptr addrspace(3) %263 to i64
  %265 = trunc i64 %264 to i32
  %266 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %265) #10
  %267 = extractvalue { i32, i32, i32, i32 } %266, 0
  %268 = extractvalue { i32, i32, i32, i32 } %266, 1
  %269 = extractvalue { i32, i32, i32, i32 } %266, 2
  %270 = extractvalue { i32, i32, i32, i32 } %266, 3
  %271 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %170
  %272 = ptrtoint ptr addrspace(3) %271 to i64
  %273 = trunc i64 %272 to i32
  %274 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %273) #10
  %275 = extractvalue { i32, i32, i32, i32 } %274, 0
  %276 = extractvalue { i32, i32, i32, i32 } %274, 1
  %277 = extractvalue { i32, i32, i32, i32 } %274, 2
  %278 = extractvalue { i32, i32, i32, i32 } %274, 3
  %279 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %173
  %280 = ptrtoint ptr addrspace(3) %279 to i64
  %281 = trunc i64 %280 to i32
  %282 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %281) #10
  %283 = extractvalue { i32, i32, i32, i32 } %282, 0
  %284 = extractvalue { i32, i32, i32, i32 } %282, 1
  %285 = extractvalue { i32, i32, i32, i32 } %282, 2
  %286 = extractvalue { i32, i32, i32, i32 } %282, 3
  %287 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %176
  %288 = ptrtoint ptr addrspace(3) %287 to i64
  %289 = trunc i64 %288 to i32
  %290 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %289) #10
  %291 = extractvalue { i32, i32, i32, i32 } %290, 0
  %292 = extractvalue { i32, i32, i32, i32 } %290, 1
  %293 = extractvalue { i32, i32, i32, i32 } %290, 2
  %294 = extractvalue { i32, i32, i32, i32 } %290, 3
  %295 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %179
  %296 = ptrtoint ptr addrspace(3) %295 to i64
  %297 = trunc i64 %296 to i32
  %298 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %297) #10
  %299 = extractvalue { i32, i32, i32, i32 } %298, 0
  %300 = extractvalue { i32, i32, i32, i32 } %298, 1
  %301 = extractvalue { i32, i32, i32, i32 } %298, 2
  %302 = extractvalue { i32, i32, i32, i32 } %298, 3
  %303 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %182
  %304 = ptrtoint ptr addrspace(3) %303 to i64
  %305 = trunc i64 %304 to i32
  %306 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %305) #10
  %307 = extractvalue { i32, i32, i32, i32 } %306, 0
  %308 = extractvalue { i32, i32, i32, i32 } %306, 1
  %309 = extractvalue { i32, i32, i32, i32 } %306, 2
  %310 = extractvalue { i32, i32, i32, i32 } %306, 3
  %311 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %185
  %312 = ptrtoint ptr addrspace(3) %311 to i64
  %313 = trunc i64 %312 to i32
  %314 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %313) #10
  %315 = extractvalue { i32, i32, i32, i32 } %314, 0
  %316 = extractvalue { i32, i32, i32, i32 } %314, 1
  %317 = extractvalue { i32, i32, i32, i32 } %314, 2
  %318 = extractvalue { i32, i32, i32, i32 } %314, 3
  %319 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %188
  %320 = ptrtoint ptr addrspace(3) %319 to i64
  %321 = trunc i64 %320 to i32
  %322 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %321) #10
  %323 = extractvalue { i32, i32, i32, i32 } %322, 0
  %324 = extractvalue { i32, i32, i32, i32 } %322, 1
  %325 = extractvalue { i32, i32, i32, i32 } %322, 2
  %326 = extractvalue { i32, i32, i32, i32 } %322, 3
  %327 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %191
  %328 = ptrtoint ptr addrspace(3) %327 to i64
  %329 = trunc i64 %328 to i32
  %330 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %329) #10
  %331 = extractvalue { i32, i32, i32, i32 } %330, 0
  %332 = extractvalue { i32, i32, i32, i32 } %330, 1
  %333 = extractvalue { i32, i32, i32, i32 } %330, 2
  %334 = extractvalue { i32, i32, i32, i32 } %330, 3
  %335 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %194
  %336 = ptrtoint ptr addrspace(3) %335 to i64
  %337 = trunc i64 %336 to i32
  %338 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %337) #10
  %339 = extractvalue { i32, i32, i32, i32 } %338, 0
  %340 = extractvalue { i32, i32, i32, i32 } %338, 1
  %341 = extractvalue { i32, i32, i32, i32 } %338, 2
  %342 = extractvalue { i32, i32, i32, i32 } %338, 3
  %343 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %197
  %344 = ptrtoint ptr addrspace(3) %343 to i64
  %345 = trunc i64 %344 to i32
  %346 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %345) #10
  %347 = extractvalue { i32, i32, i32, i32 } %346, 0
  %348 = extractvalue { i32, i32, i32, i32 } %346, 1
  %349 = extractvalue { i32, i32, i32, i32 } %346, 2
  %350 = extractvalue { i32, i32, i32, i32 } %346, 3
  %351 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %200
  %352 = ptrtoint ptr addrspace(3) %351 to i64
  %353 = trunc i64 %352 to i32
  %354 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %353) #10
  %355 = extractvalue { i32, i32, i32, i32 } %354, 0
  %356 = extractvalue { i32, i32, i32, i32 } %354, 1
  %357 = extractvalue { i32, i32, i32, i32 } %354, 2
  %358 = extractvalue { i32, i32, i32, i32 } %354, 3
  %359 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %203
  %360 = ptrtoint ptr addrspace(3) %359 to i64
  %361 = trunc i64 %360 to i32
  %362 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %361) #10
  %363 = extractvalue { i32, i32, i32, i32 } %362, 0
  %364 = extractvalue { i32, i32, i32, i32 } %362, 1
  %365 = extractvalue { i32, i32, i32, i32 } %362, 2
  %366 = extractvalue { i32, i32, i32, i32 } %362, 3
  %367 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %206
  %368 = ptrtoint ptr addrspace(3) %367 to i64
  %369 = trunc i64 %368 to i32
  %370 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %369) #10
  %371 = extractvalue { i32, i32, i32, i32 } %370, 0
  %372 = extractvalue { i32, i32, i32, i32 } %370, 1
  %373 = extractvalue { i32, i32, i32, i32 } %370, 2
  %374 = extractvalue { i32, i32, i32, i32 } %370, 3
  %375 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %209
  %376 = ptrtoint ptr addrspace(3) %375 to i64
  %377 = trunc i64 %376 to i32
  %378 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %377) #10
  %379 = extractvalue { i32, i32, i32, i32 } %378, 0
  %380 = extractvalue { i32, i32, i32, i32 } %378, 1
  %381 = extractvalue { i32, i32, i32, i32 } %378, 2
  %382 = extractvalue { i32, i32, i32, i32 } %378, 3
  %383 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %257, i64 %212
  %384 = ptrtoint ptr addrspace(3) %383 to i64
  %385 = trunc i64 %384 to i32
  %386 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %385) #10
  %387 = extractvalue { i32, i32, i32, i32 } %386, 0
  %388 = extractvalue { i32, i32, i32, i32 } %386, 1
  %389 = extractvalue { i32, i32, i32, i32 } %386, 2
  %390 = extractvalue { i32, i32, i32, i32 } %386, 3
  %391 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 0
  %392 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 1
  %393 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 2
  %394 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 3
  %395 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 4
  %396 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 5
  %397 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 6
  %398 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 7
  %399 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 8
  %400 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 9
  %401 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 10
  %402 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 11
  %403 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 12
  %404 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 13
  %405 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 14
  %406 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 15
  %407 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 16
  %408 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 17
  %409 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 18
  %410 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 19
  %411 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 20
  %412 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 21
  %413 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 22
  %414 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 23
  %415 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 24
  %416 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 25
  %417 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 26
  %418 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 27
  %419 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 28
  %420 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 29
  %421 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 30
  %422 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %260, 31
  %423 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %391, float %392, float %393, float %394, i32 0, i32 0, i32 0, i32 0, i32 %267, i32 %268) #10
  %424 = extractvalue { float, float, float, float } %423, 0
  %425 = extractvalue { float, float, float, float } %423, 1
  %426 = extractvalue { float, float, float, float } %423, 2
  %427 = extractvalue { float, float, float, float } %423, 3
  %428 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %395, float %396, float %397, float %398, i32 0, i32 0, i32 0, i32 0, i32 %299, i32 %300) #10
  %429 = extractvalue { float, float, float, float } %428, 0
  %430 = extractvalue { float, float, float, float } %428, 1
  %431 = extractvalue { float, float, float, float } %428, 2
  %432 = extractvalue { float, float, float, float } %428, 3
  %433 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %399, float %400, float %401, float %402, i32 0, i32 0, i32 0, i32 0, i32 %331, i32 %332) #10
  %434 = extractvalue { float, float, float, float } %433, 0
  %435 = extractvalue { float, float, float, float } %433, 1
  %436 = extractvalue { float, float, float, float } %433, 2
  %437 = extractvalue { float, float, float, float } %433, 3
  %438 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %403, float %404, float %405, float %406, i32 0, i32 0, i32 0, i32 0, i32 %363, i32 %364) #10
  %439 = extractvalue { float, float, float, float } %438, 0
  %440 = extractvalue { float, float, float, float } %438, 1
  %441 = extractvalue { float, float, float, float } %438, 2
  %442 = extractvalue { float, float, float, float } %438, 3
  %443 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %407, float %408, float %409, float %410, i32 0, i32 0, i32 0, i32 0, i32 %267, i32 %268) #10
  %444 = extractvalue { float, float, float, float } %443, 0
  %445 = extractvalue { float, float, float, float } %443, 1
  %446 = extractvalue { float, float, float, float } %443, 2
  %447 = extractvalue { float, float, float, float } %443, 3
  %448 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %411, float %412, float %413, float %414, i32 0, i32 0, i32 0, i32 0, i32 %299, i32 %300) #10
  %449 = extractvalue { float, float, float, float } %448, 0
  %450 = extractvalue { float, float, float, float } %448, 1
  %451 = extractvalue { float, float, float, float } %448, 2
  %452 = extractvalue { float, float, float, float } %448, 3
  %453 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %415, float %416, float %417, float %418, i32 0, i32 0, i32 0, i32 0, i32 %331, i32 %332) #10
  %454 = extractvalue { float, float, float, float } %453, 0
  %455 = extractvalue { float, float, float, float } %453, 1
  %456 = extractvalue { float, float, float, float } %453, 2
  %457 = extractvalue { float, float, float, float } %453, 3
  %458 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %419, float %420, float %421, float %422, i32 0, i32 0, i32 0, i32 0, i32 %363, i32 %364) #10
  %459 = extractvalue { float, float, float, float } %458, 0
  %460 = extractvalue { float, float, float, float } %458, 1
  %461 = extractvalue { float, float, float, float } %458, 2
  %462 = extractvalue { float, float, float, float } %458, 3
  %463 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %424, float %425, float %426, float %427, i32 0, i32 0, i32 0, i32 0, i32 %269, i32 %270) #10
  %464 = extractvalue { float, float, float, float } %463, 0
  %465 = extractvalue { float, float, float, float } %463, 1
  %466 = extractvalue { float, float, float, float } %463, 2
  %467 = extractvalue { float, float, float, float } %463, 3
  %468 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %429, float %430, float %431, float %432, i32 0, i32 0, i32 0, i32 0, i32 %301, i32 %302) #10
  %469 = extractvalue { float, float, float, float } %468, 0
  %470 = extractvalue { float, float, float, float } %468, 1
  %471 = extractvalue { float, float, float, float } %468, 2
  %472 = extractvalue { float, float, float, float } %468, 3
  %473 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %434, float %435, float %436, float %437, i32 0, i32 0, i32 0, i32 0, i32 %333, i32 %334) #10
  %474 = extractvalue { float, float, float, float } %473, 0
  %475 = extractvalue { float, float, float, float } %473, 1
  %476 = extractvalue { float, float, float, float } %473, 2
  %477 = extractvalue { float, float, float, float } %473, 3
  %478 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %439, float %440, float %441, float %442, i32 0, i32 0, i32 0, i32 0, i32 %365, i32 %366) #10
  %479 = extractvalue { float, float, float, float } %478, 0
  %480 = extractvalue { float, float, float, float } %478, 1
  %481 = extractvalue { float, float, float, float } %478, 2
  %482 = extractvalue { float, float, float, float } %478, 3
  %483 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %444, float %445, float %446, float %447, i32 0, i32 0, i32 0, i32 0, i32 %269, i32 %270) #10
  %484 = extractvalue { float, float, float, float } %483, 0
  %485 = extractvalue { float, float, float, float } %483, 1
  %486 = extractvalue { float, float, float, float } %483, 2
  %487 = extractvalue { float, float, float, float } %483, 3
  %488 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %449, float %450, float %451, float %452, i32 0, i32 0, i32 0, i32 0, i32 %301, i32 %302) #10
  %489 = extractvalue { float, float, float, float } %488, 0
  %490 = extractvalue { float, float, float, float } %488, 1
  %491 = extractvalue { float, float, float, float } %488, 2
  %492 = extractvalue { float, float, float, float } %488, 3
  %493 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %454, float %455, float %456, float %457, i32 0, i32 0, i32 0, i32 0, i32 %333, i32 %334) #10
  %494 = extractvalue { float, float, float, float } %493, 0
  %495 = extractvalue { float, float, float, float } %493, 1
  %496 = extractvalue { float, float, float, float } %493, 2
  %497 = extractvalue { float, float, float, float } %493, 3
  %498 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %459, float %460, float %461, float %462, i32 0, i32 0, i32 0, i32 0, i32 %365, i32 %366) #10
  %499 = extractvalue { float, float, float, float } %498, 0
  %500 = extractvalue { float, float, float, float } %498, 1
  %501 = extractvalue { float, float, float, float } %498, 2
  %502 = extractvalue { float, float, float, float } %498, 3
  %503 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %464, float %465, float %466, float %467, i32 0, i32 0, i32 0, i32 0, i32 %275, i32 %276) #10
  %504 = extractvalue { float, float, float, float } %503, 0
  %505 = extractvalue { float, float, float, float } %503, 1
  %506 = extractvalue { float, float, float, float } %503, 2
  %507 = extractvalue { float, float, float, float } %503, 3
  %508 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %469, float %470, float %471, float %472, i32 0, i32 0, i32 0, i32 0, i32 %307, i32 %308) #10
  %509 = extractvalue { float, float, float, float } %508, 0
  %510 = extractvalue { float, float, float, float } %508, 1
  %511 = extractvalue { float, float, float, float } %508, 2
  %512 = extractvalue { float, float, float, float } %508, 3
  %513 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %474, float %475, float %476, float %477, i32 0, i32 0, i32 0, i32 0, i32 %339, i32 %340) #10
  %514 = extractvalue { float, float, float, float } %513, 0
  %515 = extractvalue { float, float, float, float } %513, 1
  %516 = extractvalue { float, float, float, float } %513, 2
  %517 = extractvalue { float, float, float, float } %513, 3
  %518 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %479, float %480, float %481, float %482, i32 0, i32 0, i32 0, i32 0, i32 %371, i32 %372) #10
  %519 = extractvalue { float, float, float, float } %518, 0
  %520 = extractvalue { float, float, float, float } %518, 1
  %521 = extractvalue { float, float, float, float } %518, 2
  %522 = extractvalue { float, float, float, float } %518, 3
  %523 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %484, float %485, float %486, float %487, i32 0, i32 0, i32 0, i32 0, i32 %275, i32 %276) #10
  %524 = extractvalue { float, float, float, float } %523, 0
  %525 = extractvalue { float, float, float, float } %523, 1
  %526 = extractvalue { float, float, float, float } %523, 2
  %527 = extractvalue { float, float, float, float } %523, 3
  %528 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %489, float %490, float %491, float %492, i32 0, i32 0, i32 0, i32 0, i32 %307, i32 %308) #10
  %529 = extractvalue { float, float, float, float } %528, 0
  %530 = extractvalue { float, float, float, float } %528, 1
  %531 = extractvalue { float, float, float, float } %528, 2
  %532 = extractvalue { float, float, float, float } %528, 3
  %533 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %494, float %495, float %496, float %497, i32 0, i32 0, i32 0, i32 0, i32 %339, i32 %340) #10
  %534 = extractvalue { float, float, float, float } %533, 0
  %535 = extractvalue { float, float, float, float } %533, 1
  %536 = extractvalue { float, float, float, float } %533, 2
  %537 = extractvalue { float, float, float, float } %533, 3
  %538 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %499, float %500, float %501, float %502, i32 0, i32 0, i32 0, i32 0, i32 %371, i32 %372) #10
  %539 = extractvalue { float, float, float, float } %538, 0
  %540 = extractvalue { float, float, float, float } %538, 1
  %541 = extractvalue { float, float, float, float } %538, 2
  %542 = extractvalue { float, float, float, float } %538, 3
  %543 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %504, float %505, float %506, float %507, i32 0, i32 0, i32 0, i32 0, i32 %277, i32 %278) #10
  %544 = extractvalue { float, float, float, float } %543, 0
  %545 = extractvalue { float, float, float, float } %543, 1
  %546 = extractvalue { float, float, float, float } %543, 2
  %547 = extractvalue { float, float, float, float } %543, 3
  %548 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %509, float %510, float %511, float %512, i32 0, i32 0, i32 0, i32 0, i32 %309, i32 %310) #10
  %549 = extractvalue { float, float, float, float } %548, 0
  %550 = extractvalue { float, float, float, float } %548, 1
  %551 = extractvalue { float, float, float, float } %548, 2
  %552 = extractvalue { float, float, float, float } %548, 3
  %553 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %514, float %515, float %516, float %517, i32 0, i32 0, i32 0, i32 0, i32 %341, i32 %342) #10
  %554 = extractvalue { float, float, float, float } %553, 0
  %555 = extractvalue { float, float, float, float } %553, 1
  %556 = extractvalue { float, float, float, float } %553, 2
  %557 = extractvalue { float, float, float, float } %553, 3
  %558 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %519, float %520, float %521, float %522, i32 0, i32 0, i32 0, i32 0, i32 %373, i32 %374) #10
  %559 = extractvalue { float, float, float, float } %558, 0
  %560 = extractvalue { float, float, float, float } %558, 1
  %561 = extractvalue { float, float, float, float } %558, 2
  %562 = extractvalue { float, float, float, float } %558, 3
  %563 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %524, float %525, float %526, float %527, i32 0, i32 0, i32 0, i32 0, i32 %277, i32 %278) #10
  %564 = extractvalue { float, float, float, float } %563, 0
  %565 = extractvalue { float, float, float, float } %563, 1
  %566 = extractvalue { float, float, float, float } %563, 2
  %567 = extractvalue { float, float, float, float } %563, 3
  %568 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %529, float %530, float %531, float %532, i32 0, i32 0, i32 0, i32 0, i32 %309, i32 %310) #10
  %569 = extractvalue { float, float, float, float } %568, 0
  %570 = extractvalue { float, float, float, float } %568, 1
  %571 = extractvalue { float, float, float, float } %568, 2
  %572 = extractvalue { float, float, float, float } %568, 3
  %573 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %534, float %535, float %536, float %537, i32 0, i32 0, i32 0, i32 0, i32 %341, i32 %342) #10
  %574 = extractvalue { float, float, float, float } %573, 0
  %575 = extractvalue { float, float, float, float } %573, 1
  %576 = extractvalue { float, float, float, float } %573, 2
  %577 = extractvalue { float, float, float, float } %573, 3
  %578 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %539, float %540, float %541, float %542, i32 0, i32 0, i32 0, i32 0, i32 %373, i32 %374) #10
  %579 = extractvalue { float, float, float, float } %578, 0
  %580 = extractvalue { float, float, float, float } %578, 1
  %581 = extractvalue { float, float, float, float } %578, 2
  %582 = extractvalue { float, float, float, float } %578, 3
  %583 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %544, float %545, float %546, float %547, i32 0, i32 0, i32 0, i32 0, i32 %283, i32 %284) #10
  %584 = extractvalue { float, float, float, float } %583, 0
  %585 = extractvalue { float, float, float, float } %583, 1
  %586 = extractvalue { float, float, float, float } %583, 2
  %587 = extractvalue { float, float, float, float } %583, 3
  %588 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %549, float %550, float %551, float %552, i32 0, i32 0, i32 0, i32 0, i32 %315, i32 %316) #10
  %589 = extractvalue { float, float, float, float } %588, 0
  %590 = extractvalue { float, float, float, float } %588, 1
  %591 = extractvalue { float, float, float, float } %588, 2
  %592 = extractvalue { float, float, float, float } %588, 3
  %593 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %554, float %555, float %556, float %557, i32 0, i32 0, i32 0, i32 0, i32 %347, i32 %348) #10
  %594 = extractvalue { float, float, float, float } %593, 0
  %595 = extractvalue { float, float, float, float } %593, 1
  %596 = extractvalue { float, float, float, float } %593, 2
  %597 = extractvalue { float, float, float, float } %593, 3
  %598 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %559, float %560, float %561, float %562, i32 0, i32 0, i32 0, i32 0, i32 %379, i32 %380) #10
  %599 = extractvalue { float, float, float, float } %598, 0
  %600 = extractvalue { float, float, float, float } %598, 1
  %601 = extractvalue { float, float, float, float } %598, 2
  %602 = extractvalue { float, float, float, float } %598, 3
  %603 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %564, float %565, float %566, float %567, i32 0, i32 0, i32 0, i32 0, i32 %283, i32 %284) #10
  %604 = extractvalue { float, float, float, float } %603, 0
  %605 = extractvalue { float, float, float, float } %603, 1
  %606 = extractvalue { float, float, float, float } %603, 2
  %607 = extractvalue { float, float, float, float } %603, 3
  %608 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %569, float %570, float %571, float %572, i32 0, i32 0, i32 0, i32 0, i32 %315, i32 %316) #10
  %609 = extractvalue { float, float, float, float } %608, 0
  %610 = extractvalue { float, float, float, float } %608, 1
  %611 = extractvalue { float, float, float, float } %608, 2
  %612 = extractvalue { float, float, float, float } %608, 3
  %613 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %574, float %575, float %576, float %577, i32 0, i32 0, i32 0, i32 0, i32 %347, i32 %348) #10
  %614 = extractvalue { float, float, float, float } %613, 0
  %615 = extractvalue { float, float, float, float } %613, 1
  %616 = extractvalue { float, float, float, float } %613, 2
  %617 = extractvalue { float, float, float, float } %613, 3
  %618 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %579, float %580, float %581, float %582, i32 0, i32 0, i32 0, i32 0, i32 %379, i32 %380) #10
  %619 = extractvalue { float, float, float, float } %618, 0
  %620 = extractvalue { float, float, float, float } %618, 1
  %621 = extractvalue { float, float, float, float } %618, 2
  %622 = extractvalue { float, float, float, float } %618, 3
  %623 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %584, float %585, float %586, float %587, i32 0, i32 0, i32 0, i32 0, i32 %285, i32 %286) #10
  %624 = extractvalue { float, float, float, float } %623, 0
  %625 = extractvalue { float, float, float, float } %623, 1
  %626 = extractvalue { float, float, float, float } %623, 2
  %627 = extractvalue { float, float, float, float } %623, 3
  %628 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %589, float %590, float %591, float %592, i32 0, i32 0, i32 0, i32 0, i32 %317, i32 %318) #10
  %629 = extractvalue { float, float, float, float } %628, 0
  %630 = extractvalue { float, float, float, float } %628, 1
  %631 = extractvalue { float, float, float, float } %628, 2
  %632 = extractvalue { float, float, float, float } %628, 3
  %633 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %594, float %595, float %596, float %597, i32 0, i32 0, i32 0, i32 0, i32 %349, i32 %350) #10
  %634 = extractvalue { float, float, float, float } %633, 0
  %635 = extractvalue { float, float, float, float } %633, 1
  %636 = extractvalue { float, float, float, float } %633, 2
  %637 = extractvalue { float, float, float, float } %633, 3
  %638 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %599, float %600, float %601, float %602, i32 0, i32 0, i32 0, i32 0, i32 %381, i32 %382) #10
  %639 = extractvalue { float, float, float, float } %638, 0
  %640 = extractvalue { float, float, float, float } %638, 1
  %641 = extractvalue { float, float, float, float } %638, 2
  %642 = extractvalue { float, float, float, float } %638, 3
  %643 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %604, float %605, float %606, float %607, i32 0, i32 0, i32 0, i32 0, i32 %285, i32 %286) #10
  %644 = extractvalue { float, float, float, float } %643, 0
  %645 = extractvalue { float, float, float, float } %643, 1
  %646 = extractvalue { float, float, float, float } %643, 2
  %647 = extractvalue { float, float, float, float } %643, 3
  %648 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %609, float %610, float %611, float %612, i32 0, i32 0, i32 0, i32 0, i32 %317, i32 %318) #10
  %649 = extractvalue { float, float, float, float } %648, 0
  %650 = extractvalue { float, float, float, float } %648, 1
  %651 = extractvalue { float, float, float, float } %648, 2
  %652 = extractvalue { float, float, float, float } %648, 3
  %653 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %614, float %615, float %616, float %617, i32 0, i32 0, i32 0, i32 0, i32 %349, i32 %350) #10
  %654 = extractvalue { float, float, float, float } %653, 0
  %655 = extractvalue { float, float, float, float } %653, 1
  %656 = extractvalue { float, float, float, float } %653, 2
  %657 = extractvalue { float, float, float, float } %653, 3
  %658 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %619, float %620, float %621, float %622, i32 0, i32 0, i32 0, i32 0, i32 %381, i32 %382) #10
  %659 = extractvalue { float, float, float, float } %658, 0
  %660 = extractvalue { float, float, float, float } %658, 1
  %661 = extractvalue { float, float, float, float } %658, 2
  %662 = extractvalue { float, float, float, float } %658, 3
  %663 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %624, float %625, float %626, float %627, i32 0, i32 0, i32 0, i32 0, i32 %291, i32 %292) #10
  %664 = extractvalue { float, float, float, float } %663, 0
  %665 = extractvalue { float, float, float, float } %663, 1
  %666 = extractvalue { float, float, float, float } %663, 2
  %667 = extractvalue { float, float, float, float } %663, 3
  %668 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %629, float %630, float %631, float %632, i32 0, i32 0, i32 0, i32 0, i32 %323, i32 %324) #10
  %669 = extractvalue { float, float, float, float } %668, 0
  %670 = extractvalue { float, float, float, float } %668, 1
  %671 = extractvalue { float, float, float, float } %668, 2
  %672 = extractvalue { float, float, float, float } %668, 3
  %673 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %634, float %635, float %636, float %637, i32 0, i32 0, i32 0, i32 0, i32 %355, i32 %356) #10
  %674 = extractvalue { float, float, float, float } %673, 0
  %675 = extractvalue { float, float, float, float } %673, 1
  %676 = extractvalue { float, float, float, float } %673, 2
  %677 = extractvalue { float, float, float, float } %673, 3
  %678 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %639, float %640, float %641, float %642, i32 0, i32 0, i32 0, i32 0, i32 %387, i32 %388) #10
  %679 = extractvalue { float, float, float, float } %678, 0
  %680 = extractvalue { float, float, float, float } %678, 1
  %681 = extractvalue { float, float, float, float } %678, 2
  %682 = extractvalue { float, float, float, float } %678, 3
  %683 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %644, float %645, float %646, float %647, i32 0, i32 0, i32 0, i32 0, i32 %291, i32 %292) #10
  %684 = extractvalue { float, float, float, float } %683, 0
  %685 = extractvalue { float, float, float, float } %683, 1
  %686 = extractvalue { float, float, float, float } %683, 2
  %687 = extractvalue { float, float, float, float } %683, 3
  %688 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %649, float %650, float %651, float %652, i32 0, i32 0, i32 0, i32 0, i32 %323, i32 %324) #10
  %689 = extractvalue { float, float, float, float } %688, 0
  %690 = extractvalue { float, float, float, float } %688, 1
  %691 = extractvalue { float, float, float, float } %688, 2
  %692 = extractvalue { float, float, float, float } %688, 3
  %693 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %654, float %655, float %656, float %657, i32 0, i32 0, i32 0, i32 0, i32 %355, i32 %356) #10
  %694 = extractvalue { float, float, float, float } %693, 0
  %695 = extractvalue { float, float, float, float } %693, 1
  %696 = extractvalue { float, float, float, float } %693, 2
  %697 = extractvalue { float, float, float, float } %693, 3
  %698 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %659, float %660, float %661, float %662, i32 0, i32 0, i32 0, i32 0, i32 %387, i32 %388) #10
  %699 = extractvalue { float, float, float, float } %698, 0
  %700 = extractvalue { float, float, float, float } %698, 1
  %701 = extractvalue { float, float, float, float } %698, 2
  %702 = extractvalue { float, float, float, float } %698, 3
  %703 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %664, float %665, float %666, float %667, i32 0, i32 0, i32 0, i32 0, i32 %293, i32 %294) #10
  %704 = extractvalue { float, float, float, float } %703, 0
  %705 = extractvalue { float, float, float, float } %703, 1
  %706 = extractvalue { float, float, float, float } %703, 2
  %707 = extractvalue { float, float, float, float } %703, 3
  %708 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %669, float %670, float %671, float %672, i32 0, i32 0, i32 0, i32 0, i32 %325, i32 %326) #10
  %709 = extractvalue { float, float, float, float } %708, 0
  %710 = extractvalue { float, float, float, float } %708, 1
  %711 = extractvalue { float, float, float, float } %708, 2
  %712 = extractvalue { float, float, float, float } %708, 3
  %713 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %674, float %675, float %676, float %677, i32 0, i32 0, i32 0, i32 0, i32 %357, i32 %358) #10
  %714 = extractvalue { float, float, float, float } %713, 0
  %715 = extractvalue { float, float, float, float } %713, 1
  %716 = extractvalue { float, float, float, float } %713, 2
  %717 = extractvalue { float, float, float, float } %713, 3
  %718 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %679, float %680, float %681, float %682, i32 0, i32 0, i32 0, i32 0, i32 %389, i32 %390) #10
  %719 = extractvalue { float, float, float, float } %718, 0
  %720 = extractvalue { float, float, float, float } %718, 1
  %721 = extractvalue { float, float, float, float } %718, 2
  %722 = extractvalue { float, float, float, float } %718, 3
  %723 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %684, float %685, float %686, float %687, i32 0, i32 0, i32 0, i32 0, i32 %293, i32 %294) #10
  %724 = extractvalue { float, float, float, float } %723, 0
  %725 = extractvalue { float, float, float, float } %723, 1
  %726 = extractvalue { float, float, float, float } %723, 2
  %727 = extractvalue { float, float, float, float } %723, 3
  %728 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %689, float %690, float %691, float %692, i32 0, i32 0, i32 0, i32 0, i32 %325, i32 %326) #10
  %729 = extractvalue { float, float, float, float } %728, 0
  %730 = extractvalue { float, float, float, float } %728, 1
  %731 = extractvalue { float, float, float, float } %728, 2
  %732 = extractvalue { float, float, float, float } %728, 3
  %733 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %694, float %695, float %696, float %697, i32 0, i32 0, i32 0, i32 0, i32 %357, i32 %358) #10
  %734 = extractvalue { float, float, float, float } %733, 0
  %735 = extractvalue { float, float, float, float } %733, 1
  %736 = extractvalue { float, float, float, float } %733, 2
  %737 = extractvalue { float, float, float, float } %733, 3
  %738 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %699, float %700, float %701, float %702, i32 0, i32 0, i32 0, i32 0, i32 %389, i32 %390) #10
  %739 = extractvalue { float, float, float, float } %738, 0
  %740 = extractvalue { float, float, float, float } %738, 1
  %741 = extractvalue { float, float, float, float } %738, 2
  %742 = extractvalue { float, float, float, float } %738, 3
  %743 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %704, 0
  %744 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %743, float %705, 1
  %745 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %744, float %706, 2
  %746 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %745, float %707, 3
  %747 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %746, float %709, 4
  %748 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %747, float %710, 5
  %749 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %748, float %711, 6
  %750 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %749, float %712, 7
  %751 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %750, float %714, 8
  %752 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %751, float %715, 9
  %753 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %752, float %716, 10
  %754 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %753, float %717, 11
  %755 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %754, float %719, 12
  %756 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %755, float %720, 13
  %757 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %756, float %721, 14
  %758 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %757, float %722, 15
  %759 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %758, float %724, 16
  %760 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %759, float %725, 17
  %761 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %760, float %726, 18
  %762 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %761, float %727, 19
  %763 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %762, float %729, 20
  %764 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %763, float %730, 21
  %765 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %764, float %731, 22
  %766 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %765, float %732, 23
  %767 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %766, float %734, 24
  %768 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %767, float %735, 25
  %769 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %768, float %736, 26
  %770 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %769, float %737, 27
  %771 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %770, float %739, 28
  %772 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %771, float %740, 29
  %773 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %772, float %741, 30
  %774 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %773, float %742, 31
  %775 = add i32 %259, 1
  %776 = icmp slt i32 %775, 2
  %777 = select i1 %776, i32 %775, i32 0
  %scevgep256 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %215
  %scevgep260 = getelementptr i8, ptr addrspace(1) %lsr.iv258, i64 %215
  %scevgep264 = getelementptr i8, ptr addrspace(1) %lsr.iv262, i64 %215
  %scevgep268 = getelementptr i8, ptr addrspace(1) %lsr.iv266, i64 %215
  %scevgep272 = getelementptr i8, ptr addrspace(1) %lsr.iv270, i64 %215
  %scevgep276 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 %215
  %scevgep280 = getelementptr i8, ptr addrspace(1) %lsr.iv278, i64 %215
  %scevgep284 = getelementptr i8, ptr addrspace(1) %lsr.iv282, i64 %215
  %778 = shl i32 %777, 14
  %779 = sext i32 %778 to i64
  %780 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %779
  tail call void @llvm.nvvm.barrier0()
  %781 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %85
  %782 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %91
  %783 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %97
  %784 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %103
  %785 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %109
  %786 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %115
  %787 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %121
  %788 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %780, i64 %127
  %789 = select i1 %262, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %781, ptr addrspace(1) %scevgep256, i32 %789) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %782, ptr addrspace(1) %scevgep260, i32 %789) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %783, ptr addrspace(1) %scevgep264, i32 %789) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %784, ptr addrspace(1) %scevgep268, i32 %789) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %785, ptr addrspace(1) %scevgep272, i32 %789) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %786, ptr addrspace(1) %scevgep276, i32 %789) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %787, ptr addrspace(1) %scevgep280, i32 %789) #10
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %788, ptr addrspace(1) %scevgep284, i32 %789) #10
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #10
  %790 = add i32 %258, 1
  %791 = icmp slt i32 %790, 2
  %792 = select i1 %791, i32 %790, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %793 = shl i32 %792, 14
  %794 = sext i32 %793 to i64
  %795 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %794
  %scevgep255 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep259 = getelementptr i8, ptr addrspace(1) %lsr.iv258, i64 256
  %scevgep263 = getelementptr i8, ptr addrspace(1) %lsr.iv262, i64 256
  %scevgep267 = getelementptr i8, ptr addrspace(1) %lsr.iv266, i64 256
  %scevgep271 = getelementptr i8, ptr addrspace(1) %lsr.iv270, i64 256
  %scevgep275 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 256
  %scevgep279 = getelementptr i8, ptr addrspace(1) %lsr.iv278, i64 256
  %scevgep283 = getelementptr i8, ptr addrspace(1) %lsr.iv282, i64 256
  %796 = icmp samesign ult i32 %261, 1920
  br i1 %796, label %256, label %797

797:                                              ; preds = %256
  %798 = icmp ult i32 %10, 128
  %799 = srem i32 %1, %5
  %800 = add nsw i32 %799, %3
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #10
  tail call void @llvm.nvvm.barrier0()
  %801 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %704) #10
  %802 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %705) #10
  %803 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %706) #10
  %804 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %707) #10
  %805 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %709) #10
  %806 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %710) #10
  %807 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %711) #10
  %808 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %712) #10
  %809 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %714) #10
  %810 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %715) #10
  %811 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %716) #10
  %812 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %717) #10
  %813 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %719) #10
  %814 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %720) #10
  %815 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %721) #10
  %816 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %722) #10
  %817 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %724) #10
  %818 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %725) #10
  %819 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %726) #10
  %820 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %727) #10
  %821 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %729) #10
  %822 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %730) #10
  %823 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %731) #10
  %824 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %732) #10
  %825 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %734) #10
  %826 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %735) #10
  %827 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %736) #10
  %828 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %737) #10
  %829 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %739) #10
  %830 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %740) #10
  %831 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %741) #10
  %832 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %742) #10
  %833 = shl i32 %800, 6
  %834 = sext i32 %833 to i64
  %835 = or disjoint i64 %834, %36
  %836 = or disjoint i64 %834, %37
  %837 = or disjoint i64 %834, %38
  %838 = or disjoint i64 %834, %39
  %839 = or disjoint i64 %9, %44
  %.idx = shl nsw i64 %835, 14
  %840 = getelementptr i8, ptr addrspace(1) %arg1253, i64 %.idx
  %841 = getelementptr bfloat, ptr addrspace(1) %840, i64 %839
  %.idx2 = shl nsw i64 %836, 14
  %842 = getelementptr i8, ptr addrspace(1) %arg1253, i64 %.idx2
  %843 = getelementptr bfloat, ptr addrspace(1) %842, i64 %839
  %.idx3 = shl nsw i64 %837, 14
  %844 = getelementptr i8, ptr addrspace(1) %arg1253, i64 %.idx3
  %845 = getelementptr bfloat, ptr addrspace(1) %844, i64 %839
  %.idx4 = shl nsw i64 %838, 14
  %846 = getelementptr i8, ptr addrspace(1) %arg1253, i64 %.idx4
  %847 = getelementptr bfloat, ptr addrspace(1) %846, i64 %839
  %848 = shl nuw nsw i32 %10, 1
  %849 = and i32 %848, 6
  %850 = shl nuw nsw i32 %10, 5
  %851 = and i32 %850, 384
  %852 = or disjoint i32 %851, %849
  %853 = shl nuw nsw i32 %11, 5
  %854 = or disjoint i32 %852, %853
  %855 = lshr i32 %10, 2
  %856 = and i32 %855, 24
  %857 = or disjoint i32 %854, %856
  %858 = select i1 %798, i32 0, i32 2048
  %859 = or disjoint i32 %857, %858
  %860 = and i32 %34, 1016
  %861 = or disjoint i32 %860, %83
  %862 = lshr i32 %859, 4
  %863 = and i32 %862, 268435448
  %864 = add nuw nsw i32 %863, %859
  %865 = zext nneg i32 %864 to i64
  %866 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %865
  %867 = bitcast bfloat %801 to i16
  %868 = bitcast bfloat %802 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %866, i16 %867, i16 %868, i1 true) #10
  %869 = or disjoint i32 %859, 1024
  %870 = lshr i32 %869, 4
  %871 = and i32 %870, 268435448
  %872 = zext nneg i32 %871 to i64
  %873 = zext nneg i32 %859 to i64
  %874 = add i64 %872, %873
  %875 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %874
  %876 = getelementptr inbounds i8, ptr addrspace(3) %875, i64 2048
  %877 = bitcast bfloat %803 to i16
  %878 = bitcast bfloat %804 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %876, i16 %877, i16 %878, i1 true) #10
  %879 = zext nneg i32 %863 to i64
  %880 = add i64 %873, %879
  %881 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %880
  %882 = getelementptr inbounds i8, ptr addrspace(3) %881, i64 64
  %883 = bitcast bfloat %805 to i16
  %884 = bitcast bfloat %806 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %882, i16 %883, i16 %884, i1 true) #10
  %885 = or disjoint i32 %859, 1056
  %886 = lshr i32 %885, 4
  %887 = and i32 %886, 268435448
  %888 = zext nneg i32 %887 to i64
  %889 = add i64 %888, %873
  %890 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %889
  %891 = getelementptr inbounds i8, ptr addrspace(3) %890, i64 2112
  %892 = bitcast bfloat %807 to i16
  %893 = bitcast bfloat %808 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %891, i16 %892, i16 %893, i1 true) #10
  %894 = getelementptr inbounds i8, ptr addrspace(3) %881, i64 128
  %895 = bitcast bfloat %809 to i16
  %896 = bitcast bfloat %810 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %894, i16 %895, i16 %896, i1 true) #10
  %897 = or disjoint i32 %859, 1088
  %898 = lshr i32 %897, 4
  %899 = and i32 %898, 268435448
  %900 = zext nneg i32 %899 to i64
  %901 = add i64 %900, %873
  %902 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %901
  %903 = getelementptr inbounds i8, ptr addrspace(3) %902, i64 2176
  %904 = bitcast bfloat %811 to i16
  %905 = bitcast bfloat %812 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %903, i16 %904, i16 %905, i1 true) #10
  %906 = getelementptr inbounds i8, ptr addrspace(3) %881, i64 192
  %907 = bitcast bfloat %813 to i16
  %908 = bitcast bfloat %814 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %906, i16 %907, i16 %908, i1 true) #10
  %909 = or disjoint i32 %859, 1120
  %910 = lshr i32 %909, 4
  %911 = and i32 %910, 268435448
  %912 = zext nneg i32 %911 to i64
  %913 = add i64 %912, %873
  %914 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %913
  %915 = getelementptr inbounds i8, ptr addrspace(3) %914, i64 2240
  %916 = bitcast bfloat %815 to i16
  %917 = bitcast bfloat %816 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %915, i16 %916, i16 %917, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %918 = lshr i32 %861, 4
  %919 = and i32 %918, 120
  %920 = add nuw nsw i32 %919, %861
  %921 = zext nneg i32 %920 to i64
  %922 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %921
  %923 = load <4 x i32>, ptr addrspace(3) %922, align 16
  %924 = or disjoint i32 %861, 2048
  %925 = lshr i32 %924, 4
  %926 = and i32 %925, 248
  %927 = zext nneg i32 %926 to i64
  %928 = zext nneg i32 %861 to i64
  %929 = add i64 %927, %928
  %930 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %929
  %931 = getelementptr inbounds i8, ptr addrspace(3) %930, i64 4096
  %932 = load <4 x i32>, ptr addrspace(3) %931, align 16
  tail call void @llvm.nvvm.barrier0()
  %933 = bitcast bfloat %817 to i16
  %934 = bitcast bfloat %818 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) %866, i16 %933, i16 %934, i1 true) #10
  %935 = bitcast bfloat %819 to i16
  %936 = bitcast bfloat %820 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %876, i16 %935, i16 %936, i1 true) #10
  %937 = bitcast bfloat %821 to i16
  %938 = bitcast bfloat %822 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %882, i16 %937, i16 %938, i1 true) #10
  %939 = bitcast bfloat %823 to i16
  %940 = bitcast bfloat %824 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %891, i16 %939, i16 %940, i1 true) #10
  %941 = bitcast bfloat %825 to i16
  %942 = bitcast bfloat %826 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %894, i16 %941, i16 %942, i1 true) #10
  %943 = bitcast bfloat %827 to i16
  %944 = bitcast bfloat %828 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %903, i16 %943, i16 %944, i1 true) #10
  %945 = bitcast bfloat %829 to i16
  %946 = bitcast bfloat %830 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %906, i16 %945, i16 %946, i1 true) #10
  %947 = bitcast bfloat %831 to i16
  %948 = bitcast bfloat %832 to i16
  tail call void asm sideeffect "@$3 st.shared.v2.b16 [ $0 + 0 ], { $1, $2 };", "r,h,h,b"(ptr addrspace(3) nonnull %915, i16 %947, i16 %948, i1 true) #10
  tail call void @llvm.nvvm.barrier0()
  %949 = load <4 x i32>, ptr addrspace(3) %922, align 16
  %950 = load <4 x i32>, ptr addrspace(3) %931, align 16
  %.extract = extractelement <4 x i32> %923, i64 0
  %.extract52 = extractelement <4 x i32> %923, i64 1
  %.extract54 = extractelement <4 x i32> %923, i64 2
  %.extract56 = extractelement <4 x i32> %923, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract52, i32 %.extract54, i32 %.extract56, ptr addrspace(1) %841) #10
  %.extract58 = extractelement <4 x i32> %932, i64 0
  %.extract60 = extractelement <4 x i32> %932, i64 1
  %.extract62 = extractelement <4 x i32> %932, i64 2
  %.extract64 = extractelement <4 x i32> %932, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract58, i32 %.extract60, i32 %.extract62, i32 %.extract64, ptr addrspace(1) %843) #10
  %.extract66 = extractelement <4 x i32> %949, i64 0
  %.extract68 = extractelement <4 x i32> %949, i64 1
  %.extract70 = extractelement <4 x i32> %949, i64 2
  %.extract72 = extractelement <4 x i32> %949, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract66, i32 %.extract68, i32 %.extract70, i32 %.extract72, ptr addrspace(1) %845) #10
  %.extract74 = extractelement <4 x i32> %950, i64 0
  %.extract76 = extractelement <4 x i32> %950, i64 1
  %.extract78 = extractelement <4 x i32> %950, i64 2
  %.extract80 = extractelement <4 x i32> %950, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract74, i32 %.extract76, i32 %.extract78, i32 %.extract80, ptr addrspace(1) %847) #10
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_111(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1048576) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4) local_unnamed_addr #6 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 14336
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
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 14336
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #10
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #10
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #10
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
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
  %138 = fadd float %68, %122
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
  %154 = fmul float %138, %138
  %155 = fadd float %139, %140
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
  %169 = fadd float %168, %154
  %170 = bitcast float %169 to i32
  %171 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %170, i32 16, i32 31)
  %172 = bitcast i32 %171 to float
  %173 = fadd float %169, %172
  %174 = bitcast float %173 to i32
  %175 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %174, i32 8, i32 31)
  %176 = bitcast i32 %175 to float
  %177 = fadd float %173, %176
  %178 = bitcast float %177 to i32
  %179 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %178, i32 4, i32 31)
  %180 = bitcast i32 %179 to float
  %181 = fadd float %177, %180
  %182 = bitcast float %181 to i32
  %183 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %182, i32 2, i32 31)
  %184 = bitcast i32 %183 to float
  %185 = fadd float %181, %184
  %186 = bitcast float %185 to i32
  %187 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %186, i32 1, i32 31)
  %188 = bitcast i32 %187 to float
  %189 = fadd float %185, %188
  %190 = icmp eq i32 %7, 0
  %191 = zext nneg i32 %8 to i64
  %192 = getelementptr float, ptr addrspace(3) @global_smem, i64 %191
  %193 = bitcast float %189 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %192, <1 x i32> %193, i1 %190) #10
  tail call void @llvm.nvvm.barrier0()
  %194 = icmp samesign ult i32 %6, 2
  %195 = zext nneg i32 %6 to i64
  %196 = getelementptr float, ptr addrspace(3) @global_smem, i64 %195
  %197 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %196, i1 %194) #10
  %198 = bitcast i32 %197 to float
  %199 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %197, i32 1, i32 31)
  %200 = bitcast i32 %199 to float
  %201 = fadd float %198, %200
  %202 = icmp eq i32 %6, 0
  %203 = bitcast float %201 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %196, <1 x i32> %203, i1 %202) #10
  tail call void @llvm.nvvm.barrier0()
  %204 = load float, ptr addrspace(3) @global_smem, align 16
  %205 = fmul float %204, 0x3F50000000000000
  %206 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %207 = bitcast i32 %206 to float
  %208 = fadd float %205, %207
  %209 = tail call float @llvm.nvvm.rsqrt.approx.f(float %208)
  %210 = fmul float %123, %209
  %211 = fmul float %124, %209
  %212 = fmul float %125, %209
  %213 = fmul float %126, %209
  %214 = fmul float %127, %209
  %215 = fmul float %128, %209
  %216 = fmul float %129, %209
  %217 = fmul float %130, %209
  %218 = fmul float %131, %209
  %219 = fmul float %132, %209
  %220 = fmul float %133, %209
  %221 = fmul float %134, %209
  %222 = fmul float %135, %209
  %223 = fmul float %136, %209
  %224 = fmul float %137, %209
  %225 = fmul float %138, %209
  %226 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %14
  %227 = getelementptr i8, ptr addrspace(1) %226, i64 1024
  %228 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %226) #10
  %229 = extractvalue { i32, i32, i32, i32 } %228, 0
  %230 = bitcast i32 %229 to <2 x bfloat>
  %231 = extractvalue { i32, i32, i32, i32 } %228, 1
  %232 = bitcast i32 %231 to <2 x bfloat>
  %233 = extractvalue { i32, i32, i32, i32 } %228, 2
  %234 = bitcast i32 %233 to <2 x bfloat>
  %235 = extractvalue { i32, i32, i32, i32 } %228, 3
  %236 = bitcast i32 %235 to <2 x bfloat>
  %237 = extractelement <2 x bfloat> %230, i64 0
  %238 = extractelement <2 x bfloat> %230, i64 1
  %239 = extractelement <2 x bfloat> %232, i64 0
  %240 = extractelement <2 x bfloat> %232, i64 1
  %241 = extractelement <2 x bfloat> %234, i64 0
  %242 = extractelement <2 x bfloat> %234, i64 1
  %243 = extractelement <2 x bfloat> %236, i64 0
  %244 = extractelement <2 x bfloat> %236, i64 1
  %245 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #10
  %246 = extractvalue { i32, i32, i32, i32 } %245, 0
  %247 = bitcast i32 %246 to <2 x bfloat>
  %248 = extractvalue { i32, i32, i32, i32 } %245, 1
  %249 = bitcast i32 %248 to <2 x bfloat>
  %250 = extractvalue { i32, i32, i32, i32 } %245, 2
  %251 = bitcast i32 %250 to <2 x bfloat>
  %252 = extractvalue { i32, i32, i32, i32 } %245, 3
  %253 = bitcast i32 %252 to <2 x bfloat>
  %254 = extractelement <2 x bfloat> %247, i64 0
  %255 = extractelement <2 x bfloat> %247, i64 1
  %256 = extractelement <2 x bfloat> %249, i64 0
  %257 = extractelement <2 x bfloat> %249, i64 1
  %258 = extractelement <2 x bfloat> %251, i64 0
  %259 = extractelement <2 x bfloat> %251, i64 1
  %260 = extractelement <2 x bfloat> %253, i64 0
  %261 = extractelement <2 x bfloat> %253, i64 1
  %262 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #10
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #10
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %254) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
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
  %293 = fmul float %225, %277
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
  %309 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %293) #10
  %310 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %311 = getelementptr bfloat, ptr addrspace(1) %310, i64 %14
  %312 = getelementptr i8, ptr addrspace(1) %311, i64 1024
  %313 = insertelement <2 x bfloat> poison, bfloat %294, i64 0
  %314 = insertelement <2 x bfloat> %313, bfloat %295, i64 1
  %315 = bitcast <2 x bfloat> %314 to i32
  %316 = insertelement <2 x bfloat> poison, bfloat %296, i64 0
  %317 = insertelement <2 x bfloat> %316, bfloat %297, i64 1
  %318 = bitcast <2 x bfloat> %317 to i32
  %319 = insertelement <2 x bfloat> poison, bfloat %298, i64 0
  %320 = insertelement <2 x bfloat> %319, bfloat %299, i64 1
  %321 = bitcast <2 x bfloat> %320 to i32
  %322 = insertelement <2 x bfloat> poison, bfloat %300, i64 0
  %323 = insertelement <2 x bfloat> %322, bfloat %301, i64 1
  %324 = bitcast <2 x bfloat> %323 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %315, i32 %318, i32 %321, i32 %324, ptr addrspace(1) %311) #10
  %325 = insertelement <2 x bfloat> poison, bfloat %302, i64 0
  %326 = insertelement <2 x bfloat> %325, bfloat %303, i64 1
  %327 = bitcast <2 x bfloat> %326 to i32
  %328 = insertelement <2 x bfloat> poison, bfloat %304, i64 0
  %329 = insertelement <2 x bfloat> %328, bfloat %305, i64 1
  %330 = bitcast <2 x bfloat> %329 to i32
  %331 = insertelement <2 x bfloat> poison, bfloat %306, i64 0
  %332 = insertelement <2 x bfloat> %331, bfloat %307, i64 1
  %333 = bitcast <2 x bfloat> %332 to i32
  %334 = insertelement <2 x bfloat> poison, bfloat %308, i64 0
  %335 = insertelement <2 x bfloat> %334, bfloat %309, i64 1
  %336 = bitcast <2 x bfloat> %335 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %327, i32 %330, i32 %333, i32 %336, ptr addrspace(1) %312) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion_7(ptr noalias readonly align 128 captures(none) dereferenceable(786432) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(393216) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_110(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1048576) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 12288
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
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 12288
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #10
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #10
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #10
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 14336
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 14336
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
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
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #10
  %177 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #10
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
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #10
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
  %245 = fadd float %176, %229
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
  %261 = fadd float %122, %245
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
  %277 = fadd float %68, %261
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
  %293 = fmul float %277, %277
  %294 = fadd float %278, %279
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
  %308 = fadd float %307, %293
  %309 = bitcast float %308 to i32
  %310 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %309, i32 16, i32 31)
  %311 = bitcast i32 %310 to float
  %312 = fadd float %308, %311
  %313 = bitcast float %312 to i32
  %314 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %313, i32 8, i32 31)
  %315 = bitcast i32 %314 to float
  %316 = fadd float %312, %315
  %317 = bitcast float %316 to i32
  %318 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %317, i32 4, i32 31)
  %319 = bitcast i32 %318 to float
  %320 = fadd float %316, %319
  %321 = bitcast float %320 to i32
  %322 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %321, i32 2, i32 31)
  %323 = bitcast i32 %322 to float
  %324 = fadd float %320, %323
  %325 = bitcast float %324 to i32
  %326 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %325, i32 1, i32 31)
  %327 = bitcast i32 %326 to float
  %328 = fadd float %324, %327
  %329 = icmp eq i32 %7, 0
  %330 = zext nneg i32 %8 to i64
  %331 = getelementptr float, ptr addrspace(3) @global_smem, i64 %330
  %332 = bitcast float %328 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %331, <1 x i32> %332, i1 %329) #10
  tail call void @llvm.nvvm.barrier0()
  %333 = icmp samesign ult i32 %6, 2
  %334 = zext nneg i32 %6 to i64
  %335 = getelementptr float, ptr addrspace(3) @global_smem, i64 %334
  %336 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %335, i1 %333) #10
  %337 = bitcast i32 %336 to float
  %338 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %336, i32 1, i32 31)
  %339 = bitcast i32 %338 to float
  %340 = fadd float %337, %339
  %341 = icmp eq i32 %6, 0
  %342 = bitcast float %340 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %335, <1 x i32> %342, i1 %341) #10
  tail call void @llvm.nvvm.barrier0()
  %343 = load float, ptr addrspace(3) @global_smem, align 16
  %344 = fmul float %343, 0x3F50000000000000
  %345 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %346 = bitcast i32 %345 to float
  %347 = fadd float %344, %346
  %348 = tail call float @llvm.nvvm.rsqrt.approx.f(float %347)
  %349 = fmul float %262, %348
  %350 = fmul float %263, %348
  %351 = fmul float %264, %348
  %352 = fmul float %265, %348
  %353 = fmul float %266, %348
  %354 = fmul float %267, %348
  %355 = fmul float %268, %348
  %356 = fmul float %269, %348
  %357 = fmul float %270, %348
  %358 = fmul float %271, %348
  %359 = fmul float %272, %348
  %360 = fmul float %273, %348
  %361 = fmul float %274, %348
  %362 = fmul float %275, %348
  %363 = fmul float %276, %348
  %364 = fmul float %277, %348
  %365 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %14
  %366 = getelementptr i8, ptr addrspace(1) %365, i64 1024
  %367 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %365) #10
  %368 = extractvalue { i32, i32, i32, i32 } %367, 0
  %369 = bitcast i32 %368 to <2 x bfloat>
  %370 = extractvalue { i32, i32, i32, i32 } %367, 1
  %371 = bitcast i32 %370 to <2 x bfloat>
  %372 = extractvalue { i32, i32, i32, i32 } %367, 2
  %373 = bitcast i32 %372 to <2 x bfloat>
  %374 = extractvalue { i32, i32, i32, i32 } %367, 3
  %375 = bitcast i32 %374 to <2 x bfloat>
  %376 = extractelement <2 x bfloat> %369, i64 0
  %377 = extractelement <2 x bfloat> %369, i64 1
  %378 = extractelement <2 x bfloat> %371, i64 0
  %379 = extractelement <2 x bfloat> %371, i64 1
  %380 = extractelement <2 x bfloat> %373, i64 0
  %381 = extractelement <2 x bfloat> %373, i64 1
  %382 = extractelement <2 x bfloat> %375, i64 0
  %383 = extractelement <2 x bfloat> %375, i64 1
  %384 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %366) #10
  %385 = extractvalue { i32, i32, i32, i32 } %384, 0
  %386 = bitcast i32 %385 to <2 x bfloat>
  %387 = extractvalue { i32, i32, i32, i32 } %384, 1
  %388 = bitcast i32 %387 to <2 x bfloat>
  %389 = extractvalue { i32, i32, i32, i32 } %384, 2
  %390 = bitcast i32 %389 to <2 x bfloat>
  %391 = extractvalue { i32, i32, i32, i32 } %384, 3
  %392 = bitcast i32 %391 to <2 x bfloat>
  %393 = extractelement <2 x bfloat> %386, i64 0
  %394 = extractelement <2 x bfloat> %386, i64 1
  %395 = extractelement <2 x bfloat> %388, i64 0
  %396 = extractelement <2 x bfloat> %388, i64 1
  %397 = extractelement <2 x bfloat> %390, i64 0
  %398 = extractelement <2 x bfloat> %390, i64 1
  %399 = extractelement <2 x bfloat> %392, i64 0
  %400 = extractelement <2 x bfloat> %392, i64 1
  %401 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %376) #10
  %402 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %377) #10
  %403 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %378) #10
  %404 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %379) #10
  %405 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %380) #10
  %406 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %381) #10
  %407 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %382) #10
  %408 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %383) #10
  %409 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %393) #10
  %410 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %394) #10
  %411 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %395) #10
  %412 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %396) #10
  %413 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %397) #10
  %414 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %398) #10
  %415 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %399) #10
  %416 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #10
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
  %432 = fmul float %364, %416
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
  %448 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %432) #10
  %449 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %450 = getelementptr bfloat, ptr addrspace(1) %449, i64 %14
  %451 = getelementptr i8, ptr addrspace(1) %450, i64 1024
  %452 = insertelement <2 x bfloat> poison, bfloat %433, i64 0
  %453 = insertelement <2 x bfloat> %452, bfloat %434, i64 1
  %454 = bitcast <2 x bfloat> %453 to i32
  %455 = insertelement <2 x bfloat> poison, bfloat %435, i64 0
  %456 = insertelement <2 x bfloat> %455, bfloat %436, i64 1
  %457 = bitcast <2 x bfloat> %456 to i32
  %458 = insertelement <2 x bfloat> poison, bfloat %437, i64 0
  %459 = insertelement <2 x bfloat> %458, bfloat %438, i64 1
  %460 = bitcast <2 x bfloat> %459 to i32
  %461 = insertelement <2 x bfloat> poison, bfloat %439, i64 0
  %462 = insertelement <2 x bfloat> %461, bfloat %440, i64 1
  %463 = bitcast <2 x bfloat> %462 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %454, i32 %457, i32 %460, i32 %463, ptr addrspace(1) %450) #10
  %464 = insertelement <2 x bfloat> poison, bfloat %441, i64 0
  %465 = insertelement <2 x bfloat> %464, bfloat %442, i64 1
  %466 = bitcast <2 x bfloat> %465 to i32
  %467 = insertelement <2 x bfloat> poison, bfloat %443, i64 0
  %468 = insertelement <2 x bfloat> %467, bfloat %444, i64 1
  %469 = bitcast <2 x bfloat> %468 to i32
  %470 = insertelement <2 x bfloat> poison, bfloat %445, i64 0
  %471 = insertelement <2 x bfloat> %470, bfloat %446, i64 1
  %472 = bitcast <2 x bfloat> %471 to i32
  %473 = insertelement <2 x bfloat> poison, bfloat %447, i64 0
  %474 = insertelement <2 x bfloat> %473, bfloat %448, i64 1
  %475 = bitcast <2 x bfloat> %474 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %466, i32 %469, i32 %472, i32 %475, ptr addrspace(1) %451) #10
  ret void
}

define ptx_kernel void @fusion_109(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1048576) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 10240
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
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 10240
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #10
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #10
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #10
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 12288
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 12288
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
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
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #10
  %177 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #10
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
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #10
  %230 = getelementptr i8, ptr addrspace(1) %4, i64 14336
  %231 = getelementptr i8, ptr addrspace(1) %15, i64 14336
  %232 = getelementptr bfloat, ptr addrspace(1) %230, i64 %14
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 1024
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #10
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
  %251 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #10
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
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #10
  %284 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %285 = getelementptr bfloat, ptr addrspace(1) %284, i64 %14
  %286 = getelementptr i8, ptr addrspace(1) %285, i64 1024
  %287 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
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
  %304 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %286) #10
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
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #10
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
  %352 = fadd float %283, %336
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
  %368 = fadd float %229, %352
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
  %384 = fadd float %176, %368
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
  %400 = fadd float %122, %384
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
  %416 = fadd float %68, %400
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
  %432 = fmul float %416, %416
  %433 = fadd float %417, %418
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
  %447 = fadd float %446, %432
  %448 = bitcast float %447 to i32
  %449 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %448, i32 16, i32 31)
  %450 = bitcast i32 %449 to float
  %451 = fadd float %447, %450
  %452 = bitcast float %451 to i32
  %453 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %452, i32 8, i32 31)
  %454 = bitcast i32 %453 to float
  %455 = fadd float %451, %454
  %456 = bitcast float %455 to i32
  %457 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %456, i32 4, i32 31)
  %458 = bitcast i32 %457 to float
  %459 = fadd float %455, %458
  %460 = bitcast float %459 to i32
  %461 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %460, i32 2, i32 31)
  %462 = bitcast i32 %461 to float
  %463 = fadd float %459, %462
  %464 = bitcast float %463 to i32
  %465 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %464, i32 1, i32 31)
  %466 = bitcast i32 %465 to float
  %467 = fadd float %463, %466
  %468 = icmp eq i32 %7, 0
  %469 = zext nneg i32 %8 to i64
  %470 = getelementptr float, ptr addrspace(3) @global_smem, i64 %469
  %471 = bitcast float %467 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %470, <1 x i32> %471, i1 %468) #10
  tail call void @llvm.nvvm.barrier0()
  %472 = icmp samesign ult i32 %6, 2
  %473 = zext nneg i32 %6 to i64
  %474 = getelementptr float, ptr addrspace(3) @global_smem, i64 %473
  %475 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %474, i1 %472) #10
  %476 = bitcast i32 %475 to float
  %477 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %475, i32 1, i32 31)
  %478 = bitcast i32 %477 to float
  %479 = fadd float %476, %478
  %480 = icmp eq i32 %6, 0
  %481 = bitcast float %479 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %474, <1 x i32> %481, i1 %480) #10
  tail call void @llvm.nvvm.barrier0()
  %482 = load float, ptr addrspace(3) @global_smem, align 16
  %483 = fmul float %482, 0x3F50000000000000
  %484 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %485 = bitcast i32 %484 to float
  %486 = fadd float %483, %485
  %487 = tail call float @llvm.nvvm.rsqrt.approx.f(float %486)
  %488 = fmul float %401, %487
  %489 = fmul float %402, %487
  %490 = fmul float %403, %487
  %491 = fmul float %404, %487
  %492 = fmul float %405, %487
  %493 = fmul float %406, %487
  %494 = fmul float %407, %487
  %495 = fmul float %408, %487
  %496 = fmul float %409, %487
  %497 = fmul float %410, %487
  %498 = fmul float %411, %487
  %499 = fmul float %412, %487
  %500 = fmul float %413, %487
  %501 = fmul float %414, %487
  %502 = fmul float %415, %487
  %503 = fmul float %416, %487
  %504 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %14
  %505 = getelementptr i8, ptr addrspace(1) %504, i64 1024
  %506 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %504) #10
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
  %523 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %505) #10
  %524 = extractvalue { i32, i32, i32, i32 } %523, 0
  %525 = bitcast i32 %524 to <2 x bfloat>
  %526 = extractvalue { i32, i32, i32, i32 } %523, 1
  %527 = bitcast i32 %526 to <2 x bfloat>
  %528 = extractvalue { i32, i32, i32, i32 } %523, 2
  %529 = bitcast i32 %528 to <2 x bfloat>
  %530 = extractvalue { i32, i32, i32, i32 } %523, 3
  %531 = bitcast i32 %530 to <2 x bfloat>
  %532 = extractelement <2 x bfloat> %525, i64 0
  %533 = extractelement <2 x bfloat> %525, i64 1
  %534 = extractelement <2 x bfloat> %527, i64 0
  %535 = extractelement <2 x bfloat> %527, i64 1
  %536 = extractelement <2 x bfloat> %529, i64 0
  %537 = extractelement <2 x bfloat> %529, i64 1
  %538 = extractelement <2 x bfloat> %531, i64 0
  %539 = extractelement <2 x bfloat> %531, i64 1
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #10
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #10
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #10
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #10
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #10
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #10
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #10
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #10
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #10
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #10
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #10
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #10
  %552 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %536) #10
  %553 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %537) #10
  %554 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %538) #10
  %555 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %539) #10
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
  %571 = fmul float %503, %555
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
  %587 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %571) #10
  %588 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %69
  %589 = getelementptr bfloat, ptr addrspace(1) %588, i64 %14
  %590 = getelementptr i8, ptr addrspace(1) %589, i64 1024
  %591 = insertelement <2 x bfloat> poison, bfloat %572, i64 0
  %592 = insertelement <2 x bfloat> %591, bfloat %573, i64 1
  %593 = bitcast <2 x bfloat> %592 to i32
  %594 = insertelement <2 x bfloat> poison, bfloat %574, i64 0
  %595 = insertelement <2 x bfloat> %594, bfloat %575, i64 1
  %596 = bitcast <2 x bfloat> %595 to i32
  %597 = insertelement <2 x bfloat> poison, bfloat %576, i64 0
  %598 = insertelement <2 x bfloat> %597, bfloat %577, i64 1
  %599 = bitcast <2 x bfloat> %598 to i32
  %600 = insertelement <2 x bfloat> poison, bfloat %578, i64 0
  %601 = insertelement <2 x bfloat> %600, bfloat %579, i64 1
  %602 = bitcast <2 x bfloat> %601 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %593, i32 %596, i32 %599, i32 %602, ptr addrspace(1) %589) #10
  %603 = insertelement <2 x bfloat> poison, bfloat %580, i64 0
  %604 = insertelement <2 x bfloat> %603, bfloat %581, i64 1
  %605 = bitcast <2 x bfloat> %604 to i32
  %606 = insertelement <2 x bfloat> poison, bfloat %582, i64 0
  %607 = insertelement <2 x bfloat> %606, bfloat %583, i64 1
  %608 = bitcast <2 x bfloat> %607 to i32
  %609 = insertelement <2 x bfloat> poison, bfloat %584, i64 0
  %610 = insertelement <2 x bfloat> %609, bfloat %585, i64 1
  %611 = bitcast <2 x bfloat> %610 to i32
  %612 = insertelement <2 x bfloat> poison, bfloat %586, i64 0
  %613 = insertelement <2 x bfloat> %612, bfloat %587, i64 1
  %614 = bitcast <2 x bfloat> %613 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %605, i32 %608, i32 %611, i32 %614, ptr addrspace(1) %590) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(1048576) %0, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %1, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %2, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %3, ptr noalias readonly align 128 captures(none) dereferenceable(131072) %4, ptr noalias writeonly align 128 captures(none) dereferenceable(262144) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %15 = shl nuw nsw i32 %14, 7
  %16 = and i32 %15, 896
  %17 = or disjoint i32 %16, %13
  %18 = or disjoint i32 %15, %13
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %19
  %21 = load bfloat, ptr addrspace(1) %20, align 2, !invariant.load !6
  %22 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %19
  %23 = load bfloat, ptr addrspace(1) %22, align 2, !invariant.load !6
  %24 = shl nuw nsw i32 %14, 10
  %25 = and i32 %24, 516096
  %26 = or disjoint i32 %24, %17
  %27 = or i32 %26, 7168
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds bfloat, ptr addrspace(1) %12, i64 %28
  %30 = load bfloat, ptr addrspace(1) %29, align 2, !invariant.load !6, !alias.scope !15
  %31 = fpext bfloat %30 to float
  %32 = fpext bfloat %21 to float
  %33 = fpext bfloat %23 to float
  %34 = fadd float %32, %31
  %35 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %19
  %36 = load bfloat, ptr addrspace(1) %35, align 2, !invariant.load !6
  %37 = or disjoint i32 %17, %25
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr bfloat, ptr addrspace(1) %12, i64 %38
  %40 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 12288
  %41 = load bfloat, ptr addrspace(1) %40, align 2, !invariant.load !6, !alias.scope !18
  %42 = fpext bfloat %41 to float
  %43 = fadd float %34, %33
  %44 = fpext bfloat %36 to float
  %45 = fadd float %43, %42
  %46 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %19
  %47 = load bfloat, ptr addrspace(1) %46, align 2, !invariant.load !6
  %48 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 10240
  %49 = load bfloat, ptr addrspace(1) %48, align 2, !invariant.load !6, !alias.scope !21
  %50 = fpext bfloat %49 to float
  %51 = fadd float %45, %44
  %52 = fpext bfloat %47 to float
  %53 = fadd float %51, %50
  %54 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 8192
  %55 = load bfloat, ptr addrspace(1) %54, align 2, !invariant.load !6, !alias.scope !24
  %56 = fpext bfloat %55 to float
  %57 = fadd float %53, %52
  %58 = fadd float %57, %56
  %59 = getelementptr inbounds float, ptr addrspace(1) %7, i64 %19
  store float %58, ptr addrspace(1) %59, align 4
  ret void
}

define ptx_kernel void @fusion_108(ptr noalias align 128 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3) local_unnamed_addr #6 {
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

define ptx_kernel void @fusion_107(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1048576) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
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
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #10
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #10
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #10
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %123 = getelementptr float, ptr addrspace(1) %arg13, i64 %69
  %124 = getelementptr float, ptr addrspace(1) %123, i64 %14
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 16
  %126 = getelementptr i8, ptr addrspace(1) %124, i64 2048
  %127 = getelementptr i8, ptr addrspace(1) %124, i64 2064
  %128 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
  %129 = extractvalue { i32, i32, i32, i32 } %128, 0
  %130 = extractvalue { i32, i32, i32, i32 } %128, 1
  %131 = extractvalue { i32, i32, i32, i32 } %128, 2
  %132 = extractvalue { i32, i32, i32, i32 } %128, 3
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = bitcast i32 %132 to float
  %137 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #10
  %138 = extractvalue { i32, i32, i32, i32 } %137, 0
  %139 = extractvalue { i32, i32, i32, i32 } %137, 1
  %140 = extractvalue { i32, i32, i32, i32 } %137, 2
  %141 = extractvalue { i32, i32, i32, i32 } %137, 3
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = bitcast i32 %141 to float
  %146 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
  %147 = extractvalue { i32, i32, i32, i32 } %146, 0
  %148 = extractvalue { i32, i32, i32, i32 } %146, 1
  %149 = extractvalue { i32, i32, i32, i32 } %146, 2
  %150 = extractvalue { i32, i32, i32, i32 } %146, 3
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = bitcast i32 %150 to float
  %155 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %127) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %249, <1 x i32> %250, i1 %247) #10
  tail call void @llvm.nvvm.barrier0()
  %251 = icmp samesign ult i32 %6, 2
  %252 = zext nneg i32 %6 to i64
  %253 = getelementptr float, ptr addrspace(3) @global_smem, i64 %252
  %254 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %253, i1 %251) #10
  %255 = bitcast i32 %254 to float
  %256 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %254, i32 1, i32 31)
  %257 = bitcast i32 %256 to float
  %258 = fadd float %255, %257
  %259 = icmp eq i32 %6, 0
  %260 = bitcast float %258 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %253, <1 x i32> %260, i1 %259) #10
  tail call void @llvm.nvvm.barrier0()
  %261 = load float, ptr addrspace(3) @global_smem, align 16
  %262 = fmul float %261, 0x3F50000000000000
  %263 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %283 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %14
  %284 = getelementptr i8, ptr addrspace(1) %283, i64 1024
  %285 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #10
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
  %302 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #10
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
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #10
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #10
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
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
  %366 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %350) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %372, i32 %375, i32 %378, i32 %381, ptr addrspace(1) %368) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %384, i32 %387, i32 %390, i32 %393, ptr addrspace(1) %369) #10
  ret void
}

define ptx_kernel void @fusion_106(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(1048576) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #10
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %5 = getelementptr i8, ptr addrspace(1) %4, i64 4096
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
  %16 = getelementptr i8, ptr addrspace(1) %15, i64 4096
  %17 = getelementptr bfloat, ptr addrspace(1) %5, i64 %14
  %18 = getelementptr i8, ptr addrspace(1) %17, i64 1024
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #10
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #10
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #10
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
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
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #10
  %177 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #10
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
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #10
  %230 = getelementptr float, ptr addrspace(1) %arg25, i64 %69
  %231 = getelementptr float, ptr addrspace(1) %230, i64 %14
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 16
  %233 = getelementptr i8, ptr addrspace(1) %231, i64 2048
  %234 = getelementptr i8, ptr addrspace(1) %231, i64 2064
  %235 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #10
  %236 = extractvalue { i32, i32, i32, i32 } %235, 0
  %237 = extractvalue { i32, i32, i32, i32 } %235, 1
  %238 = extractvalue { i32, i32, i32, i32 } %235, 2
  %239 = extractvalue { i32, i32, i32, i32 } %235, 3
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = bitcast i32 %239 to float
  %244 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #10
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = extractvalue { i32, i32, i32, i32 } %244, 1
  %247 = extractvalue { i32, i32, i32, i32 } %244, 2
  %248 = extractvalue { i32, i32, i32, i32 } %244, 3
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = bitcast i32 %248 to float
  %253 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #10
  %254 = extractvalue { i32, i32, i32, i32 } %253, 0
  %255 = extractvalue { i32, i32, i32, i32 } %253, 1
  %256 = extractvalue { i32, i32, i32, i32 } %253, 2
  %257 = extractvalue { i32, i32, i32, i32 } %253, 3
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = bitcast i32 %257 to float
  %262 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %234) #10
  %263 = extractvalue { i32, i32, i32, i32 } %262, 0
  %264 = extractvalue { i32, i32, i32, i32 } %262, 1
  %265 = extractvalue { i32, i32, i32, i32 } %262, 2
  %266 = extractvalue { i32, i32, i32, i32 } %262, 3
  %267 = bitcast i32 %263 to float
  %268 = bitcast i32 %264 to float
  %269 = bitcast i32 %265 to float
  %270 = bitcast i32 %266 to float
  %271 = fadd float %214, %240
  %272 = fadd float %215, %241
  %273 = fadd float %216, %242
  %274 = fadd float %217, %243
  %275 = fadd float %218, %249
  %276 = fadd float %219, %250
  %277 = fadd float %220, %251
  %278 = fadd float %221, %252
  %279 = fadd float %222, %258
  %280 = fadd float %223, %259
  %281 = fadd float %224, %260
  %282 = fadd float %225, %261
  %283 = fadd float %226, %267
  %284 = fadd float %227, %268
  %285 = fadd float %228, %269
  %286 = fadd float %229, %270
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
  %302 = fadd float %176, %286
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
  %318 = fadd float %122, %302
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
  %334 = fadd float %68, %318
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
  %350 = fmul float %334, %334
  %351 = fadd float %335, %336
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
  %365 = fadd float %350, %364
  %366 = bitcast float %365 to i32
  %367 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %366, i32 16, i32 31)
  %368 = bitcast i32 %367 to float
  %369 = fadd float %365, %368
  %370 = bitcast float %369 to i32
  %371 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %370, i32 8, i32 31)
  %372 = bitcast i32 %371 to float
  %373 = fadd float %369, %372
  %374 = bitcast float %373 to i32
  %375 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %374, i32 4, i32 31)
  %376 = bitcast i32 %375 to float
  %377 = fadd float %373, %376
  %378 = bitcast float %377 to i32
  %379 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %378, i32 2, i32 31)
  %380 = bitcast i32 %379 to float
  %381 = fadd float %377, %380
  %382 = bitcast float %381 to i32
  %383 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %382, i32 1, i32 31)
  %384 = bitcast i32 %383 to float
  %385 = fadd float %381, %384
  %386 = icmp eq i32 %7, 0
  %387 = zext nneg i32 %8 to i64
  %388 = getelementptr float, ptr addrspace(3) @global_smem, i64 %387
  %389 = bitcast float %385 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %388, <1 x i32> %389, i1 %386) #10
  tail call void @llvm.nvvm.barrier0()
  %390 = icmp samesign ult i32 %6, 2
  %391 = zext nneg i32 %6 to i64
  %392 = getelementptr float, ptr addrspace(3) @global_smem, i64 %391
  %393 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %392, i1 %390) #10
  %394 = bitcast i32 %393 to float
  %395 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %393, i32 1, i32 31)
  %396 = bitcast i32 %395 to float
  %397 = fadd float %394, %396
  %398 = icmp eq i32 %6, 0
  %399 = bitcast float %397 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %392, <1 x i32> %399, i1 %398) #10
  tail call void @llvm.nvvm.barrier0()
  %400 = load float, ptr addrspace(3) @global_smem, align 16
  %401 = fmul float %400, 0x3F50000000000000
  %402 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %403 = bitcast i32 %402 to float
  %404 = fadd float %401, %403
  %405 = tail call float @llvm.nvvm.rsqrt.approx.f(float %404)
  %406 = fmul float %319, %405
  %407 = fmul float %320, %405
  %408 = fmul float %321, %405
  %409 = fmul float %322, %405
  %410 = fmul float %323, %405
  %411 = fmul float %324, %405
  %412 = fmul float %325, %405
  %413 = fmul float %326, %405
  %414 = fmul float %327, %405
  %415 = fmul float %328, %405
  %416 = fmul float %329, %405
  %417 = fmul float %330, %405
  %418 = fmul float %331, %405
  %419 = fmul float %332, %405
  %420 = fmul float %333, %405
  %421 = fmul float %334, %405
  %422 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %14
  %423 = getelementptr i8, ptr addrspace(1) %422, i64 1024
  %424 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #10
  %425 = extractvalue { i32, i32, i32, i32 } %424, 0
  %426 = bitcast i32 %425 to <2 x bfloat>
  %427 = extractvalue { i32, i32, i32, i32 } %424, 1
  %428 = bitcast i32 %427 to <2 x bfloat>
  %429 = extractvalue { i32, i32, i32, i32 } %424, 2
  %430 = bitcast i32 %429 to <2 x bfloat>
  %431 = extractvalue { i32, i32, i32, i32 } %424, 3
  %432 = bitcast i32 %431 to <2 x bfloat>
  %433 = extractelement <2 x bfloat> %426, i64 0
  %434 = extractelement <2 x bfloat> %426, i64 1
  %435 = extractelement <2 x bfloat> %428, i64 0
  %436 = extractelement <2 x bfloat> %428, i64 1
  %437 = extractelement <2 x bfloat> %430, i64 0
  %438 = extractelement <2 x bfloat> %430, i64 1
  %439 = extractelement <2 x bfloat> %432, i64 0
  %440 = extractelement <2 x bfloat> %432, i64 1
  %441 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %423) #10
  %442 = extractvalue { i32, i32, i32, i32 } %441, 0
  %443 = bitcast i32 %442 to <2 x bfloat>
  %444 = extractvalue { i32, i32, i32, i32 } %441, 1
  %445 = bitcast i32 %444 to <2 x bfloat>
  %446 = extractvalue { i32, i32, i32, i32 } %441, 2
  %447 = bitcast i32 %446 to <2 x bfloat>
  %448 = extractvalue { i32, i32, i32, i32 } %441, 3
  %449 = bitcast i32 %448 to <2 x bfloat>
  %450 = extractelement <2 x bfloat> %443, i64 0
  %451 = extractelement <2 x bfloat> %443, i64 1
  %452 = extractelement <2 x bfloat> %445, i64 0
  %453 = extractelement <2 x bfloat> %445, i64 1
  %454 = extractelement <2 x bfloat> %447, i64 0
  %455 = extractelement <2 x bfloat> %447, i64 1
  %456 = extractelement <2 x bfloat> %449, i64 0
  %457 = extractelement <2 x bfloat> %449, i64 1
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #10
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #10
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #10
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #10
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #10
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #10
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #10
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440) #10
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #10
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #10
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #10
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #10
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #10
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
  %473 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #10
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
  %489 = fmul float %421, %473
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
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #10
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #10
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #10
  %505 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %489) #10
  %506 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %69
  %507 = getelementptr bfloat, ptr addrspace(1) %506, i64 %14
  %508 = getelementptr i8, ptr addrspace(1) %507, i64 1024
  %509 = insertelement <2 x bfloat> poison, bfloat %490, i64 0
  %510 = insertelement <2 x bfloat> %509, bfloat %491, i64 1
  %511 = bitcast <2 x bfloat> %510 to i32
  %512 = insertelement <2 x bfloat> poison, bfloat %492, i64 0
  %513 = insertelement <2 x bfloat> %512, bfloat %493, i64 1
  %514 = bitcast <2 x bfloat> %513 to i32
  %515 = insertelement <2 x bfloat> poison, bfloat %494, i64 0
  %516 = insertelement <2 x bfloat> %515, bfloat %495, i64 1
  %517 = bitcast <2 x bfloat> %516 to i32
  %518 = insertelement <2 x bfloat> poison, bfloat %496, i64 0
  %519 = insertelement <2 x bfloat> %518, bfloat %497, i64 1
  %520 = bitcast <2 x bfloat> %519 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %511, i32 %514, i32 %517, i32 %520, ptr addrspace(1) %507) #10
  %521 = insertelement <2 x bfloat> poison, bfloat %498, i64 0
  %522 = insertelement <2 x bfloat> %521, bfloat %499, i64 1
  %523 = bitcast <2 x bfloat> %522 to i32
  %524 = insertelement <2 x bfloat> poison, bfloat %500, i64 0
  %525 = insertelement <2 x bfloat> %524, bfloat %501, i64 1
  %526 = bitcast <2 x bfloat> %525 to i32
  %527 = insertelement <2 x bfloat> poison, bfloat %502, i64 0
  %528 = insertelement <2 x bfloat> %527, bfloat %503, i64 1
  %529 = bitcast <2 x bfloat> %528 to i32
  %530 = insertelement <2 x bfloat> poison, bfloat %504, i64 0
  %531 = insertelement <2 x bfloat> %530, bfloat %505, i64 1
  %532 = bitcast <2 x bfloat> %531 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %523, i32 %526, i32 %529, i32 %532, ptr addrspace(1) %508) #10
  ret void
}

define ptx_kernel void @fusion_105(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(1048576) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) local_unnamed_addr #6 {
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
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %3
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
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #10
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #10
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #10
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #10
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #10
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #10
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #10
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #10
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #10
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #10
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #10
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #10
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #10
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #10
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #10
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #10
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #10
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #10
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #10
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #10
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #10
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #10
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #10
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 4096
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #10
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #10
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
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #10
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #10
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #10
  %177 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #10
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
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #10
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
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #10
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #10
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #10
  %230 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %231 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %232 = getelementptr bfloat, ptr addrspace(1) %230, i64 %14
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 1024
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #10
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
  %251 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #10
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
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #10
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #10
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #10
  %284 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %285 = getelementptr bfloat, ptr addrspace(1) %284, i64 %14
  %286 = getelementptr i8, ptr addrspace(1) %285, i64 1024
  %287 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #10
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
  %304 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %286) #10
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
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #10
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #10
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #10
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #10
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #10
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #10
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #10
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #10
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #10
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #10
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #10
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #10
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #10
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #10
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #10
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #10
  %337 = getelementptr float, ptr addrspace(1) %arg49, i64 %69
  %338 = getelementptr float, ptr addrspace(1) %337, i64 %14
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 16
  %340 = getelementptr i8, ptr addrspace(1) %338, i64 2048
  %341 = getelementptr i8, ptr addrspace(1) %338, i64 2064
  %342 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #10
  %343 = extractvalue { i32, i32, i32, i32 } %342, 0
  %344 = extractvalue { i32, i32, i32, i32 } %342, 1
  %345 = extractvalue { i32, i32, i32, i32 } %342, 2
  %346 = extractvalue { i32, i32, i32, i32 } %342, 3
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = bitcast i32 %346 to float
  %351 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #10
  %352 = extractvalue { i32, i32, i32, i32 } %351, 0
  %353 = extractvalue { i32, i32, i32, i32 } %351, 1
  %354 = extractvalue { i32, i32, i32, i32 } %351, 2
  %355 = extractvalue { i32, i32, i32, i32 } %351, 3
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = bitcast i32 %355 to float
  %360 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #10
  %361 = extractvalue { i32, i32, i32, i32 } %360, 0
  %362 = extractvalue { i32, i32, i32, i32 } %360, 1
  %363 = extractvalue { i32, i32, i32, i32 } %360, 2
  %364 = extractvalue { i32, i32, i32, i32 } %360, 3
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = bitcast i32 %364 to float
  %369 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %341) #10
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %527, <1 x i32> %528, i1 %525) #10
  tail call void @llvm.nvvm.barrier0()
  %529 = icmp samesign ult i32 %6, 2
  %530 = zext nneg i32 %6 to i64
  %531 = getelementptr float, ptr addrspace(3) @global_smem, i64 %530
  %532 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %531, i1 %529) #10
  %533 = bitcast i32 %532 to float
  %534 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %532, i32 1, i32 31)
  %535 = bitcast i32 %534 to float
  %536 = fadd float %533, %535
  %537 = icmp eq i32 %6, 0
  %538 = bitcast float %536 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %531, <1 x i32> %538, i1 %537) #10
  tail call void @llvm.nvvm.barrier0()
  %539 = load float, ptr addrspace(3) @global_smem, align 16
  %540 = fmul float %539, 0x3F50000000000000
  %541 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
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
  %561 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %14
  %562 = getelementptr i8, ptr addrspace(1) %561, i64 1024
  %563 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #10
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
  %580 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %562) #10
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
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #10
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #10
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #10
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #10
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #10
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #10
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #10
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %579) #10
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #10
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #10
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #10
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #10
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #10
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #10
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #10
  %612 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %596) #10
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
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613) #10
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614) #10
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615) #10
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616) #10
  %633 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617) #10
  %634 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618) #10
  %635 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619) #10
  %636 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620) #10
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #10
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #10
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #10
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #10
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #10
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #10
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #10
  %644 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %628) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %650, i32 %653, i32 %656, i32 %659, ptr addrspace(1) %646) #10
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %662, i32 %665, i32 %668, i32 %671, ptr addrspace(1) %647) #10
  ret void
}

define ptx_kernel void @fusion_104(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(1048576) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8) local_unnamed_addr #6 {
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
  %3 = shl nsw i64 %2, 13
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
  %66 = shl nsw i64 %2, 10
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #10
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
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #10
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
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = getelementptr i8, ptr addrspace(1) %4, i64 2048
  %121 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %122 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 1024
  %124 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #10
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
  %141 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #10
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
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #10
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #10
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #10
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #10
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #10
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #10
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #10
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #10
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #10
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #10
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #10
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #10
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #10
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #10
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #10
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #10
  %174 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %66
  %175 = getelementptr bfloat, ptr addrspace(1) %174, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #10
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
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #10
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
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %228 = getelementptr i8, ptr addrspace(1) %14, i64 4096
  %229 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %230 = getelementptr i8, ptr addrspace(1) %229, i64 1024
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractvalue { i32, i32, i32, i32 } %231, 1
  %235 = bitcast i32 %234 to <2 x bfloat>
  %236 = extractvalue { i32, i32, i32, i32 } %231, 2
  %237 = bitcast i32 %236 to <2 x bfloat>
  %238 = extractvalue { i32, i32, i32, i32 } %231, 3
  %239 = bitcast i32 %238 to <2 x bfloat>
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = extractelement <2 x bfloat> %235, i64 0
  %243 = extractelement <2 x bfloat> %235, i64 1
  %244 = extractelement <2 x bfloat> %237, i64 0
  %245 = extractelement <2 x bfloat> %237, i64 1
  %246 = extractelement <2 x bfloat> %239, i64 0
  %247 = extractelement <2 x bfloat> %239, i64 1
  %248 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #10
  %249 = extractvalue { i32, i32, i32, i32 } %248, 0
  %250 = bitcast i32 %249 to <2 x bfloat>
  %251 = extractvalue { i32, i32, i32, i32 } %248, 1
  %252 = bitcast i32 %251 to <2 x bfloat>
  %253 = extractvalue { i32, i32, i32, i32 } %248, 2
  %254 = bitcast i32 %253 to <2 x bfloat>
  %255 = extractvalue { i32, i32, i32, i32 } %248, 3
  %256 = bitcast i32 %255 to <2 x bfloat>
  %257 = extractelement <2 x bfloat> %250, i64 0
  %258 = extractelement <2 x bfloat> %250, i64 1
  %259 = extractelement <2 x bfloat> %252, i64 0
  %260 = extractelement <2 x bfloat> %252, i64 1
  %261 = extractelement <2 x bfloat> %254, i64 0
  %262 = extractelement <2 x bfloat> %254, i64 1
  %263 = extractelement <2 x bfloat> %256, i64 0
  %264 = extractelement <2 x bfloat> %256, i64 1
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #10
  %281 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %66
  %282 = getelementptr bfloat, ptr addrspace(1) %281, i64 %13
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
  %334 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %335 = getelementptr i8, ptr addrspace(1) %14, i64 6144
  %336 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %337 = getelementptr i8, ptr addrspace(1) %336, i64 1024
  %338 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #10
  %339 = extractvalue { i32, i32, i32, i32 } %338, 0
  %340 = bitcast i32 %339 to <2 x bfloat>
  %341 = extractvalue { i32, i32, i32, i32 } %338, 1
  %342 = bitcast i32 %341 to <2 x bfloat>
  %343 = extractvalue { i32, i32, i32, i32 } %338, 2
  %344 = bitcast i32 %343 to <2 x bfloat>
  %345 = extractvalue { i32, i32, i32, i32 } %338, 3
  %346 = bitcast i32 %345 to <2 x bfloat>
  %347 = extractelement <2 x bfloat> %340, i64 0
  %348 = extractelement <2 x bfloat> %340, i64 1
  %349 = extractelement <2 x bfloat> %342, i64 0
  %350 = extractelement <2 x bfloat> %342, i64 1
  %351 = extractelement <2 x bfloat> %344, i64 0
  %352 = extractelement <2 x bfloat> %344, i64 1
  %353 = extractelement <2 x bfloat> %346, i64 0
  %354 = extractelement <2 x bfloat> %346, i64 1
  %355 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #10
  %356 = extractvalue { i32, i32, i32, i32 } %355, 0
  %357 = bitcast i32 %356 to <2 x bfloat>
  %358 = extractvalue { i32, i32, i32, i32 } %355, 1
  %359 = bitcast i32 %358 to <2 x bfloat>
  %360 = extractvalue { i32, i32, i32, i32 } %355, 2
  %361 = bitcast i32 %360 to <2 x bfloat>
  %362 = extractvalue { i32, i32, i32, i32 } %355, 3
  %363 = bitcast i32 %362 to <2 x bfloat>
  %364 = extractelement <2 x bfloat> %357, i64 0
  %365 = extractelement <2 x bfloat> %357, i64 1
  %366 = extractelement <2 x bfloat> %359, i64 0
  %367 = extractelement <2 x bfloat> %359, i64 1
  %368 = extractelement <2 x bfloat> %361, i64 0
  %369 = extractelement <2 x bfloat> %361, i64 1
  %370 = extractelement <2 x bfloat> %363, i64 0
  %371 = extractelement <2 x bfloat> %363, i64 1
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #10
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #10
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #10
  %388 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %66
  %389 = getelementptr bfloat, ptr addrspace(1) %388, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %389) #10
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i64 0
  %401 = extractelement <2 x bfloat> %393, i64 1
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #10
  %409 = extractvalue { i32, i32, i32, i32 } %408, 0
  %410 = bitcast i32 %409 to <2 x bfloat>
  %411 = extractvalue { i32, i32, i32, i32 } %408, 1
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %408, 2
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %408, 3
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractelement <2 x bfloat> %410, i64 0
  %418 = extractelement <2 x bfloat> %410, i64 1
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #10
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #10
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = getelementptr float, ptr addrspace(1) %arg511, i64 %66
  %442 = getelementptr float, ptr addrspace(1) %441, i64 %13
  %443 = getelementptr i8, ptr addrspace(1) %442, i64 16
  %444 = getelementptr i8, ptr addrspace(1) %442, i64 2048
  %445 = getelementptr i8, ptr addrspace(1) %442, i64 2064
  %446 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %442) #10
  %447 = extractvalue { i32, i32, i32, i32 } %446, 0
  %448 = extractvalue { i32, i32, i32, i32 } %446, 1
  %449 = extractvalue { i32, i32, i32, i32 } %446, 2
  %450 = extractvalue { i32, i32, i32, i32 } %446, 3
  %451 = bitcast i32 %447 to float
  %452 = bitcast i32 %448 to float
  %453 = bitcast i32 %449 to float
  %454 = bitcast i32 %450 to float
  %455 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %443) #10
  %456 = extractvalue { i32, i32, i32, i32 } %455, 0
  %457 = extractvalue { i32, i32, i32, i32 } %455, 1
  %458 = extractvalue { i32, i32, i32, i32 } %455, 2
  %459 = extractvalue { i32, i32, i32, i32 } %455, 3
  %460 = bitcast i32 %456 to float
  %461 = bitcast i32 %457 to float
  %462 = bitcast i32 %458 to float
  %463 = bitcast i32 %459 to float
  %464 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %444) #10
  %465 = extractvalue { i32, i32, i32, i32 } %464, 0
  %466 = extractvalue { i32, i32, i32, i32 } %464, 1
  %467 = extractvalue { i32, i32, i32, i32 } %464, 2
  %468 = extractvalue { i32, i32, i32, i32 } %464, 3
  %469 = bitcast i32 %465 to float
  %470 = bitcast i32 %466 to float
  %471 = bitcast i32 %467 to float
  %472 = bitcast i32 %468 to float
  %473 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %445) #10
  %474 = extractvalue { i32, i32, i32, i32 } %473, 0
  %475 = extractvalue { i32, i32, i32, i32 } %473, 1
  %476 = extractvalue { i32, i32, i32, i32 } %473, 2
  %477 = extractvalue { i32, i32, i32, i32 } %473, 3
  %478 = bitcast i32 %474 to float
  %479 = bitcast i32 %475 to float
  %480 = bitcast i32 %476 to float
  %481 = bitcast i32 %477 to float
  %482 = fadd float %425, %451
  %483 = fadd float %426, %452
  %484 = fadd float %427, %453
  %485 = fadd float %428, %454
  %486 = fadd float %429, %460
  %487 = fadd float %430, %461
  %488 = fadd float %431, %462
  %489 = fadd float %432, %463
  %490 = fadd float %433, %469
  %491 = fadd float %434, %470
  %492 = fadd float %435, %471
  %493 = fadd float %436, %472
  %494 = fadd float %437, %478
  %495 = fadd float %438, %479
  %496 = fadd float %439, %480
  %497 = fadd float %440, %481
  %498 = fadd float %372, %482
  %499 = fadd float %373, %483
  %500 = fadd float %374, %484
  %501 = fadd float %375, %485
  %502 = fadd float %376, %486
  %503 = fadd float %377, %487
  %504 = fadd float %378, %488
  %505 = fadd float %379, %489
  %506 = fadd float %380, %490
  %507 = fadd float %381, %491
  %508 = fadd float %382, %492
  %509 = fadd float %383, %493
  %510 = fadd float %384, %494
  %511 = fadd float %385, %495
  %512 = fadd float %386, %496
  %513 = fadd float %387, %497
  %514 = fadd float %318, %498
  %515 = fadd float %319, %499
  %516 = fadd float %320, %500
  %517 = fadd float %321, %501
  %518 = fadd float %322, %502
  %519 = fadd float %323, %503
  %520 = fadd float %324, %504
  %521 = fadd float %325, %505
  %522 = fadd float %326, %506
  %523 = fadd float %327, %507
  %524 = fadd float %328, %508
  %525 = fadd float %329, %509
  %526 = fadd float %330, %510
  %527 = fadd float %331, %511
  %528 = fadd float %332, %512
  %529 = fadd float %333, %513
  %530 = fadd float %265, %514
  %531 = fadd float %266, %515
  %532 = fadd float %267, %516
  %533 = fadd float %268, %517
  %534 = fadd float %269, %518
  %535 = fadd float %270, %519
  %536 = fadd float %271, %520
  %537 = fadd float %272, %521
  %538 = fadd float %273, %522
  %539 = fadd float %274, %523
  %540 = fadd float %275, %524
  %541 = fadd float %276, %525
  %542 = fadd float %277, %526
  %543 = fadd float %278, %527
  %544 = fadd float %279, %528
  %545 = fadd float %280, %529
  %546 = fadd float %211, %530
  %547 = fadd float %212, %531
  %548 = fadd float %213, %532
  %549 = fadd float %214, %533
  %550 = fadd float %215, %534
  %551 = fadd float %216, %535
  %552 = fadd float %217, %536
  %553 = fadd float %218, %537
  %554 = fadd float %219, %538
  %555 = fadd float %220, %539
  %556 = fadd float %221, %540
  %557 = fadd float %222, %541
  %558 = fadd float %223, %542
  %559 = fadd float %224, %543
  %560 = fadd float %225, %544
  %561 = fadd float %226, %545
  %562 = fadd float %158, %546
  %563 = fadd float %159, %547
  %564 = fadd float %160, %548
  %565 = fadd float %161, %549
  %566 = fadd float %162, %550
  %567 = fadd float %163, %551
  %568 = fadd float %164, %552
  %569 = fadd float %165, %553
  %570 = fadd float %166, %554
  %571 = fadd float %167, %555
  %572 = fadd float %168, %556
  %573 = fadd float %169, %557
  %574 = fadd float %170, %558
  %575 = fadd float %171, %559
  %576 = fadd float %172, %560
  %577 = fadd float %173, %561
  %578 = fadd float %104, %562
  %579 = fadd float %105, %563
  %580 = fadd float %106, %564
  %581 = fadd float %107, %565
  %582 = fadd float %108, %566
  %583 = fadd float %109, %567
  %584 = fadd float %110, %568
  %585 = fadd float %111, %569
  %586 = fadd float %112, %570
  %587 = fadd float %113, %571
  %588 = fadd float %114, %572
  %589 = fadd float %115, %573
  %590 = fadd float %116, %574
  %591 = fadd float %117, %575
  %592 = fadd float %118, %576
  %593 = fadd float %119, %577
  %594 = fadd float %50, %578
  %595 = fadd float %51, %579
  %596 = fadd float %52, %580
  %597 = fadd float %53, %581
  %598 = fadd float %54, %582
  %599 = fadd float %55, %583
  %600 = fadd float %56, %584
  %601 = fadd float %57, %585
  %602 = fadd float %58, %586
  %603 = fadd float %59, %587
  %604 = fadd float %60, %588
  %605 = fadd float %61, %589
  %606 = fadd float %62, %590
  %607 = fadd float %63, %591
  %608 = fadd float %64, %592
  %609 = fadd float %65, %593
  %610 = fmul float %594, %594
  %611 = fmul float %595, %595
  %612 = fmul float %596, %596
  %613 = fmul float %597, %597
  %614 = fmul float %598, %598
  %615 = fmul float %599, %599
  %616 = fmul float %600, %600
  %617 = fmul float %601, %601
  %618 = fmul float %602, %602
  %619 = fmul float %603, %603
  %620 = fmul float %604, %604
  %621 = fmul float %605, %605
  %622 = fmul float %606, %606
  %623 = fmul float %607, %607
  %624 = fmul float %608, %608
  %625 = fmul float %609, %609
  %626 = fadd float %610, %611
  %627 = fadd float %612, %626
  %628 = fadd float %613, %627
  %629 = fadd float %614, %628
  %630 = fadd float %615, %629
  %631 = fadd float %616, %630
  %632 = fadd float %617, %631
  %633 = fadd float %618, %632
  %634 = fadd float %619, %633
  %635 = fadd float %620, %634
  %636 = fadd float %621, %635
  %637 = fadd float %622, %636
  %638 = fadd float %623, %637
  %639 = fadd float %624, %638
  %640 = fadd float %625, %639
  %641 = bitcast float %640 to i32
  %642 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %641, i32 16, i32 31)
  %643 = bitcast i32 %642 to float
  %644 = fadd float %640, %643
  %645 = bitcast float %644 to i32
  %646 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %645, i32 8, i32 31)
  %647 = bitcast i32 %646 to float
  %648 = fadd float %644, %647
  %649 = bitcast float %648 to i32
  %650 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %649, i32 4, i32 31)
  %651 = bitcast i32 %650 to float
  %652 = fadd float %648, %651
  %653 = bitcast float %652 to i32
  %654 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %653, i32 2, i32 31)
  %655 = bitcast i32 %654 to float
  %656 = fadd float %652, %655
  %657 = bitcast float %656 to i32
  %658 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %657, i32 1, i32 31)
  %659 = bitcast i32 %658 to float
  %660 = fadd float %656, %659
  %661 = icmp eq i32 %6, 0
  %662 = zext nneg i32 %7 to i64
  %663 = getelementptr float, ptr addrspace(3) @global_smem, i64 %662
  %664 = bitcast float %660 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %663, <1 x i32> %664, i1 %661) #10
  tail call void @llvm.nvvm.barrier0()
  %665 = icmp samesign ult i32 %5, 2
  %666 = zext nneg i32 %5 to i64
  %667 = getelementptr float, ptr addrspace(3) @global_smem, i64 %666
  %668 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %667, i1 %665) #10
  %669 = bitcast i32 %668 to float
  %670 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %668, i32 1, i32 31)
  %671 = bitcast i32 %670 to float
  %672 = fadd float %669, %671
  %673 = icmp eq i32 %5, 0
  %674 = bitcast float %672 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %667, <1 x i32> %674, i1 %673) #10
  tail call void @llvm.nvvm.barrier0()
  %675 = load float, ptr addrspace(3) @global_smem, align 16
  %676 = fmul float %675, 0x3F50000000000000
  %677 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %678 = bitcast i32 %677 to float
  %679 = fadd float %676, %678
  %680 = tail call float @llvm.nvvm.rsqrt.approx.f(float %679)
  %681 = fmul float %594, %680
  %682 = fmul float %595, %680
  %683 = fmul float %596, %680
  %684 = fmul float %597, %680
  %685 = fmul float %598, %680
  %686 = fmul float %599, %680
  %687 = fmul float %600, %680
  %688 = fmul float %601, %680
  %689 = fmul float %602, %680
  %690 = fmul float %603, %680
  %691 = fmul float %604, %680
  %692 = fmul float %605, %680
  %693 = fmul float %606, %680
  %694 = fmul float %607, %680
  %695 = fmul float %608, %680
  %696 = fmul float %609, %680
  %697 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %13
  %698 = getelementptr i8, ptr addrspace(1) %697, i64 1024
  %699 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %697) #10
  %700 = extractvalue { i32, i32, i32, i32 } %699, 0
  %701 = bitcast i32 %700 to <2 x bfloat>
  %702 = extractvalue { i32, i32, i32, i32 } %699, 1
  %703 = bitcast i32 %702 to <2 x bfloat>
  %704 = extractvalue { i32, i32, i32, i32 } %699, 2
  %705 = bitcast i32 %704 to <2 x bfloat>
  %706 = extractvalue { i32, i32, i32, i32 } %699, 3
  %707 = bitcast i32 %706 to <2 x bfloat>
  %708 = extractelement <2 x bfloat> %701, i64 0
  %709 = extractelement <2 x bfloat> %701, i64 1
  %710 = extractelement <2 x bfloat> %703, i64 0
  %711 = extractelement <2 x bfloat> %703, i64 1
  %712 = extractelement <2 x bfloat> %705, i64 0
  %713 = extractelement <2 x bfloat> %705, i64 1
  %714 = extractelement <2 x bfloat> %707, i64 0
  %715 = extractelement <2 x bfloat> %707, i64 1
  %716 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %698) #10
  %717 = extractvalue { i32, i32, i32, i32 } %716, 0
  %718 = bitcast i32 %717 to <2 x bfloat>
  %719 = extractvalue { i32, i32, i32, i32 } %716, 1
  %720 = bitcast i32 %719 to <2 x bfloat>
  %721 = extractvalue { i32, i32, i32, i32 } %716, 2
  %722 = bitcast i32 %721 to <2 x bfloat>
  %723 = extractvalue { i32, i32, i32, i32 } %716, 3
  %724 = bitcast i32 %723 to <2 x bfloat>
  %725 = extractelement <2 x bfloat> %718, i64 0
  %726 = extractelement <2 x bfloat> %718, i64 1
  %727 = extractelement <2 x bfloat> %720, i64 0
  %728 = extractelement <2 x bfloat> %720, i64 1
  %729 = extractelement <2 x bfloat> %722, i64 0
  %730 = extractelement <2 x bfloat> %722, i64 1
  %731 = extractelement <2 x bfloat> %724, i64 0
  %732 = extractelement <2 x bfloat> %724, i64 1
  %733 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %708) #10
  %734 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %709) #10
  %735 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %710) #10
  %736 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %711) #10
  %737 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %712) #10
  %738 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %713) #10
  %739 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %714) #10
  %740 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %715) #10
  %741 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %725) #10
  %742 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %726) #10
  %743 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %727) #10
  %744 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %728) #10
  %745 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %729) #10
  %746 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %730) #10
  %747 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %731) #10
  %748 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %732) #10
  %749 = fmul float %681, %733
  %750 = fmul float %682, %734
  %751 = fmul float %683, %735
  %752 = fmul float %684, %736
  %753 = fmul float %685, %737
  %754 = fmul float %686, %738
  %755 = fmul float %687, %739
  %756 = fmul float %688, %740
  %757 = fmul float %689, %741
  %758 = fmul float %690, %742
  %759 = fmul float %691, %743
  %760 = fmul float %692, %744
  %761 = fmul float %693, %745
  %762 = fmul float %694, %746
  %763 = fmul float %695, %747
  %764 = fmul float %696, %748
  %765 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %749) #10
  %766 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %750) #10
  %767 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %751) #10
  %768 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %752) #10
  %769 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %753) #10
  %770 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %754) #10
  %771 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %755) #10
  %772 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %756) #10
  %773 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %757) #10
  %774 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %758) #10
  %775 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %759) #10
  %776 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %760) #10
  %777 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %761) #10
  %778 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %762) #10
  %779 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %763) #10
  %780 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %764) #10
  %781 = getelementptr bfloat, ptr addrspace(1) %arg817, i64 %66
  %782 = getelementptr bfloat, ptr addrspace(1) %781, i64 %13
  %783 = getelementptr i8, ptr addrspace(1) %782, i64 1024
  %784 = insertelement <2 x bfloat> poison, bfloat %765, i64 0
  %785 = insertelement <2 x bfloat> %784, bfloat %766, i64 1
  %786 = bitcast <2 x bfloat> %785 to i32
  %787 = insertelement <2 x bfloat> poison, bfloat %767, i64 0
  %788 = insertelement <2 x bfloat> %787, bfloat %768, i64 1
  %789 = bitcast <2 x bfloat> %788 to i32
  %790 = insertelement <2 x bfloat> poison, bfloat %769, i64 0
  %791 = insertelement <2 x bfloat> %790, bfloat %770, i64 1
  %792 = bitcast <2 x bfloat> %791 to i32
  %793 = insertelement <2 x bfloat> poison, bfloat %771, i64 0
  %794 = insertelement <2 x bfloat> %793, bfloat %772, i64 1
  %795 = bitcast <2 x bfloat> %794 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %786, i32 %789, i32 %792, i32 %795, ptr addrspace(1) %782) #10
  %796 = insertelement <2 x bfloat> poison, bfloat %773, i64 0
  %797 = insertelement <2 x bfloat> %796, bfloat %774, i64 1
  %798 = bitcast <2 x bfloat> %797 to i32
  %799 = insertelement <2 x bfloat> poison, bfloat %775, i64 0
  %800 = insertelement <2 x bfloat> %799, bfloat %776, i64 1
  %801 = bitcast <2 x bfloat> %800 to i32
  %802 = insertelement <2 x bfloat> poison, bfloat %777, i64 0
  %803 = insertelement <2 x bfloat> %802, bfloat %778, i64 1
  %804 = bitcast <2 x bfloat> %803 to i32
  %805 = insertelement <2 x bfloat> poison, bfloat %779, i64 0
  %806 = insertelement <2 x bfloat> %805, bfloat %780, i64 1
  %807 = bitcast <2 x bfloat> %806 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %798, i32 %801, i32 %804, i32 %807, ptr addrspace(1) %783) #10
  ret void
}

define ptx_kernel void @fusion_102(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(1048576) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9) local_unnamed_addr #6 {
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
  %66 = shl nsw i64 %2, 13
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #10
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
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #10
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
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #10
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #10
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #10
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #10
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #10
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #10
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #10
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #10
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #10
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #10
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #10
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #10
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #10
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #10
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #10
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #10
  %120 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %121 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #10
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
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr i8, ptr addrspace(1) %68, i64 2048
  %175 = getelementptr bfloat, ptr addrspace(1) %173, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #10
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
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #10
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
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #10
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #10
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #10
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #10
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #10
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #10
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #10
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #10
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #10
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #10
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #10
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #10
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #10
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #10
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #10
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #10
  %227 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %228 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 1024
  %230 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #10
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
  %247 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #10
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
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #10
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #10
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #10
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #10
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #10
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #10
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #10
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #10
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #10
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #10
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #10
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #10
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #10
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #10
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #10
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #10
  %280 = getelementptr i8, ptr addrspace(1) %67, i64 4096
  %281 = getelementptr i8, ptr addrspace(1) %68, i64 4096
  %282 = getelementptr bfloat, ptr addrspace(1) %280, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #10
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
  %334 = getelementptr bfloat, ptr addrspace(1) %arg817, i64 %3
  %335 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %336 = getelementptr i8, ptr addrspace(1) %335, i64 1024
  %337 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #10
  %338 = extractvalue { i32, i32, i32, i32 } %337, 0
  %339 = bitcast i32 %338 to <2 x bfloat>
  %340 = extractvalue { i32, i32, i32, i32 } %337, 1
  %341 = bitcast i32 %340 to <2 x bfloat>
  %342 = extractvalue { i32, i32, i32, i32 } %337, 2
  %343 = bitcast i32 %342 to <2 x bfloat>
  %344 = extractvalue { i32, i32, i32, i32 } %337, 3
  %345 = bitcast i32 %344 to <2 x bfloat>
  %346 = extractelement <2 x bfloat> %339, i64 0
  %347 = extractelement <2 x bfloat> %339, i64 1
  %348 = extractelement <2 x bfloat> %341, i64 0
  %349 = extractelement <2 x bfloat> %341, i64 1
  %350 = extractelement <2 x bfloat> %343, i64 0
  %351 = extractelement <2 x bfloat> %343, i64 1
  %352 = extractelement <2 x bfloat> %345, i64 0
  %353 = extractelement <2 x bfloat> %345, i64 1
  %354 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %336) #10
  %355 = extractvalue { i32, i32, i32, i32 } %354, 0
  %356 = bitcast i32 %355 to <2 x bfloat>
  %357 = extractvalue { i32, i32, i32, i32 } %354, 1
  %358 = bitcast i32 %357 to <2 x bfloat>
  %359 = extractvalue { i32, i32, i32, i32 } %354, 2
  %360 = bitcast i32 %359 to <2 x bfloat>
  %361 = extractvalue { i32, i32, i32, i32 } %354, 3
  %362 = bitcast i32 %361 to <2 x bfloat>
  %363 = extractelement <2 x bfloat> %356, i64 0
  %364 = extractelement <2 x bfloat> %356, i64 1
  %365 = extractelement <2 x bfloat> %358, i64 0
  %366 = extractelement <2 x bfloat> %358, i64 1
  %367 = extractelement <2 x bfloat> %360, i64 0
  %368 = extractelement <2 x bfloat> %360, i64 1
  %369 = extractelement <2 x bfloat> %362, i64 0
  %370 = extractelement <2 x bfloat> %362, i64 1
  %371 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346) #10
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #10
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #10
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #10
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #10
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #10
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #10
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #10
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #10
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #10
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #10
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #10
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #10
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #10
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #10
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #10
  %387 = getelementptr i8, ptr addrspace(1) %67, i64 6144
  %388 = getelementptr i8, ptr addrspace(1) %68, i64 6144
  %389 = getelementptr bfloat, ptr addrspace(1) %387, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %388) #10
  %392 = extractvalue { i32, i32, i32, i32 } %391, 0
  %393 = bitcast i32 %392 to <2 x bfloat>
  %394 = extractvalue { i32, i32, i32, i32 } %391, 1
  %395 = bitcast i32 %394 to <2 x bfloat>
  %396 = extractvalue { i32, i32, i32, i32 } %391, 2
  %397 = bitcast i32 %396 to <2 x bfloat>
  %398 = extractvalue { i32, i32, i32, i32 } %391, 3
  %399 = bitcast i32 %398 to <2 x bfloat>
  %400 = extractelement <2 x bfloat> %393, i64 0
  %401 = extractelement <2 x bfloat> %393, i64 1
  %402 = extractelement <2 x bfloat> %395, i64 0
  %403 = extractelement <2 x bfloat> %395, i64 1
  %404 = extractelement <2 x bfloat> %397, i64 0
  %405 = extractelement <2 x bfloat> %397, i64 1
  %406 = extractelement <2 x bfloat> %399, i64 0
  %407 = extractelement <2 x bfloat> %399, i64 1
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #10
  %409 = extractvalue { i32, i32, i32, i32 } %408, 0
  %410 = bitcast i32 %409 to <2 x bfloat>
  %411 = extractvalue { i32, i32, i32, i32 } %408, 1
  %412 = bitcast i32 %411 to <2 x bfloat>
  %413 = extractvalue { i32, i32, i32, i32 } %408, 2
  %414 = bitcast i32 %413 to <2 x bfloat>
  %415 = extractvalue { i32, i32, i32, i32 } %408, 3
  %416 = bitcast i32 %415 to <2 x bfloat>
  %417 = extractelement <2 x bfloat> %410, i64 0
  %418 = extractelement <2 x bfloat> %410, i64 1
  %419 = extractelement <2 x bfloat> %412, i64 0
  %420 = extractelement <2 x bfloat> %412, i64 1
  %421 = extractelement <2 x bfloat> %414, i64 0
  %422 = extractelement <2 x bfloat> %414, i64 1
  %423 = extractelement <2 x bfloat> %416, i64 0
  %424 = extractelement <2 x bfloat> %416, i64 1
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #10
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #10
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #10
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #10
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #10
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #10
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #10
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #10
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #10
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #10
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #10
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #10
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #10
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #10
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #10
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #10
  %441 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %3
  %442 = getelementptr bfloat, ptr addrspace(1) %441, i64 %13
  %443 = getelementptr i8, ptr addrspace(1) %442, i64 1024
  %444 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %442) #10
  %445 = extractvalue { i32, i32, i32, i32 } %444, 0
  %446 = bitcast i32 %445 to <2 x bfloat>
  %447 = extractvalue { i32, i32, i32, i32 } %444, 1
  %448 = bitcast i32 %447 to <2 x bfloat>
  %449 = extractvalue { i32, i32, i32, i32 } %444, 2
  %450 = bitcast i32 %449 to <2 x bfloat>
  %451 = extractvalue { i32, i32, i32, i32 } %444, 3
  %452 = bitcast i32 %451 to <2 x bfloat>
  %453 = extractelement <2 x bfloat> %446, i64 0
  %454 = extractelement <2 x bfloat> %446, i64 1
  %455 = extractelement <2 x bfloat> %448, i64 0
  %456 = extractelement <2 x bfloat> %448, i64 1
  %457 = extractelement <2 x bfloat> %450, i64 0
  %458 = extractelement <2 x bfloat> %450, i64 1
  %459 = extractelement <2 x bfloat> %452, i64 0
  %460 = extractelement <2 x bfloat> %452, i64 1
  %461 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %443) #10
  %462 = extractvalue { i32, i32, i32, i32 } %461, 0
  %463 = bitcast i32 %462 to <2 x bfloat>
  %464 = extractvalue { i32, i32, i32, i32 } %461, 1
  %465 = bitcast i32 %464 to <2 x bfloat>
  %466 = extractvalue { i32, i32, i32, i32 } %461, 2
  %467 = bitcast i32 %466 to <2 x bfloat>
  %468 = extractvalue { i32, i32, i32, i32 } %461, 3
  %469 = bitcast i32 %468 to <2 x bfloat>
  %470 = extractelement <2 x bfloat> %463, i64 0
  %471 = extractelement <2 x bfloat> %463, i64 1
  %472 = extractelement <2 x bfloat> %465, i64 0
  %473 = extractelement <2 x bfloat> %465, i64 1
  %474 = extractelement <2 x bfloat> %467, i64 0
  %475 = extractelement <2 x bfloat> %467, i64 1
  %476 = extractelement <2 x bfloat> %469, i64 0
  %477 = extractelement <2 x bfloat> %469, i64 1
  %478 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #10
  %479 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #10
  %480 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #10
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #10
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #10
  %483 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458) #10
  %484 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #10
  %485 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #10
  %486 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %470) #10
  %487 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %471) #10
  %488 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %472) #10
  %489 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %473) #10
  %490 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474) #10
  %491 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475) #10
  %492 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476) #10
  %493 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477) #10
  %494 = getelementptr float, ptr addrspace(1) %arg613, i64 %3
  %495 = getelementptr float, ptr addrspace(1) %494, i64 %13
  %496 = getelementptr i8, ptr addrspace(1) %495, i64 16
  %497 = getelementptr i8, ptr addrspace(1) %495, i64 2048
  %498 = getelementptr i8, ptr addrspace(1) %495, i64 2064
  %499 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %495) #10
  %500 = extractvalue { i32, i32, i32, i32 } %499, 0
  %501 = extractvalue { i32, i32, i32, i32 } %499, 1
  %502 = extractvalue { i32, i32, i32, i32 } %499, 2
  %503 = extractvalue { i32, i32, i32, i32 } %499, 3
  %504 = bitcast i32 %500 to float
  %505 = bitcast i32 %501 to float
  %506 = bitcast i32 %502 to float
  %507 = bitcast i32 %503 to float
  %508 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %496) #10
  %509 = extractvalue { i32, i32, i32, i32 } %508, 0
  %510 = extractvalue { i32, i32, i32, i32 } %508, 1
  %511 = extractvalue { i32, i32, i32, i32 } %508, 2
  %512 = extractvalue { i32, i32, i32, i32 } %508, 3
  %513 = bitcast i32 %509 to float
  %514 = bitcast i32 %510 to float
  %515 = bitcast i32 %511 to float
  %516 = bitcast i32 %512 to float
  %517 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %497) #10
  %518 = extractvalue { i32, i32, i32, i32 } %517, 0
  %519 = extractvalue { i32, i32, i32, i32 } %517, 1
  %520 = extractvalue { i32, i32, i32, i32 } %517, 2
  %521 = extractvalue { i32, i32, i32, i32 } %517, 3
  %522 = bitcast i32 %518 to float
  %523 = bitcast i32 %519 to float
  %524 = bitcast i32 %520 to float
  %525 = bitcast i32 %521 to float
  %526 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %498) #10
  %527 = extractvalue { i32, i32, i32, i32 } %526, 0
  %528 = extractvalue { i32, i32, i32, i32 } %526, 1
  %529 = extractvalue { i32, i32, i32, i32 } %526, 2
  %530 = extractvalue { i32, i32, i32, i32 } %526, 3
  %531 = bitcast i32 %527 to float
  %532 = bitcast i32 %528 to float
  %533 = bitcast i32 %529 to float
  %534 = bitcast i32 %530 to float
  %535 = fadd float %478, %504
  %536 = fadd float %479, %505
  %537 = fadd float %480, %506
  %538 = fadd float %481, %507
  %539 = fadd float %482, %513
  %540 = fadd float %483, %514
  %541 = fadd float %484, %515
  %542 = fadd float %485, %516
  %543 = fadd float %486, %522
  %544 = fadd float %487, %523
  %545 = fadd float %488, %524
  %546 = fadd float %489, %525
  %547 = fadd float %490, %531
  %548 = fadd float %491, %532
  %549 = fadd float %492, %533
  %550 = fadd float %493, %534
  %551 = fadd float %425, %535
  %552 = fadd float %426, %536
  %553 = fadd float %427, %537
  %554 = fadd float %428, %538
  %555 = fadd float %429, %539
  %556 = fadd float %430, %540
  %557 = fadd float %431, %541
  %558 = fadd float %432, %542
  %559 = fadd float %433, %543
  %560 = fadd float %434, %544
  %561 = fadd float %435, %545
  %562 = fadd float %436, %546
  %563 = fadd float %437, %547
  %564 = fadd float %438, %548
  %565 = fadd float %439, %549
  %566 = fadd float %440, %550
  %567 = fadd float %371, %551
  %568 = fadd float %372, %552
  %569 = fadd float %373, %553
  %570 = fadd float %374, %554
  %571 = fadd float %375, %555
  %572 = fadd float %376, %556
  %573 = fadd float %377, %557
  %574 = fadd float %378, %558
  %575 = fadd float %379, %559
  %576 = fadd float %380, %560
  %577 = fadd float %381, %561
  %578 = fadd float %382, %562
  %579 = fadd float %383, %563
  %580 = fadd float %384, %564
  %581 = fadd float %385, %565
  %582 = fadd float %386, %566
  %583 = fadd float %318, %567
  %584 = fadd float %319, %568
  %585 = fadd float %320, %569
  %586 = fadd float %321, %570
  %587 = fadd float %322, %571
  %588 = fadd float %323, %572
  %589 = fadd float %324, %573
  %590 = fadd float %325, %574
  %591 = fadd float %326, %575
  %592 = fadd float %327, %576
  %593 = fadd float %328, %577
  %594 = fadd float %329, %578
  %595 = fadd float %330, %579
  %596 = fadd float %331, %580
  %597 = fadd float %332, %581
  %598 = fadd float %333, %582
  %599 = fadd float %264, %583
  %600 = fadd float %265, %584
  %601 = fadd float %266, %585
  %602 = fadd float %267, %586
  %603 = fadd float %268, %587
  %604 = fadd float %269, %588
  %605 = fadd float %270, %589
  %606 = fadd float %271, %590
  %607 = fadd float %272, %591
  %608 = fadd float %273, %592
  %609 = fadd float %274, %593
  %610 = fadd float %275, %594
  %611 = fadd float %276, %595
  %612 = fadd float %277, %596
  %613 = fadd float %278, %597
  %614 = fadd float %279, %598
  %615 = fadd float %211, %599
  %616 = fadd float %212, %600
  %617 = fadd float %213, %601
  %618 = fadd float %214, %602
  %619 = fadd float %215, %603
  %620 = fadd float %216, %604
  %621 = fadd float %217, %605
  %622 = fadd float %218, %606
  %623 = fadd float %219, %607
  %624 = fadd float %220, %608
  %625 = fadd float %221, %609
  %626 = fadd float %222, %610
  %627 = fadd float %223, %611
  %628 = fadd float %224, %612
  %629 = fadd float %225, %613
  %630 = fadd float %226, %614
  %631 = fadd float %157, %615
  %632 = fadd float %158, %616
  %633 = fadd float %159, %617
  %634 = fadd float %160, %618
  %635 = fadd float %161, %619
  %636 = fadd float %162, %620
  %637 = fadd float %163, %621
  %638 = fadd float %164, %622
  %639 = fadd float %165, %623
  %640 = fadd float %166, %624
  %641 = fadd float %167, %625
  %642 = fadd float %168, %626
  %643 = fadd float %169, %627
  %644 = fadd float %170, %628
  %645 = fadd float %171, %629
  %646 = fadd float %172, %630
  %647 = fadd float %104, %631
  %648 = fadd float %105, %632
  %649 = fadd float %106, %633
  %650 = fadd float %107, %634
  %651 = fadd float %108, %635
  %652 = fadd float %109, %636
  %653 = fadd float %110, %637
  %654 = fadd float %111, %638
  %655 = fadd float %112, %639
  %656 = fadd float %113, %640
  %657 = fadd float %114, %641
  %658 = fadd float %115, %642
  %659 = fadd float %116, %643
  %660 = fadd float %117, %644
  %661 = fadd float %118, %645
  %662 = fadd float %119, %646
  %663 = fadd float %50, %647
  %664 = fadd float %51, %648
  %665 = fadd float %52, %649
  %666 = fadd float %53, %650
  %667 = fadd float %54, %651
  %668 = fadd float %55, %652
  %669 = fadd float %56, %653
  %670 = fadd float %57, %654
  %671 = fadd float %58, %655
  %672 = fadd float %59, %656
  %673 = fadd float %60, %657
  %674 = fadd float %61, %658
  %675 = fadd float %62, %659
  %676 = fadd float %63, %660
  %677 = fadd float %64, %661
  %678 = fadd float %65, %662
  %679 = fmul float %663, %663
  %680 = fmul float %664, %664
  %681 = fmul float %665, %665
  %682 = fmul float %666, %666
  %683 = fmul float %667, %667
  %684 = fmul float %668, %668
  %685 = fmul float %669, %669
  %686 = fmul float %670, %670
  %687 = fmul float %671, %671
  %688 = fmul float %672, %672
  %689 = fmul float %673, %673
  %690 = fmul float %674, %674
  %691 = fmul float %675, %675
  %692 = fmul float %676, %676
  %693 = fmul float %677, %677
  %694 = fmul float %678, %678
  %695 = fadd float %679, %680
  %696 = fadd float %681, %695
  %697 = fadd float %682, %696
  %698 = fadd float %683, %697
  %699 = fadd float %684, %698
  %700 = fadd float %685, %699
  %701 = fadd float %686, %700
  %702 = fadd float %687, %701
  %703 = fadd float %688, %702
  %704 = fadd float %689, %703
  %705 = fadd float %690, %704
  %706 = fadd float %691, %705
  %707 = fadd float %692, %706
  %708 = fadd float %693, %707
  %709 = fadd float %694, %708
  %710 = bitcast float %709 to i32
  %711 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %710, i32 16, i32 31)
  %712 = bitcast i32 %711 to float
  %713 = fadd float %709, %712
  %714 = bitcast float %713 to i32
  %715 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %714, i32 8, i32 31)
  %716 = bitcast i32 %715 to float
  %717 = fadd float %713, %716
  %718 = bitcast float %717 to i32
  %719 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %718, i32 4, i32 31)
  %720 = bitcast i32 %719 to float
  %721 = fadd float %717, %720
  %722 = bitcast float %721 to i32
  %723 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %722, i32 2, i32 31)
  %724 = bitcast i32 %723 to float
  %725 = fadd float %721, %724
  %726 = bitcast float %725 to i32
  %727 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %726, i32 1, i32 31)
  %728 = bitcast i32 %727 to float
  %729 = fadd float %725, %728
  %730 = icmp eq i32 %6, 0
  %731 = zext nneg i32 %7 to i64
  %732 = getelementptr float, ptr addrspace(3) @global_smem, i64 %731
  %733 = bitcast float %729 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %732, <1 x i32> %733, i1 %730) #10
  tail call void @llvm.nvvm.barrier0()
  %734 = icmp samesign ult i32 %5, 2
  %735 = zext nneg i32 %5 to i64
  %736 = getelementptr float, ptr addrspace(3) @global_smem, i64 %735
  %737 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %736, i1 %734) #10
  %738 = bitcast i32 %737 to float
  %739 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %737, i32 1, i32 31)
  %740 = bitcast i32 %739 to float
  %741 = fadd float %738, %740
  %742 = icmp eq i32 %5, 0
  %743 = bitcast float %741 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %736, <1 x i32> %743, i1 %742) #10
  tail call void @llvm.nvvm.barrier0()
  %744 = load float, ptr addrspace(3) @global_smem, align 16
  %745 = fmul float %744, 0x3F50000000000000
  %746 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #10
  %747 = bitcast i32 %746 to float
  %748 = fadd float %745, %747
  %749 = tail call float @llvm.nvvm.rsqrt.approx.f(float %748)
  %750 = fmul float %663, %749
  %751 = fmul float %664, %749
  %752 = fmul float %665, %749
  %753 = fmul float %666, %749
  %754 = fmul float %667, %749
  %755 = fmul float %668, %749
  %756 = fmul float %669, %749
  %757 = fmul float %670, %749
  %758 = fmul float %671, %749
  %759 = fmul float %672, %749
  %760 = fmul float %673, %749
  %761 = fmul float %674, %749
  %762 = fmul float %675, %749
  %763 = fmul float %676, %749
  %764 = fmul float %677, %749
  %765 = fmul float %678, %749
  %766 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %13
  %767 = getelementptr i8, ptr addrspace(1) %766, i64 1024
  %768 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %766) #10
  %769 = extractvalue { i32, i32, i32, i32 } %768, 0
  %770 = bitcast i32 %769 to <2 x bfloat>
  %771 = extractvalue { i32, i32, i32, i32 } %768, 1
  %772 = bitcast i32 %771 to <2 x bfloat>
  %773 = extractvalue { i32, i32, i32, i32 } %768, 2
  %774 = bitcast i32 %773 to <2 x bfloat>
  %775 = extractvalue { i32, i32, i32, i32 } %768, 3
  %776 = bitcast i32 %775 to <2 x bfloat>
  %777 = extractelement <2 x bfloat> %770, i64 0
  %778 = extractelement <2 x bfloat> %770, i64 1
  %779 = extractelement <2 x bfloat> %772, i64 0
  %780 = extractelement <2 x bfloat> %772, i64 1
  %781 = extractelement <2 x bfloat> %774, i64 0
  %782 = extractelement <2 x bfloat> %774, i64 1
  %783 = extractelement <2 x bfloat> %776, i64 0
  %784 = extractelement <2 x bfloat> %776, i64 1
  %785 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %767) #10
  %786 = extractvalue { i32, i32, i32, i32 } %785, 0
  %787 = bitcast i32 %786 to <2 x bfloat>
  %788 = extractvalue { i32, i32, i32, i32 } %785, 1
  %789 = bitcast i32 %788 to <2 x bfloat>
  %790 = extractvalue { i32, i32, i32, i32 } %785, 2
  %791 = bitcast i32 %790 to <2 x bfloat>
  %792 = extractvalue { i32, i32, i32, i32 } %785, 3
  %793 = bitcast i32 %792 to <2 x bfloat>
  %794 = extractelement <2 x bfloat> %787, i64 0
  %795 = extractelement <2 x bfloat> %787, i64 1
  %796 = extractelement <2 x bfloat> %789, i64 0
  %797 = extractelement <2 x bfloat> %789, i64 1
  %798 = extractelement <2 x bfloat> %791, i64 0
  %799 = extractelement <2 x bfloat> %791, i64 1
  %800 = extractelement <2 x bfloat> %793, i64 0
  %801 = extractelement <2 x bfloat> %793, i64 1
  %802 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %777) #10
  %803 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %778) #10
  %804 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %779) #10
  %805 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %780) #10
  %806 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %781) #10
  %807 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %782) #10
  %808 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %783) #10
  %809 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %784) #10
  %810 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %794) #10
  %811 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %795) #10
  %812 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %796) #10
  %813 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %797) #10
  %814 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %798) #10
  %815 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %799) #10
  %816 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %800) #10
  %817 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %801) #10
  %818 = fmul float %750, %802
  %819 = fmul float %751, %803
  %820 = fmul float %752, %804
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
  %834 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %818) #10
  %835 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %819) #10
  %836 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %820) #10
  %837 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %821) #10
  %838 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %822) #10
  %839 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %823) #10
  %840 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %824) #10
  %841 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %825) #10
  %842 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %826) #10
  %843 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %827) #10
  %844 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %828) #10
  %845 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %829) #10
  %846 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %830) #10
  %847 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %831) #10
  %848 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %832) #10
  %849 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %833) #10
  %850 = getelementptr bfloat, ptr addrspace(1) %arg919, i64 %3
  %851 = getelementptr bfloat, ptr addrspace(1) %850, i64 %13
  %852 = getelementptr i8, ptr addrspace(1) %851, i64 1024
  %853 = insertelement <2 x bfloat> poison, bfloat %834, i64 0
  %854 = insertelement <2 x bfloat> %853, bfloat %835, i64 1
  %855 = bitcast <2 x bfloat> %854 to i32
  %856 = insertelement <2 x bfloat> poison, bfloat %836, i64 0
  %857 = insertelement <2 x bfloat> %856, bfloat %837, i64 1
  %858 = bitcast <2 x bfloat> %857 to i32
  %859 = insertelement <2 x bfloat> poison, bfloat %838, i64 0
  %860 = insertelement <2 x bfloat> %859, bfloat %839, i64 1
  %861 = bitcast <2 x bfloat> %860 to i32
  %862 = insertelement <2 x bfloat> poison, bfloat %840, i64 0
  %863 = insertelement <2 x bfloat> %862, bfloat %841, i64 1
  %864 = bitcast <2 x bfloat> %863 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %855, i32 %858, i32 %861, i32 %864, ptr addrspace(1) %851) #10
  %865 = insertelement <2 x bfloat> poison, bfloat %842, i64 0
  %866 = insertelement <2 x bfloat> %865, bfloat %843, i64 1
  %867 = bitcast <2 x bfloat> %866 to i32
  %868 = insertelement <2 x bfloat> poison, bfloat %844, i64 0
  %869 = insertelement <2 x bfloat> %868, bfloat %845, i64 1
  %870 = bitcast <2 x bfloat> %869 to i32
  %871 = insertelement <2 x bfloat> poison, bfloat %846, i64 0
  %872 = insertelement <2 x bfloat> %871, bfloat %847, i64 1
  %873 = bitcast <2 x bfloat> %872 to i32
  %874 = insertelement <2 x bfloat> poison, bfloat %848, i64 0
  %875 = insertelement <2 x bfloat> %874, bfloat %849, i64 1
  %876 = bitcast <2 x bfloat> %875 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %867, i32 %870, i32 %873, i32 %876, ptr addrspace(1) %852) #10
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

define ptx_kernel void @triton_softmax_10_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2) local_unnamed_addr #6 {
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
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !28)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !31)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !6, !alias.scope !31, !noalias !28
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !6, !alias.scope !28, !noalias !31
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
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !6, !alias.scope !33, !noalias !36
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
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
attributes #4 = { "nvvm.reqntid"="256,1,1" }
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
!7 = !{i32 0, i32 32768}
!8 = !{i32 0, i32 1536}
!9 = !{!10}
!10 = distinct !{!10, !11, !"fused_convert_7_param_0_348: argument 0"}
!11 = distinct !{!11, !"fused_convert_7_param_0_348"}
!12 = !{!13}
!13 = distinct !{!13, !14, !"fused_convert_7_param_0_348: argument 0"}
!14 = distinct !{!14, !"fused_convert_7_param_0_348"}
!15 = !{!16}
!16 = distinct !{!16, !17, !"fused_add_convert_429_16: argument 0"}
!17 = distinct !{!17, !"fused_add_convert_429_16"}
!18 = !{!19}
!19 = distinct !{!19, !20, !"fused_add_convert_429_16: argument 0"}
!20 = distinct !{!20, !"fused_add_convert_429_16"}
!21 = !{!22}
!22 = distinct !{!22, !23, !"fused_add_convert_429_16: argument 0"}
!23 = distinct !{!23, !"fused_add_convert_429_16"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"fused_add_convert_429_16: argument 0"}
!26 = distinct !{!26, !"fused_add_convert_429_16"}
!27 = !{i32 0, i32 256}
!28 = !{!29}
!29 = distinct !{!29, !30, !"fused_concatenate_convert_554_7: argument 0"}
!30 = distinct !{!30, !"fused_concatenate_convert_554_7"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"fused_concatenate_convert_554_7: argument 1"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"fused_concatenate_convert_554_7: argument 0"}
!35 = distinct !{!35, !"fused_concatenate_convert_554_7"}
!36 = !{!37}
!37 = distinct !{!37, !35, !"fused_concatenate_convert_554_7: argument 1"}
!38 = !{i32 0, i32 135456}

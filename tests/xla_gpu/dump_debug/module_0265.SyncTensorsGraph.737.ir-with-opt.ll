; ModuleID = 'SyncTensorsGraph.737'
source_filename = "SyncTensorsGraph.737"
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
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %365 = load bfloat, ptr addrspace(1) %.in3, align 2, !invariant.load !5
  %366 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !5
  %367 = insertelement <4 x bfloat> poison, bfloat %366, i64 0
  %368 = load bfloat, ptr addrspace(1) %.in1, align 2, !invariant.load !5
  %369 = insertelement <4 x bfloat> %367, bfloat %368, i64 1
  %370 = load bfloat, ptr addrspace(1) %.in2, align 2, !invariant.load !5
  %371 = insertelement <4 x bfloat> %369, bfloat %370, i64 2
  %372 = insertelement <4 x bfloat> %371, bfloat %365, i64 3
  %373 = zext nneg i32 %25 to i64
  %374 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %373
  store <4 x bfloat> %372, ptr addrspace(1) %374, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_31_0(ptr noalias align 128 dereferenceable(33554432) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1) local_unnamed_addr #4 {
  %arg1117 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0115 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 64, %3
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %128, ptr addrspace(1) %105, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %133, ptr addrspace(1) %106, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %138, ptr addrspace(1) %107, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %143, ptr addrspace(1) %108, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %148, ptr addrspace(1) %109, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %153, ptr addrspace(1) %110, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %158, ptr addrspace(1) %111, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %163, ptr addrspace(1) %112, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %113, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %173, ptr addrspace(1) %114, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %178, ptr addrspace(1) %115, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %183, ptr addrspace(1) %116, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %188, ptr addrspace(1) %117, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %193, ptr addrspace(1) %118, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %198, ptr addrspace(1) %119, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %203, ptr addrspace(1) %120, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %252, ptr addrspace(1) %206, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %253, ptr addrspace(1) %209, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %254, ptr addrspace(1) %212, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %255, ptr addrspace(1) %215, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %256, ptr addrspace(1) %218, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %257, ptr addrspace(1) %221, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %258, ptr addrspace(1) %224, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %259, ptr addrspace(1) %227, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %260, ptr addrspace(1) %230, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %261, ptr addrspace(1) %233, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %262, ptr addrspace(1) %236, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %263, ptr addrspace(1) %239, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %264, ptr addrspace(1) %242, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %265, ptr addrspace(1) %245, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %266, ptr addrspace(1) %248, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %267, ptr addrspace(1) %251, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %284, ptr addrspace(1) %268, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %285, ptr addrspace(1) %269, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %286, ptr addrspace(1) %270, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %287, ptr addrspace(1) %271, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %288, ptr addrspace(1) %272, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %289, ptr addrspace(1) %273, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %290, ptr addrspace(1) %274, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %291, ptr addrspace(1) %275, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %292, ptr addrspace(1) %276, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %293, ptr addrspace(1) %277, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %294, ptr addrspace(1) %278, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %295, ptr addrspace(1) %279, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %296, ptr addrspace(1) %280, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %297, ptr addrspace(1) %281, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %298, ptr addrspace(1) %282, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %299, ptr addrspace(1) %283, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #11
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
  %484 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %483) #11
  %485 = extractvalue { i32, i32, i32, i32 } %484, 0
  %486 = extractvalue { i32, i32, i32, i32 } %484, 1
  %487 = extractvalue { i32, i32, i32, i32 } %484, 2
  %488 = extractvalue { i32, i32, i32, i32 } %484, 3
  %489 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %322
  %490 = ptrtoint ptr addrspace(3) %489 to i64
  %491 = trunc i64 %490 to i32
  %492 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %491) #11
  %493 = extractvalue { i32, i32, i32, i32 } %492, 0
  %494 = extractvalue { i32, i32, i32, i32 } %492, 1
  %495 = extractvalue { i32, i32, i32, i32 } %492, 2
  %496 = extractvalue { i32, i32, i32, i32 } %492, 3
  %497 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %327
  %498 = ptrtoint ptr addrspace(3) %497 to i64
  %499 = trunc i64 %498 to i32
  %500 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %499) #11
  %501 = extractvalue { i32, i32, i32, i32 } %500, 0
  %502 = extractvalue { i32, i32, i32, i32 } %500, 1
  %503 = extractvalue { i32, i32, i32, i32 } %500, 2
  %504 = extractvalue { i32, i32, i32, i32 } %500, 3
  %505 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %333
  %506 = ptrtoint ptr addrspace(3) %505 to i64
  %507 = trunc i64 %506 to i32
  %508 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %507) #11
  %509 = extractvalue { i32, i32, i32, i32 } %508, 0
  %510 = extractvalue { i32, i32, i32, i32 } %508, 1
  %511 = extractvalue { i32, i32, i32, i32 } %508, 2
  %512 = extractvalue { i32, i32, i32, i32 } %508, 3
  %513 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %336
  %514 = ptrtoint ptr addrspace(3) %513 to i64
  %515 = trunc i64 %514 to i32
  %516 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %515) #11
  %517 = extractvalue { i32, i32, i32, i32 } %516, 0
  %518 = extractvalue { i32, i32, i32, i32 } %516, 1
  %519 = extractvalue { i32, i32, i32, i32 } %516, 2
  %520 = extractvalue { i32, i32, i32, i32 } %516, 3
  %521 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %342
  %522 = ptrtoint ptr addrspace(3) %521 to i64
  %523 = trunc i64 %522 to i32
  %524 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %523) #11
  %525 = extractvalue { i32, i32, i32, i32 } %524, 0
  %526 = extractvalue { i32, i32, i32, i32 } %524, 1
  %527 = extractvalue { i32, i32, i32, i32 } %524, 2
  %528 = extractvalue { i32, i32, i32, i32 } %524, 3
  %529 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %347
  %530 = ptrtoint ptr addrspace(3) %529 to i64
  %531 = trunc i64 %530 to i32
  %532 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %531) #11
  %533 = extractvalue { i32, i32, i32, i32 } %532, 0
  %534 = extractvalue { i32, i32, i32, i32 } %532, 1
  %535 = extractvalue { i32, i32, i32, i32 } %532, 2
  %536 = extractvalue { i32, i32, i32, i32 } %532, 3
  %537 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %352
  %538 = ptrtoint ptr addrspace(3) %537 to i64
  %539 = trunc i64 %538 to i32
  %540 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %539) #11
  %541 = extractvalue { i32, i32, i32, i32 } %540, 0
  %542 = extractvalue { i32, i32, i32, i32 } %540, 1
  %543 = extractvalue { i32, i32, i32, i32 } %540, 2
  %544 = extractvalue { i32, i32, i32, i32 } %540, 3
  %545 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %355
  %546 = ptrtoint ptr addrspace(3) %545 to i64
  %547 = trunc i64 %546 to i32
  %548 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %547) #11
  %549 = extractvalue { i32, i32, i32, i32 } %548, 0
  %550 = extractvalue { i32, i32, i32, i32 } %548, 1
  %551 = extractvalue { i32, i32, i32, i32 } %548, 2
  %552 = extractvalue { i32, i32, i32, i32 } %548, 3
  %553 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %361
  %554 = ptrtoint ptr addrspace(3) %553 to i64
  %555 = trunc i64 %554 to i32
  %556 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %555) #11
  %557 = extractvalue { i32, i32, i32, i32 } %556, 0
  %558 = extractvalue { i32, i32, i32, i32 } %556, 1
  %559 = extractvalue { i32, i32, i32, i32 } %556, 2
  %560 = extractvalue { i32, i32, i32, i32 } %556, 3
  %561 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %366
  %562 = ptrtoint ptr addrspace(3) %561 to i64
  %563 = trunc i64 %562 to i32
  %564 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %563) #11
  %565 = extractvalue { i32, i32, i32, i32 } %564, 0
  %566 = extractvalue { i32, i32, i32, i32 } %564, 1
  %567 = extractvalue { i32, i32, i32, i32 } %564, 2
  %568 = extractvalue { i32, i32, i32, i32 } %564, 3
  %569 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %371
  %570 = ptrtoint ptr addrspace(3) %569 to i64
  %571 = trunc i64 %570 to i32
  %572 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %571) #11
  %573 = extractvalue { i32, i32, i32, i32 } %572, 0
  %574 = extractvalue { i32, i32, i32, i32 } %572, 1
  %575 = extractvalue { i32, i32, i32, i32 } %572, 2
  %576 = extractvalue { i32, i32, i32, i32 } %572, 3
  %577 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %374
  %578 = ptrtoint ptr addrspace(3) %577 to i64
  %579 = trunc i64 %578 to i32
  %580 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %579) #11
  %581 = extractvalue { i32, i32, i32, i32 } %580, 0
  %582 = extractvalue { i32, i32, i32, i32 } %580, 1
  %583 = extractvalue { i32, i32, i32, i32 } %580, 2
  %584 = extractvalue { i32, i32, i32, i32 } %580, 3
  %585 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %380
  %586 = ptrtoint ptr addrspace(3) %585 to i64
  %587 = trunc i64 %586 to i32
  %588 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %587) #11
  %589 = extractvalue { i32, i32, i32, i32 } %588, 0
  %590 = extractvalue { i32, i32, i32, i32 } %588, 1
  %591 = extractvalue { i32, i32, i32, i32 } %588, 2
  %592 = extractvalue { i32, i32, i32, i32 } %588, 3
  %593 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %385
  %594 = ptrtoint ptr addrspace(3) %593 to i64
  %595 = trunc i64 %594 to i32
  %596 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %595) #11
  %597 = extractvalue { i32, i32, i32, i32 } %596, 0
  %598 = extractvalue { i32, i32, i32, i32 } %596, 1
  %599 = extractvalue { i32, i32, i32, i32 } %596, 2
  %600 = extractvalue { i32, i32, i32, i32 } %596, 3
  %601 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %475, i64 %390
  %602 = ptrtoint ptr addrspace(3) %601 to i64
  %603 = trunc i64 %602 to i32
  %604 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %603) #11
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
  %625 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %609, float %610, float %611, float %612, i32 %485, i32 %486, i32 %487, i32 %488, i32 0, i32 0) #11
  %626 = extractvalue { float, float, float, float } %625, 0
  %627 = extractvalue { float, float, float, float } %625, 1
  %628 = extractvalue { float, float, float, float } %625, 2
  %629 = extractvalue { float, float, float, float } %625, 3
  %630 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %613, float %614, float %615, float %616, i32 %485, i32 %486, i32 %487, i32 %488, i32 0, i32 0) #11
  %631 = extractvalue { float, float, float, float } %630, 0
  %632 = extractvalue { float, float, float, float } %630, 1
  %633 = extractvalue { float, float, float, float } %630, 2
  %634 = extractvalue { float, float, float, float } %630, 3
  %635 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %617, float %618, float %619, float %620, i32 %549, i32 %550, i32 %551, i32 %552, i32 0, i32 0) #11
  %636 = extractvalue { float, float, float, float } %635, 0
  %637 = extractvalue { float, float, float, float } %635, 1
  %638 = extractvalue { float, float, float, float } %635, 2
  %639 = extractvalue { float, float, float, float } %635, 3
  %640 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %621, float %622, float %623, float %624, i32 %549, i32 %550, i32 %551, i32 %552, i32 0, i32 0) #11
  %641 = extractvalue { float, float, float, float } %640, 0
  %642 = extractvalue { float, float, float, float } %640, 1
  %643 = extractvalue { float, float, float, float } %640, 2
  %644 = extractvalue { float, float, float, float } %640, 3
  %645 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %626, float %627, float %628, float %629, i32 %493, i32 %494, i32 %495, i32 %496, i32 0, i32 0) #11
  %646 = extractvalue { float, float, float, float } %645, 0
  %647 = extractvalue { float, float, float, float } %645, 1
  %648 = extractvalue { float, float, float, float } %645, 2
  %649 = extractvalue { float, float, float, float } %645, 3
  %650 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %631, float %632, float %633, float %634, i32 %493, i32 %494, i32 %495, i32 %496, i32 0, i32 0) #11
  %651 = extractvalue { float, float, float, float } %650, 0
  %652 = extractvalue { float, float, float, float } %650, 1
  %653 = extractvalue { float, float, float, float } %650, 2
  %654 = extractvalue { float, float, float, float } %650, 3
  %655 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %636, float %637, float %638, float %639, i32 %557, i32 %558, i32 %559, i32 %560, i32 0, i32 0) #11
  %656 = extractvalue { float, float, float, float } %655, 0
  %657 = extractvalue { float, float, float, float } %655, 1
  %658 = extractvalue { float, float, float, float } %655, 2
  %659 = extractvalue { float, float, float, float } %655, 3
  %660 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %641, float %642, float %643, float %644, i32 %557, i32 %558, i32 %559, i32 %560, i32 0, i32 0) #11
  %661 = extractvalue { float, float, float, float } %660, 0
  %662 = extractvalue { float, float, float, float } %660, 1
  %663 = extractvalue { float, float, float, float } %660, 2
  %664 = extractvalue { float, float, float, float } %660, 3
  %665 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %646, float %647, float %648, float %649, i32 %501, i32 %502, i32 %503, i32 %504, i32 0, i32 0) #11
  %666 = extractvalue { float, float, float, float } %665, 0
  %667 = extractvalue { float, float, float, float } %665, 1
  %668 = extractvalue { float, float, float, float } %665, 2
  %669 = extractvalue { float, float, float, float } %665, 3
  %670 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %651, float %652, float %653, float %654, i32 %501, i32 %502, i32 %503, i32 %504, i32 0, i32 0) #11
  %671 = extractvalue { float, float, float, float } %670, 0
  %672 = extractvalue { float, float, float, float } %670, 1
  %673 = extractvalue { float, float, float, float } %670, 2
  %674 = extractvalue { float, float, float, float } %670, 3
  %675 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %656, float %657, float %658, float %659, i32 %565, i32 %566, i32 %567, i32 %568, i32 0, i32 0) #11
  %676 = extractvalue { float, float, float, float } %675, 0
  %677 = extractvalue { float, float, float, float } %675, 1
  %678 = extractvalue { float, float, float, float } %675, 2
  %679 = extractvalue { float, float, float, float } %675, 3
  %680 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %661, float %662, float %663, float %664, i32 %565, i32 %566, i32 %567, i32 %568, i32 0, i32 0) #11
  %681 = extractvalue { float, float, float, float } %680, 0
  %682 = extractvalue { float, float, float, float } %680, 1
  %683 = extractvalue { float, float, float, float } %680, 2
  %684 = extractvalue { float, float, float, float } %680, 3
  %685 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %666, float %667, float %668, float %669, i32 %509, i32 %510, i32 %511, i32 %512, i32 0, i32 0) #11
  %686 = extractvalue { float, float, float, float } %685, 0
  %687 = extractvalue { float, float, float, float } %685, 1
  %688 = extractvalue { float, float, float, float } %685, 2
  %689 = extractvalue { float, float, float, float } %685, 3
  %690 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %671, float %672, float %673, float %674, i32 %509, i32 %510, i32 %511, i32 %512, i32 0, i32 0) #11
  %691 = extractvalue { float, float, float, float } %690, 0
  %692 = extractvalue { float, float, float, float } %690, 1
  %693 = extractvalue { float, float, float, float } %690, 2
  %694 = extractvalue { float, float, float, float } %690, 3
  %695 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %676, float %677, float %678, float %679, i32 %573, i32 %574, i32 %575, i32 %576, i32 0, i32 0) #11
  %696 = extractvalue { float, float, float, float } %695, 0
  %697 = extractvalue { float, float, float, float } %695, 1
  %698 = extractvalue { float, float, float, float } %695, 2
  %699 = extractvalue { float, float, float, float } %695, 3
  %700 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %681, float %682, float %683, float %684, i32 %573, i32 %574, i32 %575, i32 %576, i32 0, i32 0) #11
  %701 = extractvalue { float, float, float, float } %700, 0
  %702 = extractvalue { float, float, float, float } %700, 1
  %703 = extractvalue { float, float, float, float } %700, 2
  %704 = extractvalue { float, float, float, float } %700, 3
  %705 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %686, float %687, float %688, float %689, i32 %517, i32 %518, i32 %519, i32 %520, i32 0, i32 0) #11
  %706 = extractvalue { float, float, float, float } %705, 0
  %707 = extractvalue { float, float, float, float } %705, 1
  %708 = extractvalue { float, float, float, float } %705, 2
  %709 = extractvalue { float, float, float, float } %705, 3
  %710 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %691, float %692, float %693, float %694, i32 %517, i32 %518, i32 %519, i32 %520, i32 0, i32 0) #11
  %711 = extractvalue { float, float, float, float } %710, 0
  %712 = extractvalue { float, float, float, float } %710, 1
  %713 = extractvalue { float, float, float, float } %710, 2
  %714 = extractvalue { float, float, float, float } %710, 3
  %715 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %696, float %697, float %698, float %699, i32 %581, i32 %582, i32 %583, i32 %584, i32 0, i32 0) #11
  %716 = extractvalue { float, float, float, float } %715, 0
  %717 = extractvalue { float, float, float, float } %715, 1
  %718 = extractvalue { float, float, float, float } %715, 2
  %719 = extractvalue { float, float, float, float } %715, 3
  %720 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %701, float %702, float %703, float %704, i32 %581, i32 %582, i32 %583, i32 %584, i32 0, i32 0) #11
  %721 = extractvalue { float, float, float, float } %720, 0
  %722 = extractvalue { float, float, float, float } %720, 1
  %723 = extractvalue { float, float, float, float } %720, 2
  %724 = extractvalue { float, float, float, float } %720, 3
  %725 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %706, float %707, float %708, float %709, i32 %525, i32 %526, i32 %527, i32 %528, i32 0, i32 0) #11
  %726 = extractvalue { float, float, float, float } %725, 0
  %727 = extractvalue { float, float, float, float } %725, 1
  %728 = extractvalue { float, float, float, float } %725, 2
  %729 = extractvalue { float, float, float, float } %725, 3
  %730 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %711, float %712, float %713, float %714, i32 %525, i32 %526, i32 %527, i32 %528, i32 0, i32 0) #11
  %731 = extractvalue { float, float, float, float } %730, 0
  %732 = extractvalue { float, float, float, float } %730, 1
  %733 = extractvalue { float, float, float, float } %730, 2
  %734 = extractvalue { float, float, float, float } %730, 3
  %735 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %716, float %717, float %718, float %719, i32 %589, i32 %590, i32 %591, i32 %592, i32 0, i32 0) #11
  %736 = extractvalue { float, float, float, float } %735, 0
  %737 = extractvalue { float, float, float, float } %735, 1
  %738 = extractvalue { float, float, float, float } %735, 2
  %739 = extractvalue { float, float, float, float } %735, 3
  %740 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %721, float %722, float %723, float %724, i32 %589, i32 %590, i32 %591, i32 %592, i32 0, i32 0) #11
  %741 = extractvalue { float, float, float, float } %740, 0
  %742 = extractvalue { float, float, float, float } %740, 1
  %743 = extractvalue { float, float, float, float } %740, 2
  %744 = extractvalue { float, float, float, float } %740, 3
  %745 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %726, float %727, float %728, float %729, i32 %533, i32 %534, i32 %535, i32 %536, i32 0, i32 0) #11
  %746 = extractvalue { float, float, float, float } %745, 0
  %747 = extractvalue { float, float, float, float } %745, 1
  %748 = extractvalue { float, float, float, float } %745, 2
  %749 = extractvalue { float, float, float, float } %745, 3
  %750 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %731, float %732, float %733, float %734, i32 %533, i32 %534, i32 %535, i32 %536, i32 0, i32 0) #11
  %751 = extractvalue { float, float, float, float } %750, 0
  %752 = extractvalue { float, float, float, float } %750, 1
  %753 = extractvalue { float, float, float, float } %750, 2
  %754 = extractvalue { float, float, float, float } %750, 3
  %755 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %736, float %737, float %738, float %739, i32 %597, i32 %598, i32 %599, i32 %600, i32 0, i32 0) #11
  %756 = extractvalue { float, float, float, float } %755, 0
  %757 = extractvalue { float, float, float, float } %755, 1
  %758 = extractvalue { float, float, float, float } %755, 2
  %759 = extractvalue { float, float, float, float } %755, 3
  %760 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %741, float %742, float %743, float %744, i32 %597, i32 %598, i32 %599, i32 %600, i32 0, i32 0) #11
  %761 = extractvalue { float, float, float, float } %760, 0
  %762 = extractvalue { float, float, float, float } %760, 1
  %763 = extractvalue { float, float, float, float } %760, 2
  %764 = extractvalue { float, float, float, float } %760, 3
  %765 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %746, float %747, float %748, float %749, i32 %541, i32 %542, i32 %543, i32 %544, i32 0, i32 0) #11
  %766 = extractvalue { float, float, float, float } %765, 0
  %767 = extractvalue { float, float, float, float } %765, 1
  %768 = extractvalue { float, float, float, float } %765, 2
  %769 = extractvalue { float, float, float, float } %765, 3
  %770 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %751, float %752, float %753, float %754, i32 %541, i32 %542, i32 %543, i32 %544, i32 0, i32 0) #11
  %771 = extractvalue { float, float, float, float } %770, 0
  %772 = extractvalue { float, float, float, float } %770, 1
  %773 = extractvalue { float, float, float, float } %770, 2
  %774 = extractvalue { float, float, float, float } %770, 3
  %775 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %756, float %757, float %758, float %759, i32 %605, i32 %606, i32 %607, i32 %608, i32 0, i32 0) #11
  %776 = extractvalue { float, float, float, float } %775, 0
  %777 = extractvalue { float, float, float, float } %775, 1
  %778 = extractvalue { float, float, float, float } %775, 2
  %779 = extractvalue { float, float, float, float } %775, 3
  %780 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %761, float %762, float %763, float %764, i32 %605, i32 %606, i32 %607, i32 %608, i32 0, i32 0) #11
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
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %807, ptr addrspace(1) %scevgep180, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %808, ptr addrspace(1) %scevgep176, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %809, ptr addrspace(1) %scevgep172, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %810, ptr addrspace(1) %scevgep168, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %811, ptr addrspace(1) %scevgep164, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %812, ptr addrspace(1) %scevgep160, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %813, ptr addrspace(1) %scevgep156, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %814, ptr addrspace(1) %scevgep152, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %815, ptr addrspace(1) %scevgep148, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %816, ptr addrspace(1) %scevgep144, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %817, ptr addrspace(1) %scevgep140, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %818, ptr addrspace(1) %scevgep136, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %819, ptr addrspace(1) %scevgep132, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %820, ptr addrspace(1) %scevgep128, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %821, ptr addrspace(1) %scevgep124, i32 %823) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %822, ptr addrspace(1) %scevgep120, i32 %823) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  %824 = add i32 %476, 1
  %825 = icmp slt i32 %824, 3
  %826 = select i1 %825, i32 %824, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x2;", ""() #11
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
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #11
  tail call void @llvm.nvvm.barrier0()
  %835 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %766) #11
  %836 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %767) #11
  %837 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %768) #11
  %838 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %769) #11
  %839 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %771) #11
  %840 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %772) #11
  %841 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %773) #11
  %842 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %774) #11
  %843 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %776) #11
  %844 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %777) #11
  %845 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %778) #11
  %846 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %779) #11
  %847 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %781) #11
  %848 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %782) #11
  %849 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %783) #11
  %850 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %784) #11
  %851 = shl nsw i32 %834, 4
  %852 = sext i32 %851 to i64
  %853 = or disjoint i64 %9, %56
  %854 = or disjoint i64 %852, %40
  %855 = or disjoint i64 %852, %41
  %856 = getelementptr bfloat, ptr addrspace(1) %arg1117, i64 %853
  %.idx = shl nsw i64 %854, 14
  %857 = getelementptr i8, ptr addrspace(1) %856, i64 %.idx
  %.idx2 = shl nsw i64 %855, 14
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
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %874, <1 x i16> %875, i1 true) #11
  %876 = or disjoint i32 %867, 128
  %877 = lshr i32 %876, 4
  %878 = and i32 %877, 134217720
  %879 = zext nneg i32 %878 to i64
  %880 = zext nneg i32 %867 to i64
  %881 = add i64 %879, %880
  %882 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %881
  %883 = getelementptr inbounds i8, ptr addrspace(3) %882, i64 256
  %884 = bitcast bfloat %836 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %883, <1 x i16> %884, i1 true) #11
  %885 = zext nneg i32 %871 to i64
  %886 = add i64 %885, %880
  %887 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %886
  %888 = getelementptr inbounds i8, ptr addrspace(3) %887, i64 16
  %889 = bitcast bfloat %837 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %888, <1 x i16> %889, i1 true) #11
  %890 = or disjoint i32 %867, 136
  %891 = lshr i32 %890, 4
  %892 = and i32 %891, 134217720
  %893 = zext nneg i32 %892 to i64
  %894 = add i64 %893, %880
  %895 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %894
  %896 = getelementptr inbounds i8, ptr addrspace(3) %895, i64 272
  %897 = bitcast bfloat %838 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %896, <1 x i16> %897, i1 true) #11
  %898 = getelementptr inbounds i8, ptr addrspace(3) %887, i64 128
  %899 = bitcast bfloat %843 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %898, <1 x i16> %899, i1 true) #11
  %900 = or disjoint i32 %867, 192
  %901 = lshr i32 %900, 4
  %902 = and i32 %901, 134217720
  %903 = zext nneg i32 %902 to i64
  %904 = add i64 %903, %880
  %905 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %904
  %906 = getelementptr inbounds i8, ptr addrspace(3) %905, i64 384
  %907 = bitcast bfloat %844 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %906, <1 x i16> %907, i1 true) #11
  %908 = getelementptr inbounds i8, ptr addrspace(3) %887, i64 144
  %909 = bitcast bfloat %845 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %908, <1 x i16> %909, i1 true) #11
  %910 = or disjoint i32 %867, 200
  %911 = lshr i32 %910, 4
  %912 = and i32 %911, 134217720
  %913 = zext nneg i32 %912 to i64
  %914 = add i64 %913, %880
  %915 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %914
  %916 = getelementptr inbounds i8, ptr addrspace(3) %915, i64 400
  %917 = bitcast bfloat %846 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %916, <1 x i16> %917, i1 true) #11
  tail call void @llvm.nvvm.barrier0()
  %918 = lshr i32 %870, 4
  %919 = and i32 %918, 56
  %920 = add nuw nsw i32 %919, %870
  %921 = zext nneg i32 %920 to i64
  %922 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %921
  %923 = load <4 x i32>, ptr addrspace(3) %922, align 16
  tail call void @llvm.nvvm.barrier0()
  %924 = bitcast bfloat %839 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %874, <1 x i16> %924, i1 true) #11
  %925 = bitcast bfloat %840 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %883, <1 x i16> %925, i1 true) #11
  %926 = bitcast bfloat %841 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %888, <1 x i16> %926, i1 true) #11
  %927 = bitcast bfloat %842 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %896, <1 x i16> %927, i1 true) #11
  %928 = bitcast bfloat %847 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %898, <1 x i16> %928, i1 true) #11
  %929 = bitcast bfloat %848 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %906, <1 x i16> %929, i1 true) #11
  %930 = bitcast bfloat %849 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %908, <1 x i16> %930, i1 true) #11
  %931 = bitcast bfloat %850 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %916, <1 x i16> %931, i1 true) #11
  tail call void @llvm.nvvm.barrier0()
  %932 = load <4 x i32>, ptr addrspace(3) %922, align 16
  %.extract = extractelement <4 x i32> %923, i64 0
  %.extract27 = extractelement <4 x i32> %923, i64 1
  %.extract29 = extractelement <4 x i32> %923, i64 2
  %.extract31 = extractelement <4 x i32> %923, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract27, i32 %.extract29, i32 %.extract31, ptr addrspace(1) %857) #11
  %.extract33 = extractelement <4 x i32> %932, i64 0
  %.extract35 = extractelement <4 x i32> %932, i64 1
  %.extract37 = extractelement <4 x i32> %932, i64 2
  %.extract39 = extractelement <4 x i32> %932, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract33, i32 %.extract35, i32 %.extract37, i32 %.extract39, ptr addrspace(1) %858) #11
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_116(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #6 {
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = shl i64 %3, 13
  %7 = or disjoint i64 %6, %5
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
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 14336
  %20 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %19) #11
  %21 = extractvalue { i32, i32 } %20, 0
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32 } %20, 1
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = extractelement <2 x bfloat> %24, i64 0
  %28 = extractelement <2 x bfloat> %24, i64 1
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #11
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #11
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %32 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %33 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %4
  %34 = getelementptr bfloat, ptr addrspace(1) %33, i64 %17
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %34) #11
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractelement <2 x bfloat> %37, i64 0
  %41 = extractelement <2 x bfloat> %37, i64 1
  %42 = extractelement <2 x bfloat> %39, i64 0
  %43 = extractelement <2 x bfloat> %39, i64 1
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #11
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #11
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #11
  %47 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #11
  %48 = fadd float %29, %44
  %49 = fadd float %30, %45
  %50 = fadd float %31, %46
  %51 = fadd float %32, %47
  %52 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %6
  %53 = getelementptr i8, ptr addrspace(1) %52, i64 14336
  %54 = shl nuw nsw i32 %9, 3
  %55 = and i32 %54, 248
  %56 = select i1 %14, i32 0, i32 256
  %57 = or disjoint i32 %55, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr bfloat, ptr addrspace(1) %52, i64 %58
  %60 = getelementptr i8, ptr addrspace(1) %59, i64 14336
  %61 = getelementptr bfloat, ptr addrspace(1) %53, i64 %58
  %62 = getelementptr i8, ptr addrspace(1) %61, i64 1024
  %63 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %60) #11
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
  %80 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %62) #11
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
  %97 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #11
  %98 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %73) #11
  %99 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %74) #11
  %100 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %75) #11
  %101 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %76) #11
  %102 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %77) #11
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #11
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #11
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #11
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %90) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %91) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %92) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %93) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %94) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #11
  %.idx = shl i64 %3, 11
  %113 = getelementptr i8, ptr addrspace(1) %arg13, i64 %.idx
  %114 = getelementptr bfloat, ptr addrspace(1) %113, i64 %58
  %115 = getelementptr i8, ptr addrspace(1) %114, i64 1024
  %116 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %114) #11
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
  %133 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %115) #11
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
  %150 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %125) #11
  %151 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #11
  %152 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #11
  %153 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #11
  %154 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #11
  %155 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #11
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #11
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #11
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #11
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #11
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %144) #11
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %147) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %235, <1 x i32> %236, i1 %233) #11
  tail call void @llvm.nvvm.barrier0()
  %237 = icmp samesign ult i32 %9, 2
  %238 = zext nneg i32 %9 to i64
  %239 = getelementptr float, ptr addrspace(3) @global_smem, i64 %238
  %240 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %239, i1 %237) #11
  %241 = bitcast i32 %240 to float
  %242 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %240, i32 1, i32 31)
  %243 = bitcast i32 %242 to float
  %244 = fadd float %241, %243
  %245 = icmp eq i32 %9, 0
  %246 = bitcast float %244 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %239, <1 x i32> %246, i1 %245) #11
  tail call void @llvm.nvvm.barrier0()
  %247 = load float, ptr addrspace(3) @global_smem, align 16
  %248 = fmul float %247, 0x3F50000000000000
  %249 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
  %250 = bitcast i32 %249 to float
  %251 = fadd float %248, %250
  %252 = tail call float @llvm.nvvm.rsqrt.approx.f(float %251)
  %253 = fmul float %48, %252
  %254 = fmul float %49, %252
  %255 = fmul float %50, %252
  %256 = fmul float %51, %252
  %257 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %5
  %258 = getelementptr bfloat, ptr addrspace(1) %257, i64 %17
  %259 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %258) #11
  %260 = extractvalue { i32, i32 } %259, 0
  %261 = bitcast i32 %260 to <2 x bfloat>
  %262 = extractvalue { i32, i32 } %259, 1
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractelement <2 x bfloat> %261, i64 0
  %265 = extractelement <2 x bfloat> %261, i64 1
  %266 = extractelement <2 x bfloat> %263, i64 0
  %267 = extractelement <2 x bfloat> %263, i64 1
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #11
  %272 = fmul float %253, %268
  %273 = fmul float %254, %269
  %274 = fmul float %255, %270
  %275 = fmul float %256, %271
  %276 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %272) #11
  %277 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %273) #11
  %278 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %274) #11
  %279 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %275) #11
  %280 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %281 = getelementptr bfloat, ptr addrspace(1) %280, i64 %17
  %282 = insertelement <2 x bfloat> poison, bfloat %276, i64 0
  %283 = insertelement <2 x bfloat> %282, bfloat %277, i64 1
  %284 = bitcast <2 x bfloat> %283 to i32
  %285 = insertelement <2 x bfloat> poison, bfloat %278, i64 0
  %286 = insertelement <2 x bfloat> %285, bfloat %279, i64 1
  %287 = bitcast <2 x bfloat> %286 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %284, i32 %287, ptr addrspace(1) %281) #11
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion_7(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
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
  %21 = tail call float @llvm.nvvm.ex2.approx.f(float %20) #11
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

define ptx_kernel void @fusion_114(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 2
  %4 = shl nsw i64 %2, 8
  %5 = and i64 %4, 768
  %6 = shl i64 %3, 13
  %7 = or disjoint i64 %5, %6
  %8 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %7
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
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 12288
  %20 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %19) #11
  %21 = extractvalue { i32, i32 } %20, 0
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractvalue { i32, i32 } %20, 1
  %24 = bitcast i32 %23 to <2 x bfloat>
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = extractelement <2 x bfloat> %24, i64 0
  %28 = extractelement <2 x bfloat> %24, i64 1
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #11
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #11
  %31 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %32 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %33 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %4
  %34 = getelementptr bfloat, ptr addrspace(1) %33, i64 %17
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %34) #11
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = bitcast i32 %36 to <2 x bfloat>
  %38 = extractvalue { i32, i32 } %35, 1
  %39 = bitcast i32 %38 to <2 x bfloat>
  %40 = extractelement <2 x bfloat> %37, i64 0
  %41 = extractelement <2 x bfloat> %37, i64 1
  %42 = extractelement <2 x bfloat> %39, i64 0
  %43 = extractelement <2 x bfloat> %39, i64 1
  %44 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %40) #11
  %45 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #11
  %46 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #11
  %47 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #11
  %48 = getelementptr i8, ptr addrspace(1) %18, i64 14336
  %49 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %48) #11
  %50 = extractvalue { i32, i32 } %49, 0
  %51 = bitcast i32 %50 to <2 x bfloat>
  %52 = extractvalue { i32, i32 } %49, 1
  %53 = bitcast i32 %52 to <2 x bfloat>
  %54 = extractelement <2 x bfloat> %51, i64 0
  %55 = extractelement <2 x bfloat> %51, i64 1
  %56 = extractelement <2 x bfloat> %53, i64 0
  %57 = extractelement <2 x bfloat> %53, i64 1
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %54) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %55) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %56) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %57) #11
  %62 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %63 = getelementptr bfloat, ptr addrspace(1) %62, i64 %17
  %64 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %63) #11
  %65 = extractvalue { i32, i32 } %64, 0
  %66 = bitcast i32 %65 to <2 x bfloat>
  %67 = extractvalue { i32, i32 } %64, 1
  %68 = bitcast i32 %67 to <2 x bfloat>
  %69 = extractelement <2 x bfloat> %66, i64 0
  %70 = extractelement <2 x bfloat> %66, i64 1
  %71 = extractelement <2 x bfloat> %68, i64 0
  %72 = extractelement <2 x bfloat> %68, i64 1
  %73 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %69) #11
  %74 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %70) #11
  %75 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %71) #11
  %76 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %72) #11
  %77 = fadd float %58, %73
  %78 = fadd float %59, %74
  %79 = fadd float %60, %75
  %80 = fadd float %61, %76
  %81 = fadd float %44, %77
  %82 = fadd float %45, %78
  %83 = fadd float %46, %79
  %84 = fadd float %47, %80
  %85 = fadd float %29, %81
  %86 = fadd float %30, %82
  %87 = fadd float %31, %83
  %88 = fadd float %32, %84
  %89 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %6
  %90 = getelementptr i8, ptr addrspace(1) %89, i64 12288
  %91 = shl nuw nsw i32 %9, 3
  %92 = and i32 %91, 248
  %93 = select i1 %14, i32 0, i32 256
  %94 = or disjoint i32 %92, %93
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr bfloat, ptr addrspace(1) %89, i64 %95
  %97 = getelementptr i8, ptr addrspace(1) %96, i64 12288
  %98 = getelementptr bfloat, ptr addrspace(1) %90, i64 %95
  %99 = getelementptr i8, ptr addrspace(1) %98, i64 1024
  %100 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %97) #11
  %101 = extractvalue { i32, i32, i32, i32 } %100, 0
  %102 = bitcast i32 %101 to <2 x bfloat>
  %103 = extractvalue { i32, i32, i32, i32 } %100, 1
  %104 = bitcast i32 %103 to <2 x bfloat>
  %105 = extractvalue { i32, i32, i32, i32 } %100, 2
  %106 = bitcast i32 %105 to <2 x bfloat>
  %107 = extractvalue { i32, i32, i32, i32 } %100, 3
  %108 = bitcast i32 %107 to <2 x bfloat>
  %109 = extractelement <2 x bfloat> %102, i64 0
  %110 = extractelement <2 x bfloat> %102, i64 1
  %111 = extractelement <2 x bfloat> %104, i64 0
  %112 = extractelement <2 x bfloat> %104, i64 1
  %113 = extractelement <2 x bfloat> %106, i64 0
  %114 = extractelement <2 x bfloat> %106, i64 1
  %115 = extractelement <2 x bfloat> %108, i64 0
  %116 = extractelement <2 x bfloat> %108, i64 1
  %117 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %99) #11
  %118 = extractvalue { i32, i32, i32, i32 } %117, 0
  %119 = bitcast i32 %118 to <2 x bfloat>
  %120 = extractvalue { i32, i32, i32, i32 } %117, 1
  %121 = bitcast i32 %120 to <2 x bfloat>
  %122 = extractvalue { i32, i32, i32, i32 } %117, 2
  %123 = bitcast i32 %122 to <2 x bfloat>
  %124 = extractvalue { i32, i32, i32, i32 } %117, 3
  %125 = bitcast i32 %124 to <2 x bfloat>
  %126 = extractelement <2 x bfloat> %119, i64 0
  %127 = extractelement <2 x bfloat> %119, i64 1
  %128 = extractelement <2 x bfloat> %121, i64 0
  %129 = extractelement <2 x bfloat> %121, i64 1
  %130 = extractelement <2 x bfloat> %123, i64 0
  %131 = extractelement <2 x bfloat> %123, i64 1
  %132 = extractelement <2 x bfloat> %125, i64 0
  %133 = extractelement <2 x bfloat> %125, i64 1
  %134 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %109) #11
  %135 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %110) #11
  %136 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %111) #11
  %137 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %112) #11
  %138 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %113) #11
  %139 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %114) #11
  %140 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %115) #11
  %141 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %116) #11
  %142 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %126) #11
  %143 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %127) #11
  %144 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %128) #11
  %145 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %129) #11
  %146 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %130) #11
  %147 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #11
  %148 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #11
  %149 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #11
  %150 = shl i64 %3, 10
  %151 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %150
  %152 = getelementptr bfloat, ptr addrspace(1) %151, i64 %95
  %153 = getelementptr i8, ptr addrspace(1) %152, i64 1024
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %152) #11
  %155 = extractvalue { i32, i32, i32, i32 } %154, 0
  %156 = bitcast i32 %155 to <2 x bfloat>
  %157 = extractvalue { i32, i32, i32, i32 } %154, 1
  %158 = bitcast i32 %157 to <2 x bfloat>
  %159 = extractvalue { i32, i32, i32, i32 } %154, 2
  %160 = bitcast i32 %159 to <2 x bfloat>
  %161 = extractvalue { i32, i32, i32, i32 } %154, 3
  %162 = bitcast i32 %161 to <2 x bfloat>
  %163 = extractelement <2 x bfloat> %156, i64 0
  %164 = extractelement <2 x bfloat> %156, i64 1
  %165 = extractelement <2 x bfloat> %158, i64 0
  %166 = extractelement <2 x bfloat> %158, i64 1
  %167 = extractelement <2 x bfloat> %160, i64 0
  %168 = extractelement <2 x bfloat> %160, i64 1
  %169 = extractelement <2 x bfloat> %162, i64 0
  %170 = extractelement <2 x bfloat> %162, i64 1
  %171 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %153) #11
  %172 = extractvalue { i32, i32, i32, i32 } %171, 0
  %173 = bitcast i32 %172 to <2 x bfloat>
  %174 = extractvalue { i32, i32, i32, i32 } %171, 1
  %175 = bitcast i32 %174 to <2 x bfloat>
  %176 = extractvalue { i32, i32, i32, i32 } %171, 2
  %177 = bitcast i32 %176 to <2 x bfloat>
  %178 = extractvalue { i32, i32, i32, i32 } %171, 3
  %179 = bitcast i32 %178 to <2 x bfloat>
  %180 = extractelement <2 x bfloat> %173, i64 0
  %181 = extractelement <2 x bfloat> %173, i64 1
  %182 = extractelement <2 x bfloat> %175, i64 0
  %183 = extractelement <2 x bfloat> %175, i64 1
  %184 = extractelement <2 x bfloat> %177, i64 0
  %185 = extractelement <2 x bfloat> %177, i64 1
  %186 = extractelement <2 x bfloat> %179, i64 0
  %187 = extractelement <2 x bfloat> %179, i64 1
  %188 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %163) #11
  %189 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %164) #11
  %190 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %165) #11
  %191 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %166) #11
  %192 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %167) #11
  %193 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %168) #11
  %194 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %169) #11
  %195 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %170) #11
  %196 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %180) #11
  %197 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %181) #11
  %198 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %182) #11
  %199 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %183) #11
  %200 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %184) #11
  %201 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #11
  %202 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #11
  %203 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #11
  %204 = getelementptr i8, ptr addrspace(1) %89, i64 14336
  %205 = getelementptr i8, ptr addrspace(1) %96, i64 14336
  %206 = getelementptr bfloat, ptr addrspace(1) %204, i64 %95
  %207 = getelementptr i8, ptr addrspace(1) %206, i64 1024
  %208 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %205) #11
  %209 = extractvalue { i32, i32, i32, i32 } %208, 0
  %210 = bitcast i32 %209 to <2 x bfloat>
  %211 = extractvalue { i32, i32, i32, i32 } %208, 1
  %212 = bitcast i32 %211 to <2 x bfloat>
  %213 = extractvalue { i32, i32, i32, i32 } %208, 2
  %214 = bitcast i32 %213 to <2 x bfloat>
  %215 = extractvalue { i32, i32, i32, i32 } %208, 3
  %216 = bitcast i32 %215 to <2 x bfloat>
  %217 = extractelement <2 x bfloat> %210, i64 0
  %218 = extractelement <2 x bfloat> %210, i64 1
  %219 = extractelement <2 x bfloat> %212, i64 0
  %220 = extractelement <2 x bfloat> %212, i64 1
  %221 = extractelement <2 x bfloat> %214, i64 0
  %222 = extractelement <2 x bfloat> %214, i64 1
  %223 = extractelement <2 x bfloat> %216, i64 0
  %224 = extractelement <2 x bfloat> %216, i64 1
  %225 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %207) #11
  %226 = extractvalue { i32, i32, i32, i32 } %225, 0
  %227 = bitcast i32 %226 to <2 x bfloat>
  %228 = extractvalue { i32, i32, i32, i32 } %225, 1
  %229 = bitcast i32 %228 to <2 x bfloat>
  %230 = extractvalue { i32, i32, i32, i32 } %225, 2
  %231 = bitcast i32 %230 to <2 x bfloat>
  %232 = extractvalue { i32, i32, i32, i32 } %225, 3
  %233 = bitcast i32 %232 to <2 x bfloat>
  %234 = extractelement <2 x bfloat> %227, i64 0
  %235 = extractelement <2 x bfloat> %227, i64 1
  %236 = extractelement <2 x bfloat> %229, i64 0
  %237 = extractelement <2 x bfloat> %229, i64 1
  %238 = extractelement <2 x bfloat> %231, i64 0
  %239 = extractelement <2 x bfloat> %231, i64 1
  %240 = extractelement <2 x bfloat> %233, i64 0
  %241 = extractelement <2 x bfloat> %233, i64 1
  %242 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %217) #11
  %243 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %218) #11
  %244 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %219) #11
  %245 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %220) #11
  %246 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %221) #11
  %247 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %222) #11
  %248 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %223) #11
  %249 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %224) #11
  %250 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %234) #11
  %251 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %235) #11
  %252 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %236) #11
  %253 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %237) #11
  %254 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #11
  %255 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #11
  %256 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #11
  %257 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #11
  %258 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %150
  %259 = getelementptr bfloat, ptr addrspace(1) %258, i64 %95
  %260 = getelementptr i8, ptr addrspace(1) %259, i64 1024
  %261 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %259) #11
  %262 = extractvalue { i32, i32, i32, i32 } %261, 0
  %263 = bitcast i32 %262 to <2 x bfloat>
  %264 = extractvalue { i32, i32, i32, i32 } %261, 1
  %265 = bitcast i32 %264 to <2 x bfloat>
  %266 = extractvalue { i32, i32, i32, i32 } %261, 2
  %267 = bitcast i32 %266 to <2 x bfloat>
  %268 = extractvalue { i32, i32, i32, i32 } %261, 3
  %269 = bitcast i32 %268 to <2 x bfloat>
  %270 = extractelement <2 x bfloat> %263, i64 0
  %271 = extractelement <2 x bfloat> %263, i64 1
  %272 = extractelement <2 x bfloat> %265, i64 0
  %273 = extractelement <2 x bfloat> %265, i64 1
  %274 = extractelement <2 x bfloat> %267, i64 0
  %275 = extractelement <2 x bfloat> %267, i64 1
  %276 = extractelement <2 x bfloat> %269, i64 0
  %277 = extractelement <2 x bfloat> %269, i64 1
  %278 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %260) #11
  %279 = extractvalue { i32, i32, i32, i32 } %278, 0
  %280 = bitcast i32 %279 to <2 x bfloat>
  %281 = extractvalue { i32, i32, i32, i32 } %278, 1
  %282 = bitcast i32 %281 to <2 x bfloat>
  %283 = extractvalue { i32, i32, i32, i32 } %278, 2
  %284 = bitcast i32 %283 to <2 x bfloat>
  %285 = extractvalue { i32, i32, i32, i32 } %278, 3
  %286 = bitcast i32 %285 to <2 x bfloat>
  %287 = extractelement <2 x bfloat> %280, i64 0
  %288 = extractelement <2 x bfloat> %280, i64 1
  %289 = extractelement <2 x bfloat> %282, i64 0
  %290 = extractelement <2 x bfloat> %282, i64 1
  %291 = extractelement <2 x bfloat> %284, i64 0
  %292 = extractelement <2 x bfloat> %284, i64 1
  %293 = extractelement <2 x bfloat> %286, i64 0
  %294 = extractelement <2 x bfloat> %286, i64 1
  %295 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %270) #11
  %296 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %271) #11
  %297 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %272) #11
  %298 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %273) #11
  %299 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %274) #11
  %300 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %275) #11
  %301 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %276) #11
  %302 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %277) #11
  %303 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %287) #11
  %304 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %288) #11
  %305 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %289) #11
  %306 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %290) #11
  %307 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %291) #11
  %308 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %292) #11
  %309 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #11
  %310 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #11
  %311 = fadd float %242, %295
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
  %327 = fadd float %188, %311
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
  %343 = fadd float %134, %327
  %344 = fadd float %135, %328
  %345 = fadd float %136, %329
  %346 = fadd float %137, %330
  %347 = fadd float %138, %331
  %348 = fadd float %139, %332
  %349 = fadd float %140, %333
  %350 = fadd float %141, %334
  %351 = fadd float %142, %335
  %352 = fadd float %143, %336
  %353 = fadd float %144, %337
  %354 = fadd float %145, %338
  %355 = fadd float %146, %339
  %356 = fadd float %147, %340
  %357 = fadd float %148, %341
  %358 = fadd float %149, %342
  %359 = fmul float %343, %343
  %360 = fmul float %344, %344
  %361 = fmul float %345, %345
  %362 = fmul float %346, %346
  %363 = fmul float %347, %347
  %364 = fmul float %348, %348
  %365 = fmul float %349, %349
  %366 = fmul float %350, %350
  %367 = fmul float %351, %351
  %368 = fmul float %352, %352
  %369 = fmul float %353, %353
  %370 = fmul float %354, %354
  %371 = fmul float %355, %355
  %372 = fmul float %356, %356
  %373 = fmul float %357, %357
  %374 = fmul float %358, %358
  %375 = fadd float %359, %360
  %376 = fadd float %375, %361
  %377 = fadd float %376, %362
  %378 = fadd float %377, %363
  %379 = fadd float %378, %364
  %380 = fadd float %379, %365
  %381 = fadd float %380, %366
  %382 = fadd float %381, %367
  %383 = fadd float %382, %368
  %384 = fadd float %383, %369
  %385 = fadd float %384, %370
  %386 = fadd float %385, %371
  %387 = fadd float %386, %372
  %388 = fadd float %387, %373
  %389 = fadd float %388, %374
  %390 = bitcast float %389 to i32
  %391 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %390, i32 16, i32 31)
  %392 = bitcast i32 %391 to float
  %393 = fadd float %389, %392
  %394 = bitcast float %393 to i32
  %395 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %394, i32 8, i32 31)
  %396 = bitcast i32 %395 to float
  %397 = fadd float %393, %396
  %398 = bitcast float %397 to i32
  %399 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %398, i32 4, i32 31)
  %400 = bitcast i32 %399 to float
  %401 = fadd float %397, %400
  %402 = bitcast float %401 to i32
  %403 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %402, i32 2, i32 31)
  %404 = bitcast i32 %403 to float
  %405 = fadd float %401, %404
  %406 = bitcast float %405 to i32
  %407 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %406, i32 1, i32 31)
  %408 = bitcast i32 %407 to float
  %409 = fadd float %405, %408
  %410 = icmp eq i32 %10, 0
  %411 = zext nneg i32 %11 to i64
  %412 = getelementptr float, ptr addrspace(3) @global_smem, i64 %411
  %413 = bitcast float %409 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %412, <1 x i32> %413, i1 %410) #11
  tail call void @llvm.nvvm.barrier0()
  %414 = icmp samesign ult i32 %9, 2
  %415 = zext nneg i32 %9 to i64
  %416 = getelementptr float, ptr addrspace(3) @global_smem, i64 %415
  %417 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %416, i1 %414) #11
  %418 = bitcast i32 %417 to float
  %419 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %417, i32 1, i32 31)
  %420 = bitcast i32 %419 to float
  %421 = fadd float %418, %420
  %422 = icmp eq i32 %9, 0
  %423 = bitcast float %421 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %416, <1 x i32> %423, i1 %422) #11
  tail call void @llvm.nvvm.barrier0()
  %424 = load float, ptr addrspace(3) @global_smem, align 16
  %425 = fmul float %424, 0x3F50000000000000
  %426 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
  %427 = bitcast i32 %426 to float
  %428 = fadd float %425, %427
  %429 = tail call float @llvm.nvvm.rsqrt.approx.f(float %428)
  %430 = fmul float %85, %429
  %431 = fmul float %86, %429
  %432 = fmul float %87, %429
  %433 = fmul float %88, %429
  %434 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %5
  %435 = getelementptr bfloat, ptr addrspace(1) %434, i64 %17
  %436 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %435) #11
  %437 = extractvalue { i32, i32 } %436, 0
  %438 = bitcast i32 %437 to <2 x bfloat>
  %439 = extractvalue { i32, i32 } %436, 1
  %440 = bitcast i32 %439 to <2 x bfloat>
  %441 = extractelement <2 x bfloat> %438, i64 0
  %442 = extractelement <2 x bfloat> %438, i64 1
  %443 = extractelement <2 x bfloat> %440, i64 0
  %444 = extractelement <2 x bfloat> %440, i64 1
  %445 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %441) #11
  %446 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %442) #11
  %447 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %443) #11
  %448 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %444) #11
  %449 = fmul float %430, %445
  %450 = fmul float %431, %446
  %451 = fmul float %432, %447
  %452 = fmul float %433, %448
  %453 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %449) #11
  %454 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %450) #11
  %455 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %451) #11
  %456 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %452) #11
  %457 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %4
  %458 = getelementptr bfloat, ptr addrspace(1) %457, i64 %17
  %459 = insertelement <2 x bfloat> poison, bfloat %453, i64 0
  %460 = insertelement <2 x bfloat> %459, bfloat %454, i64 1
  %461 = bitcast <2 x bfloat> %460 to i32
  %462 = insertelement <2 x bfloat> poison, bfloat %455, i64 0
  %463 = insertelement <2 x bfloat> %462, bfloat %456, i64 1
  %464 = bitcast <2 x bfloat> %463 to i32
  tail call void asm sideeffect "st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l"(i32 %461, i32 %464, ptr addrspace(1) %458) #11
  ret void
}

define ptx_kernel void @fusion_112(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
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
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #11
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #11
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #11
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #11
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #11
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #11
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #11
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #11
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #11
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #11
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 12288
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 12288
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #11
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #11
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
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #11
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #11
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #11
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #11
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #11
  %177 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #11
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
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #11
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
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #11
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #11
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #11
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #11
  %230 = getelementptr i8, ptr addrspace(1) %4, i64 14336
  %231 = getelementptr i8, ptr addrspace(1) %15, i64 14336
  %232 = getelementptr bfloat, ptr addrspace(1) %230, i64 %14
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 1024
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #11
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
  %251 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #11
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
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #11
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #11
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #11
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #11
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #11
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #11
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #11
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #11
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #11
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #11
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #11
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #11
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #11
  %284 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %69
  %285 = getelementptr bfloat, ptr addrspace(1) %284, i64 %14
  %286 = getelementptr i8, ptr addrspace(1) %285, i64 1024
  %287 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #11
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
  %304 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %286) #11
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
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #11
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #11
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #11
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #11
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #11
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #11
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #11
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #11
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #11
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #11
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #11
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #11
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #11
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #11
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #11
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %470, <1 x i32> %471, i1 %468) #11
  tail call void @llvm.nvvm.barrier0()
  %472 = icmp samesign ult i32 %6, 2
  %473 = zext nneg i32 %6 to i64
  %474 = getelementptr float, ptr addrspace(3) @global_smem, i64 %473
  %475 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %474, i1 %472) #11
  %476 = bitcast i32 %475 to float
  %477 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %475, i32 1, i32 31)
  %478 = bitcast i32 %477 to float
  %479 = fadd float %476, %478
  %480 = icmp eq i32 %6, 0
  %481 = bitcast float %479 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %474, <1 x i32> %481, i1 %480) #11
  tail call void @llvm.nvvm.barrier0()
  %482 = load float, ptr addrspace(3) @global_smem, align 16
  %483 = fmul float %482, 0x3F50000000000000
  %484 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %504 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %14
  %505 = getelementptr i8, ptr addrspace(1) %504, i64 1024
  %506 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %504) #11
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
  %523 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %505) #11
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
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #11
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #11
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #11
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #11
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #11
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #11
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #11
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #11
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #11
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #11
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #11
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #11
  %552 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %536) #11
  %553 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %537) #11
  %554 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %538) #11
  %555 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %539) #11
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
  %572 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %556) #11
  %573 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %557) #11
  %574 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %558) #11
  %575 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %559) #11
  %576 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %560) #11
  %577 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %561) #11
  %578 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %562) #11
  %579 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %563) #11
  %580 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %564) #11
  %581 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %565) #11
  %582 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %566) #11
  %583 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %567) #11
  %584 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %568) #11
  %585 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %569) #11
  %586 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %570) #11
  %587 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %571) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %593, i32 %596, i32 %599, i32 %602, ptr addrspace(1) %589) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %605, i32 %608, i32 %611, i32 %614, ptr addrspace(1) %590) #11
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(262144) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %15 = shl nuw nsw i32 %14, 7
  %16 = and i32 %15, 896
  %17 = or disjoint i32 %16, %13
  %18 = or disjoint i32 %15, %13
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %19
  %21 = load bfloat, ptr addrspace(1) %20, align 2, !invariant.load !5
  %22 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %19
  %23 = load bfloat, ptr addrspace(1) %22, align 2, !invariant.load !5
  %24 = shl nuw nsw i32 %14, 10
  %25 = and i32 %24, 122880
  %26 = or disjoint i32 %24, %17
  %27 = or i32 %26, 7168
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds bfloat, ptr addrspace(1) %12, i64 %28
  %30 = load bfloat, ptr addrspace(1) %29, align 2, !invariant.load !5, !alias.scope !14
  %31 = fpext bfloat %30 to float
  %32 = fpext bfloat %21 to float
  %33 = fpext bfloat %23 to float
  %34 = fadd float %32, %31
  %35 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %19
  %36 = load bfloat, ptr addrspace(1) %35, align 2, !invariant.load !5
  %37 = or disjoint i32 %17, %25
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr bfloat, ptr addrspace(1) %12, i64 %38
  %40 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 12288
  %41 = load bfloat, ptr addrspace(1) %40, align 2, !invariant.load !5, !alias.scope !17
  %42 = fpext bfloat %41 to float
  %43 = fadd float %34, %33
  %44 = fpext bfloat %36 to float
  %45 = fadd float %43, %42
  %46 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %19
  %47 = load bfloat, ptr addrspace(1) %46, align 2, !invariant.load !5
  %48 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 10240
  %49 = load bfloat, ptr addrspace(1) %48, align 2, !invariant.load !5, !alias.scope !20
  %50 = fpext bfloat %49 to float
  %51 = fadd float %45, %44
  %52 = fpext bfloat %47 to float
  %53 = fadd float %51, %50
  %54 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 8192
  %55 = load bfloat, ptr addrspace(1) %54, align 2, !invariant.load !5, !alias.scope !23
  %56 = fpext bfloat %55 to float
  %57 = fadd float %53, %52
  %58 = fadd float %57, %56
  %59 = getelementptr inbounds float, ptr addrspace(1) %7, i64 %19
  store float %58, ptr addrspace(1) %59, align 4
  ret void
}

define ptx_kernel void @fusion_110(ptr noalias align 128 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) local_unnamed_addr #6 {
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
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
  %16 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %15) #11
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
  %32 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %28) #11
  %33 = extractvalue { i32, i32, i32, i32 } %32, 0
  %34 = extractvalue { i32, i32, i32, i32 } %32, 1
  %35 = extractvalue { i32, i32, i32, i32 } %32, 2
  %36 = extractvalue { i32, i32, i32, i32 } %32, 3
  %37 = bitcast i32 %33 to float
  %38 = bitcast i32 %34 to float
  %39 = bitcast i32 %35 to float
  %40 = bitcast i32 %36 to float
  %41 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %29) #11
  %42 = extractvalue { i32, i32, i32, i32 } %41, 0
  %43 = extractvalue { i32, i32, i32, i32 } %41, 1
  %44 = extractvalue { i32, i32, i32, i32 } %41, 2
  %45 = extractvalue { i32, i32, i32, i32 } %41, 3
  %46 = bitcast i32 %42 to float
  %47 = bitcast i32 %43 to float
  %48 = bitcast i32 %44 to float
  %49 = bitcast i32 %45 to float
  %50 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %30) #11
  %51 = extractvalue { i32, i32, i32, i32 } %50, 0
  %52 = extractvalue { i32, i32, i32, i32 } %50, 1
  %53 = extractvalue { i32, i32, i32, i32 } %50, 2
  %54 = extractvalue { i32, i32, i32, i32 } %50, 3
  %55 = bitcast i32 %51 to float
  %56 = bitcast i32 %52 to float
  %57 = bitcast i32 %53 to float
  %58 = bitcast i32 %54 to float
  %59 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %31) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %121, <1 x i32> %122, i1 %119) #11
  tail call void @llvm.nvvm.barrier0()
  %123 = icmp samesign ult i32 %6, 2
  %124 = zext nneg i32 %6 to i64
  %125 = getelementptr float, ptr addrspace(3) @global_smem, i64 %124
  %126 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %125, i1 %123) #11
  %127 = bitcast i32 %126 to float
  %128 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %126, i32 1, i32 31)
  %129 = bitcast i32 %128 to float
  %130 = fadd float %127, %129
  %131 = icmp eq i32 %6, 0
  %132 = bitcast float %130 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %125, <1 x i32> %132, i1 %131) #11
  tail call void @llvm.nvvm.barrier0()
  %133 = load float, ptr addrspace(3) @global_smem, align 16
  %134 = fmul float %133, 0x3F50000000000000
  %135 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg13) #11
  %136 = bitcast i32 %135 to float
  %137 = fadd float %134, %136
  %138 = tail call float @llvm.nvvm.rsqrt.approx.f(float %137)
  %139 = fmul float %138, %19
  %140 = fmul float %138, %20
  %141 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %4
  %142 = getelementptr bfloat, ptr addrspace(1) %141, i64 %14
  %143 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %142) #11
  %144 = bitcast i32 %143 to <2 x bfloat>
  %145 = extractelement <2 x bfloat> %144, i64 0
  %146 = extractelement <2 x bfloat> %144, i64 1
  %147 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %145) #11
  %148 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %146) #11
  %149 = fmul float %139, %147
  %150 = fmul float %140, %148
  %151 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %149) #11
  %152 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %150) #11
  %153 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %154 = getelementptr bfloat, ptr addrspace(1) %153, i64 %14
  %155 = insertelement <2 x bfloat> poison, bfloat %151, i64 0
  %156 = insertelement <2 x bfloat> %155, bfloat %152, i64 1
  %157 = bitcast <2 x bfloat> %156 to i32
  tail call void asm sideeffect "st.global.b32 [ $1 + 0 ], { $0 };", "r,l"(i32 %157, ptr addrspace(1) %154) #11
  ret void
}

define ptx_kernel void @fusion_108(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
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
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #11
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #11
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #11
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #11
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #11
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #11
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #11
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #11
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #11
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #11
  %123 = getelementptr float, ptr addrspace(1) %arg25, i64 %69
  %124 = getelementptr float, ptr addrspace(1) %123, i64 %14
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 16
  %126 = getelementptr i8, ptr addrspace(1) %124, i64 2048
  %127 = getelementptr i8, ptr addrspace(1) %124, i64 2064
  %128 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #11
  %129 = extractvalue { i32, i32, i32, i32 } %128, 0
  %130 = extractvalue { i32, i32, i32, i32 } %128, 1
  %131 = extractvalue { i32, i32, i32, i32 } %128, 2
  %132 = extractvalue { i32, i32, i32, i32 } %128, 3
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = bitcast i32 %132 to float
  %137 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #11
  %138 = extractvalue { i32, i32, i32, i32 } %137, 0
  %139 = extractvalue { i32, i32, i32, i32 } %137, 1
  %140 = extractvalue { i32, i32, i32, i32 } %137, 2
  %141 = extractvalue { i32, i32, i32, i32 } %137, 3
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = bitcast i32 %141 to float
  %146 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #11
  %147 = extractvalue { i32, i32, i32, i32 } %146, 0
  %148 = extractvalue { i32, i32, i32, i32 } %146, 1
  %149 = extractvalue { i32, i32, i32, i32 } %146, 2
  %150 = extractvalue { i32, i32, i32, i32 } %146, 3
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = bitcast i32 %150 to float
  %155 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %127) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %249, <1 x i32> %250, i1 %247) #11
  tail call void @llvm.nvvm.barrier0()
  %251 = icmp samesign ult i32 %6, 2
  %252 = zext nneg i32 %6 to i64
  %253 = getelementptr float, ptr addrspace(3) @global_smem, i64 %252
  %254 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %253, i1 %251) #11
  %255 = bitcast i32 %254 to float
  %256 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %254, i32 1, i32 31)
  %257 = bitcast i32 %256 to float
  %258 = fadd float %255, %257
  %259 = icmp eq i32 %6, 0
  %260 = bitcast float %258 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %253, <1 x i32> %260, i1 %259) #11
  tail call void @llvm.nvvm.barrier0()
  %261 = load float, ptr addrspace(3) @global_smem, align 16
  %262 = fmul float %261, 0x3F50000000000000
  %263 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %285 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #11
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
  %302 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #11
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
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #11
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #11
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #11
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #11
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #11
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #11
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #11
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #11
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #11
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #11
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #11
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #11
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #11
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #11
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #11
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #11
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
  %351 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %335) #11
  %352 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %336) #11
  %353 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %337) #11
  %354 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %338) #11
  %355 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %339) #11
  %356 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %340) #11
  %357 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %341) #11
  %358 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %342) #11
  %359 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %343) #11
  %360 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %344) #11
  %361 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %345) #11
  %362 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %346) #11
  %363 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %347) #11
  %364 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %348) #11
  %365 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %349) #11
  %366 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %350) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %372, i32 %375, i32 %378, i32 %381, ptr addrspace(1) %368) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %384, i32 %387, i32 %390, i32 %393, ptr addrspace(1) %369) #11
  ret void
}

define ptx_kernel void @fusion_106(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
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
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #11
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #11
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #11
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #11
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #11
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #11
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #11
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #11
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #11
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #11
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #11
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #11
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
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #11
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #11
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #11
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #11
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #11
  %177 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #11
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
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #11
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
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #11
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #11
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #11
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #11
  %230 = getelementptr float, ptr addrspace(1) %arg25, i64 %69
  %231 = getelementptr float, ptr addrspace(1) %230, i64 %14
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 16
  %233 = getelementptr i8, ptr addrspace(1) %231, i64 2048
  %234 = getelementptr i8, ptr addrspace(1) %231, i64 2064
  %235 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #11
  %236 = extractvalue { i32, i32, i32, i32 } %235, 0
  %237 = extractvalue { i32, i32, i32, i32 } %235, 1
  %238 = extractvalue { i32, i32, i32, i32 } %235, 2
  %239 = extractvalue { i32, i32, i32, i32 } %235, 3
  %240 = bitcast i32 %236 to float
  %241 = bitcast i32 %237 to float
  %242 = bitcast i32 %238 to float
  %243 = bitcast i32 %239 to float
  %244 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #11
  %245 = extractvalue { i32, i32, i32, i32 } %244, 0
  %246 = extractvalue { i32, i32, i32, i32 } %244, 1
  %247 = extractvalue { i32, i32, i32, i32 } %244, 2
  %248 = extractvalue { i32, i32, i32, i32 } %244, 3
  %249 = bitcast i32 %245 to float
  %250 = bitcast i32 %246 to float
  %251 = bitcast i32 %247 to float
  %252 = bitcast i32 %248 to float
  %253 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #11
  %254 = extractvalue { i32, i32, i32, i32 } %253, 0
  %255 = extractvalue { i32, i32, i32, i32 } %253, 1
  %256 = extractvalue { i32, i32, i32, i32 } %253, 2
  %257 = extractvalue { i32, i32, i32, i32 } %253, 3
  %258 = bitcast i32 %254 to float
  %259 = bitcast i32 %255 to float
  %260 = bitcast i32 %256 to float
  %261 = bitcast i32 %257 to float
  %262 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %234) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %388, <1 x i32> %389, i1 %386) #11
  tail call void @llvm.nvvm.barrier0()
  %390 = icmp samesign ult i32 %6, 2
  %391 = zext nneg i32 %6 to i64
  %392 = getelementptr float, ptr addrspace(3) @global_smem, i64 %391
  %393 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %392, i1 %390) #11
  %394 = bitcast i32 %393 to float
  %395 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %393, i32 1, i32 31)
  %396 = bitcast i32 %395 to float
  %397 = fadd float %394, %396
  %398 = icmp eq i32 %6, 0
  %399 = bitcast float %397 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %392, <1 x i32> %399, i1 %398) #11
  tail call void @llvm.nvvm.barrier0()
  %400 = load float, ptr addrspace(3) @global_smem, align 16
  %401 = fmul float %400, 0x3F50000000000000
  %402 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %424 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %422) #11
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
  %441 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %423) #11
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
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #11
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #11
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #11
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #11
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %437) #11
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %438) #11
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %439) #11
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %440) #11
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #11
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #11
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #11
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #11
  %470 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #11
  %471 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #11
  %472 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #11
  %473 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #11
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
  %490 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %474) #11
  %491 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %475) #11
  %492 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %476) #11
  %493 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %477) #11
  %494 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %478) #11
  %495 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %479) #11
  %496 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %480) #11
  %497 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %481) #11
  %498 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %482) #11
  %499 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %483) #11
  %500 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %484) #11
  %501 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %485) #11
  %502 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %486) #11
  %503 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %487) #11
  %504 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %488) #11
  %505 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %489) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %511, i32 %514, i32 %517, i32 %520, ptr addrspace(1) %507) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %523, i32 %526, i32 %529, i32 %532, ptr addrspace(1) %508) #11
  ret void
}

define ptx_kernel void @fusion_104(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 13
  %4 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
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
  %19 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %16) #11
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
  %36 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %18) #11
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
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %35) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #11
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #11
  %68 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %52) #11
  %69 = shl nsw i64 %2, 10
  %70 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %69
  %71 = getelementptr bfloat, ptr addrspace(1) %70, i64 %14
  %72 = getelementptr i8, ptr addrspace(1) %71, i64 1024
  %73 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #11
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
  %90 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %72) #11
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
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %89) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #11
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #11
  %122 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %106) #11
  %123 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %124 = getelementptr i8, ptr addrspace(1) %15, i64 4096
  %125 = getelementptr bfloat, ptr addrspace(1) %123, i64 %14
  %126 = getelementptr i8, ptr addrspace(1) %125, i64 1024
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #11
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
  %144 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #11
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
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %143) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #11
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #11
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #11
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #11
  %176 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %160) #11
  %177 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %69
  %178 = getelementptr bfloat, ptr addrspace(1) %177, i64 %14
  %179 = getelementptr i8, ptr addrspace(1) %178, i64 1024
  %180 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #11
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
  %197 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %179) #11
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
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %196) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #11
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #11
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #11
  %229 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %213) #11
  %230 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %231 = getelementptr i8, ptr addrspace(1) %15, i64 6144
  %232 = getelementptr bfloat, ptr addrspace(1) %230, i64 %14
  %233 = getelementptr i8, ptr addrspace(1) %232, i64 1024
  %234 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %231) #11
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
  %251 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %233) #11
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
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #11
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #11
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #11
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #11
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %250) #11
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #11
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #11
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #11
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #11
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #11
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #11
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #11
  %283 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %267) #11
  %284 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %69
  %285 = getelementptr bfloat, ptr addrspace(1) %284, i64 %14
  %286 = getelementptr i8, ptr addrspace(1) %285, i64 1024
  %287 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #11
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
  %304 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %286) #11
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
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #11
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #11
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #11
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #11
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #11
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #11
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #11
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %303) #11
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #11
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #11
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #11
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #11
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #11
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #11
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #11
  %336 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %320) #11
  %337 = getelementptr float, ptr addrspace(1) %arg49, i64 %69
  %338 = getelementptr float, ptr addrspace(1) %337, i64 %14
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 16
  %340 = getelementptr i8, ptr addrspace(1) %338, i64 2048
  %341 = getelementptr i8, ptr addrspace(1) %338, i64 2064
  %342 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %338) #11
  %343 = extractvalue { i32, i32, i32, i32 } %342, 0
  %344 = extractvalue { i32, i32, i32, i32 } %342, 1
  %345 = extractvalue { i32, i32, i32, i32 } %342, 2
  %346 = extractvalue { i32, i32, i32, i32 } %342, 3
  %347 = bitcast i32 %343 to float
  %348 = bitcast i32 %344 to float
  %349 = bitcast i32 %345 to float
  %350 = bitcast i32 %346 to float
  %351 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #11
  %352 = extractvalue { i32, i32, i32, i32 } %351, 0
  %353 = extractvalue { i32, i32, i32, i32 } %351, 1
  %354 = extractvalue { i32, i32, i32, i32 } %351, 2
  %355 = extractvalue { i32, i32, i32, i32 } %351, 3
  %356 = bitcast i32 %352 to float
  %357 = bitcast i32 %353 to float
  %358 = bitcast i32 %354 to float
  %359 = bitcast i32 %355 to float
  %360 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %340) #11
  %361 = extractvalue { i32, i32, i32, i32 } %360, 0
  %362 = extractvalue { i32, i32, i32, i32 } %360, 1
  %363 = extractvalue { i32, i32, i32, i32 } %360, 2
  %364 = extractvalue { i32, i32, i32, i32 } %360, 3
  %365 = bitcast i32 %361 to float
  %366 = bitcast i32 %362 to float
  %367 = bitcast i32 %363 to float
  %368 = bitcast i32 %364 to float
  %369 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %341) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %527, <1 x i32> %528, i1 %525) #11
  tail call void @llvm.nvvm.barrier0()
  %529 = icmp samesign ult i32 %6, 2
  %530 = zext nneg i32 %6 to i64
  %531 = getelementptr float, ptr addrspace(3) @global_smem, i64 %530
  %532 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %531, i1 %529) #11
  %533 = bitcast i32 %532 to float
  %534 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %532, i32 1, i32 31)
  %535 = bitcast i32 %534 to float
  %536 = fadd float %533, %535
  %537 = icmp eq i32 %6, 0
  %538 = bitcast float %536 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %531, <1 x i32> %538, i1 %537) #11
  tail call void @llvm.nvvm.barrier0()
  %539 = load float, ptr addrspace(3) @global_smem, align 16
  %540 = fmul float %539, 0x3F50000000000000
  %541 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %563 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %561) #11
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
  %580 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %562) #11
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
  %597 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %572) #11
  %598 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %573) #11
  %599 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %574) #11
  %600 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %575) #11
  %601 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %576) #11
  %602 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %577) #11
  %603 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %578) #11
  %604 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %579) #11
  %605 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %589) #11
  %606 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %590) #11
  %607 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %591) #11
  %608 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %592) #11
  %609 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %593) #11
  %610 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %594) #11
  %611 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %595) #11
  %612 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %596) #11
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
  %629 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %613) #11
  %630 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %614) #11
  %631 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %615) #11
  %632 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %616) #11
  %633 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %617) #11
  %634 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %618) #11
  %635 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %619) #11
  %636 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %620) #11
  %637 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %621) #11
  %638 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %622) #11
  %639 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %623) #11
  %640 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %624) #11
  %641 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %625) #11
  %642 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %626) #11
  %643 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %627) #11
  %644 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %628) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %650, i32 %653, i32 %656, i32 %659, ptr addrspace(1) %646) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %662, i32 %665, i32 %668, i32 %671, ptr addrspace(1) %647) #11
  ret void
}

define ptx_kernel void @fusion_102(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8) local_unnamed_addr #6 {
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
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
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #11
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
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #11
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
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #11
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #11
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = shl nsw i64 %2, 10
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #11
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
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #11
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
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #11
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #11
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = getelementptr i8, ptr addrspace(1) %4, i64 2048
  %121 = getelementptr i8, ptr addrspace(1) %14, i64 2048
  %122 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 1024
  %124 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #11
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
  %141 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #11
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
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #11
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #11
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #11
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #11
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #11
  %174 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %66
  %175 = getelementptr bfloat, ptr addrspace(1) %174, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #11
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
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #11
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
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #11
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #11
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #11
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #11
  %227 = getelementptr i8, ptr addrspace(1) %4, i64 4096
  %228 = getelementptr i8, ptr addrspace(1) %14, i64 4096
  %229 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %230 = getelementptr i8, ptr addrspace(1) %229, i64 1024
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #11
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
  %248 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #11
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
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #11
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #11
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #11
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #11
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #11
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #11
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #11
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #11
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #11
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #11
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #11
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #11
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #11
  %281 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %66
  %282 = getelementptr bfloat, ptr addrspace(1) %281, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #11
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
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #11
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
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #11
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #11
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #11
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #11
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #11
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #11
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #11
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #11
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #11
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #11
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #11
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #11
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #11
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #11
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #11
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #11
  %334 = getelementptr i8, ptr addrspace(1) %4, i64 6144
  %335 = getelementptr i8, ptr addrspace(1) %14, i64 6144
  %336 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %337 = getelementptr i8, ptr addrspace(1) %336, i64 1024
  %338 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #11
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
  %355 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #11
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
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #11
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #11
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #11
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #11
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #11
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #11
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #11
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #11
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #11
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #11
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #11
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #11
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #11
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #11
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #11
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #11
  %388 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %66
  %389 = getelementptr bfloat, ptr addrspace(1) %388, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %389) #11
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
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #11
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
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #11
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #11
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #11
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #11
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #11
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #11
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #11
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #11
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #11
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #11
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #11
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #11
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #11
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #11
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #11
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #11
  %441 = getelementptr float, ptr addrspace(1) %arg511, i64 %66
  %442 = getelementptr float, ptr addrspace(1) %441, i64 %13
  %443 = getelementptr i8, ptr addrspace(1) %442, i64 16
  %444 = getelementptr i8, ptr addrspace(1) %442, i64 2048
  %445 = getelementptr i8, ptr addrspace(1) %442, i64 2064
  %446 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %442) #11
  %447 = extractvalue { i32, i32, i32, i32 } %446, 0
  %448 = extractvalue { i32, i32, i32, i32 } %446, 1
  %449 = extractvalue { i32, i32, i32, i32 } %446, 2
  %450 = extractvalue { i32, i32, i32, i32 } %446, 3
  %451 = bitcast i32 %447 to float
  %452 = bitcast i32 %448 to float
  %453 = bitcast i32 %449 to float
  %454 = bitcast i32 %450 to float
  %455 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %443) #11
  %456 = extractvalue { i32, i32, i32, i32 } %455, 0
  %457 = extractvalue { i32, i32, i32, i32 } %455, 1
  %458 = extractvalue { i32, i32, i32, i32 } %455, 2
  %459 = extractvalue { i32, i32, i32, i32 } %455, 3
  %460 = bitcast i32 %456 to float
  %461 = bitcast i32 %457 to float
  %462 = bitcast i32 %458 to float
  %463 = bitcast i32 %459 to float
  %464 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %444) #11
  %465 = extractvalue { i32, i32, i32, i32 } %464, 0
  %466 = extractvalue { i32, i32, i32, i32 } %464, 1
  %467 = extractvalue { i32, i32, i32, i32 } %464, 2
  %468 = extractvalue { i32, i32, i32, i32 } %464, 3
  %469 = bitcast i32 %465 to float
  %470 = bitcast i32 %466 to float
  %471 = bitcast i32 %467 to float
  %472 = bitcast i32 %468 to float
  %473 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %445) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %663, <1 x i32> %664, i1 %661) #11
  tail call void @llvm.nvvm.barrier0()
  %665 = icmp samesign ult i32 %5, 2
  %666 = zext nneg i32 %5 to i64
  %667 = getelementptr float, ptr addrspace(3) @global_smem, i64 %666
  %668 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %667, i1 %665) #11
  %669 = bitcast i32 %668 to float
  %670 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %668, i32 1, i32 31)
  %671 = bitcast i32 %670 to float
  %672 = fadd float %669, %671
  %673 = icmp eq i32 %5, 0
  %674 = bitcast float %672 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %667, <1 x i32> %674, i1 %673) #11
  tail call void @llvm.nvvm.barrier0()
  %675 = load float, ptr addrspace(3) @global_smem, align 16
  %676 = fmul float %675, 0x3F50000000000000
  %677 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %699 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %697) #11
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
  %716 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %698) #11
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
  %733 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %708) #11
  %734 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %709) #11
  %735 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %710) #11
  %736 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %711) #11
  %737 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %712) #11
  %738 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %713) #11
  %739 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %714) #11
  %740 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %715) #11
  %741 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %725) #11
  %742 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %726) #11
  %743 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %727) #11
  %744 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %728) #11
  %745 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %729) #11
  %746 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %730) #11
  %747 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %731) #11
  %748 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %732) #11
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
  %765 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %749) #11
  %766 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %750) #11
  %767 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %751) #11
  %768 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %752) #11
  %769 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %753) #11
  %770 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %754) #11
  %771 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %755) #11
  %772 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %756) #11
  %773 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %757) #11
  %774 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %758) #11
  %775 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %759) #11
  %776 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %760) #11
  %777 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %761) #11
  %778 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %762) #11
  %779 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %763) #11
  %780 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %764) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %786, i32 %789, i32 %792, i32 %795, ptr addrspace(1) %782) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %798, i32 %801, i32 %804, i32 %807, ptr addrspace(1) %783) #11
  ret void
}

define ptx_kernel void @fusion_100(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8, ptr noalias align 128 dereferenceable(32768) %arg9) local_unnamed_addr #6 {
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
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
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
  %16 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #11
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
  %33 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #11
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
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #11
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #11
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = shl nsw i64 %2, 13
  %67 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %66
  %68 = getelementptr bfloat, ptr addrspace(1) %67, i64 %13
  %69 = getelementptr i8, ptr addrspace(1) %68, i64 1024
  %70 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #11
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
  %87 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %69) #11
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
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #11
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #11
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %3
  %121 = getelementptr bfloat, ptr addrspace(1) %120, i64 %13
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #11
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
  %140 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %122) #11
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
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #11
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #11
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #11
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #11
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #11
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr i8, ptr addrspace(1) %68, i64 2048
  %175 = getelementptr bfloat, ptr addrspace(1) %173, i64 %13
  %176 = getelementptr i8, ptr addrspace(1) %175, i64 1024
  %177 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #11
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
  %194 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %176) #11
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
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #11
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #11
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #11
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #11
  %227 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %3
  %228 = getelementptr bfloat, ptr addrspace(1) %227, i64 %13
  %229 = getelementptr i8, ptr addrspace(1) %228, i64 1024
  %230 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #11
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
  %247 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #11
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
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #11
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #11
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #11
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #11
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #11
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #11
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #11
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #11
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #11
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #11
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #11
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #11
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #11
  %280 = getelementptr i8, ptr addrspace(1) %67, i64 4096
  %281 = getelementptr i8, ptr addrspace(1) %68, i64 4096
  %282 = getelementptr bfloat, ptr addrspace(1) %280, i64 %13
  %283 = getelementptr i8, ptr addrspace(1) %282, i64 1024
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #11
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
  %301 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #11
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
  %318 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %293) #11
  %319 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %294) #11
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #11
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #11
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #11
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #11
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #11
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #11
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %310) #11
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %311) #11
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #11
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #11
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #11
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #11
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #11
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #11
  %334 = getelementptr bfloat, ptr addrspace(1) %arg817, i64 %3
  %335 = getelementptr bfloat, ptr addrspace(1) %334, i64 %13
  %336 = getelementptr i8, ptr addrspace(1) %335, i64 1024
  %337 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %335) #11
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
  %354 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %336) #11
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
  %371 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %346) #11
  %372 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %347) #11
  %373 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %348) #11
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #11
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #11
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #11
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #11
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #11
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %363) #11
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %364) #11
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %365) #11
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #11
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #11
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #11
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #11
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #11
  %387 = getelementptr i8, ptr addrspace(1) %67, i64 6144
  %388 = getelementptr i8, ptr addrspace(1) %68, i64 6144
  %389 = getelementptr bfloat, ptr addrspace(1) %387, i64 %13
  %390 = getelementptr i8, ptr addrspace(1) %389, i64 1024
  %391 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %388) #11
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
  %408 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %390) #11
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
  %425 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %400) #11
  %426 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %401) #11
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #11
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #11
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #11
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #11
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #11
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #11
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %417) #11
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %418) #11
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #11
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #11
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #11
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #11
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #11
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #11
  %441 = getelementptr bfloat, ptr addrspace(1) %arg715, i64 %3
  %442 = getelementptr bfloat, ptr addrspace(1) %441, i64 %13
  %443 = getelementptr i8, ptr addrspace(1) %442, i64 1024
  %444 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %442) #11
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
  %461 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %443) #11
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
  %478 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #11
  %479 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %454) #11
  %480 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %455) #11
  %481 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %456) #11
  %482 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %457) #11
  %483 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %458) #11
  %484 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %459) #11
  %485 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %460) #11
  %486 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %470) #11
  %487 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %471) #11
  %488 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %472) #11
  %489 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %473) #11
  %490 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %474) #11
  %491 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %475) #11
  %492 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %476) #11
  %493 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %477) #11
  %494 = getelementptr float, ptr addrspace(1) %arg613, i64 %3
  %495 = getelementptr float, ptr addrspace(1) %494, i64 %13
  %496 = getelementptr i8, ptr addrspace(1) %495, i64 16
  %497 = getelementptr i8, ptr addrspace(1) %495, i64 2048
  %498 = getelementptr i8, ptr addrspace(1) %495, i64 2064
  %499 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %495) #11
  %500 = extractvalue { i32, i32, i32, i32 } %499, 0
  %501 = extractvalue { i32, i32, i32, i32 } %499, 1
  %502 = extractvalue { i32, i32, i32, i32 } %499, 2
  %503 = extractvalue { i32, i32, i32, i32 } %499, 3
  %504 = bitcast i32 %500 to float
  %505 = bitcast i32 %501 to float
  %506 = bitcast i32 %502 to float
  %507 = bitcast i32 %503 to float
  %508 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %496) #11
  %509 = extractvalue { i32, i32, i32, i32 } %508, 0
  %510 = extractvalue { i32, i32, i32, i32 } %508, 1
  %511 = extractvalue { i32, i32, i32, i32 } %508, 2
  %512 = extractvalue { i32, i32, i32, i32 } %508, 3
  %513 = bitcast i32 %509 to float
  %514 = bitcast i32 %510 to float
  %515 = bitcast i32 %511 to float
  %516 = bitcast i32 %512 to float
  %517 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %497) #11
  %518 = extractvalue { i32, i32, i32, i32 } %517, 0
  %519 = extractvalue { i32, i32, i32, i32 } %517, 1
  %520 = extractvalue { i32, i32, i32, i32 } %517, 2
  %521 = extractvalue { i32, i32, i32, i32 } %517, 3
  %522 = bitcast i32 %518 to float
  %523 = bitcast i32 %519 to float
  %524 = bitcast i32 %520 to float
  %525 = bitcast i32 %521 to float
  %526 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %498) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %732, <1 x i32> %733, i1 %730) #11
  tail call void @llvm.nvvm.barrier0()
  %734 = icmp samesign ult i32 %5, 2
  %735 = zext nneg i32 %5 to i64
  %736 = getelementptr float, ptr addrspace(3) @global_smem, i64 %735
  %737 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %736, i1 %734) #11
  %738 = bitcast i32 %737 to float
  %739 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %737, i32 1, i32 31)
  %740 = bitcast i32 %739 to float
  %741 = fadd float %738, %740
  %742 = icmp eq i32 %5, 0
  %743 = bitcast float %741 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %736, <1 x i32> %743, i1 %742) #11
  tail call void @llvm.nvvm.barrier0()
  %744 = load float, ptr addrspace(3) @global_smem, align 16
  %745 = fmul float %744, 0x3F50000000000000
  %746 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %768 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %766) #11
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
  %785 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %767) #11
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
  %802 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %777) #11
  %803 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %778) #11
  %804 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %779) #11
  %805 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %780) #11
  %806 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %781) #11
  %807 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %782) #11
  %808 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %783) #11
  %809 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %784) #11
  %810 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %794) #11
  %811 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %795) #11
  %812 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %796) #11
  %813 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %797) #11
  %814 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %798) #11
  %815 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %799) #11
  %816 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %800) #11
  %817 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %801) #11
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
  %834 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %818) #11
  %835 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %819) #11
  %836 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %820) #11
  %837 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %821) #11
  %838 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %822) #11
  %839 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %823) #11
  %840 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %824) #11
  %841 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %825) #11
  %842 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %826) #11
  %843 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %827) #11
  %844 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %828) #11
  %845 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %829) #11
  %846 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %830) #11
  %847 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %831) #11
  %848 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %832) #11
  %849 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %833) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %855, i32 %858, i32 %861, i32 %864, ptr addrspace(1) %851) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %867, i32 %870, i32 %873, i32 %876, ptr addrspace(1) %852) #11
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice(ptr noalias readonly align 128 captures(none) dereferenceable(131072) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %7 = shl nuw nsw i32 %6, 7
  %8 = and i32 %7, 896
  %9 = shl nuw nsw i32 %6, 9
  %10 = and i32 %9, 61440
  %11 = or disjoint i32 %10, %8
  %12 = or disjoint i32 %11, %5
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr bfloat, ptr addrspace(1) %4, i64 %13
  %15 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 6144
  %16 = load bfloat, ptr addrspace(1) %15, align 2, !invariant.load !5
  %17 = or disjoint i32 %7, %5
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %18
  store bfloat %16, ptr addrspace(1) %19, align 2
  ret void
}

define ptx_kernel void @triton_softmax_10_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #7 {
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %3 = shl nsw i64 %2, 7
  %4 = and i64 %3, 896
  %5 = shl nsw i64 %2, 9
  %6 = and i64 %5, -4096
  %7 = or disjoint i64 %6, %4
  %8 = getelementptr bfloat, ptr addrspace(1) %arg13, i64 %7
  %9 = tail call range(i32 0, 32) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = shl nuw nsw i32 %9, 2
  %11 = and i32 %10, 60
  %12 = icmp samesign ult i32 %9, 16
  %13 = select i1 %12, i32 0, i32 64
  %14 = or disjoint i32 %11, %13
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr bfloat, ptr addrspace(1) %8, i64 %15
  %17 = getelementptr i8, ptr addrspace(1) %16, i64 4096
  %18 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09ld.global.v2.b32 { $0, $1 }, [ $2 + 0 ];", "=r,=r,l"(ptr addrspace(1) %17) #11
  %19 = extractvalue { i32, i32 } %18, 0
  %20 = bitcast i32 %19 to <2 x bfloat>
  %21 = extractvalue { i32, i32 } %18, 1
  %22 = bitcast i32 %21 to <2 x bfloat>
  %23 = extractelement <2 x bfloat> %20, i64 0
  %24 = extractelement <2 x bfloat> %20, i64 1
  %25 = extractelement <2 x bfloat> %22, i64 0
  %26 = extractelement <2 x bfloat> %22, i64 1
  %27 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %23) #11
  %28 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #11
  %29 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #11
  %30 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #11
  %31 = fmul float %27, %27
  %32 = fmul float %28, %28
  %33 = fmul float %29, %29
  %34 = fmul float %30, %30
  %35 = fadd float %31, %32
  %36 = fadd float %35, %33
  %37 = fadd float %36, %34
  %38 = bitcast float %37 to i32
  %39 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %38, i32 16, i32 31)
  %40 = bitcast i32 %39 to float
  %41 = fadd float %37, %40
  %42 = bitcast float %41 to i32
  %43 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %42, i32 8, i32 31)
  %44 = bitcast i32 %43 to float
  %45 = fadd float %41, %44
  %46 = bitcast float %45 to i32
  %47 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %46, i32 4, i32 31)
  %48 = bitcast i32 %47 to float
  %49 = fadd float %45, %48
  %50 = bitcast float %49 to i32
  %51 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %50, i32 2, i32 31)
  %52 = bitcast i32 %51 to float
  %53 = fadd float %49, %52
  %54 = bitcast float %53 to i32
  %55 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %54, i32 1, i32 31)
  %56 = bitcast i32 %55 to float
  %57 = fadd float %53, %56
  %58 = fmul float %57, 7.812500e-03
  %59 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
  %60 = bitcast i32 %59 to float
  %61 = fadd float %58, %60
  %62 = tail call float @llvm.nvvm.rsqrt.approx.f(float %61)
  %63 = fmul float %27, %62
  %64 = fmul float %28, %62
  %65 = fmul float %29, %62
  %66 = fmul float %30, %62
  %67 = getelementptr i8, ptr addrspace(1) %arg25, i64 %5
  %68 = getelementptr float, ptr addrspace(1) %67, i64 %15
  %69 = bitcast float %63 to i32
  %70 = bitcast float %64 to i32
  %71 = bitcast float %65 to i32
  %72 = bitcast float %66 to i32
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %69, i32 %70, i32 %71, i32 %72, ptr addrspace(1) %68) #11
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(65536) %0, ptr noalias readonly align 16 captures(none) dereferenceable(256) %1, ptr noalias readonly align 16 captures(none) dereferenceable(10485760) %2, ptr noalias readonly align 16 captures(none) dereferenceable(64) %3, ptr noalias writeonly align 128 captures(none) dereferenceable(32768) %4) local_unnamed_addr #8 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %13 = lshr i32 %12, 2
  %14 = and i32 %11, 63
  %15 = shl nuw nsw i32 %11, 1
  %16 = and i32 %15, 128
  %17 = shl nuw nsw i32 %12, 8
  %18 = or disjoint i32 %16, %17
  %19 = or disjoint i32 %18, %14
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr float, ptr addrspace(1) %10, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !5
  %23 = zext nneg i32 %14 to i64
  %24 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %23
  %25 = load bfloat, ptr addrspace(1) %24, align 2, !invariant.load !5
  %26 = fpext bfloat %25 to float
  %27 = fmul float %22, %26
  tail call void @llvm.experimental.noalias.scope.decl(metadata !27)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !30)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !5, !alias.scope !30, !noalias !27
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !5, !alias.scope !27, !noalias !30
  %38 = fpext bfloat %37 to float
  %39 = fmul float %27, %38
  %40 = or i32 %11, 64
  %41 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 256
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !5
  %43 = zext nneg i32 %40 to i64
  %44 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %43
  %45 = load bfloat, ptr addrspace(1) %44, align 2, !invariant.load !5
  %46 = fpext bfloat %45 to float
  %47 = fmul float %42, %46
  %48 = or disjoint i32 %33, %40
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %49
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !5, !alias.scope !32, !noalias !35
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %7 = shl nuw nsw i32 %5, 2
  %8 = shl nuw nsw i32 %6, 9
  %9 = or disjoint i32 %7, %8
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %10
  %12 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 138706944
  %13 = load <4 x bfloat>, ptr addrspace(1) %12, align 8, !invariant.load !5
  %14 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %10
  store <4 x bfloat> %13, ptr addrspace(1) %14, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_slice_1(ptr noalias readonly align 16 captures(none) dereferenceable(277413888) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(138706944) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %1 to ptr addrspace(1)
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %7 = shl nuw nsw i32 %5, 2
  %8 = shl nuw nsw i32 %6, 9
  %9 = or disjoint i32 %7, %8
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds bfloat, ptr addrspace(1) %4, i64 %10
  %12 = load <4 x bfloat>, ptr addrspace(1) %11, align 8, !invariant.load !5
  %13 = getelementptr inbounds bfloat, ptr addrspace(1) %3, i64 %10
  store <4 x bfloat> %12, ptr addrspace(1) %13, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.rsqrt.approx.f(float) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.f(float) #9

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #10

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) "nvvm.reqntid"="128,1,1" }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { "nvvm.reqntid"="128,1,1" }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { "nvvm.reqntid"="64,1,1" }
attributes #7 = { "nvvm.reqntid"="32,1,1" }
attributes #8 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #9 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #10 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #11 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!nvvmir.version = !{!3}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!3 = !{i32 2, i32 0}
!4 = !{i32 0, i32 128}
!5 = !{}
!6 = !{i32 0, i32 32768}
!7 = !{i32 0, i32 384}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_7_param_0_229: argument 0"}
!10 = distinct !{!10, !"fused_convert_7_param_0_229"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_7_param_0_229: argument 0"}
!13 = distinct !{!13, !"fused_convert_7_param_0_229"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_add_convert_429_16: argument 0"}
!16 = distinct !{!16, !"fused_add_convert_429_16"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"fused_add_convert_429_16: argument 0"}
!19 = distinct !{!19, !"fused_add_convert_429_16"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"fused_add_convert_429_16: argument 0"}
!22 = distinct !{!22, !"fused_add_convert_429_16"}
!23 = !{!24}
!24 = distinct !{!24, !25, !"fused_add_convert_429_16: argument 0"}
!25 = distinct !{!25, !"fused_add_convert_429_16"}
!26 = !{i32 0, i32 64}
!27 = !{!28}
!28 = distinct !{!28, !29, !"fused_concatenate_convert_554_17: argument 0"}
!29 = distinct !{!29, !"fused_concatenate_convert_554_17"}
!30 = !{!31}
!31 = distinct !{!31, !29, !"fused_concatenate_convert_554_17: argument 1"}
!32 = !{!33}
!33 = distinct !{!33, !34, !"fused_concatenate_convert_554_17: argument 0"}
!34 = distinct !{!34, !"fused_concatenate_convert_554_17"}
!35 = !{!36}
!36 = distinct !{!36, !34, !"fused_concatenate_convert_554_17: argument 1"}
!37 = !{i32 0, i32 135456}

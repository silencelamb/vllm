; ModuleID = 'SyncTensorsGraph.663'
source_filename = "SyncTensorsGraph.663"
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
define ptx_kernel void @wrapped_concatenate(ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %1, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %2, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %3, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %4, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %5, ptr noalias readonly align 16 captures(none) dereferenceable(4194304) %6, ptr noalias writeonly align 128 captures(none) dereferenceable(29360128) %7) local_unnamed_addr #2 {
  %9 = addrspacecast ptr %7 to ptr addrspace(1)
  %10 = addrspacecast ptr %6 to ptr addrspace(1)
  %11 = addrspacecast ptr %5 to ptr addrspace(1)
  %12 = addrspacecast ptr %4 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = addrspacecast ptr %2 to ptr addrspace(1)
  %15 = addrspacecast ptr %1 to ptr addrspace(1)
  %16 = addrspacecast ptr %0 to ptr addrspace(1)
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %19 = lshr i32 %18, 2
  %20 = icmp samesign ult i32 %18, 12288
  %21 = shl nuw nsw i32 %17, 2
  %22 = shl nuw nsw i32 %18, 9
  %23 = or disjoint i32 %21, %22
  br i1 %20, label %24, label %49

24:                                               ; preds = %8
  %25 = icmp samesign ult i32 %18, 4096
  br i1 %25, label %26, label %29

26:                                               ; preds = %24
  %27 = zext nneg i32 %23 to i64
  %28 = getelementptr inbounds bfloat, ptr addrspace(1) %16, i64 %27
  br label %89

29:                                               ; preds = %24
  %30 = icmp samesign ult i32 %18, 8192
  %31 = and i32 %22, 1536
  %32 = shl nuw nsw i32 %19, 11
  br i1 %30, label %33, label %41

33:                                               ; preds = %29
  %34 = sext i32 %21 to i64
  %35 = sext i32 %31 to i64
  %36 = sext i32 %32 to i64
  %37 = add i64 %36, %35
  %38 = add i64 %37, %34
  %39 = getelementptr bfloat, ptr addrspace(1) %15, i64 %38
  %40 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 -4194304
  br label %89

41:                                               ; preds = %29
  %42 = sext i32 %21 to i64
  %43 = sext i32 %31 to i64
  %44 = sext i32 %32 to i64
  %45 = add i64 %44, %43
  %46 = add i64 %45, %42
  %47 = getelementptr bfloat, ptr addrspace(1) %14, i64 %46
  %48 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 -8388608
  br label %89

49:                                               ; preds = %8
  %50 = icmp samesign ult i32 %18, 20480
  %51 = and i32 %22, 1536
  %52 = shl nuw nsw i32 %19, 11
  br i1 %50, label %53, label %71

53:                                               ; preds = %49
  %54 = icmp samesign ult i32 %18, 16384
  br i1 %54, label %55, label %63

55:                                               ; preds = %53
  %56 = sext i32 %21 to i64
  %57 = sext i32 %51 to i64
  %58 = sext i32 %52 to i64
  %59 = add i64 %58, %57
  %60 = add i64 %59, %56
  %61 = getelementptr bfloat, ptr addrspace(1) %13, i64 %60
  %62 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 -12582912
  br label %89

63:                                               ; preds = %53
  %64 = sext i32 %21 to i64
  %65 = sext i32 %51 to i64
  %66 = sext i32 %52 to i64
  %67 = add i64 %66, %65
  %68 = add i64 %67, %64
  %69 = getelementptr bfloat, ptr addrspace(1) %12, i64 %68
  %70 = getelementptr inbounds i8, ptr addrspace(1) %69, i64 -16777216
  br label %89

71:                                               ; preds = %49
  %72 = icmp samesign ult i32 %18, 24576
  br i1 %72, label %73, label %81

73:                                               ; preds = %71
  %74 = sext i32 %21 to i64
  %75 = sext i32 %51 to i64
  %76 = sext i32 %52 to i64
  %77 = add i64 %76, %75
  %78 = add i64 %77, %74
  %79 = getelementptr bfloat, ptr addrspace(1) %11, i64 %78
  %80 = getelementptr inbounds i8, ptr addrspace(1) %79, i64 -20971520
  br label %89

81:                                               ; preds = %71
  %82 = sext i32 %21 to i64
  %83 = sext i32 %51 to i64
  %84 = sext i32 %52 to i64
  %85 = add i64 %84, %83
  %86 = add i64 %85, %82
  %87 = getelementptr bfloat, ptr addrspace(1) %10, i64 %86
  %88 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 -25165824
  br label %89

89:                                               ; preds = %26, %41, %33, %63, %55, %81, %73
  %.in = phi ptr addrspace(1) [ %28, %26 ], [ %48, %41 ], [ %40, %33 ], [ %70, %63 ], [ %62, %55 ], [ %88, %81 ], [ %80, %73 ]
  %90 = icmp ult i32 %18, 12288
  br i1 %90, label %91, label %119

91:                                               ; preds = %89
  %92 = icmp samesign ult i32 %18, 4096
  br i1 %92, label %93, label %97

93:                                               ; preds = %91
  %94 = zext nneg i32 %23 to i64
  %95 = getelementptr bfloat, ptr addrspace(1) %16, i64 %94
  %96 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 2
  br label %163

97:                                               ; preds = %91
  %98 = icmp samesign ult i32 %18, 8192
  %99 = and i32 %22, 1536
  %100 = shl nuw nsw i32 %19, 11
  br i1 %98, label %101, label %110

101:                                              ; preds = %97
  %102 = sext i32 %21 to i64
  %103 = sext i32 %99 to i64
  %104 = sext i32 %100 to i64
  %105 = add i64 %104, %103
  %106 = add i64 %105, %102
  %107 = add i64 %106, 1
  %108 = getelementptr bfloat, ptr addrspace(1) %15, i64 %107
  %109 = getelementptr inbounds i8, ptr addrspace(1) %108, i64 -4194304
  br label %163

110:                                              ; preds = %97
  %111 = sext i32 %21 to i64
  %112 = sext i32 %99 to i64
  %113 = sext i32 %100 to i64
  %114 = add i64 %113, %112
  %115 = add i64 %114, %111
  %116 = add i64 %115, 1
  %117 = getelementptr bfloat, ptr addrspace(1) %14, i64 %116
  %118 = getelementptr inbounds i8, ptr addrspace(1) %117, i64 -8388608
  br label %163

119:                                              ; preds = %89
  %120 = icmp samesign ult i32 %18, 20480
  %121 = and i32 %22, 1536
  %122 = shl nuw nsw i32 %19, 11
  br i1 %120, label %123, label %143

123:                                              ; preds = %119
  %124 = icmp samesign ult i32 %18, 16384
  br i1 %124, label %125, label %134

125:                                              ; preds = %123
  %126 = sext i32 %21 to i64
  %127 = sext i32 %121 to i64
  %128 = sext i32 %122 to i64
  %129 = add i64 %128, %127
  %130 = add i64 %129, %126
  %131 = add i64 %130, 1
  %132 = getelementptr bfloat, ptr addrspace(1) %13, i64 %131
  %133 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 -12582912
  br label %163

134:                                              ; preds = %123
  %135 = sext i32 %21 to i64
  %136 = sext i32 %121 to i64
  %137 = sext i32 %122 to i64
  %138 = add i64 %137, %136
  %139 = add i64 %138, %135
  %140 = add i64 %139, 1
  %141 = getelementptr bfloat, ptr addrspace(1) %12, i64 %140
  %142 = getelementptr inbounds i8, ptr addrspace(1) %141, i64 -16777216
  br label %163

143:                                              ; preds = %119
  %144 = icmp samesign ult i32 %18, 24576
  br i1 %144, label %145, label %154

145:                                              ; preds = %143
  %146 = sext i32 %21 to i64
  %147 = sext i32 %121 to i64
  %148 = sext i32 %122 to i64
  %149 = add i64 %148, %147
  %150 = add i64 %149, %146
  %151 = add i64 %150, 1
  %152 = getelementptr bfloat, ptr addrspace(1) %11, i64 %151
  %153 = getelementptr inbounds i8, ptr addrspace(1) %152, i64 -20971520
  br label %163

154:                                              ; preds = %143
  %155 = sext i32 %21 to i64
  %156 = sext i32 %121 to i64
  %157 = sext i32 %122 to i64
  %158 = add i64 %157, %156
  %159 = add i64 %158, %155
  %160 = add i64 %159, 1
  %161 = getelementptr bfloat, ptr addrspace(1) %10, i64 %160
  %162 = getelementptr inbounds i8, ptr addrspace(1) %161, i64 -25165824
  br label %163

163:                                              ; preds = %93, %110, %101, %134, %125, %154, %145
  %.in1 = phi ptr addrspace(1) [ %96, %93 ], [ %118, %110 ], [ %109, %101 ], [ %142, %134 ], [ %133, %125 ], [ %162, %154 ], [ %153, %145 ]
  %164 = icmp ult i32 %18, 12288
  br i1 %164, label %165, label %193

165:                                              ; preds = %163
  %166 = icmp samesign ult i32 %18, 4096
  br i1 %166, label %167, label %171

167:                                              ; preds = %165
  %168 = zext nneg i32 %23 to i64
  %169 = getelementptr bfloat, ptr addrspace(1) %16, i64 %168
  %170 = getelementptr inbounds i8, ptr addrspace(1) %169, i64 4
  br label %237

171:                                              ; preds = %165
  %172 = icmp samesign ult i32 %18, 8192
  %173 = and i32 %22, 1536
  %174 = shl nuw nsw i32 %19, 11
  br i1 %172, label %175, label %184

175:                                              ; preds = %171
  %176 = sext i32 %21 to i64
  %177 = sext i32 %173 to i64
  %178 = sext i32 %174 to i64
  %179 = add i64 %178, %177
  %180 = add i64 %179, %176
  %181 = add i64 %180, 2
  %182 = getelementptr bfloat, ptr addrspace(1) %15, i64 %181
  %183 = getelementptr inbounds i8, ptr addrspace(1) %182, i64 -4194304
  br label %237

184:                                              ; preds = %171
  %185 = sext i32 %21 to i64
  %186 = sext i32 %173 to i64
  %187 = sext i32 %174 to i64
  %188 = add i64 %187, %186
  %189 = add i64 %188, %185
  %190 = add i64 %189, 2
  %191 = getelementptr bfloat, ptr addrspace(1) %14, i64 %190
  %192 = getelementptr inbounds i8, ptr addrspace(1) %191, i64 -8388608
  br label %237

193:                                              ; preds = %163
  %194 = icmp samesign ult i32 %18, 20480
  %195 = and i32 %22, 1536
  %196 = shl nuw nsw i32 %19, 11
  br i1 %194, label %197, label %217

197:                                              ; preds = %193
  %198 = icmp samesign ult i32 %18, 16384
  br i1 %198, label %199, label %208

199:                                              ; preds = %197
  %200 = sext i32 %21 to i64
  %201 = sext i32 %195 to i64
  %202 = sext i32 %196 to i64
  %203 = add i64 %202, %201
  %204 = add i64 %203, %200
  %205 = add i64 %204, 2
  %206 = getelementptr bfloat, ptr addrspace(1) %13, i64 %205
  %207 = getelementptr inbounds i8, ptr addrspace(1) %206, i64 -12582912
  br label %237

208:                                              ; preds = %197
  %209 = sext i32 %21 to i64
  %210 = sext i32 %195 to i64
  %211 = sext i32 %196 to i64
  %212 = add i64 %211, %210
  %213 = add i64 %212, %209
  %214 = add i64 %213, 2
  %215 = getelementptr bfloat, ptr addrspace(1) %12, i64 %214
  %216 = getelementptr inbounds i8, ptr addrspace(1) %215, i64 -16777216
  br label %237

217:                                              ; preds = %193
  %218 = icmp samesign ult i32 %18, 24576
  br i1 %218, label %219, label %228

219:                                              ; preds = %217
  %220 = sext i32 %21 to i64
  %221 = sext i32 %195 to i64
  %222 = sext i32 %196 to i64
  %223 = add i64 %222, %221
  %224 = add i64 %223, %220
  %225 = add i64 %224, 2
  %226 = getelementptr bfloat, ptr addrspace(1) %11, i64 %225
  %227 = getelementptr inbounds i8, ptr addrspace(1) %226, i64 -20971520
  br label %237

228:                                              ; preds = %217
  %229 = sext i32 %21 to i64
  %230 = sext i32 %195 to i64
  %231 = sext i32 %196 to i64
  %232 = add i64 %231, %230
  %233 = add i64 %232, %229
  %234 = add i64 %233, 2
  %235 = getelementptr bfloat, ptr addrspace(1) %10, i64 %234
  %236 = getelementptr inbounds i8, ptr addrspace(1) %235, i64 -25165824
  br label %237

237:                                              ; preds = %167, %184, %175, %208, %199, %228, %219
  %.in2 = phi ptr addrspace(1) [ %170, %167 ], [ %192, %184 ], [ %183, %175 ], [ %216, %208 ], [ %207, %199 ], [ %236, %228 ], [ %227, %219 ]
  %238 = icmp ult i32 %18, 12288
  br i1 %238, label %239, label %267

239:                                              ; preds = %237
  %240 = icmp samesign ult i32 %18, 4096
  br i1 %240, label %241, label %245

241:                                              ; preds = %239
  %242 = zext nneg i32 %23 to i64
  %243 = getelementptr bfloat, ptr addrspace(1) %16, i64 %242
  %244 = getelementptr inbounds i8, ptr addrspace(1) %243, i64 6
  br label %311

245:                                              ; preds = %239
  %246 = icmp samesign ult i32 %18, 8192
  %247 = and i32 %22, 1536
  %248 = shl nuw nsw i32 %19, 11
  br i1 %246, label %249, label %258

249:                                              ; preds = %245
  %250 = sext i32 %21 to i64
  %251 = sext i32 %247 to i64
  %252 = sext i32 %248 to i64
  %253 = add i64 %252, %251
  %254 = add i64 %253, %250
  %255 = add i64 %254, 3
  %256 = getelementptr bfloat, ptr addrspace(1) %15, i64 %255
  %257 = getelementptr inbounds i8, ptr addrspace(1) %256, i64 -4194304
  br label %311

258:                                              ; preds = %245
  %259 = sext i32 %21 to i64
  %260 = sext i32 %247 to i64
  %261 = sext i32 %248 to i64
  %262 = add i64 %261, %260
  %263 = add i64 %262, %259
  %264 = add i64 %263, 3
  %265 = getelementptr bfloat, ptr addrspace(1) %14, i64 %264
  %266 = getelementptr inbounds i8, ptr addrspace(1) %265, i64 -8388608
  br label %311

267:                                              ; preds = %237
  %268 = icmp samesign ult i32 %18, 20480
  %269 = and i32 %22, 1536
  %270 = shl nuw nsw i32 %19, 11
  br i1 %268, label %271, label %291

271:                                              ; preds = %267
  %272 = icmp samesign ult i32 %18, 16384
  br i1 %272, label %273, label %282

273:                                              ; preds = %271
  %274 = sext i32 %21 to i64
  %275 = sext i32 %269 to i64
  %276 = sext i32 %270 to i64
  %277 = add i64 %276, %275
  %278 = add i64 %277, %274
  %279 = add i64 %278, 3
  %280 = getelementptr bfloat, ptr addrspace(1) %13, i64 %279
  %281 = getelementptr inbounds i8, ptr addrspace(1) %280, i64 -12582912
  br label %311

282:                                              ; preds = %271
  %283 = sext i32 %21 to i64
  %284 = sext i32 %269 to i64
  %285 = sext i32 %270 to i64
  %286 = add i64 %285, %284
  %287 = add i64 %286, %283
  %288 = add i64 %287, 3
  %289 = getelementptr bfloat, ptr addrspace(1) %12, i64 %288
  %290 = getelementptr inbounds i8, ptr addrspace(1) %289, i64 -16777216
  br label %311

291:                                              ; preds = %267
  %292 = icmp samesign ult i32 %18, 24576
  br i1 %292, label %293, label %302

293:                                              ; preds = %291
  %294 = sext i32 %21 to i64
  %295 = sext i32 %269 to i64
  %296 = sext i32 %270 to i64
  %297 = add i64 %296, %295
  %298 = add i64 %297, %294
  %299 = add i64 %298, 3
  %300 = getelementptr bfloat, ptr addrspace(1) %11, i64 %299
  %301 = getelementptr inbounds i8, ptr addrspace(1) %300, i64 -20971520
  br label %311

302:                                              ; preds = %291
  %303 = sext i32 %21 to i64
  %304 = sext i32 %269 to i64
  %305 = sext i32 %270 to i64
  %306 = add i64 %305, %304
  %307 = add i64 %306, %303
  %308 = add i64 %307, 3
  %309 = getelementptr bfloat, ptr addrspace(1) %10, i64 %308
  %310 = getelementptr inbounds i8, ptr addrspace(1) %309, i64 -25165824
  br label %311

311:                                              ; preds = %241, %258, %249, %282, %273, %302, %293
  %.in3 = phi ptr addrspace(1) [ %244, %241 ], [ %266, %258 ], [ %257, %249 ], [ %290, %282 ], [ %281, %273 ], [ %310, %302 ], [ %301, %293 ]
  %312 = load bfloat, ptr addrspace(1) %.in3, align 2, !invariant.load !5
  %313 = load bfloat, ptr addrspace(1) %.in, align 2, !invariant.load !5
  %314 = insertelement <4 x bfloat> poison, bfloat %313, i64 0
  %315 = load bfloat, ptr addrspace(1) %.in1, align 2, !invariant.load !5
  %316 = insertelement <4 x bfloat> %314, bfloat %315, i64 1
  %317 = load bfloat, ptr addrspace(1) %.in2, align 2, !invariant.load !5
  %318 = insertelement <4 x bfloat> %316, bfloat %317, i64 2
  %319 = insertelement <4 x bfloat> %318, bfloat %312, i64 3
  %320 = zext nneg i32 %23 to i64
  %321 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %320
  store <4 x bfloat> %319, ptr addrspace(1) %321, align 8
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define ptx_kernel void @gemm_fusion_dot_27_0(ptr noalias align 128 dereferenceable(29360128) %arg0, ptr noalias align 128 dereferenceable(229376) %arg1) local_unnamed_addr #4 {
  %arg1147 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0145 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %.frozen = freeze i32 %1
  %2 = sdiv i32 %.frozen, 8
  %3 = shl nsw i32 %2, 3
  %4 = sub i32 28, %3
  %5 = tail call i32 @llvm.smin.i32(i32 %4, i32 8)
  %6 = srem i32 %1, %5
  %7 = add i32 %3, %6
  %8 = shl i32 %7, 8
  %9 = sext i32 %8 to i64
  %10 = tail call range(i32 0, 256) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = and i32 %10, 16
  %.not = icmp eq i32 %11, 0
  %12 = and i32 %10, 32
  %.not2 = icmp eq i32 %12, 0
  %13 = and i32 %10, 64
  %14 = icmp eq i32 %13, 0
  %15 = lshr i32 %10, 4
  %16 = and i32 %15, 7
  %17 = icmp samesign ult i32 %10, 128
  %18 = select i1 %17, i32 0, i32 8
  %19 = or disjoint i32 %16, %18
  %20 = or disjoint i32 %19, 16
  %21 = or disjoint i32 %19, 32
  %22 = or disjoint i32 %19, 48
  %23 = or disjoint i32 %19, 64
  %24 = or disjoint i32 %19, 80
  %25 = or disjoint i32 %19, 96
  %26 = or disjoint i32 %19, 112
  %27 = or disjoint i32 %19, 128
  %28 = or disjoint i32 %19, 144
  %29 = or disjoint i32 %19, 160
  %30 = or disjoint i32 %19, 176
  %31 = or disjoint i32 %19, 192
  %32 = or disjoint i32 %19, 208
  %33 = or disjoint i32 %19, 224
  %34 = or disjoint i32 %19, 240
  %35 = zext nneg i32 %19 to i64
  %36 = zext nneg i32 %20 to i64
  %37 = zext nneg i32 %21 to i64
  %38 = zext nneg i32 %22 to i64
  %39 = zext nneg i32 %23 to i64
  %40 = zext nneg i32 %24 to i64
  %41 = zext nneg i32 %25 to i64
  %42 = zext nneg i32 %26 to i64
  %43 = zext nneg i32 %27 to i64
  %44 = zext nneg i32 %28 to i64
  %45 = zext nneg i32 %29 to i64
  %46 = zext nneg i32 %30 to i64
  %47 = zext nneg i32 %31 to i64
  %48 = zext nneg i32 %32 to i64
  %49 = zext nneg i32 %33 to i64
  %50 = zext nneg i32 %34 to i64
  %51 = or disjoint i64 %9, %35
  %52 = or disjoint i64 %9, %36
  %53 = or disjoint i64 %9, %37
  %54 = or disjoint i64 %9, %38
  %55 = or disjoint i64 %9, %39
  %56 = or disjoint i64 %9, %40
  %57 = or disjoint i64 %9, %41
  %58 = or disjoint i64 %9, %42
  %59 = or disjoint i64 %9, %43
  %60 = or disjoint i64 %9, %44
  %61 = or disjoint i64 %9, %45
  %62 = or disjoint i64 %9, %46
  %63 = or disjoint i64 %9, %47
  %64 = or disjoint i64 %9, %48
  %65 = or disjoint i64 %9, %49
  %66 = or disjoint i64 %9, %50
  %67 = shl nsw i64 %51, 11
  %68 = shl nsw i64 %52, 11
  %69 = shl nsw i64 %53, 11
  %70 = shl nsw i64 %54, 11
  %71 = shl nsw i64 %55, 11
  %72 = shl nsw i64 %56, 11
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
  %83 = and i32 %10, 1
  %84 = icmp eq i32 %83, 0
  %85 = and i32 %10, 2
  %86 = icmp eq i32 %85, 0
  %87 = and i32 %10, 4
  %.not5 = icmp eq i32 %87, 0
  %88 = shl nuw nsw i32 %10, 3
  %89 = and i32 %88, 120
  %90 = zext nneg i32 %89 to i64
  %91 = or disjoint i64 %67, %90
  %92 = or disjoint i64 %68, %90
  %93 = or disjoint i64 %69, %90
  %94 = or disjoint i64 %70, %90
  %95 = or disjoint i64 %71, %90
  %96 = or disjoint i64 %72, %90
  %97 = or disjoint i64 %73, %90
  %98 = or disjoint i64 %74, %90
  %99 = or disjoint i64 %75, %90
  %100 = or disjoint i64 %76, %90
  %101 = or disjoint i64 %77, %90
  %102 = or disjoint i64 %78, %90
  %103 = or disjoint i64 %79, %90
  %104 = or disjoint i64 %80, %90
  %105 = or disjoint i64 %81, %90
  %106 = or disjoint i64 %82, %90
  %107 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %91
  %108 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %92
  %109 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %93
  %110 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %94
  %111 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %95
  %112 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %96
  %113 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %97
  %114 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %98
  %115 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %99
  %116 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %100
  %117 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %101
  %118 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %102
  %119 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %103
  %120 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %104
  %121 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %105
  %122 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %106
  %123 = select i1 %.not, i32 0, i32 136
  %124 = select i1 %.not2, i32 0, i32 272
  %125 = select i1 %14, i32 0, i32 544
  %126 = or disjoint i32 %124, %123
  %127 = xor i32 %126, %89
  %128 = xor i32 %127, %125
  %129 = select i1 %17, i32 0, i32 1024
  %130 = or disjoint i32 %128, %129
  %131 = zext nneg i32 %130 to i64
  %132 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %131
  %133 = or disjoint i32 %89, 2048
  %134 = xor i32 %126, %133
  %135 = xor i32 %134, %125
  %136 = or disjoint i32 %135, %129
  %137 = zext nneg i32 %136 to i64
  %138 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %137
  %139 = or disjoint i32 %89, 4096
  %140 = xor i32 %126, %139
  %141 = xor i32 %140, %125
  %142 = or disjoint i32 %141, %129
  %143 = zext nneg i32 %142 to i64
  %144 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %143
  %145 = or disjoint i32 %89, 6144
  %146 = xor i32 %126, %145
  %147 = xor i32 %146, %125
  %148 = or disjoint i32 %147, %129
  %149 = zext nneg i32 %148 to i64
  %150 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %149
  %151 = or disjoint i32 %89, 8192
  %152 = xor i32 %126, %151
  %153 = xor i32 %152, %125
  %154 = or disjoint i32 %153, %129
  %155 = zext nneg i32 %154 to i64
  %156 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %155
  %157 = or disjoint i32 %89, 10240
  %158 = xor i32 %126, %157
  %159 = xor i32 %158, %125
  %160 = or disjoint i32 %159, %129
  %161 = zext nneg i32 %160 to i64
  %162 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %161
  %163 = or disjoint i32 %89, 12288
  %164 = xor i32 %126, %163
  %165 = xor i32 %164, %125
  %166 = or disjoint i32 %165, %129
  %167 = zext nneg i32 %166 to i64
  %168 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %167
  %169 = or disjoint i32 %89, 14336
  %170 = xor i32 %126, %169
  %171 = xor i32 %170, %125
  %172 = or disjoint i32 %171, %129
  %173 = zext nneg i32 %172 to i64
  %174 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %173
  %175 = or disjoint i32 %89, 16384
  %176 = xor i32 %126, %175
  %177 = xor i32 %176, %125
  %178 = or disjoint i32 %177, %129
  %179 = zext nneg i32 %178 to i64
  %180 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %179
  %181 = or disjoint i32 %89, 18432
  %182 = xor i32 %126, %181
  %183 = xor i32 %182, %125
  %184 = or disjoint i32 %183, %129
  %185 = zext nneg i32 %184 to i64
  %186 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %185
  %187 = or disjoint i32 %89, 20480
  %188 = xor i32 %126, %187
  %189 = xor i32 %188, %125
  %190 = or disjoint i32 %189, %129
  %191 = zext nneg i32 %190 to i64
  %192 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %191
  %193 = or disjoint i32 %89, 22528
  %194 = xor i32 %126, %193
  %195 = xor i32 %194, %125
  %196 = or disjoint i32 %195, %129
  %197 = zext nneg i32 %196 to i64
  %198 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %197
  %199 = or disjoint i32 %89, 24576
  %200 = xor i32 %126, %199
  %201 = xor i32 %200, %125
  %202 = or disjoint i32 %201, %129
  %203 = zext nneg i32 %202 to i64
  %204 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %203
  %205 = or disjoint i32 %89, 26624
  %206 = xor i32 %126, %205
  %207 = xor i32 %206, %125
  %208 = or disjoint i32 %207, %129
  %209 = zext nneg i32 %208 to i64
  %210 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %209
  %211 = or disjoint i32 %89, 28672
  %212 = xor i32 %126, %211
  %213 = xor i32 %212, %125
  %214 = or disjoint i32 %213, %129
  %215 = zext nneg i32 %214 to i64
  %216 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %215
  %217 = or disjoint i32 %89, 30720
  %218 = xor i32 %126, %217
  %219 = xor i32 %218, %125
  %220 = or disjoint i32 %219, %129
  %221 = zext nneg i32 %220 to i64
  %222 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %221
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %132, ptr addrspace(1) %107, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %138, ptr addrspace(1) %108, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %144, ptr addrspace(1) %109, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %150, ptr addrspace(1) %110, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %156, ptr addrspace(1) %111, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %162, ptr addrspace(1) %112, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %168, ptr addrspace(1) %113, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %174, ptr addrspace(1) %114, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %180, ptr addrspace(1) %115, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %186, ptr addrspace(1) %116, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %192, ptr addrspace(1) %117, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %198, ptr addrspace(1) %118, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %204, ptr addrspace(1) %119, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %210, ptr addrspace(1) %120, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %216, ptr addrspace(1) %121, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %222, ptr addrspace(1) %122, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  %223 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %67
  %224 = getelementptr bfloat, ptr addrspace(1) %223, i64 %90
  %225 = getelementptr i8, ptr addrspace(1) %224, i64 256
  %226 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %68
  %227 = getelementptr bfloat, ptr addrspace(1) %226, i64 %90
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 256
  %229 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %69
  %230 = getelementptr bfloat, ptr addrspace(1) %229, i64 %90
  %231 = getelementptr i8, ptr addrspace(1) %230, i64 256
  %232 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %70
  %233 = getelementptr bfloat, ptr addrspace(1) %232, i64 %90
  %234 = getelementptr i8, ptr addrspace(1) %233, i64 256
  %235 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %71
  %236 = getelementptr bfloat, ptr addrspace(1) %235, i64 %90
  %237 = getelementptr i8, ptr addrspace(1) %236, i64 256
  %238 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %72
  %239 = getelementptr bfloat, ptr addrspace(1) %238, i64 %90
  %240 = getelementptr i8, ptr addrspace(1) %239, i64 256
  %241 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %73
  %242 = getelementptr bfloat, ptr addrspace(1) %241, i64 %90
  %243 = getelementptr i8, ptr addrspace(1) %242, i64 256
  %244 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %74
  %245 = getelementptr bfloat, ptr addrspace(1) %244, i64 %90
  %246 = getelementptr i8, ptr addrspace(1) %245, i64 256
  %247 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %75
  %248 = getelementptr bfloat, ptr addrspace(1) %247, i64 %90
  %249 = getelementptr i8, ptr addrspace(1) %248, i64 256
  %250 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %76
  %251 = getelementptr bfloat, ptr addrspace(1) %250, i64 %90
  %252 = getelementptr i8, ptr addrspace(1) %251, i64 256
  %253 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %77
  %254 = getelementptr bfloat, ptr addrspace(1) %253, i64 %90
  %255 = getelementptr i8, ptr addrspace(1) %254, i64 256
  %256 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %78
  %257 = getelementptr bfloat, ptr addrspace(1) %256, i64 %90
  %258 = getelementptr i8, ptr addrspace(1) %257, i64 256
  %259 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %79
  %260 = getelementptr bfloat, ptr addrspace(1) %259, i64 %90
  %261 = getelementptr i8, ptr addrspace(1) %260, i64 256
  %262 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %80
  %263 = getelementptr bfloat, ptr addrspace(1) %262, i64 %90
  %264 = getelementptr i8, ptr addrspace(1) %263, i64 256
  %265 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %81
  %266 = getelementptr bfloat, ptr addrspace(1) %265, i64 %90
  %267 = getelementptr i8, ptr addrspace(1) %266, i64 256
  %268 = getelementptr bfloat, ptr addrspace(1) %arg0145, i64 %82
  %269 = getelementptr bfloat, ptr addrspace(1) %268, i64 %90
  %270 = getelementptr i8, ptr addrspace(1) %269, i64 256
  tail call void @llvm.nvvm.barrier0()
  %271 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %131
  %272 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %137
  %273 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %143
  %274 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %149
  %275 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %155
  %276 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %161
  %277 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %167
  %278 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %173
  %279 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %179
  %280 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %185
  %281 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %191
  %282 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %197
  %283 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %203
  %284 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %209
  %285 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %215
  %286 = getelementptr inbounds nuw bfloat, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i64 65536), i64 %221
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %271, ptr addrspace(1) %225, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %272, ptr addrspace(1) %228, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %273, ptr addrspace(1) %231, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %274, ptr addrspace(1) %234, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %275, ptr addrspace(1) %237, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %276, ptr addrspace(1) %240, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %277, ptr addrspace(1) %243, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %278, ptr addrspace(1) %246, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %279, ptr addrspace(1) %249, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %280, ptr addrspace(1) %252, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %281, ptr addrspace(1) %255, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %282, ptr addrspace(1) %258, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %283, ptr addrspace(1) %261, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %284, ptr addrspace(1) %264, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %285, ptr addrspace(1) %267, i32 16) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %286, ptr addrspace(1) %270, i32 16) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #11
  tail call void @llvm.nvvm.barrier0()
  %287 = select i1 %84, i32 0, i32 136
  %288 = select i1 %86, i32 0, i32 272
  %289 = or disjoint i32 %287, %288
  %290 = select i1 %.not5, i32 0, i32 544
  %291 = shl nuw nsw i32 %10, 7
  %292 = and i32 %291, 1024
  %293 = or disjoint i32 %290, %292
  %294 = or disjoint i32 %293, %289
  %295 = lshr exact i32 %11, 1
  %296 = xor i32 %294, %295
  %297 = shl nuw nsw i32 %12, 6
  %298 = or disjoint i32 %296, %297
  %299 = shl nuw nsw i32 %13, 6
  %300 = select i1 %17, i32 0, i32 8192
  %301 = or disjoint i32 %299, %298
  %302 = or i32 %301, %300
  %303 = zext nneg i32 %302 to i64
  %invariant.op = or disjoint i32 %295, %297
  %304 = or disjoint i32 %287, 16
  %305 = xor i32 %304, %288
  %306 = or disjoint i32 %292, %305
  %307 = or disjoint i32 %306, %290
  %308 = or disjoint i32 %299, %invariant.op
  %.reass = or disjoint i32 %308, %300
  %309 = xor i32 %.reass, %307
  %310 = zext nneg i32 %309 to i64
  %311 = or disjoint i32 %289, 32
  %312 = xor i32 %311, %290
  %313 = or disjoint i32 %312, %292
  %314 = xor i32 %.reass, %313
  %315 = zext nneg i32 %314 to i64
  %316 = or disjoint i32 %287, 48
  %317 = or disjoint i32 %290, %288
  %318 = xor i32 %317, %316
  %319 = or disjoint i32 %318, %292
  %320 = xor i32 %.reass, %319
  %321 = zext nneg i32 %320 to i64
  %322 = or disjoint i32 %294, 64
  %323 = xor i32 %.reass, %322
  %324 = zext nneg i32 %323 to i64
  %325 = or disjoint i32 %287, 80
  %326 = xor i32 %325, %288
  %327 = or disjoint i32 %292, %326
  %328 = or disjoint i32 %327, %290
  %329 = xor i32 %.reass, %328
  %330 = zext nneg i32 %329 to i64
  %331 = or disjoint i32 %289, 96
  %332 = xor i32 %331, %290
  %333 = or disjoint i32 %332, %292
  %334 = xor i32 %.reass, %333
  %335 = zext nneg i32 %334 to i64
  %336 = or disjoint i32 %287, 112
  %337 = xor i32 %317, %336
  %338 = or disjoint i32 %337, %292
  %339 = xor i32 %.reass, %338
  %340 = zext nneg i32 %339 to i64
  %341 = or disjoint i32 %294, 16384
  %342 = xor i32 %.reass, %341
  %343 = zext nneg i32 %342 to i64
  %344 = or disjoint i32 %287, 16400
  %345 = xor i32 %344, %288
  %346 = or disjoint i32 %292, %345
  %347 = or disjoint i32 %346, %290
  %348 = xor i32 %.reass, %347
  %349 = zext nneg i32 %348 to i64
  %350 = or disjoint i32 %289, 16416
  %351 = xor i32 %350, %290
  %352 = or disjoint i32 %351, %292
  %353 = xor i32 %.reass, %352
  %354 = zext nneg i32 %353 to i64
  %355 = or disjoint i32 %287, 16432
  %356 = xor i32 %317, %355
  %357 = or disjoint i32 %356, %292
  %358 = xor i32 %.reass, %357
  %359 = zext nneg i32 %358 to i64
  %360 = or disjoint i32 %294, 16448
  %361 = xor i32 %.reass, %360
  %362 = zext nneg i32 %361 to i64
  %363 = or disjoint i32 %287, 16464
  %364 = xor i32 %363, %288
  %365 = or disjoint i32 %292, %364
  %366 = or disjoint i32 %365, %290
  %367 = xor i32 %.reass, %366
  %368 = zext nneg i32 %367 to i64
  %369 = or disjoint i32 %289, 16480
  %370 = xor i32 %369, %290
  %371 = or disjoint i32 %370, %292
  %372 = xor i32 %.reass, %371
  %373 = zext nneg i32 %372 to i64
  %374 = or disjoint i32 %287, 16496
  %375 = xor i32 %317, %374
  %376 = or disjoint i32 %375, %292
  %377 = xor i32 %.reass, %376
  %378 = zext nneg i32 %377 to i64
  %379 = trunc i32 %10 to i4
  %380 = zext i4 %379 to i64
  %381 = shl nuw nsw i64 %380, 4
  %382 = add i32 %18, %16
  %383 = add i32 %382, 240
  %384 = zext nneg i32 %383 to i64
  %385 = add i64 %9, %384
  %386 = shl nsw i64 %385, 12
  %387 = add nuw nsw i64 %386, 512
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0145, i64 %387
  %388 = add i32 %382, 224
  %389 = zext nneg i32 %388 to i64
  %390 = add i64 %9, %389
  %391 = shl nsw i64 %390, 12
  %392 = add nuw nsw i64 %391, 512
  %scevgep151 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %392
  %393 = add i32 %382, 208
  %394 = zext nneg i32 %393 to i64
  %395 = add i64 %9, %394
  %396 = shl nsw i64 %395, 12
  %397 = add nuw nsw i64 %396, 512
  %scevgep155 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %397
  %398 = add i32 %382, 192
  %399 = zext nneg i32 %398 to i64
  %400 = add i64 %9, %399
  %401 = shl nsw i64 %400, 12
  %402 = add nuw nsw i64 %401, 512
  %scevgep159 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %402
  %403 = add i32 %382, 176
  %404 = zext nneg i32 %403 to i64
  %405 = add i64 %9, %404
  %406 = shl nsw i64 %405, 12
  %407 = add nuw nsw i64 %406, 512
  %scevgep163 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %407
  %408 = add i32 %382, 160
  %409 = zext nneg i32 %408 to i64
  %410 = add i64 %9, %409
  %411 = shl nsw i64 %410, 12
  %412 = add nuw nsw i64 %411, 512
  %scevgep167 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %412
  %413 = add i32 %382, 144
  %414 = zext nneg i32 %413 to i64
  %415 = add i64 %9, %414
  %416 = shl nsw i64 %415, 12
  %417 = add nuw nsw i64 %416, 512
  %scevgep171 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %417
  %418 = add i32 %382, 128
  %419 = zext nneg i32 %418 to i64
  %420 = add i64 %9, %419
  %421 = shl nsw i64 %420, 12
  %422 = add nuw nsw i64 %421, 512
  %scevgep175 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %422
  %423 = add i32 %382, 112
  %424 = zext nneg i32 %423 to i64
  %425 = add i64 %9, %424
  %426 = shl nsw i64 %425, 12
  %427 = add nuw nsw i64 %426, 512
  %scevgep179 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %427
  %428 = add i32 %382, 96
  %429 = zext nneg i32 %428 to i64
  %430 = add i64 %9, %429
  %431 = shl nsw i64 %430, 12
  %432 = add nuw nsw i64 %431, 512
  %scevgep183 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %432
  %433 = add i32 %382, 80
  %434 = zext nneg i32 %433 to i64
  %435 = add i64 %9, %434
  %436 = shl nsw i64 %435, 12
  %437 = add nuw nsw i64 %436, 512
  %scevgep187 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %437
  %438 = add i32 %382, 64
  %439 = zext nneg i32 %438 to i64
  %440 = add i64 %9, %439
  %441 = shl nsw i64 %440, 12
  %442 = add nuw nsw i64 %441, 512
  %scevgep191 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %442
  %443 = add i32 %382, 48
  %444 = zext nneg i32 %443 to i64
  %445 = add i64 %9, %444
  %446 = shl nsw i64 %445, 12
  %447 = add nuw nsw i64 %446, 512
  %scevgep195 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %447
  %448 = add i32 %382, 32
  %449 = zext nneg i32 %448 to i64
  %450 = add i64 %9, %449
  %451 = shl nsw i64 %450, 12
  %452 = add nuw nsw i64 %451, 512
  %scevgep199 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %452
  %453 = add i32 %382, 16
  %454 = zext nneg i32 %453 to i64
  %455 = add i64 %9, %454
  %456 = shl nsw i64 %455, 12
  %457 = add nuw nsw i64 %456, 512
  %scevgep203 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %457
  %458 = zext nneg i32 %382 to i64
  %459 = add i64 %9, %458
  %460 = shl nsw i64 %459, 12
  %461 = add nuw nsw i64 %460, 512
  %scevgep207 = getelementptr i8, ptr addrspace(1) %arg0145, i64 %461
  br label %462

462:                                              ; preds = %0, %462
  %lsr.iv211 = phi i32 [ -128, %0 ], [ %467, %462 ]
  %lsr.iv208 = phi ptr addrspace(1) [ %scevgep207, %0 ], [ %scevgep209, %462 ]
  %lsr.iv204 = phi ptr addrspace(1) [ %scevgep203, %0 ], [ %scevgep205, %462 ]
  %lsr.iv200 = phi ptr addrspace(1) [ %scevgep199, %0 ], [ %scevgep201, %462 ]
  %lsr.iv196 = phi ptr addrspace(1) [ %scevgep195, %0 ], [ %scevgep197, %462 ]
  %lsr.iv192 = phi ptr addrspace(1) [ %scevgep191, %0 ], [ %scevgep193, %462 ]
  %lsr.iv188 = phi ptr addrspace(1) [ %scevgep187, %0 ], [ %scevgep189, %462 ]
  %lsr.iv184 = phi ptr addrspace(1) [ %scevgep183, %0 ], [ %scevgep185, %462 ]
  %lsr.iv180 = phi ptr addrspace(1) [ %scevgep179, %0 ], [ %scevgep181, %462 ]
  %lsr.iv176 = phi ptr addrspace(1) [ %scevgep175, %0 ], [ %scevgep177, %462 ]
  %lsr.iv172 = phi ptr addrspace(1) [ %scevgep171, %0 ], [ %scevgep173, %462 ]
  %lsr.iv168 = phi ptr addrspace(1) [ %scevgep167, %0 ], [ %scevgep169, %462 ]
  %lsr.iv164 = phi ptr addrspace(1) [ %scevgep163, %0 ], [ %scevgep165, %462 ]
  %lsr.iv160 = phi ptr addrspace(1) [ %scevgep159, %0 ], [ %scevgep161, %462 ]
  %lsr.iv156 = phi ptr addrspace(1) [ %scevgep155, %0 ], [ %scevgep157, %462 ]
  %lsr.iv152 = phi ptr addrspace(1) [ %scevgep151, %0 ], [ %scevgep153, %462 ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %0 ], [ %scevgep149, %462 ]
  %463 = phi ptr addrspace(3) [ @global_smem, %0 ], [ %817, %462 ]
  %464 = phi i32 [ 0, %0 ], [ %814, %462 ]
  %465 = phi i32 [ 1, %0 ], [ %791, %462 ]
  %466 = phi { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } [ zeroinitializer, %0 ], [ %788, %462 ]
  %467 = add i32 %lsr.iv211, 128
  %468 = icmp samesign ult i32 %467, 1792
  %469 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %303
  %470 = ptrtoint ptr addrspace(3) %469 to i64
  %471 = trunc i64 %470 to i32
  %472 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %471) #11
  %473 = extractvalue { i32, i32, i32, i32 } %472, 0
  %474 = extractvalue { i32, i32, i32, i32 } %472, 1
  %475 = extractvalue { i32, i32, i32, i32 } %472, 2
  %476 = extractvalue { i32, i32, i32, i32 } %472, 3
  %477 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %310
  %478 = ptrtoint ptr addrspace(3) %477 to i64
  %479 = trunc i64 %478 to i32
  %480 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %479) #11
  %481 = extractvalue { i32, i32, i32, i32 } %480, 0
  %482 = extractvalue { i32, i32, i32, i32 } %480, 1
  %483 = extractvalue { i32, i32, i32, i32 } %480, 2
  %484 = extractvalue { i32, i32, i32, i32 } %480, 3
  %485 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %315
  %486 = ptrtoint ptr addrspace(3) %485 to i64
  %487 = trunc i64 %486 to i32
  %488 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %487) #11
  %489 = extractvalue { i32, i32, i32, i32 } %488, 0
  %490 = extractvalue { i32, i32, i32, i32 } %488, 1
  %491 = extractvalue { i32, i32, i32, i32 } %488, 2
  %492 = extractvalue { i32, i32, i32, i32 } %488, 3
  %493 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %321
  %494 = ptrtoint ptr addrspace(3) %493 to i64
  %495 = trunc i64 %494 to i32
  %496 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %495) #11
  %497 = extractvalue { i32, i32, i32, i32 } %496, 0
  %498 = extractvalue { i32, i32, i32, i32 } %496, 1
  %499 = extractvalue { i32, i32, i32, i32 } %496, 2
  %500 = extractvalue { i32, i32, i32, i32 } %496, 3
  %501 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %324
  %502 = ptrtoint ptr addrspace(3) %501 to i64
  %503 = trunc i64 %502 to i32
  %504 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %503) #11
  %505 = extractvalue { i32, i32, i32, i32 } %504, 0
  %506 = extractvalue { i32, i32, i32, i32 } %504, 1
  %507 = extractvalue { i32, i32, i32, i32 } %504, 2
  %508 = extractvalue { i32, i32, i32, i32 } %504, 3
  %509 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %330
  %510 = ptrtoint ptr addrspace(3) %509 to i64
  %511 = trunc i64 %510 to i32
  %512 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %511) #11
  %513 = extractvalue { i32, i32, i32, i32 } %512, 0
  %514 = extractvalue { i32, i32, i32, i32 } %512, 1
  %515 = extractvalue { i32, i32, i32, i32 } %512, 2
  %516 = extractvalue { i32, i32, i32, i32 } %512, 3
  %517 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %335
  %518 = ptrtoint ptr addrspace(3) %517 to i64
  %519 = trunc i64 %518 to i32
  %520 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %519) #11
  %521 = extractvalue { i32, i32, i32, i32 } %520, 0
  %522 = extractvalue { i32, i32, i32, i32 } %520, 1
  %523 = extractvalue { i32, i32, i32, i32 } %520, 2
  %524 = extractvalue { i32, i32, i32, i32 } %520, 3
  %525 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %340
  %526 = ptrtoint ptr addrspace(3) %525 to i64
  %527 = trunc i64 %526 to i32
  %528 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %527) #11
  %529 = extractvalue { i32, i32, i32, i32 } %528, 0
  %530 = extractvalue { i32, i32, i32, i32 } %528, 1
  %531 = extractvalue { i32, i32, i32, i32 } %528, 2
  %532 = extractvalue { i32, i32, i32, i32 } %528, 3
  %533 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %343
  %534 = ptrtoint ptr addrspace(3) %533 to i64
  %535 = trunc i64 %534 to i32
  %536 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %535) #11
  %537 = extractvalue { i32, i32, i32, i32 } %536, 0
  %538 = extractvalue { i32, i32, i32, i32 } %536, 1
  %539 = extractvalue { i32, i32, i32, i32 } %536, 2
  %540 = extractvalue { i32, i32, i32, i32 } %536, 3
  %541 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %349
  %542 = ptrtoint ptr addrspace(3) %541 to i64
  %543 = trunc i64 %542 to i32
  %544 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %543) #11
  %545 = extractvalue { i32, i32, i32, i32 } %544, 0
  %546 = extractvalue { i32, i32, i32, i32 } %544, 1
  %547 = extractvalue { i32, i32, i32, i32 } %544, 2
  %548 = extractvalue { i32, i32, i32, i32 } %544, 3
  %549 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %354
  %550 = ptrtoint ptr addrspace(3) %549 to i64
  %551 = trunc i64 %550 to i32
  %552 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %551) #11
  %553 = extractvalue { i32, i32, i32, i32 } %552, 0
  %554 = extractvalue { i32, i32, i32, i32 } %552, 1
  %555 = extractvalue { i32, i32, i32, i32 } %552, 2
  %556 = extractvalue { i32, i32, i32, i32 } %552, 3
  %557 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %359
  %558 = ptrtoint ptr addrspace(3) %557 to i64
  %559 = trunc i64 %558 to i32
  %560 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %559) #11
  %561 = extractvalue { i32, i32, i32, i32 } %560, 0
  %562 = extractvalue { i32, i32, i32, i32 } %560, 1
  %563 = extractvalue { i32, i32, i32, i32 } %560, 2
  %564 = extractvalue { i32, i32, i32, i32 } %560, 3
  %565 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %362
  %566 = ptrtoint ptr addrspace(3) %565 to i64
  %567 = trunc i64 %566 to i32
  %568 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %567) #11
  %569 = extractvalue { i32, i32, i32, i32 } %568, 0
  %570 = extractvalue { i32, i32, i32, i32 } %568, 1
  %571 = extractvalue { i32, i32, i32, i32 } %568, 2
  %572 = extractvalue { i32, i32, i32, i32 } %568, 3
  %573 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %368
  %574 = ptrtoint ptr addrspace(3) %573 to i64
  %575 = trunc i64 %574 to i32
  %576 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %575) #11
  %577 = extractvalue { i32, i32, i32, i32 } %576, 0
  %578 = extractvalue { i32, i32, i32, i32 } %576, 1
  %579 = extractvalue { i32, i32, i32, i32 } %576, 2
  %580 = extractvalue { i32, i32, i32, i32 } %576, 3
  %581 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %373
  %582 = ptrtoint ptr addrspace(3) %581 to i64
  %583 = trunc i64 %582 to i32
  %584 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %583) #11
  %585 = extractvalue { i32, i32, i32, i32 } %584, 0
  %586 = extractvalue { i32, i32, i32, i32 } %584, 1
  %587 = extractvalue { i32, i32, i32, i32 } %584, 2
  %588 = extractvalue { i32, i32, i32, i32 } %584, 3
  %589 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %463, i64 %378
  %590 = ptrtoint ptr addrspace(3) %589 to i64
  %591 = trunc i64 %590 to i32
  %592 = tail call { i32, i32, i32, i32 } asm sideeffect "ldmatrix.sync.aligned.m8n8.x4.shared.b16 {$0, $1, $2, $3}, [$4];", "=r,=r,=r,=r,r"(i32 %591) #11
  %593 = extractvalue { i32, i32, i32, i32 } %592, 0
  %594 = extractvalue { i32, i32, i32, i32 } %592, 1
  %595 = extractvalue { i32, i32, i32, i32 } %592, 2
  %596 = extractvalue { i32, i32, i32, i32 } %592, 3
  %597 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 0
  %598 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 1
  %599 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 2
  %600 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 3
  %601 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 4
  %602 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 5
  %603 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 6
  %604 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 7
  %605 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 8
  %606 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 9
  %607 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 10
  %608 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 11
  %609 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 12
  %610 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 13
  %611 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 14
  %612 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %466, 15
  %613 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %597, float %598, float %599, float %600, i32 %473, i32 %474, i32 %475, i32 %476, i32 0, i32 0) #11
  %614 = extractvalue { float, float, float, float } %613, 0
  %615 = extractvalue { float, float, float, float } %613, 1
  %616 = extractvalue { float, float, float, float } %613, 2
  %617 = extractvalue { float, float, float, float } %613, 3
  %618 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %601, float %602, float %603, float %604, i32 %473, i32 %474, i32 %475, i32 %476, i32 0, i32 0) #11
  %619 = extractvalue { float, float, float, float } %618, 0
  %620 = extractvalue { float, float, float, float } %618, 1
  %621 = extractvalue { float, float, float, float } %618, 2
  %622 = extractvalue { float, float, float, float } %618, 3
  %623 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %605, float %606, float %607, float %608, i32 %537, i32 %538, i32 %539, i32 %540, i32 0, i32 0) #11
  %624 = extractvalue { float, float, float, float } %623, 0
  %625 = extractvalue { float, float, float, float } %623, 1
  %626 = extractvalue { float, float, float, float } %623, 2
  %627 = extractvalue { float, float, float, float } %623, 3
  %628 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %609, float %610, float %611, float %612, i32 %537, i32 %538, i32 %539, i32 %540, i32 0, i32 0) #11
  %629 = extractvalue { float, float, float, float } %628, 0
  %630 = extractvalue { float, float, float, float } %628, 1
  %631 = extractvalue { float, float, float, float } %628, 2
  %632 = extractvalue { float, float, float, float } %628, 3
  %633 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %614, float %615, float %616, float %617, i32 %481, i32 %482, i32 %483, i32 %484, i32 0, i32 0) #11
  %634 = extractvalue { float, float, float, float } %633, 0
  %635 = extractvalue { float, float, float, float } %633, 1
  %636 = extractvalue { float, float, float, float } %633, 2
  %637 = extractvalue { float, float, float, float } %633, 3
  %638 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %619, float %620, float %621, float %622, i32 %481, i32 %482, i32 %483, i32 %484, i32 0, i32 0) #11
  %639 = extractvalue { float, float, float, float } %638, 0
  %640 = extractvalue { float, float, float, float } %638, 1
  %641 = extractvalue { float, float, float, float } %638, 2
  %642 = extractvalue { float, float, float, float } %638, 3
  %643 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %624, float %625, float %626, float %627, i32 %545, i32 %546, i32 %547, i32 %548, i32 0, i32 0) #11
  %644 = extractvalue { float, float, float, float } %643, 0
  %645 = extractvalue { float, float, float, float } %643, 1
  %646 = extractvalue { float, float, float, float } %643, 2
  %647 = extractvalue { float, float, float, float } %643, 3
  %648 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %629, float %630, float %631, float %632, i32 %545, i32 %546, i32 %547, i32 %548, i32 0, i32 0) #11
  %649 = extractvalue { float, float, float, float } %648, 0
  %650 = extractvalue { float, float, float, float } %648, 1
  %651 = extractvalue { float, float, float, float } %648, 2
  %652 = extractvalue { float, float, float, float } %648, 3
  %653 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %634, float %635, float %636, float %637, i32 %489, i32 %490, i32 %491, i32 %492, i32 0, i32 0) #11
  %654 = extractvalue { float, float, float, float } %653, 0
  %655 = extractvalue { float, float, float, float } %653, 1
  %656 = extractvalue { float, float, float, float } %653, 2
  %657 = extractvalue { float, float, float, float } %653, 3
  %658 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %639, float %640, float %641, float %642, i32 %489, i32 %490, i32 %491, i32 %492, i32 0, i32 0) #11
  %659 = extractvalue { float, float, float, float } %658, 0
  %660 = extractvalue { float, float, float, float } %658, 1
  %661 = extractvalue { float, float, float, float } %658, 2
  %662 = extractvalue { float, float, float, float } %658, 3
  %663 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %644, float %645, float %646, float %647, i32 %553, i32 %554, i32 %555, i32 %556, i32 0, i32 0) #11
  %664 = extractvalue { float, float, float, float } %663, 0
  %665 = extractvalue { float, float, float, float } %663, 1
  %666 = extractvalue { float, float, float, float } %663, 2
  %667 = extractvalue { float, float, float, float } %663, 3
  %668 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %649, float %650, float %651, float %652, i32 %553, i32 %554, i32 %555, i32 %556, i32 0, i32 0) #11
  %669 = extractvalue { float, float, float, float } %668, 0
  %670 = extractvalue { float, float, float, float } %668, 1
  %671 = extractvalue { float, float, float, float } %668, 2
  %672 = extractvalue { float, float, float, float } %668, 3
  %673 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %654, float %655, float %656, float %657, i32 %497, i32 %498, i32 %499, i32 %500, i32 0, i32 0) #11
  %674 = extractvalue { float, float, float, float } %673, 0
  %675 = extractvalue { float, float, float, float } %673, 1
  %676 = extractvalue { float, float, float, float } %673, 2
  %677 = extractvalue { float, float, float, float } %673, 3
  %678 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %659, float %660, float %661, float %662, i32 %497, i32 %498, i32 %499, i32 %500, i32 0, i32 0) #11
  %679 = extractvalue { float, float, float, float } %678, 0
  %680 = extractvalue { float, float, float, float } %678, 1
  %681 = extractvalue { float, float, float, float } %678, 2
  %682 = extractvalue { float, float, float, float } %678, 3
  %683 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %664, float %665, float %666, float %667, i32 %561, i32 %562, i32 %563, i32 %564, i32 0, i32 0) #11
  %684 = extractvalue { float, float, float, float } %683, 0
  %685 = extractvalue { float, float, float, float } %683, 1
  %686 = extractvalue { float, float, float, float } %683, 2
  %687 = extractvalue { float, float, float, float } %683, 3
  %688 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %669, float %670, float %671, float %672, i32 %561, i32 %562, i32 %563, i32 %564, i32 0, i32 0) #11
  %689 = extractvalue { float, float, float, float } %688, 0
  %690 = extractvalue { float, float, float, float } %688, 1
  %691 = extractvalue { float, float, float, float } %688, 2
  %692 = extractvalue { float, float, float, float } %688, 3
  %693 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %674, float %675, float %676, float %677, i32 %505, i32 %506, i32 %507, i32 %508, i32 0, i32 0) #11
  %694 = extractvalue { float, float, float, float } %693, 0
  %695 = extractvalue { float, float, float, float } %693, 1
  %696 = extractvalue { float, float, float, float } %693, 2
  %697 = extractvalue { float, float, float, float } %693, 3
  %698 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %679, float %680, float %681, float %682, i32 %505, i32 %506, i32 %507, i32 %508, i32 0, i32 0) #11
  %699 = extractvalue { float, float, float, float } %698, 0
  %700 = extractvalue { float, float, float, float } %698, 1
  %701 = extractvalue { float, float, float, float } %698, 2
  %702 = extractvalue { float, float, float, float } %698, 3
  %703 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %684, float %685, float %686, float %687, i32 %569, i32 %570, i32 %571, i32 %572, i32 0, i32 0) #11
  %704 = extractvalue { float, float, float, float } %703, 0
  %705 = extractvalue { float, float, float, float } %703, 1
  %706 = extractvalue { float, float, float, float } %703, 2
  %707 = extractvalue { float, float, float, float } %703, 3
  %708 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %689, float %690, float %691, float %692, i32 %569, i32 %570, i32 %571, i32 %572, i32 0, i32 0) #11
  %709 = extractvalue { float, float, float, float } %708, 0
  %710 = extractvalue { float, float, float, float } %708, 1
  %711 = extractvalue { float, float, float, float } %708, 2
  %712 = extractvalue { float, float, float, float } %708, 3
  %713 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %694, float %695, float %696, float %697, i32 %513, i32 %514, i32 %515, i32 %516, i32 0, i32 0) #11
  %714 = extractvalue { float, float, float, float } %713, 0
  %715 = extractvalue { float, float, float, float } %713, 1
  %716 = extractvalue { float, float, float, float } %713, 2
  %717 = extractvalue { float, float, float, float } %713, 3
  %718 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %699, float %700, float %701, float %702, i32 %513, i32 %514, i32 %515, i32 %516, i32 0, i32 0) #11
  %719 = extractvalue { float, float, float, float } %718, 0
  %720 = extractvalue { float, float, float, float } %718, 1
  %721 = extractvalue { float, float, float, float } %718, 2
  %722 = extractvalue { float, float, float, float } %718, 3
  %723 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %704, float %705, float %706, float %707, i32 %577, i32 %578, i32 %579, i32 %580, i32 0, i32 0) #11
  %724 = extractvalue { float, float, float, float } %723, 0
  %725 = extractvalue { float, float, float, float } %723, 1
  %726 = extractvalue { float, float, float, float } %723, 2
  %727 = extractvalue { float, float, float, float } %723, 3
  %728 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %709, float %710, float %711, float %712, i32 %577, i32 %578, i32 %579, i32 %580, i32 0, i32 0) #11
  %729 = extractvalue { float, float, float, float } %728, 0
  %730 = extractvalue { float, float, float, float } %728, 1
  %731 = extractvalue { float, float, float, float } %728, 2
  %732 = extractvalue { float, float, float, float } %728, 3
  %733 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %714, float %715, float %716, float %717, i32 %521, i32 %522, i32 %523, i32 %524, i32 0, i32 0) #11
  %734 = extractvalue { float, float, float, float } %733, 0
  %735 = extractvalue { float, float, float, float } %733, 1
  %736 = extractvalue { float, float, float, float } %733, 2
  %737 = extractvalue { float, float, float, float } %733, 3
  %738 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %719, float %720, float %721, float %722, i32 %521, i32 %522, i32 %523, i32 %524, i32 0, i32 0) #11
  %739 = extractvalue { float, float, float, float } %738, 0
  %740 = extractvalue { float, float, float, float } %738, 1
  %741 = extractvalue { float, float, float, float } %738, 2
  %742 = extractvalue { float, float, float, float } %738, 3
  %743 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %724, float %725, float %726, float %727, i32 %585, i32 %586, i32 %587, i32 %588, i32 0, i32 0) #11
  %744 = extractvalue { float, float, float, float } %743, 0
  %745 = extractvalue { float, float, float, float } %743, 1
  %746 = extractvalue { float, float, float, float } %743, 2
  %747 = extractvalue { float, float, float, float } %743, 3
  %748 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %729, float %730, float %731, float %732, i32 %585, i32 %586, i32 %587, i32 %588, i32 0, i32 0) #11
  %749 = extractvalue { float, float, float, float } %748, 0
  %750 = extractvalue { float, float, float, float } %748, 1
  %751 = extractvalue { float, float, float, float } %748, 2
  %752 = extractvalue { float, float, float, float } %748, 3
  %753 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %734, float %735, float %736, float %737, i32 %529, i32 %530, i32 %531, i32 %532, i32 0, i32 0) #11
  %754 = extractvalue { float, float, float, float } %753, 0
  %755 = extractvalue { float, float, float, float } %753, 1
  %756 = extractvalue { float, float, float, float } %753, 2
  %757 = extractvalue { float, float, float, float } %753, 3
  %758 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %739, float %740, float %741, float %742, i32 %529, i32 %530, i32 %531, i32 %532, i32 0, i32 0) #11
  %759 = extractvalue { float, float, float, float } %758, 0
  %760 = extractvalue { float, float, float, float } %758, 1
  %761 = extractvalue { float, float, float, float } %758, 2
  %762 = extractvalue { float, float, float, float } %758, 3
  %763 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %744, float %745, float %746, float %747, i32 %593, i32 %594, i32 %595, i32 %596, i32 0, i32 0) #11
  %764 = extractvalue { float, float, float, float } %763, 0
  %765 = extractvalue { float, float, float, float } %763, 1
  %766 = extractvalue { float, float, float, float } %763, 2
  %767 = extractvalue { float, float, float, float } %763, 3
  %768 = tail call { float, float, float, float } asm sideeffect "mma.sync.aligned.m16n8k16.row.col.f32.bf16.bf16.f32 { $0, $1, $2, $3 }, { $8, $9, $10, $11 }, { $12, $13 }, { $4, $5, $6, $7 };", "=f,=f,=f,=f,0,1,2,3,r,r,r,r,r,r"(float %749, float %750, float %751, float %752, i32 %593, i32 %594, i32 %595, i32 %596, i32 0, i32 0) #11
  %769 = extractvalue { float, float, float, float } %768, 0
  %770 = extractvalue { float, float, float, float } %768, 1
  %771 = extractvalue { float, float, float, float } %768, 2
  %772 = extractvalue { float, float, float, float } %768, 3
  %773 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %754, 0
  %774 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %773, float %755, 1
  %775 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %774, float %756, 2
  %776 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %775, float %757, 3
  %777 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %776, float %759, 4
  %778 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %777, float %760, 5
  %779 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %778, float %761, 6
  %780 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %779, float %762, 7
  %781 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %780, float %764, 8
  %782 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %781, float %765, 9
  %783 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %782, float %766, 10
  %784 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %783, float %767, 11
  %785 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %784, float %769, 12
  %786 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %785, float %770, 13
  %787 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %786, float %771, 14
  %788 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %787, float %772, 15
  %789 = add i32 %465, 1
  %790 = icmp slt i32 %789, 2
  %791 = select i1 %790, i32 %789, i32 0
  %scevgep210 = getelementptr i8, ptr addrspace(1) %lsr.iv208, i64 %381
  %scevgep206 = getelementptr i8, ptr addrspace(1) %lsr.iv204, i64 %381
  %scevgep202 = getelementptr i8, ptr addrspace(1) %lsr.iv200, i64 %381
  %scevgep198 = getelementptr i8, ptr addrspace(1) %lsr.iv196, i64 %381
  %scevgep194 = getelementptr i8, ptr addrspace(1) %lsr.iv192, i64 %381
  %scevgep190 = getelementptr i8, ptr addrspace(1) %lsr.iv188, i64 %381
  %scevgep186 = getelementptr i8, ptr addrspace(1) %lsr.iv184, i64 %381
  %scevgep182 = getelementptr i8, ptr addrspace(1) %lsr.iv180, i64 %381
  %scevgep178 = getelementptr i8, ptr addrspace(1) %lsr.iv176, i64 %381
  %scevgep174 = getelementptr i8, ptr addrspace(1) %lsr.iv172, i64 %381
  %scevgep170 = getelementptr i8, ptr addrspace(1) %lsr.iv168, i64 %381
  %scevgep166 = getelementptr i8, ptr addrspace(1) %lsr.iv164, i64 %381
  %scevgep162 = getelementptr i8, ptr addrspace(1) %lsr.iv160, i64 %381
  %scevgep158 = getelementptr i8, ptr addrspace(1) %lsr.iv156, i64 %381
  %scevgep154 = getelementptr i8, ptr addrspace(1) %lsr.iv152, i64 %381
  %scevgep150 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %381
  %792 = shl i32 %791, 15
  %793 = sext i32 %792 to i64
  %794 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %793
  tail call void @llvm.nvvm.barrier0()
  %795 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %131
  %796 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %137
  %797 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %143
  %798 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %149
  %799 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %155
  %800 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %161
  %801 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %167
  %802 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %173
  %803 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %179
  %804 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %185
  %805 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %191
  %806 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %197
  %807 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %203
  %808 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %209
  %809 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %215
  %810 = getelementptr inbounds nuw bfloat, ptr addrspace(3) %794, i64 %221
  %811 = select i1 %468, i32 16, i32 0
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %795, ptr addrspace(1) %scevgep210, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %796, ptr addrspace(1) %scevgep206, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %797, ptr addrspace(1) %scevgep202, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %798, ptr addrspace(1) %scevgep198, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %799, ptr addrspace(1) %scevgep194, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %800, ptr addrspace(1) %scevgep190, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %801, ptr addrspace(1) %scevgep186, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %802, ptr addrspace(1) %scevgep182, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %803, ptr addrspace(1) %scevgep178, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %804, ptr addrspace(1) %scevgep174, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %805, ptr addrspace(1) %scevgep170, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %806, ptr addrspace(1) %scevgep166, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %807, ptr addrspace(1) %scevgep162, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %808, ptr addrspace(1) %scevgep158, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %809, ptr addrspace(1) %scevgep154, i32 %811) #11
  tail call void asm sideeffect "cp.async.cg.shared.global [ $0 + 0 ], [ $1 + 0 ], 0x10, $2;", "r,l,r"(ptr addrspace(3) %810, ptr addrspace(1) %scevgep150, i32 %811) #11
  tail call void asm sideeffect "cp.async.commit_group ;", ""() #11
  %812 = add i32 %464, 1
  %813 = icmp slt i32 %812, 2
  %814 = select i1 %813, i32 %812, i32 0
  tail call void asm sideeffect "cp.async.wait_group 0x1;", ""() #11
  tail call void @llvm.nvvm.barrier0()
  %815 = shl i32 %814, 15
  %816 = sext i32 %815 to i64
  %817 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %816
  %scevgep149 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 256
  %scevgep153 = getelementptr i8, ptr addrspace(1) %lsr.iv152, i64 256
  %scevgep157 = getelementptr i8, ptr addrspace(1) %lsr.iv156, i64 256
  %scevgep161 = getelementptr i8, ptr addrspace(1) %lsr.iv160, i64 256
  %scevgep165 = getelementptr i8, ptr addrspace(1) %lsr.iv164, i64 256
  %scevgep169 = getelementptr i8, ptr addrspace(1) %lsr.iv168, i64 256
  %scevgep173 = getelementptr i8, ptr addrspace(1) %lsr.iv172, i64 256
  %scevgep177 = getelementptr i8, ptr addrspace(1) %lsr.iv176, i64 256
  %scevgep181 = getelementptr i8, ptr addrspace(1) %lsr.iv180, i64 256
  %scevgep185 = getelementptr i8, ptr addrspace(1) %lsr.iv184, i64 256
  %scevgep189 = getelementptr i8, ptr addrspace(1) %lsr.iv188, i64 256
  %scevgep193 = getelementptr i8, ptr addrspace(1) %lsr.iv192, i64 256
  %scevgep197 = getelementptr i8, ptr addrspace(1) %lsr.iv196, i64 256
  %scevgep201 = getelementptr i8, ptr addrspace(1) %lsr.iv200, i64 256
  %scevgep205 = getelementptr i8, ptr addrspace(1) %lsr.iv204, i64 256
  %scevgep209 = getelementptr i8, ptr addrspace(1) %lsr.iv208, i64 256
  %818 = icmp samesign ult i32 %467, 1920
  br i1 %818, label %462, label %819

819:                                              ; preds = %462
  %820 = icmp ult i32 %10, 128
  %821 = mul i32 %2, 8
  %.decomposed = sub i32 %.frozen, %821
  %822 = sdiv i32 %.decomposed, %5
  tail call void asm sideeffect "cp.async.wait_group 0x0;", ""() #11
  tail call void @llvm.nvvm.barrier0()
  %823 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %754) #11
  %824 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %755) #11
  %825 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %756) #11
  %826 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %757) #11
  %827 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %759) #11
  %828 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %760) #11
  %829 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %761) #11
  %830 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %762) #11
  %831 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %764) #11
  %832 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %765) #11
  %833 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %766) #11
  %834 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %767) #11
  %835 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %769) #11
  %836 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %770) #11
  %837 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %771) #11
  %838 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %772) #11
  %839 = shl nsw i32 %822, 4
  %840 = sext i32 %839 to i64
  %841 = and i32 %88, 248
  %842 = zext nneg i32 %841 to i64
  %843 = or disjoint i64 %9, %842
  %.lobit3 = lshr i32 %10, 5
  %844 = and i32 %.lobit3, 3
  %845 = select i1 %820, i32 0, i32 4
  %846 = or disjoint i32 %844, %845
  %847 = or disjoint i32 %846, 8
  %848 = zext nneg i32 %846 to i64
  %849 = zext nneg i32 %847 to i64
  %850 = or disjoint i64 %840, %848
  %851 = or disjoint i64 %840, %849
  %852 = getelementptr bfloat, ptr addrspace(1) %arg1147, i64 %843
  %.idx = mul nsw i64 %850, 14336
  %853 = getelementptr i8, ptr addrspace(1) %852, i64 %.idx
  %.idx4 = mul nsw i64 %851, 14336
  %854 = getelementptr i8, ptr addrspace(1) %852, i64 %.idx4
  %855 = shl nuw nsw i32 %10, 9
  %856 = and i32 %855, 1536
  %857 = lshr i32 %10, 2
  %858 = and i32 %857, 7
  %859 = lshr i32 %10, 1
  %860 = and i32 %859, 48
  %861 = select i1 %820, i32 0, i32 64
  %862 = or disjoint i32 %860, %861
  %863 = or disjoint i32 %862, %858
  %864 = or disjoint i32 %863, %856
  %865 = and i32 %88, 1016
  %866 = or disjoint i32 %865, %129
  %867 = lshr exact i32 %856, 5
  %868 = add nuw nsw i32 %864, %867
  %869 = zext nneg i32 %868 to i64
  %870 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %869
  %871 = bitcast bfloat %823 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %870, <1 x i16> %871, i1 true) #11
  %872 = or disjoint i32 %864, 256
  %873 = lshr i32 %872, 5
  %874 = and i32 %873, 56
  %875 = zext nneg i32 %874 to i64
  %876 = zext nneg i32 %864 to i64
  %877 = add i64 %875, %876
  %878 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %877
  %879 = getelementptr inbounds i8, ptr addrspace(3) %878, i64 512
  %880 = bitcast bfloat %824 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %879, <1 x i16> %880, i1 true) #11
  %881 = zext nneg i32 %867 to i64
  %882 = add i64 %881, %876
  %883 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %882
  %884 = getelementptr inbounds i8, ptr addrspace(3) %883, i64 16
  %885 = bitcast bfloat %825 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %884, <1 x i16> %885, i1 true) #11
  %886 = or disjoint i32 %864, 264
  %887 = lshr i32 %886, 5
  %888 = and i32 %887, 56
  %889 = zext nneg i32 %888 to i64
  %890 = add i64 %889, %876
  %891 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %890
  %892 = getelementptr inbounds i8, ptr addrspace(3) %891, i64 528
  %893 = bitcast bfloat %826 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %892, <1 x i16> %893, i1 true) #11
  %894 = getelementptr inbounds i8, ptr addrspace(3) %883, i64 256
  %895 = bitcast bfloat %831 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %894, <1 x i16> %895, i1 true) #11
  %896 = or disjoint i32 %864, 384
  %897 = lshr i32 %896, 5
  %898 = and i32 %897, 56
  %899 = zext nneg i32 %898 to i64
  %900 = add i64 %899, %876
  %901 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %900
  %902 = getelementptr inbounds i8, ptr addrspace(3) %901, i64 768
  %903 = bitcast bfloat %832 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %902, <1 x i16> %903, i1 true) #11
  %904 = getelementptr inbounds i8, ptr addrspace(3) %883, i64 272
  %905 = bitcast bfloat %833 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %904, <1 x i16> %905, i1 true) #11
  %906 = or disjoint i32 %864, 392
  %907 = lshr i32 %906, 5
  %908 = and i32 %907, 56
  %909 = zext nneg i32 %908 to i64
  %910 = add i64 %909, %876
  %911 = getelementptr bfloat, ptr addrspace(3) @global_smem, i64 %910
  %912 = getelementptr inbounds i8, ptr addrspace(3) %911, i64 784
  %913 = bitcast bfloat %834 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %912, <1 x i16> %913, i1 true) #11
  tail call void @llvm.nvvm.barrier0()
  %914 = lshr i32 %866, 5
  %915 = and i32 %914, 56
  %916 = add nuw nsw i32 %915, %866
  %917 = zext nneg i32 %916 to i64
  %918 = getelementptr inbounds nuw bfloat, ptr addrspace(3) @global_smem, i64 %917
  %919 = load <4 x i32>, ptr addrspace(3) %918, align 16
  tail call void @llvm.nvvm.barrier0()
  %920 = bitcast bfloat %827 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) %870, <1 x i16> %920, i1 true) #11
  %921 = bitcast bfloat %828 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %879, <1 x i16> %921, i1 true) #11
  %922 = bitcast bfloat %829 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %884, <1 x i16> %922, i1 true) #11
  %923 = bitcast bfloat %830 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %892, <1 x i16> %923, i1 true) #11
  %924 = bitcast bfloat %835 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %894, <1 x i16> %924, i1 true) #11
  %925 = bitcast bfloat %836 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %902, <1 x i16> %925, i1 true) #11
  %926 = bitcast bfloat %837 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %904, <1 x i16> %926, i1 true) #11
  %927 = bitcast bfloat %838 to <1 x i16>
  tail call void asm sideeffect "@$2 st.shared.b16 [ $0 + 0 ], $1;", "r,h,b"(ptr addrspace(3) nonnull %912, <1 x i16> %927, i1 true) #11
  tail call void @llvm.nvvm.barrier0()
  %928 = load <4 x i32>, ptr addrspace(3) %918, align 16
  %.extract = extractelement <4 x i32> %919, i64 0
  %.extract29 = extractelement <4 x i32> %919, i64 1
  %.extract31 = extractelement <4 x i32> %919, i64 2
  %.extract33 = extractelement <4 x i32> %919, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract, i32 %.extract29, i32 %.extract31, i32 %.extract33, ptr addrspace(1) %853) #11
  %.extract35 = extractelement <4 x i32> %928, i64 0
  %.extract37 = extractelement <4 x i32> %928, i64 1
  %.extract39 = extractelement <4 x i32> %928, i64 2
  %.extract41 = extractelement <4 x i32> %928, i64 3
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %.extract35, i32 %.extract37, i32 %.extract39, i32 %.extract41, ptr addrspace(1) %854) #11
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #5

define ptx_kernel void @fusion_103(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(229376) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) local_unnamed_addr #6 {
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
  %6 = mul i64 %3, 7168
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
  %53 = getelementptr i8, ptr addrspace(1) %52, i64 12288
  %54 = shl nuw nsw i32 %9, 3
  %55 = and i32 %54, 248
  %56 = select i1 %14, i32 0, i32 256
  %57 = or disjoint i32 %55, %56
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr bfloat, ptr addrspace(1) %52, i64 %58
  %60 = getelementptr i8, ptr addrspace(1) %59, i64 12288
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
define ptx_kernel void @loop_convert_fusion_6(ptr noalias readonly align 128 captures(none) dereferenceable(196608) %0, ptr noalias writeonly align 128 captures(none) dereferenceable(98304) %1) local_unnamed_addr #0 {
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

define ptx_kernel void @fusion_101(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(229376) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
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
  %6 = mul i64 %3, 7168
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
  %19 = getelementptr i8, ptr addrspace(1) %18, i64 10240
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
  %48 = getelementptr i8, ptr addrspace(1) %18, i64 12288
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
  %90 = getelementptr i8, ptr addrspace(1) %89, i64 10240
  %91 = shl nuw nsw i32 %9, 3
  %92 = and i32 %91, 248
  %93 = select i1 %14, i32 0, i32 256
  %94 = or disjoint i32 %92, %93
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr bfloat, ptr addrspace(1) %89, i64 %95
  %97 = getelementptr i8, ptr addrspace(1) %96, i64 10240
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
  %204 = getelementptr i8, ptr addrspace(1) %89, i64 12288
  %205 = getelementptr i8, ptr addrspace(1) %96, i64 12288
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

define ptx_kernel void @fusion_99(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(229376) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 14336
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #11
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #11
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #11
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #11
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #11
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #11
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #11
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #11
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #11
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #11
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #11
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #11
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #11
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #11
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #11
  %176 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #11
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #11
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #11
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #11
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #11
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #11
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 12288
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 12288
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #11
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #11
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #11
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #11
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #11
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #11
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #11
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #11
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #11
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #11
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #11
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #11
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #11
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #11
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #11
  %283 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #11
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #11
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #11
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #11
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #11
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #11
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #11
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #11
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #11
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #11
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #11
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #11
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #11
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #11
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #11
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #11
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #11
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %469, <1 x i32> %470, i1 %467) #11
  tail call void @llvm.nvvm.barrier0()
  %471 = icmp samesign ult i32 %5, 2
  %472 = zext nneg i32 %5 to i64
  %473 = getelementptr float, ptr addrspace(3) @global_smem, i64 %472
  %474 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %473, i1 %471) #11
  %475 = bitcast i32 %474 to float
  %476 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %474, i32 1, i32 31)
  %477 = bitcast i32 %476 to float
  %478 = fadd float %475, %477
  %479 = icmp eq i32 %5, 0
  %480 = bitcast float %478 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %473, <1 x i32> %480, i1 %479) #11
  tail call void @llvm.nvvm.barrier0()
  %481 = load float, ptr addrspace(3) @global_smem, align 16
  %482 = fmul float %481, 0x3F50000000000000
  %483 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %505 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %503) #11
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
  %522 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %504) #11
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
  %539 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %514) #11
  %540 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #11
  %541 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #11
  %542 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #11
  %543 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #11
  %544 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #11
  %545 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #11
  %546 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #11
  %547 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %531) #11
  %548 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %532) #11
  %549 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %533) #11
  %550 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %534) #11
  %551 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %535) #11
  %552 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %536) #11
  %553 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %537) #11
  %554 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %538) #11
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
  %571 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %555) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %592, i32 %595, i32 %598, i32 %601, ptr addrspace(1) %588) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %604, i32 %607, i32 %610, i32 %613, ptr addrspace(1) %589) #11
  ret void
}

define ptx_kernel void @fusion_97(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(229376) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 14336
  %3 = getelementptr i8, ptr addrspace(1) %arg37, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #11
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #11
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #11
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #11
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg25, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #11
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #11
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #11
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #11
  %122 = getelementptr i8, ptr addrspace(1) %3, i64 8192
  %123 = getelementptr i8, ptr addrspace(1) %14, i64 8192
  %124 = getelementptr bfloat, ptr addrspace(1) %122, i64 %13
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 1024
  %126 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #11
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
  %143 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #11
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
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #11
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %139) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %140) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %141) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %142) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %156) #11
  %173 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %157) #11
  %174 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %158) #11
  %175 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %159) #11
  %176 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %68
  %177 = getelementptr bfloat, ptr addrspace(1) %176, i64 %13
  %178 = getelementptr i8, ptr addrspace(1) %177, i64 1024
  %179 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %177) #11
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
  %196 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %178) #11
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
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #11
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %193) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %194) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %195) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %210) #11
  %227 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %211) #11
  %228 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %212) #11
  %229 = getelementptr i8, ptr addrspace(1) %3, i64 10240
  %230 = getelementptr i8, ptr addrspace(1) %14, i64 10240
  %231 = getelementptr bfloat, ptr addrspace(1) %229, i64 %13
  %232 = getelementptr i8, ptr addrspace(1) %231, i64 1024
  %233 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #11
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
  %250 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %232) #11
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
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #11
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %246) #11
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %247) #11
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %248) #11
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %249) #11
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #11
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #11
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #11
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #11
  %279 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %263) #11
  %280 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %264) #11
  %281 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %265) #11
  %282 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %266) #11
  %283 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %68
  %284 = getelementptr bfloat, ptr addrspace(1) %283, i64 %13
  %285 = getelementptr i8, ptr addrspace(1) %284, i64 1024
  %286 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %284) #11
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
  %303 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %285) #11
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
  %320 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %295) #11
  %321 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %296) #11
  %322 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %297) #11
  %323 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %298) #11
  %324 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %299) #11
  %325 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %300) #11
  %326 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %301) #11
  %327 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %302) #11
  %328 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %312) #11
  %329 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %313) #11
  %330 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %314) #11
  %331 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %315) #11
  %332 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %316) #11
  %333 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %317) #11
  %334 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %318) #11
  %335 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %319) #11
  %336 = getelementptr i8, ptr addrspace(1) %3, i64 12288
  %337 = getelementptr i8, ptr addrspace(1) %14, i64 12288
  %338 = getelementptr bfloat, ptr addrspace(1) %336, i64 %13
  %339 = getelementptr i8, ptr addrspace(1) %338, i64 1024
  %340 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %337) #11
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
  %357 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %339) #11
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
  %374 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %349) #11
  %375 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %350) #11
  %376 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %351) #11
  %377 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %352) #11
  %378 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %353) #11
  %379 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %354) #11
  %380 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %355) #11
  %381 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %356) #11
  %382 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %366) #11
  %383 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %367) #11
  %384 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %368) #11
  %385 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %369) #11
  %386 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %370) #11
  %387 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %371) #11
  %388 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %372) #11
  %389 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %373) #11
  %390 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %68
  %391 = getelementptr bfloat, ptr addrspace(1) %390, i64 %13
  %392 = getelementptr i8, ptr addrspace(1) %391, i64 1024
  %393 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %391) #11
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
  %410 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %392) #11
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
  %427 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %402) #11
  %428 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %403) #11
  %429 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %404) #11
  %430 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %405) #11
  %431 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %406) #11
  %432 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %407) #11
  %433 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %408) #11
  %434 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %409) #11
  %435 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %419) #11
  %436 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %420) #11
  %437 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %421) #11
  %438 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %422) #11
  %439 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %423) #11
  %440 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %424) #11
  %441 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %425) #11
  %442 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %426) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %608, <1 x i32> %609, i1 %606) #11
  tail call void @llvm.nvvm.barrier0()
  %610 = icmp samesign ult i32 %5, 2
  %611 = zext nneg i32 %5 to i64
  %612 = getelementptr float, ptr addrspace(3) @global_smem, i64 %611
  %613 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %612, i1 %610) #11
  %614 = bitcast i32 %613 to float
  %615 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %613, i32 1, i32 31)
  %616 = bitcast i32 %615 to float
  %617 = fadd float %614, %616
  %618 = icmp eq i32 %5, 0
  %619 = bitcast float %617 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %612, <1 x i32> %619, i1 %618) #11
  tail call void @llvm.nvvm.barrier0()
  %620 = load float, ptr addrspace(3) @global_smem, align 16
  %621 = fmul float %620, 0x3F50000000000000
  %622 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %644 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %642) #11
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
  %661 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %643) #11
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
  %678 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %653) #11
  %679 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %654) #11
  %680 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %655) #11
  %681 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %656) #11
  %682 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %657) #11
  %683 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %658) #11
  %684 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %659) #11
  %685 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %660) #11
  %686 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %670) #11
  %687 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %671) #11
  %688 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %672) #11
  %689 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %673) #11
  %690 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %674) #11
  %691 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %675) #11
  %692 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %676) #11
  %693 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %677) #11
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
  %710 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %694) #11
  %711 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %695) #11
  %712 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %696) #11
  %713 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %697) #11
  %714 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %698) #11
  %715 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %699) #11
  %716 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %700) #11
  %717 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %701) #11
  %718 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %702) #11
  %719 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %703) #11
  %720 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %704) #11
  %721 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %705) #11
  %722 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %706) #11
  %723 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %707) #11
  %724 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %708) #11
  %725 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %709) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %731, i32 %734, i32 %737, i32 %740, ptr addrspace(1) %727) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %743, i32 %746, i32 %749, i32 %752, ptr addrspace(1) %728) #11
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias readonly align 128 captures(none) dereferenceable(229376) %0, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %1, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %2, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %3, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %4, ptr noalias readonly align 128 captures(none) dereferenceable(32768) %5, ptr noalias writeonly align 128 captures(none) dereferenceable(65536) %6) local_unnamed_addr #0 {
  %8 = addrspacecast ptr %6 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = addrspacecast ptr %3 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %1 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %17 = lshr i32 %16, 3
  %18 = shl nuw nsw i32 %16, 7
  %19 = and i32 %18, 896
  %20 = or disjoint i32 %19, %15
  %21 = or disjoint i32 %18, %15
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds bfloat, ptr addrspace(1) %11, i64 %22
  %24 = load bfloat, ptr addrspace(1) %23, align 2, !invariant.load !5
  %25 = getelementptr inbounds bfloat, ptr addrspace(1) %10, i64 %22
  %26 = load bfloat, ptr addrspace(1) %25, align 2, !invariant.load !5
  %27 = mul nuw nsw i32 %17, 7168
  %28 = zext nneg i32 %20 to i64
  %29 = zext nneg i32 %27 to i64
  %30 = add i64 %29, %28
  %31 = getelementptr bfloat, ptr addrspace(1) %14, i64 %30
  %32 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 12288
  %33 = load bfloat, ptr addrspace(1) %32, align 2, !invariant.load !5, !alias.scope !14
  %34 = fpext bfloat %33 to float
  %35 = fpext bfloat %24 to float
  %36 = fpext bfloat %26 to float
  %37 = fadd float %35, %34
  %38 = getelementptr inbounds bfloat, ptr addrspace(1) %9, i64 %22
  %39 = load bfloat, ptr addrspace(1) %38, align 2, !invariant.load !5
  %40 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 10240
  %41 = load bfloat, ptr addrspace(1) %40, align 2, !invariant.load !5, !alias.scope !17
  %42 = fpext bfloat %41 to float
  %43 = fadd float %37, %36
  %44 = fpext bfloat %39 to float
  %45 = fadd float %43, %42
  %46 = getelementptr inbounds bfloat, ptr addrspace(1) %12, i64 %22
  %47 = load bfloat, ptr addrspace(1) %46, align 2, !invariant.load !5
  %48 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 8192
  %49 = load bfloat, ptr addrspace(1) %48, align 2, !invariant.load !5, !alias.scope !20
  %50 = fpext bfloat %49 to float
  %51 = fadd float %45, %44
  %52 = fpext bfloat %47 to float
  %53 = fadd float %51, %50
  %54 = getelementptr inbounds bfloat, ptr addrspace(1) %13, i64 %22
  %55 = load bfloat, ptr addrspace(1) %54, align 2, !invariant.load !5
  %56 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 6144
  %57 = load bfloat, ptr addrspace(1) %56, align 2, !invariant.load !5, !alias.scope !23
  %58 = fpext bfloat %57 to float
  %59 = fadd float %53, %52
  %60 = fpext bfloat %55 to float
  %61 = fadd float %59, %58
  %62 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 4096
  %63 = load bfloat, ptr addrspace(1) %62, align 2, !invariant.load !5, !alias.scope !26
  %64 = fpext bfloat %63 to float
  %65 = fadd float %61, %60
  %66 = fadd float %65, %64
  %67 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %22
  store float %66, ptr addrspace(1) %67, align 4
  ret void
}

define ptx_kernel void @fusion_95(ptr noalias align 128 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) local_unnamed_addr #6 {
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

define ptx_kernel void @fusion_93(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(229376) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) local_unnamed_addr #6 {
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 14336
  %3 = getelementptr i8, ptr addrspace(1) %arg49, i64 %.idx
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
  %18 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %15) #11
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
  %35 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %17) #11
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
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %32) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %33) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %34) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %49) #11
  %66 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %50) #11
  %67 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %51) #11
  %68 = shl nsw i64 %2, 10
  %69 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %68
  %70 = getelementptr bfloat, ptr addrspace(1) %69, i64 %13
  %71 = getelementptr i8, ptr addrspace(1) %70, i64 1024
  %72 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %70) #11
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
  %89 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %71) #11
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
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %86) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %87) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %88) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %103) #11
  %120 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %104) #11
  %121 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %105) #11
  %122 = getelementptr float, ptr addrspace(1) %arg25, i64 %68
  %123 = getelementptr float, ptr addrspace(1) %122, i64 %13
  %124 = getelementptr i8, ptr addrspace(1) %123, i64 16
  %125 = getelementptr i8, ptr addrspace(1) %123, i64 2048
  %126 = getelementptr i8, ptr addrspace(1) %123, i64 2064
  %127 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %123) #11
  %128 = extractvalue { i32, i32, i32, i32 } %127, 0
  %129 = extractvalue { i32, i32, i32, i32 } %127, 1
  %130 = extractvalue { i32, i32, i32, i32 } %127, 2
  %131 = extractvalue { i32, i32, i32, i32 } %127, 3
  %132 = bitcast i32 %128 to float
  %133 = bitcast i32 %129 to float
  %134 = bitcast i32 %130 to float
  %135 = bitcast i32 %131 to float
  %136 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %124) #11
  %137 = extractvalue { i32, i32, i32, i32 } %136, 0
  %138 = extractvalue { i32, i32, i32, i32 } %136, 1
  %139 = extractvalue { i32, i32, i32, i32 } %136, 2
  %140 = extractvalue { i32, i32, i32, i32 } %136, 3
  %141 = bitcast i32 %137 to float
  %142 = bitcast i32 %138 to float
  %143 = bitcast i32 %139 to float
  %144 = bitcast i32 %140 to float
  %145 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %125) #11
  %146 = extractvalue { i32, i32, i32, i32 } %145, 0
  %147 = extractvalue { i32, i32, i32, i32 } %145, 1
  %148 = extractvalue { i32, i32, i32, i32 } %145, 2
  %149 = extractvalue { i32, i32, i32, i32 } %145, 3
  %150 = bitcast i32 %146 to float
  %151 = bitcast i32 %147 to float
  %152 = bitcast i32 %148 to float
  %153 = bitcast i32 %149 to float
  %154 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %126) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %248, <1 x i32> %249, i1 %246) #11
  tail call void @llvm.nvvm.barrier0()
  %250 = icmp samesign ult i32 %5, 2
  %251 = zext nneg i32 %5 to i64
  %252 = getelementptr float, ptr addrspace(3) @global_smem, i64 %251
  %253 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %252, i1 %250) #11
  %254 = bitcast i32 %253 to float
  %255 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %253, i32 1, i32 31)
  %256 = bitcast i32 %255 to float
  %257 = fadd float %254, %256
  %258 = icmp eq i32 %5, 0
  %259 = bitcast float %257 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %252, <1 x i32> %259, i1 %258) #11
  tail call void @llvm.nvvm.barrier0()
  %260 = load float, ptr addrspace(3) @global_smem, align 16
  %261 = fmul float %260, 0x3F50000000000000
  %262 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %350 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %334) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %371, i32 %374, i32 %377, i32 %380, ptr addrspace(1) %367) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %383, i32 %386, i32 %389, i32 %392, ptr addrspace(1) %368) #11
  ret void
}

define ptx_kernel void @fusion_91(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(229376) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6) local_unnamed_addr #6 {
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = tail call i32 asm "mov.u32 $0, %ctaid.x;", "=r"() #11
  %2 = sext i32 %1 to i64
  %.idx = mul nsw i64 %2, 14336
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
  %15 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %13) #11
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
  %32 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %14) #11
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
  %49 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %24) #11
  %50 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %25) #11
  %51 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %26) #11
  %52 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %27) #11
  %53 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %28) #11
  %54 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %29) #11
  %55 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %30) #11
  %56 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %31) #11
  %57 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %41) #11
  %58 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %42) #11
  %59 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %43) #11
  %60 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %44) #11
  %61 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %45) #11
  %62 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %46) #11
  %63 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %47) #11
  %64 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %48) #11
  %65 = shl nsw i64 %2, 10
  %66 = getelementptr bfloat, ptr addrspace(1) %arg511, i64 %65
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %12
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #11
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #11
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #11
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #11
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #11
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = getelementptr i8, ptr addrspace(1) %3, i64 2048
  %120 = getelementptr i8, ptr addrspace(1) %13, i64 2048
  %121 = getelementptr bfloat, ptr addrspace(1) %119, i64 %12
  %122 = getelementptr i8, ptr addrspace(1) %121, i64 1024
  %123 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #11
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
  %173 = getelementptr bfloat, ptr addrspace(1) %arg37, i64 %65
  %174 = getelementptr bfloat, ptr addrspace(1) %173, i64 %12
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %174) #11
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
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #11
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
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #11
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #11
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #11
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #11
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = getelementptr float, ptr addrspace(1) %arg25, i64 %65
  %227 = getelementptr float, ptr addrspace(1) %226, i64 %12
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 16
  %229 = getelementptr i8, ptr addrspace(1) %227, i64 2048
  %230 = getelementptr i8, ptr addrspace(1) %227, i64 2064
  %231 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #11
  %232 = extractvalue { i32, i32, i32, i32 } %231, 0
  %233 = extractvalue { i32, i32, i32, i32 } %231, 1
  %234 = extractvalue { i32, i32, i32, i32 } %231, 2
  %235 = extractvalue { i32, i32, i32, i32 } %231, 3
  %236 = bitcast i32 %232 to float
  %237 = bitcast i32 %233 to float
  %238 = bitcast i32 %234 to float
  %239 = bitcast i32 %235 to float
  %240 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #11
  %241 = extractvalue { i32, i32, i32, i32 } %240, 0
  %242 = extractvalue { i32, i32, i32, i32 } %240, 1
  %243 = extractvalue { i32, i32, i32, i32 } %240, 2
  %244 = extractvalue { i32, i32, i32, i32 } %240, 3
  %245 = bitcast i32 %241 to float
  %246 = bitcast i32 %242 to float
  %247 = bitcast i32 %243 to float
  %248 = bitcast i32 %244 to float
  %249 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %229) #11
  %250 = extractvalue { i32, i32, i32, i32 } %249, 0
  %251 = extractvalue { i32, i32, i32, i32 } %249, 1
  %252 = extractvalue { i32, i32, i32, i32 } %249, 2
  %253 = extractvalue { i32, i32, i32, i32 } %249, 3
  %254 = bitcast i32 %250 to float
  %255 = bitcast i32 %251 to float
  %256 = bitcast i32 %252 to float
  %257 = bitcast i32 %253 to float
  %258 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %230) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %384, <1 x i32> %385, i1 %382) #11
  tail call void @llvm.nvvm.barrier0()
  %386 = icmp samesign ult i32 %4, 2
  %387 = zext nneg i32 %4 to i64
  %388 = getelementptr float, ptr addrspace(3) @global_smem, i64 %387
  %389 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %388, i1 %386) #11
  %390 = bitcast i32 %389 to float
  %391 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %389, i32 1, i32 31)
  %392 = bitcast i32 %391 to float
  %393 = fadd float %390, %392
  %394 = icmp eq i32 %4, 0
  %395 = bitcast float %393 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %388, <1 x i32> %395, i1 %394) #11
  tail call void @llvm.nvvm.barrier0()
  %396 = load float, ptr addrspace(3) @global_smem, align 16
  %397 = fmul float %396, 0x3F50000000000000
  %398 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %420 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %418) #11
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
  %437 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %419) #11
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
  %454 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %429) #11
  %455 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %430) #11
  %456 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %431) #11
  %457 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %432) #11
  %458 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %433) #11
  %459 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %434) #11
  %460 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %435) #11
  %461 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %436) #11
  %462 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %446) #11
  %463 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %447) #11
  %464 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %448) #11
  %465 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %449) #11
  %466 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %450) #11
  %467 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %451) #11
  %468 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %452) #11
  %469 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %453) #11
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
  %486 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %470) #11
  %487 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %471) #11
  %488 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %472) #11
  %489 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %473) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %507, i32 %510, i32 %513, i32 %516, ptr addrspace(1) %503) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %519, i32 %522, i32 %525, i32 %528, ptr addrspace(1) %504) #11
  ret void
}

define ptx_kernel void @fusion_89(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(229376) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) local_unnamed_addr #6 {
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
  %.idx = mul nsw i64 %2, 14336
  %66 = getelementptr i8, ptr addrspace(1) %arg511, i64 %.idx
  %67 = getelementptr bfloat, ptr addrspace(1) %66, i64 %13
  %68 = getelementptr i8, ptr addrspace(1) %67, i64 1024
  %69 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %67) #11
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
  %86 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %68) #11
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
  %103 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %78) #11
  %104 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %79) #11
  %105 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %80) #11
  %106 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %81) #11
  %107 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %82) #11
  %108 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %83) #11
  %109 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %84) #11
  %110 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %85) #11
  %111 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %95) #11
  %112 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %96) #11
  %113 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %97) #11
  %114 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %98) #11
  %115 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %99) #11
  %116 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %100) #11
  %117 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %101) #11
  %118 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %102) #11
  %119 = getelementptr bfloat, ptr addrspace(1) %arg613, i64 %3
  %120 = getelementptr bfloat, ptr addrspace(1) %119, i64 %13
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 1024
  %122 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %120) #11
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
  %139 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %121) #11
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
  %156 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %131) #11
  %157 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %132) #11
  %158 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %133) #11
  %159 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %134) #11
  %160 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %135) #11
  %161 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %136) #11
  %162 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %137) #11
  %163 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %138) #11
  %164 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %148) #11
  %165 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %149) #11
  %166 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %150) #11
  %167 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %151) #11
  %168 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %152) #11
  %169 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %153) #11
  %170 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %154) #11
  %171 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %155) #11
  %172 = getelementptr i8, ptr addrspace(1) %66, i64 2048
  %173 = getelementptr i8, ptr addrspace(1) %67, i64 2048
  %174 = getelementptr bfloat, ptr addrspace(1) %172, i64 %13
  %175 = getelementptr i8, ptr addrspace(1) %174, i64 1024
  %176 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %173) #11
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
  %193 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %175) #11
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
  %210 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %185) #11
  %211 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %186) #11
  %212 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %187) #11
  %213 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %188) #11
  %214 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %189) #11
  %215 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %190) #11
  %216 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %191) #11
  %217 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %192) #11
  %218 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %202) #11
  %219 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %203) #11
  %220 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %204) #11
  %221 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %205) #11
  %222 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %206) #11
  %223 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %207) #11
  %224 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %208) #11
  %225 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %209) #11
  %226 = getelementptr bfloat, ptr addrspace(1) %arg49, i64 %3
  %227 = getelementptr bfloat, ptr addrspace(1) %226, i64 %13
  %228 = getelementptr i8, ptr addrspace(1) %227, i64 1024
  %229 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %227) #11
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
  %246 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %228) #11
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
  %263 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %238) #11
  %264 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %239) #11
  %265 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %240) #11
  %266 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %241) #11
  %267 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %242) #11
  %268 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %243) #11
  %269 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %244) #11
  %270 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %245) #11
  %271 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %255) #11
  %272 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %256) #11
  %273 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %257) #11
  %274 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %258) #11
  %275 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %259) #11
  %276 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %260) #11
  %277 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %261) #11
  %278 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %262) #11
  %279 = getelementptr float, ptr addrspace(1) %arg37, i64 %3
  %280 = getelementptr float, ptr addrspace(1) %279, i64 %13
  %281 = getelementptr i8, ptr addrspace(1) %280, i64 16
  %282 = getelementptr i8, ptr addrspace(1) %280, i64 2048
  %283 = getelementptr i8, ptr addrspace(1) %280, i64 2064
  %284 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %280) #11
  %285 = extractvalue { i32, i32, i32, i32 } %284, 0
  %286 = extractvalue { i32, i32, i32, i32 } %284, 1
  %287 = extractvalue { i32, i32, i32, i32 } %284, 2
  %288 = extractvalue { i32, i32, i32, i32 } %284, 3
  %289 = bitcast i32 %285 to float
  %290 = bitcast i32 %286 to float
  %291 = bitcast i32 %287 to float
  %292 = bitcast i32 %288 to float
  %293 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %281) #11
  %294 = extractvalue { i32, i32, i32, i32 } %293, 0
  %295 = extractvalue { i32, i32, i32, i32 } %293, 1
  %296 = extractvalue { i32, i32, i32, i32 } %293, 2
  %297 = extractvalue { i32, i32, i32, i32 } %293, 3
  %298 = bitcast i32 %294 to float
  %299 = bitcast i32 %295 to float
  %300 = bitcast i32 %296 to float
  %301 = bitcast i32 %297 to float
  %302 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %282) #11
  %303 = extractvalue { i32, i32, i32, i32 } %302, 0
  %304 = extractvalue { i32, i32, i32, i32 } %302, 1
  %305 = extractvalue { i32, i32, i32, i32 } %302, 2
  %306 = extractvalue { i32, i32, i32, i32 } %302, 3
  %307 = bitcast i32 %303 to float
  %308 = bitcast i32 %304 to float
  %309 = bitcast i32 %305 to float
  %310 = bitcast i32 %306 to float
  %311 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %283) #11
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
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %453, <1 x i32> %454, i1 %451) #11
  tail call void @llvm.nvvm.barrier0()
  %455 = icmp samesign ult i32 %5, 2
  %456 = zext nneg i32 %5 to i64
  %457 = getelementptr float, ptr addrspace(3) @global_smem, i64 %456
  %458 = tail call i32 asm sideeffect "@$2 ld.shared.b32 $0, [ $1 + 0 ];", "=r,r,b"(ptr addrspace(3) %457, i1 %455) #11
  %459 = bitcast i32 %458 to float
  %460 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %458, i32 1, i32 31)
  %461 = bitcast i32 %460 to float
  %462 = fadd float %459, %461
  %463 = icmp eq i32 %5, 0
  %464 = bitcast float %462 to <1 x i32>
  tail call void asm sideeffect "@$2 st.shared.b32 [ $0 + 0 ], $1;", "r,r,b"(ptr addrspace(3) %457, <1 x i32> %464, i1 %463) #11
  tail call void @llvm.nvvm.barrier0()
  %465 = load float, ptr addrspace(3) @global_smem, align 16
  %466 = fmul float %465, 0x3F50000000000000
  %467 = tail call i32 asm sideeffect "mov.u32 $0, 0x0;\0A\09ld.global.b32 { $0 }, [ $1 + 0 ];", "=r,l"(ptr addrspace(1) %arg01) #11
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
  %489 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %487) #11
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
  %506 = tail call { i32, i32, i32, i32 } asm sideeffect "mov.u32 $0, 0x0;\0A\09mov.u32 $1, 0x0;\0A\09mov.u32 $2, 0x0;\0A\09mov.u32 $3, 0x0;\0A\09ld.global.v4.b32 { $0, $1, $2, $3 }, [ $4 + 0 ];", "=r,=r,=r,=r,l"(ptr addrspace(1) %488) #11
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
  %523 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %498) #11
  %524 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %499) #11
  %525 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %500) #11
  %526 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %501) #11
  %527 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %502) #11
  %528 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %503) #11
  %529 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %504) #11
  %530 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %505) #11
  %531 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %515) #11
  %532 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %516) #11
  %533 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %517) #11
  %534 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %518) #11
  %535 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %519) #11
  %536 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %520) #11
  %537 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %521) #11
  %538 = tail call float asm "cvt.f32.bf16 $0, $1;", "=r,h"(bfloat %522) #11
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
  %555 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %539) #11
  %556 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %540) #11
  %557 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %541) #11
  %558 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %542) #11
  %559 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %543) #11
  %560 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %544) #11
  %561 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %545) #11
  %562 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %546) #11
  %563 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %547) #11
  %564 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %548) #11
  %565 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %549) #11
  %566 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %550) #11
  %567 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %551) #11
  %568 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %552) #11
  %569 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %553) #11
  %570 = tail call bfloat asm "cvt.rn.bf16.f32 $0, $1;", "=h,r"(float %554) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %576, i32 %579, i32 %582, i32 %585, ptr addrspace(1) %572) #11
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
  tail call void asm sideeffect "st.global.v4.b32 [ $4 + 0 ], { $0, $1, $2, $3 };", "r,r,r,r,l"(i32 %588, i32 %591, i32 %594, i32 %597, ptr addrspace(1) %573) #11
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

define ptx_kernel void @triton_softmax_9_0(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2) local_unnamed_addr #7 {
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
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !29
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
  tail call void @llvm.experimental.noalias.scope.decl(metadata !30)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !33)
  %28 = zext nneg i32 %13 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !5, !alias.scope !33, !noalias !30
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 40959)
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = shl nuw nsw i32 %32, 7
  %34 = or disjoint i32 %33, %14
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds bfloat, ptr addrspace(1) %8, i64 %35
  %37 = load bfloat, ptr addrspace(1) %36, align 2, !invariant.load !5, !alias.scope !30, !noalias !33
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
  %51 = load bfloat, ptr addrspace(1) %50, align 2, !invariant.load !5, !alias.scope !35, !noalias !38
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
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
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
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
attributes #4 = { "nvvm.reqntid"="256,1,1" }
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
!6 = !{i32 0, i32 28672}
!7 = !{i32 0, i32 384}
!8 = !{!9}
!9 = distinct !{!9, !10, !"fused_convert_6_param_0_202: argument 0"}
!10 = distinct !{!10, !"fused_convert_6_param_0_202"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"fused_convert_6_param_0_202: argument 0"}
!13 = distinct !{!13, !"fused_convert_6_param_0_202"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"fused_add_convert_387_17: argument 0"}
!16 = distinct !{!16, !"fused_add_convert_387_17"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"fused_add_convert_387_17: argument 0"}
!19 = distinct !{!19, !"fused_add_convert_387_17"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"fused_add_convert_387_17: argument 0"}
!22 = distinct !{!22, !"fused_add_convert_387_17"}
!23 = !{!24}
!24 = distinct !{!24, !25, !"fused_add_convert_387_17: argument 0"}
!25 = distinct !{!25, !"fused_add_convert_387_17"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"fused_add_convert_387_17: argument 0"}
!28 = distinct !{!28, !"fused_add_convert_387_17"}
!29 = !{i32 0, i32 64}
!30 = !{!31}
!31 = distinct !{!31, !32, !"fused_concatenate_convert_493_17: argument 0"}
!32 = distinct !{!32, !"fused_concatenate_convert_493_17"}
!33 = !{!34}
!34 = distinct !{!34, !32, !"fused_concatenate_convert_493_17: argument 1"}
!35 = !{!36}
!36 = distinct !{!36, !37, !"fused_concatenate_convert_493_17: argument 0"}
!37 = distinct !{!37, !"fused_concatenate_convert_493_17"}
!38 = !{!39}
!39 = distinct !{!39, !37, !"fused_concatenate_convert_493_17: argument 1"}
!40 = !{i32 0, i32 135456}
